Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C173CC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IG4g6G6O5d0C+h1ORyM98qH6q+iKpuRjuLFaymrvAM=; b=ysz4hEwzJeKpxEa1Xubhb8TfM4
	hhDsycFLmTi1xL71gJJmkXdIEyWe28x+K2DJbIYgD5IdbBIGgzF6B3RrNbXkiLdzKfqVPVXFP/KAQ
	4Blh94xVfy4CFO/adCsoCLHckkYDBulZpTptvD3aD3KEHzGMZO0dxhCqfm9qvecPeglFBUpmEmNjc
	A5nhHY/N0q+IwyenAeNH4q4PiotDQC7VHbCObR4SlXnzMQgZNA8TE6gqrEV03X0GXSyOLkeqwsygo
	VWCfBmeBSofsYS1hl/k9zd7t5ACLZ0nKscVB1AO5MniIcIYO45K/29nbhqFN79fEPNH+XcRAQwTe9
	1Zmi5CCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DlI-0000000Dn2B-2i6Z;
	Fri, 11 Apr 2025 12:45:36 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dca-0000000DlHH-3cik
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:36:38 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7394945d37eso1687632b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 05:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744374996; x=1744979796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IG4g6G6O5d0C+h1ORyM98qH6q+iKpuRjuLFaymrvAM=;
        b=yTDRvz0CQlrN/NyReUXdbnAVxw1Y6IYle+vUY/wI74TqFyUnmZUGxG40IjE8CYsp9E
         XfiofXHSP3GoykiCqjY3mPYluV8QFFXa3mpu8Rja+CYqBQFKducUSppQKHPIvDzGgi86
         ARucjeXMkMVGmjL8olCCj8syh2bZyj9zDfmoLITk89uF/FK6zHe/5xxl0bbv0Z6PogPy
         BAEMb7CGw2gnqERcAeWEMYbM75LHrU83XKaXeN2nRkN2o4G5/4n/wfCI4IioKV5lFYpg
         Mk3Eq3VWtsZ5PM1DLpjyff95Tjo9J/rxifzlRqYVyJCzvAtQonxCB3mAjvaOW0kH2jRa
         6L0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374996; x=1744979796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IG4g6G6O5d0C+h1ORyM98qH6q+iKpuRjuLFaymrvAM=;
        b=DsesNbJPnDEri3rV6ecm68bcuNi5pK5aWBqDYiXNlyGtnJOXfan8z0fi4fBL0uOs+W
         AXxRzA43+IMEYN3qWvACBnKVvVGtospZXpZAAPTq3P1W9cNrmretRBXnnlSrfZH9+GwA
         +k5Jj61DiLCjYjYp7JLp/Kt/QeOvaN6stcPKqHySEObTbc+++x5HN+HrWCPP49SMP4MI
         9TGDqP3io265y3muOON+FleHne4AkcowHHSUzC4x8eaTuQ+FBBnX4RnBqaYmQ7e5ZuWf
         A+Kbc2nGjwSHG7ywwR1YitZZaSGJtZ1JAlSaKVPIQTt41KpSg2V5QsEUgsU5pFsq08uG
         yZdg==
X-Gm-Message-State: AOJu0Ywlj3LU0aUqgM+Rd5Hyw55Ybu9cX4FSAJGHNcrt0dXaHEyavdLx
	Z7tpS50n1sk/FuRd6kEFaXYo8BaWfKecBLhVvIdDL2AOVwvWX5JkTXJtsbtttpQ=
X-Gm-Gg: ASbGncsEsvmAUc62f5CQuosm/HdtMdPpC8ji01GB6bKBIkJxgLAf3a0dxu22l9HV9t9
	j9WnPeCklGbC2aqZiagK93VthupimPDOjH/3vWksA16WoxpX7yRITxvlQGw19lzFwDJQnMkxsH7
	AXymbmk8AloEG9qMDsR+bnfJvaalj0N2BZEbpsff/Yjqcjs/h3uhDisHUF/ZN1ndiyNvQ9XBFsa
	eacBrMoxCSLWMS0C5iflqCm3G2WnxhvtEy8kLcyvQ52m1BRefxWcQf/tPn8SH251HsPiD/M8G59
	X1P4BwKOsAPEiCfXFxU7PpFW10GBxBzyZKxyPkP8X9M=
X-Google-Smtp-Source: AGHT+IFsg0ZCckIXxc+IHljq9KDD7/UlDwl63B9XFgkbLhB3RqdDeYk2J9Ou9a3sdf+9kaQpQwYZGg==
X-Received: by 2002:a05:6a20:6f06:b0:1f5:8622:5ecb with SMTP id adf61e73a8af0-2017996f524mr5486935637.34.1744374995986;
        Fri, 11 Apr 2025 05:36:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:35 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:55 +0200
Subject: [PATCH v3 2/5] rtc: Add handling of pre-1970 dates in time
 conversion functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-2-f003e8144419@baylibre.com>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3599; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=tyu764S29y/vhFyNtYKo1iTVWCgv8kwvcYIcevIAdQU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+3CiQcNMagXuWDXp22y2fLo6SR/giORhsb2jL
 j0l2Rq+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURTB5D/
 oD+VRGtB9vanDklEZ0FOkM4AmBfEcomkMxEDgrwUagbw2dNBqsBDibhbpl+Sfv8LRErcT0R2SZFxrp
 RtKYr6GJex551wXHt1dKOuzkiwjjkQGGjkiMz+TiZl8EIkrta/RocTjEfge7N4L6OoD5NaFKz55+jX
 DvEoKYEFAoRThw2/D2suWlaWpSHLdghBIsl/klG9QtRORclyp3HujfG0tvxr6jVmK/QGyQoCwf+LqW
 pdAFz9vCGnFBX2sPbt3LKO3Gz8EctYNidjvItdLLiGh35/l+eicEv+l5H/9C/Cxp16Uhbuv4M6M72k
 V+SnyE6EBtp/M17/nXlLAFGA2FhGXsyTJI1JKiICr9trYFGVONewVdRMfBAAx/LNpVs8Iyhyq6AlUE
 fptqtoE5GZ5yngSLsMZxYzyPKrfq0Jn1O71MWTQ/oxB/B0YrrAxAaMyzgT0qni9cNCFO6PBHxhyxJ9
 3PH3bSZZUTYQLp2hq1tAFWNPWVtTRmareCUcNJ5ICuMxF0cyNOeiR0klJxiUOvVNiob/78WIIkHE77
 PDAMkXx5z0Dscs7Vq0qwJflmgG9ccXA8U7czRYuErgYMYtVQYDhMJ6a53gbeMumYFwlK1Z1KGHV+pP
 KLlRSR1FEgbNLnKO2j53929m8ZuE3EPJHDvWf+VXU1F/cbUYSk27vJnWk4xA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_053636_910661_526A3299 
X-CRM114-Status: GOOD (  20.01  )
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

Linux RTC subsystem's time conversion functions couldn't properly handle
dates before January 1, 1970 (negative time64_t values). This affected
offset calculations, causing incorrect time translations for RTCs with
pre-1970 base years like those using a 1900 epoch.

The original rtc_time64_to_tm() function produced incorrect dates for
pre-1970 inputs and rtc_valid_tm() rejected all years before 1970 as
invalid, even if they were within the hardware's capabilities. For
example, converting January 1, 1942 2:36:47 is equal to -883603393.
converting it back resulted in wildly incorrect values
=> January 2, 1942 1193025:5:3.

These issues made it impossible to correctly use RTCs with pre-1970 base
years, particularly affecting embedded systems using hardware like the
MT6357 RTC.

Modify rtc_time64_to_tm to implement special handling for negative
time values, properly calculating days and seconds for dates before
1970. It also removes the tm_year < 70 restriction in rtc_valid_tm to
allow pre-1970 dates to be validated correctly, ensuring accurate
conversion between hardware and system time across the full range of
RTC hardware capabilities.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/lib.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/lib.c b/drivers/rtc/lib.c
index fe361652727a3..2014a86499e02 100644
--- a/drivers/rtc/lib.c
+++ b/drivers/rtc/lib.c
@@ -46,7 +46,6 @@ EXPORT_SYMBOL(rtc_year_days);
  * rtc_time64_to_tm - converts time64_t to rtc_time.
  *
  * @time:	The number of seconds since 01-01-1970 00:00:00.
- *		(Must be positive.)
  * @tm:		Pointer to the struct rtc_time.
  */
 void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
@@ -59,11 +58,39 @@ void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 		day_of_year, month, day;
 	bool is_Jan_or_Feb, is_leap_year;
 
-	/* time must be positive */
-	days = div_s64_rem(time, 86400, &secs);
+	bool is_negative = false;
+
+	/* Handle negative time values (dates before 1970-01-01) */
+	if (time < 0) {
+		/* Store that we had a negative value */
+		is_negative = true;
+
+		/* Convert to positive value for the algorithm, but
+		 * we'll subtract one more day to handle the boundary correctly
+		 */
+		time = -time;
+
+		/* Get days and seconds */
+		days = div_s64_rem(time, 86400, &secs);
+
+		/* If we have seconds, we need to adjust to the previous day */
+		if (secs > 0) {
+			days += 1;
+			secs = 86400 - secs;
+		}
+
+		/* Make days negative again */
+		days = -days;
+	} else {
+		/* Positive time value - normal case */
+		days = div_s64_rem(time, 86400, &secs);
+	}
 
 	/* day of the week, 1970-01-01 was a Thursday */
 	tm->tm_wday = (days + 4) % 7;
+	/* Ensure tm_wday is always positive */
+	if (tm->tm_wday < 0)
+		tm->tm_wday += 7;
 
 	/*
 	 * The following algorithm is, basically, Proposition 6.3 of Neri
@@ -93,7 +120,7 @@ void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 	 * thus, is slightly different from [1].
 	 */
 
-	udays		= ((u32) days) + 719468;
+	udays		= days + 719468;
 
 	u32tmp		= 4 * udays + 3;
 	century		= u32tmp / 146097;
@@ -146,8 +173,7 @@ EXPORT_SYMBOL(rtc_time64_to_tm);
  */
 int rtc_valid_tm(struct rtc_time *tm)
 {
-	if (tm->tm_year < 70 ||
-	    tm->tm_year > (INT_MAX - 1900) ||
+	if (tm->tm_year > (INT_MAX - 1900) ||
 	    ((unsigned int)tm->tm_mon) >= 12 ||
 	    tm->tm_mday < 1 ||
 	    tm->tm_mday > rtc_month_days(tm->tm_mon,

-- 
2.25.1


