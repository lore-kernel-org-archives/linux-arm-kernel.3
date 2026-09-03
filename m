Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A20DC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zg08WXWOXsJ2QVUn2MD0H7hbFnvg8gqIUMqRHXTyYHs=; b=NgjYSHSax4IHneKXqksvm2DOZA
	8+R54c/aYQMyKBu3CLPByeZUuDIfP49tkg9HmPQWD5+NVtqBbmj+Zk2hDFMvQXzg6CkGTAuaYZfgF
	t9bVJH9daSmf8ogwUO05MLRRUUYyyhmiibs1DQOYNWpDCB25aRrjBA9uiB8WRCPS/hDW/apjbO5xS
	wS1xEQwCA818XL4LQP4vQTzqrHMDkXDJ4H0SUtjAprbBrcU9m/hJ48adyxnF0lCVUxJR119NWxzLF
	eia70Mr9xPd2oNFzFX8iCHlOB5Kd0WyyQ8TDWTo77+BJ7Vi5k3ecBPp4A+I4GoYGWkb3HESdhyiuT
	ulD8Nmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25qZ-0000000HEFu-0tN4;
	Thu, 03 Sep 2026 11:43:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25qV-0000000HEDY-2ap0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788435786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zg08WXWOXsJ2QVUn2MD0H7hbFnvg8gqIUMqRHXTyYHs=;
	b=R5bMt+bEvzfVcccNix6PClZLSVoDu3HBgyM6fuWy5USxRBvrN45DfGRCMN8LrgVtUdgBFm
	M+KWXhjrDSpapz8skw1Q3xKIfSj2S19Ecq8QjIoXTpQVPQ9qgeS2Nsx3hOnROqRX9vYvEM
	c7ZhsvbIi3xwlb5oRlXJmq47sDD1IuE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-hqf8WD-UMZiTWdHl0ftOUg-1; Thu, 03 Sep 2026 07:43:03 -0400
X-MC-Unique: hqf8WD-UMZiTWdHl0ftOUg-1
X-Mimecast-MFC-AGG-ID: hqf8WD-UMZiTWdHl0ftOUg_1788435782
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49b8c651ac0so26449145e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 04:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435782; x=1789040582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zg08WXWOXsJ2QVUn2MD0H7hbFnvg8gqIUMqRHXTyYHs=;
        b=GRBHQ5IJipj8rLx8eJRFFkDbMuThs6jYTuEwA40eU2KaWC2J6N3+dsHEk40umBEVsa
         qEz5MWaq4AcUnxEt/wz83OhArJxDEHlqU1Zt8/goH8pLgeS6WO1rQDH3hUrI9z0Ofs/+
         jvVJ4lCPSLgJzxQxKctpamNQrQfNHxsadhShuRW3lLQd0Xvh0rxSJWFEIKMDBbdf8Gf2
         QJ6D945HP5upLruDn0gzwp2I/eDN2htk4E1dCZ1na6zR3eyMpA8d/sJ1yg/1pyHYDRas
         T94BtdSq9vSgrkJl5LT9miF2KwQadzz8deu2zqEGwyrhZERmk5NhgIAxsPhj2TwSnaK6
         hMyg==
X-Forwarded-Encrypted: i=1; AKwUvBzYThzixVAuYbZLeaBSaU2gdm7L2lYt9cK8mvnBTR7Z9+F3qdin04OJYIXSQkDyaF8Qc8Y6MzzvadSadgplWzQQ@lists.infradead.org
X-Gm-Message-State: AFuF++l0b4Eb7kbYT5wB/jyzs1sLua6YxLzErqVOKNT3rinx3NMlDQGh
	x247xGaPjVCxl+V5cu4CACkCWUDqvPbppmV4b2ud5Y5epuG3fg2n6PEEglS+KD4GVlD8SLbpmEQ
	r9Stw5zafVTJ+YvDnzU5etGnVKBLstQQ1/3orcMP9rvrxXsYUG8jCwXaNOUQ4EGW8Mz3IRMcrj1
	Tz
X-Gm-Gg: AYBFou3rP3AhXUVGUymfcj6UhUjb8gKPWAdLIqC6kJy9d+if9p4Rwt4LdprDRwkr5Ek
	LVWjHvd8E6hmlogsFrCMO6GXKhK+azqsBanaHRyf1l31G+p/W3ZbKzXTcnHKGaMYkc/zUw4OkMt
	L5jEMUfOmC84PCTLWxdKzVl/heDJ5xekcbzxCGmBmc2IsgNSHTrwd3RDhotzfxkB9bqtWrUGZS7
	fvpl8chPX82PwBbL3nUZdqM8oQnGkcelic3IHr0FdgwZUL+CA5+OYRJrGaBvS0uyBWtfpIiz+ki
	dzNT1JA+2Gnddob4E6KmMREoGsVz8JATQqxKH1Ul0j13/8PdwEmFPUGlnGG0+KkkOaGM0caUfE4
	uvt6ogv/Giz9UmwDEcuxNUwyr4eOP/iDPv0OU8mDQ0qgb+TNAgCDE7U5ri3TWJIeZzmAf8cmcZw
	==
X-Received: by 2002:a05:600c:4743:b0:49c:e3b1:d826 with SMTP id 5b1f17b1804b1-49ce58195b0mr176370355e9.13.1788435781734;
        Thu, 03 Sep 2026 04:43:01 -0700 (PDT)
X-Received: by 2002:a05:600c:4743:b0:49c:e3b1:d826 with SMTP id 5b1f17b1804b1-49ce58195b0mr176369365e9.13.1788435781291;
        Thu, 03 Sep 2026 04:43:01 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7f8f9sm13297052f8f.9.2026.09.03.04.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:42:59 -0700 (PDT)
Message-ID: <fce0ee5a-476a-4867-9dd2-08e55993bd90@redhat.com>
Date: Thu, 3 Sep 2026 13:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5] net: airoha: add HW GRO offload support
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Madhur Agrawal <madhur.agrawal@airoha.com>
References: <20260831-airoha-eth-lro-v5-1-6b0f50401121@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260831-airoha-eth-lro-v5-1-6b0f50401121@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r-p5fNiQBXqPsO6AfYfUglNasYdbxO4J8EwA-zFk2CM_1788435782
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_044308_396601_194A97F0 
X-CRM114-Status: GOOD (  13.38  )
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

On 8/31/26 8:34 AM, Lorenzo Bianconi wrote:
> Add hardware GRO offload support to the airoha_eth driver, leveraging
> the EN7581/AN7583 SoC's 8 dedicated LRO hardware queues mapped to RX
> queues 24-31. HW GRO offloading does not support Scatter-Gather (SG) so
> it is required to increase the page_pool allocation order to 2 for RX
> queues 24-31 (LRO queues).
> Since HW GRO is configured per-QDMA and shared across all devices using
> it, HW GRO is mutually exclusive with multiple devices bound to the
> same QDMA block. Call airoha_update_netdev_features() in
> airoha_dev_set_qdma() so that NETIF_F_GRO_HW availability is re-evaluated
> whenever the QDMA user count changes (device registration and runtime QDMA
> migration).
> Set CHECKSUM_PARTIAL with pseudo-header checksum on aggregated packets
> so that L3-forwarded traffic is correctly handled by the GSO/TSO path
> on the egress device.
> The HW does not report the per-segment MSS (msg3[31:16] only reports
> the max aggregated size), so the gso_size of an aggregated packet is
> just an approximation computed as DIV_ROUND_UP(data_len, agg_count).

What is the <max aggregated size> exactly? I read it as the maximum size
of the aggregated segments, am I correct?

Also any more details on how the aggregation engine works? i.e. can it
aggregate "random" segment sizes (i.e. 200 - 300 - 400) or does it
respect HW_GRO layout? (i.e. all segments except the last one must have
equal size, the can be smaller).

In the 'good' scenario, than by definition gso_size == <max aggregated
size> - <total hdr len>, and you are better off computing the gso_size
from <max aggregated size>.

Otherwise I think we can't call this HW_GRO - even if it would be more
convenient for the driver.

/P


