Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7872C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oYD8vxjOHGuQyZYPR9PahIsl2VjFcOZPUXc7tvdpKVw=; b=07WEnafXbgt/W3VHkjWw7+5Igo
	XEsfnz79d9xXfXDU9YeOZk/oEBm51YrqtzZPZOJaeNwOhHTCOEQ1bVL9XFcZiqYXiHvCPdpEkFRIS
	mbHKO0pFwg+MZv/pxPOe4VOv8rASYGqXJW4gy0+QnoVK5SUN0+0ckdHWWIuziPS4RbheWFCMZA+F1
	cTjfyOk7gFb0DUSy5mL5+tttBJFThtXjUjbIwGIFtEMGrJXpahZrayTpGsOAM0aXQqLC83VE3GgOq
	g9aKpv3eHxko/wNhe98JdgTHHLkT2K64TMwC9rUdYDsBGke4qKiYjGw9r6GXGbMVKZ7qV01USyykD
	4STb8LoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMHy-00000008K5e-1qBb;
	Fri, 07 Aug 2026 15:15:14 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMHv-00000008K4O-2hiF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:15:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so51929025ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 08:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786115710; x=1786720510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oYD8vxjOHGuQyZYPR9PahIsl2VjFcOZPUXc7tvdpKVw=;
        b=bsq2klDf1qmqeL/uMdpn9LS0c/0atSF0Wwd3HlqeE18PDf+Csam2zEFFgacw+htXia
         jSYGm1Rtx8btnaCqZ1whLF+SLLldWYt/frIn/77/JEuha+NGajiYqfT4kPTbr4Vq+GI0
         3XnaqqUhIgfeuJkjYIithhrvFY7kBlfBz5MrIDKKhybSOv9Ly8UaPV2e3/HC4dBv2YpA
         Qvc9oDPjNsXO/g1xRDfCkJCKJMqYUsW0hsxVx+8erMvL2QVqYs7n4hp4YUVDaV5ZE+E8
         QF2lelZHTDGqv8WwVAoDMUdV1OBZHq1KbOACP8DWHYnZ10TlycrVyRKSTJeVm189dc9P
         2Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786115710; x=1786720510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oYD8vxjOHGuQyZYPR9PahIsl2VjFcOZPUXc7tvdpKVw=;
        b=n0g5AE1r+2DoAjWAAl8hn+INP8aJsPujesli6dx18HeBjXlTozlKftte8ynxTWoIgD
         q3hL7F6Y1DV1o2WQTT11h0K07kyTt74jcsbJGS0S6DRF2M0PfbGnMIGkrew0a7sespAr
         QGOoE9i1SIAwa/CSlFLsi+Ylf7Y2eQicCKV1xdCoSKGKTnulU5snmpO2SGRhZ9/aPldv
         ubiBidnMpdm6HYmfpH8jkO4hIpDLJWvZvDc/6+xkDd9clL2HgPCIa4peEAmmDMTqkQQp
         UwMmUhoGudNPGATaU3/SmHRfGSXo1rB+wNd96Vr/aoF0niqWztPAPoPa5uVQUo/3qDqn
         PzBQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHWiTTg6vM9VkULyhaNQuo/obzNU936nHdI/uUyT10wfdQB0pTTWYiOJdf+/ri3E805bpWZsDI38UX3xs7V4wt@lists.infradead.org
X-Gm-Message-State: AOJu0YwS+tyHvIo35IJR3mvsFXGlfxjx6AvLVpmjtGkuRhMb9w2UPmY8
	oCedNs/g8AOSzNuHPy9gHrQfX8/K/fNVFgMV8jqGiCzKI4qIFnyOvcHnw/jgPv0mOlQ=
X-Gm-Gg: AR+sD12uFk3uQAQKhLFIkibacZitjzJBJpY9Na3LYcNHeuQN6jOPKnCRice3nz3LOVm
	IKr9daKqbz26IKG09muYKNB1LZHFwgtYS3NUNMZSEo6Vd691dJQA2ir5C9YGF7z+CLSwmQaupF0
	vtLgafJ+QzvU3PBgoCM1mO1imoVO8ULXdE83DbCpqEJMQkiAc4PRbUoyZubP3rmu5QUj3m94Irs
	LMcFzLMKusGcDaRRbOBw1B5KVOtgAksaZFdIvoXOAvunk+r5xr4CY/kn6asb/htYZCCdA55Y2zm
	RMaSdJrZ7y5oqQU0D4kDGUwpdLGxQ7Dax9AlawaIrXjyqrQM022nhL0fvtxdQDOFwBPLqTT/4rF
	SwZ8UoZL+UGqDqFiFy1uqRkI+63MP/9V7JP4hnVtfaFhlA5AO0CcqKiYSA4UhBBEJ89uSjFLey1
	gnZgZwzsL1yPdMadaBwIjUnC/p4az6lVNu4ymwK1tbCUCu2NysG8CchJm7NQ==
X-Received: by 2002:a17:902:ce0e:b0:2d0:cc92:f7b2 with SMTP id d9443c01a7336-2d294b293d0mr61010985ad.1.1786115710098;
        Fri, 07 Aug 2026 08:15:10 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccabdf5sm10829965ad.14.2026.08.07.08.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:15:09 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] Bluetooth: btmtksdio: fix usage_count leak when autosuspend_delay is negative
Date: Fri,  7 Aug 2026 23:14:47 +0800
Message-ID: <20260807151447.2530075-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_081511_684604_C3CB9F8F 
X-CRM114-Status: GOOD (  12.47  )
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

btmtksdio_setup() calls pm_runtime_use_autosuspend() when runtime PM
is supported, but btmtksdio_remove() does not call the matching
pm_runtime_dont_use_autosuspend() when removing the device.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during driver teardown, this reference is not dropped and usage_count
remains unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call in the remove
path before restoring the runtime PM usage reference.

This issue was found by manual code inspection.

Fixes: 7f3c563c575e ("Bluetooth: btmtksdio: Add runtime PM support to SDIO based Bluetooth")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/bluetooth/btmtksdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c6f80c419e90..4e1012e90979 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1480,6 +1480,9 @@ static void btmtksdio_remove(struct sdio_func *func)
 	if (test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
 		btmtksdio_close(hdev);
 
+	if (bdev->data->pm_runtime_supported)
+		pm_runtime_dont_use_autosuspend(bdev->dev);
+
 	/* Be consistent the state in btmtksdio_probe */
 	pm_runtime_get_noresume(bdev->dev);
 
-- 
2.43.0


