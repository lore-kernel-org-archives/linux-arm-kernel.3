Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE4DF9EDC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6qlUbD0I6t0EojZ2U8viRp3k0GjiQJGNIMchnd66qg=; b=fB9lQJ5rET1uLOxg7uuCNtGfhG
	lo6od2yNpFcKhk3BvY3Ofz/dih9oSarTqeZOeHZhFQNpLnV/0PgQN1n5sJQTQMHIU5uwyooQu9jvF
	r+HV5X/e4p3Em66Q0odexQgX2465++gQXLX+wB0lK0KoWYsdddNZ5rLJmOtIrm+ESoq/o4eN4kdkU
	4e0vIUmOKPzL66y3WCw0na29BCwpasf0//Xvjvm+rP4pVnC3+gFLk6CkQAbsHg5TpN1QgaCJJxOFl
	iSSdmwtJLChonXCPZGasWhS0MoVgyYoqI0VeAUsgN0UnO4sFcnphWmFk6Ftnrg9HIHVzgmyNavVIR
	cYl7pMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXQ6-0000000AH2c-35cX;
	Wed, 22 Apr 2026 13:15:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXPz-0000000AH1c-46JF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:15:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D68B440429;
	Wed, 22 Apr 2026 13:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD17C19425;
	Wed, 22 Apr 2026 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776863701;
	bh=lPu3GoSSEkW1pgq2UWSEc9hfVOWBRgqDIAJWcVT/hBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OcEYcD3rlThooXTr3Lagc6MTmXNxnOSyvTMPpC4DVpujticfv5RV81ic1uJzOm5OL
	 Uz/xUPypdRKMswvgFitMlT2BOkt6yuM83hcsBfRvzsPktWvPcRHqQwySVCsodYylwC
	 zO0krOyR4AsE8qyBvosBZ1c341gx4SXCu/s/EWRjO5FwdWYhFo8K0RSw0PP/YLx1JT
	 3fIXdcDoeFVJ5N7gQiaRu69xbIeasTPSswcfrNcKk1nlFLAwOJVTg1MxGSDHddQU3g
	 X82j8bdWC2s8PgUH74JF/Pwplg9QwPcUSMP/uMRSn1Y2ACQnbbvAGsnGXWPsL5FcFr
	 2uYhFu4M8qbGg==
Date: Wed, 22 Apr 2026 14:14:56 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 2/2] clk: scmi: Add support for two #clock-cells to
 pass rate rounding mode
Message-ID: <20260422-huge-kiwi-of-tornado-4fce89@sudeepholla>
References: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
 <20260306-scmi-clk-round-v1-2-61e2a5df9051@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-scmi-clk-round-v1-2-61e2a5df9051@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_061504_053822_D9AD7F60 
X-CRM114-Status: GOOD (  12.97  )
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

On Fri, Mar 06, 2026 at 02:20:13PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> SCMI CLOCK_RATE_SET allows the caller to specify the rounding behaviour
> when setting a clock rate. The previously added dt-bindings header
> defines three modes:
> 
>   ROUND_DOWN / ROUND_UP / ROUND_AUTO
> 
> To enable device tree clients to select a rounding mode, extend the
> SCMI clock provider to support "#clock-cells = <2>", where the second
> cell encodes the desired rounding mode. The default remains
> ROUND_DOWN for backwards compatibility with existing device trees.
> 

Where is the binding update documented ? It's not in 1/2.

Also if it can be static in the device tree, why can't it be
autonomously handled in the platform firmware ? I think I know the
answer for this but I want to make sure it is a valid use-case and
gets documented here as part of binding updates.

-- 
Regards,
Sudeep

