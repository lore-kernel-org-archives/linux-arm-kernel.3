Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA52C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJqiqUuKDfLyn4xBaXlEtsThAwLIgSsxyIFy+RU8IDE=; b=Cx/qklWXYpT6ZWkz2/WLIZCgP9
	AES0Uo0FyVZc2ii+KMbyUOK7ucKxXAUliB41+yWVUuICRF8v3wax7B00sXoIXGWHhIhxcIwN6VvQ4
	8OC1a3HGsChZQJmmrmBbr7YqzwepHcfieTPkgUwyG64DqHk5cKBIiTSzYkJaNis/HB/OpcUKSpxB2
	vKglpyNB4Kq8+XUl6xiueFaGct/MM85nTiM0QRQoebiqWdzd6oNidB2St5HLQN4zEdGG0FjczXQt2
	feuKyx9BNTYS7ibWp8bMI5pc2jghY2Y2r1jwcgTKZSRYFO42QRiKN71a/SIzW4xkkGP5z2Hrth0fr
	UEaAw1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2F1-00000007XYB-2sLr;
	Tue, 10 Jun 2025 16:54:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzNT-000000072ni-1O5q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749563458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HJqiqUuKDfLyn4xBaXlEtsThAwLIgSsxyIFy+RU8IDE=;
	b=gtPfrQO1gwpy7ky3nMvHJcgUnwEVB3quJ/H2/CXZMJqhY6ZhilWnoxguBTBlWLqvKp0v+1
	ZTdeJixfgy0Ghl89Jomz1bk1vCF2tHMT6eSlNB5suB7CiSjtxxtdqIdS9LPHxvgmYDvp+z
	O1Sn6G5VDni+gnQBAdgJoXgCBxT6NQI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-ArEJ2fEuPBCR_0-kUh_Q2A-1; Tue, 10 Jun 2025 09:50:56 -0400
X-MC-Unique: ArEJ2fEuPBCR_0-kUh_Q2A-1
X-Mimecast-MFC-AGG-ID: ArEJ2fEuPBCR_0-kUh_Q2A_1749563456
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450787c8626so31548175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563455; x=1750168255;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8AZiv2BWFM4GhtysbZzbwwVGm/Lo1Gm6qrn3+2ylp4E=;
        b=stUxJrSq+B+dSLBRHo8Fki2iwSfbgUnTtB1jJIyBZys1Ica3N5biuI5S2ItAtTGKe/
         Qr9yS2WtwadQDAEq99L5PFZHKvcHEYxSgIXmvLejGGpEpqEg31y/9voTbxQXnIpZsB5p
         beu+o3aSxI8jTNb+4lY1tAmlroMfF6c7bc7UC6RZbXRLx4I2l00u8Zyq4giqvpGk93Lo
         G1uV/PyTVvbkjReYrOMrGjaBgmb0juK6g/eXX90me5roAeev5VDqcnaaW2HpLa6vLre5
         IsxnqFe2j7mFwf7N6ntLuQkTpEKA66DhaQmNhQoKfkNuZIaEn5XSqCo/N5S0OuIirE9g
         fZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNJ+7AjnxNO+54TfL+CElnRpeOszsdH/Hyf8CiuCMepY/5q+zavaNjPl+30vXeuvKkgoK18G5yflrZVhr0Bby6@lists.infradead.org
X-Gm-Message-State: AOJu0YxgnMgS5NTz9Ua4U+8Y6PDPRqwFLOrZZFrEp1jGFrkJq5R2jnMy
	F4WHnoWE0mzJ5f0d1KuaZxv8cyCfrR3vPJOGMmRTJYAL5EqnUqKb9kdx7W29JtQKETlpRp4VUtx
	ixo8V9E4KGId8K8xudUnw4moRy2RWMbQayLJ1nGxOgqzvd5A6NsVSwIgB+Pf1YXeyEmvHP4UXbD
	0PULipE7OF
X-Gm-Gg: ASbGnctW8rMiJxLO6ihjsmvOynNDQeB2aLiauPIdbqEDXJwlXJYuvkQk1u5g5Zg+FHB
	jRcDpSroj9vt6raeAUr01Qc81jcSB6Rlu9G/5wsYuVtV0gTCIEIUDvnFCUPOWS5m0QVFaWJgikp
	Yajxt9tw8upql8mBSdMX3TAUg5mXHeGZS1DXdTZyUCMjII/H/Zs2jlMx4ThnWA4fDCxD01ekgPI
	UfyfeKBMYOk97S2Go8HJr8Hux0hzFqBUtwsflB7iFJ2kffccmqmApEyncsuNGxSW4yG8676DsJk
	POuUbPcW04vFN3B9i2VBijF4hl7irwVlfiwAe+WsmrtqeoTj35zriYtKARKlJ8zByCe+ZU4=
X-Received: by 2002:a05:6000:2389:b0:3a4:f786:4fa1 with SMTP id ffacd0b85a97d-3a5316841c4mr14614320f8f.2.1749563455526;
        Tue, 10 Jun 2025 06:50:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJKrB4JYjJGiymCLMDjzBOek1jTekdNGl4zWkT4PdFepViV8CQdeLU5rPmaZjMcFcjiosmIg==
X-Received: by 2002:a05:6000:2389:b0:3a4:f786:4fa1 with SMTP id ffacd0b85a97d-3a5316841c4mr14614288f8f.2.1749563455083;
        Tue, 10 Jun 2025 06:50:55 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452fba4621csm131448645e9.13.2025.06.10.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:50:54 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:50:53 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Miguel Luis <miguel.luis@oracle.com>
cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
    Colton Lewis <coltonlewis@google.com>, 
    Ricardo Koller <ricarkol@google.com>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Zenghui Yu <yuzenghui@huawei.com>, Shuah Khan <shuah@kernel.org>, 
    "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
    "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] KVM: arm64: selftests: arch_timer_edge_cases
 fixes
In-Reply-To: <B77F70F2-EECA-4E10-9F00-972F6AE27831@oracle.com>
Message-ID: <8f15a5d6-0f73-194a-8fa2-b7ba8cc8c5b2@redhat.com>
References: <20250605103613.14544-1-sebott@redhat.com> <B77F70F2-EECA-4E10-9F00-972F6AE27831@oracle.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x05FXfpBLJgQrgVv6aXzVNG8EvKUI-JozrIzlIpmme0_1749563456
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="-1463806286-426200590-1749563454=:18875"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_065059_500548_E09FD770 
X-CRM114-Status: GOOD (  11.15  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463806286-426200590-1749563454=:18875
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hej Miguel,

On Mon, 9 Jun 2025, Miguel Luis wrote:
>> On 5 Jun 2025, at 10:36, Sebastian Ott <sebott@redhat.com> wrote:
>>
>> Some small fixes for arch_timer_edge_cases that I stumbled upon
>> while debugging failures for this selftest on ampere-one.
>>
>
> I’ve tested this test under three circumstances:
>
> 1) Original (!HAS_EL2 && !HAS_EL2_E2H0)
>
> 2) HAS_EL2 && HAS_EL2_E2H0
>
> 3) HAS_EL2 && !HAS_EL2_E2H0
>
> Tests 1) and 2) returned in approx. the same amount of real time (about 12s) although 3) doesn’t
> seem to return at all.

I've never really looked at nested stuff, I'll try to set smth up and see
if I can reproduce that..

Thanks,
Sebastian
---1463806286-426200590-1749563454=:18875--


