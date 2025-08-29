Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4062CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hsFZBQJQAIvZJfF34HPCQsJUYySIMV0W2zYPfupSo7A=; b=G04RFGHfDp1UVxDcPlGhIn8pXH
	LsyUqMlsm9nipG2u6rS3g7doOu49koON8OZ8TxpdpxJekylRGlV7IMhFERMXOdATgGxhRTQJu1SZX
	InrauqFVTZUw3+sKlQcqQPB+shGt/tZZXxDvaLCZWp/Um7g0WZiGVeaKPAxxiyFTqTEKTS6GBKCtO
	wdHGTX8m8EL5AD5Dk7vyXyYwqdhiiv3iOMPgWOe2I2+2DEA4koX1ncxDOcOdCREueCq5ODk34KLpz
	R3gBS8hnk8AHFZBLroT/piDPfJ3//bEY0W6Bw1uLxQpNHrikEglG0npUMvZIwYZpKmnq84uw04u89
	kiuUhDww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9lG-00000007A8K-0A9v;
	Sat, 30 Aug 2025 00:48:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2JC-00000006S62-24V5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:50:39 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3ceb830dd58so933060f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 09:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756486237; x=1757091037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsFZBQJQAIvZJfF34HPCQsJUYySIMV0W2zYPfupSo7A=;
        b=TamaMs4cJfi16y4+sVCDOsDsmI139jDBizvoDJ8aZDJyENdwFrj0c0dF6i9vdmtRQl
         lmqubL+I3NiZPlvD1xZPb1B8Zq8fBlyFuqG3WicxWIsFPjeaY3iZ574EBwNacDPZ8k8u
         E5860VPGxhh2AJ0N/agep0OXdxVZntvv5fYdU0rrCidLCVdEbRHTdBTSk/sagAWVf5BS
         bn4lELeAyXlN0MuApFfnspzn/VnlCz1tJVobnQGkVPMJ+DJUunK7os6WJUVGAg3268X1
         3JdjDS1qstaM7hpxmHxTEpLR1GnczX0MxA7BzA8LC9jxk417UNtbgB+yZeEWM1p2S/Px
         d3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756486237; x=1757091037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsFZBQJQAIvZJfF34HPCQsJUYySIMV0W2zYPfupSo7A=;
        b=I9X6UIjKpN171llSCf0cLUWZuQ3OnhkXnaUKq799M1gfLTvvrREt2KmLjqqUCmFkm0
         YyUEZBT4mbZuM64PY2U4vkr2mI70lyL1EXcpJPChfSsYgaxhIREMKFU4gzyVdJ0SpPmW
         FrLOMlsguIGC2WqcJAJTkEi6OgjgTwooDpeIMcxZR64ngVoON9pG0LhXblVn+vuDPA4J
         GGD1XyLDFc6DiJbDZrIIV3V/ml+AbL9j2vxYtXcuJ2aDoF04RSEKXcK8R+mM0jUVIIzS
         u/9yfn0gucvnquMaarK845OdiPr8+dwy7pofd0EzzK6tCLzlriVVbMBFYMHnyoet3HZX
         w1lA==
X-Gm-Message-State: AOJu0YzKxbLEx7Ok0qAmEYuMBzQRqDxgKUbBOTkw7I96EMpXMVibdFn8
	p/PRzvSz0ADcqoOwT+L0PRHSFQ2j+tPvvQQZUTQ07AEa5x9C+K5OldkI1LsxnA==
X-Gm-Gg: ASbGncueynd8xLf5hqmfbm5iZ84MQOv0Jrlh01cNQ2oll6yXWi3BeQRPBVFd8y2fVFv
	NMAbIxUCYo33fHYjJ9Yspb0SKRAmj6Ccy/FZDR6yRyjI1OJ7jzZPIT4peLUgtUgCxqb5GYwuOw4
	8BubZiPgV7TbYDgobYtIkM341vIGRWmcCUUP+o3ZSYagU1b1XwWveAicmwVyd0KZ2XqPad5K5y6
	6SMEOB1TcgDL5MrTFPSsCQ/CFFCv+QHlaVTK6F5uX4JCuo4wQ+j33u07FVTDHoKWeicTC5Xx5P/
	ZE4Q2TO5U3g6UsXu4u0fYpWHvDH35h5Sqh0PhjKUPNFPt/0XXTpUK618rG/42P8vGrAO6zDPQ6G
	kjeOPL5J3yblR91/M9M/DPWeFFH5TnR1gQIpxjEEjqaXO4YI=
X-Google-Smtp-Source: AGHT+IE4g/jMyzZ/INHXqzhTRgjeEwar8NJUP8jHUvddyUYpJLpweqpKrfi05z3PLfGEWRwl1WRm0g==
X-Received: by 2002:a05:6000:400b:b0:3c4:edc0:28ae with SMTP id ffacd0b85a97d-3cbb15c9db7mr10644186f8f.28.1756486236614;
        Fri, 29 Aug 2025 09:50:36 -0700 (PDT)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7271cd01sm116188015e9.23.2025.08.29.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 09:50:36 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Petr Vorel <petr.vorel@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 1/1] ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM
Date: Fri, 29 Aug 2025 18:50:31 +0200
Message-ID: <20250829165031.110850-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_095038_531904_6E8E18D3 
X-CRM114-Status: UNSURE (   9.68  )
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

CONFIG_USB_EHCI_MSM was removed long time ago in v4.14-rc6
8b3f863033f9f ("usb: host: remove ehci-msm.c").

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm/configs/qcom_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index ec52ccece0ca7..3de9d6c242dcb 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -187,7 +187,6 @@ CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_OTG=y
 CONFIG_USB_MON=y
 CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_MSM=y
 CONFIG_USB_ACM=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_CHIPIDEA=y
-- 
2.51.0


