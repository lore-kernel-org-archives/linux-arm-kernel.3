Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6C3C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7O71wS6omUP4Za+qu8KkJ9Z+HYsi5jrXQRVuEjbLS/Y=; b=u8Q5/celVGyqXNbMeHm63bIhS7
	eJChguX6DGMfnSZgcVqKLoDYtkMebhX/PGYcce4NztBewFbECvUabBj44ZO64rn+Vv9hvMo/UQ3Zk
	D/5q9dud4n/yjpZ7FydQWvYXYHFnLV7rWg5lZxN3VWBraMGRxXbO6OklA9JWWBVMiRsj7P4N7SIgm
	ScRqTNpf+fDPUzxnvbYqrvbZes2eNjYmafz1UH0prR//8WZhbhCyFKcPlPjr3UDWqe5lHFMDfXPod
	vfUs3hjuoapyoTdRBC7RVcRjwHYKmvDLDQJt26EQ6HzKNBBiJfpc2EUHz8rKJbFwWIJXjDsinxF4F
	1a6gch/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3B-0000000EZuG-1iXW;
	Thu, 24 Apr 2025 16:03:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7v9I-0000000DvdL-25tB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 11:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745495626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7O71wS6omUP4Za+qu8KkJ9Z+HYsi5jrXQRVuEjbLS/Y=;
	b=QwY0ocFNVJu7/KLkQ06wMFiXcD9pukahVPPMrDbY94qeiPTuLg6EaSe8XVWcWUKfphHudG
	3CTCvkVJn5WPOM/pbJy+SvZdyQ88iPSVpDY9XF+qudBfnmtfvCCHoiQc/9W4e6YiHR3uDS
	36w2rmMUtjv6f2KGJrJ549s3x6Gc5PA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-nWDz_9RGPA2iu-QDbHPqVQ-1; Thu, 24 Apr 2025 07:53:43 -0400
X-MC-Unique: nWDz_9RGPA2iu-QDbHPqVQ-1
X-Mimecast-MFC-AGG-ID: nWDz_9RGPA2iu-QDbHPqVQ_1745495622
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so5921185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 04:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495622; x=1746100422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7O71wS6omUP4Za+qu8KkJ9Z+HYsi5jrXQRVuEjbLS/Y=;
        b=B6swp7ia9MJMi/0e37a/ROI0cSRgxYFsNFqkNasdxqLhSZbk2Bhz5tksAub/UMByoI
         i25yBaiQWS+9gix5w0zXVuZ2wCNz2Iz3T8EFbehZQ9cXPmy1i8KQ+qdRJoLK41c2Ndpp
         dh+eSQd6NBodVDx47TDvYnfHA6mzYSAbUdW6W+2BxYdAzY5X2fBqMS0pQ5osO9L1CYzh
         xZfwbH++3ti/0+KV9kwz/zc1E16zE3ATCLf2O79eH+6xUSBkJPYpnv91Jg+wqQn7OXKj
         9snC+utBvk8ExSVH6ZJFR9z8QQAh3L/klB9JUMj5J8ZsuIS4KwsY3Vzs3hrsFHkKcAFQ
         1oAg==
X-Forwarded-Encrypted: i=1; AJvYcCUpEHIQIa6zDgbiNdLGtxtr7wCNzjwgS7XO4RXWkGwuk2dwML1rzMeLz9U4XsO0r8JfS62NGtbym5VSwX4zgW/o@lists.infradead.org
X-Gm-Message-State: AOJu0YxDBTg50OV4Gy+yjk9NzklXPPnsy9w7DDTauiUsOgC8+ouNH4br
	SjrvynAiO+slilqKfslaugx06GypaH3XNAdsnwR9diIVrmZ6tq/A5C9rYrTvtqUQt3IimqIdAfy
	IGBDPLubrO8vVqx6mhGiemy4/LbF+vyg1NMZxP2QFXvEyT6KQUBNxt4ppQzmKW+zsQG52fOFs
X-Gm-Gg: ASbGncsnoy4h+ekrcvg+AfoczgdkCXpsczJNl7xCzT95TcpKVZi1xBjlsWU/nheC/7Y
	4oKNewbzBeVqrF+yNkjLWxOefLloJDwv1JyEmsiVabX2hEeGh2PnBcWsdiGcyjhB5F4nNgasv8p
	rtOUGzG5rPDRATLNfN+48pxlZHzRfxxjrp5a1qVf7FrIfKAXc4jCgTXFo8mq0z3SFLANxCZiV+3
	P6WUM8Qh243Rg7OAUylr3DztWo4vmvhXWakPrqJtqq9PWUWyn8eeiBkHf2hNgPH5+scDMmFm9P2
	L2lHCf8ZG25NdcQQG5eyAMN5G5jup0fOyF398E4=
X-Received: by 2002:a05:600c:4e0a:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-4409bd210eemr25352685e9.13.1745495621868;
        Thu, 24 Apr 2025 04:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUAI2NQUKhz4qnOoSRg3Qvi8tq8xdza5SLA8RiijZXZRu9gfA8tceguZucQbwMmFsJdyoLyg==
X-Received: by 2002:a05:600c:4e0a:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-4409bd210eemr25352255e9.13.1745495621516;
        Thu, 24 Apr 2025 04:53:41 -0700 (PDT)
Received: from [192.168.88.253] (146-241-7-183.dyn.eolo.it. [146.241.7.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54c246sm1831740f8f.86.2025.04.24.04.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 04:53:40 -0700 (PDT)
Message-ID: <edfa1585-c10c-4211-a985-ebfcb8e671d5@redhat.com>
Date: Thu, 24 Apr 2025 13:53:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/2] net: stmmac: dwxgmac2: Add support for
 HW-accelerated VLAN stripping
To: Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Tien Sung Ang <tien.sung.ang@altera.com>,
 Mun Yew Tham <mun.yew.tham@altera.com>,
 G Thomas Rohan <rohan.g.thomas@altera.com>
References: <20250421162930.10237-1-boon.khai.ng@altera.com>
 <20250421162930.10237-3-boon.khai.ng@altera.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250421162930.10237-3-boon.khai.ng@altera.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ghc-Hff94s7OjGh94yHDyLN_lVXAH3y2BYMk0vwKrl8_1745495622
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_045348_612539_07B4D348 
X-CRM114-Status: GOOD (  10.84  )
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

On 4/21/25 6:29 PM, Boon Khai Ng wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index 389aad7b5c1e..55921c88efd0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -4,6 +4,7 @@
>   * stmmac XGMAC support.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/stmmac.h>
>  #include "common.h"
>  #include "dwxgmac2.h"
> @@ -69,6 +70,21 @@ static int dwxgmac2_get_tx_ls(struct dma_desc *p)
>  	return (le32_to_cpu(p->des3) & XGMAC_RDES3_LD) > 0;
>  }
>  
> +static u16 dwxgmac2_wrback_get_rx_vlan_tci(struct dma_desc *p)
> +{
> +	return (le32_to_cpu(p->des0) & XGMAC_RDES0_VLAN_TAG_MASK);
> +}
> +
> +static inline bool dwxgmac2_wrback_get_rx_vlan_valid(struct dma_desc *p)

Please, avoid 'inline' function in .c files, especially for functions
that will land into function pointer like this one.

Thanks,

Paolo


