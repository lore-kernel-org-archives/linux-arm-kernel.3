Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D95DC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 17:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2YBb1ww7P4FN6Kapfe0IGZ60gd3Ip2DVQdxj2GxLyY=; b=PxIXiSuCw1zktMq0dIxve+6ftf
	76G2xs36n3HZyCrB1i3GsNl/Gec76bAHNAUfqX9dR43DmRUr+/kGEptVxXc8ZtPJRS/mkDZsvdVzI
	aGr2TJkkcz6/6lxlY51UHcJv1Uq9bAbAm3tFf/HVA84fnZpy3H1V01EsEWUOHlTm5pcjytZAgMvex
	CIToY09dPzWf7LUXpPd68LE9vrBr20yPiCjlzA2bAaFhUvwAddpWqURq9kLQkN8usiPLfEu7/bb1a
	bZkW70mwVZ5SrFMV/LAuiD6f6sGiXbeUlU7xo5+H1QL+iNJyQCLg38U/ontVr3tQrHsiHjM/Y5OZy
	bfTeim4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkR45-000000095bS-1Lgv;
	Tue, 18 Feb 2025 17:07:21 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkR2M-000000095Ce-2kSs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 17:05:36 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id C1DC111400C6;
	Tue, 18 Feb 2025 12:05:33 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 18 Feb 2025 12:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739898333; x=1739984733; bh=X2YBb1ww7P4FN6Kapfe0IGZ60gd3Ip2D
	VQdxj2GxLyY=; b=JoeflBjSlcECYktB8zIicHBlOAIRwj32VLOU9LZRCUOvNJz6
	xFCznPxz2DYndiNeVdGp2c+dx6FdbZ+sUO6rKTkM1+IUZs6iuhDxiQHnY6ALBR/K
	gowHqBRpdla38zSP4ao8AC6omid4ZQDCufpRdqK1bwOjubN8Qzk0Hkdf9goHsRjo
	72wYAVhMSsm82QXkThitDTHSzt8shcD9IoX+wgGN6j63voQEor8iM/l80BqQDwUe
	mPFCIjv9dMvMXOHBBbsyMGk5x4sL3a94rVnTYJ+ky41+IV4ZGJi64s+ry2O8/a3h
	RqOEkVNhgTXqYnonAK57Um/wgRHTW/VhOQfZPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739898333; x=
	1739984733; bh=X2YBb1ww7P4FN6Kapfe0IGZ60gd3Ip2DVQdxj2GxLyY=; b=a
	iw9LZ50bRNZaZQxx4tlb60DuiBq0r4tiV9DR/9qYm181DbPTWEDiuwLmtYjgVfoN
	PCWc+5Lste7N/i6y1AL2WF1sNZ0D/X272MemhXEfM00LtgQYKLVCCfkB2tx4jNYN
	dcraQIbKVmOo37ZZ3rRuxzJiFBljtCns2Ea6CzWVTjfRYmGLowb/bZrb6S17cIhn
	QOQutCpvzqDW6qY9/PLdxmtPuPw5bkUR4DT8+Og+cBbKMc+v3IhbxhX7S/8lg93h
	38kjzmMNtY7fQJzI4VotHEhRbRRn+67ZVPNlJXnP57fUCj21iZw5eZYi2OhIIPSr
	O52ozPO4xCYWGcu23xV3Q==
X-ME-Sender: <xms:3b20Zzz_1Z_YVvfAPjQnhLVW_63deT-Rm51msfkgovtsAmAO_3arOQ>
    <xme:3b20Z7Sws-x803j8OCRaPnLnEPofH53AVJRqwefhpBUo6I5jUCRcx8yCfvNBwzYpx
    xTD0dpHall8d_m3-yA>
X-ME-Received: <xmr:3b20Z9VMlC4XcisRVf0_Fxmw4GpeIb53f-ZlolIuRj8dcljLHrXgs0RSvbyOcy_XmdoWBF24wAv78XWFnIL2ZGRwkWx75xTiTuQLrRU0EGnh92swSFbB03Gtd4bd8mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpeegieehffethffhffefhfehkeevleevieetfeeg
    keehhfeifffgheehieejheeihfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghp
    thhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhihshhsrgesrh
    hoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgt
    phhtthhopehlihhnrgesrghsrghhihhlihhnrgdrnhgvthdprhgtphhtthhopegrgigsoh
    gvsehkvghrnhgvlhdrughkpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhu
    gidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtsh
    drihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhrghrshhhihhtrdhmrdhmoh
    hgrghlrghprghllhhisehorhgrtghlvgdrtghomhdprhgtphhtthhopehsvhgvnhesshhv
    vghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:3b20Z9iAa-FCjrsN2Rk1i86HGdEpAmjfrJxB9_UKNYv1ihQCZ7zHGA>
    <xmx:3b20Z1Cw6-MipYR4ZYpRtLo8aJHLMElI-KMh67ZOR1twqj8yTiGP9g>
    <xmx:3b20Z2KOaDYVxI9EwCuo8eKbQVCkeUl1R2pQWbQfmUu9JjCykak3yA>
    <xmx:3b20Z0A9Zsu1FoRiwZDRzmaacllSxIcg9cl_nvqz3STC4Bk9yqlcZw>
    <xmx:3b20Z54NHNk79hMLD2GLpkFnUMe7AyebEstp-Qt8fhwk1mLMcOV1SNqL>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Feb 2025 12:05:31 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Asahi Lina <lina@asahilina.net>,
	Jens Axboe <axboe@kernel.dk>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Sven Peter <sven@svenpeter.dev>,
	dan.carpenter@linaro.org,
	kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH] soc: apple: rtkit: Fix use-after-free in apple_rtkit_crashlog_rx()
Date: Tue, 18 Feb 2025 18:05:27 +0100
Message-Id: <173989828130.49947.10388452698510580758.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250212085853.1357906-1-harshit.m.mogalapalli@oracle.com>
References: <20250212085853.1357906-1-harshit.m.mogalapalli@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_090534_751965_E45C6CAD 
X-CRM114-Status: UNSURE (   8.49  )
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


On Wed, 12 Feb 2025 00:58:53 -0800, Harshit Mogalapalli wrote:
> This code calls kfree(bfr); and then passes "bfr" to rtk->ops->crashed()
> which is a use after free.  The ->crashed function pointer is implemented
> by apple_nvme_rtkit_crashed() and it doesn't use the "bfr" pointer so
> this doesn't cause a problem.  But it still looks sketchy as can be.
> 
> Fix this by moving kfree() after the last usage of bfr.
> 
> [...]

Applied, thanks!

[1/1] soc: apple: rtkit: Fix use-after-free in apple_rtkit_crashlog_rx()
      commit: 00834971f0d9e38beae37e92055b1432782827d0

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

