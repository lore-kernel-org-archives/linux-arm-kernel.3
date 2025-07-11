Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A05C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9izDSDydIUGaRPwUsjxklYAtHYhhvUYwvryRWYNjnJs=; b=OsvLAsiJdo4wfVCVcCtxXXtEma
	acHUj86EPJq8gST+00Xs9SP1t3K7ARYj9gMdQjIkYAsuXmlwl2TXV+biQhdz3189IvRV5koQHfGgM
	Zur0FdkdLjHbF5iMv9szZpughc4glXqeD9oIrnAqrpXKh+TNsWmXQ7JsrzeOz9EWIAq+xtzSNeTEx
	op9GeVria2bvIj4EmZyYNBSlPQhbP1j+wnGfMeBQGpGjUZYQBkdhG7TiFEtGEV/xZvrOT+WVoAhOd
	/1kQ7IOpibniws3HuQ/DAoic2zdh++Lw1wvRxh/4zfGCzUxbZjIDc9HHGEISvhb0WIEwueQTPEvrx
	diI+Is4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua64x-0000000DjSb-2Xqz;
	Fri, 11 Jul 2025 05:13:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5ZP-0000000DgeL-3tii
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9izDSDydIUGaRPwUsjxklYAtHYhhvUYwvryRWYNjnJs=;
	b=ggpYHaztQeLAYHgGLOiPyM/IEmsUdSX/Ny+56FBQSEcWwPRaeFGkm/RV7MR6u8LDAYpNxb
	N5tt9VCPBa6wkSi3Uvh+PIXx2+dtmeieKTJIm2XAvHwTSLiZdg/r6C7P/PYTjIO7q3aTT6
	MWwApyNrKUdStuhUDGILMbR1t7cG+/Y=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-FehrCldSNO-tQVlMC0UNug-1; Fri, 11 Jul 2025 00:41:09 -0400
X-MC-Unique: FehrCldSNO-tQVlMC0UNug-1
X-Mimecast-MFC-AGG-ID: FehrCldSNO-tQVlMC0UNug_1752208868
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3642ab4429so1331301a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 21:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752208868; x=1752813668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9izDSDydIUGaRPwUsjxklYAtHYhhvUYwvryRWYNjnJs=;
        b=poYlgL+o/7znkJUYGUBV0bUF9sktMyy2hMcSRQN1mmyGse0L57ALzoaiEBy1HsCBte
         PLQ3r+XI5n1PjK9KQzUbJe+fkhMwlwLR6lo72XN3KptEACl12+S6O08H3FNboVZTx1ka
         HpmYpyR5krnDDdooaAbnKMmKaSvqnF8iKj4kqoKA8F8wt4rvCPg32jhx76BH3m6mEOO/
         erC0Zy5+I3jaqOqjqmgeCQyOwfhXv+2BLDP9e3NHYtHXdfRywTtgdpAwbFTrgnSxvAK2
         4pdns2uUSS/K8JyMBXVRMooTr9Q7Z/oQazH5pKAt75n4qW3xfH6iFfNgMc4g5fS8hhJJ
         6Zdg==
X-Forwarded-Encrypted: i=1; AJvYcCU8u0gwuq/7UfT/fVW5LbPXyTpByKEjVjYUfyfanXeDyPdP8tqNN0tuipy/ywhH7CwgBNRUh+kP8mBchgFh2so/@lists.infradead.org
X-Gm-Message-State: AOJu0YyXxiDq/hGx3SNd83IbW3br+M3utM3zTmDOjM6hpRopzcibjMIC
	3PkB/6B+AYoA0qZXxDVgNA1kvKaWv5F/kX2mu54Poai1wTLR0meCprEj1gkEU+uTVjwIf4f9LlS
	yz3dOx243hiJQYbgwT2YpM4aDymjfmzw5934n73UKfj1zP399P2OOTOXqp3Y2dzqgv5upEaiWFr
	Cz
X-Gm-Gg: ASbGncvAnAUOqEpp7Z60Dkgsa9urlSja874TJd/G8lHsQJCYSxuHzO2lwJomfjhz63s
	k9/4pIl8O0xT4zYT0UGH0gfwdGVW2Z4iZtOE1YG0sOa8ehYT/Uju1CQeXL2FuiI8QUDjYqsJ5SK
	X7iHx+gPa6o4ag8zYoaUP/hd1qViMTMmVErS7Ys8zCKdNEK3Xq+YofmP9+v2i1V8/ra9KHVJPrA
	f2725/9sajFjRslPeTPr6u9CSFphvInNVx2aP8s/iOHZ26fKRoVfmnXpC4waKrClZ5M06uhC3ri
	Ga8+rMW+y6BvmVJmr4uMngqwuGI/NMQblyK9xmZmfGde8x+eifN6hz/UVs3BhMqOHiQXLnHB6FV
	Qq+E=
X-Received: by 2002:a05:6a20:728c:b0:230:fd1b:349d with SMTP id adf61e73a8af0-2312030f0admr2706286637.20.1752208868340;
        Thu, 10 Jul 2025 21:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMcdYm35nToxnJP8Gajj/OPdLKsWwG1PNdKCTG1ie9e/dq0pxdheySQPgc7+73HN9/wlq8Bg==
X-Received: by 2002:a05:6a20:728c:b0:230:fd1b:349d with SMTP id adf61e73a8af0-2312030f0admr2706255637.20.1752208867967;
        Thu, 10 Jul 2025 21:41:07 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe52edd5sm4007254a12.3.2025.07.10.21.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 21:41:07 -0700 (PDT)
Message-ID: <2b245785-7cad-4b27-81a6-7e87160049ab@redhat.com>
Date: Fri, 11 Jul 2025 14:41:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] cacheinfo: Set cache 'id' based on DT data
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, WillDeaconwill@kernel.org
References: <20250704173826.13025-1-james.morse@arm.com>
 <20250704173826.13025-2-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250704173826.13025-2-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vigBbCQrscSLyWtVk7Uy8p5rEwqF0beGmM_Zl_GhW4A_1752208868
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_214112_219277_B537DF33 
X-CRM114-Status: GOOD (  22.86  )
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

On 7/5/25 3:38 AM, James Morse wrote:
> From: Rob Herring <robh@kernel.org>
> 
> Use the minimum CPU h/w id of the CPUs associated with the cache for the
> cache 'id'. This will provide a stable id value for a given system. As
> we need to check all possible CPUs, we can't use the shared_cpu_map
> which is just online CPUs. As there's not a cache to CPUs mapping in DT,
> we have to walk all CPU nodes and then walk cache levels.
> 
> The cache_id exposed to user-space has historically been 32 bits, and
> is too late to change. This value is parsed into a u32 by user-space
> libraries such as libvirt:
> https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588
> 
> Give up on assigning cache-id's if a CPU h/w id greater than 32 bits
> is found.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> [ ben: converted to use the __free cleanup idiom ]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> [ morse: Add checks to give up if a value larger than 32 bits is seen. ]
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Use as a 32bit value has also been seen in DPDK patches here:
> http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@arm.com/
> 
> Changes since v1:
>   * Remove the second loop in favour of a helper.
>   
> An open question from v1 is whether it would be preferable to use an
> index into the DT of the CPU nodes instead of the hardware id. This would
> save an arch specific swizzle - but the numbers would change if the DT
> were changed. This scheme isn't sensitive to the order of DT nodes.
> 
> ---
>   drivers/base/cacheinfo.c | 38 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 

With Ben Horgan's concern addressed, LGTM:

Reviewed-by: Gavin Shan <gshan@redha.com>


