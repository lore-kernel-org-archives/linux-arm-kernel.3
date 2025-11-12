Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49514CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JH9RQWDlZksP3A5WjT/Tdcm9mFgNLOafV5repVUVXmQ=; b=oPZ0hC9aJWdjATrVPei5qzRYsQ
	2FliKKAjH7yFE0t4KVkwGQSBNcQd2bKWusjWmu/ieNQcUeVCX5cB3oB2FhwJDhJyUGLiQJ+ycMKlP
	EpPjyVrkFeOix0J646g7LU8csM/pLik1/byTAxO+RPDva5iZSq1XMvnpqHu+42pR4Wt8bHI2wewI2
	BE2s78eWIaKrEvTm78zmeSg43wYUMUHPWIOy+5c7rzRxeEtzmI0FTk6Sp2bMuC8qxusDC1LU2RNde
	lg6T/EftPzU1Y36S7KYAOaYNFJtGT20SOAlI52my7xKfS4vbJSatCvJz5d5Od5jk7t5O3uyn1ihEc
	sLZLrbCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9Fr-00000008heT-2AGT;
	Wed, 12 Nov 2025 11:43:15 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9Fo-00000008hdX-3T2u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:43:14 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2B2753FE50
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 11:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1762947790;
	bh=JH9RQWDlZksP3A5WjT/Tdcm9mFgNLOafV5repVUVXmQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hwgqECDsQzlV6AkQZet/s6MW6kquiGQf88sNdGh4gEQ7/0u/341o10m6Eqjcp7YTT
	 YJ3n4dwsOFKkuRkFZHFQ9I1IYTKpFj2NdNAHKZvw+UoxmQJKWcvGZKhkf11Dpl1N2F
	 3dxvIw9MweMvZCrUSK3IB1aoiJBnHhvj7VwNQLivzJXVWF+AN0bqIuPKwZghteRu9I
	 uLUk+KidzELo/6A2YP0z6l756KVR2cT2SBgxK2gPerQhcSyfVGLTcMreYhVJzBYMd9
	 PNbc/p7Mmh9KVomp3OL6t6ihENY3c3jQsoN0Nz/X73BKLxcWftalvCZlkC/nnHpn21
	 ZCjG8WNfi9xOUzNOauBCld4Tq0aH5rgmmymdHgzHElJOorZ4uS0wqlpYsqlWRGFujp
	 QA+N/+hjJICMLh4+b9hmIwDVwTBIeya8e9R9ex1kmLdkpLI3QV2xbO34DZSBbqX2vr
	 pMZo1w7onvqDEnXdvW9ZxpiaD9l14LaYZATkY7sESRzlHwSalawuNFriZ+mJPBS9IQ
	 qbf8JkdWJ6gM/xiWCdt5kzzdamWTsUHJAUDzVXy+KL9xPkoQhF3QX6pMtrWHOD0YQR
	 2PuxYpi8pj5+7POz6rIgi6To+YSRht4s+TV89jY4e9pNpkhxwdAy+BMNRSYBtnkBTc
	 l5urrNTKcGbtH5AH9HpRTfes=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b70b974b818so66239066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762947789; x=1763552589;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JH9RQWDlZksP3A5WjT/Tdcm9mFgNLOafV5repVUVXmQ=;
        b=bc1XtlbWtCbkmnly56ydIJuaEqOXHtPAN/XOpTB1pygrEMMiel49iuNIRXp+sl+4td
         w1Pak+1tmz42Y6gn2PnUTegIzMsOI//k+5LzySRUmHpEu8Lw95qdaONzFUBrPl3eSwYz
         SvMhcx/XZBD2z6B/5sRPw2Q46jLmDgMzcxXmmu3+XgfvBFpIs+QB4UhfqTupPzLTGqBp
         1ISe6BxwAqk7MqfGPHqJaOStKM/ku+Mww+R1yG2uiWWqcPlpab6+kdLesWY6NIWlHhzn
         9qFF+uCJkdc16JRlN33DWVz+GY6z4u7ovXp7nJOsRcT6WDwfvzceW9zOtYgwxg1h9CT9
         YAYA==
X-Forwarded-Encrypted: i=1; AJvYcCWXOMhMJW/lNJZ+sMdLBRGNxWdq3VZujb7qRj5y7HkA70q3B20lFelOvbwnDqQbpI9J7LK/FN+aGFjnBBBZlz9P@lists.infradead.org
X-Gm-Message-State: AOJu0YxuONhcqjGpdjjqu598KuSlxiYodRW4ELoTgKj30p543a8ThiTx
	8LhgicxwVoDgvc/ll8XyJkYcTciHhyicBNGMLDcN3bYTNc5nmvCkNI+f8QUHXbXvH8zr/Rtts6Z
	4b6JXukUTof+7Q1o4YfyO9Hgr+icOE2fmrWmguBzaqDxsXNQucYfpeshxXi6OfPKIk44dWuwMaA
	h++IhU3zu52EVD7cuAPB/lwwGuOPLKjiYxP2b7+bdP/vfBKzOyTwn+7ke1hKIWFTQZuGQ=
X-Gm-Gg: ASbGncuiMk7uqH46zbeFdP1AuxaZZRZLrWwNkGcaLgI4I6arKdCmgUT6/tHXgQqBzeW
	ix/BlmgdrZoRF+dd0qzmHq9VGbsxqEW6QT/rPG9gCRhxnqPm1lTeM0XC9ac3piao3XMvzpwI2zX
	Y/o3ksuibzk3AqYGxdzlaM+NrlRnjVTjr7JSeLu0aoYw4dS5cNMZA6EPIZxLVe/inzd/BRWGmFI
	WoOvObg8PCJ
X-Received: by 2002:a17:907:9713:b0:b72:5a54:1720 with SMTP id a640c23a62f3a-b7331ae8bbbmr239079066b.57.1762947789508;
        Wed, 12 Nov 2025 03:43:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEACqB0mCN3EX0p95RUNEAUTyaZ39pandxW0+rdirFn7EUt3COrqPK8HKamiHijsSU/fq2Kt0hi/1uzUL2rjsY=
X-Received: by 2002:a17:907:9713:b0:b72:5a54:1720 with SMTP id
 a640c23a62f3a-b7331ae8bbbmr239077666b.57.1762947789084; Wed, 12 Nov 2025
 03:43:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:43:08 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:43:08 -0800
MIME-Version: 1.0
In-Reply-To: <E1vIjUF-0000000Dqth-0gwD@rmk-PC.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk> <E1vIjUF-0000000Dqth-0gwD@rmk-PC.armlinux.org.uk>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 12 Nov 2025 03:43:08 -0800
X-Gm-Features: AWmQ_bkenMvacX26pAHg6nt10w-7MV8cO1nbkR5cqs-fMNBqO4TpuSWeehZ0dCc
Message-ID: <CAJM55Z9O3BTejaAnTH4nTXT3VcRU701BWdSusRNArt-9vkCFYg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 08/13] net: stmmac: starfive: use stmmac_get_phy_intf_sel()
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_034312_989002_48F755EE 
X-CRM114-Status: UNSURE (   7.68  )
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

Quoting Russell King (Oracle) (2025-11-11 09:12:23)
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

