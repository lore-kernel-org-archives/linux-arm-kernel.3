Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13BAC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EAQMc4ueVeym6ao2O+BFRKNQiM2evdanfHeGpELVuW8=; b=VMdUL6U+S6NtH8S7X0UQ7t69vQ
	n0jcRnFHQOiL+S1OAJuw3gcHPZkodP2B6xXRfYjH1VEa3qJZIXrJr/ayxVaF/y2+/IuXDsUB77sWb
	W3pHBKIWsmXzS+fOFwp2M/ZwB3ILPo+wbPKidwQOYeWId4GXjT4qvYwDVeLnfFXYiDOyfmEHmnMRN
	qVKXPpfqf8Zyx35yrqKGlHBtCQNdqrWa7WjNgjHtfHZEEH8DxMicr7Qs3PFddzlh+34kgDKYSPHi5
	hlgEb9KCeCe7ywyAvY8g9nu7YHrOgrY7K0zIW3I/57yEcXyS5HFNzM5umB5QEMbj9EaV+Q8uwQVEl
	FyHlxqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuaR-00000009Ec6-2VO4;
	Wed, 19 Mar 2025 14:40:03 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuYU-00000009EKI-0vJz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:38:03 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-523d8c024dfso2920244e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742395080; x=1742999880; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EAQMc4ueVeym6ao2O+BFRKNQiM2evdanfHeGpELVuW8=;
        b=fmJg6KcZR4rNfgD3nO71qVpaBh/qxya1CPtskkhEd7zKvJAD7/8vOtbYPwWVJuWNV0
         rI3l16Kof3N4CRrebGmGbHHum3Tz2Lc6kyLo8nTsPK+fIBgITivG8XJT//2nq6ZwClp9
         C2dtebCNktnJGQ/vZOhMoapslfBM50DOxXKunlNegSOFmzvb+5wdZnWvADWcEeQAVPOl
         DI5imqrzhmgNZZvepNOIZZRJ/lpu3Sk0Ax1dbT5XiZZwJ6jRA2l8Ic39Qz3gEkACQXCW
         4mNnqWXVrQvNrpqlzpirhtf1oj6X5Q+HfYUTXB2X8eguMFaqfuzxw+1G3TUzAo/2OzPX
         1mag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395080; x=1742999880;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAQMc4ueVeym6ao2O+BFRKNQiM2evdanfHeGpELVuW8=;
        b=Cp8WRB3aMDZAdx9gRTxoKbUPMUe0QfXqQ7tPUr590OZoYmf+/GFEKw4eaUtSdDy0Rj
         TJC+y/ROe2xH5U1gbUjQ78omizaTMIX8h/cw2tSp0Fqmk/UIvpynH2YIjbOZa67uCSEK
         3CPP8M34MhBmr0pzq6UGQIqEn5kIMb6DweX/mJA6Ha1+W/Uw9Wdu94shVbETtGTLmwfU
         r17lKjT2VKygs56K8vW1e9ZlIarK/5D5zupZ0+Y4PND8d2rRC8LSPVs9ueF6qYQigHXX
         tv6zJHhJr/sAq2xW/kP7HnoEirE/U6VhrsmasXaad3jSCnafyOEBx4809JjhsHVtPpHL
         kbKg==
X-Forwarded-Encrypted: i=1; AJvYcCWg8V5B/nUTovL8AKgGmSdq5THo/8sp6xAK0GSRjphS8SkYfEachQ0o2fqok7RFrTKHU5aNVHKeuk/PGaz7Z0I4@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf8YfIwtPYeRa1zaGCt5AcmPegNNbTUyM5YLSpzXGitdRBxWne
	CzgFQF5Hh3Z01xg/JM1pzLcJXcxYfCu1TId4aJL0alD9Out64bRfDa11mfUm/nCQit8CgqFRSRj
	2wBgQAnuDwIbcuX/mCQ2JV/8sirOu0HVZGdrq+Q==
X-Gm-Gg: ASbGncvl/i/P6dX+9ANYq/Sy+lw/qO4pjoa96yYo3OF1d6NRY52ub2ubjV7sGJs0fV8
	G18t63tou+xR2f1UbK27ioBIlG37JVImX5fUwTXOYKjECaEP2t5xPGhV2Xud27vdoekwaEX6lU/
	P/QFXJvhWe+Beye34c7Iz/NDneJs9poH/9wviSVRQ9ollmNV9KdZjrBak=
X-Google-Smtp-Source: AGHT+IGxLhVT/ftDT8iYJ5Mr8vDPr54sfBtr7wxTMeJWhsyv6YLFWJHjY8iY8qPGLL2vFTHUSH2SqM4ZK2rC2ioWlfU=
X-Received: by 2002:a05:6122:1d12:b0:520:997d:d0b4 with SMTP id
 71dfb90a1353d-5258918cba1mr2246266e0c.4.1742395080564; Wed, 19 Mar 2025
 07:38:00 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 19 Mar 2025 20:07:47 +0530
X-Gm-Features: AQ5f1Jo_Jk6yP8Zz1gP_WLfB-CYzXNkDEG6hUQTy-hEqsCfLQJSmsIGoXWLSd3U
Message-ID: <CA+G9fYvPu+MQKhYyPZSSDpAn-zhRGmeHQ8hJksT_cdDdxfbB-g@mail.gmail.com>
Subject: Fast model boot failure with Linux next-20250312
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, kvmarm@lists.linux.dev
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Rob Herring <robh@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Aishwarya TCV <aishwarya.tcv@arm.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_073802_263865_A0AC5F46 
X-CRM114-Status: UNSURE (   6.61  )
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

Regressions on the arm64 Fast Model (FVP-AEMvA) caused boot failures starting
with Linux next-20250312 and persisting through next-20250319.

First seen on the next-20250312
 Good: next-20250311
 Bad:  next-20250312 .. next-20250319

Regressions found on FVP:
 - boot

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

Boot regression: Fast model boot failure with Linux next-20250312
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Anders bisected this to this commit id,

# first bad commit:
  [858c7bfcb35e1100b58bb63c9f562d86e09418d9]
  arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9

NOTE:
  LKFT is currently running FVP Fast Models version 11.24.
  Planned upgrade to the Fast Models version 11.28 in this sprint.

## Boot log
  <No crash log on the console>

## Source
* Kernel version: 6.14.0-rc7
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
* Git describe: next-20250319
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319
* DUT: arm64 Fast Model (FVP-AEMvA)
* Toolchains: gcc-13 and clang-20

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319/testrun/27675691/suite/boot/test/gcc-13-lkftconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319/testrun/27675685/suite/boot/test/gcc-13-lkftconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319/testrun/27675691/suite/boot/test/gcc-13-lkftconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2uX2EtC2pQdmVZ7ccoyhoi01Yy0/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2uX2EtC2pQdmVZ7ccoyhoi01Yy0/config

--
Linaro LKFT
https://lkft.linaro.org

