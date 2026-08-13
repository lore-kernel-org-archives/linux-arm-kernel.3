Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A85BC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olvOxTrv4YnBNgv+BD/U939Ug/C+Fyeg9JeE5DXp5dQ=; b=b3pZvfFok4IAU1DG6GTEFY3Wrd
	+leAjHzZDc+tsH2xvovniZluig9xZ0xqThpsX9n8yjpOxbLDLX+H5i161jo6+WUkJuXF1H4rGZh5A
	K+Qyp51AzFOHs+zJf+bKk4OmzGfGEsEXo3iJnzjnXNworIexAu1KHZ0bCl85C1ChMRhAt1RmbBMy9
	cApgdXf5wkFgRUdB0/WytSPnXFaRe8jMJrjLkV5OO12igsXeQFKQlhcemI/56GQwK/JxOpTEZ5dKo
	elsQcpLqEsHAnpuT5POeH5q44wAHv0FtVr2ZE1X4tbKTSnLV2CxdAekDPO7bAPUIjFe6ndKL09v1h
	xr66Z4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRiM-00000000ING-31Rl;
	Thu, 13 Aug 2026 09:27:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRiK-00000000IMN-28JW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786613223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olvOxTrv4YnBNgv+BD/U939Ug/C+Fyeg9JeE5DXp5dQ=;
	b=dkcXyiLnJet49fiOG7dovbpv2UYQu8Pw9X8Jv6SyV3XvTo07r8DQb9WOwHIUMMLkO889vy
	KVppSezdTWIy26HGzPSzVm5UnXSdsp4i1QV6KU3D5Q3eMtGSuU1PNCS5EzyRPqE4fQU/sW
	uKrjCw8eq+4RmkPieJVjI5w/ZCkf4eI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-2UOARSxQNky4OKFCvaxGBg-1; Thu, 13 Aug 2026 05:26:58 -0400
X-MC-Unique: 2UOARSxQNky4OKFCvaxGBg-1
X-Mimecast-MFC-AGG-ID: 2UOARSxQNky4OKFCvaxGBg_1786613217
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4814806ab89so441653f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 02:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613217; x=1787218017;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olvOxTrv4YnBNgv+BD/U939Ug/C+Fyeg9JeE5DXp5dQ=;
        b=ipZdG61lLPpbpQIm0LDJUm/ZwUctXJtx+xH9gzM8FZSQ2/O4dKeYx/Epce/C1lMreJ
         mvopkV+snWND5ko4vmEmn+Luv9R6RxZjmnQ2tbF3z23O79114WHjuJeWDh1xZpDmkSQw
         RMef3ktGYNEU8KZ9NI+uUVLtVBm1QvHLFBnJWN+3EYMyPPsy1hyPqRyb2bzKnl7xdICG
         Lxr8wPYMEEdwyee+k9xHDbo2sWa3hNpRQpmwSxljAIKI8kd4KbFn0/f55XLtPFOBI5Kq
         24YQX8mr/UJG/ZzdLR3gkglc/6WktIPFF6ikAMvGB+SsDWe4IuZs/NIkUUQoO0rT0MkA
         CsYA==
X-Forwarded-Encrypted: i=1; AHgh+RrZkB2+0HXseD02hiT4sA6SBNBqhHbDDfGOik+EAi9nY6O8aOugUtQdFl1tfGUMaw/P3Wp0bMuw6qiX1vj94NHn@lists.infradead.org
X-Gm-Message-State: AOJu0YzvfAWu2Nb4G3PVyHfOXfIlvn6MlngpVblVK5lxMe6PGB2fAfyJ
	wFonZP9EAstJs9zU8q04OfgmIC66KYo1yo+O5gVtWca+sgezQSb5rljosELIXGuvLgWjgJwzi+i
	bmZlbBLk1h+SqS4o/51Me2XjR4LGF8Wp5swqYw9TZ/D+GKI/Obh0ZmG7nz0ntyn5Dd390b7+5mr
	xk
X-Gm-Gg: AR+sD112VCOrHIlc7V5o200qqpq9sTjTyhozCgICS7SxqAFDO8xKtHuqt7uXXYHQZEq
	4kwIihvDgkX7ryVxMt3/mWJgoJH+5+8ECEkCtlz830FA08Q5LAVB7wD3wfYvPnOg6arGMU8weXc
	Fzc8o9xRim4o/9uLfye3XN//M7R9HjYUw8jwGWNSTzvJryhDB648/TUvbDDcmj7sB7tZk/c5g0t
	9VjMMaVsHNgOaVvHFtVqIDmuM/ym7/6C3Lu505LMWspAND9I+1KP4D27iFtRSYXizWtV8vck3JT
	xKxk8br45bcSgo+VFwfa/RPES9WQB3ixF6HX4uzFEtQSiWiOnkL2T/KXNeaaTs52bVNmKAndEGW
	xNJhSDClXvjVDkz7WDLMj2SQcGktXlAAWFVy1NCBHg4o79RwdSJlb8FNIdn/WD+4ZGvKdd+xh2A
	k=
X-Received: by 2002:a05:6000:2210:b0:481:50ae:df9a with SMTP id ffacd0b85a97d-4815a52bce0mr5525474f8f.9.1786613217320;
        Thu, 13 Aug 2026 02:26:57 -0700 (PDT)
X-Received: by 2002:a05:6000:2210:b0:481:50ae:df9a with SMTP id ffacd0b85a97d-4815a52bce0mr5525393f8f.9.1786613216887;
        Thu, 13 Aug 2026 02:26:56 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a56133csm4902762f8f.7.2026.08.13.02.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:26:56 -0700 (PDT)
Message-ID: <60ca9ce8-27d8-4876-b66f-a4bf9824d607@redhat.com>
Date: Thu, 13 Aug 2026 11:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] net: airoha: add HW GRO offload support
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Madhur Agrawal <madhur.agrawal@airoha.com>
References: <20260807-airoha-eth-lro-v4-1-12d11ecb77d4@oss.qualcomm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260807-airoha-eth-lro-v4-1-12d11ecb77d4@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oE0Xn0WExHFLNoyEfQEYENMVVCzsTcuEs9Q9wZyS7uM_1786613217
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_022704_617771_8D5BE3FC 
X-CRM114-Status: UNSURE (   9.81  )
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

On 8/7/26 11:18 AM, Lorenzo Bianconi wrote:
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> Add hardware GRO offload support to the airoha_eth driver, leveraging
> the EN7581/AN7583 SoC's 8 dedicated LRO hardware queues mapped to RX
> queues 24-31. HW GRO offloading does not support Scatter-Gather (SG) so
> it is required to increase the page_pool allocation order to 2 for RX
> queues 24-31 (LRO queues).
> Since HW GRO is configured per-QDMA and shared across all devices using
> it, HW GRO is mutually exclusive with multiple devices bound to the
> same QDMA block. Call netdev_update_features() in airoha_dev_set_qdma()
> so that NETIF_F_GRO_HW availability is re-evaluated whenever the QDMA
> user count changes (device registration and runtime QDMA migration).
> Set CHECKSUM_PARTIAL with pseudo-header checksum on aggregated packets
> so that L3-forwarded traffic is correctly handled by the GSO/TSO path
> on the egress device.
> 
> Performance comparison between GRO and HW GRO has been carried out using
> a 10Gbps NIC:
> GRO:    ~2.7 Gbps
> HW GRO: ~8.2 Gbps
> 
> Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Sashiko nipa has still something to say:

https://netdev-ai.bots.linux.dev/sashiko/#/log/9407

/P



