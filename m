Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3437606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E/az5YDD;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KuRwqttm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E6pq6ak40PnPg7rzCuFYJAL64PxLZCXIE6ht0rHomGY=; b=E/az5YDDU9qECw
	whoV5hlOpGj9yirsNx5msRV4VKI78Cpj+ltJM0cf/gUXPp0NhtiG1oYWn7SWNEgL2cbORYZ3arKA2
	tGF/qrbFcQIIzU3J5DG7YFGuXZfZOy1OK6PI6v2gBgy+2YkfaIv4w2gNqp8LCSSjIDkWkiWf3jlQn
	4nXekv67hQiH/Sln4BuloVJf5baGl9IOhian6/EWeoA5tsf2w562JY0mPjKnfT904CkM2tugEqW7K
	o4y4G71iV59Vmn3do4xu0GY4IcCwkHKv2qV/f7pnAvJlTbvQFJvwiA4CFUfHR/Ze+KByDlHCtvS6K
	9Nv42zWS7M1ARwB1XEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9rx-00000001XDq-2IC7;
	Tue, 03 Nov 2026 08:27:49 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9rr-00000001XCh-1URb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:27:46 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2183013f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793694460; x=1794299260; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E6pq6ak40PnPg7rzCuFYJAL64PxLZCXIE6ht0rHomGY=;
        b=KuRwqttmGsJEEbBO9Bb1YIzNmxwWZ9r6dbv79DJ5TRx/uWCgOMRhX50g5/hdY2TSid
         14yx3yYGpQ8Ut/DuM966N3UrCro0C6OgdoNReIlGML9fIl3WfP2yxFGWrbE5uQGLlnAU
         m1O6tyYkIjqvNoJlnGh1RBbLbB9Jgoe/iLBMjM2Fy8NcOGOYDUR4QtrsB01DVz4iuSLG
         gyQCCQxHsGn68n9dFTmH5+PHhQ+QuSZStVg+GwBILXryo/2ZzPCM6F0DpGZIGFSHiL2g
         vRwn/V22J2HBwHwYT2QITBBETeotZPCgCUCAAHgP//EqjJdlQh4AJAhqCKOlnhhut6fp
         HZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694460; x=1794299260;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6pq6ak40PnPg7rzCuFYJAL64PxLZCXIE6ht0rHomGY=;
        b=z/4xz1sQFB5GzubsA4fMRpe47GvV00Xa0jz3G5kZqWFkRjGk7aT/9vRHENvJ2JTBAl
         J+xsryZyETMPylLZGscygzJRoHrsY+dI0OiLm4Fktvt/kNZnw2G/jADksyiETlujq588
         QebjzNhoXgeldG75QnRq32jLSbKBbmbtny4hgx/do+GDMeG25DEsVm7XF64+/U41DS/b
         +aUn3Y+0yzEUAbVvbb9zBUHsANGWMBKBRE6kOKj/DQI1D5sfWMHTkWE1yVMDko6SgRLb
         DR322dRCCQHqvdwk4N6fBznTNBB5Pi7EoyaFbhJaCJmAFGKtqoGS7Xypl1ptB3Yo5wdW
         UYWA==
X-Forwarded-Encrypted: i=1; AKwUvByU6JJkYrCDpRfFP5N8/K+mE8wFBu2aeTdRLQngSlq347AHQZH0DSV5CMM33qyMnhhVrZJVCL6HrbSrmTcX/sUq@lists.infradead.org
X-Gm-Message-State: APuU4Z8/Q9wGLvbQdYexlfbIlJcgN4Xze5zeyvJXFgHlfTH6hfdqwkln
	e8GGRAIelr3v+udnmZe15RK0ZFurGfDj6P/ZX6pnZga11nve5Owku+55db3FPgY4kdc=
X-Gm-Gg: AYBFou2zV1hBeaIVNWZgprtS7bWk0mCha0fFoUKqB5rnst9cUJlF5HZlPaTKlp0SXar
	nEAyEF+Mi/5dg4S1yNgdIxdwXNkck97jyjH8+N++VduT1gGDIpmmlZiPMC3z0Q1doQUBnBZH/wk
	+qWMNLPwqVpRS7cApiEc5FovpSsSeTXbOWPPnDRhS1JWnegeZwddhg0rvtFDVwgDO+FyJhWayq5
	j2XWLx2hu8TjlvI4ZEzD3yEP2Ht8ENl4803qg6ZivFaWKWbCjb927JZbyDGjCNCCJv78cQ6jLAc
	DVWi3JnhO1zIGol1hYQVb1GaI9ZeNLSqxETE60G5f7s2dhbSBuCjb5BRAyE48bpy6V0QYQrKZNE
	ondn3durT4y6BjpPjPPJHt5DDQmC5ciwmVvojg2G3u8A7nXmdXYz3yKMyCAUMv0BUbFZNdY4t5r
	CoTRIqrLVbstDcR93W0qK3mE2qD6B2CoVt9tZnx3NW+dqkAaUFg8+edu5n0Lnts9+TYMtiil9/l
	pyiWpCDlfmfo0s+83/XdtDeZmZs8G+CAK14rWyaqnBdT5BFIUHK4tIUitiWdAePdV3KYahYAhGz
	B+ipu12j7JWvmDYG65pFl+vRr2I=
X-Received: by 2002:a5d:6f0b:0:b0:48d:ed30:f863 with SMTP id ffacd0b85a97d-48e6e304aaemr28242503f8f.30.1793694459888;
        Tue, 03 Nov 2026 00:27:39 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm7666552f8f.54.2026.11.03.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:27:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: meson: axg-fifo: request the irq with the clock
 enabled
From: Valerio Setti <vsetti@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
References: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
Date: Tue, 03 Nov 2026 09:27:33 +0100
Message-Id: <179369445362.97387.1853118570427796429.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=384; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=w36hV1IUYMxpRRFJ0VIcI3DKJb88rpzFhmqT04FnZko=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFkvZ303F1f/kVIiF3xAbXN2+m1Do7+9s9VvKp1ZdKF+1
 e4U/gusHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIhDaG/wGCL4X0gr64XVnW
 4nnGLO0fd4zAeeE/ikezsz4f/fVOVIfhv5uquuzhF+1N62ce/CKqYaxpXFAh8qIu6No+Nr+z96+
 HcQIA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_002743_405481_B9C1E303 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The fifo irq handler accesses registers which need pclk, but the irq is
> requested before pclk is enabled on open and freed after it is disabled
> on close.
> 
> Request the irq after enabling pclk and masking the fifo irqs.
> Free it before disabling pclk.

Looks good to me.

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>

