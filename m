Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2430F483CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nm5v7JcVlDEukV8P80SZM5X9wYhOXPQwO9PL60/LKYs=; b=AMesSU9F+DwboD
	QtTJpcLrSsLErF8Jd9WC8TK53CmEUtIz4jwtOo6Dde9PcHY1ZSlKSJrGFnISRRFnnPUfaxXki8uSX
	ESHfk/ro5B/e4pu27J5IJsyz1z3Fz2gnntLl6ZyiG9uhK2ctq9C/VUQZCKNZ6O67wmoh+JPn3qDPK
	7elH0BTQEdg3NMO8chKNx7wdWiLuqBQjtWDPgNoh7dwx9Zmv3Fo90bygsoXkFjuSQ/P46Js+4BQJH
	RvPFDIU+2QaUdSzIKByOVOKfZsko+dxzrKBznzGpogj4WL4j4rMcWRx19Acb4XUDrhRbwdqzuSK13
	wsMNcRG2GT81AuDZdPuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iiP-0000000HC02-3yB0;
	Mon, 23 Mar 2026 17:05:21 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iiM-0000000HBzF-2o7H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:05:20 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a13a06fc85so3234063e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285513; x=1774890313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm5v7JcVlDEukV8P80SZM5X9wYhOXPQwO9PL60/LKYs=;
        b=kvfrTNPFI7Mh//5ecfvsWCblIflfp6A6QcUuaFTovDjbGn+MZ87ZOm8k3gqhp9ouOZ
         6uQAwFHViz4oyGjl3erGfZmzPjaHmHfnwO4TBTDtM9+XXcPfFG5BzKcnOachgS2HD1G0
         gd+EqYz5Wj0CXugnCptG0vYS1hYJXgd2c+B3qomICUmQarRuqteuCTCt93RZCrquIoD0
         1DZIzatR55cKundqAbEx7/uEm1styx3Gd9wdyFT+i5ZvrGO+j7p9s+CSaccAMVL4HA3h
         6FR+6HhQZV26jNCvXxK6wSF295JDh3RWWWlLjRfDGh3qjwoEmVet/2PQbZApSuhKRAgK
         J47A==
X-Forwarded-Encrypted: i=1; AJvYcCViTJG4LAo0rDYLG1/8VBshVyIIYFRmaM0nUI6FXD7TVt6dkP9HsZwktgpvpnJbkHzS1dso+f+7fA8+aOsFw+eN@lists.infradead.org
X-Gm-Message-State: AOJu0YwlIoiOAtiM4eYOsdkI8z0kXlG2Sr97X8mlynwW8zYa2sSqq3rw
	bAwjFtpAE8diFR/NQ5+QpNVE7E6tzNWAq7Qu4XZAkIKuUDTAlbLaX2QD3qtNvOOr
X-Gm-Gg: ATEYQzw6xkZwhSq1Y3g0jix64y8w9K8fr48NGSNE2+k12Z43pami/WIbZmvl9pg8i2p
	zMGm277iLnTuIJnZOUSEEr/5OC3oekwzvrFs8aX1znsgJEyE4LJsGHB5LSRBCA5OLkidEqKfvIp
	YuMvdhrEjhlH20EzfBNjqCA34w0pxR6ziir7wnrxRqS5hMbhZ7LQOO7IVrVTpDk+ssyfYNB/wYB
	s3Avj/eozCHHDlllN6D9+573eMQBLTue3Wb3YCI76jqKCf49kaJHbFALNcq5A/guKlJlapXw3q7
	jjdTQiJc31wWVutwQeROa7b5AoLTu5nxmJ3F2ZGIWULGw4Npn0s+9vyE4gDN2bHsJu4870Sam1y
	Jtja0J+N8CW2G3QnDeQ4Tgjn7Ylvo3aIyrTDkcBPeyP4OsuBC3OV6iJPDLIVMxgt205lR9Cb3Fg
	C30fg7R3lzsClkAPi5V1qSxeFOgT3hSS3ue2YkL1gQvzkDy4TfK9bBtH4=
X-Received: by 2002:a05:6512:2246:b0:5a1:184a:9ed6 with SMTP id 2adb3069b0e04-5a285af9620mr3845626e87.4.1774285512479;
        Mon, 23 Mar 2026 10:05:12 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a288268a0bsm2393279e87.14.2026.03.23.10.05.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:05:11 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38ad4677830so28551821fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:05:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWv5tTALZY/sPkRxQ8gpq7vukF8q0T9HFXnEbbwiUAa++ccIJnZKuf5N3fRke91CLi+4/YW8MBS7PnvaNaIMlGT@lists.infradead.org
X-Received: by 2002:a05:651c:25c1:20b0:38a:6acb:eab3 with SMTP id
 38308e7fff4ca-38bf96f3a52mr28930191fa.35.1774285510390; Mon, 23 Mar 2026
 10:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-2-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-2-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:04:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v6564QBo1CHDo4jkdz1PXKHLXAiS_Q5-1QGrh6fEt909ig@mail.gmail.com>
X-Gm-Features: AQROBzDR4iqzNYZJkcCgL6IuYb3DzuKFkSg6JxARTu410NRvFve59a3elCP1SSw
Message-ID: <CAGb2v6564QBo1CHDo4jkdz1PXKHLXAiS_Q5-1QGrh6fEt909ig@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Rework IRQ remuxing to avoid fixed
 mux value
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_100518_743357_AB199B80 
X-CRM114-Status: GOOD (  14.15  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Some Allwinner SoCs cannot read the state of a GPIO line when the pin is
> muxed to the IRQ function. To access that state anyway, we temporarily
> mux that pin back to GPIO input, then return it to the IRQ mux
> afterwards. This code assumes that the IRQ mux value is 0x6, even though
> newer SoCs (D1/T113/A523/...) encode the IRQ mux with 0xe.
>
> Avoid hardcoding the different IRQ mux values by saving the programmed
> value before switching to GPIO input, then restoring the saved value
> afterwards. This makes the code robust against future changes of the IRQ
> mux value. This also avoids calling the sunxi_pmx_set() function twice,
> each of which does a read/modify/write operation, fenced in by the pctl
> lock. The new code takes the lock around the whole operation, which is
> also safer since it avoids (probably theoretical) races against other
> code touching the mux register meanwhile.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

