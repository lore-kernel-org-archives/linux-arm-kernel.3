Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3705C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y08MuvRHSicjXeoYJ3CdQ0GrnmqIMwlAmbYm+7kzbhY=; b=jWnimLuxJbTYFvQ6lbnFGRRL2B
	aZn8Xn4lVFzKiL0bPKWtsBbFsDli3fR29KhYTsFoj0IgB0sWA/oFxNxIlVHp00dyiZ2pg8dKgX1yh
	9xM1oBKynGu4w1qDXvUCnrcHDzptSjl1LPFcAJYUYy9DQ4S6/zDsrnF12M3z2B/G4HOl/gRLPDbm4
	WVawBX7/3/faFpUgCnWYF4lnjBYI+P3u/4LYS5ITV5oiQNkPHRAabr+KP8U44F7kQwj5hj2xZQqMg
	KYoM7c8oOM06ZV/VIeT/dE/Qs9oBSzTofznJZVNJ/qHAClP5xjYuOAfQihyCuEWSs7Q633Ry8jtZG
	TTgj8EGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4abH-0000000DoOi-3CNL;
	Thu, 10 Sep 2026 08:57:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4abF-0000000DoO9-1dE2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789030658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y08MuvRHSicjXeoYJ3CdQ0GrnmqIMwlAmbYm+7kzbhY=;
	b=SoiU1CmVnHR6UGmxGdNQ+zMpfawOShB+KyT/SfRSdT0rbLXjs0RvelRdOdTDISSH0aA/le
	MwAwf3oT9qqVj7JLtngJiPdidm4rCbjoYNlb4OyJl/AB+R+iIGyzFsXTf1iC0CXRSBhx4T
	lZ8SoNw1oVOlk410slzrJuTH6OGheZQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-PFmdsAjlOqK2Hx5kUvELmQ-1; Thu, 10 Sep 2026 04:57:36 -0400
X-MC-Unique: PFmdsAjlOqK2Hx5kUvELmQ-1
X-Mimecast-MFC-AGG-ID: PFmdsAjlOqK2Hx5kUvELmQ_1789030655
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49d2951089fso3958895e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 01:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030655; x=1789635455;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y08MuvRHSicjXeoYJ3CdQ0GrnmqIMwlAmbYm+7kzbhY=;
        b=FqFwtOllNetIzQ80ChdnUXlQKClerqvXBhHw2N1xGon62YY4xWRAbZ+RhNgKm1YHbe
         FU3pCF77tJIA7CYF+5UiDvvApBcTQzUSYBVnd7zYR/O0e+LInf/Ou0Wo84V3PY73K7PM
         6g3gOLJlup5T2h7PxXi1JyKFy7clpwF5qevVR8bC035UqK5XqatTksGM5drHCemib9GB
         iFDeAD6F+9nhPSsoad85WkmYa5RzSeZZTSMWMbZQtRkdT/SDt0vZCoEi+sA68qeueC4o
         LTkEdggC6tD2BVflMLQdSHPvJ3QoFRlVfVo1OXx2ZjscLP/IV3y2ZZKZ3+fdVq3+Arp7
         QBPw==
X-Forwarded-Encrypted: i=1; AKwUvBx13NFEXXvgnp6rkVK2RhcNsvTLlVEe7ewH5dNZFtXg7rwgeOoKt5gvLVN5swVBrMk4HiQsmdMJoYd8wuhnqIY3@lists.infradead.org
X-Gm-Message-State: AFuF++kNQS5Z2AqlpHge6mrH8JOxIOTudAds5uuB+99owjYTo3vguEIv
	l9sVGdFANbEjzI8OKs5DdCzmnPG3wjF55odevuGlDEbpobfnnEwJ/Kok+tWcy7PPcix0OLoCQRn
	3Yjsnh8JWzoL9YUdmNH2V1z0LxDJSOAOjaQ/qh32pxp6eLVpaiC0ZDjT2/9TxT/c++qAQBijp0n
	W7
X-Gm-Gg: AYBFou26QUQh1dyMunupWUi4EBiPulgfYzTE6OyY+w5YEcTUox3YdYeQAxsCVPh1c2B
	EdE4EGDhHT5S6L//bDXvOThVs73t0gpE5Vr3gtSGkScdi3CvkeOKZ/ntLdXHWjDZK4VaC2nZwKL
	Rbxyiy7twNpYjl6Y7nBLaMTr9d23Xz3FI1amHDVMa6kqYvTSphBOQRBvLB6tCkmk16wR9SVo3vl
	cEgHnI5t/fejoM+4SdkhhthpyNjlZnF8u0VGv+5MHWItNS6vTD+tKMRU7cvka1KEfxhQkS/3ZYb
	NgKqJ7cdpeHTDrCxD5vnK7G/I+Crk1thlY/x/D3IF+ovm8tGGoLS2NcYuEqd8RBf4aVqae+5iQ=
	=
X-Received: by 2002:a05:600c:3550:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49cf7f4a6cfmr363669255e9.0.1789030655330;
        Thu, 10 Sep 2026 01:57:35 -0700 (PDT)
X-Received: by 2002:a05:600c:3550:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49cf7f4a6cfmr363668975e9.0.1789030654851;
        Thu, 10 Sep 2026 01:57:34 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49db038401fsm26614995e9.13.2026.09.10.01.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:57:33 -0700 (PDT)
Message-ID: <48f12b65-428d-4809-9735-18876b09e759@redhat.com>
Date: Thu, 10 Sep 2026 10:57:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
To: Joachim Vandersmissen <joachim@jvdsn.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>
References: <20260303060509.246038-1-git@jvdsn.com>
 <abTuFto8Tc3mhRRe@gondor.apana.org.au>
 <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
 <9926908a-5f08-43ba-99dd-b83c7067d52b@redhat.com>
 <83d09aa1-729a-47a2-a8e9-381c74e92f42@jvdsn.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <83d09aa1-729a-47a2-a8e9-381c74e92f42@jvdsn.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Lu9Pwdoi5ECHKr0SRE22LX31G1Q5Bhd5msOhKdCD1AY_1789030655
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_015741_522105_E7803935 
X-CRM114-Status: GOOD (  16.25  )
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

On 10/09/2026 05.24, Joachim Vandersmissen wrote:
> Hi Thomas,
> 
> On 9/9/26 9:36 AM, Thomas Huth wrote:
>> On 15/03/2026 01.43, Joachim Vandersmissen wrote:
>>> Hi Herbert,
>>>
>>> I don't think this one can be applied yet since dm-integrity still uses 
>>> xxhash64 through the crypto API. This would break fips=1 systems that use 
>>> it.
>>
>> Out of curiosity: Wouldn't such a system be FIPS-incompliant anyway? If 
>> xxhash64 isn't FIPS-compliant, nobody should use it for dm-integrity 
>> there, right? So I doubt that there are any systems out there that use 
>> fips=1 and use xxhash64 at the same time?
> 
> There is a risk that users may not know that xxhash64 is not FIPS compliant 
> and would still use it. Especially considering it was marked as 
> "fips_allowed = 1" for a while.

So isn't that a very bad situation? They think they are FIPS compliant, but 
actually they are not since they use an unapproved algorithm by accident. 
Maybe it would be better to include this patch so that they are aware of the 
mistake? If there is really somebody running into this issue, they could 
boot once with fips=0, fix their system, reboot again with fips=1 and 
finally be really compliant. Sounds like the better solution to me. WDYT?

  Thomas


