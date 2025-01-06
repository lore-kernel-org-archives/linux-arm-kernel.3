Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EA5E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8lTSA5py1VNeH7wK2Bn79u4g3AsD2U1AjR2tynOIls=; b=kGmHxLHDvAy4JaaNYsibrLMchh
	pBQbfO3uJ8jDuMJqnkIYJrLHY+KWtlAQ6uczEN/40Yz+D1ff1trzwvAQDCH8B59qQPUdf19bpVcIX
	7H4YyoseoatY+N+gOgZHeKDIQf3I7Uxp+ITTzRv09VPDpsSkB6IvSwUKR1YZKbCmhhi0Sfnaf9cPx
	DtKD2Ci9g/x2B0CmRNlChV4OCUxxIbV+5cHRXF3m294a0WWtVEZzLjXhU8/dVYWy2lXK1vm3loWmE
	LPs6uitqMYcnK9/JjXT4oZa+Dq5rZrO/0BemHdvg1jYB8F174elAcdxhHW+aXMBhMEyNVnYgCDpJP
	llCong0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjWn-00000000iHc-41ZW;
	Mon, 06 Jan 2025 09:36:05 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjV8-00000000hu0-1GD1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 09:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1736156058; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=M8lTSA5py1VNeH7wK2Bn79u4g3AsD2U1AjR2tynOIls=;
	b=AYv8XxWBSAyp4QZMzqL2DYg4d42PWzC0l4hIuz02h3jdzeARXvgCpiSYCpINLIo1HHadNFeFzt1UypwN83mJJ7gsdj8YdQFCSyd44AY0dUNz2dNDUtnWBTMPFGw1wKzIM1ahmyUq2oy21oXcg4hjYOHiA9daiqxgXXwiEcW2Pgw=
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WN2FNnI_1736156055 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 06 Jan 2025 17:34:16 +0800
Message-ID: <b65e145b-a754-41bb-8322-f93c24f6b7d1@linux.alibaba.com>
Date: Mon, 6 Jan 2025 17:34:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: set folio swapbacked iff folios are dirty in
 try_to_unmap_one
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, ioworker0@gmail.com, david@redhat.com,
 ryan.roberts@arm.com, zhengtangquan@oppo.com, ying.huang@intel.com,
 kasong@tencent.com, chrisl@kernel.org, Barry Song <v-songbaohua@oppo.com>
References: <20250106031711.82855-1-21cnbao@gmail.com>
 <20250106031711.82855-2-21cnbao@gmail.com>
 <e68b8279-fe16-462a-bf99-6b4d90e96904@linux.alibaba.com>
 <CAGsJ_4wMuDYxuEMcA0jYvekt26Uvz86kjWbo0nz-ZZzuiyEOQQ@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4wMuDYxuEMcA0jYvekt26Uvz86kjWbo0nz-ZZzuiyEOQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_013423_023083_CF407D28 
X-CRM114-Status: UNSURE (   9.91  )
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



On 2025/1/6 17:03, Barry Song wrote:
> On Mon, Jan 6, 2025 at 7:40 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>>
>>
>> On 2025/1/6 11:17, Barry Song wrote:
>>> From: Barry Song <v-songbaohua@oppo.com>
>>>
>>> The refcount may be temporarily or long-term increased, but this does
>>> not change the fundamental nature of the folio already being lazy-
>>> freed. Therefore, we only reset 'swapbacked' when we are certain the
>>> folio is dirty and not droppable.
>>>
>>> Suggested-by: David Hildenbrand <david@redhat.com>
>>> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
>>
>> The changes look good to me. While we are at it, could you also change
>> the __discard_anon_folio_pmd_locked() to follow the same strategy for
>> lazy-freed PMD-sized folio?
> 
> it seems you mean __discard_anon_folio_pmd_locked() is lacking
> folio_set_swapbacked(folio) for dirty pmd-mapped folios?
> and it seems !(vma->vm_flags & VM_DROPPABLE) is also not
> handled properly?

Right.

