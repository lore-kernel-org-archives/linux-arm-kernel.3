Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB3BEC01A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRpfkon01fXZerM9f0oDAjGQYFsh+lno7ysvy+gZQfE=; b=tg9Nt3c2viBY25FfzxRvzdoklO
	KzBccXDHmvSFLVgRottWxvUI6ud0zTnVOcyzsO5u83/L6q3bw5C0Kel0TeVQXS69P46HX9PtmgK7z
	HOfgm12/qRO1qYWbSW9xD+iHYBc5LT+jGfHdZQEX/upIYOJqTndF5FX03YJJyGaaGqqsl2IsTbVzi
	Zsd5PSKkCl+694lpSlZoAUNl33VCPbao30i69z/e2S9Kb41Jct/3546uPcDYoZhf/+EeCQ5IVfad2
	5koHyfrMmzFw2Ggux66Q9T9Ym1yU+CoNQ3fajoZ19x6KIflBUA429JnkWCRtrrwbnKPuok9iC8amx
	z1rjrc1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bQs-0000000GMLt-3Ayb;
	Mon, 23 Mar 2026 09:18:46 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bQq-0000000GMLW-1Cd5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:18:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HRpfkon01fXZerM9f0oDAjGQYFsh+lno7ysvy+gZQfE=;
	b=FT0XodMsuHQhxMnfOLpu4iF+2ZEWCWYNaeoyTtSVuec7tYj8fMsqZ2u8B0SXFEhYP9l1j7NfO
	ZHJOwowzIjTMPFL7ObOna0gJrfSMVf0wejCAjtNcaATAPGoW+g2Wi87EbXOnZib8qCSi9QKbPlg
	IBeQEZejAjAaz+FQuFnSd/Y=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4ffSBQ6TgBz1T4JY;
	Mon, 23 Mar 2026 17:13:02 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 2987740567;
	Mon, 23 Mar 2026 17:18:31 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Mar 2026 17:18:30 +0800
Message-ID: <076199c7-265a-4c24-9e8b-964af10931e2@huawei.com>
Date: Mon, 23 Mar 2026 17:18:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 1/9] selftests/resctrl: Move CPU affinity and resctrl
 FS setup to child process
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260304040334.765860-2-wuyifan50@huawei.com>
 <33a9c54d-565b-4de9-b525-1390bfd50593@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <33a9c54d-565b-4de9-b525-1390bfd50593@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_021844_705615_1D928EE4 
X-CRM114-Status: GOOD (  38.62  )
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

Hi Reinette,

On 3/13/2026 4:53 AM, Reinette Chatre wrote:
> Hi Yifan,
>
> On 3/3/26 8:03 PM, Yifan Wu wrote:
>> 3. Since only the child process is monitored, the CPU affinity should
>> also be set only on the child process to ensure that the PMU (Performance
>> Monitoring Unit) can count memory bandwidth from the benchmark process.
> A child process inherits its parent's CPU affinity mask, no?
>
>> 4. When the parent and child processes are scheduled on the same CPU,
>> the parent process's activity may interfere with the monitoring of
>> the child process. This is particularly problematic in some ARM MPAM
> Which tests are encountering issues? For MBM and MBA I do not think this
> matters since the tests just compare perf and resctrl numbers and perf
> will already contain all bandwidth associated with the PMU so isolation here
> may require to potentially take all traffic off a socket.
> CMT tests may see some impact since it compares cache occupancy to the
> size of the buffer being read. I do have a pending series that aims to
> address some issues with the CMT test:
> https://lore.kernel.org/linux-patches/cover.1772582958.git.reinette.chatre@intel.com/
>
>> implementations, where memory bandwidth monitoring real-time values. When
>> the child process is preempted off the CPU, this results in inaccurate
>> monitoring.
> This motivation is not clear to me. Could you please elaborate how inaccurate
> this monitoring gets? The child process may be preempted but it should not be
> moved from the CPU in its affinity mask.
The bandwidth monitoring feature on certain systems only ensures
that tasks currently scheduled to the CPU are correctly counted by the
hardware. The counters for tasks that have been scheduled out of the CPU
will be out of date. Therefore, separating parent and child processes
to run on different CPUs can ensure that bandwidth monitoring correctly
counts the real-time bandwidth. This approach also works on other systems.
>> This commit moves the CPU affinity and resctrl FS setup to the child
>> process after fork(), ensuring these settings only affect the benchmark
>> process, thereby maintaining measurement accuracy and making the
>> implementation more portable across platforms.
>>
>> Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
>> ---
>>   tools/testing/selftests/resctrl/resctrl_val.c | 68 +++++++++++--------
>>   1 file changed, 39 insertions(+), 29 deletions(-)
>>
>> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
>> index 7c08e936572d..85ac96c7cb8f 100644
>> --- a/tools/testing/selftests/resctrl/resctrl_val.c
>> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
>> @@ -545,7 +545,6 @@ int resctrl_val(const struct resctrl_test *test,
>>   	cpu_set_t old_affinity;
>>   	int domain_id;
>>   	int ret = 0;
>> -	pid_t ppid;
>>   
>>   	if (strcmp(param->filename, "") == 0)
>>   		sprintf(param->filename, "stdio");
>> @@ -556,22 +555,10 @@ int resctrl_val(const struct resctrl_test *test,
>>   		return ret;
>>   	}
>>   
>> -	ppid = getpid();
>> -
>> -	/* Taskset test to specified CPU. */
>> -	ret = taskset_benchmark(ppid, uparams->cpu, &old_affinity);
>> -	if (ret)
>> -		return ret;
>> -
>> -	/* Write test to specified control & monitoring group in resctrl FS. */
>> -	ret = write_bm_pid_to_resctrl(ppid, param->ctrlgrp, param->mongrp);
>> -	if (ret)
>> -		goto reset_affinity;
>> -
>>   	if (param->init) {
>>   		ret = param->init(param, domain_id);
> write_bm_pid_to_resctrl() does more than just write the task ID to the tasks file,
> it also creates the resource groups in its parameters. By moving it after the
> param->init() callback it prevents any test specific initialization from
> being done in the test's resource groups.
>
I see. Since mbm_total_path, which is used in the parent process during
param->measure(), is initialized in initialize_mem_bw_resctrl(), we
cannot move param->init() to the child process. However, we can perform
the test-specific resource group configuration in param->setup(), as we
did in mba_setup().

>>   		if (ret)
>> -			goto reset_affinity;
>> +			return ret;
>>   	}
>>   
>>   	/*
>> @@ -586,10 +573,8 @@ int resctrl_val(const struct resctrl_test *test,
>>   	if (param->fill_buf) {
>>   		buf = alloc_buffer(param->fill_buf->buf_size,
>>   				   param->fill_buf->memflush);
> This is the buffer on which the workload will operate and by having
> different CPU affinity between parent and child the buffer may be created in a
> separate domain.
>
> Consider for example if I apply just this patch on a test system and try out the
> MBM test it now fails:
> 1..1
> # Starting MBM test ...
> # Mounting resctrl to "/sys/fs/resctrl"
> # Benchmark PID: 6127
> # Writing benchmark parameters to resctrl FS
> # Write schema "MB:0=100" to resctrl FS
> # Checking for pass/fail
> # Fail: Check MBM diff within 15%
> # avg_diff_per: 100%
> # Span (MB): 1280
> # avg_bw_imc: 50
> # avg_bw_resc: 0
> not ok 1 MBM: test
>
> What happened here is that the buffer was created by the parent in one domain but
> the child's affinity was set to another domain. The test assumes that it can
> count local memory and all of those counts are zero for resctrl since the memory
> is not local. Similarly low numbers from perf for same reason.
Yeah, if the CPU affinity setting is moved to the child process, it will
also be necessary to move the memory allocation to the child process. In
addition, what about setting the mempolicy to the local domain when
setting the CPU affinity? Like this:
         if (param->fill_buf) {
                 buf = alloc_buffer(param->fill_buf->buf_size,
param->fill_buf->memflush);
                 if (!buf)
                         exit(-ENOMEM);

                 fill_cache_read(buf, param->fill_buf->buf_size, false);

@@ -559,7 +564,8 @@ int taskset_benchmark(pid_t bm_pid, int cpu_no, 
cpu_set_t *old_affinity)
         CPU_ZERO(&my_set);
         CPU_SET(cpu_no, &my_set);

-       if (sched_setaffinity(bm_pid, sizeof(cpu_set_t), &my_set)) {
+       if (sched_setaffinity(bm_pid, sizeof(cpu_set_t), &my_set) ||
+           set_mempolicy(MPOL_LOCAL, NULL, NULL)) {

>> -		if (!buf) {
>> -			ret = -ENOMEM;
>> -			goto reset_affinity;
>> -		}
>> +		if (!buf)
>> +			return -ENOMEM;
>>   	}
>>   
> While isolating just the workload to its own resource group may be reasonable it is
> not clear to me what problem this patch aims to solve.
>
> Reinette
>
Isolating the parent and child processes on different CPUs is done to
ensure that the parent process can monitor the real-time memory bandwidth
of the child process in parallel, and to ensure the correct monitoring of
the child process's bandwidth on a specific platform.

Regards,
Yifan Wu


