Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2B2C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fARRLv2EAES/QT6e4xl4U/3Dyubza5vfMD7Ni6b9N0M=; b=IFLFFEIGrUx7rJBcjdpTQ0In0f
	pNgUiyi4mtP4GCQYEzGBYdhoxbrrxtboUQc9+ZOW7t64ry4PUI9virEJyqB7jOoPNgPq2YIpo+aS7
	HVw7+X2HBOq3p/E59ggJGndKvyS2WNbfPBikW6qMKxEKzS/APO0/xqYpZbUJtgI2jfLQMRZreQYpF
	BMW4I2D8odhtuPJRkXFE08QpwtlzJMSj8iZ8BMQmOPgg0VguBG7eczJVq0SRI4uis49T7VZc4pGYB
	ZhbgonBO6GK3ugoQ/IsPr74RyyK66PrxJSRMcJgd+p35KPtR+76fFGf9ndaE7ZuTYz6LAUfDmZhKR
	vGMMKnxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaE8-00000009Bqo-0XNe;
	Mon, 26 May 2025 15:59:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaAQ-00000009BCp-2Swm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 15:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748274908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fARRLv2EAES/QT6e4xl4U/3Dyubza5vfMD7Ni6b9N0M=;
	b=PO17gT8LfJOAyEZNrPb6zaXxcO9yg5XGvcIZJHsrwYqy9EfefGDyJFdb9/gGVzh8YfmqCZ
	UyWmcoMgIJ6It5Fv+E61+/xgnBiB4aCHPYTXKF+/U8/pt/v7pjVNkPkS7oGykIG+bq31b4
	+zJJAcwITkwSEAMQSye9iJA6d9A3ZmI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-W6YbMlf8O2KnEkPBMxaVFg-1; Mon, 26 May 2025 11:55:07 -0400
X-MC-Unique: W6YbMlf8O2KnEkPBMxaVFg-1
X-Mimecast-MFC-AGG-ID: W6YbMlf8O2KnEkPBMxaVFg_1748274906
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a360d01518so1540259f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 08:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748274906; x=1748879706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fARRLv2EAES/QT6e4xl4U/3Dyubza5vfMD7Ni6b9N0M=;
        b=teVyR+s+0WFiRJ5H2fsXc/Mr91QMH0o2MzvN6L6HnSAF/fP47YBbqY6NbuIcuTA7WP
         YL/nFl4Y9tbAe/AMpZDMLGuMwGICOP3ED/Xdv3V6cRKrS7JRv0QpcWJdf8ldwQ7b65c9
         jUEvKyGA5/msmyQhBt0UxMNDRwVDhop/mV10kFKIvBRcU9JfIAl8Xu56u9OS9ZavWBO8
         tcTszJ2SGOs3c1gVbFtp4mTDLFl1uBw3Uj2r5HXqg2zg9fXSajKOpAt/a7tgY7KKOXrm
         XZ3/i9CkYw5KgAP9kKLG1myrxkrg9yO7fFDG9v6Gu1xlKnDNmNtZ1X0Uo6CPWYZK878Y
         1pWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzz7mjGxLviQRzC7afDpbVVWOYOV0iDB8b44trUT3TR72LtiZx4mDvAI9aaPUXq0ulChTzA3Fs8rOgSfmsWUUR@lists.infradead.org
X-Gm-Message-State: AOJu0YxRc4UHFhrIIkLkst1iQEZphOXmxD/qX8utd7etZ4ICYlVMomo3
	GRExn2MfeVCc7NcSlnUOBv9PyKWa9Nfz50hK6hW+xCfvAHqUtn1cLRd3XYBfQAlWPwXLKFERees
	UkNNrzPo9hNOLe1fRbnm7I8pZAuh/jT1aq/wBEje/EHVW7fZKplmRPenTyRDSA+MdS8cM+G++mW
	5j
X-Gm-Gg: ASbGncuqLG2YxgeVH9rib7dlvfFfDxX8L/slfqskqIwe313LNqNxXHlMtd4bAoCWJur
	zw6FmZYsB1QmfCc9OGw7RnR6Kejxo4/OlpF+PlogN3RpljLmvm38a8ZN8/Z96Fchz6ZwX6QvE1d
	N9K+IEEbjslfibNQGZt5C9KORVj3UJlAfgWtHJiis8Np3xNW1A99hcoOQAvoRlQtBFiOLWMo4G3
	1NJC9lFGA0lWlT3UrI2rhPn7h5NSJM65lVVvYsj0FGE3aYvKrF6bPYbdw2lk926fUv5bWaP8uJz
	IAY6mu398k1BesrjZRc=
X-Received: by 2002:a05:6000:1ac6:b0:3a3:6941:6013 with SMTP id ffacd0b85a97d-3a4cb489c46mr7644603f8f.40.1748274906114;
        Mon, 26 May 2025 08:55:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEniW4Fa0wQ5QCsDtszPeRRxDRH9P02gatIOFzZCMuokpVnrSJPxMGRC37ySpxpVr8XiaeDXg==
X-Received: by 2002:a05:6000:1ac6:b0:3a3:6941:6013 with SMTP id ffacd0b85a97d-3a4cb489c46mr7644577f8f.40.1748274905760;
        Mon, 26 May 2025 08:55:05 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810::f39? ([2a0d:3344:2728:e810::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4babec83csm14730739f8f.80.2025.05.26.08.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 08:55:05 -0700 (PDT)
Message-ID: <edb8881d-0cac-4f7e-b358-299bb30b5f27@redhat.com>
Date: Mon, 26 May 2025 17:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phy: mtk-2p5ge: Add LED support for MT7988
To: Sky Huang <SkyLake.Huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250526091019.16096-1-SkyLake.Huang@mediatek.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250526091019.16096-1-SkyLake.Huang@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GmF2P5sVvj2ki7o0QKUY62Ae4n3iZpVJoQNsy6Mxjgw_1748274906
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_085510_704643_9F2826AB 
X-CRM114-Status: UNSURE (   9.59  )
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

On 5/26/25 11:10 AM, Sky Huang wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> Add LED support for MT7988's built-in 2.5Gphy. LED hardware has almost
> the same design with MT7981's/MT7988's built-in GbE. So hook the same
> helper function here.
> 
> Before mtk_phy_leds_state_init(), set correct default values of LED0
> and LED1.
> 
> Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

## Form letter - net-next-closed

The merge window for v6.16 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after June 8th.

RFC patches sent for review only are obviously welcome at any time.


