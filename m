Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06935CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CemDzzrwR3SGpVnjXIQxXW5PCfyUzVu1NubMUDPJPt4=; b=1yqGrfh1mYUmxdSsX1tYUJLjqQ
	sWjWiaJaHyRxORoeqOgp900/Yv3WT+PBttfqbC3UC0tYEeMwSLUtukzH1Z1Z/Dn+tPNiVdHA5tjzH
	0CPrVbOdD3b666XZC5GPIURSGjvytdPXx/JUDNoaPyV3KUEd/mE1Tk+10RDGfMAoAZxn9yj8woKXv
	s8vCDfZys+Vwjg9oojRZzNUuGj+553DPrrUdJetx8WKFAG/+PEqWAv0jL4afqvZr/zecTpLEv9EPD
	fKA4l6zm6G6IJNFqD8NaJad0fRbrnG4kp7r8YlgJvOwV9KQeiI0JMFt2LY0O1sT+U6IWnblDPdIMb
	fNkVS0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNS0N-000000050Yo-1r7D;
	Thu, 14 May 2026 09:05:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNS0K-000000050Xb-4BrP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778749514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CemDzzrwR3SGpVnjXIQxXW5PCfyUzVu1NubMUDPJPt4=;
	b=FMWJYI48rO7n2IzNDxPMolQ/X3A41mKiQbnNgQtMdoVGVhTv0LFo/24yJd15ZVTLgulMSk
	XSd37E8nHzUqNGCiCJtTjOpRNtcKQ2vY2gkiv/pKIqs5w3SYf2K8mrktYSSKL2eBsCBWJH
	5Ge7g5sDEdu3kaLZA05haBZbXUMGLqE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-kVl3gNqpOISatXvdeoOC8g-1; Thu, 14 May 2026 05:05:11 -0400
X-MC-Unique: kVl3gNqpOISatXvdeoOC8g-1
X-Mimecast-MFC-AGG-ID: kVl3gNqpOISatXvdeoOC8g_1778749511
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48919890a95so52889195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778749511; x=1779354311;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CemDzzrwR3SGpVnjXIQxXW5PCfyUzVu1NubMUDPJPt4=;
        b=lsgcDlr+cSyEZeuYSpA0WsvDjpZMb16QRCkoHFibm0oTDk9HuDlwxjMR2NrVdgbKeU
         3Vfgo4Y98D8kbuFgO488EaHSNVTfhwDTBE70eh34FNYGdHAF5+uXPJpjdh1fSrEZ3lSu
         GGlX4bPe65KHxoQmTvKD558d31Sd6+68AAt4DGZgqLlT+GZw4aoYc9qHbJsw0trthLED
         CM/ReELey21bngVX8JtcHMtutO77XyiFLp8Cf345vfPiIROsKRmq9MPTIsvLHBDCobA/
         9AtlPU3LTd5D9Ecq8xws7Suy5iwHTRx2h4Lc9LgWPdCldeCGC6umW3qc5Use+Ra7LVDB
         DjQg==
X-Forwarded-Encrypted: i=1; AFNElJ81nbQy4YH0b+tsXCWDUVmSTVVGCPJVhYaasZpiaz4gUVnzNCWNeimm26kfrOnW+Qxm/ykKPZna+alQG1YD7ILV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6qOe32C0r839oDSNPz16ZOk5bkwECkEPm2rkRGGuwf4nQxGCq
	4geiOjzchOZl+l9LoHr4AEuYER8tO1j4WOygN+QBpKfib8AeAxlGtmELNcHUXl8dlvS1kFfiOQ5
	cK3TH8ZeVytmWWIg5X56dhyAEfGZmJGpNdb1TpaDEXsIwZvv29PleXX8Z63a+HjHwf5l1l+i7u1
	Eo
X-Gm-Gg: Acq92OGY4mL5FtssLIWzLGNMxcEP890DJiXQQnEPJP5hOpq82nCqjw9WaNjsgKznLGU
	y06wYdcrfbd7pRCPAxpm913bwphJDg4aoNxYUYhloJDs0TSeOBjs0ZGd5BAySUYOXZuMHif4ORK
	+j0HSTX9lg5K8d+4MRnRM+eb+f0R7g7Oorr/kwis6X5kfSvb0hwRFHoj22BoQFO+ZUzo4uTayXl
	Z4dDZobagZx0V2puWsUgsXFPZC3vTZ3fI9GeGAtdQXgTDGvvUN8PNXQDcYZ3uJb5j8hvHclrbG+
	o29zYSHphHagP2PSnteEmc1rjiYNSHG+wsH9Noku+SWDHYjLUaaT+3KvdnjUaR9FV4Zft3x9Q/Z
	cIbaU4X70Gv9yTy7+3VjsPjK0M79/Nhi+YhkutgOSMMm7/xPfx7dsDj8=
X-Received: by 2002:a05:600c:19cd:b0:48f:be94:d82c with SMTP id 5b1f17b1804b1-48fce9e1a34mr101445155e9.19.1778749510610;
        Thu, 14 May 2026 02:05:10 -0700 (PDT)
X-Received: by 2002:a05:600c:19cd:b0:48f:be94:d82c with SMTP id 5b1f17b1804b1-48fce9e1a34mr101444475e9.19.1778749510167;
        Thu, 14 May 2026 02:05:10 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.9.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd648a7e5sm51353085e9.3.2026.05.14.02.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 02:05:09 -0700 (PDT)
Message-ID: <73a19f89-ccd7-4762-8e07-812d8d95ead2@redhat.com>
Date: Thu, 14 May 2026 11:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 09/13] net: lan966x: add PCIe FDMA support
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Steen Hegelund <steen.hegelund@microchip.com>, UNGLinuxDriver@microchip.com,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Herve Codina
 <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mohsin Bashir <mohsin.bashr@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260508-lan966x-pci-fdma-v4-9-14e0c89d8d63@microchip.com>
 <20260509082720.503A6C2BCB2@smtp.kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260509082720.503A6C2BCB2@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZjjtsKRRF8wirfuiNn9CiPlWapePD2nNegx6QUbBlwo_1778749511
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_020517_112776_4160F788 
X-CRM114-Status: GOOD (  16.82  )
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

On 5/9/26 10:27 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 10 potential issue(s) to consider:
>> +static int lan966x_fdma_pci_napi_poll(struct napi_struct *napi, int weight)
>> +{
> [ ... ]
>> +	/* Get all received skbs. */
>> +	while (counter < weight) {
>> +		if (!fdma_has_frames(fdma))
>> +			break;
>> +		/* Order DONE read before DCB/frame reads below. */
>> +		dma_rmb();
>> +		counter++;
>> +		switch (lan966x_fdma_pci_rx_check_frame(rx, &src_port)) {
>> +		case FDMA_PASS:
>> +			break;
>> +		case FDMA_ERROR:
>> +			fdma_dcb_advance(fdma);
>> +			goto allocate_new;
>> +		}
>> +		skb = lan966x_fdma_pci_rx_get_frame(rx, src_port);
>> +		fdma_dcb_advance(fdma);
>> +		if (!skb)
>> +			goto allocate_new;
> 
> If napi_alloc_skb() fails due to memory pressure, does branching to
> allocate_new prematurely break out of the processing loop? Since the hardware
> interrupt was already cleared, and napi_complete_done() is called below,
> will this cause the RX queue to stall permanently for the remaining
> unprocessed frames? Should the code drop the packet and continue instead?

I went over the series and sashiko feedback, and generally speaking the
series LGTM, but I think this one is real and should be addressed.

Also it would be very helpful if you could (for future series/revision)
reply to the (wrong) sashiko comments individually explaining with a few
words why the are off: decoding the context requires much more time for
whoever has not wrote the code itself.

I understand that dealing with AI feedback is a pain, but, paraphrasing
a great aphorisms creator, I can assure you that ours (maintainers) pain
is greater.

Thanks,

Paolo


