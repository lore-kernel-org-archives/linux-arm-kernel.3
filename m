Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10F7C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 23:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jPMMzPerF76ev1rgt9IqVi5wI7uHr29cgpQnNd/IeQk=; b=NCFiuQ5bLBpkr/
	VmXIsdOvDNvfPbVLOtrp8yLGvdz67nXzDNH2qX2DXtRvA3YXYsrGrfFTVZtD7V8Zjac/DxqrXxGhZ
	VA8lBGEGLKcc7vxk5CxM+HC7S7LShOurgMw6D/MXJRD02ozZSUuaRW2TsjTh6W4nzaZ4HxtohaGXE
	RsEGZ+kG/IKPW6Z0GUj+XuG+Bh29hb2qXh3BdtDamBDYyAy4atWrvBp8G1PBCpDcpZWncQW4ttUcx
	z93CqPTYP9ywdoRJaCZ7uBBy8nzbaVgwtlkbbyMGsf/8R5tonZ4J+5HuZx2EPW11OuWgK7hd0nz13
	jVzUcM52xUZrW84N0bfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99tu-00000006jKN-2Vqt;
	Tue, 22 Sep 2026 23:27:50 +0000
Received: from mail-oi2-x0f.google.com ([2607:f8b0:4864:32::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99tr-00000006jJ9-1lCo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 23:27:49 +0000
Received: by mail-oi2-x0f.google.com with SMTP id 46e09a7af769-811424a645bso269094a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 16:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790119666; x=1790724466; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jPMMzPerF76ev1rgt9IqVi5wI7uHr29cgpQnNd/IeQk=;
        b=osp0HozCWKht8xvPMKql8gd+sWVSoa4JsIlug2HGLxqEEKb6XHgE5VX7F+AUTTITCD
         rsrOuGukwULK2beifZtUB8FjYAaKWhg7yg7Ak8fsRmZihXSZLyFiE9cKp65tGvln30Cw
         Gxh+ZxjAgnVD5vZcCkQodGgp92JISmC8DKB8NUXTWyKZLzvbf7qv8xUlIA68aKMhEIBQ
         0l5mt3OJxUDNviDY42T7TwCcSDDhk6k3Z1Z8qd4AlU+M7ZOKj2LhVXlJ2ZWUN1IaMoNv
         Jb6UDQXY8/H+VPvMfhZc5iT9+avOYc3YDLCp6L1OTNbAVWTY3IhK7me9OwJFqLeLIZS9
         3IAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119666; x=1790724466;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jPMMzPerF76ev1rgt9IqVi5wI7uHr29cgpQnNd/IeQk=;
        b=Q2Vq80Y9CT4vMUywbgIsgFq+A5e5QtUcxfebFMCpj7nt2KoH0F1AQQRjAwU96sie2h
         wM6xHGDTWGcbiSAbiq2IUgugyb3b0wzfVOdH85McWmjFjpTTCpmHqKtcnellzVmoaAu+
         TtWoJrPUbfbc+7QaYRlyGVDCjUsFVrBTK2MX0KjLxIZi9nOkNKq9yEWfdWf+aDAEmLoR
         hQxYLeMZOOT0CnLcVyOl3GufU/GIuTiUtj+dtEK02qYfPTttCoZ1qoM43cpy6cta2+J5
         fPgG54yNlZ+D5Fn7+3ioW9xgatCt1x0fNNk0oLhu4xdbTpokaekCLpblDmL6f5XG/jUk
         vgTA==
X-Forwarded-Encrypted: i=1; AKwUvByfPqY5lXGLGiD8iHlFRV4stZ+jOtFoBOph+/Kxq6SzuOJduo41wU2GiqFXzkyrpCQ4kH/6fWTY+2DRMuHZSdVa@lists.infradead.org
X-Gm-Message-State: AFuF++nAxka55s8JI8pcvt8UaT2oU0v2b7LdSM4HjMbSPkHWLHmoDm00
	KK6CJRU7SvSuhCSpgiwS61V4PPI8A5DOvZyiQvGpruI+UOaunV0Gi3fg
X-Gm-Gg: AYBFou0l0h2yc6VNVVvjceHXtOrLBZEuRCIngXrZYMGpgNs/Sr5eM37ZKBCkuoXxntR
	fbG5h+zEXm9GmyEawfE+daTDHnAafmf3nWEJz6kbrj1igah9krnfxZ0TOgcCz/Mofv1ME5Eeu4e
	n+Lf87UHnRErSlQCMUM1V5c9NJCOVPoS5pnU9FIhytKotdCfXk1eTDTJ+IM1tGNplzrpJhuBHWl
	aK7q4lMhD8H2yo0ZKyZydPBvYR+DP8IvLWL0T0INJJLzLmiG3vNyTnFylNK4UXKJW2i8k8aga+i
	WuPomZNimZPPp02r31Lm+1TSNpz/tNQXNDjj4F+hH1oGHD2kJauPfnjOcrTmm+i/ryHv2FXfOWu
	K5qb3zzdCxud0BRGheD6bnAAfqFj9pkk1wLIc2DcZflutVeagdyOGxrwFAgU+PjWVrV11Hf11/8
	1Z5QKhNL6PSJCDpTc12Po2apc9PYTCYtiqywBz+CVn2kBtd+jewoo99LYuhuccD3p5F8jMAJiG+
	eqbvkn4CsCohB0wb0ZWTFJn0qrBHy3rEN3KIqbv9dgC0cNBb8mTMaRQqLVN9rq/hvVcdFOHYOh7
	bHge3vJwe+SS6Ch0V3swMM6kgAch/fxU3KOGzaBbpdrPEX/lgMp1cU43axp8FldeNBl1vaG0tIC
	ErkCdbchhi9V4JOtak/lZ+Q==
X-Received: by 2002:a05:6820:308d:b0:6cd:3ffc:e329 with SMTP id 006d021491bc7-6d2d2621293mr774668eaf.71.1790119665547;
        Tue, 22 Sep 2026 16:27:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603fc87cdsm1243053a34.13.2026.09.22.16.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:27:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net v2 0/2] net: stmmac: fix failed MTU reopening and
 hardware resume
Date: Tue, 22 Sep 2026 17:27:39 -0600
Message-Id: <20260922-submit-stmmac-reset-fixes-v1-v2-0-d92e609be996@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OwQ6CMBBEf4Xs2TVtJUI9+R+GQy0rrLFgupVoC
 P9uwR8wmcvMTt7ODEKRSeBUzBBpYuFxyMbsCvC9GzpCbrMHo8xRWaNRXtfACSWF4DxGEkp44zc
 JThorb+urNa2xzkJGPCNtt0y4wEAJml+YIXfyaQWvtZ4ljfGzjZj0Vv7vX5bCunIllQdNpNS5C
 44fez8GaJZl+QLBbXFw3wAAAA==
X-Change-ID: 20260921-submit-stmmac-reset-fixes-v1-7c98b92d29a9
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_162747_484242_9F47239E 
X-CRM114-Status: GOOD (  11.50  )
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

Keep the stmmac datapath coherent after failed MTU reopening or hardware
resume without changing the interface's administrative state. An ordinary
down/up must release the resources still owned and open a fresh datapath,
without disabling NAPI twice or releasing already-freed allocations.

The phylink prerequisite permits an ordinary close to terminate a
suspended instance directly. Resuming phylink solely to stop it would
reconfigure and restart a MAC which has not successfully resumed.

The stmmac fix tracks running, suspended-with-resources and released
datapaths separately from IFF_UP. A failed interface stays detached until
successful resume or administrative recovery. XDP, AF_XDP and debugfs
paths which are not excluded by detach also respect resource ownership.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Drop forced netif_close() and retain the interface's administrative state,
  as requested by Maxime Chevallier.
- Separate queue quiescence from resource release and use explicit datapath
  state instead of a napi_disabled argument to the release helper.
- Handle repeated suspend/resume after failure, preserve PHY/PM ownership
  until ordinary close, and allow a fresh down/up recovery.
- Check XDP/AF_XDP cleanup, descriptor readback and asynchronous reset work
  while the netdev is administratively up but unavailable.
- Explain the generic phylink suspend-to-stop transition and why restarting
  phylink after a failed MAC resume is not a valid substitute, in response
  to Andrew Lunn.
- Combine the two stmmac error-path fixes so every user of the new state
  has consistent resource and NAPI lifetime handling in one patch.
- Link to v1: https://patch.msgid.link/20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com

---
James Hilliard (2):
      net: phylink: allow stopping a suspended instance
      net: stmmac: keep datapath state coherent after reinitialization failure

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  11 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 116 ++++++++++++++++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  |   8 +-
 drivers/net/phy/phylink.c                         |  17 ++++
 4 files changed, 120 insertions(+), 32 deletions(-)
---
base-commit: 17741334d00bf5ebd37f8c1c36bc9c146a351deb
change-id: 20260921-submit-stmmac-reset-fixes-v1-7c98b92d29a9

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


