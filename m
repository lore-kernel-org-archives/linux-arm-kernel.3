Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71157CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 18:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLJgKW63U3laQ8TNHosGYPDklPCsb+gg1+m7SNDlD30=; b=GLnzYi7IsVWN3YyS8xjeaFM4N7
	k9ooZjET0K8oDZCJWU6AlWSIJytzj4gW3xpt9/P02/CKZ/jnemoRct6d7ihJ6VcMCvXlVC4gEktxF
	WNhw4VinMrlATgHyL0yZ/IPja5TLeySOm4ONBbPv2ww0AIRJsGdsu7vA0gpwVaQRA0zaAcAEFdllL
	MVG5w57qQLE5IFuWxcIT7zAw3ZT6ZJK/9NDp9O5EMdymFMNz+XPdVvD/mU8xyJCnf4wXoGUMdIUJX
	NBHbmiTtATcncGoXlnflfNk97qcvT54N3pcgwYohWgNfaXKg1jAiVv2ZEYTCIjJNaBOuLivEVF41L
	2QkRBsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdLQ-00000003x8k-0aHo;
	Wed, 22 Oct 2025 18:13:56 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdLN-00000003x86-1p5v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 18:13:55 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-26a0a694ea8so51302455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 11:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761156832; x=1761761632; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLJgKW63U3laQ8TNHosGYPDklPCsb+gg1+m7SNDlD30=;
        b=CT55kFi8lx+9TGHir3uUQwEGYpjiMVrbjrlEnfoEsgrm/M00jcZ4SI1lSlRVHg/U9k
         fVJ5wp7wQAtH39B+ylqVjnppuVv5fFRIDXWZpHaiRw0IEEb6h5MwXzFUx792t+kpxoIq
         bzX7xWUOOJy8/PSYpDlyOXfJCIVwEHDNfxZexDbYK1XX3Zd//s2HNdvprmdwZKLgyOEb
         54cX2x+G30R6H41st61JrkYD3V+7V2DEM6CQiM/vjsnqrhlcUq2Ho2hZ49GyZAVn06TC
         jHpMXUcJEAL7tQVQ4xHO8zLq6BvWQv1LWtt0iorz+JuLBvikyacjKIIGm1fxnVMQYJHG
         RL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761156832; x=1761761632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLJgKW63U3laQ8TNHosGYPDklPCsb+gg1+m7SNDlD30=;
        b=i9SuiHq+fquW2GcwPQ6PzQtNukLihfGM6gzsZYN1RZ10cGWESJL+yasihQz8B1SHur
         a8yNEXVimOP5p5mTlWnI2puz9OtBphtK00Ac0ldDc0o5mrZQYpIwIVvxKARQl6xiel/G
         y+RAfsE+XyySqs7GX1/PzyCn8Aw++dmF8CkThHxNj8/WHNyf0KNUYVjLZLQ4eoOrj1oY
         b3CELKMUMt9hrcuvtVPlTFVSEwB/YRqQI/LboroMPF2u1/B/UsgjM60kZ4ur8V5emlpf
         lUvb8Q/xGxdvH64veYR8U5KdfcpcVzoryjfCplPVG0EJHHrxumvTx91ASP+vTr0Y0myc
         VjBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjuGnLqZxHGB0vxK8cY8aKRa1sXSiak7HIiwK1UmqdDS86qyONZgMaFfkQOPeTWPHoFOwx9HK7m/f1hRZ8xjgT@lists.infradead.org
X-Gm-Message-State: AOJu0YzvcRO4UR/AKU0BL7L7SeTgOvbp+E0iKh+8wbP4W7TqTB7FudWw
	DUWRY6p37anwyYrjb12vgSbxs28VPCS3/Q+KkNRL35eeTNUM9bmPgn1D
X-Gm-Gg: ASbGncvWjDb6AMV7tCFH8T4fu35hm4JRM3PTSJZEGGQfu/qbgG8OEyrObGT/vpTSDMI
	00ad6F0Fi3mPrJURAzgcKc20cOMAwVoOSHn2eDukde0LPRufDtBtRW0vFbm2IV7wQw4qDDjv8zQ
	Jc2hJ9xhoK79A/ymcz8E3bI9XjVJpv+GxO3cvoRfu9IGb3aShBU5Yf0JZHYry4yCdfDyE4z1SCy
	wx8lCWC1mR164dCzNZNeD0N6z72koB1MQ7dRNv7ICUs9qR3PXCAtpTmlj/ER9DB6o4pgwBJCTkd
	XeKDJ5q1vvOHy80OHFgjAjyjSG5j3QXzHvsG53B2O4vp4Aa/6VWRjdkPATC7c29Fxoa1uqbv52f
	yf7S0Phkriwp7/pIg/w1XRTXvEdahXBeiTP3ye7EjtwYHwkChxVoL/n1zMZuKEcvFSmcjpdzch4
	9tPSAj0AruKTPv4n2V9yVwC4AeUMubSjMyoSvCmQ==
X-Google-Smtp-Source: AGHT+IEKSvBBS8awXEhQRZuuE4/RFkGN+a9c8XIx/ZTqTS76us8OMEo2zvvCAOTGGDCXlFKP7uLGXg==
X-Received: by 2002:a17:903:8c6:b0:28d:18fb:bb93 with SMTP id d9443c01a7336-290c9c8968cmr299698995ad.7.1761156832260;
        Wed, 22 Oct 2025 11:13:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e22428b1esm3212795a91.22.2025.10.22.11.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 11:13:51 -0700 (PDT)
Message-ID: <82e4adab-73b0-4ac7-8c29-718b12a73468@gmail.com>
Date: Wed, 22 Oct 2025 11:13:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/6] net: phy: add phy_can_wakeup()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCJ-0000000B2NQ-0mhG@rmk-PC.armlinux.org.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <E1v9jCJ-0000000B2NQ-0mhG@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_111353_476945_AE398E54 
X-CRM114-Status: UNSURE (   8.19  )
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

On 10/17/25 05:04, Russell King (Oracle) wrote:
> Add phy_can_wakeup() to report whether the PHY driver has marked the
> PHY device as being wake-up capable as far as the driver model is
> concerned.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

