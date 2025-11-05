Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E01CCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 12:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dhsqlGPMhr1QSeWTCatdCXsZNSn01c4d6RBeHfAS3ak=; b=uOgiq0WZ6P9g0DvoAwbVNRPI0P
	IVAvyB3D5F9M1/qmqhz9+TucuFQvdl9AdPOKgjZ7WV7juSvjr3GgNidYG3SvyyB0P3zj20qgdp058
	EIYvJV/6YrcechTpf8RuCZTQFjsNQc0WY0DDD6rW3Pf16eaPgYUsJU4PF3KvCfUBBEtYaCicfq3Pf
	Bz1fG0v4uJmhNzyK7nr/fl7lpBBo04QtEXOSRQu0TE9COL8aEsBS5eY+itU7YfYBw6e7XTDyam+3b
	IiVgVSDox2S614M4co99JbsQ9jCGI/LWjRv80pKUau8MVr4ahh3v2dceALf6P89DA0jknWaVs1RbG
	Nm/Ad3yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcxm-0000000Dc4C-1Kxi;
	Wed, 05 Nov 2025 12:50:10 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcxk-0000000Dc3R-0ca2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 12:50:09 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-4332c458d5dso36586035ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 04:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762347006; x=1762951806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhsqlGPMhr1QSeWTCatdCXsZNSn01c4d6RBeHfAS3ak=;
        b=WRSGHpHEyzGASNGAFMgF9quK/LKooRw+He8m5ISXixk3nYEXqc/IV5rTBwGthmooa/
         KgEQQuiLwQYbrt4t+WYEInUCJyTsGWYy9hWoKJ+8vabAj2riWRjuH2lkCkUQ/ykPudYe
         p5mi0X4ZzkdROIReKBNGeYQL/mR/YRVp4Cgc//aCGMm9Iix6GSFjAFongxo1OeC6J3cl
         a3kf23vYzSAGpZtVfJUACKO/t7cv+z+wAdDvtOwkdJbg8zV8SsCLOoofoKonvvGFSudd
         fCD4c2aYa5X5e8TqqcU9zn5KnC3OdNS2QMRiIgIsBS1K5gF0+RtLAX56fUA6aXBqKBuW
         wdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762347006; x=1762951806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhsqlGPMhr1QSeWTCatdCXsZNSn01c4d6RBeHfAS3ak=;
        b=mbPw5toHpuN8vWO7WPEAEvuJq7TD7ypt4Ixz+lr5WNou2q66tMyVbiLLYCHptKmiME
         jLw7e0cnoki0nFeQf1ShHXq6eaxjC5B4ZyUrP73lbAI+BwbECgBP70w3yko8bLUqJlst
         Xv5CWNwWEgLUDSnIGNGjh7Ts4PwaKwbF5/wSxjzGaBMnVxH3Vaz3iLrD/6l7T9zSd9Ii
         Vryfj9QGdbi5T86LbHlJsVgOueAESNwdRyWfLYqHLMZ8vkFz7ncp8+5y57YB5BLUD+il
         kys4pjpJRyRPQZLp77JypGGu72b9PK9exdv2AsIcd985Mc2xzHVG04SdG6D0rTtSKzmM
         nxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEkwPXYwraCgrgSpUHryCW+jivYYeTwH8pb2VJawAdEE7zFkBVN5zQEV4yXnfrBCvBe/iTg/tCAG6IH3YJAVQ8@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ+wARbt50R+QTY5W6KLA0R+jkiZH9oTX8WDWR58yblxDc5e5e
	Fg66ULZ2TxXvXiCvXrFpS6iMf3SVcpyKtYbreZenTo+H9+PcslgIuFcD
X-Gm-Gg: ASbGncvOiqzObrP9mT4BvhhBXWDM3L5/rigXBI/5802IveIIQum42exMt8K/Lx7BsT0
	zDVhSsNyXdtdJkD7szdohRszquBD38eSlaY8iy+/gBheupFx+bHIdI9XeVZ5l51iW/vLjlDWUj8
	oo9zvHpUuiR644jAg32fkvf8YZGZPWXI61mMJuG/78mutN2sE+pnk+nLJvdFuNQquzlZyFV3PAg
	bIJdAdesJ9gDKKP7/MZdMdTTjlPFtD1+Z7+VF+3QoLSvGSf+bMVTA/BWzNaJpPIJdAb4RFcEZou
	LQNsNXB+QkV59eN/KxKfqmKisrrIGduciUDMSH/Z598k3jn2mzLPfq/oP0vv+l7KT9xcgh0B3A3
	N5biZC8276/N52E3klMm5HiByBE/gDtq4GXIkPh9BIxbOm8C6gyj/dTCU7/dJSEr77fyFE/zcb5
	9lMvIjjvULgzQ=
X-Google-Smtp-Source: AGHT+IFUVVrpnWZ1eRQdwOKppyTRc2PEKlhHTvEBTZobu+ZXFbukcXv6clqDiwJYPg1JA4j1lN+v+A==
X-Received: by 2002:a05:6e02:1a2a:b0:42f:8d40:6c4b with SMTP id e9e14a558f8ab-433407a4043mr46552705ab.11.1762347006403;
        Wed, 05 Nov 2025 04:50:06 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43335aafb84sm25233035ab.16.2025.11.05.04.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 04:50:04 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 6D5EF420A6A0; Wed, 05 Nov 2025 19:50:02 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-actions@lists.infradead.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: parport-lowlevel: Separate function listing code blocks
Date: Wed,  5 Nov 2025 19:49:47 +0700
Message-ID: <20251105124947.45048-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826; i=bagasdotme@gmail.com; h=from:subject; bh=xjbGtqKysZbtqE74+mQMu9sHyix0L9a1Ew9b4i4fy/c=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJncbjM2XTjjc//cjh6DiqftrN/1X+ftExWde8FyQ+58w bIICQGbjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzk42RGhvsnbpWvFzNV3Xk+ +5jiKe2epHN1fL/19r3Z4D3j5u9PB3QZ/hcZsqtuYnWSOJZYuV5zNad2afDmie5Br99tZHr34sT SadwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_045008_188328_31DD3723 
X-CRM114-Status: GOOD (  10.87  )
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

Commit be9d0411f1608a ("parport-lowlevel.txt: standardize document
format") reSTify parport interface documentation but forgets to properly
mark function listing code blocks up. As such, these are rendered as
long-running normal paragraph instead.

Fix them by adding missing separator between the code block marker and
the listing.

Fixes: be9d0411f1608a ("parport-lowlevel.txt: standardize document format")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/driver-api/parport-lowlevel.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/driver-api/parport-lowlevel.rst b/Documentation/driver-api/parport-lowlevel.rst
index 0633d70ffda7fa..a907e279f509b4 100644
--- a/Documentation/driver-api/parport-lowlevel.rst
+++ b/Documentation/driver-api/parport-lowlevel.rst
@@ -7,6 +7,7 @@ PARPORT interface documentation
 Described here are the following functions:
 
 Global functions::
+
   parport_register_driver
   parport_unregister_driver
   parport_enumerate
@@ -34,6 +35,7 @@ Global functions::
 Port functions (can be overridden by low-level drivers):
 
   SPP::
+
     port->ops->read_data
     port->ops->write_data
     port->ops->read_status
@@ -46,17 +48,20 @@ Port functions (can be overridden by low-level drivers):
     port->ops->data_reverse
 
   EPP::
+
     port->ops->epp_write_data
     port->ops->epp_read_data
     port->ops->epp_write_addr
     port->ops->epp_read_addr
 
   ECP::
+
     port->ops->ecp_write_data
     port->ops->ecp_read_data
     port->ops->ecp_write_addr
 
   Other::
+
     port->ops->nibble_read_data
     port->ops->byte_read_data
     port->ops->compat_write_data

base-commit: 27600b51fbc8b9a4eba18c8d88d7edb146605f3f
-- 
An old man doll... just what I always wanted! - Clara


