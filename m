Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18646CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4E8iZjMgWKr83Y3OdG+F88zPtRgQWu02JkVMPZweas=; b=j4ImO6/2c/yBz+vvp1qmF27/2B
	oiOhbULakpp3OakUpv/uLGDO2wbMxtSX6vWBwXs44BUidrtrDDHdSy0J4b5TUvLfYN5AUlJsGX/7c
	cKH3Lioe48OVbmciB4++n8djwWh5Btr3+wun1vhcAyZIqud9gwE1ruo8s1eqkFi0UEIh51Win9RQ/
	UbLFShd5soH+8ClnBDPZpylLnMWKeT+n4YiCk2yt8yK63UBE+DY9DWKDCOGScYYy91cEBtW/nTaih
	2h2eD4i7XM24ODTY2zHcjRlz4t9UdmU+MBoviw+9I9CUoe6/0y2jmHrWjJJRAjVLw0UhjNTHatvhE
	GhgQ6IXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbBn-0000000BRnG-37gK;
	Fri, 02 Oct 2026 11:12:31 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbBl-0000000BRmh-0wTM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:12:30 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912df756so56640265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939547; x=1791544347; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4E8iZjMgWKr83Y3OdG+F88zPtRgQWu02JkVMPZweas=;
        b=TY5PS/gMWXCXNRn3KEb8Q4/ZFROjcWEgAMk51rafmX0qn58KOK5H6uymyCncSbnXHH
         GuXE6Jr0L/TwieOdYw4zRIdKYrOLVYwxDXOvvBSMgtUEsePvX59ipIxntUe/MveZPpkm
         NeNtCGNeiAXTMBHGaZFhQP5tcGh0zjgd3cDB5ktGlO9yEuw9P88JdbWdJuATMfcRw/Cc
         Z0XUwQd1A2Y8+5i4/74+2F22nmQ4SWbZPW8S7yfF8RXhDi8PktSQciTv1n9AaxTRQr4Y
         EXLqZuxuFfpg395j3m6SzBmRVUZzpgKQKWovs+wc8skGjIVNnZvcev3bOe7Ing+WmMFu
         5rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939547; x=1791544347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4E8iZjMgWKr83Y3OdG+F88zPtRgQWu02JkVMPZweas=;
        b=xhTfl6ZatOKOSH6FWKhw5ZZEbIYhu2kSqHNI9fMf9QXjuyXH2hro+QtojCHqVXjkDg
         gPAbAbHvX+oV/ZxXHTXCZY3fo7rzvpTNFDDSCd+F/q7Haxn1EV27iy6OSuMBEy7UoFnr
         lexZM1TCtS+BaeiBPqkf4QsBNTSGmzuFfvvGlFLYiyEij8OPQRbWOH6ZxODFm9t9C1QF
         s7uJMr15chn1H4itLKS9PYvFfepZlZD9CAzLoHpYyut3jIxmtX/3mpkmYQl9GItulOIT
         z7v6iQcPdXnEplYOHG7dzHZe8zDoyH7kAzsSB0l0amcCEWs3773yM/+HCRm6/ZlQgqfx
         0CHw==
X-Forwarded-Encrypted: i=1; AKwUvByqQyQ7PciXcqglgGueuomEPCbeLGP84Suh8q8vibZiAMvwhyNEoP4c3HvN33CexaWQ3m+F7FQwx1o9Xnjw7Dqd@lists.infradead.org
X-Gm-Message-State: AFuF++nTD8aMin1/EQm/MPXeWU45RTd/LLu4cAOBKSWlIiuNVG7T8ctG
	Ko9v0CKkmziH7HVtmVbYGC5EETMCjFkMRIGjHL/QUkRE9RRA4f9pmV07tFf16k7nLUY=
X-Gm-Gg: AYBFou2t6mDNIGfViIDd1lyIf3lgl+wce8MCh1r1r392COmX4iAf/ipuG5j2Z59I8KJ
	UOqxugEAQGTexOxMUjuvzBO98hnbbLNZsIJussJq1spKNsWqx8H+ZDf7sdv0MNeTSC1u9ypd2Ao
	2KaUMPnTjlNsKj5isk7lpRBxeEs1E/nhu8gtm6Y8J21BmjH0ZABvvJ0H+pcn65C2n2FZaC1SNsM
	d1aALrFC/DSzHrO5zem4gt0s5AJBtTIoqha0t54enm5FQyVy9VI3MBHMDNhBGkvjLTJopDUnXJW
	R51r6vFqEnLJ1ro2JFmq8Fuj/1pjyhS62ByEx7JhKlr+wcAYy1qk1R/LttCVZYnVk1eoBIFcHgW
	/1AVJvarZWplMdslmV4/GOzPFw1o0iInOE12rGDlYVtIuRsA6ZWT0RVfXHbzBe0b5uxnMPDvunZ
	RQR0e2d/++sdIqH77lD7TPfnVxHAE1pL/HL6RcXwQDghjvothA2M6F4DO0DFT2t2MsJJiJyxSDx
	CA=
X-Received: by 2002:a05:600c:8b77:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a027564df4mr41427285e9.19.1790939547101;
        Fri, 02 Oct 2026 04:12:27 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ae1sm5204513f8f.39.2026.10.02.04.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:12:26 -0700 (PDT)
Message-ID: <a300ab54-67ad-4081-969a-c1ddef69b8ea@linaro.org>
Date: Fri, 2 Oct 2026 12:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] perf: cs-etm: HW_ID improvements
To: Linux perf Profiling <linux-perf-users@vger.kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_041229_302739_33521F8B 
X-CRM114-Status: UNSURE (   8.03  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 02/10/2026 12:03, James Clark wrote:
> prerequisite-change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e:v2
> prerequisite-patch-id: 1aa32269a3a7dc76840dd8a24cb5a8715507e898
> prerequisite-patch-id: ef471f468351462f67efa58a09a3461306ac5a0a
> prerequisite-patch-id: c78946cf4ec1c7722570865403a3562625bdaa33
> prerequisite-patch-id: 0b953eee0252db3c7ba3ef1e3397048a94482ca2
> prerequisite-patch-id: 27da72c2f01bcc68205bbcc14d5019369c02cb83
> prerequisite-patch-id: 365c6d5f71c754e4c690b5ebed3453565bb5b809
> prerequisite-patch-id: 64e9419a41082a2db3daf255baf0fb40efbae5dd
> prerequisite-patch-id: 1dc2e6ef8e76b369736b4c88560302861b2e4faf
> prerequisite-patch-id: b7de38ec4d90f5b45d56390a4e5919a1d6439951
> prerequisite-patch-id: 3548d5b161cfb8c11a166ca2b3228ca4821f1ca0
> prerequisite-patch-id: 97e66600218a2b32e5b21d0abcb6321590f98de9
> prerequisite-patch-id: 292282b20bd8ad7d096ee7ffbc55dcfb75455f53
> prerequisite-patch-id: c80259b47850ba65c985c85a29c8cf4948463d59

Forgot to remove this from the b4 metadata, but it's no longer true.


