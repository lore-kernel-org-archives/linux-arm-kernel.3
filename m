Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845E8C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 05:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YntZz1Mt/wtlO4/vUgbqSz5D1yOoCBwe8qT49y3en44=; b=RVzOxl8dNgj3fuqti7ute0Ot4O
	SNXFYBecs8KgMSLgRvh40cBudKHwMjpbu9oNFJNl5DHtRKCDcwZ7dOcSn9ckDU77KR27cY+WjKJ8g
	4N3iylcRvzzg2XscFi5CT2q+oM+TJahlfLVTFfRcuih88rnLKv/kd92aQ0HuHrqYl7LVTTzZtoE8W
	GGAj56tWH8EOpaCyCMuOLSjrPnjkTLaAZ0XbiD+SbLEUFcWmxVa/pAz3FM/+4p+QUfFtMyKKWlYHD
	4EmrXePROY+J+31UupMiZ6sPBC32r+XY9R3aR+L0PwXVAo/dLAY+phwslgsNLeliq4x853220J4Xw
	fl1cXfCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taTEo-00000009PPM-0qUR;
	Wed, 22 Jan 2025 05:25:14 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taTDQ-00000009PIy-2maR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 05:23:50 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21675fd60feso136569255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 21:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737523427; x=1738128227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YntZz1Mt/wtlO4/vUgbqSz5D1yOoCBwe8qT49y3en44=;
        b=gtsYwJBYw0ukaTlILyMLgJBR8ogohAnbpw3baVSJN1Ysr/hte7JhP/T8qubD6fJwe+
         IY4TWadQglABd538UtjFOz+AVnLklu5zeYJ+qYG3n4plOxjrxsS0pBOkJdZsLglv/PKJ
         OZf7JKc3o3m9q/0s08+IBVdmOlpNIHJjmNji8tyDAvvlhpgOuXONqgq2u3kTitWZpCmO
         inIHBtcZ6D29R+k42EW9d+fzTJkaYpIZduyr1KohZ1W4S7cOfgd90qJO8dCJR3/B0Z9r
         FYmkU/kU1SCGba3UTQylOxGO6vca6UQt0yZefh68syJyJEO6ZT7fyvhx5JINvnj2Ke3p
         0G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737523427; x=1738128227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YntZz1Mt/wtlO4/vUgbqSz5D1yOoCBwe8qT49y3en44=;
        b=SKhUv+DzLiL5wxuJi4rY2GWnnMaqi0KzjbzTrWsm9i1CvU9WZ9b9T6+9LGlNw+a6oN
         hgQ5LrMsdrjzPfOqdUfG9HnGygvHYMJkxYb+CeufYj1u3HPrYryN86b68i3wiiH39gdd
         1cbCuSWAFm/XdB2GuXiHt2C+4bQFjjPA9Z0HQMUsfxPSqvDt+L1A0U5TxcrlrbzAsaCN
         mcXekC1YIu/p/1sKMeXZDEBlwTohfjPTo1Xd0on5IQXKuGqQs5MvQ1f0b9Eyppp2FIqW
         q58Kfr5N9roOon1oYynV/B8CUPpDWrjBHpCBcPjvdIfZ3rbhYu5vxPo5gYCeLI7EH3WL
         /bxA==
X-Forwarded-Encrypted: i=1; AJvYcCWyukHc5IgVsMfWJd7e6JhVAqsMUWhYn9yQ2P7warDeqUQ32Xq39Oer5nhMYJej8FhevZ65GzisD2X3avoTnzKd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw39VT6WmUoyl1HjqzYSJh06tmIOLLdrT7Fz7gGlvkPKyuGLOh9
	q8VqBPTsmvY5p2POiDYDPJCTCbjYHbC0kn0zzqgPYUhLnYIAQDBGeKQGja84QYg=
X-Gm-Gg: ASbGncvYrca59Cjlz/hY8wpFJh4EYXH6yf1z98g+GqvHDkOLq5qGz17GImpk0EZeDY1
	no+c2ZBz4CnszojHY8zIxJmDV8+5f30Tn/CQJljLZ0w3ivmB95ZnxdEVkmNSEguaRc6jHnXdlJe
	+QjiOPEBO++/6Ici21MD3lAKVPoej4GIGnOCZoMa8bzbSAMWHl0WS/+pIC4QYPvbwa39JGfE4Xm
	0/r4jMTcG4PZC2Y1/mt+NMS3Y6DUz/L9c0rn1Gl9pWAWywz68XskmEFTUodRdR9SV7x4txC
X-Google-Smtp-Source: AGHT+IF5NiznMvHmJ56DNofog6mUGrXroKcpo9h4kJw0sm/S7G5ZplEwIxWReVDfDx4BrGbiIDsDeA==
X-Received: by 2002:a17:902:e88f:b0:216:48f4:4f20 with SMTP id d9443c01a7336-21c3551437emr302333535ad.16.1737523427653;
        Tue, 21 Jan 2025 21:23:47 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2cea073csm87367825ad.48.2025.01.21.21.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 21:23:47 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firmware: arm_ffa: Partition info can returns self as well
Date: Wed, 22 Jan 2025 10:53:42 +0530
Message-Id: <0bc7e1754db0547c6c041ed178cf24ca326af2d1.1737522729.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_212348_732033_18B0359B 
X-CRM114-Status: UNSURE (   9.90  )
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

Partition info may return self partition as well (specially with newer
versions of FFA spec), skip adding it twice.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Rebased over: 9967e35eb1cbdb8d0c0bae3f54401d806700e6b6.1732255888.git.viresh.kumar@linaro.org

 drivers/firmware/arm_ffa/driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 34d9a54b6a77..b824c7c024fd 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1424,6 +1424,9 @@ static int ffa_setup_partitions(void)
 
 	xa_init(&drv_info->partition_info);
 	for (idx = 0, tpbuf = pbuf; idx < count; idx++, tpbuf++) {
+		if (drv_info->vm_id == tpbuf->id)
+			continue;
+
 		/* Note that if the UUID will be uuid_null, that will require
 		 * ffa_bus_notifier() to find the UUID of this partition id
 		 * with help of ffa_device_match_uuid(). FF-A v1.1 and above
-- 
2.31.1.272.g89b43f80a514


