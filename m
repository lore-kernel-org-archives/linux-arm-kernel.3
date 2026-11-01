Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B42606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DvbQq1dt;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7W6LA7N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+AAZ+EVzgHbvUtqw5ySjJ+voYqrjmDiN/ge+wXZic4g=; b=DvbQq1dtixB9P5
	NNfHq3Dl749MLFIsgJJ6Q0J90UeU/yJxXly+5G0sn6mN7muf0rQm3JIcKN23mRIEacmDbaTirqQxw
	ZtebPBu4U1HARNLTcLDH27VkMmW6NbPOaQolVjDvKlaXth5XyzrNSbo6F6wlm4wdRgaK27mVw6Wdh
	5fTzvZ1ol89xV4trDrUbnS/wme0Iotgr6pj9HVixCXiiSfKtndzSC0kuMyGDTXPvU3zO+oIJmVKzO
	08fZyvyfQc2mYh9khe7xEt56wZFFc34zUs+uWTyrd7r3kHUGIM7ZaII0N8sXyagLTs99LFTg5X6ub
	3k5fsDJPqpmZCFmCbS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNfPk-0000000FHGT-13W6;
	Sun, 01 Nov 2026 23:56:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNfPi-0000000FHG6-1i0b;
	Sun, 01 Nov 2026 23:56:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96EC8601FF;
	Sun,  1 Nov 2026 23:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3C11F000C1;
	Sun,  1 Nov 2026 23:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793577397;
	bh=+AAZ+EVzgHbvUtqw5ySjJ+voYqrjmDiN/ge+wXZic4g=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=d7W6LA7NOHh53J9ApT5nBM3eF8JJJ+9ADWgqq3AuElOWEzPhhyLdimZht6FVdhgA6
	 ps7YmlBr+ZZ/lMtFrqLIjV2RmlkhfoxNO80/V5wNsN9AHkFTVl1K97/IuLqCbrBUbL
	 oo93ovmtO5Qe2uvU0DZA+yRWvsn62XFPZ8SIbFLHXIIGymaE1b41TdPOF1rezA8I6c
	 W0/KIzQMI+aWNAAdcHcXvEfnpTrsBqPx8lIUDCfHWp+VvmvTPlHwDaecWgK8pDTKGS
	 /ejwnlbAxitGYCYQUOeqYkpYWWMHgspNfXw1cHARkFp9hqE2TkbxkowLMgcj3bz9zO
	 JEOojoLiBgfkw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E91D021426FE;
	Sun, 01 Nov 2026 23:56:34 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: mediatek: mt2701: join the IRQ before managed
 cleanup
From: Mark Brown <broonie@kernel.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <gm-top10-20261015191529-g154-c729db287fde@mhun512.gmail.com>
References: <gm-top10-20261015191529-g154-c729db287fde@mhun512.gmail.com>
Date: Sun, 01 Nov 2026 23:56:33 +0000
Message-Id: <179357739313.1716893.14542829236371668404.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=340; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7pcJBRynPms1NcRxsn5UpS1LOfo/KsWlsoodRvRXnSU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKeX9xUtkxh3ok+w0OHn2bvkzJXsju6vevTpj2b9v9a9
 9Rx59b5FR2lLAxiXAyyYooscVncL+tLXq/hO7iwDWYOKxPIEAYuTgGYSM8Vhr/Ssw9PirQxiVSN
 W7In75dI4LuMC3Nq5nevnVOqdbfUcdYjhv/Rf6Ye2yvYJXeZxffcY4ag/QceH3xvM+WB3smXdo1
 Jnx7zAQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The IRQ is published before the handler's arrays, regmap and clock state
> are ready. Remove drops the PM reference before managed IRQ release, so
> a handler may also overlap clock shutdown or subsequent resource
> cleanup.

This doesn't apply against current code, please check and resend.

-- 
Mark Brown <broonie@kernel.org>

