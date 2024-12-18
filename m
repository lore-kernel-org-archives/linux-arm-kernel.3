Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938BAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 23:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BpsBbc7dRnqqKeS19AmXc9LTraHjm0BP4rXvMvJGLdM=; b=P9tH0DySwchIyexidNFngjiSyZ
	c0o4AeYI/xFhuuVHydlFdg1ch18HKCc5jMwYB1+wSasN/250YAhOQ+0FJtqMMf/uodqJfuk6YAHWU
	p0TRLMMpEuGrcp7a46BHlx5QXN8DEvnfW5bqxzmwAVe+wCR+JRwBx57TwVBYoXjuHn4L5Q9mNRC9E
	/c317oCEa5tcke84Zm9acA11fSvfmkJ4lgvRAo3c31MHGXAxyfcNomGOwN9GKWYYRU7/TIyvQx+l5
	Kc4zqsQ/f2JINzovHUw8+3zjIZ99xY6IEKeZfRgnz/O+FrYOGFl5ovAvt9+aKiFjSnGO8Ep26Ohd6
	8IaFhy7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO33n-00000000HKP-2SfS;
	Wed, 18 Dec 2024 23:02:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO32h-00000000HAT-1UWe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 23:01:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4362f61757fso1645155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 15:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734562881; x=1735167681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BpsBbc7dRnqqKeS19AmXc9LTraHjm0BP4rXvMvJGLdM=;
        b=tK5/AxMBOar3gfF7dXvNaxUipj308JcnMA8kB5z0iQcg0pFo3TFNFrV8po0bbOnsBI
         jn+mDSuTbNoTMzwocjlSZyh/h9o9CRAMrjg9Er24mTMmtH4obHebRbUPCdg3ltnxJRNP
         vN+jidvZt1G4LrEuxUa0vjgVL4jJj513A2LY/JzFM9N4IEj8GbPYnCXg5auVo8jRjpC/
         h7VCdE9+D3Y6HEXr49C8QmvyFuutncIEAvYI2xWg6Ck4xUdGHvtXv5KAARkjDi17rqK8
         u01vkCqD1hR2zc7x8x1ab6CdfPH9d6QAAmUHV849uWMSSpWok8791S6NtG+zIPNrDX5q
         GLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734562881; x=1735167681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpsBbc7dRnqqKeS19AmXc9LTraHjm0BP4rXvMvJGLdM=;
        b=M/b1t2qFI1XUIqd9ddIws0H0bGuYVZ/ta9katE9OQGbLKVdhzdpgcNxEx/iUGAoTuk
         cT/ylb9nB3bCmW1AFD+cAFbrMvgwDRWX9prH2Hx4gN6VgaY7vpb67GFwn9mlDwXQAMIA
         UY8l5c95EEkm+FtnnbzZalzFwZDtPM1pZeylsnoxprv+gSRttL9rNPMpwTiQZrZsDI6v
         J7Va2VkPPb8jLTkxmiqVwdXJIU2eppQ5j/2W3SBdqDZONBa3xVsLlNOu1Wj2DL2tkX1W
         1sew9vjXxf47oZKB/+DleLs3fHe1geFo/H2zd2JBd6LsYZ7fx0/FCd0cAbXUvsywVunj
         Z+/w==
X-Forwarded-Encrypted: i=1; AJvYcCWgeKaYaxPcRppaW9tnJh+TVStHTJjdAzDIFvMu6VPvr7C/xxhzNMgwqQNMSVq+khkBGFBTroWu8iHHFBY42FLw@lists.infradead.org
X-Gm-Message-State: AOJu0YzNWn+o/9dM7jg5ZPaCfYZDcW6i7oXv/lEYUX9FtXni3qxEuzOz
	zogKi9+vhxy5YpJibN6L6XPCdYajjZ9WnFJkn2PGScnjblZwIKpxSfmjBIfqUck=
X-Gm-Gg: ASbGncvwJ3CBjMxD+Dxk6S1IqD7Cd6XXtZoTfbamugFXbPFInkz7aUh75c2XXrmU6lA
	l5Smr7mnrqpvbS2xzKlqsinR5Ke0SAluqT3OV+B/VrwkI2XUtHbgM7NCSh96b45+tPyZ511qeQg
	R7/IaJc6jvw08KQpgn7TTU2r/iZxgM9hskWvU9/jRMLG/I+dyCqj3/hiFJT6PJKBZn98/iK/WmU
	8Zd/czbTc8hDFJlH8gNjPNwuzqrjjhzf4aXgLgRtwFIRvF4+VSk/ZzbNVM=
X-Google-Smtp-Source: AGHT+IHM6hsdqg3U58n3U4+TrCq/fnuAP3etFPalHB6iF7Jni2HtRwHUBUpY8hhFqx7rmIXUglyDmw==
X-Received: by 2002:a05:6000:4916:b0:386:37f5:99e7 with SMTP id ffacd0b85a97d-388e4d64938mr4756310f8f.33.1734562881574;
        Wed, 18 Dec 2024 15:01:21 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:7895:12a9:ae3b:17a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b190f3sm33291835e9.32.2024.12.18.15.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:01:20 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org
Cc: james.clark@linaro.org,
	mike.leach@linaro.org,
	suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com
Subject: [PATCH v3 0/3] Extend logging on TMC start / stop errors
Date: Wed, 18 Dec 2024 23:01:15 +0000
Message-Id: <20241218230118.999859-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_150123_451747_C5CE3A66 
X-CRM114-Status: UNSURE (   9.47  )
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

Extend logging on TMC start / stop errors

Recent issues with trying to debug TMC timeouts and flush issues shows
a general lack of logging and context around the possible errors

Add logging to general wait for stop coresight routines and return values of
watched registers.

Update TMC to use this logging.

Changes since v2:
1) update coresight_timeout_retval() function to accept NULL for reg return
   pointer to simplify coresight_timeout()
2) Increase checks for MemErr bit in TMC status registers on error.

Changes since v1:
Rebase to coresight/next (kernel 6.13-rc2)

Mike Leach (3):
  coresight: Update timeout functions to allow return of test register
    value
  coresight: tmc: Update error logging in tmc common functions
  coresight: etf: etr: Update logging around flush_and_stop() errors

 drivers/hwtracing/coresight/coresight-core.c  | 50 +++++++++++++++----
 .../hwtracing/coresight/coresight-tmc-core.c  | 44 +++++++++++++---
 .../hwtracing/coresight/coresight-tmc-etf.c   | 12 +++--
 .../hwtracing/coresight/coresight-tmc-etr.c   |  8 ++-
 drivers/hwtracing/coresight/coresight-tmc.h   |  2 +-
 include/linux/coresight.h                     |  2 +
 6 files changed, 93 insertions(+), 25 deletions(-)

-- 
2.25.1


