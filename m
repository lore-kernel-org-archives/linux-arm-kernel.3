Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4669CF55437
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 02:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8GFd9DZ5Mzak01ikJ0Ii/rzl08O/AE6cxsXIoEpx8g=; b=R3H4ecCqyFzLMYzeweQRYoZl1Z
	iIJzCSLKfnp3lFxtPpJcQ0PVnZeR1gLAWujSnUToTnwLayfR8MaY3sij5giKrhE6dA1EqS/jJeVl+
	SbjTUOqRMFcMOIuV6E1WgMgTRQzq7mJ9xffjNPFcRdot/FOZ8rMXPsaGiz5SkYW6TxbTBiE6MWsme
	7DZv4JuUditPGZlFqINKh5nToM1ZcIeAC9mmmxyHdyHJjfoSVhL6+4+zPu7YmKQpqXLgD7z94uJG9
	0ysfaLV54Tn+elTjYaWBZ/3Wm2o7ndR/Z2HPWtEBFt20nUVpUPhmkt0pqxI6BtDYcl0pBMLoLYqap
	q0FlxgvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4HA-000000034K7-25wf;
	Wed, 25 Feb 2026 02:05:20 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4H5-000000034J0-2CEk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 02:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1771985106; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=i8GFd9DZ5Mzak01ikJ0Ii/rzl08O/AE6cxsXIoEpx8g=;
	b=aKNNAPEDYP4VgKuFegy0+KfSN7EIzNLYu+WF8d3G7uxcBPY9QH9ghdbcr6bD1tGZwZQYzJug3l2q7vHw1jgFMKs/ifmUUWQNUwehoGExiXdzJYm6sxDhhffM2zp6RnurqHiqVM6eIQuTF9wwR2nDprlLAAq5EBHKryqMWiP3fT0=
Received: from 30.74.144.109(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wzkm-vc_1771985101 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Feb 2026 10:05:02 +0800
Message-ID: <04c429fe-303f-45b9-807f-7f2b745c273a@linux.alibaba.com>
Date: Wed, 25 Feb 2026 10:05:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] mm: add a batched helper to clear the young flag for
 large folios
To: Rik van Riel <riel@surriel.com>, akpm@linux-foundation.org,
 david@kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, harry.yoo@oracle.com,
 jannh@google.com, willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 hannes@cmpxchg.org, zhengqi.arch@bytedance.com, shakeel.butt@linux.dev,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1771897150.git.baolin.wang@linux.alibaba.com>
 <bfbe28e381b02452b455498e7ea82662e83a3865.1771897150.git.baolin.wang@linux.alibaba.com>
 <58e1883fe084d8284dac68dcd570f5a6c56c0abc.camel@surriel.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <58e1883fe084d8284dac68dcd570f5a6c56c0abc.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_180516_265461_39BE9EF9 
X-CRM114-Status: GOOD (  11.88  )
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



On 2/25/26 6:03 AM, Rik van Riel wrote:
> On Tue, 2026-02-24 at 09:56 +0800, Baolin Wang wrote:
>>
>> +static inline int test_and_clear_young_ptes(struct vm_area_struct
>> *vma,
>> +					    unsigned long addr,
>> pte_t *ptep,
>> +					    unsigned int nr)
>> +{
>> +	int young = 0;
>> +
>> +	for (;;) {
>> +		young |= ptep_test_and_clear_young(vma, addr, ptep);
>> +		if (--nr == 0)
>> +			break;
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +	}
> 
> This may be a nitpick, but could the --nr thing be
> stuck into the loop conditional?
> 
> Something that looks like an infinite loop just
> seems wrong for something so bounded.

It seems that people have different preferences regarding loop patterns.

The current code keeps this loop pattern consistent with other similar 
functions in the same file, as previously suggested by David [1].

[1] 
https://lore.kernel.org/all/3d5cb9a4-6604-4302-a110-3d8ff91baa56@kernel.org/

