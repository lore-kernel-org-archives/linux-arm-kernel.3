Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C748DCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vt2kS9Ofun09w/F1kEUInf1+goE6RJwp8Jq2yr6GTno=; b=ppLWrbMXR9+djdtbJOAV8ksuGl
	Ui3VUU2snT4I+Tl8rJX3v+kgggopdbPODEm5jIxDnxg4FLyCPy1/Ln2i4i3Y+oPmtXY3xbdU7sOJV
	gzMHAkJxd7V90bnui7drL4QaRmfOEZpm4Fcpw5zmuWJ09vkYTe/GOAPABwdxb8ByURQvVjMGGjV6X
	3hUpCr65+56dXw8ZrKbqR9cNYBTVgoOhoCPh17llQuRb087jNva1zdoTh3NjYGN9vup1gqrN4RrJs
	3wX4ew5ehzX32DFhzDZrinYJNRTGs1jCRVSTKUFJbM91iMsID9m6Sm+ATTxpjNDL3Qi0HqVm9FN6R
	YnoSOrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZ95-0000000339p-1WMi;
	Fri, 05 Sep 2025 16:18:39 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVYq-00000001hFo-1sNs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 12:29:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-244582738b5so17200325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757075339; x=1757680139; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vt2kS9Ofun09w/F1kEUInf1+goE6RJwp8Jq2yr6GTno=;
        b=wGIfBgOPivPgwyXDQvOm35e+6ybDmaJKahv9FvhLxyqptz/qV6C97DqSmZpCOGVx2I
         dwRgjlrlG0f4IG6FrfpdP27+4y5N1WPfSqH+gofqLD3wb/+q6Bd9P78wgZP8fyNm9qN2
         XTE8TH48LpFHDfcTs2WPmoYS5ihR5m1+mSTlvWKEh3ZhAnrYy7B+J2UFJvtsTHN+kDah
         oEAf2X2QLUqQMZbSYxybKOKhppR+DS7hmLiWLRoTOkBv/6Clgu63PZEZi7Zdmmk/zLhm
         XHD8DCyMF0VJzYR/MoHHZDEu53PJiGLOV1TUzGNbRNFb3hU3iayKA6YuZmTh5AvebCL4
         O+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757075339; x=1757680139;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vt2kS9Ofun09w/F1kEUInf1+goE6RJwp8Jq2yr6GTno=;
        b=GqZZ9hHm9EBExZgqcVRm6nQgQUUKqaW/pqRR8N5CmbMgn1yyRnzxl5mLt5QD9QF0xY
         lSlYk4Y/SRT+JGwktaHmJQ/jFpoRe9lWBfKEtyj0S2IhZAYKebJK7VrLve3WeY6CGqe7
         zvWa1GA1svsvNNlsBi00WPt228J1bTiwOOBfvzL62hsOhnjlGY5QmEvLJyMYqX/7bpKZ
         haQ2JE53ZFx8a2Br/NUlXyjGCXTtWC+gLWn8Gy1aglUTr3eMmb6iow+Pbj6xElNgmNNW
         Rw1fliz8griKreCjDDbwx7BoYPVUPWiBpOFK/2YpKGYA3IfcnG8JQJgFcPzIMlzC0KYj
         DFyg==
X-Forwarded-Encrypted: i=1; AJvYcCWnSq9a6bGHrTIPvkUc8IMAqlV0nMIOe6emx7NdDlUHyI2rGfjrdBQClm8ZeK0Wfu1tJnnvd9I4wbb1YZ+5Gblq@lists.infradead.org
X-Gm-Message-State: AOJu0YxUom8WyaZ4rnAnCfusDHPfhSmflXtaFyrQZGOr1990FyGPB2/U
	aiHXoVB6YGP5p3J5BnL2/2cH2PjBH4ir0hAdJPZiUXVUaFD9nsDsQH+lJ4SKnoXwdjtNKCJ96/n
	ea0aIHmhyQNCq8bdVS1wgYG+O2dwFJoiBqKxCvIwhXw==
X-Gm-Gg: ASbGnct3M1WaCa1tU03QuZoBrJ2oKRhs8Le0KBXF4Bm8jj7/00cCtVgfhgiKQGRzilW
	Y80AH6N8NEmC1RGSe057PyEZOXSFHKa9DZhyP5O1ijiXohoftGT1meovQVPB+QlSw2GkTUZ6ilo
	2tAIpux2/XOsrdaza5eGFt+WbITGllHSaMls8G9TQ56+d8cvkFycwdiOFPXUt0KdhM4+7lQAXI+
	S0SnkwqxD0uPZsSCEgzVkHMeLsK9PHt/7jKOpSz
X-Google-Smtp-Source: AGHT+IF2VyihlpYLlMLSpcAIk2s/i+EE+s5Gnsq5S4v8IDPjr3MF6OBdBjnQtI+Tuw5M38cyKFUCV97IWUQkg/iXocw=
X-Received: by 2002:a17:903:2385:b0:246:80ef:87fc with SMTP id
 d9443c01a7336-24944af38c7mr260768135ad.45.1757075339192; Fri, 05 Sep 2025
 05:28:59 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 5 Sep 2025 17:58:45 +0530
X-Gm-Features: Ac12FXw7Gdb40oCU__VJhJHzl8UybprNIkBlFrRCtJMXzI7n6pFfMa6roDMYZnY
Message-ID: <CA+G9fYsT3b3Qd-m6tSDOgAXpgLPWz0QD_Z6a+_ff4oTecA85PQ@mail.gmail.com>
Subject: kvm-unit-tests hang on Arm FVP with protected mode
To: kvmarm@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Fuad Tabba <tabba@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_052900_497875_02823034 
X-CRM114-Status: UNSURE (   5.91  )
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

kvm-unit-tests consistently hang on Arm FVP when booted with
kvm-arm.mode=protected across both 4K and 64K page-size kernel builds.

Running the same tests with kvm-arm.mode=vhe completes successfully.

Anders, bisected and identified the first bad commit as:

  066daa8d3bc2694c392e14091978043aed7b1f23
  KVM: arm64: Initialize HCRX_EL2 traps in pKVM

Regression Analysis:
- Reproducibility? yes

Test regression: kvm-unit-tests hang on Arm FVP with kvm-arm.mode=protected

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Environment:
Platform: Arm FVP base-revc
Kernel: arm64 (tested with 4K and 64K page sizes)
Mode: kvm-arm.mode=protected (hangs) vs kvm-arm.mode=vhe (passes)
Test suite: kvm-unit-tests (./run_tests.sh -a -t -v)
Cmdline args : kvm-arm.mode=protected
Kernel: Mainline master and Linux next master

Test run log:
INFO: running kvm unit tests ...
+ [ True = false ]
+ ./run_tests.sh -a -t -v
+ tee -a /lava-1/0/tests/0_kvm-unit-tests/automated/linux/kvm-unit-tests/output/result_log.txt
TAP version 13

Links:
https://regressions.linaro.org/lkft/linux-mainline-master/v6.17-rc4/lava/kvm-unit-tests/history/?page=1
https://qa-reports.linaro.org/api/testruns/29720932/log_file/

--
Linaro LKFT
https://lkft.linaro.org

