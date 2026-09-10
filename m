Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FBDC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TON9oQUuio6y+v4LacqHOanxJcsWbypgqiH4li5BR50=; b=k8vl2G6AUFUGeGkhkPy8YJAK04
	SptID74R8YgNOh4yb0Pu2BOOT702BwTGbLEzXBSbPnJOwVgwsrTC46aPIHSqUbEzpGSRPzh67U81/
	rgLX19gJHsEfG5iPpBwx2N7SDvz/7/gsecD1Thg2o1jLLWjDZcFviOrpeU84F7UfTHqb54kQ8s3m4
	GnqqwKhOdprL9Rdft5QM3FjRZrqKPyCT9PmgfN/RbJG7B4mMi1J/K+fH4qkR0vTjriHaY6kWVORS2
	Ju8hpDUzqoM6isgr2taBw29we2UTwX1KF/KGC/ryui5jcm7oLhyRc4G5vdVXTEatSgO4r9wKqCF7A
	Uthx2MmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g7O-0000000EgZS-1tnU;
	Thu, 10 Sep 2026 14:51:14 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g7M-0000000EgYj-0lsp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:51:13 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-854f274dd69so4720792b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 07:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789051870; x=1789656670; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TON9oQUuio6y+v4LacqHOanxJcsWbypgqiH4li5BR50=;
        b=Egps9rpeVitu1GkSQBsWuZshdyn+fI6U3hgC7GcEy8/P9a3OOpQCYhqVngLWl7Tutb
         ME+OkWqUqtukEbOFwCYIS4mnDAsCabW62+hzDipEpeADUPOT1HZTIl0jU/X+Pqr8l0M5
         9aOJHRJ+a6H9pOX+EMu/rO6SiCppdW3plg0IwpUAR0y/zjL3jgOqXaEQk97OCbnTZJta
         u5zVx+oTxb/jtD1MpGwgb8vZWht7qgVs6jms58Y+SJpPPKgezCoI3+hi75CPhIYYxTI6
         CGvpAza+Z0vJTDiif/c7x+Zo+wCh/zpPh39vQ+2qrSHRskJGfEGxEu6YFsp0kLTBbNL3
         zE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051870; x=1789656670;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TON9oQUuio6y+v4LacqHOanxJcsWbypgqiH4li5BR50=;
        b=QhD/Ud+Whx72GA1+7ZB6ESTkHTqAmHJTj7Z3z7OaoxtaiCvw0Y2uZUeTNRWEOQFyl0
         y830+hmZoeDbnOLC80ebZBQMKgZpzKTQuo74S5+AjdPLyizJJGhm303Hxq77W1+njNJL
         AP3WZPHaORAa3wCxYmJm0DY1JsqQkEJlFd3uxewR3aizNNm7eLVT34vjP+hhFo97eHdn
         /TKY1clhSI9U22kVfIxdNuOJwlbQFBLUa+kIm8HZZ4YPf09GZMK1jOu4UK4/wnuhTS71
         Lyd11IreKdFmQgiL7PkriTgTofsAleSxnGWGp/iGrKMpzJgRC0+Zhy8pQHYwz2xtWOD9
         HGLQ==
X-Forwarded-Encrypted: i=1; AKwUvBy70V74FdqzeRLAMHBpuYw6TCEvrQmrXwa8cK1nznoJyd1p7TsNUlzqipR0+MBUYOJ9w22oSMNbLt/X5435Pi8t@lists.infradead.org
X-Gm-Message-State: AFuF++n6Fhy6/o7E+NFo7gOyPaFHBrfANzbBESEKjlh4ke2whCSkaGOt
	Hjq6kmiGfMJgLQOtuyQ0jYovG7cUR6X7edze4dxV4mT1RPdsIB4Tj33mhz0iWTuP1xR/4AQyKAc
	aasMnWYw/TgoD+lAZ01sF8g==
X-Received: from pfko10.prod.google.com ([2002:a05:6a00:214a:b0:847:ac08:fdf6])
 (user=ericchancf job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4c82:b0:86a:9be:6bf3 with SMTP id d2e1a72fcca58-86a09be73b2mr5548413b3a.23.1789051870295;
 Thu, 10 Sep 2026 07:51:10 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:51:05 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910145107.3640991-1-ericchancf@google.com>
Subject: [PATCH 0/2] coresight: Fix missing AMBA dev_pm_ops and modernize PM ops
From: Eric Chan <ericchancf@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Leo Yan <leo.yan@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Eric Chan <ericchancf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_075112_219304_4C11964C 
X-CRM114-Status: UNSURE (   9.42  )
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

This 2-patch series addresses an issue where CoreSight AMBA drivers (TMC,
CATU, and ETM4x) missed setting their dev_pm_ops during earlier ACPI and
platform driver refactorings, and modernizes runtime PM ops definitions
across these drivers to align with Documentation/power/runtime_pm.rst.

- Patch 1 is a bug fix (marked for stable) that sets the missing .pm
  pointer in the AMBA drivers (tmc_driver, catu_driver, and
  etm4x_amba_driver) so runtime PM suspend and resume callbacks are
  properly invoked when probed via AMBA bus.
- Patch 2 modernizes the runtime PM definitions across TMC, CATU, and
  ETM4x to use DEFINE_RUNTIME_DEV_PM_OPS() and pm_ptr(), eliminating
  unnecessary #ifdef CONFIG_PM blocks.

Eric Chan (2):
  coresight: Add missing dev_pm_ops to AMBA drivers
  coresight: Switch to DEFINE_RUNTIME_DEV_PM_OPS()

 drivers/hwtracing/coresight/coresight-catu.c  | 31 +++++++++--------
 .../coresight/coresight-etm4x-core.c          | 30 ++++++++---------
 .../hwtracing/coresight/coresight-tmc-core.c  | 33 +++++++++----------
 3 files changed, 44 insertions(+), 50 deletions(-)

-- 
2.55.0.1003.g10538fe699-goog


