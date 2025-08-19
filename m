Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10B8CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFC11YRDk3hLW4PFqQxAfzM0vOushhRghFk3Gc6p2xU=; b=2tgk8bsvqPw2xu1QvzSfMfnMT0
	/WetjToAQkUy/CG1Hkc888uxRM3QQC6JOfoGgC0UX4fu1g0YH6fu7rsCXk17u/PtPaNtOsSOXYqLF
	qMAzzWPAXt4IK6fQWUKAOAr+Q42TWI3/04HeGcp/RZk3vIXAwg+bRZKRDY+jLeZZZ7Ud1sihNa7xJ
	WYSMPO5RpdnMQ4xUSiuVOxRKFjkWplzcpPhNS+u2Geg5cPwIkK51ed1NqLTRjqId2o8vpa6ujYLu7
	VJT5RJIYmAw67cUJfsZdG3iVjPjMi4n+SGaIR5woQydBwg/NKNhYHdNaOTH6rVDTOZ6rzJKmuSGK8
	KVuP2Udw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIWA-00000009w8i-0Pli;
	Tue, 19 Aug 2025 09:20:34 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHwz-00000009qDT-3QZn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 08:44:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3bb61aff394so347517f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755593052; x=1756197852; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFC11YRDk3hLW4PFqQxAfzM0vOushhRghFk3Gc6p2xU=;
        b=c+vAwU5nruLYNvP1nKqTgOloH+srR5v0hzilcD6uFu4E+xMw5kjR5zz/aDCSD77Uz6
         juusCfnhprGC0qPS+9vZ3VAXi7s44mb5x7z5z3PJ1ed+Cag4neflHZV6MXX8VXYD3+cm
         nKNw3e7JO++/igR3WFdZ/YzmcANkqTPtpGmKqSfjpGU6Kbdu1OjpKg6ADh5XmreX5GYy
         M8E6atCUl2IWHCJ15Tk7yeOv/kr47ZgldmeJW4I87G1SJoY2GNIH6ArsM38PJEcGOU8S
         soIO1ie3oTwNB4oN5O723+ocdAAqDCYi2kKlVDZj47uNwEC8SEEOfpHx60xB9i/byZyv
         YG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755593052; x=1756197852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFC11YRDk3hLW4PFqQxAfzM0vOushhRghFk3Gc6p2xU=;
        b=mqwof/+4agGcqffuMxXDkMPIJEAIQYXNfJRUgFcCbafTTMtm/quiNVoewe2ZvDSle2
         +2nwgdojnxjF5I9w8Za7a9bq4iznwMbdS8AZjt4VSpCu5+VZRxBWAbd+woyrNzbXidhL
         BAZVPSOdk7PBUdAlldESBXesDV8JLwNoaB3bK25uRBXfvfHhUdQq79cnHDPeCMksfca0
         oP92ch2qdaG2dn0Ir8BJVBdgYg85i0jdHS5IW5U1fmK3w97LgWCEUm/EwbB6mVzU5qYq
         Pq/XeMxSFqfnGelYDk4XhzgBicoxPsUmX0O1A1iV6TOb201cFWFhfhty3LyZG93T9zlQ
         IsBA==
X-Forwarded-Encrypted: i=1; AJvYcCWGzJPfFD6ruTFmxnGAjFcJNZfbxl9yJLLSTc5BPPOl9qSKWefQk2x0D8IeNn5yOz2OUb6PXTGiZLEmFN13F9Lk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Wj04tNei8mjm0SYgnKt8gYQc1Fu40pPh//6j0ZmgPe75jVYu
	YcNk44UrPF6f7CtSkapSviUQGuNkgmGe0bmd6Tzik/pzB0mb4a7MG8J3
X-Gm-Gg: ASbGnculXIaJi//ZV3DNFykFheasEN/BImvBOblX35mLbi5nhVT9M+XkonzTXsLdtmq
	shbxW99tBlo4CH7kZNBcfHnYv+iULLlCd9yR5aha72q/17FcdWFk679VU7Azd2O0ruM7kGnYWFR
	XsVY2ih8GTNDanwvI6Qv+37MLvSOnvwrYq8rAYH/pDqrNDHOu5uaaQz3XIZ/YXrRkw/p3W2uHoL
	ehXw4aEZwwgDYArcY8kNktbQULh3lql8JP3OhI+YTycFLhw7ckkZTQ/NKsTKbrCy0IDt7W5ydyj
	oEa3ffwnVZrX4be5SnO7Lxi7zNQuz7ktT2D7hCIvtSjMvRgCj0pxiwXKmNdldeSguXMmZTYhJz4
	Xg4E+00i8r7Uijzln3eoSbt/9NNbltC8UQnQcJKUvXNRP7GU0E9Mx
X-Google-Smtp-Source: AGHT+IHofOdCeurN0rfQapxXw3T6dAf9uK8p0WB3BrcvzYJ1fUnpaHB4/Gv3aeR19imEmN6Xr0Vjbg==
X-Received: by 2002:a05:6000:2884:b0:3b7:78c8:f23e with SMTP id ffacd0b85a97d-3c0ebfa85b3mr546045f8f.7.1755593051742;
        Tue, 19 Aug 2025 01:44:11 -0700 (PDT)
Received: from [192.168.100.5] ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43987sm2789350f8f.16.2025.08.19.01.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 01:44:11 -0700 (PDT)
Message-ID: <17e83e3c-1314-4198-82eb-ffc18454e344@gmail.com>
Date: Tue, 19 Aug 2025 12:44:09 +0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64/mm: Update create_kpti_ng_temp_pgd() to handle
 pgtable_alloc failure
To: David Hildenbrand <david@redhat.com>,
 Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>, Joey Gouly <joey.gouly@arm.com>
References: <20250813145607.1612234-1-chaitanyas.prakash@arm.com>
 <20250813145607.1612234-3-chaitanyas.prakash@arm.com>
 <4289fc02-8e09-4d33-a4a1-0e4b268b008c@redhat.com>
Content-Language: en-US
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
In-Reply-To: <4289fc02-8e09-4d33-a4a1-0e4b268b008c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_014413_856471_CFBAE154 
X-CRM114-Status: GOOD (  11.27  )
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

Smart! BUG_ON() ends up in the generic “kernel bug” path, which on many 
distros is configured to continue after printing the back-trace (e.g. 
panic_on_oops=0).
Since a memory-allocation failure in early boot is unrecoverable , we 
must force a halt.

On 8/19/2025 11:41 AM, David Hildenbrand wrote:
> On 13.08.25 16:56, Chaitanya S Prakash wrote:
>> create_kpti_ng_temp_pgd() was created as an alias for void returning
>> __create_pgd_mapping_locked() and relied on pgtable_alloc() to BUG_ON()
>> if an allocation failure occurred. But as __create_pgd_mapping_locked()
>> has been updated as a part of the error propagation patch to return a
>> non-void value, update create_kpti_ng_temp_pgd() to act as a wrapper
>> around __create_pgd_mapping_locked() and BUG_ON() on ret being a non
>> zero value.
> 
> If  my memory serves me right, panic() is preferred in such unexpected 
> early-boot scenarios (BUG_ON is frowned upon), where you can actually 
> print what is going wrong.

