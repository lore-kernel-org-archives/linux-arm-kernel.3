Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83843C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 14:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wu44kjt2jgbV0ZflrkPNRFsVj1L2e1+MVXtOhpoAnqY=; b=NcxTEhOr+43EjOgxCGEclCo01m
	wQpi6fms5CYzS0ALF+0Gl8ZOe6p7UanTS4vt8bJ8mF8aUJptxD73ZAIYC4Ore9nA2OCAmQCjXONiC
	nEMuOnxvo1YsLCk+F6TAg4Yc5UGkem4VRHGPlSZ5YLo8s0ZAOp8mvhkVHEmp2xzPU8BoG/bNpMwJg
	Zicxplp7MvzH/Vyp+sV+GhzENp3l7KL351tUZ4VptHbiNorHtQ2AOOs7J7hKRl/bk/YO1B3g7fDFz
	d2fNXLD0a8Pgt8gsUkqVYmBft8wGAeRZY2ErxieHE/g0bdI6KmFKtOLBwCDUhvT/U+uPKS50lLutQ
	nBL4Z5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNqv-00000009OGe-0mZS;
	Sun, 05 Jul 2026 14:29:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNqt-00000009OGC-2erU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 14:29:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E380543B02;
	Sun,  5 Jul 2026 14:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7A21F000E9;
	Sun,  5 Jul 2026 14:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783261786;
	bh=Wu44kjt2jgbV0ZflrkPNRFsVj1L2e1+MVXtOhpoAnqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UNDCx/n8I/gXJ25IhVcUDEQvWQLjfcQ5SxCtsV4I15uNFUNIImmKDGglWr1Qoopl5
	 75hc0Muq/lWlgZiDPs1oKifpCNcYJqho87JPaqaE94cSEX2KVGMtg60XmDBYF5p1L4
	 m+v34mp/26hMz2XaSYHizt/Ht2qmlffvYBaU9IReIaYY4zMafCH70a+PTWUQ08F4E0
	 FJqlVTAx3cLevPs0GJ+vOTCFIxYpcCrWA3R0diLQuDiK/4NzdjC3ZGRc3+WdakYz4W
	 4J505RQ716dhefE9Nvt0qKWoCE1OOlEUBoPLX4a75f58lJdIM1JhLK1Wp8LDmz7osg
	 wpAh5nV1CMSRQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH] soc: apple: sart: require device link for consumers
Date: Sun,  5 Jul 2026 16:29:28 +0200
Message-ID: <178326164441.9177.8657526397419269575.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260616005346.7862-1-pengpeng@iscas.ac.cn>
References: <20260616005346.7862-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 16 Jun 2026 08:53:46 +0800, Pengpeng Hou wrote:
> devm_apple_sart_get() obtains the supplier platform device and attempts
> to create a runtime-PM device link to it, but it ignores device_link_add()
> failure.  A consumer can then continue without the dependency that keeps
> the SART supplier ordered and runtime-PM reachable.
> 
> Treat a failed device link as an error and drop the supplier device
> reference before returning.
> 
> [...]

Applied to sven/linux (apple-soc/fixes-7.2), thanks!

[1/1] soc: apple: sart: require device link for consumers
      https://github.com/AsahiLinux/linux/commit/36887b488b253

Best regards,
-- 
Sven Peter <sven@kernel.org>


