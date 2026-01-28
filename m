Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC7BD46BE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUaTn5YCYH1aGyPr+judBHKrOAYlextt2AGAL94fdA4=; b=DYc5beJII6Rz169A65Cyq5tykt
	8ivA+o2SUjK1nfuTmZy9/5bagCUkihLhS4rbUdMr5jzRkvvpKx9rD+wK3+GFtUfKwcIzyJnJDI8Qu
	bmv0Jw2jTzvHHKhBCYFmeUvypjwZvxZ3COl2FJ+FIWb3itezwemtIkEPurXXLvtYHkNkmxAngmFA9
	hk7OTvXAw6lgEfG6GaEvn/g1IKhlLf9ZvGYCjDySQe7WtwTZ0+tajnpjMB3LkmTOCBKJYRb9ap8mv
	mXSf1Q7SeU2xBbjdFiBj7cY+gyQnhzPZXFQ80PM9MAuNZiq7ZSbp1SDb+IyRJtuiA99Y2Tg1zFqkR
	Rg3dMYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9KW-0000000GUD0-00sh;
	Wed, 28 Jan 2026 17:27:48 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9KS-0000000GUB0-3C4V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:27:45 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59ddb31ddcaso20917e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 09:27:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769621263; cv=none;
        d=google.com; s=arc-20240605;
        b=j5GWpjgeRwLNZW4vGcf9rRiR9MnU/5PlW4Q9CHUOut21B9lK5fHJZYMKHKvFYPqDyK
         LJqXtpot7sfaGxA7yzauwhISvyDjg3vkJqjfunaMNXvw+0Cp24FHFbaS96KrBPOyMsKj
         twX2OzHHvPjTnTzzCS8R+Qle48p/LEgaT0MWjz0VZU2d9hibQSyvo94RUSS1Zd3+QSSG
         6fjWslA7MaHy3V3q/Fwd2EIhNNEMvUICC1qmUVPDMxUoh2IGsrty+P+JkkF7FkM84F73
         XrNuBjoUUGkfaSmTXAlKwvSpkbTD+reS+pzj5ytxpGRGRVFvsmNBks/1QNWqD/t+AOMr
         wTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PUaTn5YCYH1aGyPr+judBHKrOAYlextt2AGAL94fdA4=;
        fh=9b8HyVxE75GIEThhH3cIrdmMLAEcSdPE0V/+DESvegM=;
        b=lu1OHfkHzE4gxvpi5jJzIJ5YqY0K997PZK0mCNdQ9hQQ21R9/Tcnw5p7jo5otBKYnn
         2qlq/2U/JhahTxpyUV9JaBWENrJQPFJhVVXjfsTpAyZhO0fxvulo/4hsd0Sg7wvyvmjS
         caL08jfKqCDL9Fjw2FqZSvkSqyIdx7FKqZZo7p5OGqD4u75aHe0M0YA1gAYCMlDUWt0D
         Mjh7hPyqDxaEz8B9JEh1orkK1+qmz9Hz0XCN3erds+aCqsKotVbu7ktrpr+spT2Mv6Fb
         6LZUXQxVB6t6Zhf3W/i6fntFQ+lttaxwVK6UkJeoda5fzCbV1bWqkl3pHeDFakexSkGG
         67fw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769621263; x=1770226063; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUaTn5YCYH1aGyPr+judBHKrOAYlextt2AGAL94fdA4=;
        b=OXUmT0D8ayWJplsgpiy5tewRiDn5wiXnwNdnhrtnG/y57y5HA6bnsQtWEbzhQ02zB8
         8e7mK3K9ZiRWjRfi2Z4C37Rqwrh736UCgkEEJBItGKiB0NWoWiez2NlmAVDoLPNknPG4
         A8m08v+zTZ16GI1wiVQtyZ/akB6OhEpBeHmlKwVhuMVU3e5vK2UktgEWupVbcmCs4Dmg
         fB32gvD763oPh69rbLbNtc3crcTWQdpfTov4R/+dvjg1IZaqgJYiX36TRUnOEsmG5T4z
         4xEavzFpbr2BOwb6XM7mg6vgk3sxvoDe4v4PphWrOsXrss+YB3n1255ZiiBqZuqwAxum
         Bd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769621263; x=1770226063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PUaTn5YCYH1aGyPr+judBHKrOAYlextt2AGAL94fdA4=;
        b=QQ+rZzkV3idMlJRVOY+7KRkMfbw4jJjgGk6C1gacPFKsFlyzkGdSNzC6mY6ahhX2Wh
         JqszuvjxPVici7qXQWvNzLebh/cVf6E8nSUpQo9SiSkMkPs3d5akVNcqfCH7GDJXNzbP
         iJ4NqEPgAEBF43Wvjo8w1NcUetCYInAVmwyJJS8bs5kMnpOu+othkvRnK6n/cWj2GNPM
         dYwoxSwmDAJb4AZB8fEE8WlsgFKFxrXX0J3jDCJ8CpOFdFSnXtIFgBzRnyrcbFolndsV
         i7ETfWhCZ2NawRfzAhKAHA1fZ2fufC9u46SqTovjwwtVnL3ndfkNrWlPepTRTH2aVNKa
         EYOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKJJxbHs1VNWjYxhZPGVu7aYyycgBqiP7ybTr8q1dJuSMniHXcNMxLe4NU3owbEN1sebxrxmRN3alAOM/gcb7B@lists.infradead.org
X-Gm-Message-State: AOJu0YwT6BwxcqIgSs8ZMaSnZBORcOLwIdGPrD0Vkf7XFOrui6LJeI6n
	6el3KZeeAlknz4Aw0Qhlbk5orv4yVGLJ5K80QvkJtxslytKfUQHaYXeOZC3uUMnezg5LUf/19TK
	bodtcS13wtMSJMM3m76JXFJ9kX9kNcwk0fSI+
X-Gm-Gg: AZuq6aJtsTTatoQUB3QgdPkm+aIUpFIQVUAtMRuXfkNoC9Y1E4wgmHY8g/aWq4WKAI7
	apD1ZPGo1a9YqXxyyWevnRoxplorS2YBSC3EHHQ+TWmjU/o3IVFxQfs4F1yLjMJlXcwzTGKN60+
	PRzwiSWZzQfm+CXfZoZQ6bRqQaSHTp8Q6lWLReo9eT4nG1K9lxeamP9JWJ2+ngCQm02T/BLMW0K
	SuSyg4Y/pn9v6hfOUKgJSm73owMf88ddorjJadchwHt58GMG6pYc/XDMesI9QigALujV36jUzEb
	3nDfRbiMHFnRo4GDiwVBQtGLeLji4vGsxclN/A==
X-Received: by 2002:a05:6512:3b9f:b0:59d:d32b:1d1e with SMTP id
 2adb3069b0e04-59e04035516mr2970279e87.51.1769621262284; Wed, 28 Jan 2026
 09:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20260127025740.2601841-1-onlywig@gmail.com> <20260128155529.3699599-1-onlywig@gmail.com>
 <20260128155529.3699599-2-onlywig@gmail.com>
In-Reply-To: <20260128155529.3699599-2-onlywig@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 28 Jan 2026 14:27:31 -0300
X-Gm-Features: AZwV_QiCWCfgEVaf466qIPBgCbhNFFu_DgTZRC-k1mWUAV0vRzvFYLXs8kt0N7M
Message-ID: <CAOMZO5BdH3X_efJGFyAjCk-1amLTDA303Lfr9NHLJMpbPxEJcA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
To: Wig Cheng <onlywig@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zaq14760@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092744_823564_16F93305 
X-CRM114-Status: UNSURE (   7.75  )
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

On Wed, Jan 28, 2026 at 12:55=E2=80=AFPM Wig Cheng <onlywig@gmail.com> wrot=
e:

> +&lpspi3 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
> +       cs-gpios =3D <&gpio2 8 GPIO_ACTIVE_LOW>;
> +       fsl,spi-num-chipselects =3D <1>;

Drop fsl,spi-num-chipselects. It's not a valid property.

