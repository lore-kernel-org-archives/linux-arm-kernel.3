Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2928DD3901A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 20:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=it8YUnHSXKXXQABJkL2UVvwmRP+gSrkDN7MsvYyaZ9k=; b=J6Y0GCZJoPY6hUY02QJlH08B0v
	mwTTNQVLHWtQBpnS82IAUA3hiqE1W1svZIRECZAFWIrgHNsFiN22+845FQvfijMe9y/SRwdj7Ez3Y
	0oL5W1aUW8HMHCeC8L4qwzACgA9vXynS9c/UyvQ257cUw3uqNVZ2NyN1GQpZo67zK9nIPMLpFWvY5
	I41RInzJiHywAo5tdbRgS0hLbwAeFOVE0ePXXTTkmkr3QetNz/SqOgboXspuWGfgSSfbNsd+yB7mW
	H46izGdEevmqjiZORxhQBIHkEZxOmsXASCTwTNFqlBmWiHKBA2O7bmNiA12zK6rmLZU9p36WlAznZ
	eFKxMi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7nQ-0000000AgPk-0gLG;
	Wed, 14 Jan 2026 20:48:52 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7nM-0000000AgOv-3eVq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 20:48:50 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b86ff9ff9feso3975466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 12:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768423727; x=1769028527; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=it8YUnHSXKXXQABJkL2UVvwmRP+gSrkDN7MsvYyaZ9k=;
        b=Z0HyxJZab+G355VcpkYqPtX+2n2R3B6OMaXdMRBijS5/jku1Iyss97nAZu7hnv3oGt
         YDQOmbSBxffx4sGlt3i7rSFS30glqzdwUezWU0Jfh0gwE6sunGPi79JqbUx2HLfupcEa
         YE1g5p1NwCgz/i1ESFE2SP5SwSAc38UyKMJ5tMmei4vgcjL63+CHELs8igIz/uLyJTaB
         7+ntxOgVgkLFyDiBl94tAQBxF2y/LSr0slLuUywnoFubN7MAQxzaWW4Q+pIGIVu8RJas
         shKLKyvvqHP4Okz7xhuZpHGs7Mq/pcE+f3MEQvZhDeqaaeIk6WlztyYARbDY/zZfsfEW
         1D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768423727; x=1769028527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=it8YUnHSXKXXQABJkL2UVvwmRP+gSrkDN7MsvYyaZ9k=;
        b=CFhkOUa7GtHwbukgW6zDMKKPVA9ePvioJjOV852ZXJGpKm0wGN50XgmlSccZMgybcF
         EMTIfyWclD3HQi+/LAd8o1A91f/Z6xc8C5bG/ipwJXghcor+2DQKFC/JCDeJYCkOmExy
         c3bp1M8Izvf4fLarr3aKkkc4ExffY0LH9BQXCioSojIlqT6R/MrXsNWAolrZiuJ06BgL
         JlWVVu2akoq3WkCI8gOL3K2eJYLY3oBrksUMG/aj9LmjPOTD3NyCOXyTwyhUDQhxSUfb
         Nok6CUj7hPNlqrJFjAzaEY+86erBiFyV+6c7jFuOsEV2Cd2tv7gs4Mtpb90zDg8KAHJ0
         0QFw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Vz4gOhYa5xiVKeo/WMkfhzxTRjV8u51I93ssDjL2SR4QIw3qBRx9GZ7bybNye5Hje+08R0Ozf7kY6dnLARNU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+SdmyT6UcOTR/GSufENn5r+oCd8hfgdYNXU6FHCr8kNJBeKK2
	BS8kL0vaBPRGLD7DLGCoiMFzqNtUSuho5JgVW59N+43vDP2aYN1RP9lg
X-Gm-Gg: AY/fxX4uLq5L0WKACQp5tqT1p61Ieiz/UXJSqYqEx12OHUPwFyDtUuBGQeSFT+MilzO
	ulKr/1WEj8MKa2WpRvzqin6TmxM9WV1z7sAZUA8SAPjtt76z7dqLEz8KhX9aMHW+0AzVmSDcjfy
	Z9FsD9sji3kRHxf/m8ekRAcxAwkCeAsQr4UfN05qkCn9DpemumTYilo1HCf4tULyzuyWJH4BNCN
	iwxrfVU+fXWLgDpkzBOKaS9/0NaxfiVi+Y7qIq9d1ZDV2kQdW40j51WX7AuYykaM40xbql2FSl0
	6Kf1yLDzlimBHKwUY7YMyldIAkKHbfswmsWJ4mjz0qm3flga/yImGWe06n7h+oMoc/Z5Cbi9IPL
	dE2bYyGu8/9czCuyvd39u+xeMLN98SQfOj45/ZFc8f7tFO0S09JW0DicG8NQeJB887HiwHGmJu1
	q5YoE=
X-Received: by 2002:a17:907:d1f:b0:b87:2780:1b33 with SMTP id a640c23a62f3a-b876114f9b7mr180435166b.3.1768423726590;
        Wed, 14 Jan 2026 12:48:46 -0800 (PST)
Received: from skbuf ([2a02:2f04:d703:5400:9b39:8144:8a26:667e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b870b0dba4esm1111374666b.17.2026.01.14.12.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:48:45 -0800 (PST)
Date: Wed, 14 Jan 2026 22:48:43 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 01/14] net: stmmac: qcom-ethqos: remove mac_base
Message-ID: <20260114204843.e4pyfb64n5jn3wop@skbuf>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vi-00000003SFh-0Abn@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vg4vi-00000003SFh-0Abn@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_124848_917239_BCD19BCE 
X-CRM114-Status: UNSURE (   9.45  )
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

On Wed, Jan 14, 2026 at 05:45:14PM +0000, Russell King (Oracle) wrote:
> Since the blamed commit, ethqos->mac_base is only written, never
> read. Let's remove it.
> 
> Fixes: 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG modification")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

I think we reserve the use of Fixes: tags for user-visible issues, not
cleanup of dangling variables. You can move the sha1sum and its commit
title in the main commit message body and delete that tag.

