Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FABE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tva2aDKV+/MDffuSfl+zRdtzIydM4Toy2VF4f9o1/Mk=; b=khHYeanfg1/chxvpFMAeF3JsNg
	y3R6aO33NvP0/yTHPM/p1/uKdxhS9I4xg+uKzj1xGALSKnRhgQRF9WH2DckiozkEBiM3bycavzo4V
	SJ+KxetUfy2nBtWQ5DxtUpjnPd/Pm3tqsqV0r4W9vCawSh8yUx/32l53kvR+8yqjqhp7W8/5mULe1
	Fy/Oyi8FGcoU6+CTnFPzifSY9saeMPcaDwfr6BpxUL0FbmMdkLZdgJiVEsOBktHvJbUNp2g2vt939
	SBlDeIf+N4tyqGRfVtk++7AOCa2k5U3GtY8lv1zp3bxPh6pIxDIXVzYihRUm9q4voZVkmVz3YikrV
	JPqinoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuX2-0000000CUTO-0nK7;
	Thu, 09 Jan 2025 15:33:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuU2-0000000CTnk-3puN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:30:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4361c705434so8642975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 07:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736436605; x=1737041405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tva2aDKV+/MDffuSfl+zRdtzIydM4Toy2VF4f9o1/Mk=;
        b=cnfuJnxLsHOCHN1kyBtHsnzruzuV9Q10S/u2Etp85Ahk+GwEPqqDlyGLCC5xt4Fd4v
         zKG3tyFq7ixHtPjaXEtMZeKk7k74Q7YHujue1nda2aHMo9nfgMTKgRvKu0bQ3c28yAWW
         vLGQMnH35GZA+KqHGoe3v+aHCFr/XrYPAYyOXkXgOOEW0DQTEZMtV/sY2Iu5g/mBox0X
         ykE4PANo/h9l4bvarPXi2tW2ruTdnAuVvLjYnpF14F2E+gV+2hn60yS5AJgFCDac/Y35
         j0MaE9frp3Sdm7cffiOrD7u8iMn2jT2NFy2wdl+jYWx/3s9lkrD2uva9sjjyYZCdTS0o
         su8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436605; x=1737041405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tva2aDKV+/MDffuSfl+zRdtzIydM4Toy2VF4f9o1/Mk=;
        b=aDk/HDkNnlq167Ko1jUTN4VRS2YoitqAOYUuGXA9AWTnUtTNnw+oB45fZFy01q+DtC
         MtzBJN1TFBW6ymT7BNNkThieBUDcoR+GVl+OSX7oquWScZ1lYvg83X/GRcD0hAyJBExz
         Vbr2lVvQOf95mIsaoMnNMD61eBvBrbShioqDhhggKS2VV00eGHG/22VEbecsEVQ0qTbg
         sWu7t+RnYhHa9DQJr3WjgIvkCZofF2HM6Mi4bqZwjSNn0rfCPmBM4/GNLpaEtZl0Rqsb
         +/8CBY4fsgy9YtzmCPa+3IeIycm65Ll5U3upYAAHSw9zp16WuM/EwuzoVaRGWma+/zFi
         3KPw==
X-Gm-Message-State: AOJu0YyDHG2aO+6KC/rZ4orMgSWgDV+MZOsaHkuvB12c31nVU5tEkHg7
	LvsKh9cv9oplIa4uXCZaF/qGifUJWmKfxMkT99rVnuaXA+76q1ZlugDz8nwnR0I=
X-Gm-Gg: ASbGncs1gBZAKP15J/AWsoFxBpegeh83V7PMOlg59q9Eu/ocpqUyLDAs2ntMi51cWvG
	q7E49vafkcu0W+Ys8Cv/4wdcur8kOAdfgLJuBKoerlZILJvgTDW8083uxkIMj8Ky6csefV9py9M
	ex3xOShkTNjR4EP2uaV+H+AbMv4mgL9pqPxDiQE6G2s7bFutEj5HUe2GrGNHMFoMnwpwwdSS6g4
	LzwJP3xK/HdiJC9GPUA7LCieDI3/AMlbmfoSqSwYVUQhtw97nigpImqP2Q=
X-Google-Smtp-Source: AGHT+IFZu92+O1xFBM1o4OIIzCf4RxwxPT44klM4biAbIGEw2EXkTR7f4KbFlUulK4lpC9hB8MpfFA==
X-Received: by 2002:a05:600c:3b0c:b0:434:fbda:1f36 with SMTP id 5b1f17b1804b1-436e26e51a0mr65752665e9.20.1736436604907;
        Thu, 09 Jan 2025 07:30:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2df3610sm58307805e9.20.2025.01.09.07.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:30:04 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Jan 2025 16:29:52 +0100
Subject: [PATCH 2/2] rtc: mt6359: fix year issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v1-2-e8223bf55bb8@baylibre.com>
References: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2101; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=8DXsWpDVt7tmuo4MQdFq4zvSAYEr9Hi3ET8gNU0ixjk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf+t6dswjfIEHCOw16BhoepRMqsP3UcnAyvPeeJTX
 +3PsW1qJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3/regAKCRArRkmdfjHURWq5D/
 4yF/Ns7bGrrNmICUNd3lSvbkchkjrbu8Lq6i1dTdPTLlcSHcgDb3j392v31EGvxWxyiunuUgQXlU+A
 G9jBBc9pdeoKUJo7fOCXYo4cwzmAD5PjxxpFNNVkAS4o6VY2aplaJ0adohCh30xx88Q+B4eBLqI/kh
 FKAKCTzXzK9RrXUg2MHPW70tcfjkJR1CFd5lOqaWfAUjSHWH4BLLd9/LCH9DF3IqLuujJnql/2zZyU
 UgmgJvX3kyRNiZlw8Q8YuqahHJ0oei9M37IcGZPQRwQ3KRo/APehxXJZTzEmGhgwVCikjYKlInBJsV
 ZrX779i4J+SlgOmQeg3ZzbW32/UceHOssj3w2x75lI5oYSvNEwZbvD5XaK7sKsSMSZzap6Oi7wl8ff
 bBiuF0rsBfnptgR4+SfW39cJ4yGyt6hHl5UYu7AvRQp9G1ESykM2aEut/lelQnowEX1qSt9tVD9q7j
 BriB+K4hDUMfG8qc90D7rC2xmBleraXwfk43ef6kAGFbbO2t4V+RgNc9liQqljtOWpSahYmFvXZMaP
 ypWxcobpydIIRi4tgRlllWAA7IC6ddljoKO7g7BADDv9rfhJMLIXkkQVdVFeZnbhIr3JsVMqkOeLEc
 qCPohlusM48uw+H1+KO4XmL5uRVAo28yfO0tPOntC9c6UPUjLzoLhfUH0pKg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_073006_975177_046762E9 
X-CRM114-Status: GOOD (  12.01  )
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

Removing the RTC_MIN_YEAR_OFFSET addition and subtraction has
introduced a regression.

~# hwclock -r --verbose
hwclock from util-linux 2.37.4
System Time: 1262312013.143552
Trying to open: /dev/rtc0
Using the rtc interface to the clock.
Assuming hardware clock is kept in UTC time.
Waiting for clock tick...
hwclock: select() to /dev/rtc0 to wait for clock tick timed out
...synchronization failed

Bring back the RTC_MIN_YEAR_OFFSET to fix the RTC.

Fixes: 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for start-year")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 55e75712edd4..9930b6bdb6ca 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -96,6 +96,12 @@ static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
 			goto exit;
 	} while (sec < tm->tm_sec);
 
+	/* HW register use 7 bits to store year data, minus
+	 * RTC_MIN_YEAR_OFFSET before write year data to register, and plus
+	 * RTC_MIN_YEAR_OFFSET back after read year from register
+	 */
+	tm->tm_year += RTC_MIN_YEAR_OFFSET;
+
 	/* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
 	tm->tm_mon--;
 	tm->tm_wday--;
@@ -110,6 +116,7 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 	u16 data[RTC_OFFSET_COUNT];
 
+	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon++;
 	tm->tm_wday++;
 
@@ -167,6 +174,7 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
 	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
 
+	tm->tm_year += RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon--;
 
 	return 0;
@@ -182,6 +190,7 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	int ret;
 	u16 data[RTC_OFFSET_COUNT];
 
+	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon++;
 
 	mutex_lock(&rtc->lock);

-- 
2.25.1


