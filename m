Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7598DC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkzP+m0O8sqA7PP0YLwDfiJp+rK3Zs28ikPtrX0VKU8=; b=nD1thHPVsIw0oR7Uj35QhcoVVo
	4Jqef7/DzQmxICKnN7SBkvIR3E7nWjWqjulbuJ60ilJA4tJj5FSee3sMWqiZKy0imwdxvoiMEcETe
	ExBxGkcEIXJTCudYzx3VDS3fkRKW+o5XLjjLoq84pED5JnFdRa8dInfnlZubrbLZHvOkx/HmhsoTK
	F/+5mMR9kP69AMRN/THI1zLRpKBglsT9TseMijVXjFBfhqK6luXglgvabJYrNvZ/jOBJ0yXk+Ehe/
	eyK3o5/I2YKIyl8Q86O8IrC1/FtUzuScqPGLvFXvCavrojpz2020lH1m3sqmgH5m2AJYTIqlCX+q0
	w+xtS0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv9O-00000007NLg-2jXZ;
	Mon, 05 May 2025 12:42:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv3l-00000007L1v-0UKC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:36:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so35833365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 05:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448595; x=1747053395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkzP+m0O8sqA7PP0YLwDfiJp+rK3Zs28ikPtrX0VKU8=;
        b=BMClSzaMyNGIt99CNEohGXrTmBKR5SLk0BFzfXdygDplsZO2BmjhrkdsRKAKOzs//P
         bzSVowLLXM+059v/FczmLfVvXC+R3+GWFMk91ZCtuoRxAN0yoELiB6DS5gjkz1uO5XrL
         Ev9+UtFL40YyvxJAm7dK55rr7gNmu/O1YPbz9Sc7lpL2KOb1S/Lzr5At7GbJ0COo6Nq9
         n1B3m9KUMEC3+dFJ/aImtQPF2WmvusRNr25ex+7yWuzURGLU6kUdh+dFdYsaEnsIZEpT
         B43nxgukV8aiA/66C4iA92SiYcoH8q+bt9WRsbcmnESQg/g/xECpS9Tjs6BTI1xNGdGj
         K1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448595; x=1747053395;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkzP+m0O8sqA7PP0YLwDfiJp+rK3Zs28ikPtrX0VKU8=;
        b=UEHhAKE9KEyVoIsptGVf4FmEQsDlkTRYJrrhcB5fR9YihvwnEecn8Y6ItefLqdFVDF
         4CTToNYg7NpPaJSNc6689x9ygksGj2VHZFJzg865AfR1lmvUlQat6e7xTbkKxSeR9cCr
         gvfTBaoK9xKr96CojgKt6Enwi3juiwYYBosydF8ooyQT0z7eE/oHXp17mp+hOpZBErL6
         xsQN7XAQb7uMOLbnS7SLihlpg/yoC2X9I0cQbinFQsFYkA3b/bbKLXX8fqDuEHzIaQai
         k0q7mUue2ZnNhhxJkDRN/UNmy0D7jjQEpPDZUn2Q5eX7eEu0I2l4k3xWx48hcRtJTdad
         CeYg==
X-Gm-Message-State: AOJu0Yxxo78w88CSjTk6P++G/cWffTSp5k8AW1CUGrZGHy7ZmxB/IyaJ
	6D9xbFF7BhuaJyojYhvT6WCyV2QT3sYfxuWBSmD22X2vPDmxvFR53HVsaMPdnBI=
X-Gm-Gg: ASbGncu+EJcUv0D6Te26LSEN+sy9vk+wsTIGD8nJuT3zMX+Qu2WihSwSfD2E4Pm/4SK
	ZahSWaNSjZQg/5CGJ8dxWDM/yQi31N7xFbVhoTYnNKqbP4OqVxR7v41BXBTNWT9nqEq/ivD7Lzi
	G4brXoi1QUs6x4fgODVTkE7fBPEVU9OWrfEoFcEt9PetwXHS1RQZAL0Zo5/hIIcALM1OV4WpVkn
	fQf3AUZtCjUjX1qLQHE6OTu3/o2uKIJQv+6PYw3nopAiQNk5G+V6WEVbKTUDG6BIHvPiQKa99l3
	Jy9OJXLtPejYys+BzMbpeiz2jGA/m7i8YKlPd4AZryI7MI+85ysExZQ1kzYh1Q==
X-Google-Smtp-Source: AGHT+IG2COW4gRylaTrNX3Gp5wWIIrkuAhTbqRncgXIIyfrr3eqB1u8KpMIP1+ZUs/fDXY7fXIMnZg==
X-Received: by 2002:a05:600c:5111:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-441c96a2795mr42420605e9.9.1746448595319;
        Mon, 05 May 2025 05:36:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286c4sm131072725e9.25.2025.05.05.05.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:36:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 Ferass El Hafidi <funderscore@postmarketos.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250319190150.31529-2-funderscore@postmarketos.org>
References: <20250319190150.31529-2-funderscore@postmarketos.org>
Subject: Re: [PATCH v5 0/2] Add support for Xiaomi Mi TV Stick
Message-Id: <174644859409.1377721.14494389382281683903.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:36:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053637_173532_EB724868 
X-CRM114-Status: GOOD (  15.15  )
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

Hi,

On Wed, 19 Mar 2025 19:01:48 +0000, Ferass El Hafidi wrote:
> This patch series aims to add initial support for the Xiaomi Mi TV
> Stick.
> 
> Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in
> 2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
> u-boot, ...)
> Its specifications are as follows:
>  * Amlogic S805Y SoC (believed to be mostly identical to S805X)
>  * 8 GB eMMC
>  * 1 GB of RAM
>  * Wi-Fi + Bluetooth
>  * Android TV 9, upgradable to Android TV 10
>  * Google-certified
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
      https://git.kernel.org/amlogic/c/4954ec9300cfe7ab6f1de1c93c56c236ac0a07e5
[2/2] arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick
      https://git.kernel.org/amlogic/c/f5d4227c6dcab047579cca7b8e31a476ecdebf7b

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


