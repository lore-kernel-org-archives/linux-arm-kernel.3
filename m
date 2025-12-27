Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1AFE92714
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 16:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0pFoW0fxxbGtsoDZJaaxbA0XpDtBn2L+88OYPdKiVs=; b=NXDZZznBnVytgko5ne/mSsuQ2E
	bs7F8Jsg+bNWfjV0APQe+1cwxtyeiLe08MKc8eBrfcbQHXuNx0z2om7b8GlWkr1LfzJLpXjXY7n1n
	9muOPE6OHLid4miDW+ITQ1iyMHCZouLc7bvUYiKIfd/y46XEIpZfcTUAJuzvIXnFZBG5vDcJ4xyG0
	3AeThDD0ZCGU2R4SiW8l+J/buHHN8sHVUmHwzEO6XK8Si9S5TalZAJj8PmzJsYiQLVslV3IpDOr2/
	+cJeqdyq5nwJp0/W6/o6nT1PW5+bgZKmqlpfTuTso3tR0CavJwW16G8o61rJTf0QVAK7J98QWlzrE
	vEAdWD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZX5w-000000024nW-0CnN;
	Sat, 27 Dec 2025 16:24:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZX5t-000000024n6-2cud
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 16:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766852678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/0pFoW0fxxbGtsoDZJaaxbA0XpDtBn2L+88OYPdKiVs=;
	b=YfWK07ZZ3bqY4jAUY4IdVwC/dftD/H0oQM9okyCrKIDqfjvhnc3e4te4zcM5RCkbk4uTCD
	ADNa3iszQ6CQCB6on6V4ccgFF+3drdA73pJaZEe3jT4+21MxodsUWWM2CQC0SCwp1Nzi+q
	qSozPUglKjQbfTMnAAYBWN6PxvWnL+0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-oXXVSBAaOOy2g0YTT1AJlg-1; Sat, 27 Dec 2025 11:24:36 -0500
X-MC-Unique: oXXVSBAaOOy2g0YTT1AJlg-1
X-Mimecast-MFC-AGG-ID: oXXVSBAaOOy2g0YTT1AJlg_1766852675
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4779d8fd4ecso40429025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 08:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766852675; x=1767457475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0pFoW0fxxbGtsoDZJaaxbA0XpDtBn2L+88OYPdKiVs=;
        b=GI1wfDyPQJOconQqXup5xt52vAuh0VdYw2ZF/7WxO8z6/7SiwvEbXhT30RZPTAkbhc
         aFDUBY5paZxpzK+bLx4T7imBsd4SAYx5Hln8Pk85A7orgpwN6F4YgpxNTZno8h8QaodM
         amTluIQxx6sCGtDHQ/0nj3VwBIZruYWKPKjvc+VuPRkU6TT6ZDa3e7ZpKUq6GxCtChy/
         aJytmVOgGSo9Ab/MP9d6s0EdaWQhqAXWDaclagIPC2TAuNhY+Cl2he6iUmXjLCtS6GTT
         uCKZdmqArfVfXpb3E/4a4jRngVF0z2vLYEDY3Yr4+HMGk9e3wvIeWNDHKTahHNsqPD94
         Va3A==
X-Forwarded-Encrypted: i=1; AJvYcCW0O1HZEkhMEwK6sn+u4yTvMe0dLchLiRs28JFoFzN+NvkPVI+93urMzZgsIRQcSvN+cJmiiDiYcp3UL7c2cQfx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj42q06JjQsBJYNwo3aILJePrfu7UK8NVntnlrmtgfFuo7YIBR
	uvgsVDr7bKg/HHzfSd/Jb24968mOMSmIGh+ZvCZ4wwYLelR9BFWc5HNRP1afqVVbYxv3b1luGDP
	zUxdyqIAS+E7TsD2QRUPpiht5X5tInlVXCFiqRrLExcC7dubALZj6SBls9yxV42GIH8HNVSgOka
	8d
X-Gm-Gg: AY/fxX6j7tM456hllG7GHLIQa56EXw1NGL8oyGBC/xNlbcQhFYpb8sH1SnJzihrhjQC
	Q17Xw0bOFdEbtNG/FXv2wpYIJldnfeVzzWa3GIjK9UdhjTwbQSM5tM5XTLij1r1lJQnOZ1dH5QC
	36KXNJ73PU7s+rOmU78D2zgfKPvUv7yzwy3eUKU6vXU9g7iARf+KAsCj0c+u3FGGl8uYq4r84p+
	uBV2798KVJPia/Qz1oY9AqzLTvBanaOetez2fMCC9txs0AjJ5U3i6KWCluwij42W7K4QYmXqP5D
	xANr366pvUGfiEvD8Swy5MWA3gRJ7cBLYV9gLWqQvnBZYBPK0ae/FsCZYdWDHl5W3RoxIC/lmfC
	92BV5f5skFnEsTA==
X-Received: by 2002:a05:600c:4746:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d18be144fmr257527145e9.14.1766852675260;
        Sat, 27 Dec 2025 08:24:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+n6rR4mCRXdumkBNyVc/341HA3AYN1kUq6F6siD1Lcd+ziTKXrb+aL7jp1MXCilbI6b58Tg==
X-Received: by 2002:a05:600c:4746:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d18be144fmr257526865e9.14.1766852674879;
        Sat, 27 Dec 2025 08:24:34 -0800 (PST)
Received: from [192.168.88.32] ([169.155.232.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be396c909sm194725735e9.0.2025.12.27.08.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 08:24:34 -0800 (PST)
Message-ID: <80be718c-3592-43bf-b3ab-8e1b9d3cf41a@redhat.com>
Date: Sat, 27 Dec 2025 17:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: stmmac: dwmac: Add a fixup for the
 Micrel KSZ9131 PHY
To: Stefan Eichenberger <eichest@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, robh@kernel.org,
 francesco.dolcini@toradex.com,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
References: <20251223101240.10634-1-eichest@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251223101240.10634-1-eichest@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1cwyyj1Y0_6Q2incoopIWimpFGLRZ5EiaTlzO8gWmbE_1766852675
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_082441_743479_57698EB2 
X-CRM114-Status: GOOD (  15.85  )
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

On 12/23/25 11:10 AM, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add a fixup to the stmmac driver to keep the preamble before the SFD
> (Start Frame Delimiter) on the Micrel KSZ9131 PHY when the driver is
> used on an NXP i.MX8MP SoC.
> 
> This allows to workaround errata ERR050694 of the NXP i.MX8MP that
> states:
> ENET_QOS: MAC incorrectly discards the received packets when Preamble
> Byte does not precede SFD or SMD.
> 
> The bit which disables this feature is not documented in the datasheet
> from Micrel, but has been found by NXP and Micrel following this
> discussion:
> https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032
> 
> It has been tested on Verdin iMX8MP from Toradex by forcing the PHY to
> 10MBit. Without bit 2 being set in the remote loopback register, no
> packets are received. With the bit set, reception works fine.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

## Form letter - net-next-closed

The net-next tree is closed for new drivers, features, code refactoring
and optimizations due to the merge window and the winter break. We are
currently accepting bug fixes only.

Please repost when net-next reopens after Jan 2nd.

RFC patches sent for review only are obviously welcome at any time.


