Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CF4C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKhJx1wEyO1XAHiYD4ulqqEa2XMnW8boyqSFRDJ87jg=; b=rF3+qfumuV7lP6ME8ODbryguEi
	IcHq7QbUuz6ni0F/7AS/3cHZxNc5R1fjoaKLa/jDXHmykTVQh0bKfNF3a5iGPTsE45CR199nciJy0
	MH1WGl0/wOAkejS501dGEmC8iA7rou/2GGo/fcdzUJrKU2P2sRBH0mQZaEHfhPnNW+USPgjy5+E6E
	JzJaWkTKCzC1g4qzU+wHGFpni8rYJj105VniCHBYw31cYJclBAplqffu6NWlLw7XhlrsiFrSplgeV
	SE1XyYnMkDDWcV2xb8I9z0yE42fBON+zADgJgqc/b6HjBNhVNTduxAfwkeV42mFb4+7cyb5bZ64UR
	tJfXf8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9f05-0000000AT0k-0V0o;
	Thu, 24 Sep 2026 08:40:17 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ezy-0000000ASs6-1tvb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:40:12 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350faaso1150096f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790239208; x=1790844008; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKhJx1wEyO1XAHiYD4ulqqEa2XMnW8boyqSFRDJ87jg=;
        b=BjNfQG3rCXQuFAtXZOE+I8Gr9aKnbeFDdumA27GTaj7OkqEixiwQ5XsnxI3DlMtk2b
         +wNgCc8kU3Cnxr7LN1EIXj+Mj50Ri5E2B0/BG+qQywvRrrwupHIk/iZA3P0NRKbhLe4P
         p8O5rxyoW/NeAFK46OlK3rNDfxmPdu4SKVPvy1RD9xt9d+PN6YhzRPRLtXCO8JaRUOPu
         ceAW/rT3+fmmmepwLC+3DMG/uNgcxVNIuN3XGbA/qjN0EnXnc8orBnP6nNL7yS1xfavN
         /AHl9OY6QpTdq9FzgnAfykHRR5MHcn0hQv9tfIwIGm6gD5VlFXKnrmFKzw4BuhAnBtVV
         yJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239208; x=1790844008;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKhJx1wEyO1XAHiYD4ulqqEa2XMnW8boyqSFRDJ87jg=;
        b=Ab4RuzYrkJ7PoanZI9dVZaaujo6OF2TpDMTQRyB0KSrPP+dBmeoaxJz1/dzKX0R8n1
         uu5WkT8aTsgpGOB0l6WzSM5xaTCgaLQ34BnaB7Xv8auCVXZB4S7CO+/Nsn9l4rTX3eS1
         era7FGbuEuxiNsYYSy7w8TssTBHLWtkDfO906cU5nXmKtaUTx1SCMghhoiUIcV6K2CwM
         gvmQmZ9lNfdPw5vlyEvGNxiFMGyvdAsWGhabYaIQoMinLNS9chLCMfQ64F5Zahx5c1V+
         JHYDOk0SGSm7m1V/vGggiio67OyVEaiMmPJxhN3O+qdpkuWfCWb7AecH2XH3wFQZIwqV
         Askw==
X-Forwarded-Encrypted: i=1; AKwUvByY3JIGJU4y5Bi+wztaOFhfE9w96Eoj5AcMr/I8YVLOUaGisGtVixRmy3vG5OdKOhR5VqswtfSZI0kEQqxbYXhu@lists.infradead.org
X-Gm-Message-State: AFuF++mf0xglVHdDRbBQ8+mqho3fJtf1vu+g8FkQubur7JWjm+vv5IVg
	UCuTiLy9aQS+k+YDpCN5Bwp3OdXTXY2DccEvxqxtv8y3gSDEnzAYqY05XLPJxRWcYLM=
X-Gm-Gg: AYBFou1xmctVmimvxHttij7hN5oJ6mcyDww0qUsw5xvbTbAL9yCOtR6WU2COFZG3wjR
	vMuLNXK8yKtjaVFDYgY00pVw0Duym/bXkSv+h1ZagfqTahDI5mwAJtrOwCyl3ElHe7nASplwxhL
	JIA/jA6n0FnjKArBTTpjv54b6Jp73r0J0U7Hadsyo8mkOhbhD7dI89ZZfxw4gC1JiNU+/XKrMU1
	PibQHzXuCx4TAZa5jVIjNkb7rPZvwLpKDa2610DiccgyCfiWskBjBtNN2YPXip+/KlrrXK8jUsw
	s66T6lB6f+NC7w4E3zbxmJTXY9I9NHP+L/UPRU5FIWDFU3ruO0BZpuX7QxCk1bd4hVyqyD00x1H
	ug8ARMztWh44JrgV6OlyieMHnp/SHSbgS6cxzDrl/71Crs4S2FQ53+m0Vn+6c7OdrHV6E9XkL+r
	kRF4Elrew60z0iF/hC3wROiIddAFZw1rwaqkQd2Mm61GM6fGU2ZGu8nFuYTPzvyB07yHKQR20Bb
	4nG7sWALKjJVJ6R1Q==
X-Received: by 2002:a05:600c:1c0d:b0:49f:ce73:7ac with SMTP id 5b1f17b1804b1-49fe67106d6mr32623215e9.35.1790239208416;
        Thu, 24 Sep 2026 01:40:08 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cca160sm47420325e9.12.2026.09.24.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:40:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andre Przywara
 <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 0/5] net: stmmac: Add support for Allwinner
 A733 GMAC210
In-Reply-To: <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
Date: Thu, 24 Sep 2026 10:40:07 +0200
Message-ID: <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_014010_616813_9643CF55 
X-CRM114-Status: GOOD (  12.02  )
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

On jeu. 24 sept. 2026 at 00:19, Andrew Lunn <andrew@lunn.ch> wrote:

>>  * Unstable EEE/LPI: If the device stays in LPI mode long enough, the
>>    link sometimes (but not always) goes down, coming back up when the
>>    device exits LPI mode. This is apparently due to the PHY; the vendor
>>    driver disables this feature. The solution is to use genphy with the
>>    eee-broken-* DT properties or wait for the upcoming mainline driver:
>>    https://lore.kernel.org/all/MN0PR19MB609154F210DF84DCB29D3696ACC62@MN0PR19MB6091.namprd19.prod.outlook.com
>
> Looking at this code, it totally ignores the interface mode. So you
> have no idea what RGMII delays it is adding. When this driver gets
> fixed before being merged, your DT fragment will likely break.

Thanks for pointing this out Andrew.

I've changed the phy-mode to plain rgmii which seems more in line with
what the PHY actually does.

>
>        Andrew

-- 
Jerome

