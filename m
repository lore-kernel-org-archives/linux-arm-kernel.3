Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA078D46BE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ozQXOHXvtQuF4Vzt0ntyV+NPGSwkEALzq+rw9H3FRc=; b=rwSa73NLeEgsuhE92fg3upGsts
	LuzRfYYSqfPNLJUu17Q66IVBjC66rSiifvQIRnJbyQyTdYxtJFLOO5lwb0ASPh7Dei6uUGbFlbqg/
	KsjtndDQF3TQv9+XR+06OG4t9ASK1I8/qoG2bYDAKEsmhjW9l8jG+Gfesl2tI8/tPqjn6mX3lsqhG
	tpgTsXsU1Zsn31Sb17xhPzt4ReSrUZmUBr0+TQE7Bjjh5OAG4NRxHkAEgdk+QBCB71m26NAfLeLJD
	jL4SJ+FqEh0nMeLB4jjNKaZMuXsPpCXVT8sYyJ62TB3hdeMLBs6fDRllMsbqama3Vkq0G5v5fDdTl
	euX1ABmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Qj-0000000GVNb-3Zf5;
	Wed, 28 Jan 2026 17:34:13 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Qh-0000000GVIM-0c5l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:34:12 +0000
Message-ID: <a10afa70-29b7-48ab-b241-8b0f602abe2f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769621633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ozQXOHXvtQuF4Vzt0ntyV+NPGSwkEALzq+rw9H3FRc=;
	b=uY2/PtmTw/9BwPivyf1nZfOzbC8E99t8ADk6GgnTUqPT4lIwNKg2C75dwdIlsJLf40K3N8
	0BJrqxKHaAZV9d+NovCaCz8zMMVlVOnWArddOz7q6bpfj+ncxX+rhmlDQcpmxGFZ1nG4xi
	nsSt379RaIKWU4gIZN3fo3zz7630mto=
Date: Wed, 28 Jan 2026 09:33:44 -0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Add bpf_arch_supports_fsession()
To: Chris Mason <clm@meta.com>, bot+bpf-ci@kernel.org, bpf@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 xukuohai@huaweicloud.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, menglong8.dong@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com,
 martin.lau@kernel.org
References: <20260128150112.8873-2-leon.hwang@linux.dev>
 <e64c4137e7f262e6fdab272e8ee44c8a129a36eb6d0186914375d6ba20d88474@mail.kernel.org>
 <65231eeb-1f00-4af2-9234-a290ea3f6585@meta.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <65231eeb-1f00-4af2-9234-a290ea3f6585@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_093411_329881_F1E9DD03 
X-CRM114-Status: GOOD (  10.07  )
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

On 1/28/26 7:35 AM, Chris Mason wrote:
> 
> 
> On 1/28/26 10:26 AM, bot+bpf-ci@kernel.org wrote:
>>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>>> index 5a075e06cf..070ba80e39 100644
>>> --- a/arch/x86/net/bpf_jit_comp.c
>>> +++ b/arch/x86/net/bpf_jit_comp.c
>>> @@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
>>>  {
>>>  	return true;
>>>  }
>>> +
>>> +bool bpf_jit_supports_fsession(void)
>>        ^^^^^^^^^^^^^^^^^^^^^^^^^^
>> This is the actual function name in the code.
> 
> Ihor, I think the script parsing review-inline.txt chopped off the
> part of the review where AI was complaining about the commit message?

This is the email body pre-processing in KPD, yes.

At some point we decided to remove the commit message before sending
an email, but now that AI reviews the messages too, I think we should
just send the generated review-inline.txt as is.

Alexei, wdyt?

> 
> [...]
> 


