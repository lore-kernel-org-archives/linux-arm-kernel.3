Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9735DCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 12:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wpphr3zABAARr+Xe3rZOUncnYSZS0BnTX9QeRFwgyw=; b=YFuVAr17JHCw6uXBDg+JZbETPt
	dkzPK/161snv/94JpS8yBUaHPWrKydbqZ6XvpZPq6/vE10phdecMLGcGWhkB05vIvaLYw0PFdHDEl
	snN5LYKInJbfK0IPRaLptXFav4Uo2lehWN5KUrpNffmAlqqC2QT5CImCOAAJMrJTwu5guamiHjp0o
	94nqekfGEPcLsC7RsL8mBkjzT4IHCcDZTwdtzGxZr4Zysxt1tHuQndBDCM5Wy0LuXPaS1rH9AkkBS
	adNrC1MeLxfIc8V5+ye2CjNMBNK464ESbmBifDwXQo9aZQSyUw55PK++4OBDaHQi9oRkq3R/W6/nQ
	pjjHZ8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlCn-0000000DCcr-0qxs;
	Sat, 23 May 2026 12:11:49 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlCk-0000000DCcM-2C73
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 12:11:47 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c80167f56cdso3703794a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 05:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779538305; cv=none;
        d=google.com; s=arc-20240605;
        b=eLjN7Kj1Z3BW2lOc1d6ll5C887/gBzaxQ+DC/x9w7XSHsmbkruEfOQTEGOBLWzsOZZ
         iG0bxZnQ2q89jxDNMR6G1rCYaakwDm1y4AzjBoW2sphmpkkfa0D+yPVktPSQr13XvTWA
         IwlIzWDG89116KwLZFA7fzGYV9R28mjwR3qVl9cOxG30SnB4EGjcWWqIsxozEn8X81rE
         HrhgHGhsQp4xZ5z7EopHEEqQzDgyCMkfKpNTErNaerl37R4f8Xu79wqWgOmYW2yTGErT
         jH4iRp7A0nYndTkfMM5edATazS9P+SJ9u5jAEk21mh+df4Br7CgHIb6Na0cGjMNdxwm5
         CpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8wpphr3zABAARr+Xe3rZOUncnYSZS0BnTX9QeRFwgyw=;
        fh=sSUDOs5quVkyEHSYNQ4W15QZUdnSbussyvlp4fySwVc=;
        b=N2wSn5fN4rT4OzF4+gAFHq3ZucMTATm+gr2ec4Lctd4Mjjnvdc88EjaN1q0cvmAarU
         hINRWfeKgz3RVHjcDY0uXs9F9bmB23pnvSu2ZH4wSQGkCxsSxMncu+5Nfto/f50I7OQv
         RxUKjoSmGCHv+0V/W9DsHQ4HZ3TSCvdDScPDY0OHeKp/gKdjhazEfTCHwcfz07KfM4r+
         pLgM16tIn3DoAh+WqeaxPyrsYDZGMc+4+pD2DjH4UpNmfrUNCqm33Zt0oq4qS8+e3sT3
         CN0wGFFE1xkS4v8aF2eZiUrkSKG+2lXWOLKkKVIG5GyoZvPJTXg2sQEOR8HlIAAwI1B6
         sSBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779538305; x=1780143105; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wpphr3zABAARr+Xe3rZOUncnYSZS0BnTX9QeRFwgyw=;
        b=UFlLpNS9JT7JjbRB8UYLZri4MmfblSdmG+/rblFIt954iRCDTJS+6omhM93tQTP8Q/
         q6yhDkiQz15q7mplndfFvXRWHZ5JMAvzjJv7JtHe/4c2Hr5EOkLgMGqlMn99GgbTVrcY
         SVDpSv7gctwTJt+kQUsASh4UKJzFheaHuzlSjzMHQZkqJRAW3NYKO650DpvpeCu284b5
         AgE+FkfUW5rNWlYiMCpQPZ4f42qLXDXAm73FDpBDO0W1zWiuafblhepihadDoEtIKdIF
         tjwWk9ixRZv04zE8omutlIicb1pl/RoM2PXpriRq3rSl3bR0qYSqsjDEY47I7WEfjrQA
         mhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779538305; x=1780143105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8wpphr3zABAARr+Xe3rZOUncnYSZS0BnTX9QeRFwgyw=;
        b=FlBT5lwcr+Mr7/IJROyQwJztt6KdIoFpTDTo0WNVGZMK9hgCHztm9Zpx0VWogiQI02
         IzJGhIYyhVaOLs3K9tXA8a3vkOTTiYwjwsrjKWdY4GcDqGSQOl7gdgs5Jmwl38Yaw5bd
         CbrxfuLBjuRq8knYQHr4JUlrOhnqDIYL7vJ1VZd4YW/qVAPzJ5lVCi45kP/DmxsofVf9
         ZW9CIEVXIvQthkpJvkbj5OJoKsC/t26vVvrjMc79zg61TGiIPQI0cZcjEhqgXx6inlgu
         +hPWYY5nXoPNHZm/Vcltne49h7MJqwD64wE6RUXujcSUT0LtifngDOPWPml5Vq0xiCd8
         fJmw==
X-Forwarded-Encrypted: i=1; AFNElJ92ejnP4lfYIhp9esOiDQrkz9kFJ4szFw9dzIt/cMiLKZsA8ASjCwIJwbyJnDW4YreGB3mlpnqlb7jH6Zq4T7je@lists.infradead.org
X-Gm-Message-State: AOJu0YwInmHPCjvZnUgrTSOrphD9ZNDcXRjgnHXFN4CUse/OtAsUymPN
	SrJvm88WMzw8v3+dUxXBbtcfkdmTYvD2zupupHS1csOXMyVT2IZXVnBKPrpANAYqQTvY0BuCiYL
	74lBVmFJZl8E+tUqGS/MxJZE5iaigaA0=
X-Gm-Gg: Acq92OHS5Nv7GBXT4Ci5AzZQLgKWkZKAoUX33MyXv4F6XJerowgkI2RkE0pWDXSNjtp
	ngmFKoCed/orENOb7WWiD9tPFiy+DYy2Ut0aDXNAYXjsMg667bI1pmCb4XFgqsWKcB+9FgbHlzm
	V9np7Wjq+Iu9vp/qL6Yh1wqQbsGsByAAvjNkqpfBK+CatqVtLpE8RmBJ7DzeM0U+dYOFwLhsIWQ
	Y8OAgKZ0WI6FkBqrm/XMHG0k2VN626tWY3Fh7FlJ7Ue73E4iIqLaJlJuHfZx8gwKUDTfJoxczFk
	vzazS5IZtVayrDY6rJPvVaHhOttWNUlgZ/dwQcq3g7utDHmEN3pbEoyTH1kTaW6CvCSo2JF6
X-Received: by 2002:a05:6a00:430d:b0:838:af72:fb1f with SMTP id
 d2e1a72fcca58-8415f0e43d6mr7637408b3a.2.1779538305135; Sat, 23 May 2026
 05:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
 <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
In-Reply-To: <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 23 May 2026 19:11:33 +0700
X-Gm-Features: AVHnY4LgJLcY1WKuBCvFOXhD53DeqFEBktLQO4t2Ke2wkQ_NwOIr1on75a8Arx8
Message-ID: <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_051146_571270_6B4D5396 
X-CRM114-Status: GOOD (  12.66  )
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

Hi Chen-yu,

Thanks for your feedback

On Sat, May 23, 2026 at 2:20=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
> > Enable the APB bus clock before the SPDIF module clock
> > during runtime resume, as register accesses depend on the
> > bus clock being enabled first.
>
> That does not even matter here. Access will only happen once the runtime
> PM callbacks return.
>

I understand your point that =E2=81=A0sun4i-spdif=E2=81=A0 doesn't immediat=
ely access
registers within the current =E2=81=A0runtime_resume=E2=81=A0 path, so the =
order might
not trigger a failure right now.

However, if we look at the peer driver for the same Sunxi SoC family,
=E2=81=A0sun4i-i2s.c=E2=81=A0:
Links:
https://elixir.bootlin.com/linux/v7.0-rc5/source/sound/soc/sunxi/sun4i-i2s.=
c#L1296
In =E2=81=A0sun4i_i2s_runtime_resume()=E2=81=A0, the sequence is strictly e=
nforced as:

1. Enable bus clock
2. Access and restore/sync I2S registers
3. Enable module clock

Since both IP blocks belong to the same Sunxi platform and share similar
bus/module clock relationships, shouldn't we maintain architectural
consistency across these drivers?

Enforcing the "bus clock before module clock" order keeps the dependency
ordering aligned with the actual hardware roles, where the bus clock is
required for register access while the module clock drives the functional
audio path.

Wouldn't keeping this order also make the runtime PM behavior more
consistent and easier to follow across the Sunxi audio drivers?

Best Regards,
Phuc

