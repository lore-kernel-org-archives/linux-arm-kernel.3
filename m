Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5721C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 23:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=; b=n+yYGaPKvsQk+AsXHW45Ll9iGO
	j7MWZqleQbL18veBSqLHJMlED8HISfNS8+VlpHvFdA+e6PQjUdmrDrJRYYmgOFs3ii6mdRqd/dlxe
	VVNN4evXMbd0HjIKY0vaUNtpyONdeChgVqBS3OtrTP6Z4mAgETVZWD7WzRwEMjpPFe2ZGqcTssEz6
	SF8zIkf/CrWkbzEcZhbA6ElYDYktNgGbcaypa29kekEqpsnt/4j/vjQ1braKJXrpcDWelb2r+dp1X
	SqnVH+S245PKkMquS0h3ZC8J55G9NxFInqhS923tygYk+8bRcZ+O0YQSH+RVsWjVMr5UNg8pkUwCE
	sZTyEuEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txwRc-0000000CDDL-1jup;
	Thu, 27 Mar 2025 23:15:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txwPs-0000000CD1H-2tqT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 23:13:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso7260505e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 16:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743117218; x=1743722018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
        b=SnV3zjnimds0oIvAs6FeGUFn1vpCWMQEwKP/4JSUrcsxact0vDtxEP+SafQ/Ku4OWx
         WxeSNHsYgzohCMfZrC2u4VjyMsW/lMKWJrz2vr5Xs6+P9hCCN/zIfvqw+mXy3SuqWeOb
         8Z+UdBegOmz41KUPBUP+8TJldKtGPUzTN4LENiWkPJC4rguk4EMclNG9RvZNFbN+UVM+
         dGnFWe4jeXPuHKAJEAYOmOdmCiqdKoOIn2May2VfX9rAA1idP6PGn75k/UYlhREgNhYU
         2eYILNbMkZiyOxSFcdaANNDtXJ6Goj38J9PusDZqNK5B+R5meLwvuMDMvo2SmgdAHjSi
         9Z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743117218; x=1743722018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
        b=djG7a9lQL9iAgwaNRE3pTaxJjETI5184nRJLl14V595/vUuQEu7Fspgzc6FhYKAmfy
         YE6qT8ugf83T4diu1TWSUTctfSN7sYQw/zFYNdDh7EYHBZJ6l5OMrMmVATLIdrtabK4Q
         TGav8tTSRKvYue50cZRGw7TElclIvMMY7LozKTbM/z1rOQpUnH2pv/j1txT7Nuxo6j1/
         +kxZ9H2jWAHHVoyW8bsqBrlvxVZrTAni12tkJUhTbzMUja0PIbnRTUOQe/NGgbKg9p3O
         nRDOGuhoMKC8MKsrk1MV7DOqTj1ps4i/fvwjnnSZkGat7C8htvUS54LaVoXoTZjaoMzO
         nVXg==
X-Forwarded-Encrypted: i=1; AJvYcCVfl0foywbQR5lzYhBkN26vrTdlNYwvsc7UOM0f/cfrmBEStbQtHssIj2Xb63Ud53fn5mXLhc3VWHhJhioAYReY@lists.infradead.org
X-Gm-Message-State: AOJu0YwWDX7kDHIJcqgcY8N/3xNJ3VamlG8A3XbMBXkPLQD9jSX4SskC
	mYbM0gU8mQ10xgypZLpa+CIbq9n56MmxENt/7K8oXPWYanPNcx/G
X-Gm-Gg: ASbGncsFctAwVqRM+6VGOsZdB9iiD03ORiue1dr0HB5npTD6GnYUiuOTtZyZsPg8h8Q
	3VZQtGhrRpve5ymgGLSC5hlrCr+4cmDgoIxLj3R7C0/afxsuE5gZSOtA8muv7M5tz9t7U3qNh1J
	yCJB95743h7mcwSc7Uhmepku0wMPUM4HhRgiCI1oIMJHT76Vb9VhZAIcN0x/DWm38Ylex1mPUj+
	1o/nU2uLnYYoB6iMQTm0gmrwqpr3JrgZWmLAlRN4RBp+NyzoXbifXVv17BTwJ/Ddy8wIwi9fACb
	C4Uv25q0kTZMR6HPOcHuEdfclidee0dShvQRFjichywJ5w==
X-Google-Smtp-Source: AGHT+IETOZ4c3GApnoFs7MN0qkl/1HBcaEp2e0Y5v9Jar1Q6i8U47juByr5xqoThiy0+bdfqPLYyIg==
X-Received: by 2002:a05:6000:184c:b0:391:4095:49b7 with SMTP id ffacd0b85a97d-39ad174acd7mr5478950f8f.25.1743117218225;
        Thu, 27 Mar 2025 16:13:38 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:80e7:c933:bc4d:7e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd78bdsm9151775e9.24.2025.03.27.16.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 16:13:37 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: thrustmaster: fix memory leak in thrustmaster_interrupts()
Date: Thu, 27 Mar 2025 23:11:46 +0000
Message-Id: <20250327231146.6388-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_161340_726171_7C52A641 
X-CRM114-Status: GOOD (  10.08  )
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

In thrustmaster_interrupts(), the allocated send_buf is not 
freed if the usb_check_int_endpoints() check fails, leading 
to a memory leak. 

Fix this by ensuring send_buf is freed before returning in 
the error path.

Fixes: 50420d7c79c3 ("HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index 3b81468a1df2..0bf70664c35e 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -174,6 +174,7 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 	u8 ep_addr[2] = {b_ep, 0};
 
 	if (!usb_check_int_endpoints(usbif, ep_addr)) {
+		kfree(send_buf);
 		hid_err(hdev, "Unexpected non-int endpoint\n");
 		return;
 	}
-- 
2.39.5


