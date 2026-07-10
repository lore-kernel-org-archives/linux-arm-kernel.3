Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B14C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j4ZVGeRqKMU3nyf6nzNvRFsoeF/EGxON3z9J6rKtVAk=; b=Hg6LaNMUXEBCjbyOU9FlFDiDrJ
	sp0OVaJmps+Xkio73DuH9n9sYO+xiNzN1K4D3yBcRcxVONEuY/2GrF6DF0H9/tUEqsVSmBbQcQ3/M
	SeVUJx79voCUb7lPHT/91lUYD9pMjMybm7BUcgbAt7AtZFASdsqZ/nExEqG7plwHOU0sOIEVmhATt
	fTXUceDwQjUoRgjSkpQ42wMHIPtFeiIaAKVvIQdvDYLMkXC8Z1C/Svp7o5jMjoRvH6ij5CWp73nL3
	TOmlcTdfc5KxtjhK+abZm6z4T6VniOjbhgwrPc4Aia12LKGdeGqRQ8O3+aCP9+l1+uNDTMu/obF/F
	3Yg4lIXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8sW-00000004kkp-2YaW;
	Fri, 10 Jul 2026 10:54:44 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8sT-00000004kjm-2oAO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:54:42 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so599444a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 03:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680880; x=1784285680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j4ZVGeRqKMU3nyf6nzNvRFsoeF/EGxON3z9J6rKtVAk=;
        b=OukROMNl6G9+0Sz51b/qskbPekfnanlrOuJ+ATJgee5VTl5xaeSNiUP03RDdCmPxFs
         ifbcERBHmLezhx7MPh9WK7yUzoGcm4kkaquS5Nt0+lxcpDJH5qOa2fJNVSwotY/zV6Hn
         O+n0v6SkthbzKBKWs2eVHnFPuJQfN0TWKPR0bxKBqxteJ7JuddrLrvyd4aBBgRRK1Q/Q
         YTS3J6XbnE/M4oOF8WwUeNvP5JXnYRDMvpiDitWPIKmI725ce1ap7kJsxtJAQFf9aLEW
         Km50fYwYntxyKMiDAz8Qb725j+CoegDXJK3U/joTCqUPLGg2h6PIubh4r86LSuF8t1uo
         K4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680880; x=1784285680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4ZVGeRqKMU3nyf6nzNvRFsoeF/EGxON3z9J6rKtVAk=;
        b=FpcmF4AnWlD5FOMUMqP98y26Us2Zd1Ea/jRWG2/I6tfJGrQ6nPJzuVnfVuAbi26wLX
         4PRnOeCWRohL7Yb0qF8T41fOvovlzyh2GTYYvSey1u454hLCTRl2HNZbEHxG/QARmqL/
         vkwQ+3kLTpSy5E1j4a83kHbEUPkt6l0y/+ZYHT7mLZ5u2olCi+nrPmwIbgQ+v4Hh+v9z
         YRPkKgeXTaZozYW6HSGCoYYX9a87maTvu+h1bTR/xoc59QTm2eOLoDrsy3JzUQekDDaC
         F1UXybZu1okwDehGtOdY3Rn/JlzqQHnSerHkX9zVpoMtWlxXWTBZ9kf/Al+J+lcMx9M2
         2gLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr77JC4Qjf8c13tyLc0atn/dLGE1z66UjHc8lEmXPfWz0DvFgjm3oNsbclc46gQHiOJ4C1CuZPUAGYe7ttfeUlx@lists.infradead.org
X-Gm-Message-State: AOJu0YzdsbXpJNSlOw3nhurCiv+1HD++WHGorR7bLeioRAakS8Nx2htz
	BcTuaxDKCF4U78li9rL3O3Q6EPO2rX1uZmz5pkGewJpmEw8Yyz4ig8VO
X-Gm-Gg: AfdE7ckYJw0vPH9EkH1CrDeJuP17+xh1ACDfjh2ndzd3i33ztPcU+y8AEFv3Pn1LVa6
	Dzv/v2s5hPqtG64FdAVBMFG4IBe1YIiecZJ0Wal0hT1hG3hMZ95pho3Vx+8Nz0ET0gUkPw7ZYdP
	tn1QN4Ci4xpyoTYd/FL78O3JXuZmYZuvcl1d/9O8N2V6N1/0bS6w3KeYFWed4/MkieAp3mB2wtH
	+F3kDZoZDamBN0OAKoL+Qqzx96hcGo33Xws0QxzLUS/gmCkJjveFYbRIMVg8l0YSBxKNY85uL9C
	rgwVDh8rWSHq+nxMq9dCBBaomPrY9F3VXsgOICKnOfgPH9pHTZLUCGQV0LDa5gTVUn7ka9Gwzyq
	+4KaiQBDGIPTKSxDONVJZB2Ezv2dEAp0CFLBUK89e8hePcL1gXaQZfxj50B56kCA8FgpMvxOqBR
	76LUOsE/rvd/TMAuY2Sofp
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1a:8936 with SMTP id adf61e73a8af0-3c0bcc4068emr13266820637.62.1783680880360;
        Fri, 10 Jul 2026 03:54:40 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8572sm40752937c88.9.2026.07.10.03.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:54:40 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net-next 0/2] net: dsa: mt7530: add EcoNet EN7528 built-in switch support
Date: Fri, 10 Jul 2026 14:54:22 +0400
Message-Id: <cover.1783680864.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_035441_707623_119A7596 
X-CRM114-Status: GOOD (  11.30  )
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

The EcoNet EN7528 is a MIPS SoC whose platform support is already
upstream. It integrates an MT7530 switch, memory-mapped like the built-in
switches of the MediaTek MT7988 and Airoha EN7581/AN7583 SoCs, but with a
true MT7530 core, four Gigabit PHYs on ports 1-4 and a CPU port at a fixed
1000 Mbps full duplex link.

Patch 1 documents the compatible, patch 2 adds the driver support.

Ahmed Naseef (2):
  dt-bindings: net: dsa: mediatek,mt7530: add econet,en7528-switch
  net: dsa: mt7530: add EN7528 support

 .../bindings/net/dsa/mediatek,mt7530.yaml     |  5 ++
 drivers/net/dsa/mt7530-mmio.c                 |  1 +
 drivers/net/dsa/mt7530.c                      | 56 ++++++++++++++++++-
 drivers/net/dsa/mt7530.h                      |  1 +
 4 files changed, 62 insertions(+), 1 deletion(-)


base-commit: fe3e786ef4eb6e47d2901f568a27bd920477bbe9
-- 
2.34.1


