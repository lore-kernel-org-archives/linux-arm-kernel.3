Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E69C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 06:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=komZ01FtP3txsJGXgsSmR1HKfwi3kLT906a58S6194k=; b=G3xQD7jhjzw5izowHlV6bODg27
	mfmgqML58sc5ZclseHts6boTHx3TyMACuqj3G/J1Du7CHPjfXNEUhoxDtk0xxzjDV7oNsk4CHlhAb
	VmFc59IqkVah5gPkJYA1u8NC8X6am6ss5luHXLBgp+CXj+piru6COLxxuOX8oKHsLTwW/g47uDNnH
	GY1inIkx+0ElUtCnLgglIQsWDxsS5Z+nGjBB/WRN9NwfFJigK/NNVLkmC+qfMUGbDZKgUByAMObgq
	t7eMG9E/d/Ha0f+gOuRmE0Cc57Dg1tUnGsi/AdNVGnYqvYPTxGXNZ9vCX/0Y2u/vroJRcWJpOOgof
	OiJsRVnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMeq-0000000CCxb-021V;
	Sat, 27 Jun 2026 06:36:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMen-0000000CCwz-1zGV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 06:36:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-46e30429b10so962408f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 23:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782542207; x=1783147007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=komZ01FtP3txsJGXgsSmR1HKfwi3kLT906a58S6194k=;
        b=luTii29f2McrHCmppotgPpaPYU9hOZscHZSzJUX8tsiEdVtLLxxTdiI7N/x4SEAZVQ
         yp1xSB2I4cnkBnck3f01W0N6H/+6xKvR6XOtUbCsb+H7jANbXNLcms02zQsm11+RBzXT
         CKbksbw3PlN5zCHNf7/8JIrYvhhNv7n4w6CcNjxMe7wksutnhQAv7KRuqFZlRdFN10Nl
         DrdsR5gLWPIDMw7bQ1NLHsVvJYzHM6u14CM0N6rOeihKlp8ZS560CTyVyLpjyn+nl091
         WeNO5D1+Vhu4RgAKkl5h8pBcRMZ5bNCOvSY6yg1x0NR0n/Sb5fA7nyrtcpTB51RroOLO
         zoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542207; x=1783147007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=komZ01FtP3txsJGXgsSmR1HKfwi3kLT906a58S6194k=;
        b=BGOd9QuUAzCqNJTxyUmXe8pgi3ONPU6HMerKtpXsjKbtEb6AnubRa11phADiadf9kg
         xd9ok0kp3+uVEiwfwlSplEy742UVzGandPUINEqHLwl+nGEvh7FzpnRXFr77zGXxN9QM
         M6vyrCv3CYTF0kezasZ8+D+/QroS/f9anPwDNBsGVCsBrdsyDKl9Z0GH8PK4Vg3gJaWA
         Lny9sd1oJfN0QvniCJP13a+lvfS5XxQnPsrujyWTTw/jBcj8/J2GeSez5XlJyZbKfqsj
         Zcx6Hdb04yW9OehNc1tjDtqUy5KfRbzSz1zYKH2o1BqCCm6cGuOPv1dfaGxAODCn2eje
         wJag==
X-Gm-Message-State: AOJu0YxPetr1QX1YC4AdkcShwNg8KidLlOLN1Oj0HhvTBB7bSirkS+MI
	sSYJ1IjD3whPTWtMfhlghtECnwmb0YQK+WTHlTQ5casbhBkKoAPPFOZ7
X-Gm-Gg: AfdE7cmD2k+PvlhMSMArvGuP1ZIxku5EXX8qEZtTpIQ57yRg6lgSXtpyKZIacnL0ZvJ
	+E7NL+hIg5Xt+irQzOU/4KuIPD2W2SuTnCh0k94OEibAjw8EV5xYGPT+Av7N5roruESuOx0e+rQ
	uYorgstr03/iwsQoRirDUztsF1NSjWsTHmqMESYLdPfg0kDP2Oyz8AKccLpxdaTNRJenSeSbgt4
	FGQkJ0Jnh9uPPc5wyzviffYlEclsN6UHypcZ7Q3DblVmktMXm0TX/AICxP47Am55zsgu1Q/EdF3
	4LbeAROmtAe/46BS10QJ604DnCbfWhOL85z9l6vuHDWIzn0yWABppJ9FN3O4V+LElf0uS6q4lRK
	80WWl9ocdpxUWzz6rEfd0RvKgL8CzEqbGn21KvFYxen5n3AhohExGEvgWPZsd4OYDVLSSWapzF3
	iEq7vDIxu5J0LWV2SZ21ukgGCjIkoS7yfZ0oJVh67yW2wurMFgQF8QMWzMBf3cGVpf7NisCYWU8
	fb4
X-Received: by 2002:a05:6000:71e:b0:46d:71b0:e754 with SMTP id ffacd0b85a97d-46dc30ddc52mr14625249f8f.41.1782542206978;
        Fri, 26 Jun 2026 23:36:46 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46fe25429d5sm6986765f8f.7.2026.06.26.23.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:36:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] drm/sun4i: mixer: Check clock enable failures
Date: Sat, 27 Jun 2026 08:36:44 +0200
Message-ID: <H-eSPH2FSEq_Vc39E72MsA@gmail.com>
In-Reply-To: <20260624055123.26769-1-pengpeng@iscas.ac.cn>
References: <20260624055123.26769-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_233649_540510_033FD5CF 
X-CRM114-Status: UNSURE (   6.26  )
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

Dne sreda, 24. junij 2026 ob 07:51:23 Srednjeevropski poletni =C4=8Das je P=
engpeng Hou napisal(a):
> sun8i_mixer_bind() acquires the required bus and module clocks, but
> ignores clk_prepare_enable() failures before adding the mixer engine to
> the DRM pipeline.
>=20
> Check both clock enable operations and use the existing unwind labels
> when a required clock cannot be enabled.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



