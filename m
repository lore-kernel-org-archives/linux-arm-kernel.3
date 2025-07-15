Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF20C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4NcnVHT6qn7BJ6Ec3gjN6DJVTr3Q8w/Kv+WVRHHdtL8=; b=FgFbAn8PoUWJ0Mu5sV3qf5EMHi
	qOuF/oMFwJPJnZJfcH/yHQIfi12GqXTVVJzTPfnyJp6Xxq2SCA6qF14Os7tKaK9DRFVBDVcb32bRF
	agiLTj/kklx2lW7JHTMLykf5n+zSwnfbpIMznF0+tm+dUJrw0q8gJF+lFbyUQa+ZRllJodDENcvSS
	kMUWhg9eFmqAJACHhI01HIFtDzSAoagA+ysQghVJJjeIQmc53HVLdpHuElKZg0jrtYiJovjhAxwI4
	HfTPlI1wp5KTukvGv+zJjpxlmy5jHHtqTO39z/Uzpzb5QY35y/rc/U6snbixYocB38QY/kgcCvrou
	KF6nQ4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdrk-00000004wl1-0TKw;
	Tue, 15 Jul 2025 11:30:32 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdkj-00000004vgZ-3PQU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 11:23:19 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so4337820a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 04:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752578597; x=1753183397; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4NcnVHT6qn7BJ6Ec3gjN6DJVTr3Q8w/Kv+WVRHHdtL8=;
        b=uC/7hy0fzF2wfEkxf0uQ8CejYuZWgCJ/is149R7hrpEJLDc+MP35ORYpU/lphhfF7E
         8fiItOCCyBi5bCUBjfdbC3xAQLlCzWNcISKO3eJk1uulKscq3f0Wx8ITN05US/1dLqGz
         dBwENae37PqMFTzZ9d6Sifso3WFfnZ1n75YBnk1kjEybE2LCS5HExsNHLgNjCFW82fuI
         f1Wud6Y2vxSIAaWv+eSfm6Q0NcOg+RuSc1wOL5F+qEdyzEkZqGnuiju4HntVQaBCmTlN
         GXC3VZCGgX8fXxfMTOuh4UNVl89MgUanfLwtsUjGARzcQGx4fck3Pzz/mQqRAUyZHoAb
         WQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752578597; x=1753183397;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NcnVHT6qn7BJ6Ec3gjN6DJVTr3Q8w/Kv+WVRHHdtL8=;
        b=tKqciWLBq+kfkXBwa7XFOd/bP67XFATW/HGvoc0iJqYLOneAOAYDXCoFLA2sMLj8Eg
         qGUOS/gGqyybSX5ND13WtEyw3Yi5yRxU7wm23mkgcyLj2mEKdiXCfh58i9C60zYLHQ49
         5qVCAGzmKG8M2u+kOY1Z3tO7dAV4wOVs2qnQ9+qg9KW6kZOqo3us2feYqUDB+Kk4R83O
         dPtyi4jVtm/91Xw7N/qWHpWxI6MkHBcL+dPY/v/uYTW+yq97TcbpucAdJSLoVWt+GwSV
         8xZyi9tWUFrAh58ecO9qM4AVnK4lyj+lHKbVbjuDtraJbB/uBmCj7+qcyLXVz7JPXn4Y
         Uq7w==
X-Forwarded-Encrypted: i=1; AJvYcCUaLblqPDo2v9S9Evem/y7AZv53vjw+hC5J1zljhqvtak78o7j0XVhYu4atrPYMn+04/Y70A7vPOyy4XzOL2nLO@lists.infradead.org
X-Gm-Message-State: AOJu0YzrNKIWldGKzjeON9xCdB5wDCisNsw2E5uXL6GthVTHDPEEYnVV
	0NPRtLILAFYpvIUUoGHa8EvaohyYZjaffSfT9Cacaun2EtPb3ZHcABQ2nRNBTW60XMPKF4uyaDO
	7YLYgGq4T0HV9JwVRsxX6bHZMLzeHR/z4MIfwqHshKw==
X-Gm-Gg: ASbGnctU7NvKDGSJZ0vxBjfz36GVzmPVwazw7b8t30TPLzksFYhsDZV21ROwzF/AwEV
	TqMXsWhixFZUOMPFxHlaZpxRBoOHfzuLCw81RPdXSrQ+pHF6J9sXRfeAZ5NvXwHrbp3Bok4dxVL
	7zkXyB769HSArmx0X9RQ625x55wwXOaLHOxwV6OZgr0IUa7W2pPJvnV1Da4rZJtDXLRsIM/f+E3
	04VDYeyO2Q5Btrxct5b9MlKYKNgKwD3mUIk1qJbzHiVBy1iRs8=
X-Google-Smtp-Source: AGHT+IELZ4SimOBJO6yrghuVWIOvvAedlzL4IeD6zPpIQjSz8JGeh7uFbZ7kG0dhBVgjaSWgYEdK7o4EE+MZnbE6CoQ=
X-Received: by 2002:a17:90b:4c0d:b0:315:af43:12ee with SMTP id
 98e67ed59e1d1-31c50e1763cmr20865064a91.16.1752578596648; Tue, 15 Jul 2025
 04:23:16 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 15 Jul 2025 16:53:04 +0530
X-Gm-Features: Ac12FXw5_VIt4EBOG5y1_FGQ9hbqKjaE3fl3SBQ4AiBXr0z1r7gqAHncSjssGvY
Message-ID: <CA+G9fYusqGejrepNPCR-7ZZDPeQQfZgf2z=_aUz_03QHm7Ccaw@mail.gmail.com>
Subject: selftests: arm64: mte: check_prctl.c:72:17: error: use of undeclared
 identifier 'AT_HWCAP3'
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Benjamin Copeland <ben.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_042317_850752_39E13EDD 
X-CRM114-Status: UNSURE (   6.99  )
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

The selftests arm64 mte build failed on the Linux next-20250703 onwards
with clang-20 toolchain. still seen on today's tag next-20250714.

First seen on the tag next-20250703
Good: next-20250702
Bad:  next-20250703 (next-20250714)

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Boot regression: next-20250703 check_prctl.c error use of undeclared
identifier 'AT_HWCAP3'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
make[5]: Entering directory '/builds/linux/tools/testing/selftests/arm64/mte'
  CC       check_buffer_fill
  CC       check_child_memory
  CC       check_gcr_el1_cswitch
  CC       check_hugetlb_options
  CC       check_ksm_options
  CC       check_mmap_options
  CC       check_prctl
check_prctl.c:72:17: error: use of undeclared identifier 'AT_HWCAP3'
   72 |         if ((getauxval(AT_HWCAP3) & hwcap3) != hwcap3) {
      |                        ^
1 error generated.
make[5]: *** [../../lib.mk:222: selftest/arm64/mte/check_prctl] Error 1
make[5]: Leaving directory 'tools/testing/selftests/arm64/mte'

## Git Changes
git log --oneline   next-20250702..next-20250703
tools/testing/selftests/arm64/mte/
1f488fb91378e kselftest/arm64/mte: Add MTE_STORE_ONLY testcases
391ca7c81b85c kselftest/arm64/mte: Preparation for mte store only test
d09674f98cdbf kselftest/arm64/mte: Add mtefar tests on check_mmap_options
64a64e5d12f07 kselftest/arm64/mte: Refactor check_mmap_option test
49cee364c8665 kselftest/arm64/mte: Add verification for address tag in
signal handler
ed434c6e08132 kselftest/arm64/mte: Add address tag related macro and function
2e3e356560ef5 kselftest/arm64/mte: Check MTE_FAR feature is supported
cfafa517c9e65 kselftest/arm64/mte: Register mte signal handler with
SA_EXPOSE_TAGBITS

## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Project: https://regressions.linaro.org/lkft/linux-next-master/next-20250714/
* Architectures: arm64
* Toolchains: clang-20
* Kconfigs: defconfig

## Build
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250714/kselftest-arm64/arm64_check_ksm_options/
* Test run: https://regressions.linaro.org/lkft/linux-next-master/next-20250714/testruns/1615508/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2zrW3Ut4mYWOxPVnJTOY5qrft0P
* Build link: https://storage.tuxsuite.com/public/ampere/ci/builds/2zrZgjFum1wBbTRrsvDGnHC9JMt/
* Kernel config:
https://storage.tuxsuite.com/public/ampere/ci/builds/2zrZgjFum1wBbTRrsvDGnHC9JMt/config

--
Linaro LKFT
https://lkft.linaro.org

