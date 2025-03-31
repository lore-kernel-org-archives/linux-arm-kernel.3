Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FA7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 04:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Eoi5ctOlZBCBuG5n3/dJiXOfEGeAUQNLilO/2EXgbE=; b=rZ4nw1MrYp9GnbFb2ZqOhETOYA
	keU88W73oUsLA1YJeQyt561U0NVgyNWbg/V9PhdUzowhRV7QrjKnAtOd2Vevr0ChE6F0tpA8jgGPB
	BUjyfWuYCVczzEPhPSG5ZYUD5Z7lbFPyl8U105e4XMpab/Vs0Tp4JeJwtMf3B4Vn24dJpO49ZQKjX
	n9+rC5nMDTQyVP+DrRhYajqCxAZJpN3M1mlxReWe7MY/KmqCoLeyfNonGBRtC1zNNIEFe7aOVX/Sx
	yY77ZosrPNnpNa10mdc3mVk1zeA6v71X+Whja7gdgfHQJ6mzhQMHPdajNX1MTbjbJKrTRJXYoowmD
	8FIcy3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz6P3-0000000GzQN-1C6Y;
	Mon, 31 Mar 2025 04:05:37 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz6NL-0000000GzJ8-1yIN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 04:03:52 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-523dc190f95so1951940e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Mar 2025 21:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743393829; x=1743998629; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Eoi5ctOlZBCBuG5n3/dJiXOfEGeAUQNLilO/2EXgbE=;
        b=iMQmDxI8bwwRVlAqh27T8xCjTirsQ6iGSZX12R9SktVxS1BN7cDfuGNI7y1dMgrRws
         zBGxU7P8BJUSJXatGEWhWKFFzlskWqXgeU+P75FiCjIWt3LTiMzFLDkEGW5e+IHB4RSw
         /3dSqys7AG8ff047y+xP2ajJWXfhcFoOsa0ig1h+7xCoatHXHkANMxslcK5bpPIXADuo
         2X36zRX2N3pHHCbc6BY5YC4ivLfhb1nXrL7+jp3axWdPEyVF796fkYDUl5bLryUgKeq3
         xYk0xHR4obmM/KlyxFlW25gRI8tyjFcthZ/bMwnS2IGdW5utSS2oaixGFKb2rqZn0NAn
         HLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743393829; x=1743998629;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Eoi5ctOlZBCBuG5n3/dJiXOfEGeAUQNLilO/2EXgbE=;
        b=ukY7OicmNyc0Zm8rJk//o4miHLkDFVXacQvrgTVPlO6o4+SYidcsLZ67vz8hFNbtxC
         OOtEVSfT5TrJz6Ocifr/kL2w3VGIoVdeuYqb/CNP92G8EWzPHpgynwtmpKooOkGG3FQ/
         rxmzjPLHJrcOR7jHA8EQmpV78hCKA1UZbNK37cmzNqzO+H+KmAQlwq89jPOuqO5RsBi2
         Cn8jmEIkG+Q8AkJ/r59S/MHIhkQ4MrfOOy6/BQh26bHwOt0L+nBTItFatPY4kWeq4jRu
         WkX8qQrPJrWIb3W1dOs+7zZ0XOu5i9emwRdQeRNm7k+n1FxUKGeg9tVwpu/S+/R+ub8O
         QCOg==
X-Gm-Message-State: AOJu0Yw6knotfcb/mPvGnZAUFJIeAl7j4SetahwlYG9rQ1Ux/9ZrTwfM
	E0ul8nMIO6t0QzbfPnHcM+Ziyo7n/oZhkGH+L20HtqJ2rFcSNinBvmpIVozvCYQ6WRQCYiKbOXY
	dZXEXvB5SUTp5b4WVHEVmjnf9lRDM5//7JLs3GUZ+2IHDyWIi/ec=
X-Gm-Gg: ASbGncv1nK2/czFjxLI7yHSWnR4Wtv9sTwzLTijYsh3IPblfIbCCOJQH/2XwUbGZjyf
	0nOsnRDm8QcrbE1TgSnYEqLnESaX/HYU3MFR0kecdGrSIo/tlnFTe8CIjybT7uaqo0We6rT4tcV
	llbm/vcs+qdM+Epi+03jLlCDOXPqFNoHWLVFtj0qmF3u7t3V8vSqsIYK0/zQ==
X-Google-Smtp-Source: AGHT+IE+omrjH7GYgvhNd+blM0ysANeUmxf3FkJnco8pyeAxxM7AfoCsUeEAKslkGCMtq8noDXdfL+o2qkrwgip+9BE=
X-Received: by 2002:a05:6102:3e8a:b0:4c1:90ee:ab2 with SMTP id
 ada2fe7eead31-4c6d38cb31emr4067233137.14.1743393829232; Sun, 30 Mar 2025
 21:03:49 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 31 Mar 2025 09:33:37 +0530
X-Gm-Features: AQ5f1Jry1FfmI-B89oqlgm9LhT3dGEDfFcdu18qH63QTqu9-bEzvTnC6C9KspFU
Message-ID: <CA+G9fYt0F_vR-zOV4P8m4HTv6AecT-eEnrL+t5wgAaKPodi0mQ@mail.gmail.com>
Subject: arm64: juno-r2: SSD detect failed on mainline and next
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux.dev, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Robin Murphy <robin.murphy@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_210351_541433_229A2DEC 
X-CRM114-Status: UNSURE (   6.39  )
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

Regressions on arm64 Juno-r2 devices detect SSD tests failed on the
Linux next and Linux mainline.

First seen on the v6.14-7245-g5c2a430e8599
 Good: v6.14
 Bad: v6.14-7422-gacb4f33713b9

* Juno-r2,
 - detect-ssd
 - mkfs.ext4-ssd

Regression Analysis:
 - New regression? yes
 - Reproducibility? Yes

Test regression: arm64 Juno-r2 SSD detect failed
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Anders bisected this to,
# first bad commit:
  [bcb81ac6ae3c2ef95b44e7b54c3c9522364a245c]
  iommu: Get DT/ACPI parsing into the proper probe path

## Test log
  mkfs.ext4 /dev/disk/by-id/ata-SanDisk_SSD_PLUS_240GB_223004A01292
  mke2fs 1.47.2 (1-Jan-2025)
  The file /dev/disk/by-id/ata-SanDisk_SSD_PLUS_240GB_223004A01292
does not exist and no size was specified.

## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: acb4f33713b9f6cadb6143f211714c343465411c
* Git describe: v6.14-7422-gacb4f33713b9
* Project details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-7422-gacb4f33713b9/

## Test
* Test log: https://lkft.validation.linaro.org/scheduler/job/8188382#L1538
* Test history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14/testrun/27742015/suite/ltp-cve/test/cve-2017-2671/history/
* Test details:
https://lkft.validation.linaro.org/scheduler/job/8188382/definition
* Test link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2uwduIsT14Pz3XEoUQQIS6ndlQK/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2uwduIsT14Pz3XEoUQQIS6ndlQK/config


--
Linaro LKFT
https://lkft.linaro.org

