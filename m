Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE02C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4KRrR5InAG6qbH+2o0ICn/FfbIaKM6RpEitfK9J2zk=; b=OwAsNvrR1WUReY5gIzukFJffhW
	9sz/m/lZBsxsBWuM6GYHAOZuBG0IWr26l2hp4bw3cJWS42KeRy4wFdvuV/+eY7mp/WXRL4TOUXyCm
	H5mgSfMXOkqlEBqL7VY92H0hv+WmhKyrMsV3Ke8pfECrhcmi8IZDgBVfbPEFWMT2NUnDE7P6qQCk+
	fYFuMtj9+BC32TlaETAOhVR3W57VnIoIy61kLp8AsV/MMTJeLzQwimV61or+YxdWG5n75zP0AM2lw
	HCjf4YExsLoHXG2bpcyJGJzi4JBygOlKohgJcctbljhyVdgMW8x5SswJ2QwYSs9GwnxBGumEJZnnV
	gWsNKDgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8DG-00000008iha-09Ls;
	Wed, 29 Jul 2026 17:37:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8D7-00000008ieG-1xtS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:36:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cacb8416a1so13207285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 10:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785346612; x=1785951412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4KRrR5InAG6qbH+2o0ICn/FfbIaKM6RpEitfK9J2zk=;
        b=TG4EZtyTF3SDmoQ1gO1DuzLzGHsmVkRMdzmpXzBl88g81zCL2D0CIxAXfsU5UpSizQ
         C6Zn0q02xraBLPuDjW27xVMiDcgxGBcgvmggQRV87V90hSx5TS+4CEtoXYU87kvSu8CW
         +6Yv832PL0689DQDn5dV7HzbZrtZxT7vqaswmVO7S6Dvn8At3hFuY77kRs88whfqkHgN
         E7rGqcQHpVVghAzboNdxS/30nGsyzJ0jVdsu+iSijoiwCRy7AVplyrlyZWPIf7vnihlY
         w3FqUKsew+80z9M4qXSLuAwz0IbTxWhcBnYzfPgRmc8dXQmyIRbzRnZDBpiPJg49qV5f
         wd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785346612; x=1785951412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4KRrR5InAG6qbH+2o0ICn/FfbIaKM6RpEitfK9J2zk=;
        b=qs+NR8fp3nhs1Sz7qWAylWY8jQZGTdfaPK541pS6y8bM0VEFLmcgijqBuln8zt/9yv
         mgtw6vySr3Y6TsgxCpSOyeG8n0pQEz4T6OvhypOwU5ECXb08HpIADoFe5GZ8G/W0jzIv
         Kvb80VXzbYeQJ4PyTt0kQEsVFOz9vbgrpZFSKgUqEzy4VUZoalUzwefNfyGy1IqXhHxZ
         84tiIC0YGpORAEKnmmQO3QIxPw4B/y6y4JHPnh3+4nvK8fUAEPqqBrFESy5CVdUlWzug
         qy6ZvHzdWaK8IXN5vL4r1IXjObh+o5vPXou9zPJFKfd1aUnbPlZt8PMXKSyV+ky1iQXu
         9VwQ==
X-Forwarded-Encrypted: i=1; AHgh+RopCn31ML2iofBOTz0OEDWrXWBShVr42E9peuKsThMsJdZoCz2eaEx2gvPB99/0Sb2QDTN9ZCZ5D2fPVfv9jarU@lists.infradead.org
X-Gm-Message-State: AOJu0YxFEp/hRqSZTOYqoaCroOdpNzKimGzjgvQDH2U+LY3vcd3Xc5FL
	uoi21XPshySKItZyzaMGwEWIsTmwmZpQBNbp/mn88PiYaoYuzUpbeWUK
X-Gm-Gg: AR+sD13/+jLvwUypZLMSYz5rumJ71yxFgv+kvs+qSHXfgTlr0XNRY7iymCN/fT7y0Sj
	jP19GJPNCQjrWawhHarjElBtKzdIEStzXMai/Vs1W6DnIgwSarz2qQ1mtnVcTpoqST20upBTRtd
	osl66Ci9QTp/i5idWWT7fViSyhOuz8AxQZ/2yJQw4gwSIk/PdvmtINrb6+49eDeE5z8cfsBZ0yC
	klEyPTmii/TbJUmlHdkJuACY6tKvT9oanH+yxIOKHDEsVfBD3hbp3ZlDS5NaxXP6HiYL3qH8bK7
	wx681c++8nFRXwy48i6UCUPPJt8T2z6zt/KE8varW4Jx+Q18N3ww1/saoAeBaw/kbBSbU/EZJwo
	IsoA+o6nSmDFAkANhV2Ekbu4siCdj4nvQAAcaqOPWGnW4LJvBkOF6ZQOSEyDcqDCGmc4Z0GxXQB
	1bPnY5RVnKD1TtzzrjgSi7RAfCE7Hu9jFa7GJ+DGLlzpRNNoEmUw3mugG99zlig7HmYsg9yUgPH
	hW5zcVC3576ENAo8UHUy8zxeA2Zz6Ny0GVFqw==
X-Received: by 2002:a17:902:d2c9:b0:2ca:cde5:29c4 with SMTP id d9443c01a7336-2d015db90afmr81414495ad.47.1785346612435;
        Wed, 29 Jul 2026 10:36:52 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([120.234.91.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39cdsm14806045ad.55.2026.07.29.10.36.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 10:36:52 -0700 (PDT)
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
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] wifi: mt76: mt7996: unlink TWT flow on MCU add failure
Date: Thu, 30 Jul 2026 01:36:32 +0800
Message-ID: <20260729173632.14387-3-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260729173632.14387-1-enderaoelyther@gmail.com>
References: <20260729173632.14387-1-enderaoelyther@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_103653_529797_0E369C5D 
X-CRM114-Status: GOOD (  13.80  )
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

mt7996_mac_add_twt_setup() links a new flow into dev->twt_list before
asking the MCU to add the agreement, but exits without unlinking the flow
if the request fails. The flow-ID and table masks are only committed
after MCU success, so the still-linked flow is invisible to the
mask-gated teardown paths.

If the station retries the setup, the same slot is cleared and its
embedded list node reinitialized while it is still linked, corrupting
dev->twt_list and potentially preventing a scheduling walk from
terminating. If the station disassociates instead, teardown skips the
flow and station storage can be freed while the node remains linked. A
later scheduling or debugfs twt_stats walk can then dereference the
freed flow, resulting in a use-after-free.

Unlink the flow with list_del_init() on the MCU ADD failure path. This
restores the list to its pre-request state and leaves the node safe for a
retry. Mask and agreement accounting remain untouched because none of
it was committed before the failure.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Assisted-by: Codex:gpt-5.6-sol
Assisted-by: Kimi:K3
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 0eebc8182ca9..445bd7d63cc8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -3207,8 +3207,10 @@ void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 	flow->tsf = le64_to_cpu(twt_agrt->twt);
 
 	if (mt7996_mcu_twt_agrt_update(dev, &msta->vif->deflink, flow,
-				       MCU_TWT_AGRT_ADD))
+				       MCU_TWT_AGRT_ADD)) {
+		list_del_init(&flow->list);
 		goto unlock;
+	}
 
 	setup_cmd = TWT_SETUP_CMD_ACCEPT;
 	dev->twt.table_mask |= BIT(table_id);
-- 
2.50.1 (Apple Git-155)


