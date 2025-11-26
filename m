Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D1AD1039B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKxxWS88sRLsch0GDN5eUzk0Z8XTysZ7hNh3XkKXTY0=; b=SeFoHAuq+l2Dik+xeViUp91CUd
	KHStmuHBlyKTK8ZclNqZwot3ZF0YU/QgKROLLd6edyksXApF7eXnTTdhMjN9B1dNRwZfr8XVTatiJ
	9xhFfG+rU8/8UCQVjX1nv0GfcxaFVQMXTzijfVMunhJYJIVvBWZ86Fir7sPrvMgI/QhvtzMK4Hrdh
	AhDjA7FU1qYl+Vo9VEoxL7e2p1RadHQwo0gzv3m0f3L07mjcceb6wmnqgttDCO3dpIGyA8b2Nrfqq
	0XZq41tSutKZJ6eU5mLjCnRxH37oudaxZ77Hnu3R1eMQGckTiErBzyq4lMv01U7hQQQakAfstHUEY
	baMl1wbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJ5o-0000000FNHx-1Bon;
	Wed, 26 Nov 2025 17:14:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJ5l-0000000FNHY-0V9I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 17:14:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso41465995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764177247; x=1764782047; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EKxxWS88sRLsch0GDN5eUzk0Z8XTysZ7hNh3XkKXTY0=;
        b=cNE47hs7osc1kpfVARgEol5fLDHd8Xwq4WieQ9AZ05xcYrFRroIzQNtNFkBZD8tV1n
         1LDK0vph4t3BfsaG4iTiXtOYD+IL9vRAVZvuAmQuKjOJ/3oLf6xWAWOel4oTiG6g24sD
         eQ8WSizfN0Q0aXwWncK5TpW/94o10lNFufXcYWdeo2jjyMDqyscCL8KlHEsNqg+tGwdx
         wtsW6Xg4KZP1OLn203N8W3PINhTmgFOMmGGs8G0c8EF8W1dRyi/2+iAubHpSoAFKGBvv
         HSAGeeonghHS9+Bn6Y8cyTCiTQHZfH2IlimjIT0inGwoli2A7EEsJTkdVTN6XlzmusgL
         mHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764177247; x=1764782047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKxxWS88sRLsch0GDN5eUzk0Z8XTysZ7hNh3XkKXTY0=;
        b=OE94Qkc1CVyYBQuF+4E4mFccKpVn0pw3U4vQpYaNci4j/Wru3FgxNQrBYJBp1WWFxc
         bhVvDW7vIbCEOIpoXCyc2TypwKrb8Sgj3MgaWaysFXpnQ0cwZ41nD7AKGEpvCmEACYl6
         hdrq4Ks32B+t4FcS72kCiENnQH8wGRVMarTS0dctomzJkbgCEqw9UgRiB2V6Bc4IVLd1
         4MUvMQtL83EWN/g6Zy6sLbrtCYOuCmp19dp41ofQHfQRLR8SIdn4YtRuVQhn9JRZvkKS
         Lzx6iAPOm1WkF4K0TEqCE77Ko0I7yyaWGaqeX9HmrFBbYiUa1Esd8LPFIk7/EOYmVcFQ
         QvnA==
X-Forwarded-Encrypted: i=1; AJvYcCUQfkjFD1KecG4VT9b+O6lvdIW8ZtecwR49crEVV+dx3NFqgTSfpR5jKhEgIkuWHYy0DnPtpMnlWoTKScNYGM65@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6xmZWDOAvocukSwQKy3ZHWZxEIOtL7fv+eC4Tv2HaU7lr9gTH
	89AoNp/OhGiH+wKp2SXoo8DolVBMsN1f1dDhLJpwvrHpbjaCoLff1IC/
X-Gm-Gg: ASbGnct9TmYbYjN4s0h/wXek8R8PcMQWVGs8mLA0S61E7u2gbR93Clza/D2eL3UPCOY
	+5YXWf3eGRNFL0TcevROs2ls6nKPCJVQwE8MkIxdMetjMp6OdqamUyVke015gc7CAygsiHmSbYV
	A9N739lsKaOYdeZq5DEGIDzZk3q+9YyJ8Vaj3Yb3127/DFhhBBHwO0a/tuRgNSsNgGQJ8dlN3A7
	cJmIszWZcZu+r+QFNZcDztyTWpttIxmb8ON2e9/PKTN7zSSVBv5LlCDtYgbowbMrI9tgg2dgcrY
	yJYmGEyD4GjKKxmBcYlO+hEYMtHqxmdIxmiFInK4yROsIdksuC5S4nRBjBU3kqI+JVt5srqkEpX
	Ppv4YKVWa2w5SlKKZrTBUYRCK8d84meJKbiue8EA/fnHJda+7WTIIOQdMSPr4x/BaP67GexHtrq
	68+gSMeOusM4+h9s7H2ftYzapOpp1eFCuDAA==
X-Google-Smtp-Source: AGHT+IEeUlabJkkeU4URSCYq6YEVT7i8LLPu8eSrASZVzCkAxvaNf+MzxONBZP4ebaKs4/OMcLwVpg==
X-Received: by 2002:a05:600c:1d1b:b0:477:9671:3a42 with SMTP id 5b1f17b1804b1-477c1133e4bmr203373495e9.35.1764177246757;
        Wed, 26 Nov 2025 09:14:06 -0800 (PST)
Received: from [10.24.66.241] ([15.248.2.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ffesm42577404f8f.10.2025.11.26.09.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 09:14:06 -0800 (PST)
Message-ID: <5cffcb56-26f7-4dac-a0ae-44329084d27d@gmail.com>
Date: Wed, 26 Nov 2025 17:14:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] KVM: arm64: Add pre_fault_memory implementation
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, pbonzini@redhat.com, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, shuah@kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, isaku.yamahata@intel.com,
 xmarcalx@amazon.co.uk, kalyazin@amazon.co.uk, jackabt@amazon.com
References: <20251119154910.97716-1-jackabt.amazon@gmail.com>
 <20251119154910.97716-2-jackabt.amazon@gmail.com>
 <86see3r7e9.wl-maz@kernel.org> <86pl97r3ox.wl-maz@kernel.org>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <86pl97r3ox.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_091409_197994_6323923E 
X-CRM114-Status: GOOD (  15.61  )
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



On 24/11/2025 12:54 pm, Marc Zyngier wrote:
> On Mon, 24 Nov 2025 11:34:38 +0000,
> Marc Zyngier <maz@kernel.org> wrote:
>>
>> On Wed, 19 Nov 2025 15:49:08 +0000,
>> Jack Thomson <jackabt.amazon@gmail.com> wrote:
>>>
> 
> [...]
> 
>>> +	fault_info->hpfar_el2 = HPFAR_EL2_NS |
>>> +		FIELD_PREP(HPFAR_EL2_FIPA, ipa >> 12);
>>> +
>>> +	if (kvm_slot_has_gmem(memslot)) {
>>> +		ret = gmem_abort(vcpu, ipa, NULL, memslot, false);
>>> +	} else {
>>> +		hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
>>> +		if (kvm_is_error_hva(hva)) {
>>> +			ret = -EFAULT;
>>> +			goto out;
>>> +		}
>>> +		ret = user_mem_abort(vcpu, ipa, NULL, memslot, &page_size, hva,
>>> +				     false);
>>> +	}
> 
> And thinking of it a bit more, this is completely broken. What happens
> if the vcpu is in a nested context? You just populate random pages in
> an IPA space that is not relevant at all, corrupting the guest state.
> 
> You must correctly handle the context the vcpu is in, instead of
> assuming that this is the canonical context. This means going via the
> *guest's* S2 translation, just like handle_mem_abort() does.
> 
> 	M.
> 

Thanks Marc for taking a look, I'll update to fix these issues and
address the other comments.

-- 
Thanks,
Jack

