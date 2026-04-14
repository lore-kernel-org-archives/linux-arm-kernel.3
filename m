Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B84ED7B9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJ4lE3Q2wssQBVVrqt8I0r/DTK6vrD7T/H67p6LSu2c=; b=AHfQi+D1UGES0y5TpZwpO3TPFn
	BsXfKG0zGIPaO6zqM1Kupzm7sOU35WatS4i4+VAhLTvaeNfZ5/ggbS/6tnqDcBUt5a6CNDcYvOz8C
	nMugddozcpdZCFUdoY/8J50cC8tAubrBkqiimVnc19DGb5oIFpP1dKiDglOxcNzPxKF802nt7JPBj
	kanyOwlXC/9KG5ijnlD0dN9m5VGtNHJJNYD7XQUDm1LSzUzQgqA2oFmI/AZY+wOIyT3kTQoN55fkg
	4IN4TJSAOSW1NXv4NOdfZiTLGAnEHH7xoslb+U1o52P+lJdBIrNcRg8PJcR9dRmBWRiXt6HshYb0s
	tGOM+7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5k-0000000H9fs-2lhy;
	Tue, 14 Apr 2026 10:34:00 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5i-0000000H9cE-1MQI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 10:33:59 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2c156c4a9efso7412595eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 03:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776162837; x=1776767637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJ4lE3Q2wssQBVVrqt8I0r/DTK6vrD7T/H67p6LSu2c=;
        b=Y4mAHsZq188S12sw/mxtL4/9X9hKNW2ZjF7HIr0aX8IUHQ3Asb78P59mwqbzjytwVu
         YZPYVMTLG7FguEZiPJr5iA/W8bhRvT7uWwT+dKQmqWI8knISgpgDgISSXtfQwkQRA83I
         Ehzw/axDnnDj/h3lMadcZjMU6FbYeo3b7zsDAOBzbn+ANHo5aXDto07UCI7gu0PXztEO
         7mUS9+RDbRcmMiQkzfjEyEa0rt8F88vFBhurUJ2aoCDlIh653g4d4um3ZdsT27TzbYmm
         YnLoGWTl0/da4dFasxOtHvb2uxCRSsKTkY3ATSltqymQSiwAEyN+GxYiBNK6BtaKbwif
         hv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162837; x=1776767637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJ4lE3Q2wssQBVVrqt8I0r/DTK6vrD7T/H67p6LSu2c=;
        b=ica3vIWnnloQgFwNclinEzEzcnoydkTHmYdX8ooDJ7sjblfEYmhRXefG43QRizXinX
         vHdsPFaESblr4SIGgZiGWUoOFmI4H/8PF4Sq0RIbWAj9C90M1hW7/ZwQnTZ+In5e8JhB
         9hT4ZAwCyoCCL6ZkwOEG1BNzeMiJwbsFhJu7EYZ5W5ct70w60xTkGg/E6hmXA099S5Gu
         TAuHp3KMaigF3xDqBCYrtUH4aDrVnt/2xWbwdlU+toyVLSvgfIO2BobSl7hQMVzlNnqn
         Wr9qfuEmoGwptliYMWeY7Wiz1KzndmiEtFZr/xXLhvkis95MnK+mQyPDvAc2o022Lp+N
         q/pw==
X-Forwarded-Encrypted: i=1; AFNElJ+GxpBf4rqUwCbS8Mv2R16S/g3I5nvm45IxkEc62661vrnEbuyXfoHshAL1HXJfVaW5qcZ0KwtlgC++YAyEnxX7@lists.infradead.org
X-Gm-Message-State: AOJu0YxOOLXHHCjc9ay0LYsHWhhLynopqmaJWopxLuZ/n+7uWclo684f
	MIcbJZM3EjzWphiz6lSZ4OxYW5tprQqOeJQ8V7OjjNruFVmfSo2zvH2zamVrloWO6c4=
X-Gm-Gg: AeBDiev8JfoUYhhospLIRj0fSXKfWeHPezA3JJALQ2v5trpb2x2nCd5DlnsU6p05TLz
	OHAvJslnbnC3HQkQUa4SlE/QRL0btl+KIBjTtXE13yFmpLS5dU1AOAMgBQxensNhM1e5Lojso+J
	qhH19jK2HGY91JuMHs3zBO6jbk/7sUhTWSv2oLYQKFuf3wZDD8Di4J9MAsu5rjeW7oLY9/gzHe6
	huMEwjgOEzGc7an4fNOKHRW2WB7dVIuiNXiyO/Bijnij/7qMts8AQpEs7g8dnyqcNar2iGTMOUP
	g07boz2IO93hxVIcayu/MmxJp8LkXu19wjrFwvWO4Eb7TvY18rR2m9zr5g7td81FxB9YzZZxOdY
	VPrf/v/Qh5d0p8viXQO1q+kzaZPz3jk06nKU1AnvrvyqvbCfQA4aGPCyqzebCavLLzj0Jl0r6P9
	WK709xB95zd3HIOBpB9euzaP25IlZjPW0OwxIqhmN3GzzXwW4033r5onZzbRPYMCytafk0KXM29
	AwDYgoMIcZVAs2/MNQwLvWY7wxfKg+9QffmwSnXjb4fJaBApQ==
X-Received: by 2002:a05:7300:cd86:b0:2dd:db16:478e with SMTP id 5a478bee46e88-2dddb164ee1mr4825eec.10.1776162837299;
        Tue, 14 Apr 2026 03:33:57 -0700 (PDT)
Received: from gui-host.Dlink ([177.33.104.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d90ae89e49sm8735499eec.31.2026.04.14.03.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 03:33:56 -0700 (PDT)
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
To: Salih Erim <salih.erim@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Subject: [PATCH v2 3/3] iio: adc: xilinx-ams: refactor alarm mapping to table-driven approach
Date: Tue, 14 Apr 2026 07:29:19 -0300
Message-ID: <20260414103316.18455-4-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414103316.18455-1-guilherme.bozi@usp.br>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
 <20260414103316.18455-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_033358_410626_4C83924B 
X-CRM114-Status: GOOD (  17.00  )
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

Replace multiple open-coded switch statements that map between
scan_index, alarm bits, and register offsets with a centralized
table-driven approach.

Introduce a struct-based alarm_map to describe the relationship
between scan indices and alarm offsets, and add a helper to
translate scan_index to event IDs. This removes duplicated logic
across ams_get_alarm_offset(), ams_event_to_channel(), and
ams_get_alarm_mask().

The new approach improves maintainability, reduces code size,
and makes it easier to extend or modify alarm mappings in the
future, while preserving existing behavior.

Signed-off-by: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
---
 drivers/iio/adc/xilinx-ams.c | 161 +++++++++++++----------------------
 1 file changed, 58 insertions(+), 103 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 1d84310b61a9..90343d94cf95 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -102,6 +102,7 @@
 #define AMS_PS_SEQ_MASK			GENMASK(21, 0)
 #define AMS_PL_SEQ_MASK			GENMASK_ULL(59, 22)
 
+#define AMS_ALARM_NONE			0x000 /* not a real offset */
 #define AMS_ALARM_TEMP			0x140
 #define AMS_ALARM_SUPPLY1		0x144
 #define AMS_ALARM_SUPPLY2		0x148
@@ -763,9 +764,49 @@ static int ams_read_raw(struct iio_dev *indio_dev,
 	}
 }
 
+struct ams_alarm_map {
+	enum ams_ps_pl_seq scan_index;
+	unsigned int base_offset;
+};
+
+/*
+ * Array index matches enum ams_alarm_bit.
+ * Entries with base_offset == AMS_ALARM_NONE are unused/invalid
+ * (e.g. RESERVED) and must be skipped.
+ */
+static const struct ams_alarm_map alarm_map[] = {
+	[AMS_ALARM_BIT_TEMP] = { AMS_SEQ_TEMP, AMS_ALARM_TEMP },
+	[AMS_ALARM_BIT_SUPPLY1] = { AMS_SEQ_SUPPLY1, AMS_ALARM_SUPPLY1 },
+	[AMS_ALARM_BIT_SUPPLY2] = { AMS_SEQ_SUPPLY2, AMS_ALARM_SUPPLY2 },
+	[AMS_ALARM_BIT_SUPPLY3] = { AMS_SEQ_SUPPLY3, AMS_ALARM_SUPPLY3 },
+	[AMS_ALARM_BIT_SUPPLY4] = { AMS_SEQ_SUPPLY4, AMS_ALARM_SUPPLY4 },
+	[AMS_ALARM_BIT_SUPPLY5] = { AMS_SEQ_SUPPLY5, AMS_ALARM_SUPPLY5 },
+	[AMS_ALARM_BIT_SUPPLY6] = { AMS_SEQ_SUPPLY6, AMS_ALARM_SUPPLY6 },
+	[AMS_ALARM_BIT_RESERVED] = { 0, AMS_ALARM_NONE },
+	[AMS_ALARM_BIT_SUPPLY7] = { AMS_SEQ_SUPPLY7, AMS_ALARM_SUPPLY7 },
+	[AMS_ALARM_BIT_SUPPLY8] = { AMS_SEQ_SUPPLY8, AMS_ALARM_SUPPLY8 },
+	[AMS_ALARM_BIT_SUPPLY9] = { AMS_SEQ_SUPPLY9, AMS_ALARM_SUPPLY9 },
+	[AMS_ALARM_BIT_SUPPLY10] = { AMS_SEQ_SUPPLY10, AMS_ALARM_SUPPLY10 },
+	[AMS_ALARM_BIT_VCCAMS] = { AMS_SEQ_VCCAMS, AMS_ALARM_VCCAMS },
+	[AMS_ALARM_BIT_TEMP_REMOTE] = { AMS_SEQ_TEMP_REMOTE, AMS_ALARM_TEMP_REMOTE }
+};
+
+static int ams_scan_index_to_event(int scan_index)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(alarm_map); i++) {
+		if (alarm_map[i].base_offset == AMS_ALARM_NONE)
+			continue;
+
+		if (alarm_map[i].scan_index == scan_index)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
 static int ams_get_alarm_offset(int scan_index, enum iio_event_direction dir)
 {
-	int offset;
+	int offset, event;
 
 	if (scan_index >= AMS_PS_SEQ_MAX)
 		scan_index -= AMS_PS_SEQ_MAX;
@@ -779,36 +820,11 @@ static int ams_get_alarm_offset(int scan_index, enum iio_event_direction dir)
 		offset = 0;
 	}
 
-	switch (scan_index) {
-	case AMS_SEQ_TEMP:
-		return AMS_ALARM_TEMP + offset;
-	case AMS_SEQ_SUPPLY1:
-		return AMS_ALARM_SUPPLY1 + offset;
-	case AMS_SEQ_SUPPLY2:
-		return AMS_ALARM_SUPPLY2 + offset;
-	case AMS_SEQ_SUPPLY3:
-		return AMS_ALARM_SUPPLY3 + offset;
-	case AMS_SEQ_SUPPLY4:
-		return AMS_ALARM_SUPPLY4 + offset;
-	case AMS_SEQ_SUPPLY5:
-		return AMS_ALARM_SUPPLY5 + offset;
-	case AMS_SEQ_SUPPLY6:
-		return AMS_ALARM_SUPPLY6 + offset;
-	case AMS_SEQ_SUPPLY7:
-		return AMS_ALARM_SUPPLY7 + offset;
-	case AMS_SEQ_SUPPLY8:
-		return AMS_ALARM_SUPPLY8 + offset;
-	case AMS_SEQ_SUPPLY9:
-		return AMS_ALARM_SUPPLY9 + offset;
-	case AMS_SEQ_SUPPLY10:
-		return AMS_ALARM_SUPPLY10 + offset;
-	case AMS_SEQ_VCCAMS:
-		return AMS_ALARM_VCCAMS + offset;
-	case AMS_SEQ_TEMP_REMOTE:
-		return AMS_ALARM_TEMP_REMOTE + offset;
-	default:
+	event = ams_scan_index_to_event(scan_index);
+	if (event < 0 || alarm_map[event].base_offset == AMS_ALARM_NONE)
 		return 0;
-	}
+
+	return alarm_map[event].base_offset + offset;
 }
 
 static const struct iio_chan_spec *ams_event_to_channel(struct iio_dev *dev,
@@ -821,49 +837,13 @@ static const struct iio_chan_spec *ams_event_to_channel(struct iio_dev *dev,
 		scan_index = AMS_PS_SEQ_MAX;
 	}
 
-	switch (event) {
-	case AMS_ALARM_BIT_TEMP:
-		scan_index += AMS_SEQ_TEMP;
-		break;
-	case AMS_ALARM_BIT_SUPPLY1:
-		scan_index += AMS_SEQ_SUPPLY1;
-		break;
-	case AMS_ALARM_BIT_SUPPLY2:
-		scan_index += AMS_SEQ_SUPPLY2;
-		break;
-	case AMS_ALARM_BIT_SUPPLY3:
-		scan_index += AMS_SEQ_SUPPLY3;
-		break;
-	case AMS_ALARM_BIT_SUPPLY4:
-		scan_index += AMS_SEQ_SUPPLY4;
-		break;
-	case AMS_ALARM_BIT_SUPPLY5:
-		scan_index += AMS_SEQ_SUPPLY5;
-		break;
-	case AMS_ALARM_BIT_SUPPLY6:
-		scan_index += AMS_SEQ_SUPPLY6;
-		break;
-	case AMS_ALARM_BIT_SUPPLY7:
-		scan_index += AMS_SEQ_SUPPLY7;
-		break;
-	case AMS_ALARM_BIT_SUPPLY8:
-		scan_index += AMS_SEQ_SUPPLY8;
-		break;
-	case AMS_ALARM_BIT_SUPPLY9:
-		scan_index += AMS_SEQ_SUPPLY9;
-		break;
-	case AMS_ALARM_BIT_SUPPLY10:
-		scan_index += AMS_SEQ_SUPPLY10;
-		break;
-	case AMS_ALARM_BIT_VCCAMS:
-		scan_index += AMS_SEQ_VCCAMS;
-		break;
-	case AMS_ALARM_BIT_TEMP_REMOTE:
-		scan_index += AMS_SEQ_TEMP_REMOTE;
-		break;
-	default:
-		break;
-	}
+	if (event < 0 || event >= ARRAY_SIZE(alarm_map))
+		return NULL;
+
+	if (alarm_map[event].base_offset == AMS_ALARM_NONE)
+		return NULL;
+
+	scan_index += alarm_map[event].scan_index;
 
 	for (i = 0; i < dev->num_channels; i++)
 		if (dev->channels[i].scan_index == scan_index)
@@ -877,43 +857,18 @@ static const struct iio_chan_spec *ams_event_to_channel(struct iio_dev *dev,
 
 static int ams_get_alarm_mask(int scan_index)
 {
-	int bit = 0;
+	int bit = 0, event;
 
 	if (scan_index >= AMS_PS_SEQ_MAX) {
 		bit = AMS_PL_ALARM_START;
 		scan_index -= AMS_PS_SEQ_MAX;
 	}
 
-	switch (scan_index) {
-	case AMS_SEQ_TEMP:
-		return BIT(AMS_ALARM_BIT_TEMP + bit);
-	case AMS_SEQ_SUPPLY1:
-		return BIT(AMS_ALARM_BIT_SUPPLY1 + bit);
-	case AMS_SEQ_SUPPLY2:
-		return BIT(AMS_ALARM_BIT_SUPPLY2 + bit);
-	case AMS_SEQ_SUPPLY3:
-		return BIT(AMS_ALARM_BIT_SUPPLY3 + bit);
-	case AMS_SEQ_SUPPLY4:
-		return BIT(AMS_ALARM_BIT_SUPPLY4 + bit);
-	case AMS_SEQ_SUPPLY5:
-		return BIT(AMS_ALARM_BIT_SUPPLY5 + bit);
-	case AMS_SEQ_SUPPLY6:
-		return BIT(AMS_ALARM_BIT_SUPPLY6 + bit);
-	case AMS_SEQ_SUPPLY7:
-		return BIT(AMS_ALARM_BIT_SUPPLY7 + bit);
-	case AMS_SEQ_SUPPLY8:
-		return BIT(AMS_ALARM_BIT_SUPPLY8 + bit);
-	case AMS_SEQ_SUPPLY9:
-		return BIT(AMS_ALARM_BIT_SUPPLY9 + bit);
-	case AMS_SEQ_SUPPLY10:
-		return BIT(AMS_ALARM_BIT_SUPPLY10 + bit);
-	case AMS_SEQ_VCCAMS:
-		return BIT(AMS_ALARM_BIT_VCCAMS + bit);
-	case AMS_SEQ_TEMP_REMOTE:
-		return BIT(AMS_ALARM_BIT_TEMP_REMOTE + bit);
-	default:
+	event = ams_scan_index_to_event(scan_index);
+	if (event < 0)
 		return 0;
-	}
+
+	return BIT(event + bit);
 }
 
 static int ams_read_event_config(struct iio_dev *indio_dev,
-- 
2.47.3


