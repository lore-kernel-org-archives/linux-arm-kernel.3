Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF99AF44868
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqL1GrdEAJcl9acbfnmWZiJ733NBeYHp8APhAnCH1ek=; b=S07XhI7yDT1Z4yHRBDuQnGzgnt
	i0bQlGEqJcGlJfr/5RfPFEeBXLY0JRgRwyiHC5Y3OZFeRqz7cdOGCXxkthvN12ERXefEUYvdN+1MM
	4U6d170LxmsF3RK72sAPQGNtKyE3eTt7hOMW0qmwm8oDB1C0e/geLaEdpqEh72mIYNSDJQiLGw8ba
	AXyyBJ4fhY0kp0RWX13UuG7dx2pdkqfhqeDIAoN7pxIRoYJicjDeYrHBIO9stBAXEP8xKuV/XBTyS
	TczoU9FqJcQOcJOgaCP3/CU6wkOk0K1hw1TpBPXyjd+X3FQgstRA5R+yXXNZAGupQ7+9OyFpC6umL
	JDo7G7xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBvJ-0000000CJuE-3Ff5;
	Fri, 10 Apr 2026 13:29:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBvG-0000000CJts-3y69
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:29:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8F7940728;
	Fri, 10 Apr 2026 13:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347F1C19421;
	Fri, 10 Apr 2026 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775827761;
	bh=BGTVhOVa+Fdq7E52HiKwBfIFKgu77QwjCb2aXOQf+Ws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lz3e7crtUJ7MuP6SM2Vx3dNuc7GOeW4ksMX1JVpBZY0vOH3PfyBr/8ho2CDhwu9nm
	 ojGoibQSGNm8/3W2av8EBOabOBZdX0DPf4dmTgWp1beeYIK03Q/pUKcx0LYuE11fgu
	 kDGFZ4Bof7AAQUUtXjLoycQKPFY3ZLvSDzMQxRnPLUut0+TUHENXf3DDwAB2hCgoEq
	 SSUT00TR1RUZyfzZJWbdBuYu+iV0qRuXh7YXt1RQnlyHMxa6tjvVTbPeDwRWKMdi3+
	 nmAPqnMaJzMcITQMPPShhTDjBJUaP5AZhvJYbXHmUed3/UJ1XC/SFkAQA/rCp7K/Cl
	 +M3elzl8XckDg==
Message-ID: <40f31e5a-7161-4b17-af03-52b3a28a113e@kernel.org>
Date: Fri, 10 Apr 2026 15:29:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] mm: improve large folio readahead and alignment
 for exec memory
Content-Language: en-US
To: Lorenzo Stoakes <ljs@kernel.org>, Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
 willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc,
 jack@suse.cz, ajd@linux.ibm.com, apopple@nvidia.com, baohua@kernel.org,
 baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com,
 dev.jain@arm.com, kees@kernel.org, kevin.brodsky@arm.com,
 lance.yang@linux.dev, Liam.Howlett@oracle.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, mhocko@suse.com, npache@redhat.com,
 pasha.tatashin@soleen.com, rmclure@linux.ibm.com, rppt@kernel.org,
 surenb@google.com, Al Viro <viro@zeniv.linux.org.uk>, ziy@nvidia.com,
 hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev,
 leitao@debian.org, kernel-team@meta.com
References: <20260402181326.3107102-1-usama.arif@linux.dev>
 <803a0c15-0a6a-4c00-b6b3-eaae56d5fc15@linux.dev> <adjkCOiLgZ_-zovg@lucifer>
 <adjllNan2vgBNBHJ@lucifer> <5f99b289-629c-47c4-bef0-966d6678a2a8@linux.dev>
 <adjrKwgiZwXR9epk@lucifer>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <adjrKwgiZwXR9epk@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_062923_029185_089EA758 
X-CRM114-Status: GOOD (  20.18  )
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

On 4/10/26 14:24, Lorenzo Stoakes wrote:
> On Fri, Apr 10, 2026 at 01:19:08PM +0100, Usama Arif wrote:
>> >> Thanks, Lorenzo
>> >
>> > (Note that we're in a 'quiet period' from here until -rc1 of next cycle and
>> > won't be taking anything new until then. We plan to do this from around rc5 or
>> > rc6 of each cycle in future).
>>
>> Thanks! Just wanted to check, as I am always confused about this. Is it ok
>> to send patches for review for next release at this time? So that they
>> are in a good state when rc1 comes. I wanted to send PMD swap entries
>> for review after I am finished testing, but I want them for review for
>> next release.
> 
> I think different people have different views on that :)
> 
> I mean it's debateable whether having a glut of new material on day one of -rc1
> is preferable to having a bunch come in that might or might not get lost along
> the way :)
> 
> I personally feel it'd be better to send during the cycle window rather than
> before but I suspect others disagree with that!
> 
> So from your point of view, feel free to do what you like, but maybe David +
> others would want to chime in with their opinions?

For me the more important part of the quiet period is that patches can't be
merged, so there's less urgency to review them immediately. So I think it's
fine to still send patches, but not having expectations about quick
response, as people might be taking time off.

On the other hand it would be better if new series could mature in this
quiet period, so there would be less work after rc1. But the key to making
that possible I think is to feel less urgency/being overwhelmed also in the
non-quiet period (rc1-rc5/6). Then it's should be less necessary to take
time off during the quiet period. So hopefully we'll get there through
involving more reviewers, and by having more submaintainers agency.

Vlastimil

