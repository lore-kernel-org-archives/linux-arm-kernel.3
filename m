Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F34C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9ZBxMcRpMoEoqbx44hfP6cOQVSEwX25fwYpyRa9ruc=; b=ZqOnNAttIpE2mgkozf2egLNEQJ
	9K+0W7hldBbDv0GNCOw9fQ+s1SzT9jbNCvFeCsVvD/XG4gsQ/Rkt7B4tmNdXdpoy6qMVm/LCtA3yx
	fIS8JYALlBwUXkv/i+SzuoZH+91ZeCqoH+N364N1KM1R7LJtjtmC7Cbro8kySrtJrD4Ixh8NljxiM
	HM8zcuepdEYERwX0+hKZwKNlHwb1Wkx0n/gaTVFyXp3wbwQfp8Y/H5ZIuRgFeZvq6bGaghVogJ2jZ
	ENiOxYDeWNkfiAfRW/2vHJsIhHY2HE90QrX66M4uTTGpVNkGM/yfOZV42LvyRjS4n9BUrlDdIhJdI
	9RBQxjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmc6-00000003B8n-2IrR;
	Tue, 11 Feb 2025 09:31:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmZp-00000003AVP-1Cmc;
	Tue, 11 Feb 2025 09:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=l9ZBxMcRpMoEoqbx44hfP6cOQVSEwX25fwYpyRa9ruc=; b=Che5wknZasG1ZopQLTCIqT0w0B
	8Ya/xl8JX5WT/xEuFISDxTzN1obz/QnUiuGA6zXQvzxzuh2mhTjpMeW6AFJq2/k/hrGsu38l4J2Ws
	FO7qvtzXaukFFSAsfvqZFC9eyHIT0/9pLjNWQs52uqb8ltxB8NnaZOZcL8tRV050r49liVE5J86RJ
	+F3aAXFTIAvZ75mPu90kp2/AGmRa4HF1uppTgz3uEayBK02+z1IG/Jl9YP9rD6YgiJeCZeSbCYUHt
	P/7z1BZZnezDGMXLVDKfca3neoXKVX8lXmSp/9ct9OJeln/SUC9c8lcbkmxIv+rt/Re3slc9BnlP3
	KxdPr4/w==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmZm-00000000XoM-0D0V;
	Tue, 11 Feb 2025 09:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l9ZBxMcRpMoEoqbx44hfP6cOQVSEwX25fwYpyRa9ruc=; b=me0RZXfqHze4mlDOIlcJ7qvLr8
	ACyYFpmquyLcJKuo7Wz6huORLPFTUERbLsUPoFi7Zj/9u0vGueiWrrMJVImF6++N4WeoebeicgpwE
	/jnsq6u6K19up+6du/Xeqf72zRq4ivUA5rUO+5wsAdGT6ik8AJ5qlrZZ3RM4BUeBBs7pq63JhWOPP
	mnVpHHGb2d5LUw1ZxplJRsxfbI9wCXM8hPhJEinFqiFRs4oX2Q84knBlh6DOiaf8xyITbl3Fu4+BE
	6BipW7k10w0MCKDn95OXmu7dsqq0C3FUjNKvj/UjdXY1nMaqa6bBvUziNFpiYHq+sFZNfnlRRhfV6
	RV/pXW7A==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thmZi-0005mx-Oe; Tue, 11 Feb 2025 10:29:02 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] arm64: dts: rockchip: Add SPDIF on RK3588
Date: Tue, 11 Feb 2025 10:28:50 +0100
Message-ID: <173926612570.1219038.2885465365177392240.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092906_409644_56EC98FA 
X-CRM114-Status: GOOD (  15.16  )
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


On Mon, 20 Jan 2025 13:01:26 +0400, Alexey Charkov wrote:
> RK3588(s) uses a several SPDIF transmitters which are software
> compatible with those found in RK3568. This series adds the required
> device tree nodes in SoC .dtsi and enables the dedicated optical
> SPDIF output on the H96 Max V58.
> 
> Note that only SPDIF 0/1 are meant as externally connected outputs,
> while SPDIF 2/3/4/5 are internally routed to the various display
> encoders inside the SoC. Thus, using SPDIF 0/1 only requires their
> device tree nodes to be enabled (provided that the signal is routed
> somewhere usable on the board itself), while the rest rely on driver
> support on the display connector side and are therefore not touched
> here.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: rockchip: Add SPDIF nodes to RK3588(s) device trees
      commit: 271ba4d6c56c7cb295def511cbcdd9880ec41e1b
[3/3] arm64: dts: rockchip: Enable SPDIF output on H96 Max V58
      commit: cd81ee8667cc13ff69e11b44a727be07035aa536

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

