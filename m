Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCF3CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 08:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rx2QX5K9is5rKmLAU+EuwGG/waj5UvUtwnyY95MhkWg=; b=DkR8KYseKDWRHB24Wogs4olpUn
	VRGDvMWNttTzYJaiFNSxoDRzz2rtZAbB0Mc53W23GXdCt/gTGUXPuDkhpGomixfIHWFa3qnJUOU1+
	yuOWzj/PPWFmVQmaNB2jm5EwnvySzEM2bhRzHEnYwvZkapI91Pgg1FsknmPvwTf9JdxC7/n2Am3Na
	fh+IgLcn8qztv3qEOLP2S92dY05fQPFOcGts+amP79hWeLdHJtxgyH7VaZo3c5nTg1hxasHpZzAaO
	FTgmX4q/CJnoiQQx1b6Ty1iZNQS9NFrXowx8p6SlCshDhpxEQW2KsYpjfnvESv8FJe84VahQVbXZ4
	UMKvZH+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOWUl-0000000CL3t-19ab;
	Sun, 17 May 2026 08:05:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOWUj-0000000CL2h-1sM1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 08:05:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2b788a98557so6883285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779005104; x=1779609904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx2QX5K9is5rKmLAU+EuwGG/waj5UvUtwnyY95MhkWg=;
        b=NQ4KIujnx8DE1f4SGdGMwC6HOX4g+PJupup9TRdrGk+pPhWgpLqOEYRFoFHFbY4wGH
         jETqjknXj7mnTf9m2qMqPqkrH6jkOdZ9vQ0rIFt2OohPCPLX6i6w8HWgWZJIC5KEPoSW
         CxtR0JakLAyWJywCeceCWX4nb09dEoQ5YTQyRPyVqmE/fJZgCEksVon4HwapKNhkdwpU
         pqcRvwHmWqr47ovfgD0KPruAybCz/IPOnO0SDHSfvwdVALcJP1eYSOntFGo27KBhUHMT
         U9VsdxN1RD/ad4c0TP7CDzKdw6K8PEx3GyH1e9gw6rL5NVeus/TtETRdE/0AH9TN/KpH
         La6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779005104; x=1779609904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rx2QX5K9is5rKmLAU+EuwGG/waj5UvUtwnyY95MhkWg=;
        b=AvXK8ykAdBPZwG2TxR8g7Q4gkegOZ+S6PIJZxQ6twf7t0WDg0wB7icKJXL8Uq7iY/D
         EQsODcIECsCDZ6vjBSVEmSIFfZAqhKXHg6Wb7ffDOuGceFraVLu16EXdxuTeerSAUoNz
         Ji3Ut4ZUg2sbZ5IaqCVaPU7MqMIJhNJSSQcnLho7wpaKqEM4u78afY9UGSzGhZ6j7tmu
         oDpSVjUi7a2iuk9vxX3s6KH6YosF5WKn3Rkf41c24SBWMYAXxWULZtniyvr8P3PdSl+T
         Z68SQz6H5jjURyRi3C6pzhCsUG6uDZWPLkki3tlewkpKmEjnnnbamf0AQtI8zS1eBuJs
         zZ7w==
X-Forwarded-Encrypted: i=1; AFNElJ+L8z/9aQbieS8Fq+dUdfwkqCo6HkGnLsVKJHYuDIuiGv2S8PkFHHC7/JWOztv55wKenaDlqW7xDrOzlhUXb7JN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9W6MCgvbW17bizZL2Lz0YFtz0lXbkW3UgfIMnQE4jU2eCxQ7i
	lYniGio9wQVM25Dm4FvUeHhadHewNoW6Y4rsBellwbmJK5MS+5ojybz/
X-Gm-Gg: Acq92OFjT1Xn369xVrLo2MGd1SHdLeTm+J7kU6jgKlEpE6/6WpLCy/67y8INLFsQCNq
	bKWaFT9O8PmUiWwE0b6F9y2cDUwrM3zJX/jmja/Z/XPSpM9eZ2BIQktpziDt29qDgDr5m3cWfXj
	GOgf++tX8gtdeu2CmckXSmGV4r6meYd0HwL2D9QLc8SL9CojJhdR1oGcgfiriHnQJ4So/w+0zCZ
	ig+KmvLzIqijGbSaD7eTGSf4oxEV8gla21ot3HgrqZkG7ljTN4GOBlksvYuFKsc6KCPNp8bMXB0
	Cd4EWoy1KH4OE7WgKa0+4JxU51oJPP5jId3O/zE3SwhIX5EMN6b1dbaljOKEVDgi6BQRGI8lo/y
	8f3c0wn7AttgXkRUVbAgaGtdFvEJTQc7V3F4S2KC/Cba2ITgdINVXRAGoUf0Nh44dPbUFLUBpk9
	vy92yfmNT+jo/i0dzYD76dvxVE08J3Xu+FqPNqX1dV4LKdSiP4GE6HSjTNDAfUVYnAQg2cwq8=
X-Received: by 2002:a17:903:2ec5:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2bd9061d6bbmr91383835ad.34.1779005104454;
        Sun, 17 May 2026 01:05:04 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:4064:2d80:75ca:8541:272f:2bb3:5e55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb17sm109834595ad.1.2026.05.17.01.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:05:03 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 1/3] soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
Date: Sun, 17 May 2026 13:34:43 +0530
Message-ID: <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_010505_492883_E88A54DE 
X-CRM114-Status: GOOD (  11.88  )
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

Add Raspberry Pi firmware voltage domain identifiers for the mailbox
property interface.

Also add the voltage request structure used with
RPI_FIRMWARE_GET_VOLTAGE so firmware clients can share the common API
definition from the firmware header.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index e1f87fbfe554..975bef529854 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -156,6 +156,31 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 
+enum rpi_firmware_volt_id {
+	RPI_FIRMWARE_VOLT_ID_CORE = 1,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_C = 2,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_P = 3,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_I = 4,
+	RPI_FIRMWARE_NUM_VOLT_ID,
+};
+
+/**
+ * struct rpi_firmware_get_voltage_request - Firmware request for a voltage
+ * @id:		ID of the voltage being queried
+ * @value:	Voltage in microvolts. Set by the firmware.
+ *
+ * Used by @RPI_FIRMWARE_GET_VOLTAGE.
+ */
+struct rpi_firmware_get_voltage_request {
+	__le32 id;
+	__le32 value;
+} __packed;
+
+#define RPI_FIRMWARE_GET_VOLTAGE_REQUEST(_id)	\
+	{					\
+		.id = cpu_to_le32(_id),		\
+	}
+
 /**
  * struct rpi_firmware_clk_rate_request - Firmware Request for a rate
  * @id:	ID of the clock being queried
-- 
2.54.0


