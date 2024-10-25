Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E0BD0C608
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NN2SUD+OUfJKgPj+21gkXoKJrVd7DZ/UXCkZWnA0qJs=; b=DGQm74kCv48t/1KiGxPT0kg0ib
	tj7LJn/TDDFZKLSUyTXs8wvKYG42N/cd6b/47i9lPDBi2VW+1Ivd9FU3f1uXAjvLbT+eOGWDKbnME
	t3KyfXWg93Nwra1d0U5AaZeZ+So9illUlC7nhMMrlW3QHbIdQCmyTEtTwSrgxZzijDYQal3GGHsxv
	0hx+LAta+bMtjdHBlOMf6hNglUagvNpd7uy7zsBEPeVc+Phm7W4zG9JNO+0yQkqTaV0cxW4HfoBNK
	ipveaeAr2SK1mvYWZ44iG2ngPtDLxce+82hXwBwgJ80HD0eygFhdNfMw/OKHI8PAo/k6EM7Msjtu3
	31yqXx1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K7U-00000003mKs-0rem;
	Fri, 25 Oct 2024 13:12:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K0H-00000003l0F-2g0k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729861519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NN2SUD+OUfJKgPj+21gkXoKJrVd7DZ/UXCkZWnA0qJs=;
	b=aSBKpYGIKK7D+KGs3+iXX15qBEbA5LceCf5I6B92iBQHVqNikzIxSSFLDfK+6Gtfm7/1qh
	Xau9Njf4xVxDoK11WT5lKnQwOaNC5bZpkpOn8ySdbcOKgUvF4s382kPS8gq2YsiFyam4mr
	+j1XP45XVwyEJmyeCnySLFaHuD4Ia7c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-iYIjzd3wN4WPtb0VrJatOg-1; Fri, 25 Oct 2024 09:05:18 -0400
X-MC-Unique: iYIjzd3wN4WPtb0VrJatOg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d67f4bf98so1033641f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729861516; x=1730466316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NN2SUD+OUfJKgPj+21gkXoKJrVd7DZ/UXCkZWnA0qJs=;
        b=HlHED1OBvKTCbKPY7rXjq5KToope3nEMWvVDRu+tmuVMMW4ur10z4ZJ3QOHgEiOI7n
         mLnDfJS9nGkpQXKEwLPvE5YyZqbu50qst5AXAJemq6/oeN/S2W1k6g/etNpnywgh0xgg
         rPv3raR/Yvx7PZolMStNezmEKr97JQsMvLdbTCVY4lWzEIoRDYg9JOzsA/DvsuCetLzq
         bANruFc8kqq/goAM0h0cbWAkr0n5egLf4IpoNSKsbO5/QlKSanqwlUNS3jzZSrbGF7Rl
         B82lNBrOduDSabEGmbLknV0fk/Gf0aM8Ho33ZlGBKtCy7NPiUGIQAPSMx0j/IeT/l3g6
         juAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYyi3D4X568yvPKYzVyg287W4UNwJhozkqNUWjpWIz+VefEnA0vHOgLX5fs1vTbeY+/NzRGGVxbSLPKaiVFlA9@lists.infradead.org
X-Gm-Message-State: AOJu0YxDgyqDgUeBVUJDahrAJ0NKwOtFsOwTruPDpSM262bDZ0j/jDmX
	Mzg7SdafP/QRW21fxOaJwDhvIyHkLOOlQqIcmQMJfq9wVfbGWKorDVKs31IFj8k2jxsNdCMxE9E
	LVMUhKP+9Z0x05Ii/+xMI+MWkcNy97E7GCINIiYI3l8Rx6uwpaeAcK0U0Al9xFFo0A5R2mv09uh
	w+6231
X-Received: by 2002:a5d:6189:0:b0:37d:39c1:4d3 with SMTP id ffacd0b85a97d-3803ac84451mr3932494f8f.6.1729861516617;
        Fri, 25 Oct 2024 06:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHZX9EQgHC8n+5rGdSPJEtECAS97R5nQ80Ja/EQnqyzVVLXnGbDJE3YBe+VRN9JY0lWOP/Cw==
X-Received: by 2002:a5d:6189:0:b0:37d:39c1:4d3 with SMTP id ffacd0b85a97d-3803ac84451mr3932455f8f.6.1729861516074;
        Fri, 25 Oct 2024 06:05:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9216fsm1459852f8f.100.2024.10.25.06.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 06:05:15 -0700 (PDT)
Message-ID: <7c1a7b1c-6fbf-4bd9-80d0-d2c3d951e342@redhat.com>
Date: Fri, 25 Oct 2024 15:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Don't eagerly teardown the vgic on init error
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, stable@vger.kernel.org,
 Alexander Potapenko <glider@google.com>
References: <20241009183603.3221824-1-maz@kernel.org>
 <3f0918bf-0265-4714-9660-89b75da49859@sirena.org.uk>
 <86ldyd2x7t.wl-maz@kernel.org>
 <eb6e7e29-b0a8-47b1-94c4-f01569aa55cb@sirena.org.uk>
 <92d755af-e19b-49a5-b4df-a8ed0fb7aece@redhat.com>
 <ZxuWIXFJignbcX1m@finisterre.sirena.org.uk>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <ZxuWIXFJignbcX1m@finisterre.sirena.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_060521_803710_0A79B3DA 
X-CRM114-Status: GOOD (  18.85  )
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

Hi Mark,

On 10/25/24 14:59, Mark Brown wrote:
> On Fri, Oct 25, 2024 at 02:18:02PM +0200, Eric Auger wrote:
>> On 10/25/24 12:54, Mark Brown wrote:
> 
>>> I'm not even sure that's a terrible fix, looking at the changelog I get
>>> the impression the test is deliberately looking to do problematic things
>>> with the goal of making sure that the kernel handles them appropriately.
>>> That's not interacting well with the KVM selftest framework's general
>>> assert early assert often approach but it's a reasonable thing to want
> 
>> Can you elaborate on the "assert early assert often approach". What
>> shall this test rather do according to you?
> 
> In general the KVM selftests are filled with asserts which just
> immediately cause the test to exit with a backtrace.  That's certainly
> an approach that can be taken with testsuites, but it does make things
> very fagile.  This means that if the test is deliberately doing
> something which is liable to cause errors and put the VM in a bad state
> then it seems relatively likely that some part of a partial cleanup will
> run into a spurious error caused by the earlier testing putting the VM
> in an error state.
OK I better understand now. Thank you for the clarification.
> 
>> I am OoO next week but I can have a look afterwards. On which machine is
>> it failing?
> 
> It was failing on a wide range of arm64 machines, I think every one I
> test (which would track with the change being very generic).

Yes I can reproduce on my end.

Thanks

Eric


