Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DB1CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75mN+9VZdw4CLEq0UoX/nuXZgFL03Q5pomSFYWw9c2o=; b=To3r3Ab9bu6u6IWvJw7oTohvr5
	kfoYAiJOeoE7TIJTzKNvmYeGKSnlVLqF1oqWKlPjhaKLmb4ESB/FKjQnYYU3dedHWfWzhp2iMPGwq
	izVYbTyzF/Ryr2jlZB1DpkYYEiFSfZxwV7CRUzHIpAiHqEYWXE9I3sBirdIXXFIQ5HMJ8dwUki0d6
	dPl5egYXRuFJOw5GBofxwmGtPQruDI7cZcJjRqUF+8iqTfVd0WByuLVwsIqyO/qMouCuNPeTUnKwX
	o5nagElzD2r/6DL5puI71UdnWBzuN65b88xQHaVjPwQw/i6r+3llLpZa9pjoTLVGIKpjI1YFkYEOK
	Fl0/qGow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysrN-0000000C4Lo-2paB;
	Wed, 17 Sep 2025 14:10:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysrK-0000000C4JQ-3x6S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:10:12 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758118208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=75mN+9VZdw4CLEq0UoX/nuXZgFL03Q5pomSFYWw9c2o=;
	b=ZKpSI+WPydnrumYQ7gxnajAs+lz48YaqiNN3+WhYNwWXlUic0xCBsG6f6GfE8taQbHcIgJ
	h7Kh1tpSx++CpIjdk2mOz5C8qrezCvij4Bk8iMJhmpa16eSQBcomARzZeXmkJinMK6glwU
	/UoCFWaheNWZeinES9gkwAgNZHQGwrhZjReOwblCiBhi00hbE5NYnMlrnONnM1S91JYtLJ
	5CckReOcFW3rJ1+heNZD7lLCRl+2mHJx7WPMA6JZ7bGl0gGxnrhAb0Qs6EzKVgYT+Ot1sw
	h1UyJfZDjAyn+2j60JTop8cvG2RTrlkVsVVpCCok6p2oOoIhbLO/tvfT4Jfbiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758118208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=75mN+9VZdw4CLEq0UoX/nuXZgFL03Q5pomSFYWw9c2o=;
	b=TbymsR0+lk/yBTMUwla0JPYo6VaReyftRSNu6ml7UoTThH0F5HVkZGBsfwFUiwKRK5kBjM
	+sfN3Y9Q7FzbGVAw==
To: David Hildenbrand <david@redhat.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
In-Reply-To: <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com>
Date: Wed, 17 Sep 2025 16:10:07 +0200
Message-ID: <87v7lh891c.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_071011_122086_49891A9B 
X-CRM114-Status: GOOD (  18.15  )
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

On Wed, Sep 17 2025 at 09:16, David Hildenbrand wrote:
> On 17.09.25 07:43, Eugen Hristev wrote:
>> On 9/17/25 00:16, Thomas Gleixner wrote:
>>> I pointed you to a solution for that and just because David does not
>>> like it means that it's acceptable to fiddle in subsystems and expose
>>> their carefully localized variables.
>
> It would have been great if we could have had that discussion in the 
> previous thread.

Sorry. I was busy with other stuff and did not pay attention to that
discussion.

> Some other subsystem wants to have access to this information. I agree 
> that exposing these variables as r/w globally is not ideal.

It's a nono in this case. We had bugs (long ago) where people fiddled
with this stuff (I assume accidentally for my mental sanity sake) and
caused really nasty to debug issues. C is a horrible language to
encapsulate stuff properly as we all know.

> I raised the alternative of exposing areas or other information through 
> simple helper functions that kmemdump can just use to compose whatever 
> it needs to compose.
>
> Do we really need that .section thingy?

The section thing is simple and straight forward as it just puts the
annotated stuff into the section along with size and id and I definitely
find that more palatable, than sprinkling random functions all over the
place to register stuff.

Sure, you can achieve the same thing with an accessor function. In case
of nr_irqs there is already one: irq_get_nr_irqs(), but for places which
do not expose the information already for real functional reasons adding
such helpers just for this coredump muck is really worse than having a
clearly descriptive and obvious annotation which results in the section
build.

The charm of sections is that they don't neither extra code nor stubs or
ifdeffery when a certain subsystem is disabled and therefore no
information available.

I'm not insisting on sections, but having a table of 2k instead of
hundred functions, stubs and whatever is definitely a win to me.

Thanks,

        tglx

