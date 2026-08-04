Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9B3C55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNvmfBcFcCTIC1AY1WFodqG2nUyiP6xrqhsC69kDaxg=; b=DuEv0mayfXvf+bdE6w+97MJXLk
	y/rQxdHe36w6MiRAoaZEn2e5j1ABTTxQ7bG6aUWFTPF74vITzceyzm/KmiYuOaUBb9nhZ2jq19pb2
	Pb6dVnQZrpMrVvvAsD3eeOorHumrKX8jDD5BupR8yubXJCIpTQ5s1O1tSTW0QAbreOB45XbyA0k7i
	kgv5vX1v4CpKjApL1N5LvakpNWJmyqUQTNyAmr6CeuNmiGKMu9UySLXYws0+Pp3bNpQxGzllh65vO
	mavzyl1TGNe5DiIEIhwfmAYT7QkAR/cuMz3Y6iBJ5BLP3DcN9/CdJAT34ZDIt934y66t5h+5cVhL5
	mH5Nxjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5zT-00000000vzd-3ajo;
	Tue, 04 Aug 2026 03:38:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5zQ-00000000vyZ-3Sgm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 03:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785814731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNvmfBcFcCTIC1AY1WFodqG2nUyiP6xrqhsC69kDaxg=;
	b=M51v2O3VWOWGtLzFktkUxw1jXhjqxz6RAk9FwTfUB84sfzhGd+er1wzOHtUcGvQoTJWfJh
	b6aKxGjRWY1sfhGic8kZr44NgUURysU5UiQF6u5yLZhj/VXkxV06AD2uJ7mT4ED5dLT+wk
	+4AQWKU3chMGxrseEA03RL9h9sS7PaA=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592--hVTgLCaO7eYaE3D_U_g1g-1; Mon, 03 Aug 2026 23:38:42 -0400
X-MC-Unique: -hVTgLCaO7eYaE3D_U_g1g-1
X-Mimecast-MFC-AGG-ID: -hVTgLCaO7eYaE3D_U_g1g_1785814721
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so708205a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 20:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785814721; x=1786419521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNvmfBcFcCTIC1AY1WFodqG2nUyiP6xrqhsC69kDaxg=;
        b=Qdf7rOSTMApLP7YdbyotgSxY7dgDI+5g3zbvqYhbEMCCE/zKQC6SjcsUbMyezM68T4
         ygKp5Yp8wK3r0UklL+o/V0UIky28VJRO8BIufHkCpF29vBRLXyeD+jJmhH4xs7vz6N+a
         K5BRkgbcQ9aay7WAyTOOACVsDY1p/Qqdxx5U8mDIh/u89O4IQey5xC2D71UJo1XwWsX0
         iQrJBWTRxJh6PssQAmNCbgYoSNXxbxPfXVw9Um9QdPTbBHV9RWjWVA3hXvInbth17sU7
         l6hT+vwfRG823DwMSywlMuEOumO2MYjmqXrhnuhP4QPOzrGID+Ww24VOfMo7UM95wCAt
         PaXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoK7yBfLPfEDDjeGyMCf9zEW11gI6F1h/88l0xJRg4bvr6dQ/4t7UNvzu2AN674c8TEXgMyVizYFPlHHtgMUyqu@lists.infradead.org
X-Gm-Message-State: AOJu0YylTgHsXB7RC87nWJHb2/TWudarOSgwvTg2oJF6IR49BCKR03F7
	5hQRoggZDUhoR2P2uje1s/aPVcfxHifLOvZ6Ez1s1N0QybDWnwIYuFtauJhoDShMT77vSb9+mVu
	MRmxuEFOjdb1TG3/KQE20t8dlesm5aTudEmlEmJKd6I+7yBtKbDaXw8aWkShyPk7octQpWop/V+
	F1
X-Gm-Gg: AR+sD13vQBtRTAqWBKi3I7DsMnXSu1ROU2N+x3DmL3cJjmDF00s9fJK7+NWIUc/3iGN
	fjW1Ks9xGIC7pxput6TXKvY6zEvFVORaRYL5jtQ2D3V8nSwWTVZsFwb9qVKiYdM/1hTEJYDye24
	yYIZ/oMViU6/Ii8O3pM0UcDCyf3BE91YtHWEyBg+AC6cUdyRRHQf0THf0HNHkaC2u/Y1YvTSWqf
	9oLMbE1vK1XVyRcnO6upQEWBIG97fv/ZoUM4U5bRmEd4CvHAKKdbsRZc45foYKUMrz4SWPpWxHg
	DrFdecEkvJU5UNC8vanQBSg93ta5AA2VkMRs1eoDYu46C6qSBJg2xtbjoNtq39i7M81m3hq5/WC
	82baNRPbayUie39SVOAtJrucxgVnX6E5st4EyEC0Qz/o=
X-Received: by 2002:a05:6a20:914a:b0:3c1:b9c:4890 with SMTP id adf61e73a8af0-3c92a5d7954mr12778841637.22.1785814721057;
        Mon, 03 Aug 2026 20:38:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:914a:b0:3c1:b9c:4890 with SMTP id adf61e73a8af0-3c92a5d7954mr12778808637.22.1785814720635;
        Mon, 03 Aug 2026 20:38:40 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab143a7csm33178004c88.4.2026.08.03.20.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 20:38:40 -0700 (PDT)
Message-ID: <ed68844d-458c-4516-9942-db6153acdc6b@redhat.com>
Date: Tue, 4 Aug 2026 13:38:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/11] arm_mpam: let low level MSC accessors return an
 error
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-2-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260731170324.2927758-2-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T2Ldiun05baMtu_mOQEmQ9xbyIZRwxFfGknx6ZJ79Xo_1785814721
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_203852_945455_2A757A73 
X-CRM114-Status: GOOD (  14.58  )
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

On 8/1/26 3:03 AM, Andre Przywara wrote:
> The upcoming MPAM-Fb support does not use MMIO primitives to access an
> MSC, but employs a shared-memory/doorbell based firmware protocol.
> Its complexity means that it must be able to handle errors, whereas we
> always assume an MMIO based MSC access succeeds today.
> 
> Change the __mpam_read_reg() low level accessor function to return the
> requested data through a pointer, and return an error code instead.
> Also change the __mpam_write_reg() accessor function to return an error
> code. At the moment this is always 0, so all error handling paths are
> not exercised at the moment. This will change later when alternative
> MSC access methods like MPAM-Fb are activated.
> 
> Change all direct users of those MSC wrappers to comply with the new
> prototypes, though the errors are not propagated all the way up yet.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 208 +++++++++++++++++++++------------
>   1 file changed, 134 insertions(+), 74 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


