Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A4F60A3818
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=STuEA2Xm;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lFirtAy7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OFOJ0CkitkjiYmHRbTcKJuO87cltDnxGLCT4kpHTcaQ=; b=STuEA2XmarhtsR
	DbcfS+RubdsrR2LQNr2awP4yP3kI6GhCSqZqR/2aZkRZvn4kX8OJoWM+4mZH0/jdRt3VAUvlQ00NL
	7mGCzoULAVFzw7yPRTC+ITw3Fd/N5ivGyt2z4IxCZ+RlW0c71qLktjuXehe1iuZtRUxGka1VUrQuf
	gGPDeaH9MGNVDpvqf9muxt193c12ijIJvAEJhA7cdhFa5MXIC+SdAyHZ75/Q0ntAlq/47WBEXoXs8
	VGsnnOrS+imuTbS8wU05+zxR3K0iXTwmxVwG/fTNCYQoeYmbk+ADZoluW5EsL10HDuafqjNypXo6S
	QOD+PC7BelBgbpsRf8lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsYX-0000000Gh2q-0iw7;
	Mon, 02 Nov 2026 13:58:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsYV-0000000Gh2h-3iZw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:58:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 894B6423CC;
	Mon,  2 Nov 2026 13:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780E11F00A16;
	Mon,  2 Nov 2026 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627915;
	bh=OFOJ0CkitkjiYmHRbTcKJuO87cltDnxGLCT4kpHTcaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lFirtAy74/wxz57qMDxqmJeRT7c+HC4TIxoV7rWrwA5TwjE2Qd2T6+GFhwy472oso
	 9bkM4Nh6gWxRw0mMTL9M013dj3Ug1auAxmp6TkRadQqJEsL1p3IjRl+PY4gk89QIEJ
	 ciaWqXnCOY61v/EUVvY/T1WQzmX10jEaz6nQpvWx/YV0tZNZO2zikf33X6Pp5JKwYO
	 khVG81GbrKdQRiMjFjCuxtGg+/yOMpkxQSNXv0GF3NoeNI7kjb+sGUrQzExReKAGC9
	 WwzXZTb40wktOwR1icfJ3jAwNWbXYEfPzxlOFARqPW0SVLGTPIySuSmr1kx/kxHeIf
	 Qu3R3N2XdpxBA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Triet Hoang <triet.hoang.dev@gmail.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260825091118.271720-1-triet.hoang.dev@gmail.com>
References: <20260825091118.271720-1-triet.hoang.dev@gmail.com>
Subject: Re: [PATCH v2 0/2] memory: Convert drivers to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-Id: <179362791303.178192.8180558210148079389.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:58:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 25 Aug 2026 16:11:16 +0700, Triet Hoang wrote:
> This series converts the Atmel EBI and PL353 SMC memory drivers to use
> DEFINE_SIMPLE_DEV_PM_OPS().
> 
> This is a straightforward cleanup with no functional change intended.

Applied, thanks!

[1/2] memory: atmel-ebi: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/c402c2c002616df803c2bc80949c7fe37217b890
[2/2] memory: pl353: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/b2219e9b406dbe62681a55f3d3bef5a07fec752b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


