Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04469CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PdpieMb9IrqAZOHrmOFrCKGqCrPoDymISML061l9Fxk=; b=mJsIItMFatrVPs7T1SVBowinkl
	uzn2F2rW+rscV877KtJAzrBVgYeJ4xSKSB7FmRiTOzYbJuH8H8vL9rqxl/WpNxj/9yYbBVGZSjmu2
	/Dd9O946D41orks8C8VJxUHWIGJEFV75zqEUmPad8ys4xu/bhHdaKL5uMU/S/xVV0mgXGAxZp8qMG
	LzHxV7I5rP5jpyoQEANo4NiYVezUJQykehdvUnyduuEk55uvT9i4m3RF0NlYGjCQ9uAF2b7RAD+f2
	4cgjkzHiUTR0/Bhb3Jf+fPvHy5kZI48/VaeabsBrgjmxDSACmCVFYj9fTIypkVqz++FKHkiAVRq6q
	OQFOMfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESD5-00000002Zb0-0Ykt;
	Wed, 07 Oct 2026 14:01:31 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESCy-00000002Za0-15VR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:01:27 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-34c4a0868b6so3657650eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791381681; x=1791986481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdpieMb9IrqAZOHrmOFrCKGqCrPoDymISML061l9Fxk=;
        b=hHMH2B3Pexwy4zqAkh9r/8pb9HBXuRurytU8Ui0wAj/3jLvvpu53IXpwXNHG+QKzz4
         zt+JJI7OBJZq501Q3SRE1oQjFwfRJBHylcCK7NW2kRN7IaMtGZZ8qHQL2L8SNXaJh8r/
         vRi/X3QOliO9/WLoIfkTv/LowspDgApZFa9V5wgZJh9l5d5QQHM0HO/TPNDXryuZWLSQ
         gNyKYcsc2kdXk8bGx326/jlBSZp6THJwpN+Nfn0eOJNmO7IP8d/VVi3CUnjHUUKIT/4x
         ifs6BFvG+zT3+hN2BVrImn0X/N3TSvZc/iKBemslO6Bluta6u4CfKluHmsmS1VgO99Dr
         Ivag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791381681; x=1791986481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdpieMb9IrqAZOHrmOFrCKGqCrPoDymISML061l9Fxk=;
        b=Bl/goAkO0YInfpkEN8LAVESVINAGe8qZE/o1aTU9SnC3cQsaYDfpBNpkqRuG4OulLn
         cqsHwPfpPW+Xv8cQFlbIGQQHy6x+zfsNg0ToAvH07fsmuSJBvrCKJ6Y7TVvFmTgvmrDP
         L+EHyTKPqnii0FZzzUYtCW6R+R9iESVwelGwfXKPWZgoMHL1Phh0gSlWi+WwfkRuSoj3
         8RXjc4IV6Wuc9pkJRsYTzRPbN1P8JOhmVoxUs+vXerahaAE840h8gG1mtdtKsuoEoUOi
         QCapdVDA7vVz59GYTZ80QnairbfGM36bONnkHlVHGFaeeSN2Y6g6bNOnpqlnc8i5bjkt
         U7tA==
X-Forwarded-Encrypted: i=1; AKwUvBwT4sQCls6wOhHiHs0/iseKqERuPGx7PxY/dC7uD5v9L1QK09S0Df+PaTG5LrDwfxJ0FvpRac7veRgnUdD+EGHA@lists.infradead.org
X-Gm-Message-State: AFuF++lGr39CN2KmWG89E4p7BKd7E0A3ZpShsXoxvpEOtg0ZZmOyizh/
	900Fn7pOyCYj6S6sgootdhESAAsxvdLLjxVEnvhWrHDwsm6jy2AtWBXJ
X-Gm-Gg: AYBFou0Xq7sDBzoAlaIGj+wEdONEvnKUmpYs3jT26m3W6KFdh594cg1IFUNAIHYbZL2
	hKO4sspdxVA1hJ8XFB3JYTHSJ4TJ90DzHtPqY1jzUAum5Z4CnDmG3MdUrtbjzXH53TfumBlgNzh
	+fJMGoYiUos7R3nqtVcUPu7fY+8vvLhviq64v/XR2q++brMrrqnH5JPICM5kD+IULjSa4v99vM0
	ZzAW4fCyaBPtkQMz8rxBLwm2tkVugXb8F2OC9IOsrFUXi9QY9eII5vnukEWTbpO23M+fADDkXFi
	4JlokrGoFyv1QeZuBdo1nEY38VD6pJxjaEmVD5B2l9/g/s8WrA4cftEMoFCjkRtJTh0D+ldQFU8
	bQ9YunGYjg4iUsI+zaV57XI94MmHElcvNJ/FXjIinxek3MZ55G4hoFIAS73HmmDagyWHoECGmvL
	HKlSC7533KOr3bXrywmTTxQjL/Z47+cEV5Uq8CyoK717sAUPw4QwlPyq0n4vE+9Sf0IUSBsbqDj
	zHVGKrWS0EN9fsTZK0jZsZDOib/Rw==
X-Received: by 2002:a05:7022:ea8b:b0:143:3769:c680 with SMTP id a92af1059eb24-15d3115a913mr6364429c88.25.1791381680555;
        Wed, 07 Oct 2026 07:01:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:65e4:8ceb:88c7:bff4:c488:f682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1630180f6a5sm4179461c88.22.2026.10.07.07.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:01:19 -0700 (PDT)
From: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
To: mripard@kernel.org,
	paulk@sys-base.io,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: [PATCH] media: cedrus: fix typo in comment
Date: Wed,  7 Oct 2026 11:00:56 -0300
Message-ID: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_070126_722109_6D5DC3D3 
X-CRM114-Status: GOOD (  11.21  )
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

Fix a spelling mistake in a comment: Neightbor -> Neighbor.

Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..f57642c0d8fa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
 
-	/* Neightbor information address. */
+	/* Neighbor information address. */
 	reg = VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_info_buf_addr);
 	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
 
-- 
2.56.0


