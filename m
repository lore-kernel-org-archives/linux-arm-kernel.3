Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF97DCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 13:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1TScXo9HlddRXxyVV537w+xJu4r/bR5+Sl4AGG4P1c=; b=zLKhHITBONoNNrXUc3MTEyBN15
	45Es4g3Fw6kHHkdvbiPKNNBjHkToGcVREGKdeekse3Dxo9exNuaE4F+rt+BidQLTELxtwb2N95qCt
	OqBRXfCyWRavZgEEJHv05ighs/HvIq9uEutGGIpmusVf+T0hQEWVDtk22wjE2p50/ZYLP0Eg+tugI
	odYBLYs4WzMkFxZY/LgImEQZF79JosvBz7muoHtdQdAYj971vqCCeKRQYF5i3oWiwwrFArYKKcUpQ
	cfUYTmhyN2APjRQpaFw9jf3crg51m4wrucwtcNvyGVDyZej+Pgg6+91XflNF35bKCq9EOrOgV6BJI
	Kjstq1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Di2-00000002XDH-2yYn;
	Mon, 29 Sep 2025 13:14:30 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Di0-00000002XCs-0kiR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 13:14:29 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-57d5ccd73dfso4780686e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151666; x=1759756466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1TScXo9HlddRXxyVV537w+xJu4r/bR5+Sl4AGG4P1c=;
        b=TdyR4LaDA9kAjGFcj3I4+wS5Y7GCmpbglk/UgfS5DpdPiQjwbkvh2qJeCW+SZdXh+E
         hlXo5BVwBfm0R65frCOLFila7ShC1BH1ES9prYIONM3piM8TO8jxycZJluu3x+lr4JbL
         BB64QC4R9onVZVExKKWMqb/pWxN69Uk0k6kxUBozebOUEHDQaKiviYcBOvKec/YwIUKt
         YEPD8mVEwawFh7EhasX3xjXTopTv/9UEO31+FPnZ4quoB7d9SZxHA+PT2oIj4xK1+2N6
         eVi7EE1EJheB6uZv4VeSc7NHRGKdvZggtezK7bhmpN/gbdOCkfkorn+c3KxmKZ8bsL+f
         p78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151666; x=1759756466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1TScXo9HlddRXxyVV537w+xJu4r/bR5+Sl4AGG4P1c=;
        b=XAfAZbg5FxxQ6NgmG2XFDW7XzA7lDxQSNZKIkRPPKe2myMsws0pMOffkIddTTiRo48
         RBB4/y6zjnh3OWSmmqNgbVYtb1sN1Di1pZL1IUitvkeU0AVQe1Qu5fmN0Hp25Gqd++oX
         /FpOfy2UNrzTgiLZ9UjUk0SMQWmAxF6yCfSfp7CMp9efvXo7fpjWHtDTlXXjmK/P7nnT
         3xGMJR/C90IbZ0vILWM/thwrbggW3R7ppuLQur3Mdk+a/0lLnI2OhG7WPyyz25JjiMxB
         p5Vcurmfk+4JmqgYgtIzTC6uQeJAXXe1eGqehqqlArwWyad2u+u4hTUgr+xv5eeFIwjp
         sYAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHU4TeS/uqqZYsvQXNkZmTP+50Y3YUozqrHPeOLaVPpeyEpeMzXKOO0K5I0x93Yh6XWZjyts6ZlHSABc1jl3mR@lists.infradead.org
X-Gm-Message-State: AOJu0YxXMpIMwHBsgGK08LvkKkv037WwZRzO52nCiBCtI880N7QFhgdr
	fJrOM0/Fzz+EQKCsD3dt5cHJMmks3Mx/M6/VVYuzW0nwJHkcNCMWg8MGYAzW6jM3
X-Gm-Gg: ASbGncuMuKODhuqocy8fOTi0HpLg89VzjAnvgwKLLB5At1p/mpGVXnI2XglGXc/becB
	XMpNH1zUWq9TvvCzWQpsKJ9exsR+q8ab/GTOlypM6LawTB8u8krWVKyLWIoRdqt1e061YXum3SJ
	Q6jsdb3GUVF10SzR0gBl3h5rQ7kLBGYIuyKcjzvosL9HN4HNsnpfodTy8GhiuejyMgWssoxmaWQ
	cbAMKUbTQodKVr5Kwt2uyglNx8qaQoFLsEM9ZhHhki/vCcrvY/vPtDx8BUrLHFI7xxirLsrpphA
	4uqLtpy8rHJNmwoEmztaiZnHWUZWm7P3RH4MT2jqzN6kEWBP+z373vuzHo1bYcPP1Fhi5wrI9jm
	plRhlB9DjO6qiaFofslCq7PNIBqVSbIkCnjjzraGN
X-Google-Smtp-Source: AGHT+IFdZvltpHwZV1hUFDUAn+X1LBVfg1iTgq2zM08qx+yjkvQ6KOYUEgmP09Fpq9EwiTOtStUDCw==
X-Received: by 2002:a05:6512:224f:b0:57b:7ca2:f02e with SMTP id 2adb3069b0e04-582d092db20mr5490234e87.12.1759151665722;
        Mon, 29 Sep 2025 06:14:25 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-588767b72e3sm461758e87.41.2025.09.29.06.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:14:25 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
X-Google-Original-From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] rivers: scmi: Add completion timeout handling for raw mode transfers
Date: Mon, 29 Sep 2025 16:14:21 +0300
Message-ID: <20250929131422.525315-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929131422.525315-1-a.shimko.dev@gmail.com>
References: <20250929131422.525315-1-a.shimko.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_061428_232036_2EB6775F 
X-CRM114-Status: GOOD (  13.17  )
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


