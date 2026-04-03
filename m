Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0486FE7E35E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZH9+LliZTB5HpO6CFpEOH4jpCgMrdVel5twiQSolHR0=; b=hnF5LAirnBtYwX+kfq/ePHhuF5
	pid81THyM1NMuv/ycaqcPlmfUgb2ZrjyilGHe1z+7vd//pgF6pGNQWZW5DugJCTYZGZQ4Q7mbHcMh
	FhGTxqlHgQYPaMGuKmHtIZ2BrVCFu4a8Bvt7Mc8mReEFBmNTYLpkzTDy+dz9l72LZdC+tfCOau2/9
	7goY8Wij6nkiZG+GOCLIxYNhpn0BLKYHGkXs7JJblQqT1PlYitnbtBS3QHA9EOSGilyjoTSObBA0O
	UyQaGwwRqW5dOFei525y+MGax9nGUG1PojuY8zbLmOVPY6iaBzyeDQtSUPGWJTggbd/UnTnj3ZKbz
	d4vSq72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8b5f-00000001q54-0lU6;
	Fri, 03 Apr 2026 09:45:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8b5c-00000001q4H-38qI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775209519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZH9+LliZTB5HpO6CFpEOH4jpCgMrdVel5twiQSolHR0=;
	b=L26UcBJahTYdEPvtdGgDj+Nenz/AX9z6icHuHq18kVUqBfNJrtYr2XHbE6j03MR7lm9aGt
	Ld7FHAYG2HgbL5piDa8kDBXAmv3a7/C/KlEI6HEYHGyhPOthBQ8b4DQ9n35BJ8MjXpePFT
	l+9/kxODymFX8uIg+Nl7K1F7AoMM17U=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-INGQ9yZFPUWrSa9SCtvQRw-1; Fri, 03 Apr 2026 05:45:17 -0400
X-MC-Unique: INGQ9yZFPUWrSa9SCtvQRw-1
X-Mimecast-MFC-AGG-ID: INGQ9yZFPUWrSa9SCtvQRw_1775209517
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c7ec40f92so2495717b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209517; x=1775814317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH9+LliZTB5HpO6CFpEOH4jpCgMrdVel5twiQSolHR0=;
        b=Pl5jeLDKiAmAv/CLJMKtAShvvzxo6CI+q8dv89aov0AbqO3Lt8M38paEKMdSWxJFM2
         HIVjtqcUz6JvsnPZUPrU1eLyyTHatmq6id4QgIv72EZVKI22b+jQoVjguKYLTzNkzvIb
         uprzwEBtRvjVeyeAh0OAN2W84QkZ8JckY3SQUf5FODHeN/IxlHy9dsAB2pQJP0HNROWN
         prFrUGWT7jaD9xl8FcQ1y3wSuQC2OTWLA91WKEPKdN+1Dq2+DuV9wOesXib6hAL58wnS
         666hsqK6rhLbT3aSJur6Ju99dx+EOYDLHEvfLit3zPYcidpLXv3Zj/o0Lmb8Tzqz3lH8
         Uw/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqmMrBrQs2VzlAJQAx60CceJ91CkF/oe05oGDe3T2BssFm1P4y6/lWP0ExKrHOsfLPOrCn+yuvsrhr5CorAlWt@lists.infradead.org
X-Gm-Message-State: AOJu0YxeIstHa4+awFty7WgWbY/lxmdueUTqCihDclw6g5V/lI27wHRZ
	wq4P6LrdotPm9zrvyNw124n/CX5NRLZhNf6fLrNao3HGpIEEFR2VW1OHN+L6+7HUq0SZscTYWHG
	Enq+4NSOPDdZsrw0cs5fN26+cduuvPfKEj4ZpmLKAPgdfS5pmHezAYtgyKgRua0Sf92Zw7jiePK
	CM
X-Gm-Gg: AeBDieuixQa3y0uV3fRU3s0ySmZ8oyszmRFewMiDzMoHiIZSbO1JWt6GX44LUhxLYzU
	iZkZD6CNwt4kR+PxIk58NxwevJwvm4/SbSXPDsUKHPm+UXSpbPh0eGzxErStbgkF/6om1Q9aLYE
	SicRiAEcMZdTPHZx3XTJ77VdY0C6NOWNbix2m75MMzn+KHZ08DErtp2iYW4Ln6hNWfNlwyxeD47
	8TA/3mPZw4MGsDt4AJnlYWw1lmHRo+VSU63TNUAUUcSzXsM4gXeLhXMIAGzdKk4Ubs3dmsypHxC
	T4/HBdzmQ2vyEudnbRKX7WPyUFSBMyaGBqBlQ0mzBi9JL2qSQtu8ba+BHSXz8MnZnEGk6vjk+/1
	naE2OnC7RDoBw
X-Received: by 2002:a05:6a00:3027:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82d0dba9c6fmr2625450b3a.43.1775209516626;
        Fri, 03 Apr 2026 02:45:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:3027:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82d0dba9c6fmr2625387b3a.43.1775209515832;
        Fri, 03 Apr 2026 02:45:15 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9cbf6sm5915263b3a.52.2026.04.03.02.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:45:15 -0700 (PDT)
Date: Fri, 3 Apr 2026 17:40:52 +0800
From: Coiby Xu <coxu@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thomas Staudt <tstaudt@de.ibm.com>, Will Deacon <will@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/3] arm64,ppc64le/kdump: pass dm-crypt keys to kdump
 kernel
Message-ID: <ac-KKklNrB5eQFvG@Rk>
References: <20260225060347.718905-1-coxu@redhat.com>
 <20260225060347.718905-4-coxu@redhat.com>
 <51761fcf-955f-45e2-97a5-2b49d8e79d04@linux.ibm.com>
 <20260402233118.08ea88a6836bd10f01031cce@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20260402233118.08ea88a6836bd10f01031cce@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8dIuzmJU-QDjuutO9HFh-KHwWf2BOYdxzNjEdT-FZXg_1775209517
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_024520_857817_2EB7C45E 
X-CRM114-Status: GOOD (  13.59  )
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

On Thu, Apr 02, 2026 at 11:31:18PM -0700, Andrew Morton wrote:
>On Thu, 2 Apr 2026 16:24:14 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:
>
>> But while reading crash_load_dm_crypt_keys() I noticed a possibility of a
>> double free at the address pointed by `keys_header`:
>>
>> In crash_load_dm_crypt_keys()/crash_dump_dm_crypt.c
>>      snip...
>>
>>      kbuf.buffer = keys_header;
>>
>>      snip....
>>
>>      r = kexec_add_buffer(&kbuf);
>>      if (r) {
>>          pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
>>          kvfree((void *)kbuf.buffer);                           <---
>> First Free
>>          return r;
>>      }
>>
>> Since `keys_header` is not reset, the next call to build_keys_header()
>> will cause a double free at `keys_header`.
>>
>> static int build_keys_header(void)
>> {
>>
>>      snip...
>>
>>      if (keys_header != NULL)
>>          kvfree(keys_header);
>>
>>      snip...
>> }
>>
>> What do you think?
>
>It looks that way to me.

Thanks for confirming it! I'll send a patch after finishing the testing.

-- 
Best regards,
Coiby


