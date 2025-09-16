Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4904CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBk3cgVrEpdZ+x59L+pHlmsugwnIS3miRhoSDYBnqO0=; b=sRyrc2443vA52hW9M5BjgA+VA4
	zULbyoo8M7ZgPYFBnI8VhLLXDq4FsVs5NbYzRHmh66sASMq6fLFFKzLzu54hyKyrKRTu/qLAZLjTQ
	RsdsBCEijIWzQL6aXCqgMlpHATdsYqrHAUK8BBEY7KZykYScds5iBl8Hyup82uvyLhvjI/PBuI2ZS
	GnB1QUfvfKkgYhMafoVaF9pllq3qh/+qtQ5LkRHgUuq/czod684HctoOi2yQNVo6chBFlWIxMVGeB
	CVOKCSFUXQ1mmyod1/p9hpTEeqZlmNg6MJJRSZQ6BuR4Wv4Hx6scdTkcE8V04kZt17WG31fRaf25E
	dMFagbQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXax-00000008Hwo-3Nhd;
	Tue, 16 Sep 2025 15:27:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXav-00000008Hw8-26OB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 15:27:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3e8ea11a325so3841069f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758036468; x=1758641268; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zBk3cgVrEpdZ+x59L+pHlmsugwnIS3miRhoSDYBnqO0=;
        b=JW/+k5yYy3Jo7qPRwrJGoWZqNRbgDZ2LebnYVLmYfDGQgpuqlUkue+iBXez+gXCa4F
         bxnT41aiulOAvJWFDaaJpMZUA+ImYu+ZIZOajhodKbWo+w77DUSIsz/jluWOgFhsRlVQ
         xsB6SjQsb+MbMOckV3q3EfU1QKgieRoDrMRhTfloqnmICN+qTVxaSy+3uZYDkiY4kRIt
         vXKY/FAkgosQp/C8tUioh+zygj2XPXugSyh9rLQEq3SaP0k7GOQ+/wRA7PJIty/AmXZK
         muyzLSNuqKRHz+W731DYSUJlKp2UiN2Mz1HaR3U3iPtjGQvLVL58ivHQQVPIlLBDwCq8
         d3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758036468; x=1758641268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBk3cgVrEpdZ+x59L+pHlmsugwnIS3miRhoSDYBnqO0=;
        b=LP/KNu0H0cjc4mTHYoGwTrCTCoq8WFt7uHzsts2CHD+DuKyfD0gUUY+GlTTFWgPRn/
         F+0ysh7345JipqlZgr86exvSbGNAnB7SDQm4RprfeRZn/GWP7KlpPU/gHLcy4bpzwCJ2
         Bd3OnrOFPgMvCg4wmGvdZPhGXQFxx8SvxC/niD6+MxasnegsMGTd16FbD5YeR0xtVL8i
         jlCiT+r5G3wVnOPKfgTPbQKN/6KrD9Hm+rDJCEDbsOJjKOn1e3EPcfsyZ6cX6nzsOWXm
         auiPFPV6UYztREv7O5sHG0UI5/eNPnyCdrTVMWjtIrWSYfqCQQvzfM+LSPp7bTISjwJF
         TEmw==
X-Forwarded-Encrypted: i=1; AJvYcCU78Rh/crwNja6x40Yblp+bytApK5AG0IP8JsRuG6YW7aTf0uHQRO63lDc8NRUhlDEeCxkPN6QoM5JoLbyZLIR5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Y4Jwm1xe0Wpg0LGNkNV4waCKP9f/VamaeuHEqsGaQhlrz+m3
	HZ1Na5T1ruJtVohud94xrOUvMrT/aqTFs2p2MNOjgjGPlUM9g427l6zbCDKOzGYcUF8=
X-Gm-Gg: ASbGncsY9nU2vB9ui4ISvsMbgN7R2GeuZpMHGAxSu7xCH5YkzdmNR7W+ij0YS7+ZgXj
	Q6t8mRrD5XCYKsEi6/fcnpl8dtM4SXLqksiWhAizdvzgBmXZrPJ++Gwr6lqFntwOweLQXjZV0af
	xpWxmjtQHiGYMfqSE4b2uNtAmP4MBkuxIOP2ZMOVJxlc7axblOUUh78pi16CXLAQUMAZsQLg3qL
	1GYhzNqOz/5lQrZSeQkTevcnaOGcABdjSgP69xjO0S645HLVFkmoGH8atkrz8EQOtHVvFVcpTUm
	5IPQNTREmQjK1TOAN/y+JdOg+3lwU1KseCM4yHmOjyzHfYK8WCntezQDqVYJxHmCF5zlHaF/28W
	oyfSqUoLjfVzpRIt1iPeDC1sDLM0zUA==
X-Google-Smtp-Source: AGHT+IHDwjfQuIQJuBkMmBQqFsxSOzTJndqBY6wuQhoBVd+d/7RL64/dV9lAVoQBQ7xySIf7p9k7wA==
X-Received: by 2002:a5d:5d05:0:b0:3e2:c41c:bfe3 with SMTP id ffacd0b85a97d-3e7659d3a79mr16152029f8f.38.1758036467575;
        Tue, 16 Sep 2025 08:27:47 -0700 (PDT)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f27f44624sm148981005e9.3.2025.09.16.08.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 08:27:47 -0700 (PDT)
Message-ID: <f9e90d18-ead0-404a-937e-f5e2cf11c0f7@linaro.org>
Date: Tue, 16 Sep 2025 18:27:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 00/16] Introduce kmemdump
To: "Luck, Tony" <tony.luck@intel.com>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: "kees@kernel.org" <kees@kernel.org>,
 "gpiccoli@igalia.com" <gpiccoli@igalia.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "pmladek@suse.com" <pmladek@suse.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "david@redhat.com" <david@redhat.com>,
 "mhocko@suse.com" <mhocko@suse.com>,
 "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "jonechou@google.com" <jonechou@google.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250916074929.xiait75tbnbyjt4c@hu-mojha-hyd.qualcomm.com>
 <SJ1PR11MB6083477193D9EF7CD10DE9EAFC14A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <SJ1PR11MB6083477193D9EF7CD10DE9EAFC14A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_082749_574300_2B6F0057 
X-CRM114-Status: GOOD (  10.83  )
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



On 9/16/25 18:25, Luck, Tony wrote:
>> +Adding some pstore experts to bring this to their attention if this can
>> be followed and if they find it useful.
> 
> Depends on the capabilities of the pstore backend. Some of them
> (ERST, EFI variables) have tiny capacity (just a few kilobytes) so
> well suited for saving the tail of the console log, but if the user specified
> more than a couple of pages to be dumped using this mechanism, that
> would exceed the persistent store capacity.
> 
> -Tony

The backend can fully decide what to select from all the regions.
Some regions of interest are named (listed inside an enum with an ID),
and some have an incremental ID that is being assigned.
Either way, the backend can choose to ignore what is unwanted.
E.g. patch 16/16 where the kinfo driver selects just a few of the
regions which are of interest for Pixel debugging, the rest being ignored.

