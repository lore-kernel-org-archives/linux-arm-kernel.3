Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1205BC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNEnQU0pyTN9ytzfEL7xzUn8SaDvuW5mh+YI69rPvmk=; b=xCsP1ggmb0+im2PZQt1vUzp+VV
	qIjU0hVxVnV9UWmTA6Jq5Y/JCfwK/LBGGrNG7wfLT38XX7zc80W4yNSUdrzrNhmXUHSs+vmswsjso
	yDoe1Tdge+tj0dj+7de3ncomuJGh0WZ3v6t4G21lcruLqo6a1905nFkDke5RYXZIkBftWJGMiC6+W
	AoE7xJ0Cleip7/sugR1gv4khkSIi7V42TKEJsHcl1wHELjzKScsx8GbnVrjoxesieXRNdZzhxvSxW
	yEDvvg/7Jo1e9O9EYB2cQ0V8ovyQB2t/KQH+97ERIJZgijegM8zz4PRLU/EQ1EBwU0pdVr8XegVbI
	WMSqdRVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjZh-00000007IKa-3Njk;
	Wed, 05 Mar 2025 07:53:53 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjNk-00000007GPS-2syq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:41:34 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741160489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNEnQU0pyTN9ytzfEL7xzUn8SaDvuW5mh+YI69rPvmk=;
	b=wRnvota9OxP8xA8c4n68M1q9AT72rhK/58Yok3x+y85pGa908DBegMj2nJxQ4kSVyF2cHo
	AmndPcaKCUpf+7+Dn+lo9cNEP0OrCllnvnyZUnHrJd0Xhy6Q/5BrdAAym6nLTQZX23ZjnG
	2GfGhKPvGx9zk4Dse2MnbeRCZiBWTjSaZQKHlv47mB9C37HW3T7Nm/Q6TEtrE3uROhP/fp
	rnkmTqt9RA+hDyX2j6IDddORmoiLKjiVL3sR0m+xsIxJTBM1aVehJQWI3Qr0gAM9JE1ncA
	eocvkWisPEJHF5sLZABO7ANGW3NTry92s6WKaa4aiBZ+5ZqI8MlljbrDlbxyOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741160489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNEnQU0pyTN9ytzfEL7xzUn8SaDvuW5mh+YI69rPvmk=;
	b=O5/sYCjs8JjfUP5tkNS7SuXKdmW5bHio0KtEOf/d0fiKUUfJ8mrn4p7DZ76aeZYncwG0E+
	PhcVVpXm90lX9rDg==
To: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/15] irqchip/sunxi-nmi: Support Allwinner A523 NMI
 controller
In-Reply-To: <20250304222309.29385-7-andre.przywara@arm.com>
References: <20250304222309.29385-1-andre.przywara@arm.com>
 <20250304222309.29385-7-andre.przywara@arm.com>
Date: Wed, 05 Mar 2025 08:41:28 +0100
Message-ID: <87frjr6i1j.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_234132_865103_860AC697 
X-CRM114-Status: GOOD (  10.38  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 04 2025 at 22:23, Andre Przywara wrote:
>  
> -struct sunxi_sc_nmi_reg_offs {
> +struct sunxi_sc_nmi_data {
>  	u32 ctrl;
>  	u32 pend;
>  	u32 enable;
> +	u32 enable_val;

The data structure name and the corresponding variable/argument name
were making the code pretty obvious, but now this is opaque and
incomprehensible.

data::ctrl does not even give the slightest hint what this is about. You
need to read up in the code to figure out what it means. Something like:

struct sunxi_sc_nmi_data {
	u32	reg_offs_ctrl;
  	u32	reg_offs_pend;
  	u32	reg_offs_enable;
	u32	enable_val;
};

or even better:

struct sunxi_sc_nmi_data {
	struct {
		u32	ctrl;
  		u32	pend;
  		u32	enable;
        } reg_offs;
	u32		enable_val;
};

makes it clear and obvious, no?

> +static const struct sunxi_sc_nmi_data sun55i_a523_data __initconst = {
> +	.ctrl	= SUN9I_NMI_CTRL,
> +	.pend	= SUN9I_NMI_PENDING,
> +	.enable	= SUN9I_NMI_ENABLE,
> +	.enable_val = BIT(31),

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

Thanks,

        tglx

