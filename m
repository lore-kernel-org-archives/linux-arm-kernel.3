Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8791DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHEdC4q5HOXKpIiXdASgYuczbCo+pyIe2coh3mL3YAQ=; b=RjpX4q46zI/jp72HKA6EELieAg
	ykKqqRx1WD5+sQATVEWXguDgOEM3jboSzO7oyn8WxoB5P0rQ/wauOHH/FhwnOl4f8LDssow2XIaVm
	DzFBYi2W848S+63O3BOt20rjbr0X+t7GLqIm3MRqlnMg8hencZCnHk0wPihmR+o4JtNtP+e/fVl1p
	ivhvcuMQPsCV6Vz5Y0GxgAdJRzlj/VsCdzdSxDmlNPeZFqMU2V669+qqhilfVUrRc2C9rkxvIUg0J
	AJ4X3QM+djXgBRNtgihrRvVmlcqA+XM2wnXmosPlbXPllSRpZgsHFdjwddB0CjyJAKb63MvfyRtF8
	h2v+Ww7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4lMY-0000000CzkA-3laD;
	Fri, 03 Oct 2025 19:22:42 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4lMW-0000000Czjp-0wY7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 19:22:41 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso3117712e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759519358; x=1760124158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHEdC4q5HOXKpIiXdASgYuczbCo+pyIe2coh3mL3YAQ=;
        b=KwOUQ+CbE1TsyFYODuZtE1sTpnKR061L05d80KnpMGYs4OLTlpqKRP08p/vfMR6+68
         06W7a1Ft3cENXYnlRzeEQBCOygfAxd9P5XONb+t9pBT1viAU2v0pmha1RtzD/ESb5SAc
         pTK1rkREV94V5JXI0BqhyM3xItAUYanJqJ3WYHoJGuRmKNKaZGVDio38b1F7k6rjEPA+
         MKPtUCeczVr0yr5+0xX8t3hRQCFlPQgM8aziO6F0rhY8OxN/SGrxYVutaJg7kclZtMus
         WsaLvhGyUZZ9qUMGkBQ6nzlaLWL8nP6ju76aWkG0kIroZhMvZpVU4g33dMxUALDhEIKm
         xFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759519358; x=1760124158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHEdC4q5HOXKpIiXdASgYuczbCo+pyIe2coh3mL3YAQ=;
        b=Hd6MErNUnGBnaG0aKUqTfQ/Kg5ey6ZoxjcYtcODz3utB5+h2zv6RGXVal4tDDpK7t+
         DYHFsqufgplXJRH0hJ8WR8sDV8gyd9RCsX/+tewiTc6LpTkQOr6ftLB/TjTis0ASm1ax
         5VVaTM+n4jFeLBIDRNs3IatPd+ShktU58KB4PLS28cNGIkuVR5KuB1IbNaGLgtiERlZX
         7gpIEgp6jdeX/Y82Nn4xvZTjlPoAmXFqlJN2qeKtRv9AWqOV/FMsPVglArsZw7ivdbZm
         XefBIFWfSt76x30V62QCvmgPOe9gMpRkmFjeCUgGx0koaRV5qR6qJ+C5rzkJM4FzdvYL
         wZOA==
X-Forwarded-Encrypted: i=1; AJvYcCVA6VN+iQlCFZj/bkvh7dRWbx1IHxLqyt7q3kbhoEvTeAkO8306aUrCHWc+9dO92nO/9N7/4BoOXSCrFLORHMX+@lists.infradead.org
X-Gm-Message-State: AOJu0YzIN5WLE0zmuj2OR2o2Dol5kE8EEqnXnz+GHPUeryRo0o+psPyP
	B9bzDXjifJkEdJo+AYTfghMi/EDquXzPj3Acd+jyNOxLG6kkstScbfHe
X-Gm-Gg: ASbGncsy/0hb8DmZLjtfJMn2DOtJDA/ZFuFPScMmD9P/A1MudSxcdJrV21nE65pVttX
	tDmmK1ofq4mxKzz9+AhGCvI2KwRidagmoZ6qNv89Qy4oLB6trHGykU1qUCtoc0aNWZPdY7hHjq3
	xYIBlYk9sf4tHWsRHtomL5mWLIVyGLCrb5VRmHN5ABYxbHCVzxUiHyZrGOLRL9Y2qjjBWFUtzIm
	ZelYuRIVlW6ExvA8x28mlREj5i8mmRxzbWJ5H3Dwly1Pj7JdVMUX0tWdjcquTjjDzXOHBcFASVc
	W1bhpSdGg1Qz5Eyko2l7kxjkQjoxwibmQu8Z+4EuwZZ9Uil+4HZWqqntISuxg6JawVN89jr/GMC
	hiVaJ5Pok5y0nP+37Zl6DiI4Rp9qflmrFLOuYLxWDxDwwsg==
X-Google-Smtp-Source: AGHT+IEfPGKgh3f6VXqkifycv9gBhD43sy5btZBZgWTDY0sG+tyqEtREfAfN3cAtFrAeYl/L3dZOXA==
X-Received: by 2002:a05:6512:3a92:b0:586:2e4b:22c5 with SMTP id 2adb3069b0e04-58cbbfc331dmr1195941e87.56.1759519357553;
        Fri, 03 Oct 2025 12:22:37 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124438sm2097546e87.4.2025.10.03.12.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 12:22:37 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drivers: scmi: Add completion timeout handling for raw mode transfers
Date: Fri,  3 Oct 2025 22:22:33 +0300
Message-ID: <20251003192233.1618447-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929142856.540590-1-a.shimko.dev@gmail.com>
References: <20250929142856.540590-1-a.shimko.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_122240_294176_A477CF13 
X-CRM114-Status: GOOD (  13.96  )
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

Fix ensures:
- Proper synchronization between transfer completion and flag clearing
- Stable test execution by maintaining correct flag states

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

$mount -t debugfs none /sys/kernel/debug
$scmi_test_agent
[  127.865032] arm-scmi arm-scmi.1.auto: Resetting SCMI Raw stack.
[  128.360503] arm-scmi arm-scmi.1.auto: Using Base channel for protocol 0x12
$tail -n 6 arm_scmi_test_log.txt
****************************************************
  TOTAL TESTS: 167    PASSED: 120    FAILED: 0    SKIPPED: 47
****************************************************

An ftrace log with of passed test:
0)               |  scmi_rx_callback()
0)               |    scmi_raw_message_report()
7)               |    scmi_xfer_raw_wait_for_message_response()
7) + 22.000 us   |      scmi_wait_for_reply();
0)               |        /* scmi_raw_message_report*/
7)               |    scmi_xfer_raw_put()

An ftrace log with of failed test:
0)               |  scmi_rx_callback() {
0)               |    scmi_raw_message_report()
5)               |    scmi_xfer_raw_wait_for_message_response()
5) ! 383.000 us  |      scmi_wait_for_reply();
5)               |    scmi_xfer_raw_put() {
0)               |  /* scmi_raw_message_report*/

Link [1] https://gitlab.arm.com/tests/scmi-tests/-/releases

Fixes: 3095a3e25d8f7 (firmware: arm_scmi: Add xfer helpers to provide raw access)
Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hi Cristian,

Good point about CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX. 

I can confirm this setting doesn't impact the test failures in my environment.
The issue reproduces consistently with COEX both enabled and disabled.

Thank you!

Best regards,
Artem Shimko

ChangeLog:
  v1:
    * https://lore.kernel.org/arm-scmi/20250929142856.540590-1-a.shimko.dev@gmail.com/
  v2:
    * Use simpler approach suggested by Cristian Marussi
    * Clear all xfer flags in __scmi_xfer_put() under spinlock protection  
    * Add Fixes tag as requested
    * Drop completion timeout mechanism from v1

 drivers/firmware/arm_scmi/driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index bd56a877fdfc..0976bfdbb44b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -821,6 +821,7 @@ __scmi_xfer_put(struct scmi_xfers_info *minfo, struct scmi_xfer *xfer)
 
 			scmi_dec_count(info->dbg->counters, XFERS_INFLIGHT);
 		}
+		xfer->flags = 0;
 		hlist_add_head(&xfer->node, &minfo->free_xfers);
 	}
 	spin_unlock_irqrestore(&minfo->xfer_lock, flags);
@@ -839,8 +840,6 @@ void scmi_xfer_raw_put(const struct scmi_handle *handle, struct scmi_xfer *xfer)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
 
-	xfer->flags &= ~SCMI_XFER_FLAG_IS_RAW;
-	xfer->flags &= ~SCMI_XFER_FLAG_CHAN_SET;
 	return __scmi_xfer_put(&info->tx_minfo, xfer);
 }
 
-- 
2.43.0


