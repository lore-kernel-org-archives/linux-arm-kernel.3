Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF12DE7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 10:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFscs7fH90hM8XMoELo7T9NbLyoZ3UXoG7rlMcZyHVo=; b=XVeR6mvuEs70TenQmiS94luBa0
	fA12HQIcu42ZJRKgqAZGfugYnUioK8QNAj5yT2rJokTpq+304uoDBSSYFYbwRF9gWzt+yBEWOYx+A
	vQ5jt/w5lwkpAbcHGOcNZiaFY8sdA8cXz5faY53KOKPGhI+tBtWC0xhcZbUB+NPxA6Ctv6HSk8NBn
	WlloORN82MLOyvtzHaR1Eu7wjAeZwnchMJMP6AHKR4wcekGZEWOseMQFPuZpcfW7VCTjAR8Q1qxMk
	OKD/6CFcc+8jxmaD4vx4dn/hu1h9oamgMybDIMzr6KzDafu2AeW0PVXbLmVHhz8GKne8TjyIyHumI
	4UfUhDcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJsEe-00000003q7r-0EaZ;
	Sat, 07 Dec 2024 10:40:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJsDc-00000003q2P-2FA2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 10:39:25 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-725b93a59feso1383172b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 02:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733567963; x=1734172763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFscs7fH90hM8XMoELo7T9NbLyoZ3UXoG7rlMcZyHVo=;
        b=XJGQgmUendquvd8Mya6w5sAaxnOX/nOBv4cyVW0yQVcyV06D7/mVTKe/giJorwE1sw
         LuyNaTty27NpaYmYhjFk4rUrD8JL9IxJYeNJ21ARDfYmRl3UgV81MDAR5yX+rvz1xRX8
         X+zFep/hEsuKCCNjZfSqfsbJn43BakDPYyQrOb3fR0lqObZkXcBUldEmkBhriwN8zSaH
         U8sC5Cg8tIGllaRRCXcNrCbFBIU5eT5DnP2O1mk5ooMvl3d2ltiDU5vRxfxDNqtBrVYg
         E7zNfZAML0xvwZmNqyDwSpDSf7Dm8XOZ2DjiiKnT4SBzDOMtMgR+92l+YvhErtBhKunR
         yhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733567963; x=1734172763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFscs7fH90hM8XMoELo7T9NbLyoZ3UXoG7rlMcZyHVo=;
        b=gjBlh/ftwquaAhilYbnMZDZzSEO+2PxDw3c4RAM+t8YtkVxiy6hYFstCTtjpc4NwV5
         8LJnfxFMSR3f3QZ9PYdLQ5cmfx95352irgrdqcxqJEihsuBaBOt/cuVcmBZ5gnbyHJEk
         t41UBaBFMa/IRDGVPrQp5N1hOEPt/zv+/WNmof+doZW9vEAQhZUSshi+Aag8yJ2gSpHt
         P5+hIVJvQ7wUy25RPnkBZ5ddPnzLB+xyQ+v9H8kNpOK14yuv3z7zC9nNStOffivxqX1w
         HgrI4QmaA79uUIqUv77gVuGCBGdG+S6VgU48k+XMGvSBO/aWcuRN9bb2LohKg+ZqzE7T
         zpfA==
X-Forwarded-Encrypted: i=1; AJvYcCUgyitLW4rSJRlHnjMJ+PLbuDVCohmSXnCwSugNZsU6qTqwnW4ib8T1a5c+dxHfqMUuYAETWjnIzPzgHtZd2tF/@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ1eSySSJ7xzhQBJ7YvVsXJiwCyh/golku7OPVwkvnzGv+8AfR
	K1rHjcx1kkf7xIo5VpmV1TejeAm8l7uiAOdPveAeHu66FJaMMmU4
X-Gm-Gg: ASbGnctPotIvapf+LuqSIKDZxZRUMnsvF8Dw3JLQTyUdvJw8YLSqfp1iIU0lCBBrv8n
	aPpHtcMSsDA2FBaHAMihnSFNy9CQswwMdtqYgGAx2B7vVGYs75fnlpn1nxTI8xpX0V+MwVuZ0Mu
	ffnfqtyLX35lCrbGnkAiiUhUcy5bMGbpE7Hz+zELS18H2ZsiBZkZT0uSE1J6LMzRL2HP0lBZaNE
	sidUlEIcC8cf3eKsZMS7RDSzcHN5Eb+j//CsiIG4UJD184=
X-Google-Smtp-Source: AGHT+IEysiOlJ9ETZ/Xxh9z0hjLaghuXzoMd9yG4NbBjqLdyrzHc4t//d+YwIv8aZJjTQdnU3t7pmg==
X-Received: by 2002:a05:6a00:4c84:b0:725:d1d5:6d80 with SMTP id d2e1a72fcca58-725d1d577e8mr1656122b3a.7.1733567963483;
        Sat, 07 Dec 2024 02:39:23 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2a1598asm4278372b3a.81.2024.12.07.02.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 02:39:23 -0800 (PST)
Date: Sat, 7 Dec 2024 18:39:00 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v1] net: stmmac: Move extern declarations from
 common.h to hwif.h
Message-ID: <20241207183900.00001fad@gmail.com>
In-Reply-To: <Z1QfupFfg07jTMUc@shell.armlinux.org.uk>
References: <20241207070248.4049877-1-0x1207@gmail.com>
	<Z1QfupFfg07jTMUc@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_023924_579837_1306D209 
X-CRM114-Status: GOOD (  10.98  )
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

On Sat, 7 Dec 2024 10:13:14 +0000, "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> 
> So I think rather than bulk moving these to hwif.h, where some of them
> remain out of place, maybe placing some in a more appropriate header
> would be better.
> 

Totally agree.
I am going to rework this patch into a bigger one.

pw-bot: changes-requested

