Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E44C47BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 08:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V867c7UphVGnIeOy7W0Ae1g0VsKH1KFb8UYnFs0q7vQ=; b=dI4i353JEuhUxHYJrjluIx6Xtu
	4m9kkdinVl68uNvzntwJSMwi6ghHMiDrprDm9Bh1HYEU1BCaPjGWhjSqIygt947MSBoPhMYcPxgBF
	adFobk3xqrTrsrfyYA/ZHJ1UGgEbZ/dp1BHFxryIZi6SuT6jAfpRtjRQmwJ3eVNDNvMPXjQlRyvmO
	01oYelHkMVHHPP1ynlpkcZLBrEE+H9a8j1ACGdTJz1boRUtGOfXCrcYtmQhmbnNfkPd/V4dUrT0v7
	3VU0z9p5GrN2JunEz3zADJY/SyTFMxnme+jtAOdyCmrqKAMqADh+FXqz+WoSSiv/cn+VJ4MP0ZwU4
	hP+6wq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2gy-0000000CdNk-2wY3;
	Tue, 06 Jan 2026 08:45:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2gw-0000000CdMx-1gCw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 08:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767689125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V867c7UphVGnIeOy7W0Ae1g0VsKH1KFb8UYnFs0q7vQ=;
	b=DbiDieSmctWQ0KsKtHuoEYG+eDwpL49L5DAiCPj47fdYKlOsMvSzBxCxkGbd6Ib74gNl40
	EOgXv+m7AEdMThezmAa6Lc5K6aGebPlzT9FIPB/VqPmdyCDQcFKx41vQWQwKV+f1gplfOK
	7/zeMQ0KMC37inaoxWOkO2h50XDmBWU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-GAuhodR4M9utsN5lF4wYsg-1; Tue, 06 Jan 2026 03:45:23 -0500
X-MC-Unique: GAuhodR4M9utsN5lF4wYsg-1
X-Mimecast-MFC-AGG-ID: GAuhodR4M9utsN5lF4wYsg_1767689123
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so28226735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 00:45:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689123; x=1768293923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V867c7UphVGnIeOy7W0Ae1g0VsKH1KFb8UYnFs0q7vQ=;
        b=gnRfHctd58ydZsIMDuss4FLQvJPKIVO/79Lj3bg2TdtgMp5QR1/ucjEHFwUcRkDySK
         p30CWsv6zy1ETFGQswf4v+SZN0ZauORr3alyKDiwuKhBAMp0Lsmco/lFuzfU4enTVRiH
         Jl9lBNUgTZORW7GEfclu5cROrq4Q8gQ9Lx1439TjqCclG420WeRc6MHV3H3i3poHkIhR
         ui1ySllHy0XoS5x+U7VfkzEjn1zhTQv7IaQKZ2Y3apn2wFmCj9zWUiN8+0SAKrjrC8wR
         FEycA4ETU50LD7WwLv22xSlQKiDMRdCvHFcYtQMlGOVN3U1WaF1ABklM0oYsRKGVYRP5
         KfVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK4DSuqw28xuwlTzPWwq7f502OUq1eBIGX9Y7jTT+Oo5StUlbhM5V5e0e6tKjjyDbn+ySn9bPn4cFo/kDAjwuZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxuD/+hhOX6AEgpoKqwpFSbDxj88MIMNwNtHloFGqnz9HVsoZ3h
	vmEn6iEUSl3CzlmOntDQiGuMJL/4SbYQHHGk857cb/G2TAhxyT9Zwj62mRwm5tB5rzHNlDc4Zvj
	h1G3oj4ql7yGcHZGns5pYposgbbTRMVUbcgN4guh3x1lOxQvp++RX24vzlZzeijGAQzZ+zK5IuT
	vS
X-Gm-Gg: AY/fxX4cSOXcBjCyQKIC8qh4yd3991JJG8Bkrg6sqXf/T8sg6eZWCXMbDI0FuISQQfg
	RynXarVhEmvIEOxLXJLdHRZUxR5ZFsqvED5KFKZxUHNIWmiMUGhUsTZwVgrycu5hgC8XuTC9DE0
	wx7Lc4bPm+aEcNGVnB0QGIVGxbxvqpiB224IzeeHbrfQQ5ZBJY75thM4R/rnGXRqMbVjhxnLzti
	kn64ArwI4zqGjeION0UQHxe97yH/DgY3Q9OIXvkCZ0NMbcnNX00yAdtUePYTrkilLsI7oc6XuTa
	rXaoGpjC5EDibfV2rwJXD/WKJkpZflEkrUO+s4or1vliJBubVjQqVZFFPuqa4H2pJmr6Hwrl4PV
	k
X-Received: by 2002:a17:902:e542:b0:2a0:acb8:9e80 with SMTP id d9443c01a7336-2a3e39fe508mr21175075ad.29.1767689122772;
        Tue, 06 Jan 2026 00:45:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHj87y/LvUuXsPTTHYyxl210tNMFszmP1mS+zOvYjb5dokYHtO6c1eZkb9GIqFdBLOfAwoSIw==
X-Received: by 2002:a17:902:e542:b0:2a0:acb8:9e80 with SMTP id d9443c01a7336-2a3e39fe508mr21174665ad.29.1767689122205;
        Tue, 06 Jan 2026 00:45:22 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2c0fsm15249925ad.66.2026.01.06.00.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:45:21 -0800 (PST)
Date: Tue, 6 Jan 2026 16:41:14 +0800
From: Coiby Xu <coxu@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] arm64/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <aVzFW1_32EwyE2kj@Rk>
References: <20251226141116.1379601-1-coxu@redhat.com>
 <20260106062231.448170-1-coxu@redhat.com>
 <20260106-mammoth-of-wondrous-blizzard-e30d62@quoll>
MIME-Version: 1.0
In-Reply-To: <20260106-mammoth-of-wondrous-blizzard-e30d62@quoll>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oZq9_TyKRbkfP3brn4PRyZmrToGGZq9a0w-IEffAqto_1767689123
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_004526_509272_DA61C6D4 
X-CRM114-Status: GOOD (  22.83  )
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

On Tue, Jan 06, 2026 at 09:05:49AM +0100, Krzysztof Kozlowski wrote:
>On Tue, Jan 06, 2026 at 02:22:30PM +0800, Coiby Xu wrote:
>> CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
>> device dump target by addressing two challenges [1],
>>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>>    machines, a system administrator may not have a chance to enter the
>>    password to decrypt the device in kdump initramfs after the 1st kernel
>>    crashes
>>
>>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>>    which is quite memory-consuming compared to the limited memory reserved
>>    for kdump.
>>
>> To also enable this feature for ARM64, we only need to add device tree
>> property dmcryptkeys [2] as similar to elfcorehdr to pass the memory
>> address of the stored info of dm-crypt keys to the kdump kernel.
>>
>> [1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
>> [2] https://github.com/devicetree-org/dt-schema/pull/181
>>
>> Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Dave Young <dyoung@redhat.com>
>> Cc: Kairui Song <ryncsn@gmail.com>
>> Cc: Pingfan Liu <kernelfans@gmail.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: Coiby Xu <coxu@redhat.com>
>> ---
>> v2
>> - Krzysztof
>>   - Use imperative mood for commit message
>>   - Add dt-schema ABI Documentation
>> - Don't print dm-crypt keys address via pr_debug
>
>Your changelog should explicitly document that this has external
>dependency on dtschema pull request, so that maintainers know that.

Thanks for the lightning-fast reply!

And thanks for the reminder! I didn't know the dtschema pull request is
regarded as a dependency. Currently, I only add the dtschema pull
request URL to the commit message. I'll also include it in the
changelog.

>
>Also, in the future:
>Do not attach (thread) your patchsets to some other threads (unrelated
>or older versions). This buries them deep in the mailbox and might
>interfere with applying entire sets. See also:
>https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Thanks for pointing me to the above documentation! I thought adding
In-Reply-To to the V1 patch can provide better context since it's a
single patch. It seems this is not true for Devicetree. Is it because of
the documentation change thus we should treat it more like a multi-patch
series?

>
>Best regards,
>Krzysztof
>

-- 
Best regards,
Coiby


