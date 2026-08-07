Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9D5C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipEDUjo1dgWKcUN7yswid2Moa8mqqvBMqWr8VJV8G3s=; b=USF88nExokHGWbVj9j3mjWo5nP
	dtjfHRIbR3NurzJ2Cyw868PAr8pH+44JCqSXeHAIkqnUfs+j1osBLlbkQ4aiTkVz5bqmHtApElw8w
	V4POdV22e6buZd/U1qLFDvTyBLZ8vRmQpr5OASjmHqQ5VjduC51nh3yHmDK8f/vRYvripWqji8Afp
	nwnjCvdAhXmBCeek1mwX1odpd+Oj8SXVuMPSwFzyLEZc6Bsn8Rp4ANpQcHMrcwhsyIkMUpzPjem4m
	c5XcTcsMUNXQIpsQU7wKGgiae+tA4Ofi8lcJq+hQtw1ALRhd/h+ZKeYyW5ip/lKga4a6wbNSnUvY/
	5KV84jUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFa4-00000007KL0-3SPF;
	Fri, 07 Aug 2026 08:05:28 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFa1-00000007KKK-447R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:05:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2d004f135b1so37332705ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786089925; x=1786694725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipEDUjo1dgWKcUN7yswid2Moa8mqqvBMqWr8VJV8G3s=;
        b=CLe4Bbj28t/edMq/0zE5V0/99qGz0u6ObJq265pavvlAtVgPLrevbocpIzJx6HZ8HN
         SWafrgJDxVdPA4W0u4+NtNnhrsb1Lxl3BTo+R/psArugwlq9z3vLCz3vcmFtsQhvIRAZ
         FG36L0lxugONw7P5v+mhCXmU2A1YkIBNAjp28A1q6g6qJQFSE3R5h98ABWtBWDXHffNL
         2+5v3mr1W0O8+4VaJQX/uRtoCcQ7CWVPxKeXj2Rk3dDAceJr0JR0//wTnTSIM62eaVPE
         l2SXxtJdYHM9vCUYKEZ3YB8Jer57c1QkS/bNjnbrGv+XdJIkjCNOPg27fNkxh/BiG3jp
         nCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089925; x=1786694725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipEDUjo1dgWKcUN7yswid2Moa8mqqvBMqWr8VJV8G3s=;
        b=aQ7IlU24vubDZk3/BqgTBvJ//JcEaXmgFbUtqXem3UVZa7KxJJkOfnvktfXATYEBf0
         vFfM6C5PPFoFkz4X3bKleJBKqujLIiRLu+vRo/gKptALvZsFZIV9iAqyG6Y6TbOj3orb
         cZbCWI5qgFIJB1BeSm3GG/3442sUo4t78+tZubLRxTpf/bFGjDgCn9HLLbBCizdVzXfw
         E0jxymCR8xB18XMKGgKGPQWGFWlksnIr8DNdfM8lMSVW2Pp1XD6Qnjq7JmVwC9MEGgL3
         P5cc3wt3H5DUomGIREMfmqUMhziYgUVNLKa+887XFjtpmIWDcwZKvN88nFtbkesH31F5
         vc2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqNTPu3RtPTgh7n/DguD8MJsyLBNgg3fdD4w1KC7FhU3EcgKbhT6n+clc3QVfj11DA+PqGXarPomJ5KDC5G1poo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrko1bzl3aSGZsD49BCJzLRSlXm0HH4FeWz2Ep72yBMRSeTOxB
	/axReE6kCIgIznEt/EfQhRDH91Ub5uRB/2/47upCUQZb7jIjmpqO3sd5
X-Gm-Gg: AR+sD106Y0VADWfXHC/mi6oyz2Wru6OdwYeX+eu9Q0JN4EHZpm2TNGW4Jn7rpx/PSEd
	KO0K26f1H9QyY5LlKeM3bhBB093MpaXpEIINyQ7ZoBF1htR+QrDXen3mM/gPNrETJIGYMezufRD
	vFvGKUhXCqumaKctAHNWRQ4r1U3Ayzdoo1AI7yZlxgz5syi1KXhpn9cU9uh0xoj21RQtItnp8v3
	yI7cWWrCujU4DYPbZwuZ9/DX6wuch5luAo3LDiS03lSxH2Q4nYNEW1u8RbekP9KtI4ztAEi+TCE
	+FSTO8s/VjD0Lqzkj7NhJUgE6PEuQp/p58FFsH/QGgRqbiS3hpTiy4yDd+uGkYpL51kAeuYC2v9
	2o+ZdeMDNanYZPVDa1qKOG3xBFn4buD75v/je6HW5/QUqczb0mbbzYybqvKpjXQg42YUU2NxumI
	EUOLDezzkRMvHNVk9DCCqzaxMquKkM2B9bXPFJ6NlADX8E5Bi3j9KcmRmh0DQ65MLL9QukJ7xDq
	81Uj1WMpKgk+VTSNdJoOA+s9v3f+Lom3D09ANAtOSnM5M92xVj5QKOGCoOcACm15RzAL7dtyg31
	imkl
X-Received: by 2002:a17:902:fdad:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2d0ca7fd072mr265470145ad.15.1786089924905;
        Fri, 07 Aug 2026 01:05:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4a773esm5055305ad.65.2026.08.07.01.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:05:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] watchdog: stm32_iwdg: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 15:04:47 +0700
Message-ID: <20260807080447.35479-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807080447.35479-1-phucduc.bui@gmail.com>
References: <20260807080447.35479-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_010526_015658_3D246548 
X-CRM114-Status: GOOD (  14.59  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1:
https://lore.kernel.org/all/20260806062812.26523-2-phucduc.bui@gmail.com/
Changes in v2:
 - Update the commit message and error handling.
 - Propagate all errors from platform_get_irq_optional() except -ENXIO,
   instead of only handling -EPROBE_DEFER.

 drivers/watchdog/stm32_iwdg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index b356a272ff9a..a8d2db2d3cf8 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -287,8 +287,11 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
 		return 0;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq <= 0)
+	if (irq < 0) {
+		if (irq != -ENXIO)
+			return irq;
 		return 0;
+	}
 
 	if (of_property_read_bool(np, "wakeup-source")) {
 		ret = devm_device_init_wakeup(dev);
-- 
2.43.0


