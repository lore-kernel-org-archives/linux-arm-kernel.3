Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E1ACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 14:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PuYIl+8uGgDqehkynFO/d1q3OrzgUTaphIdFn/AeuA0=; b=qw/i38B2HRKQ/LX2lxJfuKmwUC
	zbDAgcLrUXzLEJ9etTW6WaCj163BPJ+Xl69mqWeBEG7wvCdtnP6fTDcVfdEBcMdC00F/Cs4YCMRGZ
	iVuzFw3cN/o0yn7oFEupD9WMykv2xvvDc6ydZB4SA9DKq0/rtKXuijMXTKd2Z3gPle5bYlwIHYKoz
	559AVJqP9k00FF01jGjeNuttEmmYW/jXHj5vi35ACMbph53+Z1v1uaOtl41wCGRJQ6xrrYHH84zbH
	2UZFuNjIJ8byuJ0KDu7otNgxRNpCHtcfxEdtQHI0QAvZ69dTHhnWRRSZ+41mw4RbKvQ8XjCkGEjzv
	QWQ+NdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3EsM-00000002fmO-2cTB;
	Mon, 29 Sep 2025 14:29:14 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3EsK-00000002flw-2SdW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 14:29:13 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so4307709e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759156150; x=1759760950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PuYIl+8uGgDqehkynFO/d1q3OrzgUTaphIdFn/AeuA0=;
        b=gvV/pSV1+yIGQ+Qs+I1jFR8+pbOsChJ/69bg+BcTiYgvny24tvLSlH+K+uCW5d5JJj
         66Q7lAD3IjiKzl0HonQrp0nWWf4t1BTUUl7TKURMVBTcvJdQfujAM2SDzjwq8Zqmnd7D
         fCs/j4SC0NRp/POwTglFbs+HV44zWiHSH4ayl1vXpPUxcNiX0NcC2vjFxUOi1Qq15WHJ
         wTdexvNMiixTsGV0opRERHA+LLBT1EeXOcBU0wAqIiRQQtbqYasdE/Nbcjgyo22V+8Qv
         /Hh8AdGZtSitkiVJiL3KLUaqaBRoarbbmHNwq2wVlYiU8dkleClntIwGwScqkgP7hzdV
         SJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759156150; x=1759760950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuYIl+8uGgDqehkynFO/d1q3OrzgUTaphIdFn/AeuA0=;
        b=j2KguI+jzqO0S39vnIcau024ynvXqHYFQxO33qrm7Rhdq9inUrQdWbdVbZrGZEPuNm
         dOulyLrq5z/H8FeSfwUnR9/ApxPgp0vT2B79NfUoCOmOl4ka/JIOpEd7t5Siv3a+nyak
         T8uPz6Ba5ZCuijhfM+a8RmIHKj5glGW+GVQ1CIpMCETso9vPJLcVqmnXH8Ga3EIPxM4k
         5W+Bwh6mSal1bxGVF6icEdw/tvQph1Snhe0KGvkFF4x0gjdwlJCBS6DclkR++XCOteAy
         GC1+b61byvXG2fFZHbD+FY4t2Km07IS/UTq9tqPDtatzcMg8NfjnQN/sOknZ8Bnabz3L
         6OGg==
X-Forwarded-Encrypted: i=1; AJvYcCWwWft9nCWPKhHQiVfMP5fH6WaoMimRYVCNfU9QBcBK47olP961ZXRYwBJ+azfC//908vq31d0omh01nwLvDQy0@lists.infradead.org
X-Gm-Message-State: AOJu0YxqQowpsdVjcAzSie3HyHGXqiVIgWVmTTFsjvekwW3zWf3ARa8i
	ezZXhaJRc555s6SC4f61Ab2x5IoYWbpoegb/lwtJH7kf/3rzs0PqkHf1cChpDuwE
X-Gm-Gg: ASbGnct95SoaFYg+ef5iPtYGkfxrtcTg/z7ZtX7mayItf3uGhsMjBW5JHnWZJfUhh7L
	xTuIz5a/KdF/M1H6zytQdsO4pAJOIRRM1Put5tHEsqcJNTQnyN21Siqr4EHp1UwPfqzEP0srJ2l
	yyesC/qJs/QHGbuUavnfUeP7G7xGDNFsBg/5p4r/xaXEOVQufKc6JDfGdnp5t1eHLLIj6iP/k0r
	LXFtvhF8kEeKmZm0pjX7FUsVgW2YE/uNaWIDt3Qv+/NjAMRwDPEHZRJ2qyP3fV5wzxkeuTaprQN
	ajL8weUxVPm8ByAo5C4vFQVc4UIXdWAm9DyY191CK2LzjMaXAW3WWgaD4jEbTuV1fLG0C2qQa0N
	/T5FNJ4SMzOWhzIqNEytvKgA3th/jytaYswq8npWi
X-Google-Smtp-Source: AGHT+IHkQVN+odoYfuINw3uwnog4DYG5PmzCIdc5SPqPqj2wtSm+xS9JNe3lu3XIGJdMoU+kXWnvlw==
X-Received: by 2002:a05:6512:3d08:b0:574:7258:26c0 with SMTP id 2adb3069b0e04-582d0e15ed7mr6023408e87.17.1759156150185;
        Mon, 29 Sep 2025 07:29:10 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-586b0c1fc85sm1525737e87.64.2025.09.29.07.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:29:09 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
X-Google-Original-From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: scmi: Add completion timeout handling for raw mode transfers
Date: Mon, 29 Sep 2025 17:28:55 +0300
Message-ID: <20250929142856.540590-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_072912_658210_6E65D0CD 
X-CRM114-Status: GOOD (  13.63  )
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
completion timeout handling. Multiple tests[1] in the SCMI test suite
were failing due to early clearing of SCMI_XFER_FLAG_IS_RAW flag in
scmi_xfer_raw_put() function.

TRANS=raw
PROTOCOLS=base,clock,power_domain,performance,system_power,sensor,
voltage,reset,powercap,pin_control VERBOSE=5

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

TRANS=raw
PROTOCOLS=base,clock,power_domain,performance,system_power,sensor,
voltage,reset,powercap,pin_control VERBOSE=5

An example of a random test failure:
 817: Voltage get ext name for invalid domain
     [Check 1] Get extended name for invalid domain
       MSG HDR        : 0x04585c09
       NUM PARAM      : 1
       PARAMETER[00]  : 0x0000000c
       CHECK STATUS   : PASSED [SCMI_NOT_FOUND_ERR]
       CHECK HEADER   : PASSED [0x04585c09]
       RETURN COUNT   : 0
       NUM DOMAINS    : 11
       VOLTAGE DOMAIN : 0
     [Check 2] Get extended name for unsupp. domain
       MSG HDR        : 0x045c5c09
       NUM PARAM      : 1
       PARAMETER[00]  : 0x00000000
       CHECK STATUS   : FAILED
           EXPECTED   : SCMI_NOT_FOUND_ERR
           RECEIVED   : SCMI_GENERIC_ERROR  : NON CONFORMANT 

After making these changes, the tests stopped failing.

mount -t debugfs none /sys/kernel/debug 
scmi_test_agent
[  127.865032] arm-scmi arm-scmi.1.auto: Resetting SCMI Raw stack.
[  128.360503] arm-scmi arm-scmi.1.auto: Using Base channel for protocol 0x12
tail -n 6 arm_scmi_test_log.txt
****************************************************
  TOTAL TESTS: 167    PASSED: 120    FAILED: 0    SKIPPED: 47
****************************************************

Link [1] https://gitlab.arm.com/tests/scmi-tests/-/releases

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hello maintainers and reviewers,

This patch addresses a race condition in the SCMI raw mode implementation
that was causing multiple test failures in the SCMI test suite.

The issue manifested as poll() timeouts in tests when using raw mode
transfers. The root cause was premature completion signaling and
SCMI_XFER_FLAG_IS_RAW flag clearing before transfers were fully
acknowledged.

Thank you for your consideration.

Best regards,
Artem Shimko

 drivers/firmware/arm_scmi/raw_mode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 73db5492ab44..130d45192beb 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -468,6 +468,14 @@ static void scmi_xfer_raw_worker(struct work_struct *work)
 
 		ret = scmi_xfer_raw_wait_for_message_response(cinfo, xfer,
 							      timeout_ms);
+		if (!ret)
+			if (!wait_for_completion_timeout(&xfer->done, timeout_ms)) {
+				dev_err(dev,
+					"timed out in RAW resp - HDR:%08X\n",
+					pack_scmi_header(&xfer->hdr));
+				ret = -ETIMEDOUT;
+			}
+
 		if (!ret && xfer->hdr.status)
 			ret = scmi_to_linux_errno(xfer->hdr.status);
 
@@ -1381,6 +1389,8 @@ void scmi_raw_message_report(void *r, struct scmi_xfer *xfer,
 	if (!raw || (idx == SCMI_RAW_REPLY_QUEUE && !SCMI_XFER_IS_RAW(xfer)))
 		return;
 
+	complete(&xfer->done);
+
 	dev = raw->handle->dev;
 	q = scmi_raw_queue_select(raw, idx,
 				  SCMI_XFER_IS_CHAN_SET(xfer) ? chan_id : 0);
-- 
2.43.0


