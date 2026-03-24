Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB6CF532CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46vkEpgGwh3UWUDmy3UOMOyjg6y8cRBpPBBpbY3RHZo=; b=Dt8KLliqvVIrv/za7MTqcl9Evv
	UgsbwlNazAxGWfjRRt7fHc0sRkc3CVFudsAOWM5+7PH7MUiZpARk3TFY+KmFKfKap5wLhS0fjLByx
	BWuNP1vItTP/UrpyaA2MTV7kkbjnjSQ8aEuofiqQIUCSDO2n7GfIpg2PKtozC7O+X9jPYp7S04K5g
	5AHKgJ6A0poEqQNAcm+9ee3kLGVnq6zCi2525ym8N/3AgCXmo0rw7pMha17dSJ/uq5P8I2Omue81F
	125BXdSpywOO3GGF5NIaXN66xWVGR78YD2CH1yUC5UaiZN+z17am9DJuFFtU35WLsxtRtJtZGIqmY
	OoSjVKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sgZ-00000000VlQ-0nNb;
	Tue, 24 Mar 2026 03:44:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sgX-00000000Vkm-2i2D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=46vkEpgGwh3UWUDmy3UOMOyjg6y8cRBpPBBpbY3RHZo=;
	b=Z7QHDzbyPzWO6RU6PgFomJtv64hprEguElMO7NsphCeHJzTAi3zEHL+OzqXM/f0Mepdvav
	nPlvC39H9ie+X5WjrxJ88LtOe3Lhgn6Xz6RZqDMothsKsp+hTmJF8PUXZ1+jS2iWlLwL8r
	lKn3NGry9XhY0j1Lx4ipmSXa0xneErs=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-_28HBnffOFOBhoU7AaHOEw-1; Mon, 23 Mar 2026 23:44:03 -0400
X-MC-Unique: _28HBnffOFOBhoU7AaHOEw-1
X-Mimecast-MFC-AGG-ID: _28HBnffOFOBhoU7AaHOEw_1774323842
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0565d77a6so12320035ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 20:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323842; x=1774928642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46vkEpgGwh3UWUDmy3UOMOyjg6y8cRBpPBBpbY3RHZo=;
        b=l9hacAJMYmeJzxNMMwk41Rzfu3jE1IHePZNr8jHs0a6NyCTyTfG3L7KWBA+OJkSy6D
         7dMlw1c4Inu44R7imDzMHCmwp4MY1h6WFggBgGbx3eAAFeP8+X5pTsImuBB4RETNKHFM
         VLAOjgrpsxBZ/s92o1DVzaVZE2jbh1Sbi0QfZS8QzFSi77SxiW9OU/bUgSpamgp0aBCc
         ctKIs4sQBXBCfU0jDrdcZarPJk2sBE4TzznNvXNapDQgT3VzdkYiP9V9kr6sS1H7mEjb
         hx1RRlotUati3Tf1/rQ4jiM7+rjY2KgpZiQQBGOog3XKjAaJoxCjJos+Z6sXocnT45c5
         UdRg==
X-Forwarded-Encrypted: i=1; AJvYcCWFbdZ/054aPk2K5e81iN/zbxcNYrtgGKIbdL24ndt0alD72F2CfA0W8s5ucpqF2YgH0ZFVo9L3Ckom4EbRRjlN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2TXuO2VXkYauo9CMsluuvqF5mOhaVqcJSskkLCtr8T3GNUpff
	RqWdev6Er03ZCEuxFzTXgVUMWXpcbqpk60FUqIllZDwArxSwJoOMK58BR0RJ5TRVok8tQ2MS57Y
	WgHLcmZscN5JB75Pwjm7J/UAczB8BJMFiJvCcA0SVXdhCzcfaGxfdenx6uSE/PHw7vkI/2d1kEy
	tO
X-Gm-Gg: ATEYQzzOM6jy9BU6eyger86+w1kgCDayHY+G6asIY5fSRfhK6JMXOIJpMfIk+m6CEI+
	BSj27KrvMQczLOVp9WI+TBAOLh7tKgKOz+68328Yf9YADZdbmJx9gKL8cBPL4cEPgmmsjATGzZs
	76iXq1h7fP/3FtdUkZINxuC4/AM2Wn+4pB8Kfpfo/8DCmbCWqRH6IiOeAfUcnosKMEcba8wQsQf
	GI3NDipHBSQNU/NiHauYcgO4/xgA6zpwVGug/OflZXvRUEHQ5KGpECKDM5JOozmh2almDR+vnHi
	HRTY/soN5drwMaF8Lo+T+g9hQVmkZLOrfWOr4iQhyAa9kYEWYCUMBYEh87Jl1n48YFKKDzjfNJr
	xzt7ah2h+LsedCF6yq3mbw82IhDlo34cxzuVxedJCdnEdPLO5XrAPyeIp+s9czyWk
X-Received: by 2002:a17:903:1a0c:b0:2b0:686a:d461 with SMTP id d9443c01a7336-2b0827b7946mr131722125ad.45.1774323842338;
        Mon, 23 Mar 2026 20:44:02 -0700 (PDT)
X-Received: by 2002:a17:903:1a0c:b0:2b0:686a:d461 with SMTP id d9443c01a7336-2b0827b7946mr131721755ad.45.1774323841960;
        Mon, 23 Mar 2026 20:44:01 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352aea8sm162613375ad.21.2026.03.23.20.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:44:01 -0700 (PDT)
Message-ID: <32238136-6edc-4bab-a539-76b66f6276b0@redhat.com>
Date: Tue, 24 Mar 2026 13:43:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 34/40] arm_mpam: resctrl: Call resctrl_init() on
 platforms that can support resctrl
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-35-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-35-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XE-fNVHWCGOiqZQStXqR5vUay3Lcve0u2TWzkRqz7UU_1774323842
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_204405_762045_EFA4B74B 
X-CRM114-Status: GOOD (  10.37  )
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

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Now that MPAM links against resctrl, call resctrl_init() to register the
> filesystem and setup resctrl's structures.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Use for_each_mpam...
> error path tidying
> 
> Changes since v3:
> Don't consider abmc/mbwu in teardown
> ---
>   drivers/resctrl/mpam_devices.c  | 32 ++++++++++++++---
>   drivers/resctrl/mpam_internal.h |  4 +++
>   drivers/resctrl/mpam_resctrl.c  | 63 ++++++++++++++++++++++++++++++++-
>   3 files changed, 94 insertions(+), 5 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


