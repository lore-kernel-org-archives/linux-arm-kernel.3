Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28067CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10t2Z6sgnABIAwDZkTB26QdFfX0ldYEILJpBIALC4NU=; b=eesqm22A5YIJ/WnhkSQGAtQXc/
	KXgbjHGrAFKYEomi8AjztiFhmb/1+gFFf1Ux5cUFRHCt4MQwfgdf+hbX+6WIEHX3eRk2IXBH+uDF0
	Xk/4GUpzMe5owsrx2rm0dtmig8h69pWHN/I2Oi2BDQf6AprPJwPv6EnZEBURUMLLx2YOnRmF4DbYQ
	/p+VaAKiQaOiROPUC+C17B91g9BQT9f/H3zm0DUFPM0hJO0VZ67xHOIJRxXwIpvGXv6W5mq0ijiBj
	AWPsvrZFP3+HfD9hXq05JO8FipjCjemc2YP2l7fKJsZY9i0IuBykbMwtlgUDvRXf0ycgKODOp3WLv
	ZI5qXfow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyt6t-0000000CCjy-2VO5;
	Wed, 17 Sep 2025 14:26:16 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyt6r-0000000CCgv-0fZ5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:26:14 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b0aaa7ea90fso436996966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119171; x=1758723971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10t2Z6sgnABIAwDZkTB26QdFfX0ldYEILJpBIALC4NU=;
        b=BZP42LPfYEgCEAlhsAChE0KVDrZmp/MgSvjrkl8NWmdQ9gJWL19+AKtxh3ZD0NPIDB
         ymWz9LomR49X7+THBMuNISQ5WhWVLkxP4EmxRJHVCMzcD4ldWAI2BDsE+yqWUptETS7r
         NhlDMnXi7VPMqwIxD0F0HUifdx5b2mEMX/N4d083ftF8Qx8+qnKmowhzGBkwpuWDF7Cy
         Vk7lvcX2juweLY3pejkFd/w4mDfqY0OIeL7OxR3T7cqWtipGOOUwo8luINM+kpYvlicx
         9Iw9pBcJVZrr1cbmiNrDDbuxYCUhMUUBRAqI02dzpumPGo0NAPRgn6MymfYg0huCe6fp
         I+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119171; x=1758723971;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10t2Z6sgnABIAwDZkTB26QdFfX0ldYEILJpBIALC4NU=;
        b=t2RdsaRb27ab4j82thpX8zUSbD97+1hxolAPphOaqV6GTJP7fUEvlUkAOSe5bdSdCq
         cU+g5lRgd6AXp1XaWoqaTr7TB1KfwWUTl+uGhnLhtMflvNpkfREKhRuujkDJGw5vmVY8
         l229OK0SqGfZGINs5pPp7KLf3vyqlsllin6DVPI87rLAuSehAdNelFx+9G1wjqEPSAz9
         ab+rRowYH3lYr+RnL0SYK77HPFuscqk79i/+RWttcIARlVGYellz1bvA6OqsF4o4NNCq
         1pnPixtLcZyzVjh+iRon/YO7IpWtnjhdZI77Xok3ZhV4dTNw0nSKA9rrk5hORGA9QrgG
         FNlA==
X-Forwarded-Encrypted: i=1; AJvYcCWY0lor5ccp2UCj/+GzGIQqCeGXcg+bSfQErlOos8YDzS4UzTKzPCdnkd7qZYPanqoeYRWprbfPurxOBOePa66Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3WbmW+pKQxOpXep6+yOiJSykK+ZjZJnowOLN6HB9TJbmYprM5
	k5xPvoPgfN6+ehLBwI5HrLGXXLfcQZgMB13Xdq8oCgq8l4g33oIsTJ0vvWOzKUbwaRM=
X-Gm-Gg: ASbGncvGXjCfBu0fe5vmf/tNXzbPlB+U8xj5if9nQglBJm4CZa4A8NAve5XBb8WOrTZ
	1ckXw9YBA7JPRAJULcGgUlP6EzJ53OdeLoglJ1fttQj74n89gjXt8A45pcOhW6ygGFOVOqoXsCP
	vUqLuyMEADWpT5dYHGbkTTiV97lgME63b5nLK99ghgufPN4sICWnnWXlTL1zzsJC/ek0RRphr5v
	6vBHMfVt2mK3gCdGGBn0QpJaib1x+Qt6YDahPQ8JTnHVSNSKUkPpEP9jB1/qR5HXh2zePZxlt0I
	0iUSY1rwaGmxOgsfllYEf2JeVyDI+xRPTEPJnyYrfm8lJoJ5/7AVEDPDYPSlF06+D7uWevayAt/
	YS18iMm67pWjnAQMLPEe8PNzHFJKThRE2LnlKO9jFMXg=
X-Google-Smtp-Source: AGHT+IEaxm2Ezs6X9pAGeZTfGiDeZKKFcv9jYxAWmPiRXScidoOV/iqJhV2uKVKOhqCyY8zfonbwMA==
X-Received: by 2002:a17:907:970e:b0:afe:c2e7:3705 with SMTP id a640c23a62f3a-b1bb2d0f4fdmr263147466b.22.1758119170855;
        Wed, 17 Sep 2025 07:26:10 -0700 (PDT)
Received: from [172.20.10.3] ([109.166.135.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3347b90sm1356906866b.109.2025.09.17.07.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 07:26:10 -0700 (PDT)
Message-ID: <b8a0586e-a79a-4e14-87d8-ee156436d1b0@linaro.org>
Date: Wed, 17 Sep 2025 17:26:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Thomas Gleixner <tglx@linutronix.de>, David Hildenbrand
 <david@redhat.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com> <87v7lh891c.ffs@tglx>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <87v7lh891c.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_072613_222333_17EAB80F 
X-CRM114-Status: GOOD (  29.30  )
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



On 9/17/25 17:10, Thomas Gleixner wrote:
> On Wed, Sep 17 2025 at 09:16, David Hildenbrand wrote:
>> On 17.09.25 07:43, Eugen Hristev wrote:
>>> On 9/17/25 00:16, Thomas Gleixner wrote:
>>>> I pointed you to a solution for that and just because David does not
>>>> like it means that it's acceptable to fiddle in subsystems and expose
>>>> their carefully localized variables.
>>
>> It would have been great if we could have had that discussion in the 
>> previous thread.
> 
> Sorry. I was busy with other stuff and did not pay attention to that
> discussion.
> 
>> Some other subsystem wants to have access to this information. I agree 
>> that exposing these variables as r/w globally is not ideal.
> 
> It's a nono in this case. We had bugs (long ago) where people fiddled
> with this stuff (I assume accidentally for my mental sanity sake) and
> caused really nasty to debug issues. C is a horrible language to
> encapsulate stuff properly as we all know.
> 
>> I raised the alternative of exposing areas or other information through 
>> simple helper functions that kmemdump can just use to compose whatever 
>> it needs to compose.
>>
>> Do we really need that .section thingy?
> 
> The section thing is simple and straight forward as it just puts the
> annotated stuff into the section along with size and id and I definitely
> find that more palatable, than sprinkling random functions all over the
> place to register stuff.

+1 from my side.

> 
> Sure, you can achieve the same thing with an accessor function. In case
> of nr_irqs there is already one: irq_get_nr_irqs(), but for places which

Not really. I cannot use this accessory function because it returns the
<value> of nr_irqs. To have this working with a debug tool, I need to
dump the actual memory where nr_irqs reside. This is because any debug
tool will not call any function or code, rather look in the dump where
is the variable to find its value. And nr_irqs is not in the coredump
image if it's not registered itself into kmemdump.
So to make it work, the accessory would have to return a pointer to
nr_irqs. Which is wrong. Returning a pointer to a static, outside of the
subsystem, is not right from my point of view.

> do not expose the information already for real functional reasons adding
> such helpers just for this coredump muck is really worse than having a
> clearly descriptive and obvious annotation which results in the section
> build.
> 
> The charm of sections is that they don't neither extra code nor stubs or
> ifdeffery when a certain subsystem is disabled and therefore no
> information available.
> 
> I'm not insisting on sections, but having a table of 2k instead of
> hundred functions, stubs and whatever is definitely a win to me.
> 
> Thanks,
> 
>         tglx


