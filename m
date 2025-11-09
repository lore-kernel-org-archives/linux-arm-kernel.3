Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3900CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 00:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2Ymb42ZiTqgosmoR22d5OXXjmr+MiE+U60sgXdVW9Y=; b=cg8WFrG2SopTG+Bp+E7Ge/uZl6
	DvGwN3FSaSSSH/JGFTTlXuVAP+fdKICOmJ+YqQjA2hcQ18Cz+l/A9qtX6lmGjOHthwpTnrk9HvYHY
	jWzH5VQ+3tgDx/jLv4XvbEXJNdzSxOeH2Wiv5/tEi2EA42N2hNTHUkRaEI5nHqcDHd48e06cGRQaa
	1MVIWqApas+/zZtS0uTUmCtRsuiGWP9IwhBbZgf/4HB4EAZM7EojW2trrEdPYBToJOTs5qaJudowg
	gmghFaBbLw/bgu5zVGImcBZsgfVRpc9CEL/Vznh1NRa6rvCvnD3jSHviSCrWInAWrnG56eUDiDpB3
	ClMqDBig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHtcw-00000003cQV-2Oyj;
	Sun, 09 Nov 2025 00:49:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHtcu-00000003cQ6-0Kwg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 00:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762649390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t2Ymb42ZiTqgosmoR22d5OXXjmr+MiE+U60sgXdVW9Y=;
	b=ATd926b/TJplmbGaPBFskB5SW67wjCCSozoFacAt3MKwRXL6Q1/Jvl+PMRSc49M0suJMDK
	AUzR0HnocsTURMfnIb+Xvl2vKe9MtiKLUcAx1Vx25RXT6+h5iRQ9vH34RF4FhfE4H7JJML
	p8sZHRgY/ubSigKnY40S1k1Ao8N6cK4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-e800SOLuPtWv2Zb9tmS4Qg-1; Sat, 08 Nov 2025 19:49:49 -0500
X-MC-Unique: e800SOLuPtWv2Zb9tmS4Qg-1
X-Mimecast-MFC-AGG-ID: e800SOLuPtWv2Zb9tmS4Qg_1762649388
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34176460924so1818959a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 16:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762649388; x=1763254188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2Ymb42ZiTqgosmoR22d5OXXjmr+MiE+U60sgXdVW9Y=;
        b=KMDzLzABvnPlIYTgoFLdXIdELqw9EoGlXi+q+1b3XXui4JI2U9cMLhzU+QobWl28nU
         /Lu3FGThAJSE3OveALnHK48COY4YQSwMDYeyITsUqPsE3hv+dLrfgZW18D6Ydf7Wypnd
         iZ+5qk1QRM84vZFXSu22OpWTibjwfdq3sbEaigZrLhEWLXmpncy+PsrauLC2gATh50fW
         LG8/jy430EOxmJbtTm7F+d6Zyffsm6QZA1lwM8DwHnLIytAN6M8qlDRM7l9wptEfNPwK
         mv9alwS/k+2WthyTXCjt3Xw1n9ZtIv6EwFU+4gPj3U8AsDpTod4RK3p/9W4o5DBEBSBd
         VVKw==
X-Forwarded-Encrypted: i=1; AJvYcCXw+qzbYRK11mPvqODcWSg13H+MEzXmNblMRnrm7D+c4GTvq0l+bkMMRlOkcIvYzc+dRgvdZdeTtnmuSMmqc9oo@lists.infradead.org
X-Gm-Message-State: AOJu0YwHlPp3Q10HlVIlidvDICI6esoy0jdQfQVFRyypqmyUE5Ed1NPd
	wHWUb0gZLH8wLd48uyM8BtEcFhoPbA9oRMVKzfh+0npX6mei0nATEGhRGAMCX/6yZCvAftOhonu
	DsYCtCOZ2GFyXooQiKCw6NXX6ey9gMmqXx9+03JdE54zgpHkVo9/D90vA9juLRoJpeNAfwhOqFj
	kG
X-Gm-Gg: ASbGnctqx/VTkkf/FL/D0psb7mrRhT+G3pow20WXMLfSl99aUZ+abVC9AvQvy+1Su5J
	BXSiLq9qTXGxDxV6OovhGNYM5l/vBHRtbMmVPjgMMINw4FQaCIx8O4rf1SaRMKD0HSHttgcCFzi
	84KSco1n5FNJQTpkZ7RahWQl3yta2x/EG5hxWugTBTiWCmzWFXyAEpwF5STwP78tG/6Sa78PDu5
	KjRgIzrawAiI2P5kNK+4Hr/7jl1RlHA5RUoJB+LBr8mxUTgrOH+iop1SEqvHxOe0KBBRPkSviK5
	zJ3Zu6JIIm4hvEZBXMaWI6opuq1gX3rqM84dQiiVhN4pZcMolEComq+1TP/KFygKTi5VS1n1fqt
	/sSrHMV6l/lAJ/j96K+5RBV2RkXpMtXO6wz1e0ek=
X-Received: by 2002:a17:90b:4b0e:b0:341:6dc2:b9ac with SMTP id 98e67ed59e1d1-3436cb8c701mr4940928a91.24.1762649387964;
        Sat, 08 Nov 2025 16:49:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxUd/wYJQeZzGolYs8k/2NsUqG16JqtEd2OP0c4YL/uDiW0Lj6J6MWRmIO/rzOZX+Ke6CUTw==
X-Received: by 2002:a17:90b:4b0e:b0:341:6dc2:b9ac with SMTP id 98e67ed59e1d1-3436cb8c701mr4940908a91.24.1762649387566;
        Sat, 08 Nov 2025 16:49:47 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c344838sm6476363a91.15.2025.11.08.16.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Nov 2025 16:49:46 -0800 (PST)
Message-ID: <e94b7dc4-1141-4fcf-ba8f-65d5cd0e67a7@redhat.com>
Date: Sun, 9 Nov 2025 10:49:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/33] arm_mpam: Add helpers for managing the locking
 around the mon_sel registers
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
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-16-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-16-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mee4ES1Bw1xtgQoWCyjgPk2StuRJwVjtJulazYNIvpE_1762649388
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_164952_198352_9C3A082B 
X-CRM114-Status: GOOD (  17.04  )
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
> The MSC MON_SEL register needs to be accessed from hardirq for the overflow
> interrupt, and when taking an IPI to access these registers on platforms
> where MSC are not accessible from every CPU. This makes an irqsave
> spinlock the obvious lock to protect these registers. On systems with SCMI
> or PCC mailboxes it must be able to sleep, meaning a mutex must be used.
> The SCMI or PCC platforms can't support an overflow interrupt, and
> can't access the registers from hardirq context.
> 
> Clearly these two can't exist for one MSC at the same time.
> 
> Add helpers for the MON_SEL locking. For now, use a irqsave spinlock and
> only support 'real' MMIO platforms.
> 
> In the future this lock will be split in two allowing SCMI/PCC platforms
> to take a mutex. Because there are contexts where the SCMI/PCC platforms
> can't make an access, mpam_mon_sel_lock() needs to be able to fail. Do
> this now, so that all the error handling on these paths is present. This
> allows the relevant paths to fail if they are needed on a platform where
> this isn't possible, instead of having to make explicit checks of the
> interface type.
> 
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> use devm_mutex_init()
> include tiying
> stray comma (Jonathan)
> ---
>   drivers/resctrl/mpam_devices.c  |  2 ++
>   drivers/resctrl/mpam_internal.h | 39 +++++++++++++++++++++++++++++++++
>   2 files changed, 41 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



