Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D91CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 22:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jou7wl1+eFLqh56mhBKzbuquNRGf4+Mstk8GHncGjYM=; b=INRkMSGJ1wOG80bGDsMzwBMa6U
	8SYdfrMQGuYeJFi6cUTbRID3hXKcCBoHUbu6ED+oZqDVrTv/A5N9WE3rFeBdWDhk/wxKRz8mLwRw5
	PCuwSdo2CXWWDGHDh/96DCpiaeudKj9+IpBUtVVzwooUzm6fMx/Gd00x70+je8iUXPJFL7S/WlGX/
	wWdFHWEYMlqfXj6VKQ8ojVefqW2YSIgKtD71yr1Ws6H9YjLzcsGBBuKg8iU8H6XteQne11ELCZeWd
	qc5X6hRrg/5roF3RWn6Kd7RSRzKjltuDLqw8rvzAv9Ey3abeZ7AXkPEOWyWz0N+NCnYEarmYcDHVE
	nH8QU+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAy3y-0000000F9ZR-0m2e;
	Mon, 20 Oct 2025 22:09:10 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAy3v-0000000F9Z4-0HW2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 22:09:08 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-373a1ab2081so52808031fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 15:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760998145; x=1761602945; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jou7wl1+eFLqh56mhBKzbuquNRGf4+Mstk8GHncGjYM=;
        b=iqfoj3YSkVf9Pc7PvVWXiF68qw+jeDVmh7F7HVa1vB/f2XnLAOFuOxQBhfxaXYTyhX
         gbq9cOdBET0LtEKfwYoQM648Ilt763ZGGII0Ny46G7ZBJSsFP0/94QqLmf2BVOsDUqvy
         R1MLnZqZVdOleyI5bgBkJrVCnKciqukLM+el81g7rtUE8auEinj9/MUyiYJ+ndtuL5uR
         fT3zmI86gftBv5xSGlTFbKrY0pmaeYgqefiBZEqUTlRYqrN3lE72dTEAV6CDwpKHGXrp
         I6GwYY3r/WnXf4tEx3cSgYOFhVBDgYo/OrkoRSAx0dNZEYKXDK5AMIlbudnhqyUihJQ/
         GEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760998145; x=1761602945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jou7wl1+eFLqh56mhBKzbuquNRGf4+Mstk8GHncGjYM=;
        b=bqBDTGyTpPbCRwa4SbTIFepgCpzBGotImFMKM7iVUfw6YOrqVxjhwt9HyndLHH74UJ
         hCOzYH5q6pBSPrqIYf6ntsv45jIh6LdPWqoNFUmtw4DaCSh0NBLkLCHneX05AfX5kF2u
         urGGd7M3D/iPDRB/EiZ3qQmZ+GlzGvwnDWF+gzbJ/E7ipMEIjZisoIGALHtDPYbbwDFO
         /aqr9IhlcC8VkM0HN/jZuij9Zrcsb2G50ecdqjTW4kO/euWvemLUjIKkaxtbAGakpIiC
         /05xFCANSq/IUfzY+3ItgZNzfpctTlNxse80OIwsCA6OSEHxUChPX/fKFuS1fZDnlE+T
         Sm+g==
X-Forwarded-Encrypted: i=1; AJvYcCUuP2SdEt8WaeKSqFDlDhx8kNcK3jBLm1Qdmw9LXY1m6h+gk+Z2kNFZ20rZCCJt82QhdWgvB3sGQ02O8PVvWVwr@lists.infradead.org
X-Gm-Message-State: AOJu0YxV2+cz+zHaMClPOz/S9YME3rraBow/yPKqVpsmNsSPVYR17zt5
	UjSE7SS+gcTabFh4zNVBbFgDTV0d6XP625dcYgVJHhgXeYsMwjPJuKOasaeGORXXusCWM7jPMAe
	gv3PMAHduCtQ9QViV0ZfZ+z/VFaAj9qOO+AghkugfRw==
X-Gm-Gg: ASbGncuVrMp0qLjGw1GdSrgzDnXCOI7d0unpQu/nzqHphKDloBNuoOgkS1oejECltgx
	YzyBW1Rny3AWhQNDjtzw88isywVPugNOHf/mC3tamxuwvKoUc1DzabaVpbQRBBEwpikDo6JoHAW
	AzmffJR80GfhLhdMgHyT8n2248aYS24ehVx/PlKgljC7d2Te8mTVUki+MoMfcN8Jc8feKEXJLzr
	6KccdT3BrlLjCMtxuFQglUwsbexT9WR3k8K3ZTF+hw3x+CB8kENzMLHRfsI2CUc+hQ1l94=
X-Google-Smtp-Source: AGHT+IHndeIzowFKyGV77xJrwW3PbYRom9TRTnbQmCDghJkjbT3tIKvOTzTzPAFp9D2embhKwkVO+r8Cc1SJcrX3RR4=
X-Received: by 2002:a2e:a9a8:0:b0:36a:cdb0:c1f3 with SMTP id
 38308e7fff4ca-37797a143b5mr45120621fa.29.1760998144941; Mon, 20 Oct 2025
 15:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-10-antonio.borneo@foss.st.com> <20251014-affection-voltage-8b1764273a06@spud>
 <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
 <20251015-headstand-impulse-95aa736e7633@spud> <0826a055f6b2e3e6b50a5961e60d1b57d1d596c6.camel@foss.st.com>
In-Reply-To: <0826a055f6b2e3e6b50a5961e60d1b57d1d596c6.camel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Oct 2025 00:08:53 +0200
X-Gm-Features: AS18NWB0sT7rk733pb0JBmXxWZ3rsESep7Jo9zTjJKG7duLHdqwxNHX29WRzGYA
Message-ID: <CACRpkdbeaiNGfOFfVfDNZ=u=4yhCykcdSdHUv-td_DVyr3aWaQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_150907_293937_86EB5D87 
X-CRM114-Status: UNSURE (   8.14  )
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

On Mon, Oct 20, 2025 at 5:09=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> pinconf-generic only accepts positive numeric values for
> both generic and custom properties in struct pinconf_generic_params.

Do you need it to support negative values?
Patches welcome!

> Plus, I haven't found any existing driver that mixes pinconf-generic with
> custom string values.

Maybe I misunderstand, but pinconf_generic_parse_dt_config()
looks at  pctldev->desc->custom_params and
pctldev->desc->num_custom_params found in
struct pinctrl_desc in
include/linux/pinctrl/pinctrl.h

$ git grep custom_params drivers/pinctrl/
gives you a list of all drivers using this.

Yours,
Linus Walleij

