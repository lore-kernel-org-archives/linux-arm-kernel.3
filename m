Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AA5C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C2QcaSW8eE8D7RoBuOICkCFr3KzY/Y5G0pSnKbTuZfY=; b=keRJ8JdxGJ8jny9lRMNYfjlV3w
	uEFf7b/260FNfMmYaJLVdRJrRHxd6mGXKEUCK2IEUnMcWi/dSWyn6vjk6fcbqrruMp/gyGbhRMCx8
	T3bEL3l0dWt5ght+DihS1YykRoViF0zZY67++DKjJZWkLUEMXOsBX3oyupVZNMhiuaLEFsYYluv7r
	CBG8uzURQIK5x8/vC+9wWn3CsSs0RqSIp/3IRbzEoyRUeZg+oM7BJbwLj7sK0NMWIJvATDt2b7vyj
	GbMiDgUmMYby2If4pjt3iT6iSoddER1qq15j26VlcBjvzt5Pm7wTOI9ZDxyjlmHWfIagT7HsivcwU
	2vNB5gzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquxJ-0000000HaCc-2dcd;
	Mon, 03 Aug 2026 15:51:57 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquxH-0000000HaBS-1v6z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:51:56 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2997392a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785772314; x=1786377114; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2QcaSW8eE8D7RoBuOICkCFr3KzY/Y5G0pSnKbTuZfY=;
        b=ISv0MBfj7QgUa0ZTAbmtGQTXVFUGLFBROlPfB+v8BdVIWPNLj4V50IUCSSQFy41aM1
         LIkv1Fn6OXz9yrcyKeapeTFGHwHrC05KjzyqR1imkA5KgveXvEzV4s3R85sgAtORZ8VH
         m6mxGDbyh5HD7RiHyVgrSwPociSxvzGA9ey3EUlw3tjd9Y40EppNgud1Myrnhdc3fWFS
         hBccKQKivrIUWkwHF5avk1i83QlXRIV8HlHnB7Tu9EtbmOlfaiFF0Ur2GzoBoWULPnSy
         qn3xVDNeSEO128shZuwLwn1gKVXy83Uj1njeWfDHkd1ota6wZrli7y17TUR2T2SywSWn
         LGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772314; x=1786377114;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C2QcaSW8eE8D7RoBuOICkCFr3KzY/Y5G0pSnKbTuZfY=;
        b=KDger+mLYSa03DxqfX41OnyLxtKm3E2tWT8rjVctneXD0bB6bWlRwA1BvjAgLOaIfe
         Au+WdR/uITrkqDdFb8lffScr2Wjuh17duut0/cCWyJox0w7t4XWL0V9pmwPoPSqMmDIE
         EiftfWw9JWSVV2sYT9mkklgxHtqri0k7HfcOyd1m4GGT2WOE8DsNMVJ573ST+zJZgWQZ
         QpU4tkhsfE3F8QTYz/GGEIi2vuDLrWhp6H1oxTXFJCEin2bFUaBqurmUNrSziRFtwNRt
         GcNVMTslol0IridZCkSq6F+DvyjSOx3AX5AyPas2n0Y6Np1Dob+OoA8iS9J9skP/j0mQ
         Zl6g==
X-Forwarded-Encrypted: i=1; AHgh+Rrt8QdQk/wpt3PrEEy6d8pwMTZh4F/P+XXELUxwgtGd5Lh0oMs9aYI7m3naMTbBaBMLuPe2d5TP3Iu6cW3HC/fU@lists.infradead.org
X-Gm-Message-State: AOJu0YyqBAX3OBjP1F7P6sCjRaQHE/yJdkTAN+tjCFuZ/a0ftY2gFkvR
	zKp0DJhMK+HelpD6W9Ts3uWC683riQfFaeePFqZADv7pHZ5iUt1wG+MGwNI5q+G2XE0Z4fNTCtU
	I4RfC93xaQg==
X-Gm-Gg: AR+sD11Dy4S9mzzOMNzpd45ybi8wD6Ks+NCHeRIMk3woUzubRp4905FPGniH+Aa7z/3
	iqLFTEVhU1+J9RSIKNYR68d+hBGo/bS9ABq2AbNBaO5rbnHzkXHO9sUvTC1RCzGLpjwN4oTmxWA
	8SMEWa3YxpfRkYlPpucHvTXEqD8gXUZSYOKfx/raKal4G5+zrnJh2JGTWHlCNybZubdaEa5Wajp
	9t2T8s6kOXiUw3Otvs2FmMpftveZnY9qzcv0q82HUNt50c5SqQKb/gx20wo2LPbEDBlR4NMTIX8
	DHuLg3078d7e2RW6CHbqAYe0xRhqnB8ow68aB+H3V3WG6euuUS29spOHhfnGg5f0qmBH03qPMQt
	5P8YdIidAtNCdVSVz9wlbsUeTq4KELemhy5G4qGndl+mKgrGQT4RVi+X4e6sIWdG/x6U5YFHbrW
	puSDzxFjfQwVm3fxFv8jw2zZDW6qvIa2AK5mfX41T1mJTG6/4ccBdhzQtvHA==
X-Received: by 2002:a17:90b:4b85:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38fbc4a1328mr9585476a91.18.1785772314020;
        Mon, 03 Aug 2026 08:51:54 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-38febe2daeesm42905a91.0.2026.08.03.08.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:51:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: OMAP2 updates for v7.3
Date: Mon, 03 Aug 2026 08:51:53 -0700
Message-ID: <7h5x1rjj6u.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_085155_523954_7AB0AE37 
X-CRM114-Status: UNSURE (   7.01  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/soc-signed

for you to fetch changes up to 76103814279724e5c98b1c16a730f56ebede9f74:

  ARM: OMAP2+: Fix OF node reference leaks in omap_hwmod (2026-06-29 13:13:52 -0700)

----------------------------------------------------------------
soc: OMAP2 updates for v7.3
- minor fixes

----------------------------------------------------------------
Mithil Bavishi (1):
      ARM: OMAP2+: Add CFI type for omap4_finish_suspend

Yuho Choi (1):
      ARM: OMAP2+: Fix OF node reference leaks in omap_hwmod

 arch/arm/mach-omap2/omap_hwmod.c | 26 ++++++++++++++++++--------
 arch/arm/mach-omap2/sleep44xx.S  |  5 +++--
 2 files changed, 21 insertions(+), 10 deletions(-)

