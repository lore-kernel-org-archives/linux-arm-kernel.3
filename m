Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F40DC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 21:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eaIlD6SgIwBKzFRuDf45UmSCQNYGCKtzx7DOTC83A8=; b=nmbkoVPNoFkIAytFLZnC4eMTkx
	yD/TWngaAzQibBkUEhbRrPeQZnouj5022dmbPG7a8aAAzNnrBnc9rQ4k8QO4+wg473Y+beOBKhvsb
	bMK7VU2GuE/0n/UVLP0N9QGyOLNf+CxAZNf8vn+IUy25jfUds84mDOPonQ8d1ZHR//lQGh9HYraCb
	BahkcZrSTy6kWcPEvDku43J0eScoK33S+d4RCRGu/zDQoAK6BQNWB0tBM0MH6qquuaRz1Fv9g5bzG
	SQwuFbQn3Zku1PRuXI8ZrVOVMPc3VXyVyD2Xstog7zij5hcqOzpkyW+3LxAIXcDQLJ2gjnBGJIaLC
	NyV9H+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMvWE-0000000EFNL-3nPS;
	Wed, 04 Jun 2025 21:19:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMvU9-0000000EFJH-2GcZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 21:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749071839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3eaIlD6SgIwBKzFRuDf45UmSCQNYGCKtzx7DOTC83A8=;
	b=GzpanG8NQ2CYfGbBmBXebWqdCsaeMxRwHCzi4z8tA06xlWL00e2GQQtu6c/Xv92ssyRQcs
	fTr/bJyw09/C48QrJSO4TgPCT5ibIum9R3Kjfya9GEZQvIVObGy5bofyRVP98om7EI/yAX
	c29kGJN4grtbYtirsu8yDIfSqigXFQ8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-3Q9vv6VwM1iF4G1qZvMxRg-1; Wed, 04 Jun 2025 17:17:18 -0400
X-MC-Unique: 3Q9vv6VwM1iF4G1qZvMxRg-1
X-Mimecast-MFC-AGG-ID: 3Q9vv6VwM1iF4G1qZvMxRg_1749071837
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso212776f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 14:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749071837; x=1749676637;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3eaIlD6SgIwBKzFRuDf45UmSCQNYGCKtzx7DOTC83A8=;
        b=g68a9K0m0VO3+fVD9i/SrZkwtSFXv+pyI3wNO5FrWfvlrfuWlTfRlI28xBnAWfTH+P
         TBsQPVJojBEYcaiVfIjy/4qX7A6y2dWxB35j5Nn0rwK9CEQwnUPLp+6eqdnzeu0mz897
         +ew10ggb+xq3qq3wA+D9oQuiXLrWo7+0Dsrp+qr9FNUJ3BDwiEd3s3P7LnBw3NS7Ckl0
         4wTTzt8htXhS3hRYqYL10dFVEVERAetTm9aj7goSSYa1LGC8Nf5hdq4dbu8v5LJCYSVz
         gdj89SmRIbG1MtWDTUqvOOi5jx6djr86Tua4/FL8EqFgcYXXHuCpuftkj39ZvlQshV1C
         998Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwOQISO2boJBbca4fPHbU+eT7Zj3Kn3lL4UxiS1KGpsiC3pC3uZzVLzEMvDuh2/gKW3gtO1CpYGMezgl+LYsf8@lists.infradead.org
X-Gm-Message-State: AOJu0YwBC9xpE71Lc2GyOoEMP6y1tm4y2IalP8tjPb7pdhIkUKhAazej
	2eTyJMxg2X5pMf4lPwUvafZx2A1qbDkBS9hQOFpgeXrSEEe11hlHGfCABB6Qd8LhssiVZBnx+bh
	pshmT/m3Y/CvY0Uj6EIXSknEEsohay+SdqNYb7xmJTQGqGcTSOxUybHZ7VfUplP429kjyJM3tQL
	mJ
X-Gm-Gg: ASbGncs3SEqKuhuNzhiojJlkzl5TvU6l7xSDo8orCapLPPTj/LZsAinR/Fxc3Q9Ufwy
	ehQib7pFIoBl7MOFvfoTh6boFdzrlNJpoI9TI9/SS6052KpKpYwjLd5G+ngsBdQ4yZCHvgJsJCx
	3kOIx3aS5crAWgrJa3lHSYzYx0qOy9MDPjBUejdru12U4pX/l39QHKNTfhgNMQhUH7Z+tww+V9I
	ok2/2aYN2qBp+b5xzvKhUXvZ1tktPW9hQWfchfVrDHQYhb8kw4vyQ7+9ZUbJuiteby4ZssrLqri
	FY17bVprLadM+BkIpinTlUdzoRk5aq3w7oP/UrS+aVA0zAwahsdFr13K9K/e
X-Received: by 2002:a05:6000:2512:b0:3a4:d274:1d9b with SMTP id ffacd0b85a97d-3a51d92f84amr3541712f8f.25.1749071837465;
        Wed, 04 Jun 2025 14:17:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/w3mTJC6PzaXkAlaJcofTyt+hL5Id0Z9sQ5spOyW0fO3Rb3p4l0Y62I6sWoWE4eFRofNvzg==
X-Received: by 2002:a05:6000:2512:b0:3a4:d274:1d9b with SMTP id ffacd0b85a97d-3a51d92f84amr3541694f8f.25.1749071836994;
        Wed, 04 Jun 2025 14:17:16 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c842sm22506811f8f.29.2025.06.04.14.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 14:17:16 -0700 (PDT)
Date: Wed, 4 Jun 2025 23:17:15 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
    Colton Lewis <coltonlewis@google.com>, 
    Ricardo Koller <ricarkol@google.com>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/3] KVM: arm64: selftests: arch_timer_edge_cases
 fixes
In-Reply-To: <9b9f7099-4e81-9b74-a1ac-37cd4965675b@redhat.com>
Message-ID: <77f07e94-82a2-5dc4-2483-e2ecff151e66@redhat.com>
References: <20250527142434.25209-1-sebott@redhat.com> <adf8b877-7ca2-f60b-fb59-578c70d0e3c0@huawei.com> <9b9f7099-4e81-9b74-a1ac-37cd4965675b@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jByhQNAsdurz6kGVaprbA0FqNdPdbrdjOz2jiVZq0ds_1749071837
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_141721_837786_7EB50256 
X-CRM114-Status: GOOD (  25.49  )
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

On Wed, 4 Jun 2025, Sebastian Ott wrote:
> On Tue, 3 Jun 2025, Zenghui Yu wrote:
>>  On 2025/5/27 22:24, Sebastian Ott wrote:
>>>  Some small fixes for arch_timer_edge_cases that I stumbled upon
>>>  while debugging failures for this selftest on ampere-one.
>>>
>>>  Changes since v1: modified patch 3 based on suggestions from Marc.
>>>
>>>  I've done some tests with this on various machines - seems to be all
>>>  good, however on ampere-one I now hit this in 10% of the runs:
>>>  ==== Test Assertion Failure ====
>>>    arm64/arch_timer_edge_cases.c:481: timer_get_cntct(timer) >= DEF_CNT +
>>>    (timer_get_cntfrq() * (uint64_t)(delta_2_ms) / 1000)
>>>    pid=166657 tid=166657 errno=4 - Interrupted system call
>>>       1  0x0000000000404db3: test_run at arch_timer_edge_cases.c:933
>>>       2  0x0000000000401f9f: main at arch_timer_edge_cases.c:1062
>>>       3  0x0000ffffaedd625b: ?? ??:0
>>>       4  0x0000ffffaedd633b: ?? ??:0
>>>       5  0x00000000004020af: _start at ??:?
>>>    timer_get_cntct(timer) >= DEF_CNT + msec_to_cycles(delta_2_ms)
>>>
>>>  This is not new, it was just hidden behind the other failure. I'll
>>>  try to figure out what this is about (seems to be independent of
>>>  the wait time)..
>>
>>  Not sure if you have figured it out. I can easily reproduce it on my box
>>  and I *guess* it is that we have some random XVAL values when we enable
>>  the timer..
>
> Yes, I think so, too.
>
>>  test_reprogramming_timer()
>>  {
>>   local_irq_disable();
>>   reset_timer_state(timer, DEF_CNT);
>
> My first attempt was to also initialize cval here

Forgot to mention that I did this because my tests have shown
that the interrupt didn't only trigger early (like before the
reprogrammed delta) but instantly. This seemed to work but I think
the order in set_tval_irq() is the actual issue.


>
>>
>>   /* Program the timer to DEF_CNT + delta_1_ms. */
>>   set_tval_irq(timer, msec_to_cycles(delta_1_ms), CTL_ENABLE);
>>
>>  	[...]
>>  }
>>
>>  set_tval_irq()
>>  {
>>   timer_set_ctl(timer, ctl);
>>
>>   // There is a window that we enable the timer with *random* XVAL
>>   // values and we may get the unexpected interrupt.. And it's
>>   // unlikely that KVM can be aware of TVAL's change (and
>>   // re-evaluate the interrupt's pending state) before hitting the
>>   // GUEST_ASSERT().
>>
>>   timer_set_tval(timer, tval_cycles);
>
> Yes, I stumbled over this as well. I've always assumed that this order is
> becauase of this from the architecture "If CNTV_CTL_EL0.ENABLE is 0, the 
> value returned is UNKNOWN." However re-reading that part today I realized
> that this only concerns register reads.
>
> Maybe somone on cc knows why it's in that order?
>
> I'm currently testing this with the above swapped and it's looking good,
> so far.
>
>>  }
>>
>>  I'm not familiar with the test so I'm not 100% sure that this is the
>>  root cause. But I hope this helps with your analysis ;-) .
>
> It did, thanks!
>
> Sebastian
>


