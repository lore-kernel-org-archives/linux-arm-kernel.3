Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B837DCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 00:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xaf5RNoemnbQ5bhVRXfDXLq6XKqiACwC+kjxc5U7K8E=; b=r9mHmVvAEJExj9Ks0AO3a8I5xc
	W+SrLeqh5pG72/4CHv59GjXOX0mK3CG1pX+p2p5VbRR8PG+R9fx4cvP3IzIvUfS22Jzr4+oxQWOxp
	eY5ziU7DXSrmqYq3zRIEMX7XK0UB+qh0cQ0YU8nN3CUkobdvkTNSGncu5Vhekdgh0C3p9d7ZfxQMt
	NUT932ulJspnRv2WBmwrKEDN5NQwN1lNBG9tbbsw8RL851Kkq71mlVI2P/0eb/a8gla+8eQ9Ge00w
	p4pOzxzwxxOevPkdsuCHMt/MBOH6iiIsVlIkikAss1bs7su9OTomPGBU6zhZ3o6IcHwL0Wqv6UzA0
	0j6LSlIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Tij-0000000BSLT-1zYZ;
	Fri, 03 Oct 2025 00:32:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Tig-0000000BSL6-33GJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 00:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759451541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xaf5RNoemnbQ5bhVRXfDXLq6XKqiACwC+kjxc5U7K8E=;
	b=d6VnRmuSGpmJolyxTIN04HwpYBaHlhnhuQo7BGFDSPGqqCi8qff/3jYRyeHEDRUp9npg6F
	1m4xJRq1Tnmd1fy3UAGDy7hfnT3ih/P9SLSsjyGmQPDBLwl1G/x5SPEAHPA7EUUR41yus0
	Y4wRD8mzaebMsoddaGG1njp+hflT4ik=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-40AIuqzKMz6ESUSD6S8AKQ-1; Thu, 02 Oct 2025 20:32:18 -0400
X-MC-Unique: 40AIuqzKMz6ESUSD6S8AKQ-1
X-Mimecast-MFC-AGG-ID: 40AIuqzKMz6ESUSD6S8AKQ_1759451538
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780d26fb6b4so1183698b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 17:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759451537; x=1760056337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xaf5RNoemnbQ5bhVRXfDXLq6XKqiACwC+kjxc5U7K8E=;
        b=iyuq1Epev28HQnZcUUjeNPrvo1jgKd9QHYjQ4D4sBMEYU4HgyTBPRkGmF5H4FO0MGS
         WkDCc44/JcWqt03gJiRaRBgXk7WBCwlI2fw5A2TR06vLH6ocaaypOG66zg0y/7Afx/am
         CZ59c6zpB9fzygdvokjZ0isv9bDu9i2Gu3NlThrPuuSaDHCMRya1u3jE4PI2conapbz8
         EkeUimtxsVhDYxVBwH+AzuVXOsxKIhsHk91a/Gu9pf0vxTWSaemn3T61RzvoivwEJrrS
         5fw5sVsfjmXMcf9iCV6l2net4CHKj24eXSyXDZZQ3CixeIWdzIS9SOASwuu5sNGwvc9K
         vXCw==
X-Forwarded-Encrypted: i=1; AJvYcCXv1XlgoXHyAt8xIKeB7gzZUGuDPROpLut5nmgAxq3g64GsVq5kw859pncVS2e3xFGS/fWrxuzbPAzPinDUY8e5@lists.infradead.org
X-Gm-Message-State: AOJu0YxhkQhzuL3xjCyKoj4esPVBA0Tcs13aACjsHqUDRGDnllF6ABmS
	4pliVBp+sR5g8wuX1A1c2TngCE7JwdWTorKwpNgHKulhdL/Kv6xWgup97ZXSp6XI0ylVKlZIDA0
	FXB08uYv0V6sN5RwK8WcitZD31sgTIlnRjG9dHZvnlfLZ0va7U+iucerGriUWQ22JNSbFWGjdA3
	Z0
X-Gm-Gg: ASbGncsILjuDwFc58agq7VwFztYrJIFkoF8rlV3TQjzUcfx/PYRQqqHr2fRTYn4FfBJ
	C7ZDH2Zu/H5yuMkkgZxF/FYpd1svGdO/3YG9Enz5LXDjLMc09twoUAL6AzRHetNqbniDut4Ob29
	Aak+s2x07I9Szd068Xsv3dG/IX17dRztHWqApZ9MijKwOHSZV+rLjKKvgcuCJYeDthXcq5iymJ4
	dmIpx1RyuQoxRt1sCQw5FGMro68kdfafgk7X+RkTxKNNJ2XuhlUKATwz8eV0X0agwAmKyom+uxK
	MFEF/W+5Z6pv+Ro/bTSTU1m8tS29YdEE1UeM4mJTXBQ20nsA1Cb6eyP+mXB01Vqw3A4qEi3uZoo
	TG53bL7JTpQ==
X-Received: by 2002:a05:6a00:39a3:b0:781:1a9f:aeeb with SMTP id d2e1a72fcca58-78c98d2e6aemr1700843b3a.1.1759451537525;
        Thu, 02 Oct 2025 17:32:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWEEgYNq3YMaGCew9+gs61ruTR+Mw3AELcBoDCygoa6FdJ8RVNCdO/U7t0LGX7nViXA3ZUSQ==
X-Received: by 2002:a05:6a00:39a3:b0:781:1a9f:aeeb with SMTP id d2e1a72fcca58-78c98d2e6aemr1700792b3a.1.1759451537135;
        Thu, 02 Oct 2025 17:32:17 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02074654sm3236692b3a.75.2025.10.02.17.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 17:32:16 -0700 (PDT)
Message-ID: <ef45ce3a-7a78-45c8-8196-75923af7c6ab@redhat.com>
Date: Fri, 3 Oct 2025 10:32:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/29] arm64: kconfig: Add Kconfig entry for MPAM
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-6-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250910204309.20751-6-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4wq9tZG6YKRLlo8HHEI0T-XHtV9qH-RnqsYjYPcoWn4_1759451538
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_173222_843992_A9EC725C 
X-CRM114-Status: GOOD (  15.68  )
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

On 9/11/25 6:42 AM, James Morse wrote:
> The bulk of the MPAM driver lives outside the arch code because it
> largely manages MMIO devices that generate interrupts. The driver
> needs a Kconfig symbol to enable it. As MPAM is only found on arm64
> platforms, the arm64 tree is the most natural home for the Kconfig
> option.
> 
> This Kconfig option will later be used by the arch code to enable
> or disable the MPAM context-switch code, and to register properties
> of CPUs with the MPAM driver.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> CC: Dave Martin <dave.martin@arm.com>
> ---
> Changes since v1:
>   * Help text rewritten by Dave.
> ---
>   arch/arm64/Kconfig | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>




