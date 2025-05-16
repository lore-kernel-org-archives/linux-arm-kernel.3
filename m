Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D35CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 06:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P+K6u+qS4LSYc/nHb/eBW61Vv87dsLXyYUJoS3HMuo8=; b=rKuf4pgDQmINGYAXPTMuyykU2O
	hZuOFzSFKcNxdr2ngmT0aQULts2uc8VEFhDXMVCIHnuDxNYBdwcbs72iR72ucjLcQWbHK9y1Bma9K
	zQsoX5MBHCs5JNN0rYElLLggi6T8IzIbKiyiMLQSAS0PYpq4YZqs5zyJzUChNJPOTX3UplWpNmqym
	QF8xnGHRp6y1wKObsVu58eRUnhWxkkOFHD/8cc/qZ+SsfWR38GYe76Gh2fzw8oH4qB56xhee+PnKe
	s7yrCkGYwSHBUHQ12PzRLsDcBVYv+DQacX8ipUVBOKs/Ra/GgDiz+3DScBacccexIoqU05ts7Ij05
	5JrHHZyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFo78-00000002XkX-0w9i;
	Fri, 16 May 2025 06:00:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFo3G-00000002XU7-2Ddd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 05:56:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a0b9303998so1109450f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 22:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747374969; x=1747979769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+K6u+qS4LSYc/nHb/eBW61Vv87dsLXyYUJoS3HMuo8=;
        b=KH0rbUtTuYBRzdeNvEf+0ELJ94gb4fIR18tPcNF3B12w79J2k3JoC0371ZDm8IlMWj
         mpSf+tVYvwl4u8SypUwfCfr4syaFm3KSpOy0fFEl2GkAMy1KJfkO+iox1JV13y/zwQNI
         jh9Wxha/IE1BBBHk1Fse6D9KDDQRKl298C2SWuXSXUqYrWbMDw0xvnPY3nrlPdrvP00P
         UxvHgbb4ufvmSR2l7RI5HMcfv5DkGLReSariDGCeYSItXCUJ0yezo8hX0pEis/4oMnRX
         E2gpDQ8F3z78x+qxoye1BmOUJP2mC1ttWSm2vWII0OjgL6EMXmiQz5de7FXhhnJ1VJuS
         rsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747374969; x=1747979769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+K6u+qS4LSYc/nHb/eBW61Vv87dsLXyYUJoS3HMuo8=;
        b=TwZ/vfywqG6XcxxKK7f7L6xtkRlEVEvq5eNBH7NhaSKMPjPEj7W9kzR6yEHTwrMYs/
         Oj7Zrd901L9GY0bfrj4dbCTFwyqH+/hmk4evNSn1A2EMm/8rkEYf7eIEuJVbLhS4D3TH
         xYV2tVaeV6xAzGLONqQeu93hGRafdFkdj3U4TiC8f7wS9oKWW/Xi/qFCmdqnrHMMxMMt
         /ze6rGDSqRPHtNCfiCf9sGDxtkfi8HmLKfjSaOxg6qpbwXxHykI4+11xUYBG9/6nk/HR
         mwQ6ZdDrnkTcFJIDdcw2L93Wbn2A5zltQJmJ1ueZkYPcuSrmiO+5bVfCV6+Bgh/kSdBY
         x1iw==
X-Gm-Message-State: AOJu0Yw5vdtaA7Yc9jHJneyvw8VxvW/bZaiqFGy/je9kjsvBNK635JvJ
	0GQU68Jx98N6APQGaT/HLo3rhN1AgS6hzH/xYENQvqAHPaRn0fIqwcObPRFd8/twOO0=
X-Gm-Gg: ASbGncsuXkdKV0vXZIos8IqBh6Y9obuZg8iQ9SvUx0cd4n7MBadI/gFErHkU1JFixEi
	V964mze5S81FcXWQEOdyfsFWvLMIX7cZDHO7rRQXXP8KHlShNvEUpTcYZOmlEkBlnaM7oYz1wdu
	jYIDeWOPyCWGZeMNUU2oP2DUjQgub/hEzKeLj0aBCwjx0A8jYvUUVBR4AL+l0pubAO843X50+V0
	WF7zsJCJXp37RWVAhZM0sIUTFMz8+T9yH30iRICxkaRvsmvfGZP4g4lt/xi4ss+4iZu5AskUbG3
	kEmuw1gPS8cqwGRWLKEWMCBrMlxM3USl6lGcQXbZxd6cAs3hQVi7DbxF79UT9T/BY8fTXQ==
X-Google-Smtp-Source: AGHT+IFeUbR/oRAievxGGOL7Ute+w3SGan2dAe/2cFQESS8zNaK4mJcC+xdPCx24Pvqngoelfm+bCQ==
X-Received: by 2002:a05:6000:220d:b0:3a3:5a95:a2a0 with SMTP id ffacd0b85a97d-3a35ca8217fmr1640934f8f.17.1747374968820;
        Thu, 15 May 2025 22:56:08 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a03fsm1687478f8f.22.2025.05.15.22.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 22:56:08 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip ARM64 DT updates for v6.16
Date: Fri, 16 May 2025 08:56:07 +0300
Message-ID: <20250516055607.11248-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_225610_569111_60EE1B92 
X-CRM114-Status: UNSURE (   6.64  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-6.16

for you to fetch changes up to ec32344d2a3b841d096c12cffe8e620ad117a6a0:

  arm64: dts: microchip: sparx5: Fix CPU node "enable-method" property dependencies (2025-04-07 16:02:43 +0100)

----------------------------------------------------------------
Microchip ARM64 device tree updates for v6.16

This update includes:
- fix CPU node "enable-method" property dependencies

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: microchip: sparx5: Fix CPU node "enable-method" property dependencies

 arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

