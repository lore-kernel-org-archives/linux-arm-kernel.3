Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE17C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Ms/Lm3glLtAQbh7R8PlfKB/uaxb6UHsWQYOzJ5vMLM=; b=Vp7FZqQN6Wrvk1FpfdwgGpvcrb
	YIWEadh5qDjGYqg9Z8imxgNVxcBk/wUOfbYOrGTqAmkFdDecysNnRguMgb8CF2TK6vYXLNKLtk3ez
	wAsaLBB9EOr+Z2f1RnCSsw+rVwWuumd+jDHFzHaEHWZ/T2jttrI7cTgv/9xkfPn4LGCS28NArF8Iq
	prmCsg/S0IRYopYy6t4BrZ9bGJ39JQ2vMXNKie5a0NBksVG+h1cV1vCW5yDnGSh6GO6CJ0a67SeT7
	V8ZySsjzfFFD3SWO5NT1VScGyD6SWGAe3zjW2ay8xecfs4JUqoQuSs7/ilC//NU6KlF6KyTZE4wvl
	eVFCiWbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf17M-00000002wA1-136m;
	Wed, 01 Jul 2026 20:01:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf17K-00000002w9Y-1vN1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782936063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Ms/Lm3glLtAQbh7R8PlfKB/uaxb6UHsWQYOzJ5vMLM=;
	b=ZpwXs7k69xL7mrYsaqLIj57zp5ZdKYiYP2UOt0Os8cUGOxQPdkLUzVu/keEgAt2zyts1hj
	S2kQ3VoCw6jFopgiWQaKd/xeHUdiHNpi7h5updER2TyF7SEKO9kaq5o0jddWWAn6PgSW7Y
	xsECcgAX67i5tAtFkYmjjM9s44RxqXs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-FobhcWmuNg-wQwkGAARM4w-1; Wed,
 01 Jul 2026 15:59:28 -0400
X-MC-Unique: FobhcWmuNg-wQwkGAARM4w-1
X-Mimecast-MFC-AGG-ID: FobhcWmuNg-wQwkGAARM4w_1782935967
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CBF91808978;
	Wed,  1 Jul 2026 19:59:27 +0000 (UTC)
Received: from shire.redhat.com (unknown [10.22.89.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 18CC830001BE;
	Wed,  1 Jul 2026 19:59:25 +0000 (UTC)
From: sdunnaga@redhat.com
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Steve Dunnagan <sdunnaga@redhat.com>
Subject: [PATCH] firmware: arm_scmi: Use 64-bit division for clock rate rounding
Date: Wed,  1 Jul 2026 15:59:20 -0400
Message-ID: <20260701195923.444270-1-sdunnaga@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: ZAoOxHDva4oxZTxTcJyD-W0qoe5DLW9gogYR9zD4_RQ_1782935967
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_130106_573385_28F43804 
X-CRM114-Status: GOOD (  13.25  )
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

From: Steve Dunnagan <sdunnaga@redhat.com>

SCMI clock range descriptors report rates as 64-bit values. When handling
a range clock, scmi_clock_determine_rate() rounds the requested rate up to
the next supported step using the SCMI RATE_STEP value.

The current code uses div64_ul() for this calculation. Since div64_ul()
takes an unsigned long divisor, the 64-bit RATE_STEP value can be truncated
on 32-bit builds. In the worst case, a non-zero 64-bit step can be narrowed
to zero before the division.

Store RATE_STEP in a u64, reject a malformed zero step, and use
DIV64_U64_ROUND_UP() so the divisor is handled as a 64-bit value.

This does not change behavior for valid firmware reporting a non-zero step
that fits in unsigned long.

Tested on Xunlong Orange Pi 5 Plus / RK3588 with SCMI over SMC. SCMI
clocks probed successfully before and after the change. SCMI-backed CPU
clocks were exercised through cpufreq-dt by switching each CPU policy
between its lowest and highest available OPP.

Signed-off-by: Steve Dunnagan <sdunnaga@redhat.com>
---
 drivers/firmware/arm_scmi/clock.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 42e666a628c7..0278705d809e 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -718,7 +718,7 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
 static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 				     u32 clk_id, unsigned long *rate)
 {
-	u64 fmin, fmax, ftmp;
+	u64 fmin, fmax, ftmp, step;
 	struct scmi_clock_info *clk;
 	struct scmi_clock_desc *clkd;
 	struct clock_info *ci = ph->get_priv(ph);
@@ -749,11 +749,14 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 		return 0;
 	}
 
+	step = clkd->r.rates[RATE_STEP];
+	if (!step)
+		return -EINVAL;
+
 	ftmp = *rate - fmin;
-	ftmp += clkd->r.rates[RATE_STEP] - 1; /* to round up */
-	ftmp = div64_ul(ftmp, clkd->r.rates[RATE_STEP]);
+	ftmp = DIV64_U64_ROUND_UP(ftmp, step);
 
-	*rate = ftmp * clkd->r.rates[RATE_STEP] + fmin;
+	*rate = ftmp * step + fmin;
 
 	return 0;
 }
-- 
2.49.0


