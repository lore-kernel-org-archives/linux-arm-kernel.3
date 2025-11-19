Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA41CF256C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 03:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prLgl6MqKaOVE5KSjEpfN7vkyzgDDcx68opWuG8BQBs=; b=mYzsrgeTHmR9pv2xQmFRpDOfLH
	lkk8WnzaFs8Sml76r4ksRRkiOk3OdI1U4O78hg9tro2aLP0qF4HkvlwTOmZqknFWhq1A92zhfEKLq
	VnFqXwcP52xJN6IoAAXFlIphnivmOCDrSo9B0/yce4JR7783afo78QC7O/XvOtYyCXgcdFx/iYOpk
	cYXRlCI23k76PoijaPL0Z8nasUVWAYBWVA2TMX+h5mjEGBhp3ANi/J84n2ACobk3nYjXNoyzwD7NX
	+yCk9Z0D0QGmhW8/UrSVfczDJ6s6g2i1kBOTOJ1gz1Qa3sRMz+lo5nWsOmw4/Cg2n21YxBC9D7HOX
	gaqRj00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZ7O-00000001UgG-19J0;
	Wed, 19 Nov 2025 03:44:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZ7L-00000001Uft-07Dp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 03:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763523865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=prLgl6MqKaOVE5KSjEpfN7vkyzgDDcx68opWuG8BQBs=;
	b=PnrLUsIFAk5QmMhVGkXF4lQEey6jKttlSgpK4F3OF5v8Kydv0uLR65LuKy2LDWqWTI3H1a
	EUyLwTmahluq6HQa7C4lM4Ph4drzU9HCYiZar/DTT6kCcZP/MCChIDL8RBuri1cwXZPIx/
	5XLNzn3B4wVK0bEqiXDTtcPtTPMpVUs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-xplsOSD3OXGdyfMMlGwuyg-1; Tue, 18 Nov 2025 22:44:24 -0500
X-MC-Unique: xplsOSD3OXGdyfMMlGwuyg-1
X-Mimecast-MFC-AGG-ID: xplsOSD3OXGdyfMMlGwuyg_1763523863
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3437863d0easo9137213a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 19:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763523863; x=1764128663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prLgl6MqKaOVE5KSjEpfN7vkyzgDDcx68opWuG8BQBs=;
        b=KZLYLw4g1LrUuXVT/PALGewRyiEz0Us6VsBKkuznLG03TR0kHLjeey0/UjMBo47rxY
         S+53nXjml5IJkg+hqJ1DJXxJ4YQRzOQUDs20LvAF5fsgazMd+5x0zVasKS3ZomuPjLLb
         lr8dRa/iBmQAutEkivRcnf570rPKypP7ttm29Wy3EyrpU7U5v/O9L+oz9v5C0B4BF/6o
         yh6P1rKXf20zaJnCTXPgARmdplAt2yhQ9Wo4EYkU2K40pNbxoLVcJ4JGXXm3BBClCfE6
         PgI+GKd8sYMQSvgwwna4GsxH9lbr1NfqYCxyENUVjitUXtnuAG8aNhO2fbwajZgHbewI
         ZdSw==
X-Forwarded-Encrypted: i=1; AJvYcCVBkrueSQN/j80ywOeSTTwRf/OaJMTIb37KQZTVqk0CExhvnA8EM15A+qzu957xv9yCLXIL4IWOtbSQ+bXgYn+D@lists.infradead.org
X-Gm-Message-State: AOJu0YwchPdZ+3BO64sJLwoILe+D6QR9zm4iZuZgjxpVtFcMYP2VZ0pO
	aYvLmM7uyyGE4x9z4X+18nzgTMCnC+hCt4EGfvPA1tfWMjDtaPC2wM60kxZzfGG7h+tX/UtBbJi
	fneMSEqmVKXLeFjVkGDKzcKvw0axBl3zCP0A39qN9kBRLOlpnJgqs17GGm5LpUgRlT2MBfSS5ZD
	g+
X-Gm-Gg: ASbGncsi1lDBLsGBkTUW/wNouEXalq9Uo6TzMlEg8WHLj0eNEHFnBV3H5YkmoZEy4G6
	LP7+8EP3xHdpyWUF/hlVvf81EpoTSoa6W04WVurilh3LwDmFsrfs/eE623nPBuIuli8j3l8maxb
	Y1vEVto9bIm3BQ4PaFDLjF2rGKvwod//MbHioYpC/ofAlm2qhB4B2qRqRB3prSy/wj3wftZL5Ry
	X+wCmzVfkWv6VJ1E01T4tGTt1k4OyiCQC4iehyKe8y3rv696Y2AeTaANoA/J5tLFrHtAoAYbBoc
	LkE5I2scaLm1iwoQMCiTOWW2pjZwZL55aBHLrvEyg/LE8kz6CAI2j2KJUALXJNVKufk5Ez6Jrmv
	stcHYbc6Hw3WA6igegeVJZqMS4OR2cc1hCZqP5l/LzjfUC0XgHw==
X-Received: by 2002:a17:90b:43:b0:340:a961:80c5 with SMTP id 98e67ed59e1d1-343fa74ce0bmr20253227a91.32.1763523863007;
        Tue, 18 Nov 2025 19:44:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCPaF0H+Jz3OKZzZRR2B4LB6Uwpn49QE/z8bW2XWb72TbpGcG24DOc2ShElNamBlge7D3fiQ==
X-Received: by 2002:a17:90b:43:b0:340:a961:80c5 with SMTP id 98e67ed59e1d1-343fa74ce0bmr20253190a91.32.1763523862641;
        Tue, 18 Nov 2025 19:44:22 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bc111e72sm952775a91.15.2025.11.18.19.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 19:44:21 -0800 (PST)
Message-ID: <9f2e9fdb-0101-48c4-83cc-66b291299498@redhat.com>
Date: Wed, 19 Nov 2025 13:44:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/34] ACPI / PPTT: Add acpi_pptt_cache_v1_full to use
 pptt cache as one structure
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
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-4-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251117170014.4113754-4-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1u9_To7__qhEtfOWvbm3rvxSDvGbgsXvAHmDBJGBiEc_1763523863
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_194427_223815_23CA6BCC 
X-CRM114-Status: GOOD (  16.60  )
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

On 11/18/25 2:59 AM, Ben Horgan wrote:
> In actbl2.h, acpi_pptt_cache describes the fields in the original
> Cache Type Structure. In PPTT table version 3 a new field was added at the
> end, cache_id. This is described in acpi_pptt_cache_v1 but rather than
> including all v1 fields it just includes this one.
> 
> In lieu of this being fixed in acpica, introduce acpi_pptt_cache_v1_full to
> contain all the fields of the Cache Type Structure . Update the existing
> code to use this new struct. This simplifies the code and removes a
> non-standard use of ACPI_ADD_PTR.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> I have opened a pull request to acpica to update acpi_pptt_cache_v1 to
> include all fields. https://github.com/acpica/acpica/pull/1059
> 
> Change since v4:
> Use fields directly in acpi_pptt_cache_v1_full
> Delay the casting
> 
> Changes since v3:
> New patch
> ---
>   drivers/acpi/pptt.c | 47 +++++++++++++++++++++++++++++++++++----------
>   1 file changed, 37 insertions(+), 10 deletions(-)
> 

With '__packed' added as pointed by Fenghua, LKTM.

Reviewed-by: Gavin Shan <gshan@redhat.com>


