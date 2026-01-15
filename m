Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D18D3CCA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 02:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Toy1ZyaLVodwPTTRmNCo/wZeyOVmB3/xwLKWz+z4Kq0=; b=E7y3kHzri9zTokCg27DetZK0h9
	z4EXwkXSYxulgQ34rDvPt5Dlsb79AV/h3rNZGgveorn9R5VZnlMY7i99l5I1lYkPTVwe9Zo3kJS10
	rzzZzLAxxk1TIsGwI7pxOoJkffWWpkPFawdRVGjTZQlKqfda184Iul1v2vQBGmVtRu5fVgS1thZT5
	N/k6pnLt+wYd+t2fS07IZXL9awfEExkAeAfmd6JLh0UW1amH3e7cATZKrPIMf5FwRJlgkJii/L33i
	tFZdkReBqRUL6GkAdalkOQAFRJbNeJgkSjSKd6RgGxpYDaAG0LxszzgDMLwGgBCajkrT1Sc2U60It
	cVMShEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCrT-0000000BVbk-0dI8;
	Thu, 15 Jan 2026 02:13:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCrQ-0000000BVac-0IeA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 02:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768443197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Toy1ZyaLVodwPTTRmNCo/wZeyOVmB3/xwLKWz+z4Kq0=;
	b=hLUlIcDyO3z2i3trfMPWNSxYWuIyvrWuuc/Qo2CZJfyBkH8DNwZY/KKcH3vX344XMew4QB
	tXpmRnKoIpoqX4dndYm4beuw9Al1jekRTr01jNdO0LxrAuncSnDuVmjFXgyTttC2BxneAu
	rPXK9faHi5TI891zSZkBxtoRgN2inpc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-uvFRDQOeNYmOIlifHJ5OcA-1; Wed, 14 Jan 2026 21:13:15 -0500
X-MC-Unique: uvFRDQOeNYmOIlifHJ5OcA-1
X-Mimecast-MFC-AGG-ID: uvFRDQOeNYmOIlifHJ5OcA_1768443194
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34cc8bf226cso392797a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 18:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768443194; x=1769047994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Toy1ZyaLVodwPTTRmNCo/wZeyOVmB3/xwLKWz+z4Kq0=;
        b=FH+bxVHvEGyFLwO3j8s/1kSUsPY5jw2UPioILbQcsOluouHQKz3y2pF4RAY7q/2McO
         1Iu0FY2N7l03r/vuBqRwOSAVg9z8NdeyKrS/DW1e/af0INm3/DgL2Pq/miFCGjXU3AXj
         /KshQrgJ3IbB6s5dTrm+P+90AtcYG/O5/W31AStM6QU9L/KopQrQnmD7pGSFDh6gQodY
         H9BgHEeNeXqdDysJT2m+MRvMlRvO5SpPGoQaaoxAB8Ehpe6mctZBGdL9HVomZxlcKIE2
         OcHD4no8yJdMXCmLqmLus+Zncm2rEFPoZLJUZA8BiH2fW0v/luZQ25qEdFLcXGiK64q0
         3nng==
X-Forwarded-Encrypted: i=1; AJvYcCX8c3gCAtrULIbjtSCWfS3jLY5HABF5r8eJV7YNvX5LPTgIASzQunRDL20j0pam2Ys1ZYQb/iHAZIkLUeG0186X@lists.infradead.org
X-Gm-Message-State: AOJu0YwjCJShBZg/OwKEa6XVxn21SYJfyERgHB7ETgch0vEmH5Pq2ehC
	BPaDgiRKfw431wceJPm49Gl+8e6YNafJEQjhcPp2ye0fzZE6df/j8o/gjDwn1w+s6aT9gNQ6St/
	C9tkcHtQ9Aah+XAd4DiNs+GiqzeuICEeGfRhyMPmLm5l85zjASW53Fp4XH8SUPgB4vhUXUSdoqS
	LA
X-Gm-Gg: AY/fxX6/btJLVKdiAGeUl/HuMsVTdvpDyh1gqJTnaIxdlXWvxNXAEEQOxZu0xiAMUYi
	dg3UBQIPdkZgMjuOh0KrFaCc1fMyqmyTgrOuf8EVBcrAyXq2ikRybmh0xfumhTs8/+3Zy8D70dK
	nkncnF+vnMuW2+/rvn3OF2Gk1+43ghQ9lA8lk4uSN0UKY9MBivwaVNjCWpu8UKX1XCpyVAMy0KF
	L90X3YdE+MT7L+N9ko0UqmLKgqkJINzDCG8SmtCwtFtYtGB1g08E40KB6gw6Rx5XpcJaG7io0/s
	iSqHj4RDQ8kBTTH0lZ4qSZ7m7TvgG7bZ6LBoxuAzHZAQAVLYhFE5tvhnl8HHagWEYR+yQTiotmc
	f0A1noDAEXRU=
X-Received: by 2002:a17:90b:3b87:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-3510b08f706mr3668284a91.1.1768443194141;
        Wed, 14 Jan 2026 18:13:14 -0800 (PST)
X-Received: by 2002:a17:90b:3b87:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-3510b08f706mr3668262a91.1.1768443193741;
        Wed, 14 Jan 2026 18:13:13 -0800 (PST)
Received: from [10.72.112.168] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352678c6a10sm574950a91.15.2026.01.14.18.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 18:13:12 -0800 (PST)
Message-ID: <aee2390d-faa8-4060-8441-9d70d6d7bc67@redhat.com>
Date: Thu, 15 Jan 2026 10:12:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/47] arm_mpam: Remove duplicate linux/srcu.h header
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
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-2-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-2-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gmjcqMsX9_HAGOgOnpYTQ2Ps2vD74ISURYlAS7p5cwg_1768443194
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_181320_188989_B49B7142 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

On 1/13/26 12:58 AM, Ben Horgan wrote:
> From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> ./drivers/resctrl/mpam_internal.h: linux/srcu.h is included more than once.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=27328
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> Acked-by: James Morse <james.morse@arm.com>
> [BH: Keep alphabetical order]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_internal.h | 1 -
>   1 file changed, 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


