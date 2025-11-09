Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A3BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDUv6je7Ohicz+smtRuBl6ZpYqiHtX0g/yyL+aPKMxc=; b=WnvSkdmfEHqu0I5/nRr8c6anop
	YQ4kF8PDO5m/jBaDx15KZOu/2d+lJn7YIiBTIfMwrF+JOUxgk4cI3lbFSoEGq+uUwFnd9i/BN8aEA
	c0xuBUlhGEAFjqpB0jEZNRFpvRfLDwfzmvNUZJFllEp75c/yyGhOxncyUfHx2bVUvPOGqYG1F52x3
	p5ENg/qhdudg1ou1CE8CNQuWea9xFGAc39jY4/XegLWwHGzpoVbyb6VWKt9sH/KVy3iIRqt554LF2
	5G0xhDOfQEpVYXsyw1CGqNninNRD6GrSw6CU2o1LNe1lskfLr6YyW1BeDolt9XY4YfixbZGgdX6hF
	ACtYG8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEdt-00000004Tjl-2Znj;
	Sun, 09 Nov 2025 23:16:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEdn-00000004TjL-1b4u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762730170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MDUv6je7Ohicz+smtRuBl6ZpYqiHtX0g/yyL+aPKMxc=;
	b=LbR65z6PKSl6IcCCe3OhDR8ROx9oiqKVw+GU/KIvWgCBclzUE13Xy6PE1tyYL4fc0YvR7w
	bqatD2ZgbHuTPqgeoZ8SZ51aOOI6ZVhvahruEuySVCXWl4FCihFH3uBAYPNkVAx9EQH31o
	F2GLFIregmd3oHZgyb8p+++W8eWcfHo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-DUewp6a7Pnqgou9NC0W6pw-1; Sun, 09 Nov 2025 18:16:08 -0500
X-MC-Unique: DUewp6a7Pnqgou9NC0W6pw-1
X-Mimecast-MFC-AGG-ID: DUewp6a7Pnqgou9NC0W6pw_1762730168
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297df52c960so42883615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 15:16:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762730168; x=1763334968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDUv6je7Ohicz+smtRuBl6ZpYqiHtX0g/yyL+aPKMxc=;
        b=EIpF4G+gXNSLGDjF/87+xoQK0VqK/T/4xgEQKOgXAXGRcBIQf+6Qkk533QDM6XmTF6
         P90yYdLAA4MFGvlshjA0+gQ4iv6ardyjl9vhKonY2vcH4qMrDjvhhl1SUzIB7iJ0eNJc
         S/uOID9cssZA0RQCazRJ3FcRrFo/5ohcN0sMlVRZcUOk03E4eMi0x4YmYpxbs9MAcjUD
         /VSf+hmxnI9THbU0+rVtoHWwmelSqqJoJfZuLNd0mo7u3PDDSeymU+3+B/d/L9kC47Qe
         EykSYt15sGHtW6te3FGgbm6VasCq2v9A8LyVG6yt/4f/rK53BmVA66IUWWahdiqecjne
         TMRg==
X-Forwarded-Encrypted: i=1; AJvYcCXAe9WKtgnaXCJg5Ajvoj+H/cPOWqvVCA2c6pzDchQb4H0+E9jxqJ7o0aKJrxPi2gBb/TetHGfuQDgRUM4xhKnM@lists.infradead.org
X-Gm-Message-State: AOJu0YxtLbSCqS/470Xyj1SJgJ/T8ww1tk7ZKH3obWjlkejsdQE7OLEk
	zfK4/BPTyVyNktgz99wiA3D2C2bRi1LQbEGdDUww6msjqJWQ2zCKpUd/RdTEUEaFmz7AYrFMU6z
	cw4C7RZiIcriPQm4fRU5h+6KQklseu5LIX4a/MHdncI9nwTgLGXri4ok6WDdLR3YDNmj045m847
	cQ
X-Gm-Gg: ASbGncvsVEhKnpJix2fDgvUJV8isg2ILJP8mnV1+4+L2NB8Xd19EAKqi+8bBgRHzSXt
	2mH5wPF9a8X3QTweUDaGU11B03l98LqPdG0jvcql7ihGEzKD/skEASJOh5V92mFSNht4GqftYM7
	Q0nCIy/2Z1uN15YFaYARlquVUvLHHcfYJRlagQd0S338QgCsozhw5nWgof7DyLbUb0c1wlyC6+6
	dEheoXiveqnesvOtYMqPF57M4SmJWn2zXSvURgOsDN+iqFIM89SbvB9G1CuB62FELDCI+/MseQa
	QgZk6N6dDLbg0fs6LHkt2RfGXykttjfwY2/S8wSfv6K1MX1r6CZVolh41DnNrjOeKtqFhtdF1DH
	IHNruVbU44Pf0foPkZxSHMD+0jD4FIKZoABtPC6U=
X-Received: by 2002:a17:902:c952:b0:295:21ac:352b with SMTP id d9443c01a7336-297e560ec1cmr78399325ad.15.1762730167674;
        Sun, 09 Nov 2025 15:16:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGKFONVz/PdrHijdKUAMC7ZFvcfTvFflkxdMQ1OwyAkmY8Q3jbTVUYQNkRAQk/zZ/9eJe8Fg==
X-Received: by 2002:a17:902:c952:b0:295:21ac:352b with SMTP id d9443c01a7336-297e560ec1cmr78399125ad.15.1762730167302;
        Sun, 09 Nov 2025 15:16:07 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ccec04sm123053925ad.102.2025.11.09.15.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 15:16:06 -0800 (PST)
Message-ID: <6f36dcda-ec5c-46f2-9e22-7e4334cc554b@redhat.com>
Date: Mon, 10 Nov 2025 09:15:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/33] arm_mpam: Track bandwidth counter state for power
 management
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
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Zeng Heng <zengheng4@huawei.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-28-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-28-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AP2anBjc_yDf1FnieBMFxVYyhbn3CW03o5CVNEzqh5A_1762730168
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_151611_536339_AC7ECE33 
X-CRM114-Status: GOOD (  12.04  )
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
> Bandwidth counters need to run continuously to correctly reflect the
> bandwidth.
> 
> Save the counter state when the hardware is reset due to CPU hotplug.
> Add struct mbwu_state to track the bandwidth counter. Support for
> tracking overflow with the same structure will be added in a
> subsequent commit.
> 
> Cc: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Drop tags
> Fix correction accounting
> Split out overflow checking
> ---
>   drivers/resctrl/mpam_devices.c  | 126 +++++++++++++++++++++++++++++++-
>   drivers/resctrl/mpam_internal.h |  21 +++++-
>   2 files changed, 145 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


