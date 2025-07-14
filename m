Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398ABC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqw+Zq4IYXJ5LysW9CQUZGqMpjh9E9bB5LqggaTSXJc=; b=3YNv8/B7K3NPfvXTOZVgznbvAn
	fqEI5Iv9QDfNN9qk/S1bBHZCQIPE0iPo+pC2OKBSl4U4pgz3lDdISLFACqFaLi2IlBEz9hpAkUx0I
	UMIowA2slD3PALxmxjJ3vgn6tTppiU1b5Y4vcFaJLc/LrY2+pKe2hvJEX/f+2B123odu0kTAzZu8m
	ggccmBjm8nmMfzxxll7emDIlburcZlJ5bA6E1aTUkrwHJOXaQlLm9+nU+kugbOjwwbRork/Dkr9Rg
	t9LPhXazjmhVzlUjG5A+psRvBpvqJZlGo8O+VmdBDVxigZl143rlmjsiKvF/QQkeXD/nzWOwkq3BD
	pJWkx91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEUK-00000001dSz-4Ask;
	Mon, 14 Jul 2025 08:24:41 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEHA-00000001a6u-1NG7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 08:11:06 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 65C753F5B1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1752480659;
	bh=nqw+Zq4IYXJ5LysW9CQUZGqMpjh9E9bB5LqggaTSXJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=dN4DmX0DLUqKv1ro/VkcSZ9jYhJ4VpK4hCWo8mLw6Yq8lstvkdGZWF9rB/FkGpDuU
	 FJdfSeqKPPn8QpEgthzmHd41uHYNzPxUIU8uQMTYY60XglXSwhWVc2lPh6vnfByPIV
	 15oA/0Fhq1M6ikg/3OxqGcS+Ad1UBqnbJEWYRaHZMYgbH1y5SDfxnYr+2Ene5K01WT
	 bH6InG3dqPrvkN+k6MeDA5kfZaHtX23f0iM3d4EjYzfCzkFWoH7Y3QNcle5G6iu3//
	 rkxCBIig0HlKpyEmI/ovydri/zyYQLxzm9ZYDOKdSp1QUoZc32HMmFrwL7KPssGgAx
	 zThu4L+n/ySoA==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ae371f9e3f5so476720366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 01:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752480659; x=1753085459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqw+Zq4IYXJ5LysW9CQUZGqMpjh9E9bB5LqggaTSXJc=;
        b=Bxi5r0c+zBfdgzI9t3sePF0S+N05ssMejrMju/NxWKNxJCahZP98TPe2gGH6W3EKTl
         CWh4B3tbhlTGnlB/sd/TQycWr5hrlRnLkx90a67idbDLvrf6Sw0DBKbowiwlefL+6wud
         vTSUJOxNmCY0gVCiRtonMH+gjjM1K95VePDbnmlmoV+ftNPZKnFQjo6HYsNxqJ56ZSbL
         YM7OS8x0Uyok7LHk4TogL6UWA1DWdydgXs19X/5kQGjmcONdcw6Z/Um1An2/aopqbmGF
         CiknF5nSY9ggMydgcCkTPVph3N6y+AflfDIy6Yb4WYrhh723meHBiO2mlLr2VW6qLOR4
         eW+w==
X-Gm-Message-State: AOJu0YwiP+Gxc/c5HMHm+adsVyC0/xgWWEByAkn39Kor16c2zmyeh2uu
	B2pFgi/wzyX5aMLcX9rbZuRrBPgPU7bb9+DNnZ3SBnSGh6v96GipRr/vAMeSez6mg7j6fy/W1+K
	OavMr6/bH1pQlCbL01/y/xcpuM56Y6LHpWlocfjaaUFrPDORYpxMt66SmVxAcVgZ6ceJbpBoB75
	Rm/lAnR43JnjAI5kFN
X-Gm-Gg: ASbGncvH5pF4t3BXr45CK0TY48Oz5rYfpp0Uk1DtBfquxDsAxLWC4SNJ/k2LhClXfg0
	iOLYYh7PlO6XFUXGP3RxreK9Meqipzt4ZTAzOsi8gSP+iyZufQk63IRJPUftCLdWrLBhVao5jIV
	mENvrnMjRZzfqhD1T/RkM+eFAxXsaymVbhnsTUKz3TRYOb8YSLUDr5l66NpC+ulNUbu/gL4bSjL
	0nO6lmIc2A+YqJv0iIpKVdKffDxav1P6RHZIDWn5/jyBBrl653AoVcQZ5bx5N/VpVDqK71O60/1
	/Lng7G1fr3DyROI3McdmhibvkWF4Qgld6MTCZoaqicpcQ6P1vhjNI7c4RGTx2pA=
X-Received: by 2002:a17:907:9450:b0:ad8:adf3:7d6d with SMTP id a640c23a62f3a-ae6fb8a57eemr1155261966b.21.1752480658901;
        Mon, 14 Jul 2025 01:10:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVNG4cGhbgl6DZuAszmrlgOEZ5D4CwRcSMPsKcvD43UnpSt6BkYsm9BCpJ8sMqD6XmPCotBg==
X-Received: by 2002:a17:907:9450:b0:ad8:adf3:7d6d with SMTP id a640c23a62f3a-ae6fb8a57eemr1155257866b.21.1752480658379;
        Mon, 14 Jul 2025 01:10:58 -0700 (PDT)
Received: from [10.27.73.177] ([212.144.242.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90b09sm770592166b.25.2025.07.14.01.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 01:10:57 -0700 (PDT)
Message-ID: <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
Date: Mon, 14 Jul 2025 10:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Remove unused EFI runtime APIs
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Bibo Mao <maobibo@loongson.cn>,
 linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250714060843.4029171-5-ardb+git@google.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250714060843.4029171-5-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_011104_691028_1EC4153E 
X-CRM114-Status: GOOD (  23.21  )
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

On 7/14/25 08:08, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Using EFI runtime services to program the RTC to wake up the system is
> supported in theory, but rarely works in practice. Fortunately, this
> functionality is rarely [if ever] used to begin with so we can just drop
> it. (Note that the EFI rtc driver is not used by x86, which programs the
> CMOS rtc directly)

The main problem I see with firmware offering access to the RTC via UEFI 
services is that two different drivers, the firmware one and the Linux 
one might be trying to access the same busses or registers which might 
lead to unexpected results.

Recently there was a discussion in the RISC-V technical group for the 
server platform specification where the same issue was discussed 
concerning SetTime().

As a UEFI firmware should not care which operating system is booted, it 
should be up to the OS to disable EFI access to the RTC if it has native 
access.

Could we disable all the EFI services for the RTC in Linux dynamically 
when an RTC driver is successfully probed?

Best regards

Heinrich

> 
> The same applies to GetNextHighMonoCount(), which, if implemented,
> usually relies on SetVariable() under the hood *, which is often not
> supported at runtime by non-x86 platforms. But it has no known users
> either so let's drop support for it as well.
> 
> This means we need to drop the slightly pointless tests for it too.
> 
> * EDK2 based EFI implementations usually have a MTC variable carrying
>    the monotonic counter variable, which is therefore not truly
>    monotonic, given that SetVariable() will happily overwrite it.
> 
> Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Cc: Feng Tang <feng.tang@linux.alibaba.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> Cc: Bibo Mao <maobibo@loongson.cn>
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-efi@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: x86@kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: loongarch@lists.linux.dev
> 
> Ard Biesheuvel (3):
>    efi-rtc: Remove wakeup functionality
>    efi/test: Don't bother pseudo-testing unused EFI services
>    efi: Remove support for pointless, unused EFI services
> 
>   arch/x86/platform/efi/efi_64.c          |  22 ----
>   drivers/firmware/efi/runtime-wrappers.c |  68 ------------
>   drivers/firmware/efi/test/efi_test.c    | 108 +-------------------
>   drivers/rtc/rtc-efi.c                   |  76 +-------------
>   drivers/xen/efi.c                       |  56 ----------
>   include/linux/efi.h                     |   6 --
>   6 files changed, 4 insertions(+), 332 deletions(-)
> 


