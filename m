Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383EDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kcd6o2tvUH9Wlq0TU9ZCul/Ej7huhlgPAxSc9bD4eg0=; b=IduikTp1MUpDF5wlrgr4j1RstE
	zsH2SQ+qS+nBQOZ4C32ohr9e0xsEmFFveN0paUrxdvfcUAn1YstYhNRoBPAYII+U6Vlrs+mWria6A
	pMH43UEwjEoXsKfSlgNJ1FRVsKLAdA8uhAkBCO68hygiF+nCJyE8MwtNY4kq8AJSyrZhV37Kn+M24
	TlPybvWXW4sk+Jjj9ckQzpnewpXZ8n9DocfdqHvrnjarYNk/ENtF4t3EfG2pdmWCW4jxlC+Zc4dLn
	SLtjz7Tm+WuIzs5JS57d7s1AQw82kFlS+m9FZJ4/1rK2UdKzlomooukezbVCUoeRh+kfywuUG1mu1
	m1r36RMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z4m-0000000EcW3-1EXw;
	Thu, 24 Apr 2025 16:05:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xGy-0000000EK9C-1r3w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745503789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kcd6o2tvUH9Wlq0TU9ZCul/Ej7huhlgPAxSc9bD4eg0=;
	b=gqI10tR6664EVHaUzsi6pGv6tz0HdbE9geKp9ilsJrCv/IGdHdIl3F+t87ZV5iEWJ36BFT
	90ww/K6AwKDagRwpzvjf85EZ5QIlj0H5iBbyf6dpvyMJHbcAUl6S24WnFsa6qAyHGrCAeF
	PakxFVdr+Mlayu7wN0mHe39Alz4ycjw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-oL7N6pe5OayTpFm1E0cpvQ-1; Thu, 24 Apr 2025 10:09:47 -0400
X-MC-Unique: oL7N6pe5OayTpFm1E0cpvQ-1
X-Mimecast-MFC-AGG-ID: oL7N6pe5OayTpFm1E0cpvQ_1745503787
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39d9243b1c2so375698f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745503786; x=1746108586;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kcd6o2tvUH9Wlq0TU9ZCul/Ej7huhlgPAxSc9bD4eg0=;
        b=GZVgC3UJGHfjt3zBKwGj2e1xo/qdknJLuqRmmOTkpugz7AWoR7Sklo5cJJFcYATb9d
         D3rX0Y6d73FkIq3l3V7cQd2dp0ptR60lPMIjsYSdFEkH09ZU9V/3cuo8LfUUYBliCPcb
         fN2oifYQgUPF2CKc4WyQk7VvAUfbE6RaTeOVS/oe98Mh1ZQq97GzU2dt0meS5tQ2GIxI
         6+ANmkk5yF73mu5n1+7OAUusFn0Xh5PrQHQnMxCDr94aKWcqmpBXDt06L2JzhW3we2XF
         CJYsaR6/bPiyq6skffxJ8wsHSLWFEuSzVH5i2i4RQVRyfZD4K9g0jtl1HkNvAzHnHMuD
         +ntg==
X-Forwarded-Encrypted: i=1; AJvYcCWiAWQRxW4eLg8DP3XkhYv0y6YE2mlcBOu/BX6coVUIxvjWf1ZBCsWNR0VMy+pOaTmMclUa9ks1LoJfyAFBhc0I@lists.infradead.org
X-Gm-Message-State: AOJu0Yz15eEyHKSAxQO1doxYezf0DUk5vFUPiPkMCI/atatrV5WT+ATE
	MhqZ4HBbEsXwi8V5mCBWIpSIqmy29kMaGgPVo3LLP1QDn5dEOXqB2beuXr5TuU7Tu4rEOZlvQHm
	XznH6w1hw2pnxjByydPA7e+AFrEEN/4JMNOuJOcto91BR4KrpuMJB8PtRGce7S70jjXFxo+KG
X-Gm-Gg: ASbGncsL3I2x48u5tdX8xQ9CUK2YY61vHezOTkC1LJF+Dhrq2+YGEAXBi7PHnNalt0H
	PF6WoAk0EvJUnND1vHKb6nI8Z2NW69Dp8tFFfyuYu202/Mfj1wTreSI6RAEi5cw2cMhs+62sT6J
	5pUOXX6HVOIq4hGyzpdL9Ma38QT3fE/gFMypS0KPTxI6iSser4df98BpEHO60VnA1ZizdmNX75q
	7uYINh+FbmDr5ulk4bFREUjE29RLBV/2QL6IWB83ZziWLd0HRRmKxBXYocwNB80MuaOQqQeyv4k
	VkLnp/wurmGlM4bRKTYxvjROsg==
X-Received: by 2002:a05:6000:40dd:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-3a06cf564f6mr2030220f8f.19.1745503786465;
        Thu, 24 Apr 2025 07:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCLnvnPrTr2kA4EPsTX8eBJWla0qlNHBLrDC/aXaOPuzLScpVQ0iwMUi89EkItUdIH45LJew==
X-Received: by 2002:a05:6000:40dd:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-3a06cf564f6mr2030125f8f.19.1745503785858;
        Thu, 24 Apr 2025 07:09:45 -0700 (PDT)
Received: from t14ultra (109-81-82-22.rct.o2.cz. [109.81.82.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c4945sm2217236f8f.47.2025.04.24.07.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:09:44 -0700 (PDT)
Date: Thu, 24 Apr 2025 16:10:04 +0200
From: Jan Stancek <jstancek@redhat.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>,
	jstancek@redhat.com
Subject: Re: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
Message-ID: <aApGPAoctq_eoE2g@t14ultra>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
 <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HXF2soC02evZU5GCOccflyH6Zhsqo-io-8rfXgtrpVo_1745503787
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_070952_616132_A5AA1B36 
X-CRM114-Status: GOOD (  13.41  )
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

On Mon, Mar 03, 2025 at 12:11:10PM +0100, Thomas Weiﬂschuh wrote:
>From: Anna-Maria Behnsen <anna-maria@linutronix.de>
>
>To support multiple PTP clocks, the VDSO data structure needs to be
>reworked. All clock specific data will end up in struct vdso_clock and in
>struct vdso_time_data there will be array of it. By now, vdso_clock is
>simply a define which maps vdso_clock to vdso_time_data.
>
>Prepare for the rework of these structures by adding struct vdso_clock
>pointer argument to do_hres_timens(), and replace the struct vdso_time_data
>pointer with the new pointer arugment whenever applicable.
>
>No functional change.
>
>Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
>Signed-off-by: Nam Cao <namcao@linutronix.de>
>Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
>---
> lib/vdso/gettimeofday.c | 35 ++++++++++++++++++-----------------
> 1 file changed, 18 insertions(+), 17 deletions(-)
>

Hi,

starting with this patch, I'm seeing user-space crashes when using clock_gettime():
   BAD  -> 83a2a6b8cfc5 vdso/gettimeofday: Prepare do_hres_timens() for introduction of struct vdso_clock
   GOOD -> 64c3613ce31a vdso/gettimeofday: Prepare do_hres() for introduction of struct vdso_clock

It appears to be unique to aarch64 with 64k pages, and can be reproduced with
LTP clock_gettime03 [1]:
   command: clock_gettime03 
   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
   tst_test.c:1903: TINFO: LTP version: 20250130-231-gd02c2aea3
   tst_test.c:1907: TINFO: Tested kernel: 6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k #1 SMP PREEMPT_DYNAMIC Wed Apr 23 23:23:54 UTC 2025 aarch64
   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
   tst_test.c:1720: TINFO: Overall timeout per run is 0h 05m 24s
   clock_gettime03.c:121: TINFO: Testing variant: vDSO or syscall with libc spec
   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct 10000ms
   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct 10000ms
   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct -10000ms
   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct -10000ms
   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
   tst_test.c:438: TBROK: Child (233649) killed by signal SIGSEGV

or with:
--------------------- 8< ----------------------
#define _GNU_SOURCE
#include <sched.h>
#include <time.h>
#include <unistd.h>                                                                                                                                                                                                                          #include <sys/wait.h>

int main(void)
{
         struct timespec tp;
         pid_t child;
         int status;

         unshare(CLONE_NEWTIME);

         child = fork();
         if (child == 0) {
                 clock_gettime(CLOCK_MONOTONIC_RAW, &tp);
         }

         wait(&status);
         return status;
}

# ./a.out ; echo $?
139
--------------------- >8 ----------------------

RPMs and configs can be found at Fedora koji, latest build is at [2] (look for kernel-64k).

Regards,
Jan

[1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
[2] https://koji.fedoraproject.org/koji/buildinfo?buildID=2704401


