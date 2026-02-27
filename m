Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A882FEFB41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 12:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:References:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VEALnvaWMcvDx38Kn3b+L0zf/ZROo5ZqxIk+zkF0nE=; b=ol8yiEToTTAAJNnj+0UPGLm3xa
	D8eyakhN/M43qlT77I7+rUs1tSFr87yQB/h5YGRybTtI+tKZWspz1Yl7jR59nrHvyALosytVYQxO5
	0qNzHKZ1UcLWb0dEhagPdnypVQEly51hsdtU42X5rdwSgNZR5ikEviXXGwc3oe3wNrJ7DLbbmCUuI
	nCX4VyEImuT2oVGIBDCLbWt0ZnUGgRYIvymMW2Nnh0zhzGuy110rOpVphyhFpk/9n8v65YPkHQOJp
	Gt6dN8hcZE1tsgxNJOlgBSn8L+a6Rp4EYN8ZvFIUfJx8Pdc87VoEB429qUi+S1G0qZbOjAcI4Bk6T
	CzYLQVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvwiG-00000008Jra-47tS;
	Fri, 27 Feb 2026 12:12:57 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvwiC-00000008Jqn-42JT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 12:12:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7VEALnvaWMcvDx38Kn3b+L0zf/ZROo5ZqxIk+zkF0nE=;
	b=CVdoQHs71hAzokOgcGqn3HXAjwct44S2aOxlRp25B975m4f9OA+3F3/lYGcc34Z33xWCguEvG
	SIqgO5/kcH013XLbgeJNSzsUpYAOAZdr1S66JhPhVSt/eTdXyLUQ2lOIkbSbS1UqwblgpizqyK9
	S2IezFKk97DyIIq3P7BaCA4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fMnC64jZsz1prKm;
	Fri, 27 Feb 2026 20:07:46 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 2B132404AD;
	Fri, 27 Feb 2026 20:12:37 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Feb 2026 20:12:36 +0800
Received: from [10.67.120.218] (10.67.120.218) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Feb 2026 20:12:36 +0800
Subject: Re: [PATCH] ACPI: APEI: Handle repeated SEA error interrupts storm
 scenarios
To: Shuai Xue <xueshuai@linux.alibaba.com>, "Rafael J. Wysocki"
	<rafael@kernel.org>, "Luck, Tony" <tony.luck@intel.com>
References: <20251030071321.2763224-1-hejunhao3@h-partners.com>
 <CAJZ5v0h=QtcT7zhZEgrTjUk7EAk2OfbGG6BoEEv-3toKODMXQA@mail.gmail.com>
 <bf42a19d-0f5d-48d8-91f5-febb8bfd06d3@linux.alibaba.com>
CC: Junhao He <hejunhao3@h-partners.com>, <bp@alien8.de>,
	<guohanjun@huawei.com>, <mchehab@kernel.org>, <jarkko@kernel.org>,
	<yazen.ghannam@amd.com>, <jane.chu@oracle.com>, <lenb@kernel.org>,
	<Jonathan.Cameron@huawei.com>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, <shiju.jose@huawei.com>,
	<tanxiaofei@huawei.com>
From: hejunhao <hejunhao3@h-partners.com>
Message-ID: <9817f221-5b5f-7c25-ab94-cb04a854553a@h-partners.com>
Date: Fri, 27 Feb 2026 20:12:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <bf42a19d-0f5d-48d8-91f5-febb8bfd06d3@linux.alibaba.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.218]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_041254_053904_ED788C38 
X-CRM114-Status: GOOD (  26.61  )
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



On 2025/11/4 9:32, Shuai Xue wrote:
>
>
> 在 2025/11/4 00:19, Rafael J. Wysocki 写道:
>> On Thu, Oct 30, 2025 at 8:13 AM Junhao He <hejunhao3@h-partners.com> wrote:
>>>
>>> The do_sea() function defaults to using firmware-first mode, if supported.
>>> It invoke acpi/apei/ghes ghes_notify_sea() to report and handling the SEA
>>> error, The GHES uses a buffer to cache the most recent 4 kinds of SEA
>>> errors. If the same kind SEA error continues to occur, GHES will skip to
>>> reporting this SEA error and will not add it to the "ghes_estatus_llist"
>>> list until the cache times out after 10 seconds, at which point the SEA
>>> error will be reprocessed.
>>>
>>> The GHES invoke ghes_proc_in_irq() to handle the SEA error, which
>>> ultimately executes memory_failure() to process the page with hardware
>>> memory corruption. If the same SEA error appears multiple times
>>> consecutively, it indicates that the previous handling was incomplete or
>>> unable to resolve the fault. In such cases, it is more appropriate to
>>> return a failure when encountering the same error again, and then proceed
>>> to arm64_do_kernel_sea for further processing.
>>>
>>> When hardware memory corruption occurs, a memory error interrupt is
>>> triggered. If the kernel accesses this erroneous data, it will trigger
>>> the SEA error exception handler. All such handlers will call
>>> memory_failure() to handle the faulty page.
>>>
>>> If a memory error interrupt occurs first, followed by an SEA error
>>> interrupt, the faulty page is first marked as poisoned by the memory error
>>> interrupt process, and then the SEA error interrupt handling process will
>>> send a SIGBUS signal to the process accessing the poisoned page.
>>>
>>> However, if the SEA interrupt is reported first, the following exceptional
>>> scenario occurs:
>>>
>>> When a user process directly requests and accesses a page with hardware
>>> memory corruption via mmap (such as with devmem), the page containing this
>>> address may still be in a free buddy state in the kernel. At this point,
>>> the page is marked as "poisoned" during the SEA claim memory_failure().
>>> However, since the process does not request the page through the kernel's
>>> MMU, the kernel cannot send SIGBUS signal to the processes. And the memory
>>> error interrupt handling process not support send SIGBUS signal. As a
>>> result, these processes continues to access the faulty page, causing
>>> repeated entries into the SEA exception handler. At this time, it lead to
>>> an SEA error interrupt storm.
>>>
>>> Fixes this by returning a failure when encountering the same error again.
>>>
>>> The following error logs is explained using the devmem process:
>>>    NOTICE:  SEA Handle
>>>    NOTICE:  SpsrEl3 = 0x60001000, ELR_EL3 = 0xffffc6ab42671400
>>>    NOTICE:  skt[0x0]die[0x0]cluster[0x0]core[0x1]
>>>    NOTICE:  EsrEl3 = 0x92000410
>>>    NOTICE:  PA is valid: 0x1000093c00
>>>    NOTICE:  Hest Set GenericError Data
>>>    [ 1419.542401][    C1] {57}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 9
>>>    [ 1419.551435][    C1] {57}[Hardware Error]: event severity: recoverable
>>>    [ 1419.557865][    C1] {57}[Hardware Error]:  Error 0, type: recoverable
>>>    [ 1419.564295][    C1] {57}[Hardware Error]:   section_type: ARM processor error
>>>    [ 1419.571421][    C1] {57}[Hardware Error]:   MIDR: 0x0000000000000000
>>>    [ 1419.571434][    C1] {57}[Hardware Error]:   Multiprocessor Affinity Register (MPIDR): 0x0000000081000100
>>>    [ 1419.586813][    C1] {57}[Hardware Error]:   error affinity level: 0
>>>    [ 1419.586821][    C1] {57}[Hardware Error]:   running state: 0x1
>>>    [ 1419.602714][    C1] {57}[Hardware Error]:   Power State Coordination Interface state: 0
>>>    [ 1419.602724][    C1] {57}[Hardware Error]:   Error info structure 0:
>>>    [ 1419.614797][    C1] {57}[Hardware Error]:   num errors: 1
>>>    [ 1419.614804][    C1] {57}[Hardware Error]:    error_type: 0, cache error
>>>    [ 1419.629226][    C1] {57}[Hardware Error]:    error_info: 0x0000000020400014
>>>    [ 1419.629234][    C1] {57}[Hardware Error]:     cache level: 1
>>>    [ 1419.642006][    C1] {57}[Hardware Error]:     the error has not been corrected
>>>    [ 1419.642013][    C1] {57}[Hardware Error]:    physical fault address: 0x0000001000093c00
>>>    [ 1419.654001][    C1] {57}[Hardware Error]:   Vendor specific error info has 48 bytes:
>>>    [ 1419.654014][    C1] {57}[Hardware Error]:    00000000: 00000000 00000000 00000000 00000000  ................
>>>    [ 1419.670685][    C1] {57}[Hardware Error]:    00000010: 00000000 00000000 00000000 00000000  ................
>>>    [ 1419.670692][    C1] {57}[Hardware Error]:    00000020: 00000000 00000000 00000000 00000000  ................
>>>    [ 1419.783606][T54990] Memory failure: 0x1000093: recovery action for free buddy page: Recovered
>>>    [ 1419.919580][ T9955] EDAC MC0: 1 UE Multi-bit ECC on unknown memory (node:0 card:1 module:71 bank:7 row:0 col:0 page:0x1000093 offset:0xc00 grain:1 - APEI location: node:0 card:257 module:71 bank:7 row:0 col:0)
>>>    NOTICE:  SEA Handle
>>>    NOTICE:  SpsrEl3 = 0x60001000, ELR_EL3 = 0xffffc6ab42671400
>>>    NOTICE:  skt[0x0]die[0x0]cluster[0x0]core[0x1]
>>>    NOTICE:  EsrEl3 = 0x92000410
>>>    NOTICE:  PA is valid: 0x1000093c00
>>>    NOTICE:  Hest Set GenericError Data
>>>    NOTICE:  SEA Handle
>>>    NOTICE:  SpsrEl3 = 0x60001000, ELR_EL3 = 0xffffc6ab42671400
>>>    NOTICE:  skt[0x0]die[0x0]cluster[0x0]core[0x1]
>>>    NOTICE:  EsrEl3 = 0x92000410
>>>    NOTICE:  PA is valid: 0x1000093c00
>>>    NOTICE:  Hest Set GenericError Data
>>>    ...
>>>    ...        ---> Hapend SEA error interrupt storm
>>>    ...
>>>    NOTICE:  SEA Handle
>>>    NOTICE:  SpsrEl3 = 0x60001000, ELR_EL3 = 0xffffc6ab42671400
>>>    NOTICE:  skt[0x0]die[0x0]cluster[0x0]core[0x1]
>>>    NOTICE:  EsrEl3 = 0x92000410
>>>    NOTICE:  PA is valid: 0x1000093c00
>>>    NOTICE:  Hest Set GenericError Data
>>>    [ 1429.818080][ T9955] Memory failure: 0x1000093: already hardware poisoned
>>>    [ 1429.825760][    C1] ghes_print_estatus: 1 callbacks suppressed
>>>    [ 1429.825763][    C1] {59}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 9
>>>    [ 1429.843731][    C1] {59}[Hardware Error]: event severity: recoverable
>>>    [ 1429.861800][    C1] {59}[Hardware Error]:  Error 0, type: recoverable
>>>    [ 1429.874658][    C1] {59}[Hardware Error]:   section_type: ARM processor error
>>>    [ 1429.887516][    C1] {59}[Hardware Error]:   MIDR: 0x0000000000000000
>>>    [ 1429.901159][    C1] {59}[Hardware Error]:   Multiprocessor Affinity Register (MPIDR): 0x0000000081000100
>>>    [ 1429.901166][    C1] {59}[Hardware Error]:   error affinity level: 0
>>>    [ 1429.914896][    C1] {59}[Hardware Error]:   running state: 0x1
>>>    [ 1429.914903][    C1] {59}[Hardware Error]:   Power State Coordination Interface state: 0
>>>    [ 1429.933319][    C1] {59}[Hardware Error]:   Error info structure 0:
>>>    [ 1429.946261][    C1] {59}[Hardware Error]:   num errors: 1
>>>    [ 1429.946269][    C1] {59}[Hardware Error]:    error_type: 0, cache error
>>>    [ 1429.970847][    C1] {59}[Hardware Error]:    error_info: 0x0000000020400014
>>>    [ 1429.970854][    C1] {59}[Hardware Error]:     cache level: 1
>>>    [ 1429.988406][    C1] {59}[Hardware Error]:     the error has not been corrected
>>>    [ 1430.013419][    C1] {59}[Hardware Error]:    physical fault address: 0x0000001000093c00
>>>    [ 1430.013425][    C1] {59}[Hardware Error]:   Vendor specific error info has 48 bytes:
>>>    [ 1430.025424][    C1] {59}[Hardware Error]:    00000000: 00000000 00000000 00000000 00000000  ................
>>>    [ 1430.053736][    C1] {59}[Hardware Error]:    00000010: 00000000 00000000 00000000 00000000  ................
>>>    [ 1430.066341][    C1] {59}[Hardware Error]:    00000020: 00000000 00000000 00000000 00000000  ................
>>>    [ 1430.294255][T54990] Memory failure: 0x1000093: already hardware poisoned
>>>    [ 1430.305518][T54990] 0x1000093: Sending SIGBUS to devmem:54990 due to hardware memory corruption
>>>
>>> Signed-off-by: Junhao He <hejunhao3@h-partners.com>
>>> ---
>>>   drivers/acpi/apei/ghes.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
>>> index 005de10d80c3..eebda39bfc30 100644
>>> --- a/drivers/acpi/apei/ghes.c
>>> +++ b/drivers/acpi/apei/ghes.c
>>> @@ -1343,8 +1343,10 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
>>>          ghes_clear_estatus(ghes, &tmp_header, buf_paddr, fixmap_idx);
>>>
>>>          /* This error has been reported before, don't process it again. */
>>> -       if (ghes_estatus_cached(estatus))
>>> +       if (ghes_estatus_cached(estatus)) {
>>> +               rc = -ECANCELED;
>>>                  goto no_work;
>>> +       }
>>>
>>>          llist_add(&estatus_node->llnode, &ghes_estatus_llist);
>>>
>>> -- 
>>
>> This needs a response from the APEI reviewers as per MAINTAINERS, thanks!
>
> Hi, Rafael and Junhao,
>
> Sorry for late response, I try to reproduce the issue, it seems that
> EINJ systems broken in 6.18.0-rc1+.
>
> [ 3950.741186] CPU: 36 UID: 0 PID: 74112 Comm: einj_mem_uc Tainted: G            E       6.18.0-rc1+ #227 PREEMPT(none)
> [ 3950.751749] Tainted: [E]=UNSIGNED_MODULE
> [ 3950.755655] Hardware name: Huawei TaiShan 200 (Model 2280)/BC82AMDD, BIOS 1.91 07/29/2022
> [ 3950.763797] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [ 3950.770729] pc : acpi_os_write_memory+0x108/0x150
> [ 3950.775419] lr : acpi_os_write_memory+0x28/0x150
> [ 3950.780017] sp : ffff800093fbba40
> [ 3950.783319] x29: ffff800093fbba40 x28: 0000000000000000 x27: 0000000000000000
> [ 3950.790425] x26: 0000000000000002 x25: ffffffffffffffff x24: 000000403f20e400
> [ 3950.797530] x23: 0000000000000000 x22: 0000000000000008 x21: 000000000000ffff
> [ 3950.804635] x20: 0000000000000040 x19: 000000002f7d0018 x18: 0000000000000000
> [ 3950.811741] x17: 0000000000000000 x16: ffffae52d36ae5d0 x15: 000000001ba8e890
> [ 3950.818847] x14: 0000000000000000 x13: 0000000000000000 x12: 0000005fffffffff
> [ 3950.825952] x11: 0000000000000001 x10: ffff00400d761b90 x9 : ffffae52d365b198
> [ 3950.833058] x8 : 0000280000000000 x7 : 000000002f7d0018 x6 : ffffae52d5198548
> [ 3950.840164] x5 : 000000002f7d1000 x4 : 0000000000000018 x3 : ffff204016735060
> [ 3950.847269] x2 : 0000000000000040 x1 : 0000000000000000 x0 : ffff8000845bd018
> [ 3950.854376] Call trace:
> [ 3950.856814]  acpi_os_write_memory+0x108/0x150 (P)
> [ 3950.861500]  apei_write+0xb4/0xd0
> [ 3950.864806]  apei_exec_write_register_value+0x88/0xc0
> [ 3950.869838]  __apei_exec_run+0xac/0x120
> [ 3950.873659]  __einj_error_inject+0x88/0x408 [einj]
> [ 3950.878434]  einj_error_inject+0x168/0x1f0 [einj]
> [ 3950.883120]  error_inject_set+0x48/0x60 [einj]
> [ 3950.887548]  simple_attr_write_xsigned.constprop.0.isra.0+0x14c/0x1d0
> [ 3950.893964]  simple_attr_write+0x1c/0x30
> [ 3950.897873]  debugfs_attr_write+0x54/0xa0
> [ 3950.901870]  vfs_write+0xc4/0x240
> [ 3950.905173]  ksys_write+0x70/0x108
> [ 3950.908562]  __arm64_sys_write+0x20/0x30
> [ 3950.912471]  invoke_syscall+0x4c/0x110
> [ 3950.916207]  el0_svc_common.constprop.0+0x44/0xe8
> [ 3950.920893]  do_el0_svc+0x20/0x30
> [ 3950.924194]  el0_svc+0x38/0x160
> [ 3950.927324]  el0t_64_sync_handler+0x98/0xe0
> [ 3950.931491]  el0t_64_sync+0x184/0x188
> [ 3950.935140] Code: 14000006 7101029f 54000221 d50332bf (f9000015)
> [ 3950.941210] ---[ end trace 0000000000000000 ]---
> [ 3950.945807] Kernel panic - not syncing: Oops: Fatal exception
>
> We need to fix it first.

Hi shuai xue,

Sorry for my late reply. Thank you for the review.
To clarify the issue:
This problem was introduced in v6.18-rc1 via a suspicious ARM64
memory mapping change [1]. I can reproduce the crash consistently
using the v6.18-rc1 kernel with this patch applied.

Crucially, the crash disappears when the change is reverted — error
injection completes successfully without any kernel panic or oops.
This confirms that the ARM64 memory mapping change is the root cause.

As noted in the original report, the change was reverted in v6.19-rc1, and
subsequent kernels (including v6.19-rc1 and later) are stable and do not
exhibit this problem.

reproduce  logs:
[  216.347073] Unable to handle kernel write to read-only memory at virtual address ffff800084825018
...
[  216.475949] CPU: 75 UID: 0 PID: 11477 Comm: sh Kdump: loaded Not tainted 6.18.0-rc1+ #60 PREEMPT
[  216.486561] Hardware name: Huawei TaiShan 2280 V2/BC82AMDD, BIOS 1.91 07/29/2022
[  216.587297] Call trace:
[  216.589904]  acpi_os_write_memory+0x188/0x1c8 (P)
[  216.594763]  apei_write+0xcc/0xe8
[  216.598238]  apei_exec_write_register_value+0x90/0xd0
[  216.603437]  __apei_exec_run+0xb0/0x128
[  216.607420]  __einj_error_inject+0xac/0x450
[  216.611750]  einj_error_inject+0x19c/0x220
[  216.615988]  error_inject_set+0x4c/0x68
[  216.619962]  simple_attr_write_xsigned.constprop.0.isra.0+0xe8/0x1b0
[  216.626445]  simple_attr_write+0x20/0x38
[  216.630502]  debugfs_attr_write+0x58/0xa8
[  216.634643]  vfs_write+0xdc/0x408
[  216.638088]  ksys_write+0x78/0x118
[  216.641610]  __arm64_sys_write+0x24/0x38
[  216.645648]  invoke_syscall+0x50/0x120
[  216.649510]  el0_svc_common.constprop.0+0xc8/0xf0
[  216.654318]  do_el0_svc+0x24/0x38
[  216.657742]  el0_svc+0x38/0x150
[  216.660996]  el0t_64_sync_handler+0xa0/0xe8
[  216.665286]  el0t_64_sync+0x1ac/0x1b0
[  216.669054] Code: d65f03c0 710102ff 540001e1 d50332bf (f9000295)
[  216.675244] ---[ end trace 0000000000000000 ]---

[1] https://lore.kernel.org/all/20251121224611.07efa95a@foz.lan/

Best regards,
Junhao.


