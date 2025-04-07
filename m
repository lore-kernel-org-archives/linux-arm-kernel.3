Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FB6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdUAOOSAppZrP2zaF9+Q2bZVNDNI+mu31ior4FSVRiE=; b=VFYMCoqEwLpZ33AoqWRjMjHW0a
	0DofGC96ovBdzgvBkirfshhseYzkdWlle5Stktutn8q+ksAWQYj/Nlh401C2v0SPcZ9jPOE98C5f8
	7qmgrT2rpcQuRnnoO8KG/guoXnFtyg/rEUnwBfk8+fTylND/LD8Cq/VgSs1WxxC+wOx0Z3Hzgn1JO
	lhOGogwok84XNg7bRpf89J2elg7MTzFcE8owqRvRiv/GBCAPVyLP/MMfQ+lRLDS+FOH8BWOdW/156
	XaxQNJxL8+9tyuLXW6cyHoDI+cai0d54jBl7gNW2OBZuFerC5M9HXWLG5lOEnd0BhNu2JJYsPkB8N
	Q9XfX6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gtI-0000000Glgu-1ihg;
	Mon, 07 Apr 2025 07:27:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gjz-0000000GiQW-0ZYQ;
	Mon, 07 Apr 2025 07:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KdUAOOSAppZrP2zaF9+Q2bZVNDNI+mu31ior4FSVRiE=; b=Ai9kF6UjsSD0f+9KkZno1zDRpi
	1fLEu/mpv1DwA2IZJ1J3aBMu63mE52xFGLTFV3KFI2jiwOmP6Gsrstlau14han8uBefwUTJ28D1aB
	J/MCarOsamtVmZqw+fzpvkWDqe+BFSl6KoXy8J2yx56Y19H05Dc9SDyGCRQXvXdRUZykVDWhB2iPy
	81Dz5GIYbR5QHUOdH7U0rG+my3IIP0Tzl0jzTjkVe83nSOzRmMWofx/mdDzyksk/IbM/RcX594lhy
	Zt3EACUI+PeVWhyH5qy+EtStCuZ02vTGk6ijfDHl8GO7NEaIn5/L81yzFnbMJyZsAfSa91PpAsQZh
	PvTRJByg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1gjv-0000tP-In; Mon, 07 Apr 2025 09:17:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Daniel=20Kukie=C5=82a?= <daniel@kukiela.pl>,
	Sven Rademakers <sven.rademakers@gmail.com>,
	Joshua Riek <jjriek@verizon.net>,
	Sam Edwards <CFSworks@gmail.com>,
	stable@kernel.org,
	Dragan Simic <dsimic@manjaro.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Allow Turing RK1 cooling fan to spin down
Date: Mon,  7 Apr 2025 09:17:40 +0200
Message-ID: <174401024392.372530.2675381411653155471.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250329165017.3885-1-CFSworks@gmail.com>
References: <20250329165017.3885-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_001755_194694_7EBFA2AD 
X-CRM114-Status: GOOD (  11.87  )
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


On Sat, 29 Mar 2025 09:50:17 -0700, Sam Edwards wrote:
> The RK3588 thermal sensor driver only receives interrupts when a
> higher-temperature threshold is crossed; it cannot notify when the
> sensor cools back off. As a result, the driver must poll for temperature
> changes to detect when the conditions for a thermal trip are no longer
> met. However, it only does so if the DT enables polling.
> 
> Before this patch, the RK1 DT did not enable polling, causing the fan to
> continue running at the speed corresponding to the highest temperature
> reached.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Allow Turing RK1 cooling fan to spin down
      commit: fdc7bd909a5f38793468e9cf9b6a9063d96c6234

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

