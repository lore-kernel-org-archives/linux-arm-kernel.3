Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A402BCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A7JFWJeo/pdX1qMY2KKRekWYJYWmJZk+1tkiUe+PVAk=; b=GUZj3+zoTDM2kMZe4LcN9Nml+v
	UrlVY0owd/RxpPA5zWcXuur7GNT1bVcrpZ7q9KYV7UWJxepRipIr2BZWUObUx+GhEWZytqe4q/oxh
	ExVWaDBIKRyrS+yPQzW+PYFkWamU1IFusiRvAaYKPGKPSEKbYfDzTUr7gENjGALc3xSqVEUqPUdzV
	/ZufuRB2FtWNLNBpfaP2D4Qf8EsHy/d2C69F39J7vSPIZkfEunKCP9TNtrng9JoULi8qk09fsdD5T
	fFMWXu1vHmk8p+s/LZGsiKF3RqjlIyhjueMqn67gJxdSs7Dgsl3ZaJLQBg3lWmjLTvGfN82zxG4I2
	ezsArpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOI7f-0000000B2ol-2a1U;
	Sat, 16 May 2026 16:44:19 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOI7d-0000000B2nn-1tFD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 16:44:18 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso366632b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 09:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778949856; x=1779554656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A7JFWJeo/pdX1qMY2KKRekWYJYWmJZk+1tkiUe+PVAk=;
        b=Z1N3PKljQZ9lKXFXhd+dASkPTpQJNE5u8dRcmUgPjm/nXkjOKNTIhgeyo6cL741co8
         Fliv86vjtIcbDYyo8QRYUJZcwTUt2VXv3gtRv+wL7AeoIaMDWgHncbUvMkuT/o8T3rM0
         8LnR2lMbUWYp68LZWHh9Jx49F8S9TuYC24igoHese8MEz+J+XoAldFMf3YbmpgiZcHOa
         ns7L7ZLabLAUD/Hj7sUldTt3MByLkbaLn0esmMc/8g33v3Bx02XiIvpi7AUV6zn6x1DE
         9I6dthXzq94DTN+gky8XxqKjKzRQCPscDCXNRRhaTNsX4uwq1N5eKObd+h2ybzyyuI/e
         aXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778949856; x=1779554656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7JFWJeo/pdX1qMY2KKRekWYJYWmJZk+1tkiUe+PVAk=;
        b=QtjDcsevvY2F0c7qxyo6D1cnXeiCjztH3BQQahiSKYiIXzuX4CqtflUykeTCc5ZfBZ
         6hu5pktdGcvj7/Wf/QVGsi8K/18Cllrfm7dbM9GagsdViALy/tgs2m2Ud5npoLCxWAdv
         HVvHmOoocrHURjge5gCIdYv1NsOCm0g5NOPcqTDDfKHtloYLiv6p4Wh9OzFKqfjENRNb
         t68ABxzMlRqOPSKKiaapuaQ5nh20hazM4zIv0M1dlTE8lzym9yMWNPgzXi/J9S26r+br
         +O+nGTtph6vze5aobdOxrPVDDEJuL8OREEzWf+0qvB9w2H+BGV+r2ezj02Ll4WOT0dWe
         pd9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+UAWsXXpG/Zr9KKhkCAZuF/MQ29kidzzDuo8OLCb5y2eNWbC+1rR8Gp0ReX3iAQJ4taosiwmgyzR8i/6E6G0Ni@lists.infradead.org
X-Gm-Message-State: AOJu0YxWbv9F87F60X2Xn8nEZ7o8KCVoh79XMHxvwOlUJWKiX+9yK4FB
	VzZtVuVXxmgGbPO1QUoVHJYODDmyoolOk0OIkAOxCyAPdTFbWX6Bf4bE
X-Gm-Gg: Acq92OHDhQ47vAsRTtIVoLdOwIVoWOzARdbc2hBkQmXvxSOwB5z8UkeXE4k9KcFynkP
	55gCCHaQGbbxpE01W79d4Zsl0I7WhbXSJFpb71xLZxQz4+mAFWXkXqHNNiHL8Oit1ZE7VtprSwE
	sxW44Pa/uBeBdWFJeDJ/ZQQcJsXFBEpSMxaYVh4UfHqELNhd1c2tCmbVBh2F2OViPjrY5iWvSqL
	e75yQ/K6gV7zwkyBKF6yTi+rH//SEI1bJfxyO9Dx0AXcsfUpLkyptZ+ygbp9b0O5cJM5n/XMaDQ
	nXXLtnJPUNojh7x9DvD2G3txIc5S7DHW1uolw1y5+OD8TPveQIlsCcF7z3c7GnT+lKQqhBVR5wE
	CK6rVhM7Fd4YPVyS90KDbjojhWmfSZpCJJNRd4jEsXhBY/v/xCyEbkyJcQT6g+BUT53GuQUK0bp
	hbLu8QUDSKUttwlZP4sW91PRF6IZqo2uhvTnFxceSVC8TGEdkssNN+65VHD7wn1jUbeS7R
X-Received: by 2002:a05:6a00:12cd:b0:837:21dc:6ad4 with SMTP id d2e1a72fcca58-83f33ad9f7emr7788575b3a.2.1778949855866;
        Sat, 16 May 2026 09:44:15 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:40e5:100a:b5ee:87c:e578:2b2e:422b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm9562564b3a.1.2026.05.16.09.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 09:44:15 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
Date: Sat, 16 May 2026 22:14:05 +0530
Message-ID: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_094417_480284_EE246D2F 
X-CRM114-Status: UNSURE (   9.63  )
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

Add firmware voltage domain identifiers for the Raspberry Pi
mailbox property interface.

These IDs are used by firmware clients to query voltage rails
through the RPI_FIRMWARE_GET_VOLTAGE property.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index e1f87fbfe554..fd2e051ce05b 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -156,6 +156,14 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 
+enum rpi_firmware_volt_id {
+	RPI_FIRMWARE_VOLT_ID_RESERVED = 0,
+	RPI_FIRMWARE_VOLT_ID_CORE = 1,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_C = 2,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_I = 3,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_P = 4,
+};
+
 /**
  * struct rpi_firmware_clk_rate_request - Firmware Request for a rate
  * @id:	ID of the clock being queried
-- 
2.54.0


