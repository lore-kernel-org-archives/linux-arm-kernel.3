Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21A9CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/x+QZypm9fvyoAG/ZmXxUFMkpYfk32s2LMp4va6ct/0=; b=AMO2mtMGnghTJhfZDBka5t/hVd
	wxvmWBLZmz3QC8MyLicULR9sAfVR+KFfP493T/b7KAatLm4PSvL7a31k27T8z6Lh3AIbz8lLxHp5Z
	eA/d6+L39v7PjHnpPJHyOiXNMyo2hqfoctW1kpztksInC1NJpZ3xySi4PSp/GdkOfUvSzgU8UzkST
	A0wwW++o6Ej2fsADPwPaBdJMpfHr2r1OdKFVSbS5uozhK9mJ10m1uF0SCeJ2oHHAyZF6d/DY9jpF3
	6Ls6dgh12kHfRF40O/Sm2Vmc+hgwuYuyZi1q8jlS8LT6EG77vc1U/QgoaqZzgDojOM/w4u1BqRA9Q
	iaVYs14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQG0-00000002MxG-2cmm;
	Fri, 22 Aug 2025 11:48:32 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJF0-00000001UTk-3QVN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 04:19:03 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1671467b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 21:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755836342; x=1756441142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/x+QZypm9fvyoAG/ZmXxUFMkpYfk32s2LMp4va6ct/0=;
        b=kmgs3XO3LTQvxf7HyG7vt3om7TjWjJ2L8W0BWTNS2K+0IxlIiA0Exb8SxBYh1I/kMd
         WQjVgakUP3/s1bdzh3zd3nfEuSR60kzFEIwajc9pgoVO7hQJCqPds6SLEMVxdxwMnJwX
         zCqP49no1lu7U6hfJb7bTTsauXCnHR97erYG1+C9KZwWj+1tjeg/EkcJp3EWBJR1B0Hj
         UyGTGNGbVtSHioamgaYYXSt7dgesERmw9JKUSx4ubLE9H0WEEhjJR32O5FDgNqOaCxne
         fPyLHPZdMyOyABTdfnMHN/hrU3bKSvMcfduvb7XK2CmSQ+dr2owcMvIrLxaC+cV5cx0i
         Tx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755836342; x=1756441142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/x+QZypm9fvyoAG/ZmXxUFMkpYfk32s2LMp4va6ct/0=;
        b=SL0gk5Mhr05daZuWeP44Pjgy7aXfaVVeaO8xH9ywqAyMa9iKSw3glEpSm1zMguriR1
         gKAeqNK7Vl+jANXIXDiprl6oTHn4SpobbDkoRRVYyu3LCG+GE05wCpmKcHAxPeq1HZvB
         FSjrp17+XfMQRBd6Q86mailWqpwWWahYxc3KTqQvdv7gSTznXcl08O7u6wdXcIAvRzyx
         877ye3TCVnNSJUO9Ov4z+fJA6W5iImrD0/XfQ9zkwwmoKd9o2HyGwkxLChxt0oASQNcr
         fCKNlpOAKNFEI5tGtSYIYYFRKgHeHVFTIuHF4bw1c7jqjlZzpWVzt8sAR+0fHNGKzPbz
         A3ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJxfCjfsL4DyjuX7X9nEUO3paCZy4d6fTKLtNVTh9KLk4HcOooIuFEXSRLWrTbqYvghlj+S0zTtu2+g56tYwKQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyh9cxUOqm+kJGr973lw6kmtNv+pE96Q00RHHKwB2BdBRwNBT9
	p60YizgbuaPHXjOpVPQZ1NmjxCHeIryzzI1y172J/mNfa90jMuXyJR6x
X-Gm-Gg: ASbGncucW6GtDFqBsdp6abwA7Om1FMGw9Ae0kh+zjPemzzrlrXpMmjy5bgslaPK47m7
	4uN2tm6AgyGbeD98M2O/OCURGZbl5jFR6L34vmkEJVU8eUPa1pfok77v8DxKVDcENPVcqel5q48
	jsN3ROAyoosJrcdMvoZCgQDkBKiUqghfh7Cs5w8ETxjgD5rGC9dhXQkquMmHmfAhljaVykenqED
	BWMtPkrTOze29+hrGZxCVnTygAe37zyvPOAKgFgNPWn3n5UhgDqiKb/6mQ7b9qddGae83z1btBr
	tGS6EZyJqIxGPmTVi0rgXw2cYvcvAm8azjAfGm0ywNkiDAzFHwOJT52inkbRfTRRvLkCV/zm2yk
	TiQyl9HB6peSYcgI/7v6pCG6Ce7C71HVNJbj42Z+GT38HCqRf4ii1bOqTczFKzA==
X-Google-Smtp-Source: AGHT+IEKoSR47Dk2l2J6zVwmnsYTxTjpXFUqClE3wvNa6dUMQxX8q0ptO6ER7RqDaLBBloH+cqNQ+w==
X-Received: by 2002:a05:6a00:2d17:b0:76e:7aba:cb42 with SMTP id d2e1a72fcca58-770305d5f8fmr1791225b3a.14.1755836341937;
        Thu, 21 Aug 2025 21:19:01 -0700 (PDT)
Received: from luna.turtle.lan ([2601:1c2:c184:dc00:ba38:b533:dcf5:1e7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d1375a3sm9534559b3a.43.2025.08.21.21.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 21:19:01 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>
Subject: [PATCH 0/3] Type correctness cleanup for ARM64 MMU initialization
Date: Thu, 21 Aug 2025 21:15:35 -0700
Message-ID: <20250822041538.467514-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_211902_853704_874003A5 
X-CRM114-Status: GOOD (  12.52  )
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

Hello list,

This is a small series of type correctness and readability improvements for
ARM64's MMU initialization code. When I first encountered this code, the heavy
use of u64 to represent both virtual and physical addresses made it difficult
to understand where the demarcations were. I made most of the changes in this
series while troubleshooting a different problem (fixed in a separate patch) to
make that boundary a little clearer. I am submitting it now in the hopes that
this will improve maintainability and readability for others.

While nothing in this series represents a change in behavior, it is not merely
cosmetic: I believe these changes better align with the kernel's code
standards, type discipline, and common C idioms.

Happy Thursday,
Sam

Sam Edwards (3):
  arm64: mm: Cast start/end markers to char *, not u64
  arm64: mm: Make map_fdt() return mapped pointer
  arm64: mm: Represent physical memory with phys_addr_t and
    resource_size_t

 arch/arm64/kernel/pi/map_kernel.c | 41 ++++++++++++++++---------------
 arch/arm64/kernel/pi/map_range.c  | 20 +++++++++------
 arch/arm64/kernel/pi/pi.h         |  9 ++++---
 arch/arm64/mm/init.c              |  6 ++---
 arch/arm64/mm/mmu.c               | 17 +++++++------
 5 files changed, 50 insertions(+), 43 deletions(-)

-- 
2.49.1


