Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00D5D3E2C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j5XRrBUeW9Wl3ksjbcOXPj9gNcJLkL1Vlbum4WC6ah4=; b=IKMJH4fneW63NN9EKVgqXu8+zA
	lu/A9VGaXq6q7YFJb8ZPD35YWogO2sC1RttUqVwx1EI+KALcIm2dPezgF1ZRWPGu9XKI73mDLPG+T
	V9ZGhVYADDTPtZNClePk0Q/qJN3vd/G15oG1Ij2LdcFcBXpxa5J8k/GIKcuMoPJj7ojWx7GSgtt8w
	mwUuLsFPYduQuDzlmMYTxwX/fZ3hCq/EGIReOYWUfPvO9BYD4oblvZyQOvPejYjgCCbYP6NpVWWPe
	lISlgF71P1Ddm7Ht7JYtAShBUZ0Vizt7TozQbO+PeAeWjF6pYvOxU3WS15SfmG3q4xQ0jYlvtXXeo
	/7jj2/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Vj0-0000000C35F-1gkt;
	Mon, 28 Oct 2024 19:48:26 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VhN-0000000C2mJ-0I8g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 19:46:46 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-84fb86af725so1117172241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 12:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730144804; x=1730749604; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j5XRrBUeW9Wl3ksjbcOXPj9gNcJLkL1Vlbum4WC6ah4=;
        b=A4Nj5zmNCEJi6M+uZhcnBUjz/56TXrzx+d7uNEoOB1Dv04XfZVdFMTA7CSGJmsDKCv
         d8rE+9V+6KbGUuDyRtuyairzCc9E9qHr5uZSUjZexHgnH/KS96L1JmsPPqkhH4K1k9Hv
         oSp6+zDhQ4EtOo46kQfKXXTZJjADstTGd4Sh62KL8ngjnLP8axykIVllXx8ilEYAXRot
         bnk1BiGgLx1Qv8KFT0ruZ8VfkgsyqDqMtZfaQpR6uZ5CwGVIcR46gN3z8mVS1qKqB9dr
         MG0TDHDA/3JW8/4nueNvukSkmL8DpIAAUPImNym+qZGHUu0mF7hwbXaXrHFTvy3fS59/
         PEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730144804; x=1730749604;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5XRrBUeW9Wl3ksjbcOXPj9gNcJLkL1Vlbum4WC6ah4=;
        b=mYCt4jeSDvxaK+TufRtFc4x0p2qOcNvLKOlTdIKXtzxlCK9TNgdVvEAanMrfbB7RNW
         nlMq8XYeiChPlpvEHWT/wzS6NnIBFES4JJHLch9Q4MyrXfkWKfba8kdS5ZsXiDxUJK4D
         fp/qO8cl+sD+gTEs88iYYmhaqKOvj2loZqd2sBNirm8mFh652+dONlzSj4neXXyU3Gl7
         pzmC/DC+rjFC36h8qjqrd3NXd+D1TkUwrrDGH9qSREMQtTod/SRC86CNgM5j7KByw7/W
         XEs9PXMKLi2ttKpi7Z2IUj55ERdWEKC9yGS6asr4CA9WdNttSNRIFksQes2+eYlVdJ9E
         eRBg==
X-Forwarded-Encrypted: i=1; AJvYcCVGUAa+BR4auhtHc2E+Q1m1kA4hvmAwAB6jaGmVNUnpzgW+S1zH8FiU/SQm7bJk0ovoLJtxhCfFj+nPAbCHlQN7@lists.infradead.org
X-Gm-Message-State: AOJu0YxKXRmAOxqIuxFe53RkEa+nwz6Jebm+MkfKVM1WDHCOp58nsE6c
	FlRiLeAFSkw5xhFLaZABP9K0CEDC7XNNmrvIMoQyo30hY+o1fkBhPCfnekv4RfMtg3Y4ZulyGZh
	iByU8SHKK3KdeKAPkCvl3Eichh54ga9WCWLNPew==
X-Google-Smtp-Source: AGHT+IH6BXN+34x6/Q4FZwz5j6uquVhYmRBikZ0QKoU5eshCI12u7ivTDuCHpv6wXsxYB2wLgvjIZwpib6ufggFyI1Y=
X-Received: by 2002:a05:6102:3707:b0:4a5:c0e2:c42d with SMTP id
 ada2fe7eead31-4a8cfb45762mr7377334137.8.1730144803771; Mon, 28 Oct 2024
 12:46:43 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 29 Oct 2024 01:16:32 +0530
Message-ID: <CA+G9fYt0pqM_f-uiK=xH0RWrhfABdjy743yyxu4CLtb+kkS6-w@mail.gmail.com>
Subject: kselftest:arm64/FVP: arm64_check_buffer_fill - failed on Linux next-20241025
To: open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Aishwarya TCV <Aishwarya.TCV@arm.com>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_124645_138829_141A2DC2 
X-CRM114-Status: UNSURE (   6.17  )
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

The following kselftest arm64 and FVP failed with Linux next-20241025 on
  - Qemu-arm64
  - FVP

running Linux next-20241025 kernel.

First seen on next-20241025
  Good: next-20241024
  BAD:  next-20241025

 kselftest-arm64, FVP
    * arm64_check_buffer_fill
    * arm64_check_mmap_options
    * arm64_check_child_memory

Anyone have seen these failures ?

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Test log:
----------
# selftests: arm64: check_buffer_fill
# 1..20
# ok 1 Check buffer correctness by byte with sync err mode and mmap memory
# ok 2 Check buffer correctness by byte with async err mode and mmap memory
# ok 3 Check buffer correctness by byte with sync err mode and
mmap/mprotect memory
# ok 4 Check buffer correctness by byte with async err mode and
mmap/mprotect memory
# ok 5 Check buffer write underflow by byte with sync mode and mmap memory
# ok 6 Check buffer write underflow by byte with async mode and mmap memory
# ok 7 Check buffer write underflow by byte with tag check fault
ignore and mmap memory
# ok 8 Check buffer write underflow by byte with sync mode and mmap memory
# ok 9 Check buffer write underflow by byte with async mode and mmap memory
# ok 10 Check buffer write underflow by byte with tag check fault
ignore and mmap memory
# ok 11 Check buffer write overflow by byte with sync mode and mmap memory
# ok 12 Check buffer write overflow by byte with async mode and mmap memory
# ok 13 Check buffer write overflow by byte with tag fault ignore mode
and mmap memory
# ok 14 Check buffer write correctness by block with sync mode and mmap memory
# ok 15 Check buffer write correctness by block with async mode and mmap memory
# ok 16 Check buffer write correctness by block with tag fault ignore
and mmap memory
# # FAIL: mmap allocation
# # FAIL: memory allocation
# not ok 17 Check initial tags with private mapping, sync error mode
and mmap memory
# ok 18 Check initial tags with private mapping, sync error mode and
mmap/mprotect memory
# # FAIL: mmap allocation
# # FAIL: memory allocation
# not ok 19 Check initial tags with shared mapping, sync error mode
and mmap memory
# ok 20 Check initial tags with shared mapping, sync error mode and
mmap/mprotect memory
# # Totals: pass:18 fail:2 xfail:0 xpass:0 skip:0 error:0
not ok 21 selftests: arm64: check_buffer_fill # exit=1
# timeout set to 45
# selftests: arm64: check_child_memory
# 1..12
# ok 1 Check child anonymous memory with private mapping, precise mode
and mmap memory
# ok 2 Check child anonymous memory with shared mapping, precise mode
and mmap memory
# ok 3 Check child anonymous memory with private mapping, imprecise
mode and mmap memory
# ok 4 Check child anonymous memory with shared mapping, imprecise
mode and mmap memory
# ok 5 Check child anonymous memory with private mapping, precise mode
and mmap/mprotect memory
# ok 6 Check child anonymous memory with shared mapping, precise mode
and mmap/mprotect memory
# # FAIL: mmap allocation
# # FAIL: memory allocation
# not ok 7 Check child file memory with private mapping, precise mode
and mmap memory
# # FAIL: mmap allocation
# # FAIL: memory allocation
# not ok 8 Check child file memory with shared mapping, precise mode
and mmap memory
# ok 9 Check child file memory with private mapping, imprecise mode
and mmap memory
# ok 10 Check child file memory with shared mapping, imprecise mode
and mmap memory
# ok 11 Check child file memory with private mapping, precise mode and
mmap/mprotect memory
# ok 12 Check child file memory with shared mapping, precise mode and
mmap/mprotect memory
# # Totals: pass:10 fail:2 xfail:0 xpass:0 skip:0 error:0
not ok 22 selftests: arm64: check_child_memory # exit=1

boot Log links,
--------
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241028/testrun/25586532/suite/kselftest-arm64/test/arm64_check_buffer_fill/log
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241028/testrun/25586576/suite/kselftest-arm64/test/arm64_check_mmap_options/log


Test results history:
----------
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241028/testrun/25586532/suite/kselftest-arm64/test/arm64_check_buffer_fill/history/
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241028/testrun/25586532/suite/kselftest-arm64/test/arm64_check_mmap_options/history/

metadata:
----
  git describe: next-20241028
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git sha: dec9255a128e19c5fcc3bdb18175d78094cc624d
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2o3tMqzOtHXYQjlvfR5tnTcVMe5/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2o3tMqzOtHXYQjlvfR5tnTcVMe5/
  toolchain: gcc-13

Steps to reproduce:
---------
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2o3tON5kNijMOtxu3bD6Cg6QFYC/reproducer
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2o3tON5kNijMOtxu3bD6Cg6QFYC/tux_plan

--
Linaro LKFT
https://lkft.linaro.org

