Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582BCE6B278
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CStBmLDr+kXoSaAr6gVGNNu/+XMuvbaTk/2hqK891dQ=; b=liu5ADNmO3g9bGWjmwTk0NiTRc
	RGsk5+RaVCcEq3zK6Lifk78edoGz5UKTT5Jua3H6A+sZUu2P68duUDscMKc5GELIAO8L8QOSd+/+0
	URVAE6J7w3DKCyOSUMrp3Yt9y6F9BAWsDOBdee3kqyH1clUGF+l+5Dwyz8ApPlZ0Gi1a3OGXYoKPr
	FDIiUs0MkSM9DefUUhCdF7rV2tPUXwK9r9gQk6rFNkYGXhh+ngg6okcQSSrcqliND0y5uHbxgk0K8
	lemq7yLK5pYwy+rkUIt1SEnVXl7JpkjrJL7YbIbH4sWnmvS8k9w+pWcWlfR5XUXGG9LyhwRt6UORK
	UTsmV2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sG5-00000007Gin-2oDW;
	Fri, 01 Nov 2024 14:04:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s4r-00000007Er6-3FSU;
	Fri, 01 Nov 2024 13:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CStBmLDr+kXoSaAr6gVGNNu/+XMuvbaTk/2hqK891dQ=; b=WopAqURWt0bkqRWPKUkpb9Vz4T
	aLXCsV3vzSdqO4dDpqQ9gJIPQtRPpt1c7Jj7nMLXPjKTWa2cIjd9AJPRe1hw8h2wTll8gXWQL9qjP
	nZBhCAd5aTHyT73J3cJXPqVeEu11ZLRQ8c+5mvlgthGdJAffDQUPu3PqQj0H45Z5URyMX/qh9GT6D
	u3H/DMoNpkDV47IJ2WLswVfbsaCI6fn2PxZ1TbAeDOj/l/XiRUsf+GsB06YCHN0cmXK1CrkJvB645
	cvpyGeSHZw1HOf5sslxp8/rbsfGDxNLEuvdgLuQfGD5bYj1ar42q3n3nvZUHpy3ATi1h4bMf7FFtB
	GDoKkGNQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s4n-0000000AhME-3Ac0;
	Fri, 01 Nov 2024 13:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EC605C8BB0;
	Thu, 31 Oct 2024 08:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B68C4CED2;
	Thu, 31 Oct 2024 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730362633;
	bh=/Uypm1Fod0x7S2WLQLLjrh9dUnoclEPbXXeFRSWSGig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVoMdO9lHGWjKUvm6JCnBPjQvobYbSvS8WDuDiVuizf6sersPToWLYisJcdhLEHLG
	 WfyjpM5ScGpj2ukitEJ82XMPgofzEXFmyfKcSAD+ErbwBp95Ew0PxHDHeqX4zj+IJI
	 FeAcRLP2B5W1/mvDwOUZAo1xgx2NJsiLShNgQlmMpaO825j85aogM3MDLxX8ubgkC0
	 6xwNuEcZgoDoInH4SCh8WXdLCo0LE4v0rn3Drjqcz18CSUk+b5FmNzC61UNLI8gbWb
	 WstAYKCYA48MyP0M1ej3RFA330KCkcmcJKwtzLn/sNVXBG7WbWzdXJj/JT+Aboay3C
	 wWZAcwHDyjm9g==
Date: Thu, 31 Oct 2024 09:17:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: add Banana Pi P2 Pro
 board
Message-ID: <5e4tokdfdslb6gop2h2ow5inftoflfo2mlgosydyg3f6ehwmmi@kefvmy32vchy>
References: <20241030202144.629956-1-dmt.yashin@gmail.com>
 <20241030202144.629956-2-dmt.yashin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030202144.629956-2-dmt.yashin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135234_027718_765DD9F7 
X-CRM114-Status: GOOD (  12.19  )
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

On Thu, Oct 31, 2024 at 01:21:43AM +0500, Dmitry Yashin wrote:
> BBanana Pi P2 Pro is the SBC made by Shenzhen SINOVOIP based on
> Rockchip RK3308.
> 
> Banana Pi P2 Pro features:
> - Rockchip RK3308B-S
> - DDR3 512 MB
> - eMMC 8 GB
> - 100M lan + onboard PoE
> - 40 pin and 12 pin headers
> - AP6256 BT + WIFI
> - TF card slot
> - 2x USB 2.0 (Type-C OTG and Type-A)
> - Headphone jack

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


