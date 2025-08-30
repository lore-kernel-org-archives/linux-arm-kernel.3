Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD763CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 18:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETXuVNXIq9MNAcEeVRd5xBs+jfDzG9umQE4H0ixj1/4=; b=t2yOoH8mRd8mXKC843Hv+PWzf6
	sQsuRLyYCCz+AGixw0nO4bL1EfOKFJLtJ4hR0DT3NUJ19xIrecvYhLzLMT9GbG+v1APVdkyPqtP20
	0+iRpbADr/MtgOVgS7pa//5Td4bcNwB6QeLHsWyqYxWrnLFJVxe0ZbimMdSR8VtJ5E2eewilIamKp
	lyBa7M9a+GdiLPCdlKpJRDK2cG8kP9SQHv4vErBq/wWCcHDRng0n+9/FGKjHJWr4cfsxiY6y/RR30
	TTKnj7lAI1OSL7H9nB+NMWpIpgEAJG4qsCXoKczlc5jWPP8EYHo6EEKfV9jErTICpDuBiJ+TP+Clh
	gAN0oGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPsA-00000008HSE-1aPw;
	Sat, 30 Aug 2025 18:00:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPXu-00000008FV3-3ywn;
	Sat, 30 Aug 2025 17:39:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24896af0650so6194125ad.3;
        Sat, 30 Aug 2025 10:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756575562; x=1757180362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETXuVNXIq9MNAcEeVRd5xBs+jfDzG9umQE4H0ixj1/4=;
        b=A7CxVSxTn/cGBNv0MVSQCYz0jGwn3Q90FE+PY8oC87YJa0FOPt0kjkqGoOnAuu/cfi
         mgAYeUiCTZfO4+0G/5G5Cmx+Cl9VNjl8/9ASO6bK4WdeNCeYYTuWC/kiH6VT/jrp2EtL
         9LYhcYS3aRTLNKUz/RI+WtsAaZcS4ba410YKyA+OMGC2VdyN/nvEqNBh+AWc0geW2D82
         7oJnx7rdHbibCEWon4pvwTOwiSwhcuPPnwT1vLXbu9QGSmWA1yE34FfGJ2uzigjJSmdP
         THY8R/z8u3tbFMJFPhmz7cIeqGxcv236VF8QcFyBYfjgEiNmnacGX62MRcnvsAaAHyCS
         8KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756575562; x=1757180362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETXuVNXIq9MNAcEeVRd5xBs+jfDzG9umQE4H0ixj1/4=;
        b=gjElSCOQ9oTpiL3WBjI4JrLUZbpdap5/J9eH5eQp8400QTM5nG2OTXmrri71pkmaIv
         1WA3xz8g/rTZSNHujWMKkCWfUtkcSLiamRcZrPg46XAMLeoXSmeS0pzhAhfLvGHmlzTs
         mzUgKcPisMOUYqmxcaUo/unw2xAu0HdK77kngXieusmySRN0XQeL0ugMqVjDiK+zNfGy
         6nHDnWR6GOILRYQ9EAYzT0AwsmNI51qh0WIjioZ/tvYJPcoD1jLx2C8phr76I8vGebV+
         ldNRnIrMMNX07Le2vXaqjFZU/aK3fHOuNC9hCSrSaj871y5edZJjeWLc+epdTBFk6OFA
         47lw==
X-Forwarded-Encrypted: i=1; AJvYcCVnMTZodCAgqTsa4HKDmi3oR1mSsmQC7dcQfYCUcV5DLHN5NV8XmOG43QDDFB3LgnWgEphE7/WKk9dyV3IranUR@lists.infradead.org, AJvYcCXh2pp756JDgxzk2Cb281sgrIgdl91DzXGORngwWCOkpPgxj/vYgUf7U2jV5opeHVPLTf6C++68WRNdGcwO83PAoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhBDokY61fCWxMpNNGHA5Rr8ZMXriRaQVgmIkFFBiJDIgJ9pbj
	lYwdge+r/cfx7XanHKcqKe30+rNtx65R6snP11o+W5Yudj0gf7TfEKK6
X-Gm-Gg: ASbGncu7gmqAlhct9qD8tzN7j7If9mY8yGCrM/Pikk8ohZ1CIsFcXFSz29uHYKJcjbg
	SWZzDpFPp1K1shd1lThVdDq2dhZqLqIqXXYalDqdXGoPv8GZz8DuyfkieN1hH0m5M1WnvGQio6u
	cLhC9Wny2FQMBJDWrVe3/2ZzWh9u5SDakNak/pqJu+pzOpEtC8Oxy+tag1jdavshzhVUOBXjMVM
	kGBCT8r2aMRj9YNcF18SEZI3EdLE3W0RR3QVp07HHb2hR7cKOkh4YNWqUmzmEE257jHl/SiqBHd
	Fa3BnGzyVpdzV7/Xcpwt/1ZGyfzNWzk/DFoILo141NjeZkFRtPjQdDIH0tgeH+LBDMFO0wxP1Oa
	FGBAr9o6iyX/1ZQRx9BJD0vea/dWXCcPPoOEow/jckw==
X-Google-Smtp-Source: AGHT+IEQMlEuh9ApetxKqLHAyWAj6WwoICnokFpZDwrZ4Vzc5kyx9IzKhufzz6cMaGBpmsh6eXQcbw==
X-Received: by 2002:a05:6a20:12c6:b0:240:6243:b9ac with SMTP id adf61e73a8af0-243c8160dcfmr4346700637.0.1756575562072;
        Sat, 30 Aug 2025 10:39:22 -0700 (PDT)
Received: from raspberrypi.flets-east.jp ([2400:4050:d860:9700:eabe:57a8:cf74:875e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ad39csm5154525a12.27.2025.08.30.10.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:39:21 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masaharu Noguchi <nogunix@gmail.com>
Subject: [PATCH 2/2] staging: vc04_services: bcm2835-camera: avoid -Wformat-truncation
Date: Sun, 31 Aug 2025 02:38:50 +0900
Message-Id: <20250830173850.323897-3-nogunix@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830173850.323897-1-nogunix@gmail.com>
References: <20250830173850.323897-1-nogunix@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_103922_989025_6C2EBFF3 
X-CRM114-Status: UNSURE (   9.81  )
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

    - Fix -Wformat-truncation in vidioc_querycap() when composing bus_info.
    - Use scnprintf() for the prefix and strscpy() for the remainder.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index fa7ea4ca4c36..c2788659af12 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -874,13 +874,14 @@ static int vidioc_querycap(struct file *file, void *priv,
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
 	u32 major;
 	u32 minor;
+	int n;
 
 	vchiq_mmal_version(dev->instance, &major, &minor);
 
 	strscpy(cap->driver, "bcm2835 mmal", sizeof(cap->driver));
 	snprintf((char *)cap->card, sizeof(cap->card), "mmal service %d.%d", major, minor);
-
-	snprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:%s", dev->v4l2_dev.name);
+	n = scnprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:");
+	strscpy((char *)cap->bus_info + n, dev->v4l2_dev.name, sizeof(cap->bus_info) - n);
 	return 0;
 }
 
-- 
2.39.5


