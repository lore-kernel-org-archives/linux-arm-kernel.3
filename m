Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2071CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfPcBPeiA6B4ouOuexFejWK64dOaFigAn8muMWhU3dQ=; b=MF4I9JPtlJ0J22I7Ihq8ua5mTc
	loZnvBUsAbO2QS0zARYjpXb7SnGXZJP8zq7IAy7iDBvNkAL2c61hNHNABUtXH+dGGoIIUs2+wlUSS
	XgquP87b/+1kJ17wjEGXVUlVXuRoPujktXsu4Db9zzWc3LcNyjoKFeeV2i0YRotMEXv8PDXAkghjO
	PlcwG/Jpu8KK3HFHB+qrTts+eVuarmQ22BQyZPXsL5QbOP5he2+H5bfjjntLO9hmPhcIFz9NwmwbY
	EI+0m4HblPftc1ZukPVED1XWJuguLqhko3GqrqMIGhK7/FMreFfnPEz6ZKRzQxuWMcpiznoN2Gh1s
	RizWuv/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YEk-000000056Uw-2mnW;
	Tue, 30 Sep 2025 11:09:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YEh-000000056UB-3Ty2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 11:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759230574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfPcBPeiA6B4ouOuexFejWK64dOaFigAn8muMWhU3dQ=;
	b=Mmyk4ruijP65e0LMLlnrX19tqo4N1V0KKctJ/CSrf9bRpxUPFsLUGCZjy4deyaxiAqAFAI
	y1okaxMmZU4XsdqvSU6mw99815UnsRm3gUJyi2d+9CQbzNYiyAI3ZfUSTy6VcVBaNT3KlU
	dV/rQfigujyRprm1k48D5Bdcw84etJQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-BFe1eQiUPL2N3sTTK36ocg-1; Tue, 30 Sep 2025 07:08:02 -0400
X-MC-Unique: BFe1eQiUPL2N3sTTK36ocg-1
X-Mimecast-MFC-AGG-ID: BFe1eQiUPL2N3sTTK36ocg_1759230481
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e38bd6680so19490875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 04:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759230481; x=1759835281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfPcBPeiA6B4ouOuexFejWK64dOaFigAn8muMWhU3dQ=;
        b=UdXmPKWqkM9QLNZzHJg0enyo+qAEtR17HQLF5Sa8cAw9CVOCjXoUOCY3oe1HxqTXuA
         aeHDP8IvMerOzn9Q201tLTNBsK7xqJLKcRjPJTzyKuV2X4av6QpSzW1x51FYQkaVf/Ku
         4zJHycDUfJxEflnMHMJdBAw07B7T2u/s/8r2f5wuojnSrz0D8R5Ed3CUpI0Xfx5YP7NW
         GKvUmNsY76Af4d7nyzjx/NN9sL6X3FTgvVFqY/x16sno4E6rBELhqD0dffUDiMuxZOQM
         rIVFcb8CbNAZrO9J6iaVovN+RmKXfUWHze8R4qhmPLlHfneDSMGnoXleRL3Y4imXlRIj
         C2pg==
X-Forwarded-Encrypted: i=1; AJvYcCXaQ6621eVmhH1oJViqJ+qs1ubarpXTRTpI38apXzc12tc39Onk4+M/h1fRGKgpgWgWaE/DcbM8UGhfPnicIUsh@lists.infradead.org
X-Gm-Message-State: AOJu0YyegWiESy0KjPdS8F//ReaUPeSMBQfOdIelDrxIgmyTHVbsSRhB
	PqfUfdv2m2QNH6VncvTALiA58MNwTAD/lZy6FggNmmd5YKR4j5CrxLucvgYKKQ/veUcBd+63h4a
	tmvGhrJbtIDNlGYX3crCoSEPH//ZDoW1McVkDBAEYLq3jq8tM5siFgGXPWuAG+o9+zO/Ey8PxhV
	Em
X-Gm-Gg: ASbGncv+ZPglwIqZu0ofBzxWS6/zj5V2/rRQWPXEsOu6309gcoekfyKENOdy5+tJ12Z
	xqWeTZ3XXH6/ncJXydavaZE9vTXLkcuJsCTNvwDuI78xf1kJpEh96ClY8dAChcrhCB1nCPKWtTx
	kA1nKJ9OjOwa8YUzKXJBsMrn8PBcr9GIRms6WS9MKDep0zpTnh7PNQgzUjp2rrtVObSDR2klQ39
	k4bhYh9E/o4bgaTxis/5UgBW8oS7ia6NHLm6hmj9ipYpAK0SjFd3NFbObkcRgr3Zs7QeaJhFE70
	2vCMEPdi+HPTS9/lsyLohMe/chLj2e4JsnzTZ4UEN1DYepJOQRVSW4B1DD2BjXauLgwM35Gtghe
	CcCbZRv9/a9ZK2Yc3ww==
X-Received: by 2002:a05:600c:8416:b0:46e:440f:144b with SMTP id 5b1f17b1804b1-46e440f1681mr106148175e9.14.1759230480818;
        Tue, 30 Sep 2025 04:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtp2PNPVi0ALjvuUKoPRLDELJ7rf4PAGV+onh7dq2Ietz1gwVjsUfUi7sNW36nUdpmYhddmA==
X-Received: by 2002:a05:600c:8416:b0:46e:440f:144b with SMTP id 5b1f17b1804b1-46e440f1681mr106147925e9.14.1759230480426;
        Tue, 30 Sep 2025 04:08:00 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fac4a5e41sm23693038f8f.0.2025.09.30.04.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 04:07:59 -0700 (PDT)
Message-ID: <157578d3-c06f-4621-b707-ca4208d18807@redhat.com>
Date: Tue, 30 Sep 2025 13:07:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: net: airoha: npu: Add AN7583
 support
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250927-airoha-npu-7583-v2-0-e12fac5cce1f@kernel.org>
 <20250927-airoha-npu-7583-v2-1-e12fac5cce1f@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250927-airoha-npu-7583-v2-1-e12fac5cce1f@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H97tq19RHKLbqy-iXBRtU-Qu7k3sKGHcaIxgmfDI7G4_1759230481
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_040935_937099_01B1497B 
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

On 9/27/25 4:03 PM, Lorenzo Bianconi wrote:
> Introduce AN7583 NPU support to Airoha EN7581 NPU device-tree bindings.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> index c7644e6586d329d8ec2f0a0d8d8e4f4490429dcc..59c57f58116b568092446e6cfb7b6bd3f4f47b82 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - airoha,en7581-npu
> +      - airoha,an7583-npu
>  
>    reg:
>      maxItems: 1
> 

This needs ack from the DT maintainer and we are finalizing the net-next
PR right now. Let's defer this series to the next cycle, thanks!

Paolo


