Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A851FCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 10:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JdWRHx/+mjb4lk/bEZQh+lQq/Mn7dxl20NhPE4u0a8=; b=AaWCmgKFYjMrugxZHhBKDZVddd
	A7TQJkx43Ot91QwIV4W48mLb/lGlspj5m0DS5i6ZbrTFHzfQm2uLR2Mf+2CBHx5f3NCyb4vJgaV8O
	K6vJpUwmUn3Wdpa7gorZ+NuT9r/CMCOv21zSKORYeJjnP3IsMokwMyrZDVUxUTaEcnoxa7TPK6Mb5
	hZyVPvp6esL01Bhega7ClALClBU6+RPfU7s1gsrwZzxi8zjhVFkBPBa8Fm4f9ASyUnSXSUqCbK5W1
	Ckhpm18TAzW8XYO0sMhRRsQfCMg9H09kpJ1fSF5VZXtKx3AeYR1KF0S+aX+hhp4AupUUKnkY5ujwr
	Xd4I/ZQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIXD-00000006EvJ-1jHK;
	Fri, 08 May 2026 10:34:19 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIX9-00000006EuA-2J1l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 10:34:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7JdWRHx/+mjb4lk/bEZQh+lQq/Mn7dxl20NhPE4u0a8=;
	b=yL728+GjveI/7wInsJjt/gcfZQk2qXvQqxMjMWoY+uOU8Y9XpIuypecPeH6DdVnEsq9gXyEby
	NuYxevfHDp+EciXq6PeegBkkJ6U8RFwG+M1u4miK2SlSOWAy44HFaSb9agtEv6AtCBVbURVLVba
	LUwwnGgBUuTX3Ne5Lhvu5Iw=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gBlf04XNVzLlX9;
	Fri,  8 May 2026 18:26:32 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A53940562;
	Fri,  8 May 2026 18:34:06 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 May 2026 18:34:06 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 8 May 2026 18:34:04 +0800
Message-ID: <4d7b9ce3-15e4-414b-87cf-85a6338b69ab@huawei.com>
Date: Fri, 8 May 2026 18:34:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yushan Wang <wangyushan12@huawei.com>
Subject: Re: [RFT PATCH v2 3/7] perf-x86: iostat: Move iostat arch-specific
 implementation to util
To: Ian Rogers <irogers@google.com>
CC: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<adrian.hunter@intel.com>, <james.clark@arm.com>, <john.g.garry@oracle.com>,
	<will@kernel.org>, <mike.leach@arm.com>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<jic23@kernel.org>, <leo.yan@linux.dev>, <robin.murphy@arm.com>,
	<linuxarm@huawei.com>, <hejunhao3@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>
References: <20260507063737.3542950-1-wangyushan12@huawei.com>
 <20260507063737.3542950-4-wangyushan12@huawei.com>
 <CAP-5=fV5WiyB3mghvns1ZW6ewS0=CP4nx+f_ggLgECkqv7VWww@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAP-5=fV5WiyB3mghvns1ZW6ewS0=CP4nx+f_ggLgECkqv7VWww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_033416_060927_89EEC855 
X-CRM114-Status: GOOD (  11.56  )
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

 On 5/7/2026 11:35 PM, Ian Rogers wrote:
> On Wed, May 6, 2026 at 11:37 PM Yushan Wang <wangyushan12@huawei.com> wrote:
>>
>> To support cross-platform iostat capabilities, like record/report on
>> different platforms, architecture-specific implementation of iostat
>> should be moved out of arch directory to get built. Build scripts are
>> changed accordingly.
>>
>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>> ---
>>  tools/perf/arch/x86/util/Build                           | 1 -
>>  tools/perf/util/Build                                    | 1 +
>>  tools/perf/{arch/x86/util/iostat.c => util/x86-iostat.c} | 0
>>  3 files changed, 1 insertion(+), 1 deletion(-)
>>  rename tools/perf/{arch/x86/util/iostat.c => util/x86-iostat.c} (100%)
>
> To avoid cluttering up tools/perf/util, would it make sense to create
> a "tools/perf/util/iostat-arch" directory similar to  annotate-arch,
> dwarf-regs-arch, kvm-stat-arch and perf-regs-arch?
>
> Thanks,
> Ian

Yes, I can do that in the next version.

In fact, as what latter comments addressed, I think merging these iostat
handlers into one source file to avoid redundancy may be better.

Thanks,
Yushan

>

