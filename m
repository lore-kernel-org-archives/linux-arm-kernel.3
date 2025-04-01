Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF70C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 03:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FsS5P1YZtx3oTd6hpJFYAj7DTveYiWAC+dPAiTNHBU=; b=OYxUep4Fzs0jBdAOhRtgh8/5l4
	FK+UQ9EJOXlGiquL/YgrJPOz8LY+RdEz73OMIPyPgSEkLJXKayTIzxEOsCOCStOxfeqATzmWz/ZDl
	NGtAbexiTwLZFGbZh265To1j3CVccJVll20JmGJlsSsefPSVUC8ruTBPEk3Lg0TyVHF7k95dIaRS1
	MYEtMaU4ozqngBInKRLiGhxMYs9m/VoegFyBJiNLxsjofMZOrGSLG0EGeWT7fVtArLk2K4QsbXAcq
	bypfdNx/kIP9+B213c0CkfrsLzHT6+IionwnIKJyNGBn/b3jEj409qE178qOhQ3QF1B/vOus+kWPO
	hPZXUV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzSjZ-00000001suR-02D8;
	Tue, 01 Apr 2025 03:56:17 +0000
Received: from mail5.25mail.st ([74.50.62.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzShp-00000001sml-2SYF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 03:54:31 +0000
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 91DD26040B;
	Tue,  1 Apr 2025 03:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1743479666;
	bh=COGoUV2LNCT7BAByBN+90DSwtl7nzPfe94IaM5eu25A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j88BjEpYJbGHDIbrbQgnoxpXCjz6IezOyCvVyNwLauDr3s0CUHlhkktyM3q/Sg4DP
	 KIju37voGdqjHrK6cRQHhbeirbEHelkezjqNwh4Cb9r8FiSuMOu4o3WScv/Vt3fsrk
	 P+I1rtsv2D35AViLzbRwAnVHD7hyYutQvQLyRoo8unI5RdtN8RkQ8psUmgE5HMtWa/
	 0ZutpaCEQw90RtyFCvRuySo3K4tXEHeUHy/FJLglhm/hJ2hpEqQIuje64/gL8Z1ICz
	 8Rw+o7+zeSY4uBC/+on3fkT3c5KNlAZ58zcjOTeZuCyFdf708m2GG9WVHEpP+SEywS
	 I/YMrqTnbktvw==
Date: Tue, 1 Apr 2025 06:54:03 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: khilman@kernel.org, aaro.koskinen@iki.fi, rogerq@kernel.org,
	linux@armlinux.org.uk, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	sre@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: omap: pmic-cpcap: do not mess around without CPCAP
 or OMAP4
Message-ID: <20250401035403.GF4957@atomide.com>
References: <20250331144439.769697-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331144439.769697-1-andreas@kemnade.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_205429_671912_35076CFA 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

* Andreas Kemnade <andreas@kemnade.info> [250331 14:45]:
> The late init call just writes to omap4 registers as soon as
> CONFIG_MFD_CPCAP is enabled without checking whether the
> cpcap driver is actually there or the SoC is indeed an
> OMAP4.
> Rather do these things only with the right device combination.
> 
> Fixes booting the BT200 with said configuration enabled and non-factory
> X-Loader and probably also some surprising behavior on other devices.

Nice catch:

Reivewed-by: Tony Lindgren <tony@atomide.com>

