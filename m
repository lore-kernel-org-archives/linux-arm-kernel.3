Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23EDC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 02:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svFL5GVsyMxjyZIfVZFUtOkSOeDAIlVTUrJgAyi3XSk=; b=qzOzyA4pNe9wRDma/ClKb74Rgm
	YsbVvdPj2jdIq52MjrxVsQL3NYOE5Kb55duZT9cbw5W2gmQs86oosdlwGJrUmtJEDV5l3jzB1UyDB
	c/F3dQwEXh0viJhDP8/INrR52CzEYGbvHT0E9xwm6OGHEQhsccouaODupYgephYn4mgdkT15iicsI
	6AiIm6YGHYVVLBe2Uj2BeydxJbWO9HZY5Mf4YmwAtkYz9fgmhfbd7tpCbJxvRrVZUjUTGSR9Lvb2O
	2h5m6PwnGOjVuJBenF+R9+QgqiIkt5Dx7tegh0QLpicPJsrifsV/fsVA21wtBMAeN2ivO760NcBF1
	RrKplutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Jw1-00000000t9C-2RIN;
	Fri, 04 Sep 2026 02:45:45 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Jvx-00000000t8r-0zxq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 02:45:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=svFL5GVsyMxjyZIfVZFUtOkSOeDAIlVTUrJgAyi3XSk=;
	b=cINy1kgFclwLdhJA3KbeBlH1oUeCPoLQa8e/26fjaRkyyiDD2TOnlfdkf6We6uYk4b6fV6AC9
	n6/JPCwwZa0Gxdh72Ayfj8EX49k2wnXcSM4NG5FbTbIh2awM3Rh598vgapeiOnJoEE4Vlr6ImR8
	ajTzc6Un2pGtwVwidjVZTcQ=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hbgXS4jZgzLlXF;
	Fri,  4 Sep 2026 10:34:32 +0800 (CST)
Received: from kwepemo100012.china.huawei.com (unknown [7.202.195.139])
	by mail.maildlp.com (Postfix) with ESMTPS id B080840578;
	Fri,  4 Sep 2026 10:45:23 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemo100012.china.huawei.com (7.202.195.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 4 Sep 2026 10:45:22 +0800
Message-ID: <4f755a7f-0a55-4292-892a-28346ed235a4@huawei.com>
Date: Fri, 4 Sep 2026 10:45:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] perf/core: sched_task() dispatch and branch entry
 fixes
To: Puranjay Mohan <puranjay@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de
 Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James
 Clark <james.clark@linaro.org>, Usama Arif <usama.arif@linux.dev>, Will
 Deacon <will@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Ravi
 Bangoria <ravi.bangoria@amd.com>, Thomas Gleixner <tglx@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, <x86@kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <bpf@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260810133540.1947118-1-puranjay@kernel.org>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <20260810133540.1947118-1-puranjay@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo100012.china.huawei.com (7.202.195.139)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_194541_743846_98A4F46F 
X-CRM114-Status: UNSURE (   9.97  )
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

Hi Puranjay,

On 8/10/2026 9:35 PM, Puranjay Mohan wrote:
> These three fixes were found while adding BRBE support for
> bpf_get_branch_snapshot() on arm64 and were carried in that series until
> v6 [1]. They do not depend on it, so they go on their own; the version
> number continues from that series to avoid two numbering schemes for the
> same patches.
perf record -C <cpu> -b [<command>] triggers a NULL pointer dereference
in armv8pmu_sched_task().

Commit fa9d27773873 ("perf: arm_pmu: Kill last use of per-CPU cpu_armpmu
pointer") changed armv8pmu_sched_task() from reading the per-CPU
cpu_armpmu variable to dereferencing pmu_ctx->pmu via
to_arm_pmu(pmu_ctx->pmu). Meanwhile, commit bd2756811766 ("perf:
Rewrite core context handling") made __perf_pmu_sched_task() pass
cpc->task_epc to pmu->sched_task(). cpc->task_epc is only non-NULL
while a task context is scheduled in; CPU-bound events do not schedule a
task context, so cpc->task_epc stays NULL. The NULL argument is dereferenced
and crashes.

With the patches applied, perf record -C <cpu> -b no longer crashes,
and system-wide perf record -b -e <event> -a alongside a task-bound event
on a different CPU runs without any WARN_ON.

Tested-by: Yifan Wu <wuyifan50@huawei.com>


