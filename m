Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50575C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sM4xbo+TR9mbwXpIFDrxsUvuGWDkKZ7be0Phwr5WUpI=; b=VZxj+iNV41efLb
	9y/dLHCA4l3Kv2IYSDDSfYj1d0i2ERxn/IOLyeLdV57xbmLmm1rYGQ7xNll0dOE86szKJ6mq9iVrn
	lK6hht4G0pzoWF5N21mlrWckdto911Tu0uGsn5S8H8j4jo7vpKmewo2uPCsTI4uQ5+rvxjFbo4CBx
	42xX4OQPGC3GikbwuoGsznfq+ml4OucS/yS6B7/mLc8oBWhDHOVZuVx4i6OabjXGBSv8HEGnojmmx
	3syF9ZrczL180dTfL6tme9obsPUqA887HoI4VcNJDRZ59lufx+wLFFyX31eKGnmhZoJViHyv2/LbP
	YMBRuSZK6m6lcutDHirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopel-00000006Mb5-499M;
	Tue, 28 Jul 2026 21:48:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopeZ-00000006MYM-1lNz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:48:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso308200f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785275278; x=1785880078; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sM4xbo+TR9mbwXpIFDrxsUvuGWDkKZ7be0Phwr5WUpI=;
        b=p8VIq1b99DwdyIPxxm5C+wqyHaZYS0QgWb4fg+ema/YSQDmIkGyyKzFW9sx3PFQ52E
         +c56oERcridHZpt8XUGhENgj4yTIevMYnQQlq2rPmYmO6+qGVsOYYwXzfbSskUDkxEvb
         ZaaspDenSTCVdW0Etd/WVwCNRZhKG2jhC4YLR0sL4fLDey4bLyYtSwi9NC4YltdFif3c
         QGWDKSfqCBeWSNupniK3JNOlXJ1w4Ya2h0FvCIrS6ZNrIC9qlFiesUZQ7pdkVilwKmg5
         s/8FDSCSY7ouquiy7bg29kWqgbd4FkoEYdMK2NhTbTTi1wQ28d5pQcHN4ZNT6uvBAzYZ
         Sd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785275278; x=1785880078;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sM4xbo+TR9mbwXpIFDrxsUvuGWDkKZ7be0Phwr5WUpI=;
        b=U9LuctS8Vu591CIlyCNKXYYCKxqabYOOHqGlBdlZcKvC/XPrW+r4cwHFYURv4ZFtlQ
         L8UTTXZzB3oAO4G554lSPA5UKknCm+RhVY26+7o2OZbqthWCYhiM7sIEKP5Ow1KPSogI
         2ktoXlDJ+hihWfGysA/dPCkg34pYe/8CjPDkXKCn7LTck5yThvrej+4P0MyG2vEGaOvo
         PibWwwuIAcp5pUi0L0gKRPCcHhW8//Sufxw+fZeMmRbc/GsO6+tDi8yzjyS5TbG4iQo8
         OlJi7lNTvqrMnn5lJz1jtWD/BVmmuizvM+FsJvokU8LSubvndRIExuaSu+JNvtkf/RD3
         sqMg==
X-Gm-Message-State: AOJu0YwlVATeSnTp2xql5Lay88D463HqN+8XC3LIH2S/SQ/5IaGsWEAt
	wvSgIad4mX8BGM47MAtrn3KNfmNuE0LaHd98Jw+OVvccD8szOLHXDNjxOMFNA+3H1J4=
X-Gm-Gg: AR+sD1107MmqI1JFNY+PKZXx0eyo8cjxCBYC33wOyPN1cAHM+Cf1tw0Hud7Y/aa9i3Z
	MAOGf3f4ME5IDRBfirHsjO8B7QXKjQgpg5wqKyFLvs7diQGH8+jPZZ8FoLVRMrSxPeZchjNtTkk
	Bg2YzM5xaHYi5av6deRsr0chMOw/GKTDjIEnnOXpYNH2N2rx9jF9neZYkSlnwV3LdAYflOx1j1N
	Ntm2j7HMOZvkF64SzCxuC41ljI5aJ9Gp1Z1SjCnJEsGvscj+54mWDx4jW83iG43shTlkGs0aa0h
	pft5aGncJcyae4nEMjWFsyM8I0ZhqUULkNJt/Aupt4u7QTN8dmKToTJXgU+gftD1pANBmgBi1wF
	wpEAZLxi7IQmRnFLqY7UEHU0hk0d7YVDaj8PzoqxorDYr2jkE9/7e26Sy1NJfcxIeVnvNb92Nsg
	29HhjQWevD8b7ZMfP0lCONkcuzhTs6YBFJr7WFOSg=
X-Received: by 2002:a05:6000:2287:b0:47f:9022:8530 with SMTP id ffacd0b85a97d-47fb1ebbdcamr4799474f8f.53.1785275277489;
        Tue, 28 Jul 2026 14:47:57 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm1967617f8f.6.2026.07.28.14.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:47:56 -0700 (PDT)
Date: Tue, 28 Jul 2026 22:47:55 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 07/13] arm64: percpu: Implement preemptible
 read/write ops
Message-ID: <20260728224755.59cfd22d@pumpkin>
In-Reply-To: <20260728123859.2911495-8-mark.rutland@arm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
	<20260728123859.2911495-8-mark.rutland@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_144759_512136_189ADD1C 
X-CRM114-Status: UNSURE (   9.95  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 28 Jul 2026 13:38:53 +0100
Mark Rutland <mark.rutland@arm.com> wrote:

> Use the PCPU GPR infrastructure to implement preemptible this_cpu_read()
> and this_cpu_write().
...
>  #define this_cpu_write_1(pcp, val)	\
> -	_pcp_protect(__percpu_write_8, pcp, (unsigned long)val)
> +	_pcp_wrap(__percpu_write_8, pcp, (unsigned long)val)

Not new, but does that end up sign extending 'val' which is likely
to be more expensive than zero extending it?
Using '(val) + 0u + 0ul' might generate better code in some cases.

Just noticed it should be (unsigned long)(val) as well.
Otherwise this_cpu_write_n(pcp, -7 / 4) isn't going to DTRT.

	David

>  #define this_cpu_write_2(pcp, val)	\
> -	_pcp_protect(__percpu_write_16, pcp, (unsigned long)val)
> +	_pcp_wrap(__percpu_write_16, pcp, (unsigned long)val)
>  #define this_cpu_write_4(pcp, val)	\
> -	_pcp_protect(__percpu_write_32, pcp, (unsigned long)val)
> +	_pcp_wrap(__percpu_write_32, pcp, (unsigned long)val)
>  #define this_cpu_write_8(pcp, val)	\
> -	_pcp_protect(__percpu_write_64, pcp, (unsigned long)val)
> +	_pcp_wrap(__percpu_write_64, pcp, (unsigned long)val)
>  
>  #define this_cpu_add_1(pcp, val)	\
>  	_pcp_protect(__percpu_add_case_8, pcp, val)


