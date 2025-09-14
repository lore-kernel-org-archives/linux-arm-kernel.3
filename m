Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A51CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/P2pmY9erGP27JX1LIX0xO5lGm9xSowmXkGs5Snrvk=; b=LVmsMsv2eGBEHVadELdOGiPCF3
	3ArfDyaKSEq3k0j/rwHBwlc72+WqPohcSFKpYVQo5/XKw/iVcuQFAB9yIH8B0G7aXGC8XdRbu8nEQ
	hJnbiz8lMoYC0F4ZNNvwe+e7HlSdYm7govhLA32E81Ans+hZInVq3BKadwg8h5DnsAQnSjc5KmPkK
	Sm/0OV6zUqFS89cHP9K7/E0lgFrACmWrr5BxSawKuoQJQd0mZo3lp8SYnZnMeJa0KmnSYAJW0cD2H
	z9pMAsDSERsqX7QEt4WJ4CFqp1WOIimJTbxJd+ghZMnHU33xwxsghZhVIcIR5Lg5POO13Jqii/DoD
	I0nWyDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlQK-000000013AY-22FP;
	Sun, 14 Sep 2025 12:01:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlQH-0000000138e-3Fcn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/P2pmY9erGP27JX1LIX0xO5lGm9xSowmXkGs5Snrvk=;
	b=gBIUvd4fckGN6RTSALzJN7JsqnAWkaPUNRxZTxXlSayx2VuepzmF4aWT7uj4OoJUKz6Eg0
	tSjz/jnuU32SZUMQ7sqSZbdA51H1xKV1aPLaY/eUzGG7W5og2jE9/N+k1gDjvPzWrq/loE
	peL4G1PMZ+vdcg4v0QbxUa+Hqx8kcpo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-zfhEee7SNeWNNVOaQSyjmw-1; Sun, 14 Sep 2025 08:01:34 -0400
X-MC-Unique: zfhEee7SNeWNNVOaQSyjmw-1
X-Mimecast-MFC-AGG-ID: zfhEee7SNeWNNVOaQSyjmw_1757851294
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-811917bdcfeso807035185a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 05:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851294; x=1758456094;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/P2pmY9erGP27JX1LIX0xO5lGm9xSowmXkGs5Snrvk=;
        b=omeswxRXtq6ERe6fGPbzC3+5JK+38njxfXgF2Qu1URYXBa6hNv/xCpwPY5CJ/it2MI
         E4LPg4MF5Ja6kdqbZVKsKcTH1kTaQkfbPebqXRxNX0Suk/zJ5uPoPMGLACIKt1OFZHnI
         ol3tk1n9zLtBL9RwYVuDzdbU5mymDMpDdWU4VPxVC8CLfHRdCGreaMyt8PQlP9n61u8r
         F6DitrYURRxs1o2mNQfJ8fqygYv0GTxTiotJcoVeVA3hxIvuuEJCg8nC6angr8vURLWa
         1vU0X+2/zcA15xo/vnnQ5RYc4/TyrlzQEVcHKXif8YMuuHolkROr6xiOvkK4OPxKTZRv
         62hw==
X-Forwarded-Encrypted: i=1; AJvYcCV+2gsoBfEoRZjY0ibQPhG+qudPsCC25NMv5/wJva6pHHJvK+IWoDpDTFI/ilnG4ZrBqDvfjqjBgu/STtfOIg11@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7xGiXcqlPI8WQ0QCPkXaH6cU5vTMa+qzFrAl7HZlJ04+vvt8I
	skc78kXTwPBrvZDnFvG1FTYmkNtSbBdpx4PXdKM+kKGJQTQIz8Dt1KLVkUORXVARUyzcJ7kpVXM
	itybpmvXRf7FSwvINPrcO+zt+bE83iv3E1IqYQAdVgjXudXn3SKgjFJkVuEfdew6Ghdo00wc5Q1
	gQ
X-Gm-Gg: ASbGncs4rzF0nUa3IZg3Znxa19o9e7Kn3QIIFcSOtzjz7vM7bnU5BqdlyGvkcIKjD0I
	tqCD4VAcUlZ3tZ1Aq51LkbR0SjyLHAM/FOyQE4iKNR3Cw4FBVh6ElJAsdYJjIGOJOzBp59+K/Hf
	0FZ0kPv64Doxu8Qb3FcPjTdwwGCiRdFhX8NTrm4MOMooFy0I9EOAo21H06StgNtpmd1zB+EmuD3
	DG3pPR7kIwbcTcvyU/2AUzxw9z29Fl94zFcGEQ6Qsvn5AwDbqLNQvbw5jXCcyBRtRcnF5dnSaUA
	UbMx/kpgjOTb1k6amJrFugb+7vkSiNcCEC8TL8+wgNDO8kHA13UYneDxMa3oHkxcWYmRQBBU+Z1
	7pi1LomPgYKxUA7s6uR9Bx7gQ80hQlik=
X-Received: by 2002:a05:620a:1a18:b0:7e8:3fec:5e61 with SMTP id af79cd13be357-823fb826048mr1027927485a.7.1757851294097;
        Sun, 14 Sep 2025 05:01:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIsrBfOXyBwmvGT0Kz8IZrStEjhdVLehZi62PDrHPdMWX397mJ04MxVHeqPCuDiG+BC8R/RA==
X-Received: by 2002:a05:620a:1a18:b0:7e8:3fec:5e61 with SMTP id af79cd13be357-823fb826048mr1027921885a.7.1757851293541;
        Sun, 14 Sep 2025 05:01:33 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b7942d706dsm16096071cf.23.2025.09.14.05.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:01:32 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:01:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: bcm2835: convert from round_rate() to
 determine_rate()
Message-ID: <aMaum0Lv4C9B3Mzt@redhat.com>
References: <20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EUaOWORNpeSaFKL3t7_iN7YF4EyFKSh3w5PK8caq4lU_1757851294
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_050137_890905_65FE4A3F 
X-CRM114-Status: GOOD (  12.85  )
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

Hi all,

On Sun, Aug 10, 2025 at 06:32:18PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> appended to the "under-the-cut" portion of the patch.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian


