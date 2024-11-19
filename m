Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94026D62072
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOw9MHV7KRt1eXKNGVgXOufOASCySN7RIHtVck5/tL4=; b=Ro+Gay/6yZ+tYzvSRLNlENssY2
	BlWEP2JB1QJtnsZQv7D59DOo80uzHZ1y2wN3lHZzZIJm0bNZmbfS0QP2UbweICv5t9aw0buTy8IMt
	OpVVjZKiUAw1MpcUNU/a5EQAiveCsAq58EE/JefECUeEzSVYMqbXLYAcL770SiKK5/mLA/KjOWwcV
	dJ+Z3yvdvILPRQ7T4Qn4oiaNRr6hg/RBWDUM34jG74clx+d0GpK2wwzTCObP+PXsROK8sIBj0OACL
	hKDGJHe8uU0L7i9Z/zEQDRAB47Q6S0K56uCjfxXv/CNHvKh9VvHIxeCmElp/gig65PxjvAJ6cB/0C
	l+Y1auGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLan-0000000C57F-02vG;
	Tue, 19 Nov 2024 10:36:21 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLUU-0000000C3ov-3FWW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 10:29:52 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-211fcadd960so20562945ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 02:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732012189; x=1732616989; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOw9MHV7KRt1eXKNGVgXOufOASCySN7RIHtVck5/tL4=;
        b=AZpYrAeDuMkXCjmBUXauUT4zQYiIhWHdQAqKp7ZOAiuCQ0ArLnsgL2TMy3lrzhZqrs
         aCjDhePMDw+8sAP1NWEqlMjg6MzhspduX+cywFxU5XjPSSAnes6Esu3wfRU/izQ/qX74
         AUVJkwIoEWafMUb66Wo6rC9T6IcSuc5fD9obTAK+xwM54+8TwgJJ6N9UanQpw4n5tR4r
         pxrgtQU29INEoU0Qjj/yOZoov0a8eLG6CyiLa8FO/RvuocXylkCoWyn+OGCQg5cn/pE8
         Rbl6CG2wiuG5hC/FH6RUN6QTM5BcS1X2X/HIDT0xJ2z1QrRzoNEg1wi7a9TQsBSQo1GY
         DsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732012189; x=1732616989;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wOw9MHV7KRt1eXKNGVgXOufOASCySN7RIHtVck5/tL4=;
        b=vtPc00R+XAPWJuuHBjf2XouLx0vPIGcFoQpVMF4ov6tXnIvgX+Ovp29KbvZoZMvCOA
         CwTdDZmzYMkwwcRiN4kq14klxPRw3qwfVIOpJy3NXY2BgAlocHaVFU0D8UpQFL58Z2I6
         M/lKUt5hyqJWimqcdnnADy2/T9qtbTLmQhjYT+iir5HzFCxj2dB7J9YaYyvaridSTsLo
         kC2X1qcxzOhttcBdaybOrsA6p0qZMBZC3RhWPe3MIFRlDVJyL1ZO5x9O0Np3sasDllKV
         helOo4Oz50aJAuxVn03Eh1c3sHql8eHDianFx0X9+q/Xxf/7h0PNLUAOfKhklawQy7sS
         LNHQ==
X-Forwarded-Encrypted: i=1; AJvYcCViBPHhU6aIJZ+pXY1EpxYsJmCtdKY0obiA1z00G+ORrSNjG/vcNzD7dwl99Uo3KZzZN57CjYHCB8Nhmhco9G4S@lists.infradead.org
X-Gm-Message-State: AOJu0YyW5G0kVNx1s3YQ4eO9W2IXFUQq+IDryp+ZR91SVoYqOJj1tyJC
	XZ7NXh5DS0NiiTUV0tK4HyHFfpQc5d4TjNHDvNTBNXsSdkk2k2Ju
X-Google-Smtp-Source: AGHT+IGjPmgZGITjgIZAbFEZh1xtuft53899R6LA7gUtB/vv0OHvViNr8Z67ILi49wQx8T2CgbcBnQ==
X-Received: by 2002:a17:902:cec5:b0:20c:ce9c:bbb0 with SMTP id d9443c01a7336-211d0c94220mr253936545ad.0.1732012189520;
        Tue, 19 Nov 2024 02:29:49 -0800 (PST)
Received: from [192.168.1.9] ([106.47.210.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f47adbsm71274335ad.223.2024.11.19.02.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 02:29:48 -0800 (PST)
Message-ID: <72406e89-7dee-4063-ad8a-1d63ddc5bfe6@gmail.com>
Date: Tue, 19 Nov 2024 18:29:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Subject: Re: [PATCH 00/11] Wire up CRC-T10DIF library functions to
 arch-optimized code
To: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
References: <20241117002244.105200-1-ebiggers@kernel.org>
In-Reply-To: <20241117002244.105200-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_022951_293278_318FA952 
X-CRM114-Status: GOOD (  17.59  )
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

On 2024/11/17 8:22, Eric Biggers wrote:

This patchset is also available in git via:

     git fetch 
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git 
crc-t10dif-lib-v1

This patchset updates the kernel's CRC-T10DIF library functions to be
directly optimized for x86, arm, arm64, and powerpc without taking an
unnecessary and inefficient detour through the crypto API.  It follows
the same approach that I'm taking for CRC32 in the patchset
https://lore.kernel.org/linux-crypto/20241103223154.136127-1-ebiggers@kernel.org

This patchset also adds a CRC KUnit test suite that covers multiple CRC
variants, and deletes some older ad-hoc tests that are obsoleted by it.

This patchset has several dependencies including my CRC32 patchset and
patches queued in several trees for 6.13.  It can be retrieved from git
using the command given above.  This is targeting 6.14.

Eric Biggers (11):
   lib/crc-t10dif: stop wrapping the crypto API
   lib/crc-t10dif: add support for arch overrides
   crypto: crct10dif - expose arch-optimized lib function
   x86/crc-t10dif: expose CRC-T10DIF function through lib
   arm/crc-t10dif: expose CRC-T10DIF function through lib
   arm64/crc-t10dif: expose CRC-T10DIF function through lib
   powerpc/crc-t10dif: expose CRC-T10DIF function through lib
   lib/crc_kunit.c: add KUnit test suite for CRC library functions
   lib/crc32test: delete obsolete crc32test.c
   powerpc/crc: delete obsolete crc-vpmsum_test.c
   MAINTAINERS: add entry for CRC library

  MAINTAINERS                                   |  11 +
  arch/arm/Kconfig                              |   1 +
  arch/arm/crypto/Kconfig                       |  11 -
  arch/arm/crypto/Makefile                      |   2 -
  arch/arm/crypto/crct10dif-ce-glue.c           | 124 ---
  arch/arm/lib/Makefile                         |   3 +
  .../crc-t10dif-core.S}                        |   0
  arch/arm/lib/crc-t10dif-glue.c                |  77 ++
  arch/arm64/Kconfig                            |   1 +
  arch/arm64/configs/defconfig                  |   1 -
  arch/arm64/crypto/Kconfig                     |  10 -
  arch/arm64/crypto/Makefile                    |   3 -
  arch/arm64/crypto/crct10dif-ce-glue.c         | 132 ---
  arch/arm64/lib/Makefile                       |   3 +
  .../crc-t10dif-core.S}                        |   0
  arch/arm64/lib/crc-t10dif-glue.c              |  78 ++
  arch/m68k/configs/amiga_defconfig             |   1 -
  arch/m68k/configs/apollo_defconfig            |   1 -
  arch/m68k/configs/atari_defconfig             |   1 -
  arch/m68k/configs/bvme6000_defconfig          |   1 -
  arch/m68k/configs/hp300_defconfig             |   1 -
  arch/m68k/configs/mac_defconfig               |   1 -
  arch/m68k/configs/multi_defconfig             |   1 -
  arch/m68k/configs/mvme147_defconfig           |   1 -
  arch/m68k/configs/mvme16x_defconfig           |   1 -
  arch/m68k/configs/q40_defconfig               |   1 -
  arch/m68k/configs/sun3_defconfig              |   1 -
  arch/m68k/configs/sun3x_defconfig             |   1 -
  arch/powerpc/Kconfig                          |   1 +
  arch/powerpc/configs/powernv_defconfig        |   1 -
  arch/powerpc/configs/ppc64_defconfig          |   2 -
  arch/powerpc/crypto/Kconfig                   |  20 -
  arch/powerpc/crypto/Makefile                  |   3 -
  arch/powerpc/crypto/crc-vpmsum_test.c         | 133 ---
  arch/powerpc/lib/Makefile                     |   3 +
  .../crc-t10dif-glue.c}                        |  69 +-
  .../{crypto => lib}/crct10dif-vpmsum_asm.S    |   2 +-
  arch/s390/configs/debug_defconfig             |   1 -
  arch/x86/Kconfig                              |   1 +
  arch/x86/crypto/Kconfig                       |  10 -
  arch/x86/crypto/Makefile                      |   3 -
  arch/x86/crypto/crct10dif-pclmul_glue.c       | 143 ---
  arch/x86/lib/Makefile                         |   3 +
  arch/x86/lib/crc-t10dif-glue.c                |  51 ++
  .../{crypto => lib}/crct10dif-pcl-asm_64.S    |   0
  crypto/Kconfig                                |   1 +
  crypto/Makefile                               |   3 +-
  crypto/crct10dif_common.c                     |  82 --
  crypto/crct10dif_generic.c                    |  82 +-
  include/linux/crc-t10dif.h                    |  28 +-
  lib/Kconfig                                   |  43 +-
  lib/Kconfig.debug                             |  20 +
  lib/Makefile                                  |   2 +-
  lib/crc-t10dif.c                              | 156 +---
  lib/crc32test.c                               | 852 ------------------
  lib/crc_kunit.c                               | 428 +++++++++
  .../testing/selftests/arm64/fp/kernel-test.c  |   3 +-
  57 files changed, 867 insertions(+), 1748 deletions(-)
  delete mode 100644 arch/arm/crypto/crct10dif-ce-glue.c
  rename arch/arm/{crypto/crct10dif-ce-core.S => lib/crc-t10dif-core.S} 
(100%)
  create mode 100644 arch/arm/lib/crc-t10dif-glue.c
  delete mode 100644 arch/arm64/crypto/crct10dif-ce-glue.c
  rename arch/arm64/{crypto/crct10dif-ce-core.S => 
lib/crc-t10dif-core.S} (100%)
  create mode 100644 arch/arm64/lib/crc-t10dif-glue.c
  delete mode 100644 arch/powerpc/crypto/crc-vpmsum_test.c
  rename arch/powerpc/{crypto/crct10dif-vpmsum_glue.c => 
lib/crc-t10dif-glue.c} (50%)
  rename arch/powerpc/{crypto => lib}/crct10dif-vpmsum_asm.S (99%)
  delete mode 100644 arch/x86/crypto/crct10dif-pclmul_glue.c
  create mode 100644 arch/x86/lib/crc-t10dif-glue.c
  rename arch/x86/{crypto => lib}/crct10dif-pcl-asm_64.S (100%)
  delete mode 100644 crypto/crct10dif_common.c
  delete mode 100644 lib/crc32test.c
  create mode 100644 lib/crc_kunit.c

Good job. It's great to see the code being simplified.

I still want to submit an optimization patch about CRC-T10DIF for RISC-V.

I don't know if it would be more appropriate for me to rewrite a patch 
after your patch is officially applied.

What do you think?

