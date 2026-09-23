Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A14C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bNcaMozgi7eMkdPXPYneu/L8vYje9h4xULACp8evALk=; b=MrLgMJoUmdflkaFX/U0KY7yyqz
	7F1nJFehMXJNtGBsJHDJtWDBRP52gkXhFfxnagIebiSkuUvrqc4dOrLWPz7eo/944EcDq6qNHqe33
	WPh/jbxw6VcRc0lfdgR5qH8EJDGu2bzTffWCstemlDWSn70BEXQrcgnFJ2laOCJDNbcMkLvw2WaNT
	1nTWjYM//nbOT3lRkjEq3Re0YAAJM4lq9e7q/r0uvOxjClSPbtZhGz9kTIP1zrwG0kuYBnOsu6Ywt
	Tdstv/01PuzM8zk9WVLTskCxTPUI5WaF+qM4Gd3gRueUBsd1gPJySa0BykZ8g1GJ2rmiyiSQDkIv5
	lsmzW8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fsr-00000007Col-2Uo2;
	Wed, 23 Sep 2026 05:51:09 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fso-00000007Cn4-2e6S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 05:51:07 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8631d0023daso327322b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790142665; x=1790747465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bNcaMozgi7eMkdPXPYneu/L8vYje9h4xULACp8evALk=;
        b=Pz9Qewyh6QQAQOja8im3T0NYOyqKmzLT3z1jDnOGHttUE/9yHZmchd71+j4N7m/MED
         s0/X5LISX/bk7Oc0LNk9B7uaE69QFJIkxygHin51JnMl23tjTxNRCpSmAIIbzmR2IzV1
         uG+oMUnB4XigR+DJNARVhJE8LQJZOlkCtAaxidBwyANjm8g2z/XrGLoSMdN5zsSezYir
         TF8xcAWuTiTjMORbT/9eEhwy7Gb9f/MSLhKFepQIu60/eBPl6QFYwe88ZeYJo2QV/3K5
         5nzdGipZon6YlYwPjsqi1fpRy1SgFPpyhPDJCWfqm9GfQUHGWBFBotcH3gjGigma6WE/
         D10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142665; x=1790747465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNcaMozgi7eMkdPXPYneu/L8vYje9h4xULACp8evALk=;
        b=h3w2FyCKVNpf0O3VWoBqC7ByBUo4YoQ7aeLynW0lLb8krMGp2ZQ0SHWZorLlYja2jd
         oVuVacsP16XBMMGY3B3vv5OPPnsZ0b4TLrvtkmmILN1b/aYaJ/VkbpdlT5rhAUyresYQ
         HhW3GtReN6VyT3cqk1PxE+DNoPFlblTGopBubkX1djjnaAlbwhI6nykqvFdG71xP2FGg
         KisCmvl7HuS9k79shXjEbiajQSfjP0biThfZoxA8R2JBo9umTMUaSiAD3F+Oxrwf1+m9
         HG7McE7qnf21S1LSs/9gMG/79JzmlOhhC2h9By3TdTQKZf5OHZhkKzgc1qxl6/pAOcKa
         8g8g==
X-Forwarded-Encrypted: i=1; AKwUvBxNUwVCaWlZVFIvEwhF47e03AaKZXhbYDVZa2i2eVogYNq3Q6MfLzBcLiYHPt7HG0G4hSbDGZoEGb8Fs22UFoEO@lists.infradead.org
X-Gm-Message-State: AFuF++lxHmnrYmdqhh65FpoCWHaywlLLEoTdsqn9iSup/LaLVLxnR6oU
	U4gXnM9N1sJv7COUg8tiIRoFCSooE1PGLGbfgYCQXvyXruRPHucH2AHe
X-Gm-Gg: AYBFou3u9umG3mSbv8OE2s7y4Ah0X2ut/Gmom9tdvFjpIAf/gQVfnfH/9SyXJ1JL4qS
	hWcdK8ZtZI2BxcDielNIInmjAtQn0cPY0Y7fMWusXwz0+hLF2m+a26yHbWJ/dDrL4UUSP1dWQ7l
	LHEDSsAuLP/2XQIdp/PElPNWLGIEGMiJ7gbsAY2zdwy9w5yylrbANGOKWt7AoY0IKmgDmzUgv8s
	Bx/+3OpayaUgGW8+BOP1j+DeSdR0w+lIvJpjw7rvq4EyEAfgro4mOSaCcxttqGvXcoIpAoYuDjH
	NRO8v04p+9zBN399Se/wKggrfckkWvl5h87X8pK1JbzMEpSo+mYg5O3qRYEvWlhtqTNkK/Ijrxa
	pDK8jV24b8qk7i+gqTab+STseW6dL3+WE26vrp5lRwB4Tc78a1Jc2D5wTeRIh9MkxvOruvGmZ23
	zHiF43dsL4in6hKVp8WahGK/teU5akh/0WEdLxgMBIDULmq0omOv2f2S2+Nt8hvwYII43erj2SW
	ARSE1RUvZCU9PnSU3CLaDb4+4hlos248w==
X-Received: by 2002:a05:6a00:3316:b0:86e:8deb:fbd4 with SMTP id d2e1a72fcca58-87d1a7af6fdmr1687497b3a.11.1790142665440;
        Tue, 22 Sep 2026 22:51:05 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dffd6ddsm691486b3a.48.2026.09.22.22.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:51:04 -0700 (PDT)
From: Tao Gong <gongtao0607@gmail.com>
To: netdev@vger.kernel.org
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tao Gong <gongtao0607@gmail.com>
Subject: [PATCH net v2 0/2] net: dsa: mt7530: fix trapped frame forwarding and egress tagging
Date: Wed, 23 Sep 2026 05:51:01 +0000
Message-ID: <20260923055103.949540-1-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_225106_671509_50F2D5A8 
X-CRM114-Status: UNSURE (   9.78  )
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

This series resolves two issues in the MT7530 DSA switch driver preventing
trapped link-local control frames (such as STP BPDUs) from reaching the CPU
host when bridge VLAN filtering is enabled:

1. Commit 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped
   link-local frames") set MT7530_VLAN_EG_DISABLED to preserve VLAN tags,
   but in hardware this disables the per-packet override and causes
   trapped frames to follow the CPU port's active VLAN table (VAWD2) rule.
   When bridge VLAN filtering is active, the CPU port is in stack mode,
   causing incoming untagged BPDUs (01:80:C2:00:00:00) to be egressed with
   a VLAN tag, which userspace STP daemons (such as ustpd) and the kernel
   bridge drop. MT7530_VLAN_EG_CONSISTENT correctly preserves wire state
   (untagged frames stay untagged, tagged frames stay tagged).

2. On Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC (0x04)
   CPU_PMAP alone is insufficient; the switch MAC forwarding control
   (MT753X_MFC, 0x10) must also have CPU_EN and CPU_PORT configured for
   trapped frames to exit to the CPU conduit.

Changes in v2:
  - Rebased onto net/main
    (git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git) adapting
    to mt7530_rmw() instead of net-next's regmap helpers, resolving the
    patch application failure on net-0 noted by Jakub Kicinski.
  - Carried over Lorenzo Bianconi's Acked-by on patch 2 as the underlying
    logic is unchanged.

Tao Gong (2):
  net: dsa: mt7530: use consistent egress tag for trapped link-local
    frames
  net: dsa: mt7530: trap frames to conduit in MFC on EN7581 and AN7583

 drivers/net/dsa/mt7530.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)


base-commit: 9c572a83037a7dcd653ba3a9cc468c16b857d0c9
-- 
2.55.0


