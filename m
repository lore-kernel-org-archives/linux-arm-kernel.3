Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2891CE6BF33
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 01:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I724FHP9bHMBxRJmzzeWHFpJXS4ju6lTv7pjaWoConw=; b=ZkxmRohbh3whd+00joneULEDE0
	sN7P3R5bqlhgH0dI25pvGcHIAIczR0uqV4/S3MJZBFgV9txyi1KjrLlCLhJq6oEqD015J/RS6i0QR
	JsT0AmuUlaRLGkTb2ZuYHxGm7pPQTTIGcWZAIS05nBABBckfJT+McgSQEr5CSUs0GHKhKJqlCiHla
	RgDu7nZe9WENgE2dd7C9sJD2sIzzS3zfNaYZL/Xztkuv6ip0/IT+WSyWMOEuzt/kA6MmbSQRAmm7e
	9vR2xtV7bZPkGENZAW8f/YVrKC+GzciQ8IvddbBCbgKKL6nj0E+zVJyV1YVv5nXXFP6/vzrIKHdpj
	47YiOtAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm06U-00000002Cer-3Qto;
	Sat, 31 Jan 2026 01:48:50 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm06S-00000002CeX-0yvp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 01:48:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=I724FHP9bHMBxRJmzzeWHFpJXS4ju6lTv7pjaWoConw=;
	b=HCX3tgfcqmG9JPEPW+kfsIzNV7Bd+oulcnGPAAoY+A2vZFtGUOD+gHFUTmRJW/J3392qiTZgk
	FWg7lPTfrKPwr/N0Vjun2wkCae1S5IvHzqLs4B06H0iMpdGWEz2YRUjJB6ZsIWCXkffPEOYNv9n
	1+tUpdBYcXLI/+S1LKfUzJs=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f2wgF4pYjzLlSd;
	Sat, 31 Jan 2026 09:45:13 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A43640565;
	Sat, 31 Jan 2026 09:48:42 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 31 Jan 2026 09:48:41 +0800
Message-ID: <be50aec4-336b-5bb3-e8dc-7f5cd12b43d2@huawei.com>
Date: Sat, 31 Jan 2026 09:48:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v11 13/14] entry: Inline syscall_exit_work() and
 syscall_trace_enter()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <peterz@infradead.org>,
	<luto@kernel.org>, <shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<kevin.brodsky@arm.com>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <mark.rutland@arm.com>,
	<anshuman.khandual@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-14-ruanjinjie@huawei.com> <87qzr7l858.ffs@tglx>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87qzr7l858.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_174848_456963_D62BA9C2 
X-CRM114-Status: UNSURE (   4.90  )
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



On 2026/1/30 18:14, Thomas Gleixner wrote:
> On Wed, Jan 28 2026 at 11:19, Jinjie Ruan wrote:
>> After switch arm64 to Generic Entry, a new hotspot syscall_exit_work()
>> appeared because syscall_exit_work() is not inlined, so inline
>> syscall_exit_work(). Also inline syscall_trace_enter() to align with
>> syscall_exit_work().
> 
> Has the same collision problem. I can pick that up and massage it on top
> of the pending time slice changes. Let me give it a test ride on x86...

Thank you very much, hopefully we'll see similar good results there too.

> 

