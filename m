Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7162E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vJ5gzpYa+APGJDBpuV2gyqdCOt2zO7G8uCRrZjW9y0=; b=PSlfIAySDRtdjsmEz52dgcuczb
	rF7UQ2ui225se7shbGxsIbTqQDO+0AT9fB1liY4SLvISRTumg8laFmZBoLa4JGBuageFTnXKOk9ET
	6b8+MGO8vTwr6sJb+GLDXQlOE2HPUj5UMqcT6N7WI1UaUAkhx5Cz/uYJJeUpREads4RcVnTPY4RxZ
	gJmEPz4l/YxZTfWcQciguNnCTlmq2xl56ZkLhFaObV6tkyCh8SY6SW0e3I6r7T2s0JQ0v/io1n7uC
	DCIeI7DMh/PWyFJK81GfO1RFHqcAT1c+VauYWbdF31H8pfFkD6oFuqvVcbU2gNivqrwb4+gQ1C1Fh
	MXHghpxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQdD-00000009AhX-3klJ;
	Tue, 03 Dec 2024 10:59:51 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQPq-000000097rv-1fWO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2vJ5gzpYa+APGJDBpuV2gyqdCOt2zO7G8uCRrZjW9y0=; b=SMxnv0KZn0jLSnJChxqT2LPcu2
	+wnN8N+LoFav+6urlxBrWNkaTklnvJ7hvApd2rCIbsWT21LNHIWq57KeMsRno6e7D+UYw7Q+mJJwT
	cjl0hYjG+FoLqUGvde1PUteQE/esQU0SDJvuTu/C6g9XvQ3iCXeM2s0fo0rnot5zQctpRZ+NtyZ8Z
	fARD3fHMsQS/SxDZhgRDZddLznjDNIHCtO8VsmeeLeEi4Ipwi/2hzPimnUMSBPPdwT2KBgSCNs17E
	9sm8VEmTOFyOZhgTe5x73s3s8r95SHHuzCG4AQ20XLIjAG6NpWED//3b2axW98K44RBCLm2DCVb+G
	FNcSoolg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIQPh-0001Ov-Ro; Tue, 03 Dec 2024 11:45:53 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIQPh-000L9W-0p;
	Tue, 03 Dec 2024 11:45:53 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 03 Dec 2024 11:45:32 +0100
Subject: [PATCH 2/6] rtc: isl12022: Fix initial enable_irq/disable_irq
 balance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rtc-uie-irq-fixes-v1-2-01286ecd9f3f@geanix.com>
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733222752; l=849;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=aLsSYnYzd0GPXM1Me/YHB+us7IQCUlk6jk1u8U6Lfns=;
 b=uWTWtCFJ+1XCx6axiciAWY6NQo5kJc0CFu2XxJjYzRM1XOX9JP+ysUOosmQa4MZgpTO7AdLqP
 /u3wffJpPH5DOdWaMPymcZHBnZFpCiff9tEbSgtJNcokq4fsFxkACtU
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_024602_483837_86142558 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

Interrupts are automatically enabled when requested, so we need to
initialize irq_enabled accordingly to avoid causing an unbalanced enable
warning.

Fixes: c62d658e5253 ("rtc: isl12022: Add alarm support")
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-isl12022.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 9b44839a7402c9ab7da634d95152c2520eb8552e..5fc52dc6421305e957a0c3a169009c3f6a6c7320 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -413,6 +413,7 @@ static int isl12022_setup_irq(struct device *dev, int irq)
 	if (ret)
 		return ret;
 
+	isl12022->irq_enabled = true;
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					isl12022_rtc_interrupt,
 					IRQF_SHARED | IRQF_ONESHOT,

-- 
2.47.1


