Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE33CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUB0kHUhBy3ng5DetQ30N4vUPE1VonqsLOG2jbmUYA0=; b=qZW8YWV14e5XGBudO5n6SW/G2c
	fi7WRKaLwDlcLOKoDc/Q8uNfw8mvVuaRmVUpVI2WBsVTJUhwhm5qmbWChpvlsyGlIR2rbdWbHAAcy
	x1wk0mmXja5xMT+Nehi+zmo6bhqwaiEfQ8pZYMxBz4Ncdit64Q/YGC1aHj9CV07FAWUaKeHyageDr
	454c65AKhihrxVjy+1ZH+2EzsWMrMpNbAJ1Yo17CErkeQYlgYJ9UoegBtmmhJUHbyBAfsl6FuPSea
	kf2F6kH15BvdZf9RKVQJLzTeEOUoxt6YZ+B0BNb0Ymsv6hgbmd0lyCeAh+OjRpVR6Ri+wPTo9G/mV
	WYVGpZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCh3-000000041gQ-1STT;
	Wed, 27 May 2026 11:45:01 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCh0-000000041f2-2Wlm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 11:44:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779882295; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=oUB0kHUhBy3ng5DetQ30N4vUPE1VonqsLOG2jbmUYA0=;
	b=KWwKGZreojKOhur/byN710zgQUAeEcVHDS8delAwewiY17gUqIbgVdKuZ98YzDUtOdwp3dV8xQxOf1ITwYMy7Y19hdO8/NlTtECJ/uaHDRRyOGBycEe6lKsLFTbkCIw6vUxFd96TnHj2bw8aLpL1f3upJ7+qUtsssjISHYRYua0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=29;SR=0;TI=SMTPD_---0X3jezDI_1779882292;
Received: from 30.246.179.14(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X3jezDI_1779882292 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 27 May 2026 19:44:53 +0800
Message-ID: <8ebf43de-16c1-4798-8d48-c93390ab6df0@linux.alibaba.com>
Date: Wed, 27 May 2026 19:44:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/8] mm/hwpoison: return -EFAULT when copy fail in
 copy_mc_[user]_highpage()
To: Ruidong Tian <tianruidong@linux.alibaba.com>, catalin.marinas@arm.com,
 will@kernel.org, rafael@kernel.org, tony.luck@intel.com,
 guohanjun@huawei.com, mchehab@kernel.org, tongtiangen@huawei.com,
 james.morse@arm.com, robin.murphy@arm.com, andreyknvl@gmail.com,
 dvyukov@google.com, vincenzo.frascino@arm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, ryabinin.a.a@gmail.com, glider@google.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com, tglx@linutronix.de, mingo@redhat.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260518084956.2538442-1-tianruidong@linux.alibaba.com>
 <20260518084956.2538442-5-tianruidong@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260518084956.2538442-5-tianruidong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_044458_815612_38E47BD7 
X-CRM114-Status: GOOD (  10.92  )
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



On 5/18/26 4:49 PM, Ruidong Tian wrote:
> From: Tong Tiangen <tongtiangen@huawei.com>
> 
> Currently, copy_mc_[user]_highpage() returns zero on success, or in case
> of failures, the number of bytes that weren't copied.
> 
> While tracking the number of not copied works fine for x86 and PPC, There
> are some difficulties in doing the same thing on ARM64 because there is no
> available caller-saved register in copy_page()(lib/copy_page.S) to save
> "bytes not copied", and the following copy_mc_page() will also encounter
> the same problem.
> 
> Consider the caller of copy_mc_[user]_highpage() cannot do any processing
> on the remaining data(The page has hardware errors), they only check if
> copy was succeeded or not, make the interface more generic by using an
> error code when copy fails (-EFAULT) or return zero on success.
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Thanks.
Shuai

