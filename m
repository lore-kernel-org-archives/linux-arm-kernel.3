Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A60C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 20:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g0y0MORjjtTJ4R3KpCgJxXhzp3sN9CDldjtO16QVgEc=; b=TFltdnpwYrhdrqoV5OtlfxBRqJ
	Riu/LFPAwYtUBc99UgqELiNijJpQQTMBeKZ21mfPtjsjrNgmVnCK3ydK7fffTQBwDsM3V9p0xmhx1
	6NG/en3K0EjN/adTkhuJW+1t9LNrArZOh0stCrKlG74WKyI+WzEOTL8qM/GJDhtmZqjF0+/jNRFS/
	LV9nBj8Hs/rrdOFPnppLpr3HhOymM6JbofJCSbKBoD/+oVh9HOlvSyGmU4xEigeWkSQgTIqjC6qA0
	OCnMDqQHh/z2s0ZoLtc2Ni8MaM0XyFIouPLFcHJIi/7mD4bmR8+iYgJN/9rBMq7fQSjP2drs3xMTq
	JNzkqWVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FBF-00000005Ie5-28Iv;
	Tue, 08 Apr 2025 20:04:21 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2F6s-00000005I81-0zgq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 19:59:51 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-72b846873b2so5883092a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744142389; x=1744747189; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g0y0MORjjtTJ4R3KpCgJxXhzp3sN9CDldjtO16QVgEc=;
        b=LpMXCSFb1+BHeFmSfs0BJKdQ/zvEgsLEC6aCgtxHaD9YSCMyY843TEk8+DXT7/R7gp
         Bg40lTbZr1CDcnirYZXhLYCqHfVKuAkBgqdTmzCjq4DlpPjLiJZYGwMiKTXXoaRHinot
         lLqcWCHKwcMlHXHGN+UQvOOtYGfMUn1rAhGfPMOv7TBtwziB2WZbDFinBB8SHcQA9lzA
         Tu4044d/AP0z/3N0guk7tXZ17AESO5fmY5rEEGShqTHpCqwFWIkwEdFKubDA0rYDZQWl
         2EAas9tTpDV+u9TAmM1/eiTOsvWlLyIWw6ss4oHV04NgaV0yc2KceZFYFbK6GfX4FU+P
         E8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142389; x=1744747189;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0y0MORjjtTJ4R3KpCgJxXhzp3sN9CDldjtO16QVgEc=;
        b=LMWjnQHiGP1ZvzWk9RqD119jLhkZ6cy682n2nOxEaTl/DxRlEbi77b9jxf/AhEtkwo
         4oDNoU1nVt2Y3yLcHw/lEk8Yiz7T9iV+zIaR4ePPce52WLEzWVeZdh50gYHYgxZvjqmo
         vNrjxgijdQzN5caJA0uKM7kX6JV3Ktyl1ABNowuXX7Tca9LEg9fWLXoFBuOV7wucu+Gd
         Ly0CYnoHbXa2oJlm3V1iMIjQTv5HCvrPSWXIeUMugqY7SSm0pQEv1pRp3RFT+PwmR+Bz
         lDHEWBzFbDWp76qQAuDHZy7LnTgeGpDq4zrp4h9IYAx9VDjMXHabe+FS3u4C/tBph/uv
         ONTw==
X-Forwarded-Encrypted: i=1; AJvYcCXB0kkgM750gTYgKePSE0R5tCSas/MPhKlkiAdr/ZBSnsQo+sIE4D16PzpX9vjyiMgYQjhD1LjiI/RVCEk5ofw3@lists.infradead.org
X-Gm-Message-State: AOJu0YyIm9x+HQtLOXgjazAF3rAYEDyDWQxcH2FFFYK6iSFfaVbueA45
	j5HhtInwb2T7xxUKXVrIlFsLyaaLuPrbZZqx/u0TB3YG2ye48HkT+F5w1MZhAZtllMosxryGlRQ
	+
X-Google-Smtp-Source: AGHT+IHtnt5zN6OyJvv673+ynstNvQUf43BeN6J0WtU8LzaOOlcLNTKLOFI6eZdKvbTOSGjsZBpwHfH0Ns4=
X-Received: from oabwd7.prod.google.com ([2002:a05:6871:a587:b0:288:7c1b:bc])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:3981:b0:72b:8a8b:e02d
 with SMTP id 46e09a7af769-72e7097ee43mr304697a34.5.1744142388625; Tue, 08 Apr
 2025 12:59:48 -0700 (PDT)
Date: Tue,  8 Apr 2025 12:59:20 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408195922.770377-1-yabinc@google.com>
Subject: [PATCH v3 0/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_125950_307766_C867B558 
X-CRM114-Status: GOOD (  12.14  )
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

Hi Coresight maintainers,

When tracing ETM data on multiple CPUs concurrently via the
perf interface, the CATU device is shared across different CPU
paths. This can lead to race conditions when multiple CPUs attempt
to enable or disable the CATU device simultaneously. This patchset
is to fix race conditions when enabling/disabling a CATU device.

Changes since v2:
- In catu_disable(), return 0 when refcnt > 0.
- Remove the patch checking enabled mode.
- Disable helpers at the places where a coresight device fails to
  enable.

Changes since v1:
- Use raw_spinlock_t and guard().
- Add a patch to check enabled mode.
- Add a patch to disable helpers when fails to enable a device.

Yabin Cui (2):
  coresight: catu: Introduce refcount and spinlock for
    enabling/disabling
  coresight: core: Disable helpers for devices that fail to enable

 drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 drivers/hwtracing/coresight/coresight-core.c |  9 +++++--
 3 files changed, 25 insertions(+), 10 deletions(-)

-- 
2.49.0.504.g3bcea36a83-goog


