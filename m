Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055B2CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nwq+o+exdFpdWZlTYa9XUsNAa5XkM2eHcSo77b0KisA=; b=3/76GzotozC4Kdj/BSWdErMImf
	+So6KL6oAAaR5AnhIAoz80YdVsoDGr6huRlNtaSuhHu3Qe3m0vlfDfGw9eChxe5b4rzpfJeZkkmG3
	PZq1FN3QTORxA9zYA6bSWmM2CJZn7UTmhTtcnTFTLnQy1O6vYFNV1ilnUVVIzTb7fkeHyB8defAhT
	f+ibzdQIpM4WLk4T2mmhebo+8ygR0ZgtlWKaCmkbrdtEbhpg/D6nWAURTBnUbX2lolVWsTq3iIOEw
	kpnN37ERa5BRSn5PLC52RAo6EfGiBZarf1UEChQH8h1vW2Ph3xhZtWHr/DK0s83RjqHevIdG0NrD1
	Cveye3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOFi-0000000Cz4w-3hhG;
	Tue, 02 Jun 2026 12:29:50 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOFf-0000000Cz4Y-3eGP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 12:29:49 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-66077e90382so2247465d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 05:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780403386; cv=none;
        d=google.com; s=arc-20240605;
        b=Plgr0RgX0VpnMcHzusS0ACTyS17CTiNOR6S5FLsqIkM778yuxIXBSfRidNajoQcUAr
         MujqEI4vkrv1GtDa4edaYCvuLXirSb4UDFdJW5WM56uTiS+qlNhvK6MuIBuD9Y24S/Ui
         koXPshs/e1CSivmgcF5lIGGUeJn+aX0DuuDpIcGSIdpjkQ48kCS4MWLOoeYDML0WXtdS
         j3jgUbOUFzlXHGpQejQVGHC2aLm6Mc/WlwzdR2c3HotafOIudMhICL76Zc3QafcN9Hf0
         IJ3Xk0IccKkmgNYQCQaJF+ew4ruXU71BgOMJP6VkrUVFyvBR9y4yASvTy1iTmAAgxA6M
         boTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nwq+o+exdFpdWZlTYa9XUsNAa5XkM2eHcSo77b0KisA=;
        fh=NqZQKTL4QDycF8xSuc4fP8w9Hbtg09AhWtvJ9Khg7gs=;
        b=B5tlM4LXS/Qbl/xYTkbf01NJ4G9ArphbnbsExqi4o5THW/oWnmuw8Ej+tWPhj4q2EQ
         JcCOpGeIJbajJV4qzZaBPXn01Ku3J3SOyqVL1di/GdnqT700/KStJND/16ZZlEjhBJVP
         snVlxveVf+eCsothwW/zezoJSxEljxUrmgniYXYvZJb+aEoRhoiZ3AYxzuNbrKy/gAY2
         ELrxfXy3oUOAfWumPQPTz+KW13a2SpDlZsbG2A5Eg2UD/WbSAQgEUp9X36Rbkc6/P/pE
         Inh5Gkmm2XmzUAQeikc/N7AZCZ95FNXxet1Ln+r4dkasqY8D1IM1SuBWSutKImSfQo+2
         KaQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1780403386; x=1781008186; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nwq+o+exdFpdWZlTYa9XUsNAa5XkM2eHcSo77b0KisA=;
        b=vsEP+GD1841CIMVmwwHbkdx5GnF44xfoccem7GtGndXFcRbN9mmRVvxWTU7W+d6mgm
         6SGAzsH/z2rYEwfWhXpQ0QRPFZTJE68ZaerST72huzazgGw8t3G3pbPHdQSWCJ9Z8D0T
         4y8E6+nn9GyQsMkja+SUHlEPhSxwhZBSGOWC21xXtD+9dW9Z41DCGr9Z8/XHpKmxC2HA
         1UXiqi/XheaZ+zPgAsmxnHWjaYBgeArOKmZxuswADHi3IKpb2rg8BbOOn89FbvhGssNS
         YhRRCLutvOfAmOVmrJZy87AHPzBN4m38sE2Wt/b1djFntSm6PEvklA5VTwuJC1RSlz1S
         CYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780403386; x=1781008186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nwq+o+exdFpdWZlTYa9XUsNAa5XkM2eHcSo77b0KisA=;
        b=aXKwCDqYcYGBwQJLa1bQXEqRggDylisNzTsFd5ppC2h4MoCinLHkBNRR/AnAbzsMbr
         y/0GB6xjvzFQUMIV1WNZ8QiDqdtJJT5AsfIgjQc9ppnWREpEOEsVhX2h8y5JYdf/kTN+
         4hTEjiRr0v4X8BDboz8mF2DmqsMgMiqUK0k8YsmAaYw6UQXe8+tiW2KTj4HkxYyvPz9g
         bqWyEECGOzRVqKdytbF+FGWvNhB52Yg752LC8fRePLT5riOsI68Mf1HGHRRszEHegAqC
         /wefMB4w1W/3H2gbfcgwyXz1XqtvsegphoEm9N+vxcoZOR2tKP6EzaLHYMRhJkmtwSWF
         SLag==
X-Forwarded-Encrypted: i=1; AFNElJ9KPWqaIsJfmSLLeZRqeQJ0NOMxODRVPppluJYVfngKEVV2KTo6LCrfYnMxQ3Tn4A0ikMV20zjNZlO3F65S8IT3@lists.infradead.org
X-Gm-Message-State: AOJu0YwrX2lDHCVeGR0TvFgkXSZt9jnEbwIthITyLSAxJFisejqay9Ea
	ZQI06YnC1SPmhzepReZjisI35grsrswC2STyMBwaDEVSOcGGkXvj5PrSDaEPHUtnZxu9wnm1Hqq
	D668V0XZHxRC0uc+KRVmLLirI530jndrdcdyDmJMtS7tcFzxXweYcf25J
X-Gm-Gg: Acq92OH0s5gyGGrMrbpMZcn3elbczUOCoCAxIvA44Y2SAQccWoxBcnHhsbicP/ImbH3
	6EWOFF/WykEKWtsN0HNjH5oU/l2ApC8wohBP66wBrPRdepcHefvf2xu5f9w1GukKTcj0BhWqgU4
	0plx3v3TtaIBT/9np/RHoUccx1Uo3jf0uDMyY2puNJ3ptDd6oZq1Y6dagQv4nYwfQUVyZcUQ81+
	bRMDch2GI9oNU8KW4RomKW9O9Mb89qnOHv1820jLLZsHqDqizifZFJLbKDrWZgkOcGg1S6y7GNG
	JcFFsUjZLUF2UdXEEKU+tDKLfwiIICRnfHpJLJmMjziAOkevs18=
X-Received: by 2002:a05:690e:1408:b0:660:933d:3078 with SMTP id
 956f58d0204a3-660933d3864mr6493329d50.38.1780403385704; Tue, 02 Jun 2026
 05:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHTX3dKWE6DOPLXPq31wRiXfjac0TVqSOAOLP8itHoGYpF9eBA@mail.gmail.com>
 <b56b09af-cd0a-4061-8cce-5e8a50033b4f@app.fastmail.com>
In-Reply-To: <b56b09af-cd0a-4061-8cce-5e8a50033b4f@app.fastmail.com>
From: Michal Simek <monstr@monstr.eu>
Date: Tue, 2 Jun 2026 14:29:37 +0200
X-Gm-Features: AVHnY4Lx1zOYFp-SLJbisxM1GPLQhmdA3CQJyn0wMc6eTpBydTm2Su5WjSb78Oc
Message-ID: <CAHTX3dL2W9iZDWLk=OVmno0ZUHx_EkXrJqskmpXCM_CQROWgEg@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.2
To: Arnd Bergmann <arnd@arndb.de>
Cc: SoC Team <soc@kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_052948_200519_3F81E3ED 
X-CRM114-Status: GOOD (  22.00  )
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

Hi Arnd,

po 1. 6. 2026 v 22:39 odes=C3=ADlatel Arnd Bergmann <arnd@arndb.de> napsal:
>
> On Fri, May 29, 2026, at 12:15, Michal Simek wrote:
> > ----------------------------------------------------------------
> > arm64: Xilinx SOC changes for 7.2
> >
> > firmware:
> > - Add CSU register discovery with sysfs interface
>
> I looked at the contents here, and I'm not too fond of adding
> low-level register access interfaces to firmware drivers,
> that is usually a bad idea because it ties the interface
> to a particular platform.
>
> I have no idea what 'CSU registers' are and the ABI
> description does not really explain that either.

It is described in the commit message.
Configuration Security Unit (CSU) registers

And currently supported regs are described there too.
    Currently supported registers include:
      - multiboot (CSU_MULTI_BOOT)
      - idcode (CSU_IDCODE, read-only)
      - pcap-status (CSU_PCAP_STATUS, read-only)

multiboot - chip can boot from different offsets. (spi in 64kB offsets,
fat different boot image name).
idcode - full chip ID
pcap-status - to find out the state of programmable logic.

> What type of userspace would access those, and why can't
> this be done in a portable way?

multiboot is useful for A/B updates when used. It is also pointing to
where the boot image exactly is.

idcode/pcap for fpga programming case. That your bitstream matches the devi=
ce
you use.
Scripts or user programs can use them.

IDcode could be the part of SMCCC_ARCH_SOC_ID but we can't change what
we have done in the past
but we plan to implement plat_get_soc_name() which will also contain
IDcode. That's the one
where a standard interface could be used.

If you have any suggestions on how to do it in a portable way please
let me know.

> > zynqmp_power:
> > - Fix race condition in event registration
> > - Fix shutdown and free rx mailbox channel
>
> No objections here, though they look like bugfixes that
> may be 7.1 material. Up to you, but don't be shy about
> sending things as bugfixes when they address real
> problems, it's better than waiting for the merge window
> and then immediately asking for a backport.

It is more about time not about being shy to send it.

Thanks,
Michal

