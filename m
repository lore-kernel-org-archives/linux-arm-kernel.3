Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BB8CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 07:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZ0Ulce0kaM8VNdePBdckrICFLg2CqjgRYS+JAgj81c=; b=szuOKQm2qwZLAF/LmJ5OYDzewh
	oWhyl4B6s7HXpSVV96Uy6vedo/UXNq/7KY0XeOwSkz5DIimf/bL24l0KsVC2TfYfNx5vxleE6FeYz
	ngufg6FTwTq+VlHbRO53Ss2kMciZJ0KTh/lERB/3D7uNLERnMBsZCrSfQamr1LatveqoSQpotlNb5
	Fg3UE2jbHvP3lkLb1oqt7YprM+bqQRKoM2mWr2cw3F36Hv6VKgaoNHptn7mcZlNiPSgO7JpbAeIPC
	vnnV7sltCsnWqoWr9zS4O7wd59Kgr7GVv1PhQIFkyj0/3/kY0uH2HkXx4uKtdQiyyH4wyt+KNwV36
	9RUtEg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQoV-0000000Haq2-26Av;
	Fri, 05 Sep 2025 07:24:51 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuPpj-0000000HFpf-32cA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 06:22:04 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5856LxN33648440;
	Fri, 5 Sep 2025 01:21:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757053320;
	bh=MZ0Ulce0kaM8VNdePBdckrICFLg2CqjgRYS+JAgj81c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gvGkw8UR3+5qalvJHjmNi/k3xYSo1sfPmw6LcNjQQIGHB0aExCvNiprbnpsQWzMEt
	 G6gi4JbLemQVc1RHX5VGCbtF5frreJj6WOaAX9h8X8C330GH8HgKEXKn/Ml1JP/ix1
	 4ijgIAVMetSiGKHFfc3jp1VJFQ14ebMRpzaft4Z8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5856Lx721436980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 01:21:59 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 01:21:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 01:21:59 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5856Lwx3302558;
	Fri, 5 Sep 2025 01:21:58 -0500
Date: Fri, 5 Sep 2025 11:51:57 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Akashdeep Kaur <a-kaur@ti.com>
CC: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <u-kumar1@ti.com>, <sebin.francis@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vishalm@ti.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: k3-pinctrl: Fix the bug in
 existing macros
Message-ID: <20250905062157.s32xwnyfbphyupfa@lcpd911>
References: <20250905051448.2836237-1-a-kaur@ti.com>
 <20250905051448.2836237-5-a-kaur@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250905051448.2836237-5-a-kaur@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_232203_806599_D550C919 
X-CRM114-Status: GOOD (  13.50  )
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

On Sep 05, 2025 at 10:44:48 +0530, Akashdeep Kaur wrote:
> Currently, DS_IO_OVERRIDE_EN_SHIFT macro is not defined anywhere but
> used for defining other macro.
> Replace this undefined macro with valid macro. Rename the existing macro
> to reflect the actual behavior.
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-pinctrl.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index 8ce37ace94c9..e46f7bf52701 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -88,8 +88,8 @@
>  
>  #define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
>  #define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
> -#define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
> -#define PIN_DS_IO_OVERRIDE_ENABLE	(1 << DS_IO_OVERRIDE_EN_SHIFT)
> +#define PIN_DS_ISO_OVERRIDE_DISABLE     (0 << ISO_OVERRIDE_EN_SHIFT)
> +#define PIN_DS_ISO_OVERRIDE_ENABLE      (1 << ISO_OVERRIDE_EN_SHIFT)

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

