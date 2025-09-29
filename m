Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E52CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1TScXo9HlddRXxyVV537w+xJu4r/bR5+Sl4AGG4P1c=; b=zbcSJGbP8gWExIlbNC6bL7nPSa
	Yzx+Awicz9FFdJbaHslMcRA1oBJ4zGf5NJ5AmHfoxiI0U5H9Dm4H5fTsnE0Ma4Dq077UGBYjxLce/
	z+f0yOY31VkxX33rtXgyrMqsn3uRsNmDqqNkhjqe+I6SA5bVo+z7W3pPo3J3f4HjOpyvpaJiP1BYC
	7auGZR8/KCy84//p1nuwTUhZzVSz0y89QZICNzdr9fcyT/Sx4odJmSVUz1gNHR9dB2DHTP9D4n+GU
	nFoY50KxOBgXyJu4DDyOMLV9NAZSaU5LL0CYvL+CtRy3HFwxGA6lBHMfeZEwJsStRO/KNraarA35E
	Mc+s2TpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3De2-00000002Wil-30AM;
	Mon, 29 Sep 2025 13:10:22 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3De0-00000002WiN-0hmw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 13:10:21 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-36d77ae9de5so41021661fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 06:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151418; x=1759756218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1TScXo9HlddRXxyVV537w+xJu4r/bR5+Sl4AGG4P1c=;
        b=UhrOF2ssElaKpCQt6SYYtd2nWDqLA72PYNC5iyTw3s6Qi1NbetMo/+4FFjIHj53zqy
         FEla4vn3cRMyPLKAQVi/fqxWlfbTNPyTmiZBsEsQ5T7kRuQOOHNygaMMKgHWf1h8qpJ0
         R6qzUO6g3xUm4nv/dSGosT4GtUvFPDB2w8HfI7XSkGXY/bgJ5VxPusXFCb+wPkGFiAq8
         xFQKbv/CJqNgCnm3llr6p/lOoEgBAZPWHN3//pjkfPLMcPbMt+GgBwO5WXRSIYgv0N80
         3tknVm8EcLOpVm1C7NKon1pFfIpfLMOrR5R0wXgWboWQ3k3zV1AwqhW2pmNUsC8rTCd1
         wRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151418; x=1759756218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1TScXo9HlddRXxyVV537w+xJu4r/bR5+Sl4AGG4P1c=;
        b=AHRdOj8CaT1DaUmIkY2iFEEAlr+FGlRO2lyzz0+WH+yYRLwYBJau1jJQd6Ka0uA0/Y
         ImbM5WQnSme0lREV6gtFwCe5gdKkJq2mx1+K5uax3dpYCBqo8ANBv7aFjD5cqx6lBEs/
         QxhkxOVqBTAaiNijWhAuq5fL7dQt1aKkR4v+r5pO8+/tSXEavtCnMP6dQNCOuVzLoQxA
         X0gDZtjEzG6OuitZl+ks4mI57c4gI0PSV4yfP9HJvy8A8TWtxSqeoCSdNIitVsXuHT6B
         424B3MAsyxAgO8schdpV0yHjGEKqHeOOU5/vM5I0EH0olXB7Zq1mNjGm7lAzYNyXLl1F
         yvIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAK/Y9FM5lG55db9VM6+YuoqBMa+N3WNS2C8wxhjP8CQZxJh5Vd8wcbPLWLCo12z1gFbp3ydV8gZ0hp8/nKEzu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6WHse3k+E+e0tdvxoFc+t29pO12ZZSCp85yIVpu4yMDNRuWoj
	ND5+DglUmGNClkURw9DQmqAinWVa3Yf/M6JDdBhNN6QpwsKCvYGwytjY
X-Gm-Gg: ASbGncvpUznJefobFywD9tNkH5r+arfnlIIvGDkVW/H2BvkxUqg8Bt9sRQBsQcXzSON
	cBxaCpQHkRcBO660i6dflfY/0SyFIALQ9Re+XofhaBCIDtXq6uNwX7vEb2D1AaVq/vYzuNIe0V0
	jRxAYWf6jGSLxbwK0Nnyyv9a7ZCFKIpEMU3jLENJ54hULPED8VLKwDzbxfDi6UY+PjLvwl8m65X
	3xbrbukeJoJsDYx4QQkGfoUVZ5i3InBFac+1tgyS3+Qb9mxiEmCH31jkcbF7uGcoPHpoPY5Vf9y
	u5A4PCdAugnzTbl0tQB8HiSyeoZRXVigPyTQpO5myAxDdOOtwsR8a7VEi8/Hx4Q3aB+4HfWXqPK
	5QtXErzVFobAwd6bll+Hdbz2u5Bgn1LjCoXD3DCZ5InUfreapSqlEihh4JrtkWA==
X-Google-Smtp-Source: AGHT+IEcUX+DjySA65AZ4EirRuxBQ8lIGoA5qOge8LkJpCU+G4WGmi1HxUDdlfwOC7g7+7QmeV3SjQ==
X-Received: by 2002:a2e:bea0:0:b0:36d:6ae3:8146 with SMTP id 38308e7fff4ca-36f7f247f42mr47225651fa.26.1759151417546;
        Mon, 29 Sep 2025 06:10:17 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7bfb413sm26246441fa.56.2025.09.29.06.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:10:17 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
X-Google-Original-From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] rivers: scmi: Add completion timeout handling for raw mode transfers
Date: Mon, 29 Sep 2025 16:10:10 +0300
Message-ID: <20250929131011.524842-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929131011.524842-1-a.shimko.dev@gmail.com>
References: <20250929131011.524842-1-a.shimko.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_061020_226749_025A8933 
X-CRM114-Status: GOOD (  13.07  )
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

Fix race conditions in SCMI raw mode implementation by adding proper
completion timeout handling. Multiple tests in the SCMI test suite
were failing due to early clearing of SCMI_XFER_FLAG_IS_RAW flag in
scmi_xfer_raw_put() function.

The root cause:
Tests were failing on poll() system calls with this condition:
    if (!raw || (idx == SCMI_RAW_REPLY_QUEUE && !SCMI_XFER_IS_RAW(xfer)))
        return;

The SCMI_XFER_FLAG_IS_RAW flag was being cleared prematurely before
the transfer completion was properly acknowledged, causing the poll
to return on timeout and tests to fail.

Сhanges implemented:
1. Add completion wait with timeout in  scmi_xfer_raw_worker()
2. Signal completion in scmi_raw_message_report()

This ensures:
- Proper synchronization between transfer completion and flag clearing
- Prevention of indefinite blocking with timeout safety mechanism
- Stable test execution by maintaining correct flag states

arm scmi tests: https://gitlab.arm.com/tests/scmi-tests/-/releases

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/firmware/arm_scmi/raw_mode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 73db5492ab44..fb83beb42e7b 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -468,6 +468,12 @@ static void scmi_xfer_raw_worker(struct work_struct *work)
 
 		ret = scmi_xfer_raw_wait_for_message_response(cinfo, xfer,
 							      timeout_ms);
+		if (!ret)
+			if (!wait_for_completion_timeout(&xfer->done, timeout_ms))
+				dev_err(dev,
+					"timed out in RAW resp - HDR:%08X\n",
+					pack_scmi_header(&xfer->hdr));
+
 		if (!ret && xfer->hdr.status)
 			ret = scmi_to_linux_errno(xfer->hdr.status);
 
@@ -1381,6 +1387,8 @@ void scmi_raw_message_report(void *r, struct scmi_xfer *xfer,
 	if (!raw || (idx == SCMI_RAW_REPLY_QUEUE && !SCMI_XFER_IS_RAW(xfer)))
 		return;
 
+	complete(&xfer->done);
+
 	dev = raw->handle->dev;
 	q = scmi_raw_queue_select(raw, idx,
 				  SCMI_XFER_IS_CHAN_SET(xfer) ? chan_id : 0);
-- 
2.43.0


