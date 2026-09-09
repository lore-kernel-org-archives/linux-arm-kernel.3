Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8EBC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6z0vb7jFmVZwRL61UmhAH1J2R42fJJdVb15beRTLwfM=; b=bfgjAapVWKd8a/L4VAlFktOvUV
	/ZSB+wpFxTbo0yS+2TMlCgot8PIp+Dsf7686iWlPQMz7OLcidC6JX4CRuDrZPTy/cdX7sCZ5Lk+jz
	0+KNtsLy/lXgJQ+8zZJEKvgGH8FX8+WIkWpO3xJj5e+lyXU8gTodMwE13SS7o4S+LEObzMbwf8pwQ
	RNrQ+OoPwwpzzsvd2rNVzKdV7advetzp0Vcju3fJ2javS4+RbmTjDzTDd1lcz41DF714l8W0I36rR
	Zn6K31c6nYAF48X41XgXo99MI0JByUNAbB8QyYT0fk0cNHt4A4l6v5qYfkMEdXsJX12W3UM9eAVpy
	vRcXh5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JQD-0000000C0ar-0BmM;
	Wed, 09 Sep 2026 14:37:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JQB-0000000C0ag-3qXw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 14:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6z0vb7jFmVZwRL61UmhAH1J2R42fJJdVb15beRTLwfM=; b=BqZPq+T4D6FL2jaGRulPQDMFlG
	HVbspUdUv4d6vgCUVMh7Gol3229SUDj4sg/KmydtDG0ZzZx65816PFxkQx1i/5XGzqBxfq5WaDHoO
	oMvuPoEM40CcmCbKXj8bt6+qtZM5oEONp/T+jkxWPTg520T5hHyvOYe4UT0DG6B1kEaugjfUYEGP2
	Em99XbBHaDfv3O2g7EKS5asUDT+RHcgUg7tgLYgGVvYONAgape+myF+W8YSf6CAPgt7B0qxtjPqEV
	QrIsdwdxHL5wWGN+0sZ/He1WsmGWAzMp2qDzvo3VmN2m4v5W4n3aQTGiAlVMKXU/wizssiohmEs26
	7+CD7Zpg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4JQ8-00000001J7l-3d48
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788964622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6z0vb7jFmVZwRL61UmhAH1J2R42fJJdVb15beRTLwfM=;
	b=UjmRnded83ikLDdM0IDvfjIoNCOC/t/pvTR1SCv2DbGQ4wSJtT7av/9cONQjPyXkxbcXjY
	x18/uNhZSDnafsHydzCwjFVDf7j5R5nwjvuTAXfbRieiozCdJIjEEWCeV+xawAKS4WRU8j
	pFN9jkdIJv2XcpHd6wAU2pO+kLcWR1Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788964623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6z0vb7jFmVZwRL61UmhAH1J2R42fJJdVb15beRTLwfM=;
	b=F1z9iintEuvyhM/OYjZGu4Kbq2Hn4lniV7Cxi4jvvCacVyCBKw0qLgo40hwWzLcr4Hbzc2
	YjHQYZ/vN8o6ObdrKGzxcMw1uh4NzzsGXIP7MiHWqCpzzZ5t3MrSnLV5XWDpS6sfuvnljB
	KHkJGtRy9YHFGDT0CjWHwc8mKWmK+8Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-MWk9VvKdOdWQjxQMkuHRJA-1; Wed, 09 Sep 2026 10:37:01 -0400
X-MC-Unique: MWk9VvKdOdWQjxQMkuHRJA-1
X-Mimecast-MFC-AGG-ID: MWk9VvKdOdWQjxQMkuHRJA_1788964620
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49d0ae342b9so29950015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964620; x=1789569420;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6z0vb7jFmVZwRL61UmhAH1J2R42fJJdVb15beRTLwfM=;
        b=Pmhxp1ofAB1KTV9WNgdnDj6wR+pgMYoXz+mBYLx99OqxMvGjqTLP+x+GsD1pdHRp7b
         8LaorGczmbxcMwcsG9a5rtUW0IVOf3D+6SWzddZP0GsXqnp6Mxh54WgLlRQRWIitzkk8
         cR09wT04vbW6yrf8v+c6higdCw00zndl/qrZ9orT7trGGAjQYo4MdLsNqCAu0uXzfv6U
         u9y4LQnAp/QMLcYDRELFCMb6DktAX/JbKBjjGy0BiM06VvppDz6jTij2DB6o6ZadE2v1
         +nEkfUUTxMfIucdAvg7SPDAGvydQPFTx7aKP41bO8lZZtAPeA0LP1GPzupIDxl2RIwUf
         8AeA==
X-Forwarded-Encrypted: i=1; AKwUvBzv306+b3T1rkyQDjBm5rNuUzj7vnGFntC+PcEPWFTixpseSIcvjchqdS7/9nWmwnasCafnPCgXW4nGIfaGVYeX@lists.infradead.org
X-Gm-Message-State: AFuF++nQ2I7I87/jdZEMXQyJflJJVgXByVpDR/MtOk3ghYZ0TQbHOSUX
	CyT4sNGLjlamQ1f0JCC6UkRQZFCp3qu+wdyvNwpF2FSXFulq5kDIEhk06iTeEePQ7lkfA/smWGk
	9pY830Ju3G00aEISNcMnS8tqEb2GdtV5kP+ujQSxiuLsqq/cx7xGyJiH4Hv2e0oaVne28pzRI1v
	1l
X-Gm-Gg: AYBFou3vq0SvM8Ksj/extY6a1c7q8dBbnqqSjHyd8rWq8/K28MUPiXOCbxXnbFrq4Ko
	gayhdjKfEVjAwxuM5qFe3CfE1KK47a3rkJx+wCpEnsy4YemNHLOwmbXq7bdg5xDULo45aM1i4mf
	7k7sS8BytxjlK86KbcgDZQNd0RcZe+1UThdLEGLcPLgwSI4AQ0cT5yEqC9k4detGorwnRLLQZBh
	zJCalpDeQ6k8KzcN+r+Xn7wORNfF/DOXtx1Ca8y/yeXFjQLmdDjnJPygUsmtP92XNeG9rHt3F8I
	g6uJTJ/WPAnItIvOp24vE0vcZLAIFq4JwqhNPos40VAEXUJ/m5pNglnQMs0LIAs89UH9R7Ahzw=
	=
X-Received: by 2002:a05:600c:3588:b0:49c:fc6e:a3d7 with SMTP id 5b1f17b1804b1-49cfc6ea7d5mr340867405e9.22.1788964619789;
        Wed, 09 Sep 2026 07:36:59 -0700 (PDT)
X-Received: by 2002:a05:600c:3588:b0:49c:fc6e:a3d7 with SMTP id 5b1f17b1804b1-49cfc6ea7d5mr340867045e9.22.1788964619344;
        Wed, 09 Sep 2026 07:36:59 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm559571965e9.15.2026.09.09.07.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:36:58 -0700 (PDT)
Message-ID: <9926908a-5f08-43ba-99dd-b83c7067d52b@redhat.com>
Date: Wed, 9 Sep 2026 16:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
To: Joachim Vandersmissen <git@jvdsn.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260303060509.246038-1-git@jvdsn.com>
 <abTuFto8Tc3mhRRe@gondor.apana.org.au>
 <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tjvoHZFpBlMiqGsSImyZUDWjz3p1YUxuoaKClV_U7cg_1788964620
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_153705_092488_AF41E170 
X-CRM114-Status: GOOD (  16.24  )
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

On 15/03/2026 01.43, Joachim Vandersmissen wrote:
> Hi Herbert,
> 
> I don't think this one can be applied yet since dm-integrity still uses 
> xxhash64 through the crypto API. This would break fips=1 systems that use it.

Out of curiosity: Wouldn't such a system be FIPS-incompliant anyway? If 
xxhash64 isn't FIPS-compliant, nobody should use it for dm-integrity there, 
right? So I doubt that there are any systems out there that use fips=1 and 
use xxhash64 at the same time?

  Thomas

> 
> On 3/14/26 12:11 AM, Herbert Xu wrote:
>> On Tue, Mar 03, 2026 at 12:05:09AM -0600, Joachim Vandersmissen wrote:
>>> xxhash64 is not a cryptographic hash algorithm, but is offered in the
>>> same API (shash) as actual cryptographic hash algorithms such as
>>> SHA-256. The Cryptographic Module Validation Program (CMVP), managing
>>> FIPS certification, believes that this could cause confusion. xxhash64
>>> must therefore be blocked in FIPS mode.
>>>
>>> The only usage of xxhash64 in the kernel is btrfs. Commit fe11ac191ce0
>>> ("btrfs: switch to library APIs for checksums") recently modified the
>>> btrfs code to use the lib/crypto API, avoiding the Kernel Cryptographic
>>> API. Consequently, the removal of xxhash64 from the Crypto API in FIPS
>>> mode should now have no impact on btrfs usage.
>>>
>>> Signed-off-by: Joachim Vandersmissen <git@jvdsn.com>
>>> ---
>>>   crypto/testmgr.c | 1 -
>>>   1 file changed, 1 deletion(-)
>> Patch applied.  Thanks.
> 


