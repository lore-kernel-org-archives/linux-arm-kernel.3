Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554E2FC9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 01:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEbq7+B9siae4mtuT/OYYL/NsKQtpMVr0am+LjM7dGw=; b=Mkn7e5u5l9HKq0Erz0qaNZ4HnZ
	P+bX5mii0f9tCtQav+FA9m7BKKv1kkcq6QFpgfjLHcBTQWYbVNwxTEu6KX+ZwjjbexuHcLrmuz5SW
	YC21DrJPrVq9clvicCyIThmMNEA/C2FV9QUp4W3HQ2vgizzqZUz5yaU1Y7l8qsdeCAOdyaEM2eSHx
	CviIaovwsA0oB/5SQBQ7QrfrznEuJYG8psSOT8cn/kX8HAFyP9cbyaDO0YtVIOdwBQHAXXYeQ3OT9
	DStUqPmEpATf6Aw9FtaSLfvpPZZ9XXCfORdbfkVhLpbYHPXI2Y3UtJA7JO/n/w//v9mr0hkKvam+z
	xaaKFl9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vygU1-00000004mCB-0RlY;
	Sat, 07 Mar 2026 01:29:33 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vygTy-00000004mBY-2RPB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 01:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772846967; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=KEbq7+B9siae4mtuT/OYYL/NsKQtpMVr0am+LjM7dGw=;
	b=QnBx1UzOXjkkMsFOX8B1VvLaju/7sNVa3f5bYJUoXrWOihsgn+wINAzvjJAk5jQ6G17CBrx5h/arInur1MZGmWpsBkLrydpNFfGnIyt95qYVmih3e9r9FE1/8PEk05z/acrreButZdXywFwUXPSIDt7UET48SV19jGmcIAximnI=
Received: from 30.42.98.36(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-OMk1T_1772846963 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 07 Mar 2026 09:29:24 +0800
Message-ID: <0fb36b71-d9b9-4a43-a13c-463469fb202f@linux.alibaba.com>
Date: Sat, 7 Mar 2026 09:29:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] support batched checking of the young flag for
 MGLRU
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 hannes@cmpxchg.org, zhengqi.arch@bytedance.com, shakeel.butt@linux.dev,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
 <20260306152042.8516ec644e95e9a23df30e5f@linux-foundation.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260306152042.8516ec644e95e9a23df30e5f@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_172930_793295_0B40B515 
X-CRM114-Status: UNSURE (   9.60  )
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



On 3/7/26 7:20 AM, Andrew Morton wrote:
> On Fri,  6 Mar 2026 14:43:36 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> 
>> This is a follow-up to the previous work [1], to support batched checking
>> of the young flag for MGLRU.
>>
>> Similarly, batched checking of young flag for large folios can improve
>> performance during large-folio reclamation when MGLRU is enabled. I
>> observed noticeable performance improvements (see patch 5) on an Arm64
>> machine that supports contiguous PTEs. All mm-selftests are passed.
> 
> Thanks, I updated mm-new with this.
> 
>> Changes from v2:
>> v2: https://lore.kernel.org/all/cover.1772185080.git.baolin.wang@linux.alibaba.com/
>>   - Update the commit message of patch 5 (per David).
>>   - Fix some coding style issues (per David).
>>   - Remove 'cur_pte' variable in lru_gen_look_around() (per David).
>>   - Move 'ptes += nr;' to the suitable place in folio_referenced_one() (per David).
>>   - Add acked tag from David. Thanks.
>>
> 
> Here's how v3 altered mm.git:

Thanks Andrew. LGTM.

