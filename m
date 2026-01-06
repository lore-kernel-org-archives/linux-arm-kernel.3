Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0B0C47BC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwFNEOi92EKNgQwkvVK3dDTbWUcm/1bDSpbc2qb1f6E=; b=J7ZsPuWMAp7z+Oymp0vgi/RNlY
	1do8V4Ru53dhNpN1P8iHuEN7uQ3EJKgk3oA8sMThaX4YGNdWTf73NA6rtuRXl/dQd20UXfOR2Ie0r
	tNXVB0iWc1rCEka4XswuZZYa+9sXkx9izOh5xD+zO3e6C0SU7vxGlOIjMZvH/yDMvZmmbQjs+xzHg
	mNWR/bx52jDHepcK/zglhWMq9EmLc7QQcfVYgsUdK7grbOci4NwCr3Y+AGwCf4JkwZLYVzeeInh7m
	POCSuGTG1wNb+/RRZFWbDrAsj5oT/3GE9hPehEw+rwlwHyHYonu7U50X4iJPXKKvPvKoatNUmMBro
	ovXt4YhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2vU-0000000Cexu-48tq;
	Tue, 06 Jan 2026 09:00:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2vS-0000000Cewd-2R5v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:00:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-29efd139227so10120125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767690026; x=1768294826; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwFNEOi92EKNgQwkvVK3dDTbWUcm/1bDSpbc2qb1f6E=;
        b=A+2l8YWirpiiWu+oAsf+mo7gWIiNoySbo1d7egGN0AU6fkqS6MxuUsFGFSZg6D4CZZ
         rhmBsEZ8NvXuQj3I5jyOTUfWBaxqqc+bl5UIpJi5feE6iWGPrC2sBwB/yv6EeKbX2hRg
         +FoMnUOT25N1uXJy1Mj2QWB4TKVj1dqAf2s3hluMcQojOIMyBJt4P3nbiri+FLdjCe1G
         /tFLlvdf/z9XU92cDdM5n6Y2DheU2wsbRbsQclyMYv7QJzzNgqud+eAD+mBWxLwhdAG1
         425ID6luYH+nMWOo6WVWsyaMPGar96MFSZ0JbmonclynO3iXetGlYTWF4oWuwxvy2wfa
         htmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690026; x=1768294826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nwFNEOi92EKNgQwkvVK3dDTbWUcm/1bDSpbc2qb1f6E=;
        b=jYa2uvbOIwvz7qsbP/jc2wbhgji8AIA261H6gHh9LGRdxQqUpR5qtov9+z3Is88xcU
         Q15jFclbOQf3tg5W0cGX9sy/9OIQx6vf5WXKdjM9segfgBhO/TLDaezZLVWG/GC+DZP7
         Uf/qEIVcGCgKdFVgeTgK64TgOKVJxpKNI+DaCIZWKAVv9bwZxr5vOSdjki1yjp1AFb65
         KtPL8IszMkCsst0m6TxdJRXzspesNpXHCi1b7kRgOc+dPqxT2YghLkyhhEgJjaEFLqHX
         hsrCB+ea6S53J4eSKIRPfJA2a1Y2BYlyDERnDrwKZ4qK/XeqJP2TpeYOXOjffo8xX0Vk
         cHBA==
X-Forwarded-Encrypted: i=1; AJvYcCV8zwhrlcwhyX6mlshVV9firoSD3J9y8wARCNhu7ro4L6FxcdOAJ5oudd71O08ldB6ZTHVyozcuml1fsvSlqxgU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+mKOxc7lIx4hFVjz0Qri57pw+WsSWEd/GVdKyNi1yAUvt0CO1
	NcqzGyJEgoj7A4zuogfegQasXPFgMr4G8aVeA9llQtWqNV+Lqeyzs0Pk87DfIKYalA1VHvZ1nc8
	uLFi6v66o5L0v0qmI6iJ8PHt/dDwxBqo=
X-Gm-Gg: AY/fxX4tyBrVyihyqmB03kWDh7QkudH1MyABIiEyONOddYvqC4yIoe6VGMaaEcjeU8g
	mJu9ESiKOI/azbB8QjK4A/9ePj1Dm6u85TYMXiYyLwJ2EHkV2FtJwBhm41+Uwfn/C1+jN2VnUCm
	em8w3AP+2tx7MpTE0sjJ8rHZBpg1ial9B7oYlIT2CSunfpnah33b6dzf9t5+0xZ8eaicsYSc7Mw
	AopuOuBeRz5Na1bsDYILRUO828X1Q8u7NpTcuEtb2iN8HYMAi1pLpbFEO11u4aZ/ByXSRL0IQrQ
	QGLoY+OJi4H/StdDVg2Qlh4Pw7Q=
X-Google-Smtp-Source: AGHT+IFykSIhDbKg0V1WBCg3OR8KUafZJ8yy1m4E2Hl9KGFyDUM1qo6fuvxU3JjJJxoh2Jqu0ofEIeBaRu9XHRBaHZE=
X-Received: by 2002:a17:902:d491:b0:29f:b3e5:5186 with SMTP id
 d9443c01a7336-2a3e2d569b1mr20878775ad.56.1767690025591; Tue, 06 Jan 2026
 01:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 10:00:14 +0100
X-Gm-Features: AQt7F2qGoX6X_u9x7RpkJNN1v9xaEp0mgqiOs4Qpk3zn2K1E2c6w9PHm9V8_KnY
Message-ID: <CAFBinCBCxkt1F5NUaAWjWnudLvTnmEMw0sdJps3kN=ibCEicSw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: extend build coverage with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_010026_611007_5F5687FD 
X-CRM114-Status: UNSURE (   9.32  )
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

On Tue, Jan 6, 2026 at 9:55=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> We currently only build these drivers on ARM but there's nothing that
> should stop us from building it with allmodconfig on other
> architectures. Extend the build coverage for all meson drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

