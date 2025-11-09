Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8F8CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTqh8jmOS93oohVyFSekWpawat5RQCgtELIur79S/mY=; b=d64ka2KOS7EzkNW5VUV3syULfY
	z8l6zxX1YqB+2tKnuwXZLW6ljb/nfGdGHCR+IazAHz43Lk51HAToQyu3eDXsPa/U7zOje0Wa3Ycbm
	E1ydyxv3cjE9/hpusRPOVfDh7h4rkmTdLLrFeFjFINKQUkOsCcZMZK15yJlBoqD6tfbbENG30QjVb
	PHvxybn8ARyA8LNknNT1llMXMqY6RLEkYgtLBAcbub9zEDIUcVuG2ruNMNS/Zelty++6t7qnGmO5T
	nnc1hLGQz8lZRJXY+9I1EEi5ugIf81vMm+vpGJWBqBUnKM4a5pjyy4Ya5/2CSSWZMs+DlsvL/wpay
	2vSyD1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEeT-00000004Trk-1W5j;
	Sun, 09 Nov 2025 23:16:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEeQ-00000004Tqe-2QbT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762730209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTqh8jmOS93oohVyFSekWpawat5RQCgtELIur79S/mY=;
	b=NEJyYg8GmjWpaMf+0zzp6BTp73Z+FXZa/6QRXxhx469iwbJG/pY7HeR/oweoea1EFQ2mvP
	HCQHP0e+qq/cuYPer/qq4Ja/3tzJXOnGDZ978tWYzBuXucZzYLMdfmaq3cvHn31AmAoQv9
	LBgZKk6/Dx5JcHlAS/v+wAGJFcrz4mw=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-3UxkbNQ9NBa1jgK1LF956Q-1; Sun, 09 Nov 2025 18:16:46 -0500
X-MC-Unique: 3UxkbNQ9NBa1jgK1LF956Q-1
X-Mimecast-MFC-AGG-ID: 3UxkbNQ9NBa1jgK1LF956Q_1762730205
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso5402881a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 15:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762730205; x=1763335005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTqh8jmOS93oohVyFSekWpawat5RQCgtELIur79S/mY=;
        b=BiiINCdB0u6HJcvTkRe0zdUbYq7c98HJvg88xpljHXcRe6U/SHD3PPOdvpqWBfHhQx
         FGkIJCy2S4w8R9PA//N9nEOH2AGFoF7ax8geJnuUx/E2ExtgUdoTbrAHUUPIblQnaqym
         N18bA8w4ZZxNKV9A8Fws2l5E8iuUTWDuQM8HVBNkeWXOrDtZsdtNmkAEt73qktl/tMQe
         vMapUZBLiB9azrFqqDTObm1NnOn2C8jt4Fi2U/IuZRa8yv3DkMyP1Zc2vq09lTjbJ8Re
         44D94drAEwn+VHFhJlnH1EvmjuhiZgp8enTpVGrlju0YGD1aSAAErfaydJdq7QAT+JRl
         2ESg==
X-Forwarded-Encrypted: i=1; AJvYcCX3V+3hCIIVA4WfOc++QtC0wRK0cZRC1Cmbx/BgxZFlVN/M7dkmamvbT3tJAv5iMjjCFgDhZV/mlJihA+fUqF4I@lists.infradead.org
X-Gm-Message-State: AOJu0Yye/yBoACYuKMsTRn/+LMLM9I4ec4dZrQeaDpxnnIsT4FyRpRM7
	9Wpa0IOPglenPArXwL7EsHF5S7qmMrKpmWi188p1L41+9vkfXxeaBqYO5tni7SZlFr0hs2F+OG4
	FEPJIwhxbXqZgjI7hVB6KRf0buy35FaUMmLMOxaybsWx/ALSefehSMXHicRhGrRWlzACBsuibZ7
	7O
X-Gm-Gg: ASbGncsCV1V88aZcipZBwLIgm2lTx/aJeRIot9BhMYMBQRre64OWpzgR0Ey9EqVQUvF
	wvWhsnRui7Skl8jeHp0ZshF4x14A1PYqjunAVAHQndE8iu5Ym6k3MXengatiKmHuq42ljecC5/7
	bXp9X3ji4dNZvSctNAuMy81tPutVyEfqcYyMfBWtQdc+0+fbc4HDPY09+rscR4Uv8A7iZrWTArb
	vVJ0o1F3p+rRDnhxNfi8s4JEOGOqCW+g02lR4uXcW7XEzrTcAoJ5Bc3IHtRC6HnE4E1PQRCINWB
	oXr84R5nUTXABujqdW9CA7tfDDtpsP+mFau9iWJLB5VV4QDRsNFagqb2wwlnoXHQ00hSb1t0WUR
	/XOFsfVMVALVnUcz34M27yrI4c6oURUP8FjhZAo4=
X-Received: by 2002:a17:902:ec82:b0:295:4d62:61a9 with SMTP id d9443c01a7336-297e56aef0fmr84827555ad.38.1762730205525;
        Sun, 09 Nov 2025 15:16:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNnY/CNaLSySWvx3SVi4rlFrYuCp9os4fjr50iYp2+FkzGPAxbALNV0IsAj3LaGTB1bS3PNQ==
X-Received: by 2002:a17:902:ec82:b0:295:4d62:61a9 with SMTP id d9443c01a7336-297e56aef0fmr84827125ad.38.1762730205135;
        Sun, 09 Nov 2025 15:16:45 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cc1833sm123856145ad.97.2025.11.09.15.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 15:16:44 -0800 (PST)
Message-ID: <3448db42-cc36-4d2c-b6f9-b2ed85bf9227@redhat.com>
Date: Mon, 10 Nov 2025 09:16:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/33] arm_mpam: Probe for long/lwd mbwu counters
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
 <20251107123450.664001-30-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-30-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y588AmZCQrxgNXQQNHRnZdV8iPjsrpcEIzPQMDSLyJE_1762730205
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_151650_700665_EE72A7E8 
X-CRM114-Status: GOOD (  12.16  )
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
> From: Rohit Mathew <rohit.mathew@arm.com>
> 
> mpam v0.1 and versions above v1.0 support optional long counter for
> memory bandwidth monitoring. The MPAMF_MBWUMON_IDR register has fields
> indicating support for long counters.
> 
> Probe these feature bits.
> 
> The mpam_feat_msmon_mbwu feature is used to indicate that bandwidth
> monitors are supported, instead of muddling this with which size of
> bandwidth monitors, add an explicit 31 bit counter feature.
> 
> Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
> [ morse: Added 31bit counter feature to simplify later logic ]
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Only set the exact counter length that is supported
> ---
>   drivers/resctrl/mpam_devices.c  | 34 +++++++++++++++++++++------------
>   drivers/resctrl/mpam_internal.h |  3 +++
>   2 files changed, 25 insertions(+), 12 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


