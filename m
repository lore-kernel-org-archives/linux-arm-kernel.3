Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A780E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1Ep2O9wbC6ZlfsCLYQrAmWucAGOrIVsXyOuKD+Yvgc=; b=sTtYC0nUyVgfGRSgGk7539upxM
	ifoH3D3PHWkofC4A82051EJ2dDklk/fQQDSAhuqAFYaJDZrxn9O7ucSj5lG21Vjbkz+J5CTPHMVuH
	9MUkacOMU2tjbwcZ4mPEDYNM4f9whWRDmE2Setdh1oO6JpNRQpbOGhNBhHyGgIcBXRTfA671zeIXV
	ZpryY8iidndswxIIjXiCzOIrANCQrranRqH02jyG6hM1zPrPyTH8Tx8iCeeKcvbz1SpS0pqx3r1dD
	5O5AbobEh8kujyjXaWkQ/xlL9pGOLICYl6qCnyd+g2opsRQsnhX9+UI356B+bpkCRkGB4fnQ/kkTO
	RTtxZmsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgeJ-00000002stN-1tlM;
	Fri, 06 Dec 2024 22:18:11 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgZN-00000002rxb-0ZOa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 22:13:06 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-215348d1977so21642965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 14:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733523184; x=1734127984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1Ep2O9wbC6ZlfsCLYQrAmWucAGOrIVsXyOuKD+Yvgc=;
        b=cexxNts7vm5T3PYbONT88FGLKi06Hg6iujcqWfAHCWpSF+a1ivcfQVMb/dFn8QAKF2
         hGeAkYOHE5Ci47q7VmcSUdnIy/OsQmjr4K0+/tEZZbl19BLquapg955SawQxOeKCk7WL
         PI8Xr/8jfCZCAFI30v4PdJ0kLqfAY/RrYEt8rMEjssm4I7syj4SzbFYkE/72hWaqzHfk
         /EGHIUCnJQ+SABXgPKvBoNDkCQq1ODTxUcSmi7CzZ6Mtd+EgUToKCbr94uP+i6KKeVmU
         ADpG7BW8tZ4Scf6I/ue9/kT7x0cTTiN/P80n5KsZ7ust6Yr6AHdI6AM2b+glMcevD70g
         LIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733523184; x=1734127984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1Ep2O9wbC6ZlfsCLYQrAmWucAGOrIVsXyOuKD+Yvgc=;
        b=TiceEb2uGO6uesUy02UvGT6y7W0MkhaIltpT1Ry1xnoK2J854fh5leu/rhzsDaFFk8
         JkcZqG73Y/P1MC1Cuz0xq2HwUD4+wsTBxsyFigDn6cIOEQCj2dslnn4xL60xjGrysXRn
         6EtRC+DJqLkDhIKfsrnz6Il4M8dT/hukM5WslXzlh1OjnLqVR+uz/ZviPPK1SqPiw5jk
         wMQy/jHgY+75rbuKHV6KfNO4jtK+VHuSQrA+7gQK7U12qLQatqKqAm+/Zj7JvknzfVgu
         q3FwXJx0npNo25IApzltujl9no3NfKDk+L2R0PIACrz3G2nGyoBLQz0+tV+R6hWLmaBI
         Gf6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvpptxxYPvQGXOvFor/tFrHoRpy4DWjW9wpfqzvTpWjFmZapVDJpZzDEM/Z7oqn2cgRE54uC/+a/LwZeqZEWP4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx10VisTqdJ13mD/LXPvzDluufysNYrRdm1o0swhSyr8UzcEi3e
	wb0J93Gb9Exe9xQntp4Fv6jj6rFx36tqjJEUPpFzcJ9l9SayWNattUiXGT6oibM=
X-Gm-Gg: ASbGnctqYb3RG9MtNpibKVjqgBPTOk/arSltY4cOcNaykYRhgZmFtMxQ2P1WX4kxt7O
	3Ej5PGnxfI670vDYGwx6oYUCiVsgC84QHGNnMSbP/H2Wm4oZ8buHLptASoQAsGpE3zISVM6BIdG
	mLd+G1tyca5gmgkhpT5n9QCZg/jhIL0zwH084IltzApA7FzkxUtEzvbRZ+lAYvIWfTlTp4MDfOA
	8qeCMSJQWqPPIQlaiRDKBFyvl8q+UcxpNaYq3KaZOXwQZRR
X-Google-Smtp-Source: AGHT+IHV64TQ1MOmZpTLIsCVD0ziIh77UI09rSBXDq+X4jwn5nrPeDN6Vm4VrpDkqcW6GWDyrxNBiQ==
X-Received: by 2002:a17:903:249:b0:205:4721:19c with SMTP id d9443c01a7336-21614dcda61mr70577895ad.37.1733523184271;
        Fri, 06 Dec 2024 14:13:04 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f09120sm33444155ad.177.2024.12.06.14.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 14:13:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
Date: Fri, 06 Dec 2024 14:12:52 -0800
Subject: [PATCH v6 3/3] pmdomain: ti_sci: handle wake IRQs for IO daisy
 chain wakeups
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-lpm-v6-10-constraints-pmdomain-v6-3-833980158c68@baylibre.com>
References: <20241206-lpm-v6-10-constraints-pmdomain-v6-0-833980158c68@baylibre.com>
In-Reply-To: <20241206-lpm-v6-10-constraints-pmdomain-v6-0-833980158c68@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=MvYLl1dkczYVZlHhGI19Lnk7zfxJItmwrZlS8xz45cc=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBnU3bsod2B2Q8ODRoP42LqdWQ/Hgb2ui7QUvDSt
 j6QUnJ9692JAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCZ1N27AAKCRBZNxia0/vG
 ZWpiD/wN88P5QYO0MxFMU/+oEkdJG9BPIJa59vyGq6XcClgTY3P1szdPJum+NRMgyjYE8GeXT9F
 Ou6dZP5N/1KV8FAnqUkVJI4kuopqiGzO/F2jW6vY047ixx6MQrpBuhIDKowMEzItRjJxfZMRb4X
 AvOJhHUihsPkVHICxUdUYEoaKpdlbPl7NFTDuzLM5eoOFbmtwl5riyz8q9tnKsKC79nwBJ6o4Ko
 avT8z9TAefa3XBuOMrI9M2LYMA+bua+Yh5VYLHYmm1Vs3VdIowjoKPJ0ThUMz4OFq8sEbBspG5i
 24O25Zd+q+dqR3xflEDHcVhxkb/VYlmGqkIY/awyW3IsMFiPgoPb2c2FJYktQVl/wjJfnVb/4UX
 PoINOLb+w7juAtJKByKaUxvUQBd4Z6U1m3ePJVfqXAik5KvUX/3jo2JpGoJozlMxppAxp66NpTn
 GwK4Yj8hCtPd2ELxnYpPv5y1c3IFZ495IjzVbemGzHjHWQ3PnjcLZv7KcDZdkoZYc9I2ljyoZV6
 ew5zdI4DBoZ4eIhajTwKrekEHg6LEqJJhjwFYyZ7N1+gTum/WH1wZXGtePL5OE6oEPIr2nquWTn
 HZQaMqJdLZ2es2OZP+MGBkXEBWVhOfCBjdzQN67NQk7qLd0L0/CY5bo4d/CoL+nu5/q3apBAvc9
 L4PxM9YgNeY4bIQ==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_141305_224919_12994644 
X-CRM114-Status: GOOD (  13.03  )
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

When a device supports IO daisy-chain wakeups, it uses a dedicated
wake IRQ.  Devices with IO daisy-chain wakeups enabled should not set
wakeup constraints since these can happen even from deep power states,
so should not prevent the DM from picking deep power states.

Wake IRQs are set with dev_pm_set_wake_irq() or
dev_pm_set_dedicated_wake_irq().  The latter is used by the serial
driver used on K3 platforms (drivers/tty/serial/8250/8250_omap.c)
when the interrupts-extended property is used to describe the
dedicated wakeup interrupt.

Detect these wake IRQs in the suspend path, and if set, skip sending
constraint.

Tested-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/pmdomain/ti/ti_sci_pm_domains.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
index 587961519dcc9e13c32efe76cdaf801281f72f67..3fb78343d4388a7087dab5061c1127586968ef19 100644
--- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
+++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
@@ -87,6 +87,15 @@ static inline void ti_sci_pd_set_wkup_constraint(struct device *dev)
 	int ret;
 
 	if (device_may_wakeup(dev)) {
+		/*
+		 * If device can wakeup using IO daisy chain wakeups,
+		 * we do not want to set a constraint.
+		 */
+		if (dev->power.wakeirq) {
+			dev_dbg(dev, "%s: has wake IRQ, not setting constraints\n", __func__);
+			return;
+		}
+
 		ret = ti_sci->ops.pm_ops.set_device_constraint(ti_sci, pd->idx,
 							       TISCI_MSG_CONSTRAINT_SET);
 		if (!ret)

-- 
2.46.2


