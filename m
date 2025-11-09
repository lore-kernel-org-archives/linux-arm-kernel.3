Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF6CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMwEg9W7YqoZw+J9iFMlmgMaSrnfv/cmFgFC+MG09ew=; b=UNG1Af1kHjSvqlmKstcCb+emg8
	hDNoo9Nhn55T/Xxg3aiXrust5mBzWmHHPc47RrzX+F3hMWT568/m4ZPfpPGuv6k3NjxLTIOjs68jq
	MeZNirbZPXOMde3I32/flMENrS6KSeCHEBDPob5nF7Zy9o70L3FiBedOgQBbCvW4MUhIRG8UIB7yS
	FQBtfqhlzcPfure1nj7aoFSXtA3sdZM+RFteW6hnYCDEYiMr9BOmcdM1gFg2+r9ANBoiUTfxe9T0w
	ZQxa45Kx7I7HhC815EAQcijxRzRDkedx9HAwHJZRnYBCtsjEHMMYIRSp+qMkpz2tKfj9YFBf63fNl
	jCXopOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIER5-00000004TB2-32Hi;
	Sun, 09 Nov 2025 23:03:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIER3-00000004TAd-0jFM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762729380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NMwEg9W7YqoZw+J9iFMlmgMaSrnfv/cmFgFC+MG09ew=;
	b=PHKl+UG9PruyGVX/81xCWrKCwAtfj5Y63LW+K/Y8IESNMF2Ne145Xw+RHHjRgzCaJJ74mQ
	LEd2wvs3t6l/9z6PxsQj49f3Aha/ANgvGtqqAOykL67SGSvObLwFK88kpuMkPWoRYQrBGo
	6n+MMoB5VzwCwWKnUPVCYJzLvn89RhM=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-o7enjiceP4eA-utUGUm-0Q-1; Sun, 09 Nov 2025 18:02:58 -0500
X-MC-Unique: o7enjiceP4eA-utUGUm-0Q-1
X-Mimecast-MFC-AGG-ID: o7enjiceP4eA-utUGUm-0Q_1762729376
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b95d06db747so1927259a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 15:02:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762729376; x=1763334176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMwEg9W7YqoZw+J9iFMlmgMaSrnfv/cmFgFC+MG09ew=;
        b=Q5AH1pl+asPFehZep6r7nubLQRLuvH0oL68StSP3uu5SOqfV/emzU8uIWzR6L9S/+E
         7fB/rmySMOmNKwuFd/2Jc5STMBxYL3eqcIi3yocYAVv43HG3mVm9AKio7PZlfxr4h7z6
         n6Gva90JmQb9BsOZ6qDXomtfAaXrh4Xrp93QUQRAAXTTBqNlFgkyr9fbiaA8BGJRuPVF
         5aHh8UvQBiPxMYkiDbksYxGxaOLcKCE4Pgu4LrhFjXwdJdLZ39zpDiePFqykUcXSLAIs
         M2UWuxgVXUg9sqz1UjdNpEgsxc5EcqsQFk19rYArkjYbgrHM2PgkgGudG6jtJE67LJPY
         ntPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYNt68EZ20n72se+I8pArOeUb9qpplT4uvfEc2GKIE5YuBGN16EpVI6Y3rClYqci767fVJSZXDhFTR3iuuTtn6@lists.infradead.org
X-Gm-Message-State: AOJu0YzF3TtN17nONpTBO60QOvERE8kqis7KlvlXQ9U4c+KnBCcesD3z
	WkQjn1Z0v5HQROsl5ykRerGAEVpdLDFzsZSICDtE0XgiLJTKUMifBhDk1yDfoaZcvoCVXXWJs0q
	hZORf+FCPDhbuvUUIkQEFPQeY89wsufSqvlixQM9cO1ey2xfUwrmLuuSN/C6AbZtk4T/+qp81zg
	SS
X-Gm-Gg: ASbGncsZSyDGgZdURC2DxOL7KC2T3T5IKUGx9Upk6X4fGR2b1yDyQkwbF55jq7veCwg
	IPh3oMRnssZO5wv8ZtD27Yr36s/Tom/Tk14hBwWTdMjhBXNieTAARaxUCvuEJbuzoujS4kHadPk
	GqzFJnFd5qwwNvREh8iW8YCDj4zoX/I53x/Li5ImPXGcgFxE2beO5VWJxHm/VmoOMyNZ9y8lEFF
	M6DmUPQ38wBWV5g6OjJUVwcgdKEkZbMCUeUD1SMlORAhktjjcrPrzL270H43eMYvMxS4HODtd+Y
	yNm5uhrEmGopv3c5JwD5PesPYDyUQWOOzt2CYSoHVnBXIIrNajfrghbEgF0N78G7vV6Kj2ewImX
	HqvW25lQqam3wzZ0kgpHBu0kvO7Dg/wSsxZ4mWrY=
X-Received: by 2002:a05:6a20:7fa7:b0:342:fa5:8b20 with SMTP id adf61e73a8af0-3538bc22aa9mr8426693637.30.1762729376404;
        Sun, 09 Nov 2025 15:02:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGp7sab9vPtmKVuWXAe17LWaZN9aEJbpEu9mpXkKjVJgK+RBmFSSONqLnlckjEp75q+9i7CjA==
X-Received: by 2002:a05:6a20:7fa7:b0:342:fa5:8b20 with SMTP id adf61e73a8af0-3538bc22aa9mr8426642637.30.1762729375982;
        Sun, 09 Nov 2025 15:02:55 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953e2a4sm9725756b3a.6.2025.11.09.15.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 15:02:55 -0800 (PST)
Message-ID: <bf04a6a4-7fac-4186-b26b-558151783b2e@redhat.com>
Date: Mon, 10 Nov 2025 09:02:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/33] arm_mpam: Add helpers to allocate monitors
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
 <20251107123450.664001-26-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-26-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IXKINZZ68YkwqPKxuvOqaj-kkdbAlxzgKTDnyivXJo8_1762729376
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_150301_303961_F5C9D01A 
X-CRM114-Status: GOOD (  10.29  )
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
> MPAM's MSC support a number of monitors, each of which supports
> bandwidth counters, or cache-storage-utilisation counters. To use
> a counter, a monitor needs to be configured. Add helpers to allocate
> and free CSU or MBWU monitors.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c  |  2 ++
>   drivers/resctrl/mpam_internal.h | 35 +++++++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


