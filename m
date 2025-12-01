Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634D8D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N8ah7K9QBZgVHJunjh/RbCQgoXUT9r/YcIZqeujeIYI=; b=Zj1DinvgopBSzBxvezkFTuybPp
	mgxAVXKi5DZkH4GGKL9PcRJBjbK20WnOFSdbxApGOwD+Y6BvhK67LRLAcJbenCtIOZ/8pJO5o5jd6
	z3AnqEtMinCwXoKPx3r4pI6WAnCMHmfb4/8A5dp+XP1t8GkL7yGeEMrQfk0/YuO2aojz9kkojLGMH
	mm242dbRTTM0xbm7+4X906lMlpQm5fEdZ5oU9RUiDxmvOBjERxUOqshH8MhCbRoW4Wo4snZhugYID
	YCOZ7wGG4Jilck9TsUAnhbQiWz/Ft2U/htXobGLtXP3TYH04Tn57D8gVSTyQoZfDhTWAw3G4jN9IA
	CdOwycig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzp0-00000003BOT-1HSi;
	Mon, 01 Dec 2025 09:03:50 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzot-00000003BMO-0hcw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 09:03:48 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42e2e5da5fcso780671f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 01:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764579821; x=1765184621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N8ah7K9QBZgVHJunjh/RbCQgoXUT9r/YcIZqeujeIYI=;
        b=kTNiwCoy2t7tLwj4F4OzovWh8CdATn7t/6EFJIq0uU+YHpN6xEpoqvwo1UH72YX+Sh
         QMpgHWhluRTyV+OWQ6aAHHc4d6uyg6pp8qUdGEoP0LO1w3vJP+SiedpvJNdbUX2j5NWF
         Egvak2CbasuXhz1qKxikMmPsEvc2ElJwCxgJGXHppiis2dtiYtJHKvhORURYV5m+MhZW
         2urEqlq6VOJkEYwZgmScdD4xhNZyWl6fvH+T6gcT9sCiGh+5Zmij/1wDLJFfSir0wwcE
         8paS66V3rAV032T8MCUMliPu7X/o77sSRtGkJLsgyh9vLpAdvg0+UU92DZPSFotOI/PV
         MMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764579821; x=1765184621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8ah7K9QBZgVHJunjh/RbCQgoXUT9r/YcIZqeujeIYI=;
        b=vDMDj+RERhnV+wS1D5Gz0t8dEApU0CgRlp9n4Ft6NY3Ct4MO710t1xLXUauQOcz+2A
         3TR5yhge5JbmSv6E8FG+JrEvw1hHS3HPEMSHXzUMbLbKpLkz1VI1X59m/YSsPtj/cjt9
         rvv8DgZUy4wh15cDoAg5BN7scsqMHbTFXt9OfiyqTUb6q9Wni1/Dq7dASdtfZ6yGlg26
         8Tfn2R5LgoCEqNya28D/DegHMILJC5OZq6LQCtALsmFdQhQtb6JNF0QqlsUTaab13qft
         Ep8YUQ1GFXGOcXXw0bst6SuavQcf9oeUHjpOFJsUBVS51g97blhc8+6jEDSoclPO0/H3
         bvWg==
X-Forwarded-Encrypted: i=1; AJvYcCWnCNJBDUd9qMggNXbVbz7qnznwIPBy6abqYVbi8WQ4RlL2dQn+JYQEHj7jF7BgJ2wdIftrSsjB1GuWC3MvBuLc@lists.infradead.org
X-Gm-Message-State: AOJu0YwbveeM5/Ck5hE3pX7paQNdX42E2/SGRYYaX5o34sqs73BN3jDX
	JFbm+jV0iAm7P6EqvvlYvqXcV1mU2dTJemD68W/+e1vmDM4NWMVgD4gi
X-Gm-Gg: ASbGncsPoh3b96b9ucoFbZs8oCT1RIhkmOrJDa6rb9VQzMEt+U1Y0KjN+FerhZbrIbE
	PS5VrcF077HKSol8VE/A7cIJpn7CFrQZwjjtpjMUZI5UkhnnFDNyqN9sCOvhs8JkoLKzt5U97Q0
	XZ76NhcRccGFWrKqysywEK1iQoaI5Y9hczzr4wCd7HomaNaY33FncAVGbzDQCBdrjFQO1PXyqnf
	Ln8OCS/PbQVicLJ4zHAx6H2yd/BF5AZddTnUINnEGq8luBMSe6QlNEWYFVj5hv4cACJIWLGjuxc
	q5z7H80URcIsMpxOf3YJPrl+1fLgHQOUlE6sEYaF8497eL5ioYYtjBI3vdoQuz/MOr8+kw0xVci
	wm6QE5jYMZn6YogWeRyqhyC89rkdiBoFDV1D+D5Xlj+WCWzCa0b0WIWEnft2rp+1tTpdWSSZPpO
	29+Hi0x1CrM7IthUM=
X-Google-Smtp-Source: AGHT+IEcydTcIwCjbQRB0nGuzNXPZzp8lCn4+RYJcX/cAtCDjD/66keOoi6DpdWSWTOQpt+wcZtEcg==
X-Received: by 2002:a05:6000:186a:b0:429:ee71:2ff0 with SMTP id ffacd0b85a97d-42e0f362435mr27273212f8f.53.1764579820669;
        Mon, 01 Dec 2025 01:03:40 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d607csm25334499f8f.15.2025.12.01.01.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 01:03:40 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH] wifi: mt7601u: check multiple firmware paths
Date: Mon,  1 Dec 2025 09:03:36 +0000
Message-Id: <20251201090336.1157193-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_010343_219782_4E9C7D4A 
X-CRM114-Status: GOOD (  16.11  )
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

The linux-firmware repo moved mt7601u.bin from the root folder to
the mediatek sub-folder some time ago, but not all distros create
symlinks to the old location the driver checks. Update the driver
to check for firmware in both old and new locations.

With firmware in /usr/lib/firmware/mediatek/mt7601u.bin):

kernel: mt7601u 1-1.3:1.0: ASIC revision: 76010001 MAC revision: 76010500
kernel: mt7601u 1-1.3:1.0: Direct firmware load for mt7601u.bin failed with error -2
kernel: mt7601u 1-1.3:1.0: probe with driver mt7601u failed with error -2

And with the patch:

kernel: mt7601u 1-1.3:1.0: ASIC revision: 76010001 MAC revision: 76010500
kernel: mt7601u 1-1.3:1.0: Firmware Version: 0.1.00 Build: 7640 Build time: 201302052146
kernel: mt7601u 1-1.3:1.0: EEPROM ver:0c fae:00

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
The firmware was moved in [0]. Changes were requested to a previous
patch [1] but I wasn't able to find a follow-up submission from the
original author. So here's my novice attempt at the improvement.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=8451c2b1d529dc1a49328ac9235d3cf5bb8a8fcb
[1] https://patchwork.kernel.org/project/linux-wireless/patch/fefcbf36f13873ae0d97438a0156b87e7e1ae64e.1684191377.git.daniel@makrotopia.org/

 drivers/net/wireless/mediatek/mt7601u/mcu.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mcu.c b/drivers/net/wireless/mediatek/mt7601u/mcu.c
index 1b5cc271a9e1..c771bbf7952c 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mcu.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mcu.c
@@ -409,6 +409,11 @@ static int mt7601u_load_firmware(struct mt7601u_dev *dev)
 	const struct mt76_fw_header *hdr;
 	int len, ret;
 	u32 val;
+	const char *fw_paths[] = {
+		"mediatek/" MT7601U_FIRMWARE,
+		MT7601U_FIRMWARE,
+	};
+	int i;
 
 	mt7601u_wr(dev, MT_USB_DMA_CFG, (MT_USB_DMA_CFG_RX_BULK_EN |
 					 MT_USB_DMA_CFG_TX_BULK_EN));
@@ -416,7 +421,14 @@ static int mt7601u_load_firmware(struct mt7601u_dev *dev)
 	if (firmware_running(dev))
 		return firmware_request_cache(dev->dev, MT7601U_FIRMWARE);
 
-	ret = request_firmware(&fw, MT7601U_FIRMWARE, dev->dev);
+	/* Try loading firmware from multiple locations */
+	fw = NULL;
+	for (i = 0; i < ARRAY_SIZE(fw_paths); i++) {
+		ret = request_firmware(&fw, fw_paths[i], dev->dev);
+		if (ret == 0)
+			break;
+	}
+
 	if (ret)
 		return ret;
 
-- 
2.34.1

