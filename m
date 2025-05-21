Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDF9C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbdPpdpIurd9SvA4bpOQHcg2N+24lyWEgW2cl5m4WjA=; b=nUij/AHVmHQBg7AWQ+dhmtr6Le
	W++RoNV3isWAbYzx2MZt7uZ78aOeS2jGQ8sHLmZ/+AsORZ2O/vv5ES2dL3lE+K1vboSfCuxNweoZs
	0+wLxmw4hi2IcL6nnZU1sLWPiQKKB2YQCLmEzc50YwHQYDtifNAYBvQOl77+CTzdlR45qpA2xHQm8
	Z3uP1kUE++pZESBe3ge3FxG+xGUSKzXeAsB8ZPTL5Kdl3I+/0bphu977Qpe7ZawyybtSbMgfFQeg5
	rqHPrfTTHTikfZ4pQCoSD2rwl+LK8KGa6gctzVzjnwgVd347KTkoFg7PXHKhjX7Lu2+CZLkgwKwxM
	e7vQluaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfFz-0000000FDke-2q5V;
	Wed, 21 May 2025 08:56:59 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfDv-0000000FDT6-48GE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 08:54:53 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a3681aedf8so3371072f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747817690; x=1748422490; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sbdPpdpIurd9SvA4bpOQHcg2N+24lyWEgW2cl5m4WjA=;
        b=WarubCr6tdC0EBthon5/fRyH020AKNDVD9Frr698/mnbHjXTICV/FiQltJ+tdeQsWx
         x2ij3y5nFdrvsvafAEXrbLfv8W+rFTU1kYMtEo8PYZbAz7WG27DrO9mTWhl8N2gJVZbl
         uFHMF8lDG2zEJ2ACoqsN/eTaFsyZf5RjdIXDRlarYXRudZIebA7TC8pCPReYPBJBQ7c4
         r6HdlU2A3SIzQcgVcB7SWKL49pvl4oKRrRKcy2uXsv1mJ9yNQgqePvIWusHZtnLNhouz
         ZEXAg31doi9QjGiESXqKBdKGDlLg4qLdXeYmf6mnmfldIX4BkyQfUcB370SQZWIsT+g/
         Hz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817690; x=1748422490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbdPpdpIurd9SvA4bpOQHcg2N+24lyWEgW2cl5m4WjA=;
        b=pVVfd5RrA2u1aVM+hRlbLZWSdN+JodzBjW6BkoDDzD18CmCyz7ZbJoTqhUYpFZcGny
         vSgyt0i/I/vQv9ZMilc9a0U+Nnvs2XjXJXfcq4ILSlGcIcWuY3N43aXTJRsKJvNfbKGO
         G4jf/JSfFmj9iEr8E+jtomk3RdWHfMKorUC68FB4NEiUSMWJQdglNHKyoNum1cH+15H/
         y11cPf0hgZ+n7bVaOo8OR3O+ZMZBBOs2gIo47HdRzO8aq2btCgb9CmoBeKe3zvRHijZW
         KTF+Dx9pBVn3vEpAg15pmmvCGos4nPDGhZWn9jgDLql8UKBQFAp9Uc84oO8WU4uAuGHn
         IhyA==
X-Forwarded-Encrypted: i=1; AJvYcCWt0a3MSX7tomErCK/GsIVKQ6ZyXjWWLhLofObtJJHDtFYxGPLEKIkmOJz1cjk0J04jyQLPd++oU5bnfb+SFhH4@lists.infradead.org
X-Gm-Message-State: AOJu0YyV5XNbQM/IcQ565KP8zApHTUrSnFbMw6DQjop3Vh/PskmP2utI
	5TU/vkFgLOPYKGyIGfU1HpPKEafbNukjWgAyefm7ZxsXcaFQszQn6v9XZ0RMLmbDDnA=
X-Gm-Gg: ASbGnctIyY/XLwyISg9rWYolKWs7DXeayYPM4EPwfh2XKhSNfjuHRidd5lyvhbnhYWT
	UMXJkUd4RtmycfItdghAH6K9rtgqKBZn2ZTv+OQtQjC4kGXmqcrbywQbU68vUaH3nVIKBz+Wv9R
	Dn71TbUvDvDmkydJCk5Cs7ZQscZw/2gAVhip3iqg4MllpQaMQSRlx+3zcKooDqlZDsWG++XA0vS
	8dkBD4dz82U26kav/k19UDSdZ/VD3xwJf+/LEpYfHrOoQMT88z7VnSkHnEqgmq1xdeCIkeraKv5
	4ELhF0i6QUTtvBxZjq6+v/QbbkE/ibE305wvjX/ej3J1JVVYyvaY2H7f
X-Google-Smtp-Source: AGHT+IHcXYGtM7XVHHJEdGmOY1yvOZ0EB0s4eDSPvPzqzTL5ClJRA8YIoq/xMdJkfTjyIFVgJ2bfQA==
X-Received: by 2002:a05:6000:18ac:b0:3a3:67c4:580b with SMTP id ffacd0b85a97d-3a367c45acemr12032252f8f.46.1747817690326;
        Wed, 21 May 2025 01:54:50 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a366e08747sm15804239f8f.95.2025.05.21.01.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 01:54:49 -0700 (PDT)
Message-ID: <5752f039-51c1-4452-b5df-03ff06da7be3@linaro.org>
Date: Wed, 21 May 2025 09:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] perf: arm_spe: Add support for filtering on data
 source
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-7-dd480e8e4851@linaro.org>
 <20250520134632.GR412060@e132581.arm.com>
 <443141db-6950-4a15-83be-ad9e9c0e03a0@linaro.org>
 <20250520161003.GT412060@e132581.arm.com>
 <20250520162243.GU412060@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250520162243.GU412060@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_015452_035452_0844F272 
X-CRM114-Status: GOOD (  16.44  )
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



On 20/05/2025 5:22 pm, Leo Yan wrote:
> On Tue, May 20, 2025 at 05:10:03PM +0100, Leo Yan wrote:
> 
> [...]
> 
>> If 'PMSFCR_EL1.FDS == 0 and PMSDSFR_EL1 == 0x0' is the init state, as
>> you said, when user passed 0xFFFF,FFFF,FFFF,FFFF for data filter, we
>> cannot distinguish it from the init state, as a result, we will fail
>> to handle this case.
> 
> Correct a typo. The case above, it means "when a user passes 0x0 for
> data source filter ....".
> 
> Sorry for spamming.
> 
> Leo

I'm thinking I'd rather leave it consistent with PMSFCR_EL1.FT and 
automatically enable PMSFCR_EL1.FDS for any non zero data-source filter.

This means we don't need a tool change to set some other flag when a 
filter is provided (even if it's zero) and it's much simpler. It also 
doesn't prevent the possibility of adding the enable flag in the future 
if someone comes out with a need for it, but I don't think it needs to 
be done now. TBH I can't imagine a case where someone would want to 
filter out any samples that have any data source. Surely you'd only be 
looking for a selected set of data sources, or no filtering at all.




