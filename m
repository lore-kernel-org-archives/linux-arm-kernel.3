Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB18FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfT1yL0KZE9kc3QIXQAHQN2bdjQ2tBY3krHPlSith7k=; b=T5L5/QzFbhgLdvkbFez3nx8Obk
	O/kULLyf7WhPzBRT0CcDrN+pDjraGzaDqFfhAhhupayF0kOK6CDb5FJrhIKMbTihytoO2xzBo/T9s
	Hk3p9AD5/pQn/uvEjLMBJFhKfAXQD8LAiSkIGbwgD8FrpVAPkW4d4ZX22QKAJE/AR7FCFEfdz2chG
	tdiji6xH89EUxSHlT7Rl6NnOBXFatCw7jxME+PDp4ppcw7aHTDSZTkRmT8V3I35FYM2rChXr1B1CN
	zvv97dM1QZIeFfsMA/jgrBg73THKpS1nbOB9JmH6rTalGAU7yaHo85M8CqXL23OlVtrCOlWYIV3L8
	K484bfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBhO-0000000FnAh-1iph;
	Tue, 07 Jul 2026 19:43:18 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBhM-0000000Fn9x-0dZ8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 19:43:17 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso3723485a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 12:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453395; cv=none;
        d=google.com; s=arc-20260327;
        b=GFxDjhOnW8fvi/hA1YWpY0M15k5+g3IgsFx66ICGJiRvIPbn+EfavAbKfua3yzQMe9
         /U9CuCsrwKyJxPsMqYLMwEgJRv7Bcnol8cLejuUE50+BzJCHjCFjD5HmazL5/4DpPVtt
         hOOonV911zbTRKAS/YiEoA0NG04TPeMf3SIYBMJ6ys9H28e/wg4M5nDkDxzpnD9JRoGq
         EebqBBXvNS6V4brnljPGrECJs+sZE97WHUneniemN+vgW3NKv2c8GUrxNjOcpYCkSOoh
         W/V6IlPi65RAVzE9ZoqTawHjLF8bKKf3i0igyG1QiETLywe4be1dqTxNg1+0BX7fNl8+
         BAqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QfT1yL0KZE9kc3QIXQAHQN2bdjQ2tBY3krHPlSith7k=;
        fh=KIxUjMZt9uLuU6VgX2u03DCtOnqSzyuMQ9IEDjq1Z7E=;
        b=pBzvzvm+IvgOFQrInX6eFQiMkWLeQXRMCc99QGyKJK6W3w4AwSabPY9yS+fbFy2AoT
         cAKfi7smMWVvZTRDQqViTvV/almODRVlXa7MOWLNVBT6pLfwaP4HtR/WdPWdfladXonq
         F7UWpgYhS2x/nRqDJw2btuKws3YAkmc6oyyfZuuPKnJ5m/Pz6/6H/sNmiae4931wNrC1
         1JF+cIigTTh6RM4LWCGp2pa7ChBK0BP+jGmKwERXl6PboTFiHNoiPbKBSayLTIYTraQe
         Jd2dmCbeA77VGekB1OZcbEZYmDRRap6QXMpOWV3AKZnYJLwCrrW+/06s9SmvlT0UvGsm
         I2KA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453395; x=1784058195; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QfT1yL0KZE9kc3QIXQAHQN2bdjQ2tBY3krHPlSith7k=;
        b=DGXwAn2Sf9PTsGVyvrZIp8aVyH4kzYPWMmc3v8XNtQgG/ffEV98Oh8MsdtfPS0mbKf
         czwG7cC+6nM/UzZv5CZNEh/U0u9HNjqhj/M61uhGhORCwH8Yj1hf9AkJYeA780qsYXQa
         qYSMmi2nUJ5MJ/JWHiG92kyUNullM3Nq36AIlG2r8gJFqdeWZB+x+L5BmK+K2mG1aKaB
         PDd6UcniNtL23Z7Q5j7LRayjNk5L56Dsq5Ab5CN9VE3s10kO0qaYcb3YkkGs0nhQEG4E
         WaDBsI/Y1hAw4P3RTDcQ/MT979gqc1rTodTeqO3APb0s/PTvUlvoiZ7foWjqstVs/Go3
         69kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453395; x=1784058195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QfT1yL0KZE9kc3QIXQAHQN2bdjQ2tBY3krHPlSith7k=;
        b=na9VRFMyaEIMzl58hChOwARuphxityGs8hqlmvZ9i6BSt2gYh7acGsJXd6Uz0+srXu
         1k6zQt4JpQ9Ma2QVTp4mBT4yUTKxcJLQ92JpKAlrBplr2a66Gwxe+bT2+eyPDUjdKCwj
         cgYegN9Rrp79q67NjCq4ET1LATUa5TFGToOjeZqkNejtn12V0YIH/zdTXh1dyGhr0XRP
         04YIyJxFmnoWLq9wvi2NJa0vf2Wb073WUlQgmuFEBKSv30JeKmBtE/Q1NIp3e0i2GO4e
         FnrkpbRXZLjaLc2yBPndfmXzXk5r3TbcDGuSnKK1riYpIeF0HFvX6pJzZlPCAqbPm4Qi
         R+AQ==
X-Forwarded-Encrypted: i=1; AHgh+Rry/kmVrSV+5huXlVPTYWM+f7Dh77TeQdgjjvEKIoyhyKqIkm3fJJjqCOYAlAORV90SGuKEUMNnPGR9h20dIfVe@lists.infradead.org
X-Gm-Message-State: AOJu0YzlKhZeEYAXKSnzFYsaqcN1BmjrSTQ95c5DdLlIKlQAGAEf140f
	0vxOQGE71V03bM86uhIK2bShpqa3gI5a1UKW4MLPf3wdHdT5QeUKtIFc1K0eBsHWycuVQ77n45f
	EcS5iosw98N/bCez/VsDOCTS89p/8tyo=
X-Gm-Gg: AfdE7cn5OeCO77VXn16F338nJD5zgRzCQyqgckInOJjLozjZiUj5L3gYHrEDrXdGae1
	HWINVWJ8nOuM0raB8M5cWko5uX7Eu84lQtgbZqI69H1x5gbvyJUOPveINySk/zA+PsPzu+jLKE4
	BBrwPJ64MYZiatnV/68vGAMRGyKBfiiM+LnHFBMCDxLNoZlcxmBRrbMLgDEjfXTsj+W+02XFUn5
	qE6XB4HtmLinDFA0V2y3cWNR8hqss6Wf9VdAG8LsiwefB1ks8AhoWWxuqwljnW7iGSmjXtov/gB
	6aUzY2w9qPvamu+k3UPSSCz1Sg==
X-Received: by 2002:a17:90b:538e:b0:381:792d:f993 with SMTP id
 98e67ed59e1d1-387581641f9mr6285677a91.17.1783453395185; Tue, 07 Jul 2026
 12:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr> <20260702-add-mcu-fan-khadas-vim4-v8-7-244feee91a36@aliel.fr>
In-Reply-To: <20260702-add-mcu-fan-khadas-vim4-v8-7-244feee91a36@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:43:03 +0200
X-Gm-Features: AVVi8Cedwny1fGm0XunQLag-buYK9YXt9UTwEp4HfqUu3ncRpwQYM0HDkqsD-q4
Message-ID: <CAFBinCAejsnBhUy6TZwjgNzuVp8Pa-vTB88NBgzNVcDSAyyenw@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] arm64: dts: amlogic: t7: Add i2c controller node
To: linux-kernel-dev@aliel.fr
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Beniamino Galvani <b.galvani@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_124316_209857_759132D4 
X-CRM114-Status: GOOD (  10.18  )
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

On Thu, Jul 2, 2026 at 11:57=E2=80=AFAM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> Add the T7 i2c controller node used by the Khadas VIM4
> for MCU communication.
>
> Use amlogic,meson-axg-i2c as fallback compatible.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

