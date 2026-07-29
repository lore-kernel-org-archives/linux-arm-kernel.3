Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E414C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r9lmLVYjr93Girs1odAHEeMDnIJQvCQg1I6d0OHkOeA=; b=2nHKZ+O13jrFsm8FF9UXCDdW8u
	lsbnwUW1BiAkgwNKKAuaFYCVl4mDh4bl12u2nU5noeATSQ6NJCE4O16R8Va6YHgg9aFSfI1uMl0eP
	gQAqPPcm72c3TpjW763lDsSfmyywrb4ldkJxmaLJHRb6Wi+bRy+JgcfethDGrW5kfvlj/Tar133p/
	iC1Wi3nj1WOs6MKamWo/KMEoXf3QzkkpviFIJuddsDHreqX/Wz0/WGOJI9Ejsx4+rz9Y9GZg2Ojmd
	YfrSJy3GDFaMf0Nsi4RLg5g7t3AjJtarXGi4LV0y6MJnYjkz4UJTxx1I8gg9OYzKZFCTiFdY1/nJk
	Mz+i51tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Cy-00000008iZD-2mHN;
	Wed, 29 Jul 2026 17:36:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Cw-00000008iYP-2i2Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:36:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2caea3f742bso16110865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 10:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785346601; x=1785951401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9lmLVYjr93Girs1odAHEeMDnIJQvCQg1I6d0OHkOeA=;
        b=ThspChvjEWTerxF4v+u36gVNAlUck5mMrPZvSjzCM6oHm7KQur9OUlPnf+aMey/WCg
         e9GibLFOHtEcXsh45fR7uQ8FfAy1Y2S2OB67igFhvuC8WxiwlCSsh4FIMZo03qFKlU/u
         7FR3d5CTi60YvrR+6OYMLel1wJXZ0iak9cKsEx5KMrm8nT4DhUprtYOr+m04jNQ6xWKh
         5Ya5aehR/pUnIt0aIdZv+n/q+e9VlD3X/62Pfe2ePZbbuoZvjOAL3qFz1LZa1dkTybnA
         KNTTxV7VeIyJ4KAwNm5I/Rk4D7cRL+z1ZvUuZUc+pOePZYnTqDju3y/1EGOZGrYDWWHd
         mfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785346601; x=1785951401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9lmLVYjr93Girs1odAHEeMDnIJQvCQg1I6d0OHkOeA=;
        b=obBiETYcyFJku8Vi52joDWxwKZB3OT21LYo117HFFV/VfKiSwHmkDBRkqWojE6q8UM
         ipkpuJwfH7351kVPM0a1E1f0G4LO6sc450sJGfP1JUnZ5ks0PiIjmTSvQ2HpXAUG4S0Y
         5xtTNM93vsfMIHUu5Vyd9d5Ebq/plp18jSKNZ7+X+465RtUVnL6lLEe0xal+hyrw47VX
         +T992pSSBnRZm2twZcjp/BGV4+syvVxdHRu/kdYCYn1AtV9VlEVX86UkZlk2dkt4+Apc
         v28agDfNjosBusP9mHZAGcqNVJZGGE8KXuAtXIFdjUnY5sqGT4xEFUZ3KPecXnfwgfER
         mW/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrWCAdS3oV7tpFU2YS6D/Yxcl9yMnrqJQOWCEUp8FtIlOcRClCgwk1jmuZz+ZUl24n2JW8RwaKMMTR1rHE6SDVP@lists.infradead.org
X-Gm-Message-State: AOJu0YzUvJoQNE4bW0nRgkxZBB0vtBxoyZRokIou886Hr+EP/hTeicGB
	bzXD3nM48e2AYMAVsEnok3ee+LEPDh2SOgSZh/hwN3GcC/lfA/RZQqF8
X-Gm-Gg: AR+sD11YaJAnscFevQsApazupiKjmg3SNYUFHiujMHmBxjtnAeVAKbeI3W2xbxs42E1
	w+Npv/U4gePYQ054RoofTk8WUv0Rg8FSOhAc2zmn4WDEVnNbJf61a2AD541cc+8UDAPHz5cmlgq
	ONL+Yd89elOFSUh7T0l6mUQ3s7E3Gkomvk0hT+j/QUz0uo6Eec+oew7A2x+ttFet7kNDLdnxJOv
	ghHVgy/kiEA6ZtpkX3lu1QRsdDOeDGnquVMONXe0xp0VUVl+4pLvAixpQTulRQy4vSEclsHXJTS
	OJxPdJ0weH0jdgbPTuNnrZ/wGmR1Y1ZiW4xPTc38U9qZPBPIsJDAUZ07QE11b2tlrHJIGiEcfYF
	EktHZ/ldQDQsd/UnPaTrOrrRBgNM0lkyUeoxywlbCqysQP2VmwPAnO6HV7AEmdfm2i6FmJkhW8V
	98flFEBH/rnlIy/2JIouyk7VJ4G6h22sLYmowbcH6cIIv7iZkGLOP6aO2jhxB6/UR4Y41VQltY/
	lahK4Lb2tr9eO5WS75+r1xwA/ajdIbBkwiYOg==
X-Received: by 2002:a17:902:f54f:b0:2ca:f40a:be76 with SMTP id d9443c01a7336-2d015d94cb0mr78650655ad.36.1785346601182;
        Wed, 29 Jul 2026 10:36:41 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([120.234.91.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39cdsm14806045ad.55.2026.07.29.10.36.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 10:36:40 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex Lu <rex.lu@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Chad Monroe <chad@monroe.io>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] wifi: mt76: unlink TWT flows when MCU ADD fails
Date: Thu, 30 Jul 2026 01:36:30 +0800
Message-ID: <20260729173632.14387-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_103642_688886_25749F52 
X-CRM114-Status: GOOD (  10.03  )
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

mt7915 and mt7996 link a TWT flow into the device list before asking the
MCU to add the agreement. If that request fails, the accounting masks
remain clear but the embedded flow node stays linked.

A retry can corrupt the list by reinitializing the same linked node. If
the station is removed instead, the mask-gated teardown skips the flow,
leaving a dangling node for later scheduling and debugfs walks. The two
patches restore the list to its pre-request state on the MCU ADD failure
path, split per driver because their Fixes targets differ.

MCU DELETE failures are deliberately outside this series. Deciding
whether to drop host bookkeeping while firmware may retain an agreement
requires separate ownership and accounting treatment.

Zhao Li (2):
  wifi: mt76: mt7915: unlink TWT flow on MCU add failure
  wifi: mt76: mt7996: unlink TWT flow on MCU add failure

 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)


base-commit: 57aa1718d5953dd532137d43b696c68545c2e0b3
-- 
2.50.1 (Apple Git-155)

