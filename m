Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1354CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 05:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5RVKnDwMe3MsMRRiwpHYF55d6WxBj8NQ/HClkP7h0s=; b=t1zqoGIt5grIQ+u3iv/N51T+IB
	gG+pThdvUgSMRx/R0U3MIl6zEneMpF1cnLndEB1w56kRm1PeLses4tgzwnV3TqB0CxGSEZiHjBDNK
	xoYGi0jrqN2eQpm9u065Qt1fJLu37tb2tJziUcJ1frwlw9cNy9uhV19KhnsH0VfIPZR4Ww1eSdNOw
	ZukQqyIFYxlClJewFRhC/RQgqJOayK4evQI8A/JGk+ASfsuQP2lG2QjAcrQ2evw1PDRNfNnpYEySM
	3Oq03IMehW24hJ+sCOcjzRMqzvua/2CIR4/hytSz4rhUVOhxdROHTjHr5CXYldnhBJ95hUa1zk7du
	jFYd9lTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHbEN-00000002YZK-1PTc;
	Sat, 08 Nov 2025 05:11:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHbEK-00000002YYz-0zj8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 05:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762578674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E5RVKnDwMe3MsMRRiwpHYF55d6WxBj8NQ/HClkP7h0s=;
	b=fIVOYnQgRJCdf3hGbi2WUYGXLLsfm+krLYrp0y4ViXxY8eZqvXpuG9480Qbw96FJlVe+7b
	r66jtDp5stylOaWS5DY5DEDzQqlSVK5ZiG4kiXOnR7bGGDkVTdDyP84Vv2sKtBLKJwzWKi
	33Ygf011U20xBTGr0FZw38pZnlk2Tk8=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-Rxhjni5pM3KkRsNpbdp2QA-1; Sat, 08 Nov 2025 00:11:13 -0500
X-MC-Unique: Rxhjni5pM3KkRsNpbdp2QA-1
X-Mimecast-MFC-AGG-ID: Rxhjni5pM3KkRsNpbdp2QA_1762578672
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b993eb2701bso1267743a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 21:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762578672; x=1763183472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5RVKnDwMe3MsMRRiwpHYF55d6WxBj8NQ/HClkP7h0s=;
        b=lTEYBLpKn75txYwnxAibRxXxWePJHlJD2E7LjsG92yp34/8mZpgfqnvk2Nwdi2C2F2
         3KATqMlbEl4cbbyqiAFPq1Il47afJcExRUibbtpiOKZvSFdGLlHjNf239b+5dyTX22nx
         xmSycrROYYD8Tq/t6RNINh8+L2eUexYoMwlyQmOaWk8QrZFcd3I5C71ykJyPMB5ORnnT
         rZ0X8kRV8rDhNj3fxHO7OdJKy+KBmzsKKk9ZYKXC9CU6xp3sgtDgWbGkeb03odnGThL1
         4f6Ib3g2rQDHmNX0TaKemVrHrq2zCc6OqlHPQCC7OUMq3eL9yEvLhWUynzxCw1k5tdQw
         xTEg==
X-Forwarded-Encrypted: i=1; AJvYcCXO63HwhmhI96qbuhQ7VtiASSwqvyoWHQOpbw2/bM68ek3ZuJHIUZtvLF9BzRRNsGjueCKEmvb3hG+8FA1edEQe@lists.infradead.org
X-Gm-Message-State: AOJu0YzDOqiIxJ6uh3QwjM8mtWCjnTdf6Hk/2UhY+3r1/YgDUmmoQ7Eb
	FKmH3bMnfaf1UVJgR1kLPvQt5yZUPlB0Kc0RMMBzJHxS3b+zlyBHaR9K2hZI/m4A1uX/hT2snIS
	MgpFgTiO1cUSv812chgiFfXhsMsdmQWiYZylSnJjM1VSGTDG1yOZ5rynyNlUBkMkUc8KjTBoUuf
	o4
X-Gm-Gg: ASbGncszCqGGzRC4OUyDU9/keHaTiMMBVZb6w7o5qoHkvPgpERbXecU3s3/zRm5wdmV
	n9SxsfhaMXc09OnJXtDXcXVaY7Ft3wA+NdnwWheaa1CEkKcPexeApl+Te6f8Wn7wbX1ImhE3mqX
	dTS/b7NuOTzHvXSFSDO+G9P4Dj5mgwhN9a/qSLlRB+YE+r2yDeTVFtfgShfc90s+5FEXld5pOVC
	ejEOzew1tt+fgdxsS8IYROQewlqDxZjzsb/GmWjChAACqhJqI48t15+18nUwk1e2QkgvTOO0/lr
	uD4xw7OQ73/SljlBnLStzho/c8OumZ9jdybZn8tKANzBDF/T5sAjFAqVaglVHxBNaGVvY+QnMYG
	/YA1zhFwbWOEoQe7D9/MjN9DkAEJbv4hvkhxfnt8=
X-Received: by 2002:a05:6a20:6a08:b0:344:97a7:8c68 with SMTP id adf61e73a8af0-353a448bd92mr1787241637.54.1762578672048;
        Fri, 07 Nov 2025 21:11:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoYg32blcZZ9sLbQSYNsjasNR+q+OXQEln3dsLqwv+tsm09w3tu1QPNPDwtq+FZYazc0/esQ==
X-Received: by 2002:a05:6a20:6a08:b0:344:97a7:8c68 with SMTP id adf61e73a8af0-353a448bd92mr1787215637.54.1762578671653;
        Fri, 07 Nov 2025 21:11:11 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8ffe36a9dsm6671472a12.17.2025.11.07.21.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 21:11:11 -0800 (PST)
Message-ID: <74c37bd9-bf73-42ff-a9e9-dc55cc192c50@redhat.com>
Date: Sat, 8 Nov 2025 15:10:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/33] ACPI / PPTT: Add a helper to fill a cpumask from a
 cache_id
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
 <20251107123450.664001-6-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-6-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vdFB_W5ZYkLyjEJGWlwre2wNf_3oS6aPwKu9TqNRH6E_1762578672
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_211116_355404_7813A7D8 
X-CRM114-Status: GOOD (  13.49  )
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
> MPAM identifies CPUs by the cache_id in the PPTT cache structure.
> 
> The driver needs to know which CPUs are associated with the cache.
> The CPUs may not all be online, so cacheinfo does not have the
> information.
> 
> Add a helper to pull this information out of the PPTT.
> 
> CC: Rohit Mathew <Rohit.Mathew@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Equivalent changes to the previous patch:
>   Tags dropped due to rework
>   Fallout/simplification from adding acpi_pptt_cache_v1_full
>   Look for each cache type before incrementing level
> ---
>   drivers/acpi/pptt.c  | 62 ++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/acpi.h |  6 +++++
>   2 files changed, 68 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


