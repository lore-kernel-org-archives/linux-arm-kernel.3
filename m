Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D33C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWvOtZ2Ij96tOi1o1hUr0b9qGVWu80vcBedKzsseg9k=; b=Dpxx0CyWgKcamZ5w98JgZZkZUl
	a+q2HNFC2SXZVEeBCZBfG1HihSYyH06Y04Thik68RCzFJXqbrYNZOckSNgI3JQziqNxqEzT4YYrS5
	IR/RNq82GFIkkfN104XgfKDNoAsRFTNsMQ8ma8V0kdXy7upRCkbY6D6C02h0uIHim5C0VFWUBGP8o
	S5CP4RYB/rLfwqojxa8CEzh/Lmqt/IahbcPzBPPVK63MNXuiXsWMQv0bzpBB6JFNGCtbgLhPodZJ8
	SVlkzTwgy+DaU/MkU7VfFf64RSnLyouWYgSSWmzOec+yNG1b5jbVwdfS5l/0I3/ohdGP9pG9YD0Wt
	ndtcevpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dos-0000000DnnG-0EgT;
	Fri, 11 Apr 2025 12:49:18 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dci-0000000DlK2-0mpM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:36:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso2302492b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 05:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744375003; x=1744979803; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWvOtZ2Ij96tOi1o1hUr0b9qGVWu80vcBedKzsseg9k=;
        b=LYvELdZRx+CbQ3JrBI9MemKZM2o7zFC/fPg5ql6jtXpEdLLYW4VtBy2wpMRHHlWEJ6
         KXhxhgy9CEhOn+AJuOglnpVaKrzsTH4lChcX5EmE4cegRRHfEpVdYWc3+m55wWEuAF1E
         mf8i2pdQvwFda2d48Lx86Tr6+3AdWt54cDSFeZ3gnraXB1YTJjRCezHwykCaDtiBRYOt
         kzMXWogINdabQ3Ye0r2ERHZqj9yUyK+7txbzt3aLB50+WPBeMAop82kUcJLNV9aeIYxl
         ya0XN9NjuBI+wVeMwm1b7JRlku5xEHUo4YHagoWOP5cTKSV9dfIZQ0MMlB4azILE11tt
         SwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375003; x=1744979803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWvOtZ2Ij96tOi1o1hUr0b9qGVWu80vcBedKzsseg9k=;
        b=wb7VfWmBIrUmEViUt+42FIsYTbreaJe3DQBphwWTYTLuDQxiTZdEng9aY729cLfWGj
         jUJWya4XGzFF4b/4aKsxbLl+MBX5GabsDoK4NO1PWh0KGvPaN3MsVr4VX9Ym1AwaOl1o
         C2khBNYD7NESaEkIeSJxe4DVtIx2EjDhbiOS/55DmmWBndZKLgbVw0X2YxQSCOKCpQoL
         R2uMKC/uTCV0EXaV5layzOYEyyHAVVHnjthdd3FqgWBLjBdqQd8Bi7SEUSMlPRs2uZ1D
         czYyQIakckB2+uWP3MJNAyBCSfurnV8h2GqL4K+Nt+kU8nmy/eRxfzqp9iyvaQSaLAhY
         Xnkg==
X-Gm-Message-State: AOJu0YzK6Ic9ADL56ftGN5BPvXGqBAzbRSoE/dJQxm6SBRZPk4iqw6x8
	OUtAhA9sa+9Jmng4XvcSgPHBuRKtfIhSJQQaJuluyLxvPHl4BhjAo6Uf5BqVhrM=
X-Gm-Gg: ASbGnct6BzcxcPML7ThF2CXwzUaGRc0elnqgxbJ8UHCphW3zhPl6aMkrFdRpidIJdy+
	kkh15ieEir0tBPeODQ2+CpvzJKd6NK/er6cjz3OxFvAI/pL+4bQqNZr69iprcp1JEJ6PTDUzdjb
	QvZzGaZJ4jPHrwTNtyjgTpe+ArJI5IAvBd9lOWbRFNmQ1cLZ0ieliFWw/6dViqwftcBoLMQlMEr
	MzFeZggPZHg801HhXEmaFPAGBtxR1wU9wONTabvLnAePzjPl9QK0GC9bAo77HVNRvstRQA5gvZJ
	ECaqjzXiTuE/8QcEM9t0i1freY2IQ/SCOaCx3pE4Cns=
X-Google-Smtp-Source: AGHT+IHHr6PfcniD19K70c7n3k5QYjLiwj66+qa8B+xXfSPCuWN5/YZWkukIqVWOva+qdLyKiB11mg==
X-Received: by 2002:a05:6a00:3908:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-73bd129c6d1mr3275598b3a.21.1744375003638;
        Fri, 11 Apr 2025 05:36:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:43 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:56 +0200
Subject: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding cast
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3840; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=vGUfgBYd/nqdiWhakMrxzcEEIqB0t/sqp/diq7LMGlc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+G925gTSnI2f/g5RRp1mmiZxGxczjO4K3kNYm
 9g+lrSyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURcl9D/
 wP0ww2kkK7+Wdz6lCWG8tR0wOKrrvr2qjTu4xuKN9SRbZGSWhA9QmDb/dWzu4/0eAm8sl3qJMEk5Yk
 72cNB66JOZpwVfgY4Xp+ppUa5CNpHWBGe3QOQegRAvq9iSOBZ0Befi0rR5kfl788zp72w+3x1VXO7E
 R1BFLx8c2FhBePEp0TmhPL/thzoVTQhUv/11ONiQwlSewTu3UTlymMfTRZ8D6pSsM3pfNhSLzDLCh1
 yybqickSMBVYd4qqOnp08M4WsDnTHYsFYb51RyUczq3CSXrZ7Tw3/8rnGoaMFfRoe+9a2GaVNfcena
 LCt1tD6kBkx31OUdTCgi2xU4TbUkN0KBgcGLu8G6MH2r4Zj/Ul3Dd8BAHPtQdYc1qL86ylvzmkLCT+
 XZ04Bh+xraV8u4h7iUkZAoDEn12HInoSfG5xk2AIlsUP6jWf5w1VGcBHbwuBvVfUQr4IF3WsZNJb5p
 +iS8HHZgWKGNJaC7hsERyf63bEwLaYX/v9yCj9JsPBJ8kN+CnJ9QvKUqS39GqOS0fNyH34jfvnBUSv
 eX9nVxrWHyd4x5cifMm5s4lhMt2iZinXa7klv9V8rXsvW5aXOUmt9iBd0RF3YBmxDj+xcv5XUVKG6H
 MPHZrxIA9oPg2KHF1+4pye8NG1q1tx7stersv89cat7tXtLmaMbi2Fs7UNbQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_053644_233694_9C571A20 
X-CRM114-Status: GOOD (  19.18  )
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

The RTC subsystem was experiencing comparison issues between signed and
unsigned time values. When comparing time64_t variables (signed) with
potentially unsigned range values, incorrect results could occur leading
to runtime errors.

Adds explicit type casts to time64_t for critical RTC time comparisons
in both class.c and interface.c files. The changes ensure proper
handling of negative time values during range validation and offset
calculations, particularly when dealing with timestamps before 1970.

The previous implementation might incorrectly interpret negative values
as extremely large positive values, causing unexpected behavior in the
RTC hardware abstraction logic.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/class.c     | 6 +++---
 drivers/rtc/interface.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index e31fa0ad127e9..1ee3f609f92ea 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -282,7 +282,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
 	 * then we can not expand the RTC range by adding or subtracting one
 	 * offset.
 	 */
-	if (rtc->range_min == rtc->range_max)
+	if (rtc->range_min == (time64_t)rtc->range_max)
 		return;
 
 	ret = device_property_read_u32(rtc->dev.parent, "start-year",
@@ -299,7 +299,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
 	if (!rtc->set_start_time)
 		return;
 
-	range_secs = rtc->range_max - rtc->range_min + 1;
+	range_secs = (time64_t)rtc->range_max - rtc->range_min + 1;
 
 	/*
 	 * If the start_secs is larger than the maximum seconds (rtc->range_max)
@@ -327,7 +327,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
 	 *
 	 * Otherwise the offset seconds should be 0.
 	 */
-	if (rtc->start_secs > rtc->range_max ||
+	if (rtc->start_secs > (time64_t)rtc->range_max ||
 	    rtc->start_secs + range_secs - 1 < rtc->range_min)
 		rtc->offset_secs = rtc->start_secs - rtc->range_min;
 	else if (rtc->start_secs > rtc->range_min)
diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index aaf76406cd7d7..93bdf06807f23 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -37,7 +37,7 @@ static void rtc_add_offset(struct rtc_device *rtc, struct rtc_time *tm)
 	 */
 	if ((rtc->start_secs > rtc->range_min && secs >= rtc->start_secs) ||
 	    (rtc->start_secs < rtc->range_min &&
-	     secs <= (rtc->start_secs + rtc->range_max - rtc->range_min)))
+	     secs <= (time64_t)(rtc->start_secs + rtc->range_max - rtc->range_min)))
 		return;
 
 	rtc_time64_to_tm(secs + rtc->offset_secs, tm);
@@ -58,7 +58,7 @@ static void rtc_subtract_offset(struct rtc_device *rtc, struct rtc_time *tm)
 	 * device. Otherwise we need to subtract the offset to make the time
 	 * values are valid for RTC hardware device.
 	 */
-	if (secs >= rtc->range_min && secs <= rtc->range_max)
+	if (secs >= rtc->range_min && secs <= (time64_t)rtc->range_max)
 		return;
 
 	rtc_time64_to_tm(secs - rtc->offset_secs, tm);
@@ -66,7 +66,7 @@ static void rtc_subtract_offset(struct rtc_device *rtc, struct rtc_time *tm)
 
 static int rtc_valid_range(struct rtc_device *rtc, struct rtc_time *tm)
 {
-	if (rtc->range_min != rtc->range_max) {
+	if (rtc->range_min != (time64_t)rtc->range_max) {
 		time64_t time = rtc_tm_to_time64(tm);
 		time64_t range_min = rtc->set_start_time ? rtc->start_secs :
 			rtc->range_min;
@@ -74,7 +74,7 @@ static int rtc_valid_range(struct rtc_device *rtc, struct rtc_time *tm)
 			(rtc->start_secs + rtc->range_max - rtc->range_min) :
 			rtc->range_max;
 
-		if (time < range_min || time > range_max)
+		if (time < range_min || time > (time64_t)range_max)
 			return -ERANGE;
 	}
 

-- 
2.25.1


