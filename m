Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF0FCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhEheeaLjj12Q7mtWCuLhPIe+EYJsdjTeuBePvxpVHI=; b=R/aktFX//0+BG3lSzOzOMMLUsc
	YZE1m9c18PW8ohwYKLFBrr387bMj7T9mFRMgFbbcer0XRq8TcA/nO648SKaHgQVDH8xI3mx1jjgKz
	EY9wfzcxBnJjT1bP6+UGiEh36nDcncO+CFK2bvKyV0ZikQCE7cfx/w5gfdeYg7TFu2hVeLKNGtzin
	/Q/gMs969rk0cSXKJRMg0YM2FEvMlBfPq8EFY9StOrskQSoShXLAmt+wJwieJS2AqpjR6PW4RAQ0j
	qmYZ8z5VDAJWyvgaB/yYAca+q3fN/cm3mEU/s4Y5em/jP34zMWjEaG2zSTwyrnrQYjP6WsOn6mmtv
	GVFeH8eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9vO-0000000Ggkx-3Hda;
	Thu, 18 Sep 2025 08:23:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9vL-0000000GgjY-0Fqp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 08:23:29 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758183803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dhEheeaLjj12Q7mtWCuLhPIe+EYJsdjTeuBePvxpVHI=;
	b=3+bEKqPqOkUEh6yS9o4ChhOb1k52Ky5bVGvD9xyofVq2LCseV4zCUGvhpgXwjYxYsC5WQx
	yGf7WKJhXXYD0Ru9gsJ2HhWSCvTY8ZssNzpV3GhTySt+XxFzO6qDcVtS4jpjLDDB0sp2CG
	nZ7oWjZkVT/YcKju2TTXTEedsmjkptE8yCpJczw/jGJrnsU1+4R5P1g/EB6TKbndSV/0fJ
	UFMSz+q/92de2si2SyyiSBpZf4y843jj/KRsTtTztTQ8QK6WmaGWMuuZhfDfANJZPWZkYg
	VrBaCRba5VrbCfUUWBvx0YZ+UyvQoF7XZml/fh7TnM0nfgpAzfuBSlrL7Tr2HQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758183803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dhEheeaLjj12Q7mtWCuLhPIe+EYJsdjTeuBePvxpVHI=;
	b=MqbntZVIqi5UZvsyX/yRC/8YSYRz4x5RYd09EJQ+DsufyRhtx9gmkUl8tFF7x7EneRFTin
	SNeyNBFCRxEVhFAw==
To: David Hildenbrand <david@redhat.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
In-Reply-To: <f8d3c2d4-8399-4169-8527-3c87922f2ef1@redhat.com>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com> <87v7lh891c.ffs@tglx>
 <95ff36c2-284a-46ba-984b-a3286402ebf8@redhat.com>
 <24d6a51d-f5f8-44d7-94cb-58b71ebf473a@linaro.org>
 <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com> <87segk9az5.ffs@tglx>
 <f8d3c2d4-8399-4169-8527-3c87922f2ef1@redhat.com>
Date: Thu, 18 Sep 2025 10:23:21 +0200
Message-ID: <87jz1w88zq.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_012327_245210_90839265 
X-CRM114-Status: GOOD (  17.85  )
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

On Wed, Sep 17 2025 at 21:03, David Hildenbrand wrote:
>> As this is specific for the compiled kernel version you can define an
>> extensible struct format for the table.
>> 
>> struct inspect_entry {
>> 	unsigned long	properties;
>>          unsigned int	type;
>>          unsigned int	id;
>>          const char	name[$MAX_NAME_LEN];
>> 	unsigned long	address;
>>          unsigned long	length;
>>          ....
>> };
>> 
>> @type
>>         refers either to a table with type information, which describes
>>         the struct in some way or just generate a detached compile time
>>         description.
>> 
>> @id
>>         a unique id created at compile time or via registration at
>>         runtime. Might not be required
>
> We discussed that maybe one would want some kind of a "class" 
> description. For example we might have to register one pgdat area per 
> node. Giving each one a unique name might be impractical / unreasonable.
>
> Still, someone would want to select / filter out all entries of the same 
> "class".
>
> Just a thought.

Right. As I said this was mostly a insta brain dump to start a
discussion. Seems it worked :)

>> @properties:
>> 
>>          A "bitfield", which allows to mark this entry as (in)valid for a
>>          particular consumer.
>> 
>>          That obviously requires to modify these properties when the
>>          requirements of a consumer change, new consumers arrive or new
>>          producers are added, but I think it's easier to do that at the
>>          producer side than maintaining filters on all consumer ends
>>          forever.
>
> Question would be if that is not up to a consumer to decide ("allowlist" 
> / filter) by class or id, stored elsewhere.

Yes, I looked at it the wrong way round. We should leave the filtering
to the consumers. If you use allow lists, then a newly introduced class
won't be automatically exposed everywhere.

Thanks,

        tglx

