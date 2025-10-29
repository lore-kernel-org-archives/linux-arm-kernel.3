Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79AECCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fuIsZJAikyEekZcQ72lnOaH5lxPiOYkA7xu56IYCNWg=; b=Cx3y8p2a1tFbnUb/kAKdyKjM8R
	SUGbW/w+NcJYfJtQO9NBU5qs76tCm57y0uj2I4th2ykczPbRC9myGuy46Pi4zIxWv+2sSHX/HvmQa
	ARcqkbRzxVWGqOp04s+k6l7sGijdWWxzDj1KbzEASkVay9/kuONAraZj7ZB/2DSvyZKwg8uF3UWSL
	ur0X57yp89RPLMeB/mD/Y3x28SAPOVjluI38VQhNXxCdUCL5CNRHp1pqqGIUqmhj8D64BizaSQVdS
	LLakE4TqQtEmRQxOll2lxtiKJAkFV/FsuD8k8h/6NTShnJZmkoObYaOr41rku6MD2+WcI6ExarxH4
	zvktfmzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5zO-00000001JUw-0kxa;
	Wed, 29 Oct 2025 13:13:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5zL-00000001JTt-1dp9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:13:21 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42966ce6dbdso5238794f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761743597; x=1762348397; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fuIsZJAikyEekZcQ72lnOaH5lxPiOYkA7xu56IYCNWg=;
        b=OzYKXz7C5cyiHXEjHNg9JuwKITQUVtY01+dm3i147GcHkFrArcBk8bxoTfx1H2/pOm
         3Gb/lze4Gn1Y9nfmUUBU+OPSvKjusoZ3GAr34IvS1gQgCQ0J7iriG6AqTGf1KeLi1g0M
         oFD28MJHqeO5aG7ZIWl1IOQ2q4lYttXiZ2JHwUu13w4+HEzMqxRE9u2l6khIkil8GuWD
         ZXMKaIbyzjWLjY5cutzD2m6NfP5fPgPhSoMNnI0JXL5du7lzkoJYLnbEN1Qs5qmfLnXR
         WfcnxnkPIVGn4nXadh4kksDmaHDlLzpbEwpilJiA2aIxRP3rbmRZY4k2ocTv9N3xpWtI
         FuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743597; x=1762348397;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuIsZJAikyEekZcQ72lnOaH5lxPiOYkA7xu56IYCNWg=;
        b=tlv5NKN/+rjmbE9+l4OskmED/lbwO+xOjU+GcNrDoAD2QhQTwuiriBkuK0RVlvu8jJ
         0i1UKSkf6fk5MAV1IyUguV/i+q3T4ypDFXR+tD0irT6Tn/1jQCBcDWS144VEWcJAyQpK
         IlXTCYXMsTSDUSnDKqBvq/L7ziRICh2lLjxIMUXihG8hzBGZ7x0BKYPdaI7Aom1MiUIK
         WkL66xj3q0g+5sTKGEIurOUWOVnJ9L8xMcQazUjcSCbfli15ighDSORssA2+LE5wC3a6
         4jdcmQ8d++wvBUN1E4wCQ7ETYrdcsP86hUthyTcuAbm5bH8bztWOF50fBOIff16ZF5fw
         VIVg==
X-Forwarded-Encrypted: i=1; AJvYcCVXeErPXUdwCW1XyzeHMSf8+Gtm407O+gIsHkQrYLdyJsa6N9+rJZGkG15IJ0G8NxtorKFqk51Rzij0Y4+SHEN2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8vEz+h0xBOiXVeZhElD0u89NA/olQemBJe04uM0eLKSvdesbu
	oX3k+Zjhsxrvw3tF1Yqs2BkzSWvweLND6qLr9/qFok6v9xYful9fkbA6h1MmFyM3VmI=
X-Gm-Gg: ASbGncsnUGNfltDxR/Y3X2OraLuSJq0SeOHyUBQB2JI+6oTB4f6X5r5LoosCbbgSjhD
	qJVdZLB8kQOZCs0p8BmeWG8dZqIKng9YV/TaQ1C+fmg7nvZSp84I8FHmXBxs5VEJ95MPeZYO/qs
	C0d3LR7JAj9BQErmvdzsZfGKxFVRJlG4lKau2xCSzaU/NjYTYmhIgZRvA5DM7vah9tLQ352k8bY
	CO+g/JpAEMlSFaU/AShaVL26slLjChjUVS69uiIt1BWedjL7WaT2ONEY7Mk6Hj/PoGYYvVlkv6e
	geqrS9FRm/0msR1/CrIdSNlBmdTVIFE+gxx/rVHDuydJM7Rg/ytDubVEvgsgqtU7HVP4ukQFNXu
	m5u3WLRJn++OT7l5nyYCI6+KFANyqO7D4ZdZvI4zoc05N8NCRlulAIw6pi29SY/ZDUxg0/HrwEt
	ceDBHo2lcb1FKzDu7K
X-Google-Smtp-Source: AGHT+IHWVrau2m4RaNjTyO72rP9dhKVo76M6sAXBvO9VLZ1VFeKc3lw8F8BaYPpaPHfy3t8Vo31Ixw==
X-Received: by 2002:a05:6000:238a:b0:425:76e3:81c5 with SMTP id ffacd0b85a97d-429aef795fcmr2632000f8f.17.1761743597111;
        Wed, 29 Oct 2025 06:13:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952df5c9sm26362401f8f.41.2025.10.29.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:13:16 -0700 (PDT)
Date: Wed, 29 Oct 2025 16:13:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Umang Jain <uajain@igalia.com>, Stefan Wahren <wahrenst@gmx.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Rohit Chavan <roheetchavan@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: vchiq_arm: delete unnecessary check
Message-ID: <aQIS6Q73Ss8xyJTD@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_061319_490854_EC1614E2 
X-CRM114-Status: GOOD (  10.69  )
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

Both sides of this if else statement print exactly the same thing.
Delete the unnecessary if statement.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c   | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index e2cac0898b8f..130be2f58342 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -4001,10 +4001,7 @@ void vchiq_log_dump_mem(struct device *dev, const char *label, u32 addr,
 		}
 		*s++ = '\0';
 
-		if (label && (*label != '\0'))
-			dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
-		else
-			dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
+		dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
 
 		addr += 16;
 		mem += 16;
-- 
2.51.0


