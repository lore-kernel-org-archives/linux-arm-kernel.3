Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4351093176
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 02:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJkGERVoIntxxjUUGoj1f/1gDk0qAPWFweVmoX93EW8=; b=c081jZpD9PALcxS5qXFPqY4KW6
	WksCBf6OyT2dA4jOSrscwXQOnVMa25Cy0zudQ2LGPvx/R7NidZQLlijTdqDLw2+D61rg6DgkRTnAL
	ug7V6j6mOA+N2y3erLZuXwt8mePANLTYNJxr/SijW+ks5a0OUnMJaSurd8jY0QtDCtOazxFgmK/ri
	cLZv3pbeyN7D+wt//azN164C5NIsk9Vll9aF0Q0uceVHMSOdWdnLicbysVcx045Cqk/4B+2OFHp+u
	oG3SLARc7caTUGIPEuh4v0eBr3pnMsD2i5Z0zaOuOReZ7EBwLixFZz0aEKifHwac8y1LqQHVXuLBf
	Zn4/5eeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5DjP-00000002V0i-4AK2;
	Wed, 25 Mar 2026 02:12:27 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5DjM-00000002Uzw-2V9D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 02:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774404737; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=UJkGERVoIntxxjUUGoj1f/1gDk0qAPWFweVmoX93EW8=;
	b=K+6/9wwrSipXH3uNPrRYBGXL6h3J/Eoc5uAymDtiwM65ujwj1eydkLENYZTwiq+63LY2RVjRHZa6jbOEiQ27cW6bo1aiM+nMlo767nIaaWziW4T538Vv6kdcoCyFuQqUt/zYQi2mPS2XkG94L7Y3z/Gb24kgitgzf/eKRQnECu0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X.g6LPG_1774404732;
Received: from 30.246.162.22(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X.g6LPG_1774404732 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Mar 2026 10:12:14 +0800
Message-ID: <c72680a4-5133-4b93-8efb-2e72ce0ed7fa@linux.alibaba.com>
Date: Wed, 25 Mar 2026 10:12:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ACPI: APEI: Handle repeated SEA error interrupts storm
 scenarios
To: hejunhao <hejunhao3@h-partners.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Luck, Tony" <tony.luck@intel.com>
Cc: bp@alien8.de, guohanjun@huawei.com, mchehab@kernel.org,
 jarkko@kernel.org, yazen.ghannam@amd.com, jane.chu@oracle.com,
 lenb@kernel.org, Jonathan.Cameron@huawei.com, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, shiju.jose@huawei.com, tanxiaofei@huawei.com,
 Linuxarm <linuxarm@huawei.com>
References: <20251030071321.2763224-1-hejunhao3@h-partners.com>
 <CAJZ5v0h=QtcT7zhZEgrTjUk7EAk2OfbGG6BoEEv-3toKODMXQA@mail.gmail.com>
 <bf42a19d-0f5d-48d8-91f5-febb8bfd06d3@linux.alibaba.com>
 <9817f221-5b5f-7c25-ab94-cb04a854553a@h-partners.com>
 <70b85b7c-5107-4f79-abf7-3cc5b7e1438d@linux.alibaba.com>
 <ea31b6d3-fae5-ab5c-c10c-ed6901296498@h-partners.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <ea31b6d3-fae5-ab5c-c10c-ed6901296498@h-partners.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_191225_521403_BE66CA92 
X-CRM114-Status: GOOD (  26.88  )
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

Hi, junhao

On 3/24/26 6:04 PM, hejunhao wrote:
> Hi shuai xue,
> 
> 
> On 2026/3/3 22:42, Shuai Xue wrote:
>> Hi, junhao,
>>
>> On 2/27/26 8:12 PM, hejunhao wrote:
>>>
>>>
>>> On 2025/11/4 9:32, Shuai Xue wrote:
>>>>
>>>>
>>>> 在 2025/11/4 00:19, Rafael J. Wysocki 写道:
>>>>> On Thu, Oct 30, 2025 at 8:13 AM Junhao He <hejunhao3@h-partners.com> wrote:
>>>>>>
>>>>>> The do_sea() function defaults to using firmware-first mode, if supported.
>>>>>> It invoke acpi/apei/ghes ghes_notify_sea() to report and handling the SEA
>>>>>> error, The GHES uses a buffer to cache the most recent 4 kinds of SEA
>>>>>> errors. If the same kind SEA error continues to occur, GHES will skip to
>>>>>> reporting this SEA error and will not add it to the "ghes_estatus_llist"
>>>>>> list until the cache times out after 10 seconds, at which point the SEA
>>>>>> error will be reprocessed.
>>>>>>
>>>>>> The GHES invoke ghes_proc_in_irq() to handle the SEA error, which
>>>>>> ultimately executes memory_failure() to process the page with hardware
>>>>>> memory corruption. If the same SEA error appears multiple times
>>>>>> consecutively, it indicates that the previous handling was incomplete or
>>>>>> unable to resolve the fault. In such cases, it is more appropriate to
>>>>>> return a failure when encountering the same error again, and then proceed
>>>>>> to arm64_do_kernel_sea for further processing.
>>
>> There is no such function in the arm64 tree. If apei_claim_sea() returns
> 
> Sorry for the mistake in the commit message. The function arm64_do_kernel_sea() should
> be arm64_notify_die().
> 
>> an error, the actual fallback path in do_sea() is arm64_notify_die(),
>> which sends SIGBUS?
>>
> 
> If apei_claim_sea() returns an error, arm64_notify_die() will call arm64_force_sig_fault(inf->sig /* SIGBUS */, , , ),
> followed by force_sig_fault(SIGBUS, , ) to force the process to receive the SIGBUS signal.

So the process is expected to killed by SIGBUS?

> 
>>>>>>
>>>>>> When hardware memory corruption occurs, a memory error interrupt is
>>>>>> triggered. If the kernel accesses this erroneous data, it will trigger
>>>>>> the SEA error exception handler. All such handlers will call
>>>>>> memory_failure() to handle the faulty page.
>>>>>>
>>>>>> If a memory error interrupt occurs first, followed by an SEA error
>>>>>> interrupt, the faulty page is first marked as poisoned by the memory error
>>>>>> interrupt process, and then the SEA error interrupt handling process will
>>>>>> send a SIGBUS signal to the process accessing the poisoned page.
>>>>>>
>>>>>> However, if the SEA interrupt is reported first, the following exceptional
>>>>>> scenario occurs:
>>>>>>
>>>>>> When a user process directly requests and accesses a page with hardware
>>>>>> memory corruption via mmap (such as with devmem), the page containing this
>>>>>> address may still be in a free buddy state in the kernel. At this point,
>>>>>> the page is marked as "poisoned" during the SEA claim memory_failure().
>>>>>> However, since the process does not request the page through the kernel's
>>>>>> MMU, the kernel cannot send SIGBUS signal to the processes. And the memory
>>>>>> error interrupt handling process not support send SIGBUS signal. As a
>>>>>> result, these processes continues to access the faulty page, causing
>>>>>> repeated entries into the SEA exception handler. At this time, it lead to
>>>>>> an SEA error interrupt storm.
>>
>> In such case, the user process which accessing the poisoned page will be killed
>> by memory_fauilre?
>>
>> // memory_failure():
>>
>>      if (TestSetPageHWPoison(p)) {
>>          res = -EHWPOISON;
>>          if (flags & MF_ACTION_REQUIRED)
>>              res = kill_accessing_process(current, pfn, flags);
>>          if (flags & MF_COUNT_INCREASED)
>>              put_page(p);
>>          action_result(pfn, MF_MSG_ALREADY_POISONED, MF_FAILED);
>>          goto unlock_mutex;
>>      }
>>
>> I think this problem has already been fixed by commit 2e6053fea379 ("mm/memory-failure:
>> fix infinite UCE for VM_PFNMAP pfn").
>>
>> The root cause is that walk_page_range() skips VM_PFNMAP vmas by default when
>> no .test_walk callback is set, so kill_accessing_process() returns 0 for a
>> devmem-style mapping (remap_pfn_range, VM_PFNMAP), making the caller believe
>> the UCE was handled properly while the process was never actually killed.
>>
>> Did you try the lastest kernel version?
>>
> 
> I retested this issue on the kernel v7.0.0-rc4 with the following debug patch and was still able to reproduce it.
> 
> 
> @@ -1365,8 +1365,11 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
>          ghes_clear_estatus(ghes, &tmp_header, buf_paddr, fixmap_idx);
> 
>          /* This error has been reported before, don't process it again. */
> -       if (ghes_estatus_cached(estatus))
> +       if (ghes_estatus_cached(estatus)) {
> +               pr_info("This error has been reported before, don't process it again.\n");
>                  goto no_work;
> +       }
> 
> the test log Only some debug logs are retained here.
> 
> [2026/3/24 14:51:58.199] [root@localhost ~]# taskset -c 40 busybox devmem 0x1351811824 32 0
> [2026/3/24 14:51:58.369] [root@localhost ~]# taskset -c 40 busybox devmem 0x1351811824 32
> [2026/3/24 14:51:58.458] [  130.558038][   C40] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 9
> [2026/3/24 14:51:58.459] [  130.572517][   C40] {1}[Hardware Error]: event severity: recoverable
> [2026/3/24 14:51:58.459] [  130.578861][   C40] {1}[Hardware Error]:  Error 0, type: recoverable
> [2026/3/24 14:51:58.459] [  130.585203][   C40] {1}[Hardware Error]:   section_type: ARM processor error
> [2026/3/24 14:51:58.459] [  130.592238][   C40] {1}[Hardware Error]:   MIDR: 0x0000000000000000
> [2026/3/24 14:51:58.459] [  130.598492][   C40] {1}[Hardware Error]:   Multiprocessor Affinity Register (MPIDR): 0x0000000081010400
> [2026/3/24 14:51:58.459] [  130.607871][   C40] {1}[Hardware Error]:   error affinity level: 0
> [2026/3/24 14:51:58.459] [  130.614038][   C40] {1}[Hardware Error]:   running state: 0x1
> [2026/3/24 14:51:58.459] [  130.619770][   C40] {1}[Hardware Error]:   Power State Coordination Interface state: 0
> [2026/3/24 14:51:58.459] [  130.627673][   C40] {1}[Hardware Error]:   Error info structure 0:
> [2026/3/24 14:51:58.459] [  130.633839][   C40] {1}[Hardware Error]:   num errors: 1
> [2026/3/24 14:51:58.459] [  130.639137][   C40] {1}[Hardware Error]:    error_type: 0, cache error
> [2026/3/24 14:51:58.459] [  130.645652][   C40] {1}[Hardware Error]:    error_info: 0x0000000020400014
> [2026/3/24 14:51:58.459] [  130.652514][   C40] {1}[Hardware Error]:     cache level: 1
> [2026/3/24 14:51:58.551] [  130.658073][   C40] {1}[Hardware Error]:     the error has not been corrected
> [2026/3/24 14:51:58.551] [  130.665194][   C40] {1}[Hardware Error]:    physical fault address: 0x0000001351811800
> [2026/3/24 14:51:58.551] [  130.673097][   C40] {1}[Hardware Error]:   Vendor specific error info has 48 bytes:
> [2026/3/24 14:51:58.551] [  130.680744][   C40] {1}[Hardware Error]:    00000000: 00000000 00000000 00000000 00000000  ................
> [2026/3/24 14:51:58.551] [  130.690471][   C40] {1}[Hardware Error]:    00000010: 00000000 00000000 00000000 00000000  ................
> [2026/3/24 14:51:58.552] [  130.700198][   C40] {1}[Hardware Error]:    00000020: 00000000 00000000 00000000 00000000  ................
> [2026/3/24 14:51:58.552] [  130.710083][ T9767] Memory failure: 0x1351811: recovery action for free buddy page: Recovered
> [2026/3/24 14:51:58.638] [  130.790952][   C40] This error has been reported before, don't process it again.
> [2026/3/24 14:51:58.903] [  131.046994][   C40] This error has been reported before, don't process it again.
> [2026/3/24 14:51:58.991] [  131.132360][   C40] This error has been reported before, don't process it again.
> [2026/3/24 14:51:59.969] [  132.071431][   C40] This error has been reported before, don't process it again.
> [2026/3/24 14:52:00.860] [  133.010255][   C40] This error has been reported before, don't process it again.
> [2026/3/24 14:52:01.927] [  134.034746][   C40] This error has been reported before, don't process it again.
> [2026/3/24 14:52:02.906] [  135.058973][   C40] This error has been reported before, don't process it again.
> [2026/3/24 14:52:03.971] [  136.083213][   C40] This error has been reported before, don't process it again.
> [2026/3/24 14:52:04.860] [  137.021956][   C40] This error has been reported before, don't process it again.
> [2026/3/24 14:52:06.018] [  138.131460][   C40] This error has been reported before, don't process it again.
> [2026/3/24 14:52:06.905] [  139.070280][   C40] This error has been reported before, don't process it again.
> [2026/3/24 14:52:07.886] [  140.009147][   C40] This error has been reported before, don't process it again.
> [2026/3/24 14:52:08.596] [  140.777368][   C40] {2}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 9
> [2026/3/24 14:52:08.683] [  140.791921][   C40] {2}[Hardware Error]: event severity: recoverable
> [2026/3/24 14:52:08.683] [  140.798263][   C40] {2}[Hardware Error]:  Error 0, type: recoverable
> [2026/3/24 14:52:08.683] [  140.804606][   C40] {2}[Hardware Error]:   section_type: ARM processor error
> [2026/3/24 14:52:08.683] [  140.811641][   C40] {2}[Hardware Error]:   MIDR: 0x0000000000000000
> [2026/3/24 14:52:08.684] [  140.817895][   C40] {2}[Hardware Error]:   Multiprocessor Affinity Register (MPIDR): 0x0000000081010400
> [2026/3/24 14:52:08.684] [  140.827274][   C40] {2}[Hardware Error]:   error affinity level: 0
> [2026/3/24 14:52:08.684] [  140.833440][   C40] {2}[Hardware Error]:   running state: 0x1
> [2026/3/24 14:52:08.684] [  140.839173][   C40] {2}[Hardware Error]:   Power State Coordination Interface state: 0
> [2026/3/24 14:52:08.684] [  140.847076][   C40] {2}[Hardware Error]:   Error info structure 0:
> [2026/3/24 14:52:08.684] [  140.853241][   C40] {2}[Hardware Error]:   num errors: 1
> [2026/3/24 14:52:08.684] [  140.858540][   C40] {2}[Hardware Error]:    error_type: 0, cache error
> [2026/3/24 14:52:08.684] [  140.865055][   C40] {2}[Hardware Error]:    error_info: 0x0000000020400014
> [2026/3/24 14:52:08.684] [  140.871917][   C40] {2}[Hardware Error]:     cache level: 1
> [2026/3/24 14:52:08.684] [  140.877475][   C40] {2}[Hardware Error]:     the error has not been corrected
> [2026/3/24 14:52:08.764] [  140.884596][   C40] {2}[Hardware Error]:    physical fault address: 0x0000001351811800
> [2026/3/24 14:52:08.764] [  140.892499][   C40] {2}[Hardware Error]:   Vendor specific error info has 48 bytes:
> [2026/3/24 14:52:08.766] [  140.900145][   C40] {2}[Hardware Error]:    00000000: 00000000 00000000 00000000 00000000  ................
> [2026/3/24 14:52:08.767] [  140.909872][   C40] {2}[Hardware Error]:    00000010: 00000000 00000000 00000000 00000000  ................
> [2026/3/24 14:52:08.767] [  140.919598][   C40] {2}[Hardware Error]:    00000020: 00000000 00000000 00000000 00000000  ................
> [2026/3/24 14:52:08.768] [  140.929346][ T9767] Memory failure: 0x1351811: already hardware poisoned
> [2026/3/24 14:52:08.768] [  140.936072][ T9767] Memory failure: 0x1351811: Sending SIGBUS to busybox:9767 due to hardware memory corruption

Did you cut off some logs here?
The error log also indicates that the SIGBUS is delivered as expected.

> 
> 
> Apply the patch:
> 
> @@ -1365,8 +1365,11 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
>          ghes_clear_estatus(ghes, &tmp_header, buf_paddr, fixmap_idx);
> 
>          /* This error has been reported before, don't process it again. */
> -       if (ghes_estatus_cached(estatus))
> +       if (ghes_estatus_cached(estatus)) {
> +               pr_info("This error has been reported before, don't process it again.\n");
> +               rc = -ECANCELED;
>                  goto no_work;
> +       }
> 
> [2026/3/24 16:45:40.084] [root@localhost ~]# taskset -c 40 busybox devmem 0x1351811824 32 0
> [2026/3/24 16:45:40.272] [root@localhost ~]# taskset -c 40 busybox devmem 0x1351811824 32
> [2026/3/24 16:45:40.362] [  112.279324][   C40] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 9
> [2026/3/24 16:45:40.362] [  112.293797][   C40] {1}[Hardware Error]: event severity: recoverable
> [2026/3/24 16:45:40.362] [  112.300139][   C40] {1}[Hardware Error]:  Error 0, type: recoverable
> [2026/3/24 16:45:40.363] [  112.306481][   C40] {1}[Hardware Error]:   section_type: ARM processor error
> [2026/3/24 16:45:40.363] [  112.313516][   C40] {1}[Hardware Error]:   MIDR: 0x0000000000000000
> [2026/3/24 16:45:40.363] [  112.319771][   C40] {1}[Hardware Error]:   Multiprocessor Affinity Register (MPIDR): 0x0000000081010400
> [2026/3/24 16:45:40.363] [  112.329151][   C40] {1}[Hardware Error]:   error affinity level: 0
> [2026/3/24 16:45:40.363] [  112.335317][   C40] {1}[Hardware Error]:   running state: 0x1
> [2026/3/24 16:45:40.363] [  112.341049][   C40] {1}[Hardware Error]:   Power State Coordination Interface state: 0
> [2026/3/24 16:45:40.363] [  112.348953][   C40] {1}[Hardware Error]:   Error info structure 0:
> [2026/3/24 16:45:40.363] [  112.355119][   C40] {1}[Hardware Error]:   num errors: 1
> [2026/3/24 16:45:40.363] [  112.360418][   C40] {1}[Hardware Error]:    error_type: 0, cache error
> [2026/3/24 16:45:40.363] [  112.366932][   C40] {1}[Hardware Error]:    error_info: 0x0000000020400014
> [2026/3/24 16:45:40.363] [  112.373795][   C40] {1}[Hardware Error]:     cache level: 1
> [2026/3/24 16:45:40.453] [  112.379354][   C40] {1}[Hardware Error]:     the error has not been corrected
> [2026/3/24 16:45:40.453] [  112.386475][   C40] {1}[Hardware Error]:    physical fault address: 0x0000001351811800
> [2026/3/24 16:45:40.453] [  112.394378][   C40] {1}[Hardware Error]:   Vendor specific error info has 48 bytes:
> [2026/3/24 16:45:40.453] [  112.402027][   C40] {1}[Hardware Error]:    00000000: 00000000 00000000 00000000 00000000  ................
> [2026/3/24 16:45:40.453] [  112.411754][   C40] {1}[Hardware Error]:    00000010: 00000000 00000000 00000000 00000000  ................
> [2026/3/24 16:45:40.453] [  112.421480][   C40] {1}[Hardware Error]:    00000020: 00000000 00000000 00000000 00000000  ................
> [2026/3/24 16:45:40.453] [  112.431639][ T9769] Memory failure: 0x1351811: recovery action for free buddy page: Recovered
> [2026/3/24 16:45:40.531] [  112.512520][   C40] This error has been reported before, don't process it again.
> [2026/3/24 16:45:40.757] Bus error (core dumped)
> 


Thanks.
Shuai



