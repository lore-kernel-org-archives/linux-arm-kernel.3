Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5261AC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHRqxw11DkfIZ1YAQcw+HF7fx4joijTrq2tX7o6YmGM=; b=nCf2nuQDEl0ENyEAqXPDZgGCRt
	ZWNC+2J8mKDS3M7G63aEZ6r/a6SYB4LsLKwaIw45CQuJ1pCq8NcETFnOyrUB+uvc/hcRi+EWZVehj
	wKcC/rQP3Tp/nNjeBtGoIvbuVXr0RDCV3GaD+mqHBDVd+NFDFFr1tC3xEq8XCeFkY3Pmpo8/OCD7a
	J53pnFB4wVSJ9t2ybLhIURh2iEk1yWqAFSp6d52hbcbu+jsImuU9U8ksZDfSQ1gw7kb7FszprZONf
	Rzmx8mN4ir7/L22RwlFD1j+Nnhd5FO40vpLh33fmydBPT+SmLUb4emdv8rwBoClURedLGVkP1iWWm
	Xf41nfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGZu-0000000BlLf-1UOu;
	Tue, 06 May 2025 11:35:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEzC-0000000BT1z-2z8M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746525192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yHRqxw11DkfIZ1YAQcw+HF7fx4joijTrq2tX7o6YmGM=;
	b=eCswHKJXz8ujPl/1shc1kepGbjmjMaaOmzLAm19mEc+Xaio4Od5USAGuyLRKYvlJxWRAYb
	JUNLagooPBefza1tzEsHu/9YOMsayGo/2OeBc/TrwRUKHlDewoz2JQx9e/rAQ0hjfkG14m
	qMI2+ynvxwBQ++h3wewdGEwa+EG+fGQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-miuR4soGNuar8N-zbKPr8Q-1; Tue, 06 May 2025 05:53:11 -0400
X-MC-Unique: miuR4soGNuar8N-zbKPr8Q-1
X-Mimecast-MFC-AGG-ID: miuR4soGNuar8N-zbKPr8Q_1746525190
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so29615675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525190; x=1747129990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yHRqxw11DkfIZ1YAQcw+HF7fx4joijTrq2tX7o6YmGM=;
        b=QHl6ibsenbZ0y5vAvgCYlhhxiK7gfRr6tmkmCO3KuEEIwwE8Lr2U11kkCKv5bKVVds
         kRjM01Xd/+9jX2HsMjUdmpBxDwNGa0MSpW2UVftbcvOAEiuIMnvfub0EwcJEozg3e8de
         XPEEtBwegrK8FqnLkH3xv1wW4dmXvEoxUUtZlvl2juAefQ61s0VVZy/XepwbSwKcNLZ+
         7dvMQ6ss0UttNwU+ZJGha6pt6LTgkaSmuXtz0DyXKu6g272QtIE+rCM2yoOHTaMBHpMn
         hbc7rRiQzV/kmyt9hyTYDrSUzVCOOtxrVId5ImkdDpTQ9nnk5elDNfa92so2c/bSADkn
         CJXg==
X-Gm-Message-State: AOJu0YwHhMXjutOkM1R+8kSSCYR63x8wMqxdz+pBJ62pjbtUHDlcbfmQ
	VtdBV36YaaMpXFYZoypseS6nEuzaQjMDwcrfkOL0JbQfIUfkwQ6ufJi/bQ/VgJ7vd9vLXUULJBq
	gMFreE4F+l6JtXpmSX/kPDVg0zmyjRSjK6aW08VWnkRnBfKMjX7n+MkOFdAUlItZLuJMNnvkV
X-Gm-Gg: ASbGncs8L/3KM97OqDQlToiwJUS3amB0xCqnz6Vp5ZMxNNNFpyi2pKVFSEFPe8UDwu3
	sarSieKhF0lI01lGCZ4/nGjVpaiQnlQcRSgHZzzJtlGucvLA7sfJbihRqnfqOX1u0p6XgI1Y4tT
	WMBdogHbmmmGs4ZHhI/jwua0TFUAwZa54in08Rfd+rwYdgW1bG9p5FqoGQTjGHBESui8et5j93Z
	+0RWFVAGsS3HN1sPiuboug+8Wn0wuUnbqet1lVnrmOwWJND3S2mwfHIOxq4zBG5ke/1SVO/dvab
	hNE5pegDStNZz7hWAt/Ge6BTTOqnLullOam76G6XvgQf+9twEeAxHHbFnjg=
X-Received: by 2002:a05:600c:3492:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-441c48dc057mr110529435e9.15.1746525190276;
        Tue, 06 May 2025 02:53:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBClihtS9IZe3qn1YixeNsDYjWzT9jRKdwymrU9Lptja+rp5uq6be54s18DEHJEmCnLCf55A==
X-Received: by 2002:a05:600c:3492:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-441c48dc057mr110529075e9.15.1746525189959;
        Tue, 06 May 2025 02:53:09 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010:b099:aac6:4e70:6198? ([2a0d:3344:2706:e010:b099:aac6:4e70:6198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad7ab1sm209878815e9.4.2025.05.06.02.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 02:53:09 -0700 (PDT)
Message-ID: <ce36ce0e-ad16-4950-b601-ae1a555f2cfb@redhat.com>
Date: Tue, 6 May 2025 11:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 04/11] net: ti: prueth: Adds link detection,
 RX and TX support.
To: Parvathi Pudi <parvathi@couthit.com>, danishanwar@ti.com,
 rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, tony@atomide.com,
 richardcochran@gmail.com, glaroque@baylibre.com, schnelle@linux.ibm.com,
 m-karicheri2@ti.com, s.hauer@pengutronix.de, rdunlap@infradead.org,
 diogo.ivo@siemens.com, basharath@couthit.com, horms@kernel.org,
 jacob.e.keller@intel.com, m-malladi@ti.com, javier.carrasco.cruz@gmail.com,
 afd@ti.com, s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pratheesh@ti.com,
 prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
References: <20250503121107.1973888-1-parvathi@couthit.com>
 <20250503131139.1975016-5-parvathi@couthit.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250503131139.1975016-5-parvathi@couthit.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -2JlRT-VDw3ZxQnfm8xQBuQ5RwI5XeSSoz40s21gHKc_1746525190
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_025314_824474_F40979EF 
X-CRM114-Status: GOOD (  11.01  )
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

On 5/3/25 3:11 PM, Parvathi Pudi wrote:
> +/**
> + * icssm_emac_rx_thread - EMAC Rx interrupt thread handler
> + * @irq: interrupt number
> + * @dev_id: pointer to net_device
> + *
> + * EMAC Rx Interrupt thread handler - function to process the rx frames in a
> + * irq thread function. There is only limited buffer at the ingress to
> + * queue the frames. As the frames are to be emptied as quickly as
> + * possible to avoid overflow, irq thread is necessary. Current implementation
> + * based on NAPI poll results in packet loss due to overflow at
> + * the ingress queues. Industrial use case requires loss free packet
> + * processing. Tests shows that with threaded irq based processing,
> + * no overflow happens when receiving at ~92Mbps for MTU sized frames and thus
> + * meet the requirement for industrial use case.

The above statement is highly suspicious. On an non idle system the
threaded irq can be delayed for an unbound amount of time. On an idle
system napi_poll should be invoked with a latency comparable - if not
less - to the threaded irq. Possibly you tripped on some H/W induced
latency to re-program the ISR?

In any case I think we need a better argumented statement to
intentionally avoid NAPI.

Cheers,

Paolo


