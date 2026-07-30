Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBBAC55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWnL5VleVaqHnf4WDlOmR61fSZ2iE1J6L7mVb4UvJLk=; b=VNPu5Xz9w/3FgU845gcMqkYIY5
	Wau5xN2ZwR8Rii+TltERzH6cSsLDDg1j3DDkzkttW2h71kHDnCsVKGG1ml+teweCmMjmJXpz7+VgA
	GwMehb1fv4yNGWwY9kHR/x20HGwPyKthu/rGjz31LXfvPoI8pRsXziDZAyPGXhsRisVEX7RqmshgA
	Jw7LUl0FFjr989cq9U0MqH4XcsXaeHPIg9dMXgzZBlVw3KhgDXNQ0EuC1FWQgUIMn1WGcaf21V4xm
	yixmsvXArBaFljF9DtqJJoyVhXsjs5jthwpTl2TrkuDfBPBkLXkpCPnkjaXKTgsYbLg9unOqL4y/M
	ROnZshCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTd1-0000000Azlo-0ay5;
	Thu, 30 Jul 2026 16:29:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTcy-0000000Azl5-1BFh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785428939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWnL5VleVaqHnf4WDlOmR61fSZ2iE1J6L7mVb4UvJLk=;
	b=chW2OVNuwiMJ5FdTDDC4E/CW1qsc3l3HORqD+G1pI+BJSlD4CEXF4eU+Yhxbq4MPhpYGJi
	xeQq0uSSoJoBshk714wUB1gnd8j+0Qy/3x5tx+NA2Sz7NVsViNcHPKpbSdBbdcb0050258
	w+DaQZTpq/keCZaLV+5ECEufQ1GXe5I=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257--Lbr3wMwPpmlpGlHrWWUpg-1; Thu, 30 Jul 2026 12:28:56 -0400
X-MC-Unique: -Lbr3wMwPpmlpGlHrWWUpg-1
X-Mimecast-MFC-AGG-ID: -Lbr3wMwPpmlpGlHrWWUpg_1785428936
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7f5b54da461so2757b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428936; x=1786033736;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWnL5VleVaqHnf4WDlOmR61fSZ2iE1J6L7mVb4UvJLk=;
        b=Aw2+NuGkSxDfnwpm7P8ewFztSJh0XMc4+Tw6tj/W1+VgGqdHIQllWpo3FeZT8hcy4b
         3w9LtZvtcQMhPtL+B0N1Je7cwjys/6p3C2zkdWQ9LL49cS2TJMH7z4HOIaGLKuRiZfLj
         0ueaLaGkOMxK1L4Y+9lTku8dB2neFKZ/tGsYNYErrqftsKL8yqn7gsw4DmSscMnmw+Fq
         LRcJmHCOjhVZ7MKBRaeX2w3YGLr4tsl81kErZU6eVVTe/9zO6+USVL8dRFQSNUnSLtb/
         XPqQLooIlppMHZ2w3mzeW4BU43DgXZHE6WSgGmqv191QLK857vWJCis4FKGUoLevNt2a
         /C+w==
X-Forwarded-Encrypted: i=1; AHgh+RrQKtSmqNdDKAlllwCwq6ERCDCARQaaM8WOpyqg9UcHu8NTE5K9yVQzBMBrKl2Hxkc/5lFT934zNMC4usFpmlk1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa+eX0aapLJTtLbBy8d3Dqpcdl2am8/33hJUWBVjKlR6nMbZvZ
	mHz0X9ZHcCDhlQQxyUHfD1XAxlf5TWpMgF9qp/+8VdzJc4N8uHxIJu3LbelquQ/Y9ea50MHr8GY
	k71eVUo4Nf7eC3iBWr+pPX9WFol6j5+uztGw8movRSjGfxbpnefYlmY4GoQKARz40CZmgASUb2r
	Fm2hKFNe/v
X-Gm-Gg: AR+sD13N95j5vwalbHSEhJx8kcIhrrPA2TQlhiuDdhjH1CJo7z3CdksxLcy9NoE9GIB
	MyNgttACFYxfw+cvW2v8fjbDlkNGSm9pwR661nkyxaXZDhK6L7S8jbwRsR8D2wslqvci2M1eFz0
	ieKTZuh4OCBIgtWFeCHzeabmP9kluwm4qoLgjbasojzun1wRgV6/9O/Gze1ZoZGYiuZP8NI4Gxx
	76j1/F5BlMr7dPJKnQBly8UoGG6XoLWRchi/5FpwzSikZ3txbK8k3KI0Eri9wzw9/PNVT6cQYzP
	PPkjM8ZCsilALSC0VvQIl5/L5y1QD9x2DvmahTjpHnQetZnr8PElpP5kK96iq1QmCdO/kxNhptx
	ItmZz5w6NyT7q/S17EXONdETHSvkYcIzHSo0=
X-Received: by 2002:a05:690c:3503:b0:81e:6c2e:f114 with SMTP id 00721157ae682-81fb895416fmr21778997b3.30.1785428935713;
        Thu, 30 Jul 2026 09:28:55 -0700 (PDT)
X-Received: by 2002:a05:690c:3503:b0:81e:6c2e:f114 with SMTP id 00721157ae682-81fb895416fmr21778617b3.30.1785428935253;
        Thu, 30 Jul 2026 09:28:55 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb88c4a57sm13093077b3.8.2026.07.30.09.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:28:54 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:28:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v11 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock
 & Reset Controller
Message-ID: <amt7w327inR5rZrU@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-2-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260728142806.1954638-2-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2W5CbxN9iQRk-66gHSYofIRuiC7tkJFng5jif0LgOms_1785428936
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_092900_387099_64984CB0 
X-CRM114-Status: GOOD (  12.37  )
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

Hi Yu-Chun,

On Tue, Jul 28, 2026 at 10:27:56PM +0800, Yu-Chun Lin wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2f9472c1a090..65dd2be63903 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22741,6 +22741,16 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
>  F:	drivers/net/dsa/realtek/*
>  
> +REALTEK SOC CLOCK AND RESET DRIVERS
> +M:	Cheng-Yu Lee <cylee12@realtek.com>
> +M:	Yu-Chun Lin <eleanor.lin@realtek.com>
> +L:	devicetree@vger.kernel.org

You add drivers to this list later in the series.
devicetree@vger.kernel.org shouldn't be listed here so that the list is
not CCed for just driver changes. It'll get picked up if someone is
making changes to the dt-bindings via the "OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS" entry.

Brian


> +L:	linux-clk@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	include/dt-bindings/clock/realtek*
> +F:	include/dt-bindings/reset/realtek*


