Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD057CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 05:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1V/1rTXsgtj3QBQHdAmhw8bkhg1LjYt1yuOVtS3CGk=; b=W/i3wBpb/K3PUWR+sTKQW5Uzgs
	DSMyA0FpVML41pp/PbE2pCa58ETweqZCK47Lu/FNVkeRWhiEHWTnhfdJdA6ObmSAk2uo8l71D/uuh
	JAmQoJbGgffBLOikHT2P72hoXN1e0CR/REUjF8e+SwLP+IR+8OgZ2Ni9ePHNZMM7qk80cY4KnoAUh
	qZibZJxvD0Mpfpyl45fAE2eBppMFuGLa48K18L1p1qIIwN1Zqx20zDR5p7MnEkUbl475V5j5fa5pw
	/HbeE0bf8zjfJ6Czoe4Cc+mL+3tKrIxBFtFTqgxAerI+UAF1hpiWpDKC4SzSfxizl3MIQ9ydeztFe
	t35T+juw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHbEv-00000002Yce-2pnw;
	Sat, 08 Nov 2025 05:11:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHbEt-00000002Yc1-2xIi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 05:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762578710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1V/1rTXsgtj3QBQHdAmhw8bkhg1LjYt1yuOVtS3CGk=;
	b=DQQMIrjEpG4iqslNYhO2gGHc9OSWi3E+dx2Nw0Au1OyDTRuoTXigzs9YdAxI2bva69ss11
	h/wmhSSrlbJu3EHJr97VOUDOTsoMvdKNPzqvhF9tFmfjXzkMrHXARWQBwpFFdJ21/8aUb0
	KfTGt2A4VSd7P1IpoA3SUqp71JefqFQ=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-ggdb5OO-M0qm5Dc57hF_EQ-1; Sat, 08 Nov 2025 00:11:48 -0500
X-MC-Unique: ggdb5OO-M0qm5Dc57hF_EQ-1
X-Mimecast-MFC-AGG-ID: ggdb5OO-M0qm5Dc57hF_EQ_1762578707
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297d50cd8c4so19850945ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 21:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762578707; x=1763183507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1V/1rTXsgtj3QBQHdAmhw8bkhg1LjYt1yuOVtS3CGk=;
        b=G3ZUPIVMEINPXOccMJezCpMK1XfmxuTAX9qKLbQTz6m3xw/05FzJWUKayoggURTzs6
         /JTj2M3T7hvZt9rEmAO9kYGIa/131azmHFmTiSdsXab5upqsUFctR2FWyNVJU3LuvAIV
         /GxxgDz9waL3g7kV8SwHRf9B8iHIbp9LpG5dVZOVp0smpwHTG3jyjEqVbao7SHsXpuND
         gjSoFonHrKykmxcR0ei/ZFhSkjvWW/FAlpunuU4lA8j9Q0X/ieWW5ICeDoQINVOP1IdZ
         ZXOGIAI7so0MhMvSRaJcDlwSct4F+WpGeo2n0uJsl3MK6KJoIKRHIdJb2k93xH+UiBNL
         dPsw==
X-Forwarded-Encrypted: i=1; AJvYcCXB2stenHyz7+wn5S+DQcr9j/G2xXF3x12ZJD+X6BBjaBwJ2PcoLNnYqX58w5/ZkjfRjYl0rSQrW+YuTBNzEIaS@lists.infradead.org
X-Gm-Message-State: AOJu0YzdENjcPYVy2EgHDhlk6FU3AxvVWxN/HA/0qTW7DUblfrk38Fnd
	fDEgRoYfci4zPdsb90cn3l3TYEA4uMLzTmHLo5M1i+ts9RZK8/AIfr/PUzbV6ORAfoZJLdjuYTC
	gu3kIZLFemEvPp64xnzTQ1aaEyjiSCQeH9btZ3pS5RIZSMOvBX+wLVx0Lyj0z0nl8Z9GxssxahV
	of
X-Gm-Gg: ASbGncutggVyVJ9jud0pJbpnqZmiTUKtb4kuNGd2JLbJVXWr4+XS9fENoARrxqZ3TIY
	uJhRU7PWzOCvr63M3IPajKHoYt3vuEjsnjHb202hYOOeA1WH+MJCekIKKMAQFqwoUVir6w/oRCM
	4H3GgNsA6ZB+ffVzI5aPqW5x0XffcDN6MuOEyxOUP6EIHCTZKivC8/kJlZyUocNhQdyQUB4f0Yb
	6dGJyWFJkQAWbhe4C8iXPHIRA4S3Y0qHtcerVDkMC7dMPxuXXPxZYXrDp3ArCVyACGdhiR/+Ssf
	2QsIDVGLR+WrCqSV+Q+4ZTnwRGNcsYcTofhW4KK5tOw2gpmp7xFExvsRDwvQWyiQyxPoKx/Uqir
	MZdTUzBAvDH3npJOsTahLV+fTUXfgDBiqA8H9HEo=
X-Received: by 2002:a17:903:4b46:b0:295:2d2c:1ba6 with SMTP id d9443c01a7336-297e56d9079mr19923645ad.36.1762578707119;
        Fri, 07 Nov 2025 21:11:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGG5TfB74TNBIs24Dy9Vey8IldOETsxY1qXOyTg5VAa4miIQ2NU9mONOOqeH9RkJkWCKKblRA==
X-Received: by 2002:a17:903:4b46:b0:295:2d2c:1ba6 with SMTP id d9443c01a7336-297e56d9079mr19923395ad.36.1762578706736;
        Fri, 07 Nov 2025 21:11:46 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096825esm78299005ad.3.2025.11.07.21.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 21:11:46 -0800 (PST)
Message-ID: <b87ef0cb-5859-4cd1-a0b0-3f0444484ffc@redhat.com>
Date: Sat, 8 Nov 2025 15:11:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/33] ACPI / PPTT: Find cache level by cache-id
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-5-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-5-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dfwy4PySju2umIux6_BJdKgDoQkAMEMUf5BzXCMkRwg_1762578707
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_211151_825709_C9BC0ADF 
X-CRM114-Status: GOOD (  13.56  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> The MPAM table identifies caches by id. The MPAM driver also wants to know
> the cache level to determine if the platform is of the shape that can be
> managed via resctrl. Cacheinfo has this information, but only for CPUs that
> are online.
> 
> Waiting for all CPUs to come online is a problem for platforms where
> CPUs are brought online late by user-space.
> 
> Add a helper that walks every possible cache, until it finds the one
> identified by cache-id, then return the level.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Tags dropped due to rework
> Fallout/simplification from adding acpi_pptt_cache_v1_full
> Look for each cache type before incrementing level
> ---
>   drivers/acpi/pptt.c  | 63 ++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/acpi.h |  5 ++++
>   2 files changed, 68 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


