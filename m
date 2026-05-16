Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79847CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 19:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7JFWJeo/pdX1qMY2KKRekWYJYWmJZk+1tkiUe+PVAk=; b=mOHzZGZLiz8SNn7PDGR33/opoc
	9axPejwCC8JtZWF+gqyU4FPfu+MTDPzUPpKDsVgQht/ltx7pb8tP565fwUQLMGzj9aSs4RVd22Fsl
	jXdc7xd/ymYKuPed9QjgTRM9E0RvzybO2D3d3gZJxYSBU0ikw5fTQ8kDzP8uz6LVI8rh7+fJtHfCi
	B+OuATQAILj4Sxk2eMpu8lTGHbEwLlSy6b7NIXhrHT+e3/obwmv+8ERpP94p+KfK0PKNZJzRtbag1
	A/+rZKYsxk8vkN0quVT5G7yctJ2xT1xkXGwtZQRC1hxKbD2qgd2eqVKrpeCdGdTu7F0fkmxT1cTCC
	mN5ZhLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKUm-0000000BLaq-3r1s;
	Sat, 16 May 2026 19:16:20 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKUk-0000000BLYq-0cDC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 19:16:19 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8383fb7143aso391642b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 12:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958977; x=1779563777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7JFWJeo/pdX1qMY2KKRekWYJYWmJZk+1tkiUe+PVAk=;
        b=lXduWC7GBN40fgueON2JBuCielxzK/6/EY5AOuQv+Nq4GbGEFOZNpND2df6DQu10GV
         Xmlu9Pc/L4R+OCP8+NxY/kZaQSEHWPdDJK9qURDZRfmTkhLoUEwtkvr8X86vHhT1GgmA
         S57wb+PEGCx7E+Je8hd+7PtQozStBpUc0GNFyeQZ0qJR8K1GGpGMkPO2mfaIfu6g63tN
         Fb41+hlezD1aegOtAnyk8vobMwXuj7eekc09LtlUHzT5BE7+fSNM3qMDKVeX8+0Ejpb5
         OltyB0wTqCWCzCqem+c9ipjKfUy+m1Fgtbs0+TnFP4+HVaIr1F1kdYchG/1H8Abz9W5C
         Ps5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958977; x=1779563777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A7JFWJeo/pdX1qMY2KKRekWYJYWmJZk+1tkiUe+PVAk=;
        b=gxBn0NKULc18AmoNA55inGMhTs2kQJ3wR9Nr6hwcWMbTJs0re5p6i8fXau5fDXN/ms
         6e4YBJEpXoAf+q29TuL9RIrXYq+HUY/hW3ZZxGR3/HGlrrvpTkmO2Qoemo1jg3elQJPI
         cpf6HmVp0daUP4CRm0/8SK9PcL78euTJJIja/yUF0YoC8mzAisvxEm2k/m79lQIv+KN4
         M74dqgWb6S6BGh1g9YtlSPC9XRmfD1N3AMl4TJ8FJUsPzbDuaNcwSEeMy2mM6pTFHTH4
         B0B6W2qtjdAaldPR7QKxikZnS7/mU0EM+0O2IimEbRy2NEnL3IetU4/mQzXUuq6BgLul
         e3bw==
X-Forwarded-Encrypted: i=1; AFNElJ8NENzp4WYkJaUWgmLjT02EEyrB7HUET2YBh3OkTXP4pFBCvSZRvTAboZS8YsMnzWLZ3ZQYKl5zgGcu//tlFOUk@lists.infradead.org
X-Gm-Message-State: AOJu0YwXCoQFvu2Eg8csuiS2Nzii+x0O7MW2P0OgKo9M7ZbOuen6Wo8B
	cT7BgKMRx8gJ7WD0oBwnsV4KmLN2+Y9ECGzGRy/hODysmymOPCXGrFMG
X-Gm-Gg: Acq92OGUDAgojVfSP2Va46u193NgT4jb3EIoXfE7JGmcC6kF9nHIur/ZNx+kEH88Kw7
	K1qGevrpmKDxTUH2OR0aPhNdtedIh4YXoQdCncuDYzUKvRatuGAxVJslSIGJpBzAONVFGwEJD4s
	lEVsiYvy1iffxakvqqV2gKQOnXgrf+B2gQbFwuucwNViAqks0krsU1tVjg7ySV2BNN5wfZWgGBj
	v/yF4hwt/Hw8e2obBB3sPvPfWPlMQ1/P9E6hErEu11HgK3K5RUPHqS5z2Vk354B4awS4Fuj/RWA
	S7uHQkF12o6wPNEvZAga470XJmDW5jT5STq7J2/2F+6NOreaKUjL7EdgwonF+6miiFIlMxDkM3B
	2aByf2EEfwX0NvRs+M2iTQ+xq0cjgGtfFDbUuqWP0WZ70tiPyDkktZ4/bQn2Y4IdqnbVYCZUpiB
	MXRp+miNfS5n7rE9xNht9+gUIOSxDeyVhtYNcroASNHQoLej1aZEep5wWq4g==
X-Received: by 2002:a05:6a00:44c3:b0:82c:6da7:2d3d with SMTP id d2e1a72fcca58-83f33c2a8fdmr8270653b3a.11.1778958977236;
        Sat, 16 May 2026 12:16:17 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:40e5:100a:b5ee:87c:e578:2b2e:422b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19661261sm12297625b3a.3.2026.05.16.12.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:16:16 -0700 (PDT)
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
Subject: [PATCH v2 1/2] soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
Date: Sun, 17 May 2026 00:45:54 +0530
Message-ID: <20260516191555.17978-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_121618_187643_655F2655 
X-CRM114-Status: GOOD (  10.05  )
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


