Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3C8CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 23:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5g7ObkSqnx53X5/V5YJ3w24qsBA4fQoZHAaxTh/BVec=; b=GY+qV/cnAWbvMMOdI7WzN4DkyF
	+9FSqsUsbDfuSEPWulS3Sj6JV9TDMsj2pbI3G4LTlNDdlTYObYtq74LXIBN2RqaohvVr16AJTb7Wo
	lnt+i0UKyuLfhQ2XzJgnEJW/f/ukFSAWYKyicHlHDTur+UMBMDMFKGJr7FVPwt7MTJFbzGo2bNkWl
	S3wjJ+BbPFo2CQVkBMMhbNs5RrXRsEh8LEK476znPpHlzWDuksdUyhxND3M7+8wMti5H43EfoHmCR
	op/uz+otegkQg4D+wHz4fYkcFCrlE8TyWHo4naMY/QAl01uHzX2LFhXfxBsgOSu8mhTbzP06hHtYK
	iFn0QkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBM2o-00000000x7u-1Zwt;
	Tue, 21 Oct 2025 23:45:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBM2l-00000000x6W-28k9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 23:45:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso2824954f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 16:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090329; x=1761695129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5g7ObkSqnx53X5/V5YJ3w24qsBA4fQoZHAaxTh/BVec=;
        b=lr84i5BHmLZk7odmG12eavKJb1tB/UCSbPVEdABh9/2rgre41gS7X/OHUpni88w42q
         v4XbttEX1UFHx315D1tk3UOAHMukkFm64x2bIip+tV35rVVNFFiLbkKD7Qy4TGtJ68q0
         xgpGdqYzPpH9zF11XBMH7jublSG1GZUdCcUXLMVhGElpdFsEnPyxBlSfLSZEm1eL8qpY
         0sGYQ1xEpyV0/9/5qGmKeZyMNSQLXrB8ehw60vulfFm76jab32i9hV//TTV44xx+O7i8
         u39j23SvK9OP/1PHWKGk3CiOg7Uv91W5K49n4+d+BzXBUnu/dF1wjLRvAKLRyOhIfJ47
         cqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090329; x=1761695129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5g7ObkSqnx53X5/V5YJ3w24qsBA4fQoZHAaxTh/BVec=;
        b=gwTtfnMyIha3d3iTMxNjv/1pXbyVt21ZGrMBLcai0JBLMcBZY/96K+i2p2NZh2NG0i
         ca/vqdvL95KRoH0L9n0dzRLGGcLXHisYlv0D0yPEF/llJgFv7KUleZ5YGX82I/dQEOPS
         TRnYR9SyptpUGkIQcZ2LxGQ5fCi68VsueiIxjtQWOetnzR2tK8CufV41xTD1o/QLspgT
         Bq94ROgSAxq7S52fHNh/ggPZciMsjn5iJDOFWz4CymJmJAwIN+VYPwly+qECYjzuG7gh
         bvU3Hu1N6VhoHsq5PWAenbNdosQ9kFZaZyC6Z37szA2ItYD03s42g3sq9FNDqnCsONJT
         1xyA==
X-Forwarded-Encrypted: i=1; AJvYcCUMmncgcO46laryKRvBA3ZfL+4b7GN5pRr4TEYcFx1ltxliOuRmVKiskUDaJgQu/np+CcXkxGVQNjs9elX2ZwN5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6kcqa3tG2vAnYZAz+7YWuXxUb1/sr/r8uGMaCekqFcYzBIwUU
	OOKwMH7tF/zzJmMz0akcT/YHafKnntwuRo4mWfJ4GeGF8LbaNu4CPo5va40xCueW8lgYE8388Em
	fUR8T
X-Gm-Gg: ASbGncsc8plI9Pty+LRRfm4EZdOCafE4GY0bwmZI7vqKRhxBn3P4C6LVhog7Rxu8i0F
	QtxfOhZXUZ3VqIZGb1k2g+xXdpMRsC/p1yBfjKCSYsXLMpNqxB+Dq0a4Yz/imUy4QNtefFMPN9I
	xkzIHYXFBNnqEdHfZ6VhTxvN6Oa3MLXOrckZLZru6AE3jwMiJszqpus55+nXq0zz745Yw8QAqFg
	K4ezuvomRmnpMhGVnaid3Lh8mTnQDzwDNr93jNovzMZisb3lrG9WS3VDVy5WpEDkoirWsr6omU5
	ewlFLxQbltEHzduN4SR0QxkwPxBeWOAKxmPjjY6TkzYZhDxeBglBgKENzILp8lEpjlNZ5DTELg7
	oFzmQ/IA0mSZGHFT1efDyvjSulMcN0ouKAWZ4bp17HExt1CC5xo1VjEENIdLCxt8xIV+C/FUi8q
	ekthbUrp1gcTMoVrG488cMdcZTCAdztUFLFC21MImVc7KQhnCQaKeDe0EZ2arZ8qpvl88VAXuWT
	l5uaJrHJ5GT/ts1MDAhOEUvO2mt
X-Google-Smtp-Source: AGHT+IFLMuoucFczZUZlkgqlVzRu+z33xFXdk/m+zzZi86FabALi9UPFsvpSS8en0ggRC5DDvJZhRg==
X-Received: by 2002:a5d:64c7:0:b0:427:8b4:5bee with SMTP id ffacd0b85a97d-42708b45d53mr10602822f8f.56.1761090329369;
        Tue, 21 Oct 2025 16:45:29 -0700 (PDT)
Received: from linaro.org (host86-130-206-17.range86-130.btcentralplus.com. [86.130.206.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a1056sm22247870f8f.2.2025.10.21.16.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:28 -0700 (PDT)
From: Mike Leach <mike.leach@linaro.org>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	james.clark@linaro.org,
	Mike Leach <mike.leach@linaro.org>
Subject: [PATCH 0/1] coresight: fix issue with insufficient claim tags
Date: Wed, 22 Oct 2025 00:45:19 +0100
Message-Id: <20251021234520.3355-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_164531_571460_4B173E65 
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

All CoreSight compliant components have an implementation defined number
of 0 to 8 claim tag bits in the claim tag registers.

These are used to claim the CoreSight resources by system agents.

ARM recommends implementions have 4 claim tag registers.

The CoreSight drivers implement a 2 claim tag bit protocol to allow
self hosted and external debug agents to manage access to the hardware.

However, if there are less than 2 claim tags available the protocol
incorrectly returns an error on device claim, as no checks are made.

If insufficient claim tags are present in a component then the protocol
must return success on claim / disclaim to allow components to be used
normally.

Changes read the CLAIMSET bits to establish the number of available tags,
and adjust the claim returns accordingly.

Applies to coresignt/next

Mike Leach (1):
  coresight: fix issue where coresight component has no claimtags

 drivers/hwtracing/coresight/coresight-core.c | 26 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  8 ++++++
 2 files changed, 34 insertions(+)

-- 
2.32.0


