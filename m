Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC3DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2/ihQ717gip1RbIdhAUmFN2VOfCa2WEVlzhqB5HfCVM=; b=HPDoZnZSpELVf3jj+YxPY+tfeg
	YJuw7q+Y/PofKBGfDDAdRzh7Z69oMDn6ZAphaMgD4/EHDnlTGPyeKqBcY6j5P/Kf4MmHT+R7U4OT1
	hBle0OU2g4D4r/o+WGnYX9vYr5ovkeUTN/tAj5wLvCTMmB3iDJ0B1xtq8aul8q2fFkIjRz45p7ElS
	hCDhxJi6BrsjVt5/0t2myKKR1+e5i0YChum0k6C3N3aHm+nuXYGQM2hIDPTGebJfGwKLYbGFy/xhY
	IChqpKr5QPWFt+vdSnaeo+zq0eCUPamcZKqDiY7aNpHUdoUAvs9u6lTjPAf637gnUck8ZfgP5xS7c
	LYs2oYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9iV-00000004qys-0WhG;
	Fri, 10 Jul 2026 11:48:27 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9iS-00000004qxi-2zgV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:48:26 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-69841da1946so944234a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 04:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783684102; x=1784288902; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/ihQ717gip1RbIdhAUmFN2VOfCa2WEVlzhqB5HfCVM=;
        b=VZZnTDYKVt/a5Qlc+PCgYH8rUX8CMZYWj+sbEdNsIb6y3DlnvvXdfjftOv7Sln2MOU
         Wz6+6lBJNel4TmlmXl/21KCpBK3IrC0rPnapftipv7r4zkh/GylBdUMVyF2GQa6enmOP
         sJ707RkZWu82t01m3edSvoNNg64Ya0qCnZt9O0abl4UsoIk0IO48Mvv+jR3LO+boV7V6
         OZVHVPX5UHHprBty6s+DaVfV3u7fRShuAR/RP/TWDF3uWcYYwofOHYyozEz/rs9RLcZS
         zzliAH0LATRBdA7n2ISMCucOTEnAsjwE2L2JwDGgOv7ycLeJxxKk6FwDzRn1e0tLJ5Kl
         1Uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783684102; x=1784288902;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/ihQ717gip1RbIdhAUmFN2VOfCa2WEVlzhqB5HfCVM=;
        b=HF2FKSxyVt7R6fYA3HFRFDJsiipXSQbM3/5OjVCYxb6Ep+pogkIhZ4FCqAKY4bkzFU
         grwGoXqw7QdhtXX48uP0AhWnU2chXKZxSrWC4OvU7XPxq/VLY0QYSCUWzsrbFfI75A9M
         h1WNWIHr+vxY7Hv+Tj7SRhacjWEZotfuwje8vmbh5JaZbWuK0mZK9moBOuFxot1btcwH
         l7zhEXoLfQ33a3F1zPzrhCJVd31S6t6Vcc9jXY+NEK546x2kN11TUi3dVr2ZsfMl3i9S
         r69l4VEOmE6rStmBRTazNAjURZtDZLjEVw8+J/ZrH6g1Yr+4gEI46W/dUD0/ExhfccLL
         ePiw==
X-Forwarded-Encrypted: i=1; AHgh+RpME2VhZ8wJmSdLm8H721yoBQ409cqpTemSATSNlufiOU5txLyfiCceIatDFwz+UUNxDzVp4FC4df3FvztVvJKK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3rewd5LTCXX+SrMxxLZc7uWoo7sXK0KzskSm/WiEw/g3Tvfjv
	p6cORNCOL5lMzsGwigoobVkop/rxvXM58rZ6OJyqTRsaA2iCJMt57l7Otbc+JAH7gvcOSycU2C1
	ltpA7DsNLD97VvTYMBHgvRg==
X-Received: from edt20.prod.google.com ([2002:a05:6402:4554:b0:698:bf64:d684])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:254d:b0:698:3b7c:3b42 with SMTP id 4fb4d7f45d1cf-69ab44c1135mr4839467a12.33.1783684101775;
 Fri, 10 Jul 2026 04:48:21 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:48:17 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260710114819.2689386-1-vdonnefort@google.com>
Subject: [PATCH v2 0/2] KVM: arm64: KVM: arm64: Fix potential leak in hyp_trace_buffer_alloc_bpages_backing
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_044824_785644_D083BF37 
X-CRM114-Status: UNSURE (   7.21  )
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

This series provides two fixes for the nVHE/pKVM hyp trace remote buffer
allocation.

Changelog:

v2:
  - Added patch: "KVM: arm64: Fix hyp_trace_desc allocation size in
    hyp_trace_load()"
  - Collected Reviewed-by and Tested-by tags from Fuad Tabba for the
    leak fix
  - Do not set bpages_backing_* on __map_hyp() failure (Fuad)

v1: https://lore.kernel.org/all/20260707165029.3410701-1-vdonnefort@google.com/

Vincent Donnefort (2):
  KVM: arm64: Fix potential leak in
    hyp_trace_buffer_alloc_bpages_backing
  KVM: arm64: Fix hyp_trace_desc allocation size in hyp_trace_load()

 arch/arm64/kvm/hyp_trace.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)


base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.55.0.795.g602f6c329a-goog


