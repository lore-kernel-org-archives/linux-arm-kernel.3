Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212F1CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 05:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CW6YRUB7XWZg6Z0QvIr5Jdp9CvsPmVtxl4KHm6Wzt7g=; b=SEozckZM8fciC6FkbZZ7lJjGAn
	ZJPCcynDqyK5XGEuIntz3TaeVyOrXaV2ZZzi7p8oNHTfm8MWy6lVz9A8rGSC79o1FHlmEFNUDzRz0
	gm8+qcSYNefuNDm2Ye1i1m1qaiY5I9xeIHEVBsdwOxhTjbnrG73u23qgqD54EE5aSwNdXzcqmR2Ua
	ZblOZrTCw7RQtsUJRJV/2UrPJbMrHTMhL43xLplnlI/U4FSmYwHIKLkpFOrEteVkjV6ehcoKLpK+2
	VldmKOAUmGXanpxBLhgPG4pvBovSownjXFNv4fHeMQLD3jSu5r/bXNLI7rmdl9Teqps0WTPkTR8lG
	VaqaSr+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uykxM-0000000AFyA-3HTl;
	Wed, 17 Sep 2025 05:43:52 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uykxK-0000000AFxJ-0upn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 05:43:51 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso7584121a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 22:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758087828; x=1758692628; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CW6YRUB7XWZg6Z0QvIr5Jdp9CvsPmVtxl4KHm6Wzt7g=;
        b=VSiGx1Dnr9kFqRBnYOAP0BpNa+EcocUajUt0yNqsmm4WSHgS1gbZhTVGOXvGAJfPT+
         RSO0N3TtcPQ4QRGZ2dIJIr4RIhaoabt+0oMB9IK8PzZYP0S5pbtuRDdZtXxNKpFrubkx
         tnzYm0/JgrIVqBdsR8uLZx33yEQkreSALOk2nqtwDA51AjJ+NifPy2h63hmu2l2AMkD3
         GK1bltuCtucyV7TpNaO/0ehcu0KiKlPZjelE6KUPgxRYxtj/rbUBoCMIm8txSHkGq8nu
         E3zGWsgLPOFtOx7CRNS+5Qy75RwILCCgxkicopJNKxhZJNN4EbokhcbjFU2dN8Ij52yh
         vJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758087828; x=1758692628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CW6YRUB7XWZg6Z0QvIr5Jdp9CvsPmVtxl4KHm6Wzt7g=;
        b=iXSbNJZQKP8nmbLMzy3k96CjTxAiVD8KwvEW8DdhSjAjLqvNz5Sk1UM5nr4KoMhFcA
         8+Altj1Ews0wQAkYttfRm3qqmQegCNX9bSoc8i58+M5YH3jce1hg+d0v6ZwYOFYDJ6JS
         xRmIat1YxXQrQpMXc3Ww0avertKN8HRmdnwQ9I4kVi/T1PBmDOS+5Bkbhg4/Nu7lQ0o7
         Ec7DpJwS1eGyzQT7rCAYVei85f2CbiHSt92hxnVaomcNdhRQuRN5eQxdTEx7rgHgqNl8
         f60MUYpu6YZTn3WtbRP/IaTwFfaCbrJffpkN32RQz4l1dnz8ewmBnoNWZQd0OszsngLF
         aqqw==
X-Forwarded-Encrypted: i=1; AJvYcCVnjnNlBRfOSLnJvJy9VwIuFp5MEu00UgYpMtnOH+QQeiH+GSOtkrpKXae5Wn5rheQ3OUalW3IdPQHErAYMt5dk@lists.infradead.org
X-Gm-Message-State: AOJu0YwPJ0lYpYLpl1A4Et5YR26EtHRfh+pVmR0YCJzd1L+3VlnCe4vh
	Bzq74TyJ//rvxV1egPzEPRPY6Rt2u6vBxd5VWg/XEf6rqagFxU6F5tY6gi/GuQ8EDqE=
X-Gm-Gg: ASbGncstmuZ6KwUFU6fJS2NWt+KTtylH1U0IM1jNiv+pxrNgYHP4gny/r6QCTqhoBqc
	4frKRkT1DizKZlgJ9gKNmZbpc5/pG/6YaJxU6mdJap9ye9Dc9OuP1rNgC+dDbpPrbYnGD9PiDsx
	gT1x4r+3yOErGa2+GJuA/3Ufymke8NC0ZyjSZJQU2rmxGuY713jGvXciEoKroTXcOh3Zs6X9cKf
	3YAtkb7N7WAL0ETwlR9aac0pQ7HfpRy8iBQcNE+L/gv2TSm+gU647isrka/n9evWOv+tuvKqsku
	PlPtqo45XI0K2fdPZjXgNbG68Jlrg/Nm5d1vQnGd1D4oIOezhaHrj4QQngt8UpbCK/0ob05RtLv
	DkFwCH8Wgx/TanoUOptwNJULXbHyuow==
X-Google-Smtp-Source: AGHT+IEwTeAqrWw3yRYXMNv2Kyom1bFBunp2rNawKurYFNJfFiYeBaBgK7tfvL+8o/YQVxm7ewmS1g==
X-Received: by 2002:a17:907:3f0a:b0:b08:85d0:3d8b with SMTP id a640c23a62f3a-b1bb73a69abmr108132766b.21.1758087828294;
        Tue, 16 Sep 2025 22:43:48 -0700 (PDT)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c6110c27sm1088029366b.66.2025.09.16.22.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 22:43:47 -0700 (PDT)
Message-ID: <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
Date: Wed, 17 Sep 2025 08:43:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <87a52u9jyl.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_224350_297837_5D3138C2 
X-CRM114-Status: GOOD (  16.66  )
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



On 9/17/25 00:16, Thomas Gleixner wrote:
> On Tue, Sep 16 2025 at 23:10, Thomas Gleixner wrote:
>> On Fri, Sep 12 2025 at 18:08, Eugen Hristev wrote:
>>> nr_irqs is required for debugging the kernel, and needs to be
>>> accessible for kmemdump into vmcoreinfo.
>>
>> That's a patently bad idea.
>>
>> Care to grep how many instances of 'nr_irqs' variables are in the
>> kernel?
>>
>> That name is way too generic to be made global.
> 
> Aside of that there is _ZERO_ justification to expose variables globaly,
> which have been made file local with a lot of effort in the past.
> 
> I pointed you to a solution for that and just because David does not
> like it means that it's acceptable to fiddle in subsystems and expose
> their carefully localized variables.
> 

I agree. I explained the solution to David. He wanted to un-static
everything. I disagreed.
I implemented your idea in the v2 of the patch series.
Did you have a look on how it turned out ?
Perhaps I can improve on that and make it more acceptable.

Eugen

> Thanks
> 
>         tglx


