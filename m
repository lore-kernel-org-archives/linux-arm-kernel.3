Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5BE606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FlDfllrV;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=TFwjd5+S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gj1ttizdUersx8xsUhnFSQQTCr6CuiJthd1Zca2e+6c=; b=FlDfllrVMqNMqopCDnhuv2yv3M
	YVABh7tO4AXubPk9qB/g1Pq0Ge8EskgyGSxEQK5o51iEyLa6QTJLGhIdd0/Gh0oQQSNU0yQfE5nSl
	SF3g+fNmXMOVAkh4h/zmZY2B6NAJKCYEf8voVQ5ZeFfXj0BOQdaooKk/qfsPGBNZ+DF7g+8jKPOVC
	/ak5G08nmTQO/6jDc9ioi7htg0doIk4nt7rnWeXv7zdaRE+4cBKK5rJC92y41fPeNzT14aoOIQGIw
	qH4AkymF/6umSzVBzCX9FCjr69esQjmADSFDrZ10adeip2hHBta6JXabRm8gKgHGN1xICj7romsiu
	UoqqguxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl2R-0000000BaMJ-1Jyo;
	Fri, 30 Oct 2026 11:44:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl2O-0000000BaL1-3z2S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:44:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e9e53d011eso5405745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360687; cv=none;
        d=google.com; s=arc-20260327;
        b=B15cJgk9Ub95uxmE+zNreF29Vl5k5f83CYh8hJSAT+r50q2BnQwZ1dE35nWPnD6a6w
         Sif15hyo42VVLaM8KLz/SNUjqHu42s4IF1wzawleWAAOAssxomjfxTym0ygZVL6sb+rV
         WEfum+SKfP4MUfVlHhKCuwlkJG/7qDd81H5WKBM8YG817it8FExlncfVP02ZkdFFOEZr
         rOUbTQVAQHgTlHrYidDfOJvf7BKHlIoa5Pdlj4vJy9pVyJWE2cT1ctBc8x58YgLUBPtG
         ubMlHHS/7PYlx4ie63IOCNnJaU5hVWc8qkldmHuTnjpEBvHRjAPNEd2YE6jmOfbyG+pX
         UF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gj1ttizdUersx8xsUhnFSQQTCr6CuiJthd1Zca2e+6c=;
        fh=Wj2MDRtVG/f8ltxIHB2lukcWgJg3/QKuVazQSe+y6tw=;
        b=VpTVeDG62PVRNMnx0xAc4acnHAwxWXa31AtSFgxpd4x/U+WZOcXnP/8v+e4d/SIAjl
         hGjgAZSKYB8bonE4R/9ItJQKV9l+rlDcQGlqDKbe/GtpLfXdYvu4zutI86EBb+uW7IOy
         wbISiMc02NphgHcMdoYC9m+WjEkB0BtYqmacrHGH3wPFIZy1pTbYIZ2yPIaO772EYvEc
         k0//gmQVVwg/OTV61hYBl0Zb4AoW+wUgAnzQGeKk8ggwHhZM8oi9NmufqnuxwQbSGMKK
         uvqcTXqLFtCCoiI8+wbuWXSnQjATr2XcmG6Aq1IsHCKicMuS5ZSKqUAYZaiymYDN/zOJ
         eHaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360687; x=1793965487; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gj1ttizdUersx8xsUhnFSQQTCr6CuiJthd1Zca2e+6c=;
        b=TFwjd5+S2Nrdds3Qjf/7qQNDVhzuNcZaV4kFUONKJODfrwbt1gIDaRBF3DXBnMnNoL
         Z+ksxkw8Y8mv/SyHiZ4PTsgqJMA6JgvcWjHqSahXNb7QC/uIPnkNDkaAf/+M5d+8wL7H
         KnyPEEr5h3tXqRGOMx5FOIXxnX46/4pZfWXVjqOPl6s9lkzSkPwXe1QAImbkqxjFahSq
         6u/YFsrFTygVngczhC6O01Y3EqeIPZY8vabfvg80cRxjEhiHhcgZ1v7ztGhMXitvMcwk
         OtmdVyPstsGowGgMK4H85OnlYOhOZGCfESmN1lfRBWZNrIP5juCOkmkzJMZnBim9uHTO
         YkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360687; x=1793965487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gj1ttizdUersx8xsUhnFSQQTCr6CuiJthd1Zca2e+6c=;
        b=AK7kdhbaQZP1s62WG2EYMvtXZQS8FmJjOH3IBq6I38gxcKI3pnYe8b1sHFL68ZiEPI
         zDj2fiJCtfqaK5Zix+iWQWk7W8+jK02WKb/QTIamsEi0OapH2PZXOaM8psfuZOiwxmKf
         aBxESZ/WjoSxNQquQBqzhUpUIA3pLnoozwYpZE/9B4lNp7PpmOB3sKV8NM9FQf3PCum7
         oVZY5U0NDo+6ixNrIRP/WTikBkdt10wt8T6pXgqb+l4L7oDUW7Scfu1arr925YkBy/xs
         hEe3YaoyMSUwzbiz2mwm5V//kGgBB10n1psxWevSLOre3S9sP5iDkvIEnAHh+Mb09CXa
         6jww==
X-Forwarded-Encrypted: i=1; AKwUvByryQXiMA8IQ3oEfNyzREleeIniEqPZQtfsfrEyCnH6Ovl4GJfw5bPifL1a5+vda4WyXRFac5X3joCk2TrX6iXD@lists.infradead.org
X-Gm-Message-State: AFq9FYKs5/y3+RARk4UwFqxeqr7h4VzZcKEhzmHO7IicbvBv2YtPfaQg
	rY1vGkP3DwRu2pF/8i585N/+q2oruD56g3vheMpHYikRupiSEq9pXkuYoUWlkZtjVegg7gSThxb
	anF95XIyoTIg86oCjGGtsE91EuBG2gGSSEcF76bo2Cg==
X-Gm-Gg: AYBFou00mmru+EdCRnZF+PGphpSLhFR/B/F22tFm0ovJhwyxtsvCEZZDYcGtEqIoyh9
	q/MGKZdZkuaQmwnAUPPy+Sm9DGmtBXuflBQd2BRdmfLW2a7I0fRKuVp8aitDG3ebUEEpocm14uV
	PsGLUxwzohK3DYVFfXl9ngxn+qoUjeRPT8UOXQXYdwGsCXICEx9ClJ/sDG1hPK40Kzw/6G83xeQ
	fkgSDV42IkqhipfeQFlxVqE1ZfCyeNa4JJHNF+kvGHM+N+6KCb5K4Nwqy624Ui98PrPaBOvKtgV
	F+G4b+jdbAX5N9Y0rLoZgT9DtQsOB7c1YDfdHwhfHOPZti+V2ECIjjSPMlvz492gadqO2IiYyDF
	usxOCrQ1dHZoZNd6p2Jmb8t7V7eUxPwvERv1Z
X-Received: by 2002:a17:903:37ce:b0:2e9:6333:fbb7 with SMTP id
 d9443c01a7336-2eb364f49fcmr22277985ad.51.1793360687631; Fri, 30 Oct 2026
 04:44:47 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-9-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-9-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:44:36 +0000
X-Gm-Features: AclHuK-Q06xdaUmiDGoTsq9LRujvtZmp-FKJhNsOOxfBrNNarZ1Qbmr7JOv-ovk
Message-ID: <CAPj87rPEz=Y+dZayouddZRn2ZHSVNk9BAjBqz34PJyjDRba5=Q@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_044449_017288_56C50E3D 
X-CRM114-Status: UNSURE (   7.84  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> +                       if (!vp->dclk_src)
> +                               vp->dclk_src = clk_get_parent(vp->dclk);

Why not do this at init, where we setup the rest of our clock tree?

The rest is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

