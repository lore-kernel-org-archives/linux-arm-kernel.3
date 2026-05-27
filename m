Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68359CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RxMDxUFcPbBPwBEt4PBCTfJq2IW5Ah8RnYDYNKcrQ98=; b=PoJ0PBpC672byS3voOL/bPucwk
	dHXSUYgkGJo76ApCXWBTkjhVeerKk7UfgyLA2EGdjv2kyOzl8xx93uCjWEiQXO6GUfRBjq0KR6p4C
	wteq1gAK7X2glKDnbIrji5n0j467kJMLe8zRDZDgzjNHjSc/poD93G/xyXq3fL0U+VlLgAqRxRpji
	9wrIwSi9G9MGFhkuSgbfUTWEM161nrFOO80ykvvvG4e603zB+EPqD07YIUTAPsJN4gyzmYQLLAUBF
	I5zBz6ZLjuRviFYFjTV4rMdnoOEINL+K9VPIKTdatPneAXcNH7pAOtc/csIUBnuNVLb24ePvCoPEF
	uLNjRT/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS5NW-00000003HtJ-2Lgz;
	Wed, 27 May 2026 03:56:22 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS5NU-00000003Hsv-345h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:56:22 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36a644f34b9so551344a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779854179; x=1780458979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RxMDxUFcPbBPwBEt4PBCTfJq2IW5Ah8RnYDYNKcrQ98=;
        b=duT17iYvZZ9vC25RWNao8Td0BvHuUG5O/iTyDw+BDzYbaawx8PwNi2U6Knso8MSepB
         lzKt1qSKn+JEp0qGjIdLoMSev6IqzFqHxolOs1HNeLQzC3y5Cx4ZaspRuZHtn1fMoYop
         qMJS6HN5NcmXCS2uQv7yDOz4kc4e3hGoFtSMog7yLHzZojI9gceXe6M9VhusiZHzV/Jy
         F7PgK14ykfZhajdjYbTKFK7iRUtkiXptizwMTJTTAlZYAbdVZLvtmXCcd15FGHq3hOD/
         cuIlyEhxiwkjDFRcwFMPMD4dRPnsDbpuDSao9+ES85NHki6nP6KuOeBR1CBWhtEY0O1C
         JV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779854179; x=1780458979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxMDxUFcPbBPwBEt4PBCTfJq2IW5Ah8RnYDYNKcrQ98=;
        b=DAvsagt3nG2SWoPzAGhNKDO3NJFi7Dp3ksFZ97aLF83+flw58OoTibbhrbHPdSnLBY
         e8r2W4yOteBBYJuyzortr6QcdaUFUr1/c0MpLGOSz4PcdF7zyyMOE5UuEv6qeJpoWg0n
         ElTI3wfVu8kM6G+5VzMVZi6KBzQ2iPlgWFIA6Gaa8OX/7449AmLwhCKh/pPLoqJv/O7O
         dJfLOZpTcY+PQh0wNF+rtWYOmioR40WMBK/WAT3aZ3H8oiGB7vcGxS3VLe5g37J5HdW2
         ZNo31EEb1r67dkAtN4jDWdjnmtlxL0VaUd4bbIy8VYLIKXgdqzjpCCCSI7opm/QX7Tvn
         v/fg==
X-Forwarded-Encrypted: i=1; AFNElJ8pu4lTCnjD1trBC46QcMVvleyYvp15KI08Nd3HKWPGX4QUeui3srt3ShMDOCdNEKf1IwsEGXEon7u0yERsBYqC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq14B0RQg/tqZCmd5COwJLvrCOayZP9s7xAqtr6Pw2m0WZjLh5
	i8nrbD/INEJ5ABV0lDAb83Ts10n9GT6SeDewkp4qD6UNTX5jZX7zlmj/
X-Gm-Gg: Acq92OEReUGXYxt8DSPR3EMPVlRbg4eTC2Fo5qVDHP0jMkqDTW7phxmhYJRZiY+rvXE
	KeT/iWt5aKN+036HFggo6Xho5clrrc9EHwyuHUwtp/+k86YeVC7eUipOu03aV5h1dQwoygaH/5t
	Ixj3MAXQApuBbvNZ2odSFdFFFrEdvDhPgOh4viDu9w1VFLYTbudYDYe1ketY2Lw0Md4zYUizMDu
	NZVLVL5ENE6WUjNna4y52Sp//ZCGHgteP0WER+5jgjcVyFUXrYLheRsDY4RMrqjzdLpElVf+wIV
	PDUZuZbBLs0++GK74b0/rzB+X1hpDh0ubu/Gy4KP1v7UtV03uweoGIH5gHQXSfF+27iCLE3Hje+
	6iVYEVofpUC/08Gu7Nc/iJkZ6XS8g2XkxBQJLyqjlxq4TZ4R6oea9AXLEQBRPjKwL3U3sdXKKNB
	/Jygg0ODspvQpmDYg+W+h29XZQf/7+UKg2nnQPSokKJDnOd2HNGOlXDO3hFFt34L00B83Fp8ymr
	6uLe+k2z1XQdGcaF7/nbx2jsNVhscHWljFcqQ==
X-Received: by 2002:a05:6a21:3a85:b0:3a3:1814:20a2 with SMTP id adf61e73a8af0-3b328fa5bbemr10771158637.5.1779854178589;
        Tue, 26 May 2026 20:56:18 -0700 (PDT)
Received: from firefly-aio-3588q.. ([36.28.158.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70f1ed8sm828385b3a.43.2026.05.26.20.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:56:18 -0700 (PDT)
From: Xueyuan chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH 0/3] make persistent huge zero folio read-only
Date: Wed, 27 May 2026 11:56:04 +0800
Message-ID: <20260527035607.14919-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_205620_804943_9FCE2259 
X-CRM114-Status: GOOD (  11.04  )
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

From: Xueyuan Chen <xueyuan.chen21@gmail.com>

Hi all,

This series makes the persistent huge zero folio read-only in the direct
map.

The motivation comes from Jann Horn's read-only zero page work[1] and the
follow-up discussion[2] with Yang Shi. As Jann pointed out, the kernel has
had bugs, including security bugs, where pages taken with read-only
semantics were later written to. For the huge zero folio, making the direct
map read-only turns such writes into faults instead of silently corrupting
shared zero contents.

The permission change is best effort. If the architecture cannot safely
make the direct map read-only, the kernel keeps using the writable
persistent huge zero folio.

Patch 1 adds the generic support for making the persistent huge zero folio
read-only. Patches 2 and 3 add arm64 and x86 support.

[1] https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
[2] https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/

Xueyuan Chen (3):
  mm: make persistent huge zero folio read-only
  arm64/mm: make huge zero folio read-only in linear map
  x86/mm: make huge zero folio read-only in direct map

 arch/arm64/Kconfig       |  1 +
 arch/arm64/mm/pageattr.c | 16 ++++++++++++++++
 arch/x86/Kconfig         |  1 +
 arch/x86/mm/init.c       | 11 +++++++++++
 include/linux/huge_mm.h  |  5 +++++
 mm/Kconfig               | 17 +++++++++++++++++
 mm/huge_memory.c         | 25 ++++++++++++++++++++++++-
 7 files changed, 75 insertions(+), 1 deletion(-)

-- 
2.47.3


