Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADD9CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1/2ukhzETswBvigFCZUS4xPD90/kXRG6GUxtAy8yc0=; b=27OIPZovW3MO0yPiTkTyPLiQ78
	kjhAihjNN/yUWBMo7W+S+Dtx6+sOZf4xUlqBfCafz0iOx7P7IvSQFTCkgKQ7pHzpjMsCl5YA/L6Ga
	byt6wbQ1KLQ/vzklMfLRb7QuH8R2nZmwINltnL3UEMWvdKGbeYMRDI98i8nr7SD4PDBoE0R4ZkddI
	6ps8/pesYtPhYs0NeLOptkM2pvCNMasLb+/lOwJepOSf0Z+e7O1BnSX3tXtSBndCFJbVYIF8BgOjp
	vMvWtNYY8865NyK/WGIdYUdR6Tw1L42imTran3G1G+gwKKi2gryiYQbYq6J7F9tb82ftkMQgF8qcn
	jCkinymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7jH-0000000DLM2-2Q1p;
	Mon, 01 Sep 2025 16:50:03 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4Jt-0000000CdxD-3pxf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 13:11:39 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f646b1db8so3962746e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 06:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756732296; x=1757337096; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1/2ukhzETswBvigFCZUS4xPD90/kXRG6GUxtAy8yc0=;
        b=r4XBGHOgJeDaCvYImkqYiGEYYuoo3EYGxTjOTulzsYJ1gFKFYg/21NnJo8qPX85i0Y
         rIxODV/fY84V0broVQO+TvUjkJAUXdpMSeKAtR6UeeRApDhz+D8m3IoRLITt8y5HFh+U
         NGNUqpra0rDIWPbFJjHTp9eMh459Ofnpx+cN8K+JsExvGXhxaJp174W/Lo7grFxOe6C3
         ppv8NJtSyRuTCHUkBEHbgHZV21b7h399ccISkV1j/ejWgWxtJZ2y7uiPWMip+nYznP3i
         vxkVp6lhFqggu9TxEZ3GPPrzgrk037yKC3UBGYaKHuH6qTZKEsyt9y6q5Bet0TYxiKSW
         /7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756732296; x=1757337096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1/2ukhzETswBvigFCZUS4xPD90/kXRG6GUxtAy8yc0=;
        b=cAema92A2aNPeAVYhMWV8ZFIb9YsP/eavCbxFIZ0gZictvpuwcfcLYIeY/ObToPiL3
         mtiNZ1CfWTaDzXxQytlxSSskreCSYtVWKlbafTdX/OrzNEPe/yl5x4cBwVMkUBwHpXpl
         1ksJBuhWjEnYJ1iLOfJla67R2r32zBVtlD7lKAsKHAiyaTDItk3T3q7fim8VdsaoOThz
         S/u/xnjpbX9CWtLXqyO7u4Tos02X6vxD+ZOu/+6oSE6/DW7soLvc+9dapugMA2EhBYZE
         v4sHa7PlqS/0z1EZuDlgdNl44preFchCQUYcRtXZIQdG43B15MnKWooUH5giYQc0YIqo
         yJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCU1FYHGYYXbNYKy9+0dVmye9o0v8x/RosfTVeKHb+G6H8eZ4oB2R5WUprAvilQ8GV4ZjsguZq53bkxscqs4PGWG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/8POwvP0WSLuBe+C4rrURtYSZsBzfnPRnKeZHA+NlOFfp+548
	IgO6UtiBBrvvn/acnw7prJ3HBmxvErM4qmBBIiIciVUmiXAvnEARh5qJWJ5kJwXI3S9gxxXOlYq
	1xsuL9LHS3kEvH3UW1ullNDeFkQJ1gWAd0t/6i0j78g==
X-Gm-Gg: ASbGnctLHKb5DKjkjvPHww5Xnq+Fj0kFNDQwRS6KMFdwBfVtmpjmGxKoNIAXwL37q8h
	yjkDFgo26hbxSGM4oKIUH3Ed0AMtYLG5//V9zy6KFrpFb/vkHoGcTqZ/xdue495w3ndhc5nz3zb
	EB+iS1dL9LhUKcnlUQ+0fmUU6CCHbD9tXS2fcahz0CcfQ9K9Uo5A8bZjT0t+4YU0cF8PeivAvNK
	vyCPxk=
X-Google-Smtp-Source: AGHT+IFdtZUV12X2qQohTcmgXoI8sX/n2MdDB3IP/SMHaxKOnh4rNFzghcV2U9qSUnmpWORF0iKHeIacxU0C0GZ7Nxw=
X-Received: by 2002:a05:6512:2353:b0:55f:6a6a:4955 with SMTP id
 2adb3069b0e04-55f708bff41mr1832610e87.25.1756732296026; Mon, 01 Sep 2025
 06:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250831084958.431913-1-rongqianfeng@vivo.com> <20250831084958.431913-2-rongqianfeng@vivo.com>
In-Reply-To: <20250831084958.431913-2-rongqianfeng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 15:11:25 +0200
X-Gm-Features: Ac12FXzMx74oEGw0sys3dqlvnEr6aJBPDjUSlodZm8Lf6MbYZWveT4WA0nkRQcE
Message-ID: <CACRpkdY14ZuAp+mg==M62draaaf897Ry-Nkh93UR132iUqnLvw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: armada-37xx: Use int type to store negative
 error codes
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_061137_956836_C7D1CCD4 
X-CRM114-Status: GOOD (  12.23  )
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

On Sun, Aug 31, 2025 at 10:50=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.c=
om> wrote:

> In armada_37xx_gpio_direction_output(), the 'ret' variable might store
> the negative error codes returned by regmap_update_bits(), and in
> armada_37xx_edge_both_irq_swap_pol(), the 'ret' variable directly
> stores -1, so the type of the 'ret' variable needs to be changed to
> int in both cases.
>
> No effect on runtime.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

This patch (1/3) applied for next in the pinctrl tree.

Yours,
Linus Walleij

