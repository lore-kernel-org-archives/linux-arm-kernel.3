Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1042BCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 05:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jioEM8sc/Fzgkrp0vJeZMT1J+0xGB47NBaMa9VdZzjE=; b=XEY0ETz4cJsJ9eKqFatRIRrazY
	TB294ih/F6omWLWN9lngMgo7nEOrzCyj/+f1qMGq/SqZF2rxnwOhJ+PgKGsH2lDTajJHvR2DuH9zj
	lFFGR5nvXoDw44mq2oJLKKSa2Cq74mc7IPl6EehwrKH54nqEoD3UylvTISBrQ5v+L/a8ztUzkWcWq
	k4uR8osoMbo8aiD0L/3Fc6RTZkopKG+TePNuLwm+OUIyJ06AuvRrgH8J4Gy8y6uVf6mumkbwVV6Zw
	BVUkvRLvCcPBh9rGUX5tGfXR4kqLk9ISUNiEg8VlhmniI6d/Uxh0HWLpabofH8dUIRJg2nPAyz5yO
	QIOU7Frg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBZ6-00000006pSI-33lo;
	Wed, 10 Jun 2026 05:33:24 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBZ3-00000006pRP-42rp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 05:33:23 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c0c20f0c0aso48832175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 22:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781069601; x=1781674401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jioEM8sc/Fzgkrp0vJeZMT1J+0xGB47NBaMa9VdZzjE=;
        b=kX+Smj7YpU0CU4VfTmDQ2EPi2OZLwUM/6pb+bKf/yjB1qt6VkMFOfUrWkgZUbQeQPk
         bx3EWAHTt+ggp8HXT9P7lmQWp+5OayhHeoGuZTfCP5GE58SAeiLrRx5Qb9XunYCN6wmT
         wN5hLC1X/CfXny2W2Kys37sUVtLjzNlKtMdtMp1iCm0REav22nrTSir4LB7dV7CosM9A
         kZljVaNflGe06NpvZxBCVKfrM7oo2TWy8Ew39d3a6Py3Cd1dQUfaIy/iD6uebpv/siM7
         Hjb1/saVGkZ/QaClWGllfYoiy4CmRIavIIle/MN+zdBnd0PgC+u885ESHom5V78fwCXM
         LP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781069601; x=1781674401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jioEM8sc/Fzgkrp0vJeZMT1J+0xGB47NBaMa9VdZzjE=;
        b=kC9SGHKAkPhMkIU0LVPYIce7Pnd+mwWiU5+hNr3eiZI/izqUIMV2fwCG4pdol1kcha
         OVa2RST+qdkaI0HclC5ryZEmU6EIFC689S+Uf0J+78LEdA2Mkrc0TULCUivAM+ACGzNB
         yKSKMojul0hsLV7nhK8/YPYellmW/Ak+rZM01VS7uF8yx0kXWRtVTspp10Oh2Nn+4jGV
         dgeu9H46PnPKWOSjoaRS23Wtue2cGmrJZW7LQgUmoQF281kYiDue+6Z94FTBtbtpQXIK
         dbITmBPt8bgijnhC65/hCYaHX/KwZ9O50L+pAN/IaV+dOKamNUzRQc0hi1YWYJWT2YV6
         tfHA==
X-Forwarded-Encrypted: i=1; AFNElJ+BufrHjiqWNSjyrt/mmbiICru7JI80Bj3J2D/HlkX/DGo7/IPnpWEZiab9gRT46zUtFR1zQzMGk/1+0vVWkxDa@lists.infradead.org
X-Gm-Message-State: AOJu0YyrXAwBqwN6yE9wA2UroAAQJ53RPpBchGv37UkQplIJQ5CNgKrQ
	zqJDTJ6eYMVQh6rxTzIqOLbgYE8dkEA4W9MQD5iZeUfg8ww6JUJY+Ha/EbWlQoQr
X-Gm-Gg: Acq92OFaE12lRTOWE8LtA4XCfB5k5qFEQcizMEi7RBLjVH3M6tNoJI+w23UWV5ECOIQ
	H2dOrVam9HlspkrUdpLkvGaF4q8+o+mhO63i+ISUEcwFF9TVclb9rK3Srkw5wTOfUsIUYoxDWrN
	KZaYeXRdcah+CeG/xZdg/PyXq1x6whlXzOaydPBysq5iYYKNpG3yNpVN+mQd26K8mVEFPHqXQUT
	lttyHwqm1ENsiY7vXPHxLgygZS16kwbNHT8gcfHJ8fjXF8t0ildYfsmULxRf9HC7yww9FuT1lq0
	MYFjrwkIxdWM/MWe4GsJ7HBq4qssKAC+dr2EL7uj4IWH2icDW5EpAwS/UteTae7UrQw77g6+DZF
	e98ZdUQgezGFM7aUeYzRjv4vbC9EEeFBRXA29oLjCbtnT6PxZ25TEFh5oNokcwuqbgzD83G6Rs0
	bYyT9XfcYDA9HqyRp7RxSaPTSdkaqYlMu7xK7SoizBsYwDpIUo+VAL5vuI3D+K1cJjTVDyLRHFi
	cqavvErQyBOdXofrDHBuOt3bXIB9x0nKLg7cZKjn7iJEyVSR9RKsQ==
X-Received: by 2002:a17:902:fc84:b0:2c2:50c7:58ab with SMTP id d9443c01a7336-2c250c75a8emr165133125ad.23.1781069601045;
        Tue, 09 Jun 2026 22:33:21 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm242862735ad.27.2026.06.09.22.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:33:20 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Daniel Palmer <daniel@thingy.jp>
Cc: Romain Perier <romain.perier@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 0/2] ARM: mstar: fix two device_node refcount leaks in mstarv7.c
Date: Wed, 10 Jun 2026 15:33:10 +1000
Message-ID: <20260610053312.2267307-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_223322_021604_A022FD0B 
X-CRM114-Status: UNSURE (   9.44  )
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

mstarv7.c leaks the device_node reference taken by
of_find_compatible_node() in two __init paths: mstarv7_boot_secondary()
(the "mstar,smpctrl" node) and mstarv7_init() (the "mstar,l3bridge"
node). of_iomap() does not take ownership of the node, so each is a
one-shot device_node refcount leak per boot.

The two leaks were introduced by different commits, so they are split
into one patch each. Both drop the reference right after of_iomap().

Found by static analysis tool CodeQL. The series is build-tested only
(arm, multi_v7_defconfig + CONFIG_ARCH_MSTARV7); I have no mstar
hardware, so runtime testing would be appreciated.

Weigang He (2):
  ARM: mstar: fix device_node refcount leak in mstarv7_boot_secondary()
  ARM: mstar: fix device_node refcount leak in mstarv7_init()

 arch/arm/mach-mstar/mstarv7.c | 2 ++
 1 file changed, 2 insertions(+)


base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0


