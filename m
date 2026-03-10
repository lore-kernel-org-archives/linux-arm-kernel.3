Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C770DFD2D81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcGwuo35RKK8ljJatS1Nd7WDDHQVev0Yemy6C4hCd2w=; b=uETmTG+HAo+Z/+elw8ByhtVxqz
	dhiDIB2yZ1i5XzXBluHo55/fUlPP6MV4HAp1iHT7ex7/AQS4O7M3rPg0lqi1wcyWoi/s0TCV6QCaM
	JoSWoDBJnnGIzHW/IITjA1AOIH6ttJl7onWAf+7hkkiAeF8FIixNw2Y72WEsYQusrxqMl9WxkDyPm
	Ooac4UJLKgoVzvwUbbWXwsIqAvQ6f2nJxhMzNih6YBj3Z25KxbwmNxgJeIHGtZ71BQDxPvP8B2Uk9
	sLOfVyNacTyzNt69/seTV4mFnklLx0SQSBOvSeHvkWApH2DW1rQ49aptX6OkYwPMjkFq4Jlqvta6l
	GnrxIudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzx8c-00000009bJa-48Ku;
	Tue, 10 Mar 2026 13:28:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzx8Z-00000009bIg-2c2g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 13:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773149318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VcGwuo35RKK8ljJatS1Nd7WDDHQVev0Yemy6C4hCd2w=;
	b=JJz7QsQIWVCrRtMBlSPsYpJb7Ew9GPUImMa8XRE266HhE2PfHd9RtSRgaUSSKpUfeco2by
	6L+C7pu7wFAfZGflAjmX/GtrCCHXQQhZ8rFTfXUnb4C/Cno9d5Z+f0JJCTK4g2eQuEH6pI
	AIPFLoYe1f70VhHVk0XHgmFVcrNNYYs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-qHa4B3KAOzu_8_o-w1DIVQ-1; Tue, 10 Mar 2026 09:28:36 -0400
X-MC-Unique: qHa4B3KAOzu_8_o-w1DIVQ-1
X-Mimecast-MFC-AGG-ID: qHa4B3KAOzu_8_o-w1DIVQ_1773149316
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899ea295601so150252006d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 06:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149316; x=1773754116;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VcGwuo35RKK8ljJatS1Nd7WDDHQVev0Yemy6C4hCd2w=;
        b=wXlEj6oeKVLuN5oqx+VUkAFG4r3AsYEIsXDet2lIlFe4J2oEcBUGdTwIY6yhv8bcJV
         oxUyFz+rv7/l6IrPajiKkzVKEGG/EVhG1ULnDCPp2a6enHeZgNwZRjeux1NcMndeB4Uf
         7gvfQ5L/6avqdJP/na9i/+/BZMzVKMSzItQSoBHAQltIZ2LWczrIGp0JgLvQTSU1E9pj
         8EPU4iujGNZHGrTExIoZku2LlNUx7pUKn9947eij4/6mun1NVznsOlVxcBEtOeREGGqT
         zxaiWmsUIe3+/p8lC7Z53IdsWCnrc1t84RGcKpv7BPa1T40cFO3bpLiayxFz4tMmTiNh
         0/6g==
X-Forwarded-Encrypted: i=1; AJvYcCVLq9M2cUJsfjI7g6EuzRYgQw3M14z+Bl4lcpIrXH1kFsTbLp4eT5E0PVfink7fbsADPWdRuualYNycc1Th/qwn@lists.infradead.org
X-Gm-Message-State: AOJu0YxYqwz463m4QDtXJo3GFrVi4vxbqvwgWcF4NmGDXfuNp2I0p22s
	MVCKASqmpUXu3RXnX0qAK+2BYTVkxMdgbUiwRoj3vDR1J7Y9fpHZi72Irg1qc0rcYBloOqTPNad
	6cXt9Rl1ODdZkXJNQ77FvVzJTN7/uzvOG1GRzw5CzDp5KtKm8wICtcQwFnOAsFEfXrEuOhM7niN
	ug
X-Gm-Gg: ATEYQzzcEVFcuRn8TVh7QnA1uyUK9AuRkXXNXRp//cybjH9kG9vZOBYUyBHCry/KgA6
	FhTgKOViGrzZCT2QGnquxAl7ya9kmfVaLN68jcR/CpnHDC5W8hFvWnXiurLfTlpX8JVa6MZeHU/
	Pd/AvxWiQHqKeonz+xCsu7acUqSHJxMBSZxds7J6VucKcyrFtwNuVoeuSFY3q4o5/2QtqpUMhKW
	VzN8jlkiZ5UxVep91Fn4NE1nRmq/hsMKtdvBdcoXB9bI2IW/JxH1dgVwP0uoFqC1zmjNXntx+uT
	cA2Aqv5pCWZAOd+b3vWo1QOItGIEH3j/CGRf7e7s8msdWuCCXq6RDTky+uHkckggYZsvWlrKrrA
	T67YijhyKeKeXD1GXHumGzSK03CNdSbuOzoUn1vatbJWUjfJVDMyhklt2
X-Received: by 2002:a05:6214:400d:b0:89a:ff2:b8da with SMTP id 6a1803df08f44-89a30acb81bmr214491646d6.47.1773149315809;
        Tue, 10 Mar 2026 06:28:35 -0700 (PDT)
X-Received: by 2002:a05:6214:400d:b0:89a:ff2:b8da with SMTP id 6a1803df08f44-89a30acb81bmr214491196d6.47.1773149315391;
        Tue, 10 Mar 2026 06:28:35 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a4b079sm18433156d6.20.2026.03.10.06.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:28:34 -0700 (PDT)
Date: Tue, 10 Mar 2026 09:28:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	sebastian.hesselbarth@gmail.com, gregory.clement@bootlin.co,
	andrew@lunn.c, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mvebu: armada-37xx-periph: fix __iomem casts in
 structure init
Message-ID: <abAcfphl-aakfcf5@redhat.com>
References: <20260310123625.163846-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <20260310123625.163846-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a6Uos3r6-39W4jZ4W2kvI2zEQbDsVq3EXvrid5NiKTo_1773149316
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_062839_730619_A8BEA732 
X-CRM114-Status: GOOD (  11.70  )
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

On Tue, Mar 10, 2026 at 12:36:25PM +0000, Ben Dooks wrote:
> There are a number of casts to "void __iomem *" in the initialsation
> of the driver's clk information. Fix this by adding a helper macro
> for the cast.
> 
> Silences a number of sparse warnings:
> 
> drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] __iomem *reg
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
> drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] __iomem *reg1
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
> drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] __iomem *reg2
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
> drivers/clk/mvebu/armada-37xx-periph.c:255:1: warning: incorrect type in initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:255:1:    expected void [noderef] __iomem *reg
> drivers/clk/mvebu/armada-37xx-periph.c:255:1:    got void *
> ...
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Reviewed-by: Brian Masney <bmasney@redhat.com>


