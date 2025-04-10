Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A0CC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 14:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBdE6/D/TiVfrnRx9b/FDUHm0q39Cw4o/pOVYkQKbRg=; b=iiZA68++/S/4ZI9VOIvxd8+Gng
	GIT02P4cc3uIt6XskHtFUQxF5VAJcIGvSmOqYk5Rlkjf4GdM/yvffRQ+MULiNUCUbRBn2dRM/PD/g
	Nqu+GXnvHMXQh37erecPbv6ciZF4NxLczqRughQlHbh0k1pgt6Jw4a9IGBNebHPaXNBxel3WdQ+os
	uR0IW0Hj3a5Zk8Mr/B2lh0n5UGjMWmavfWR1WmME5MpGDCYEFRxBOdUlhRrVefNRUO4InUfmN1mm1
	bFLpDNKpkqZRra04Q+ucWJI1mItdbMj51x6FmvN8J90VPF+NbV6uhtF4KzGlgjRMxGi6KjRXLvwxM
	TWIM3sWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2siK-0000000AoZG-492X;
	Thu, 10 Apr 2025 14:17:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sgM-0000000AoB4-0GiE;
	Thu, 10 Apr 2025 14:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96EF649F58;
	Thu, 10 Apr 2025 14:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A28EC4CEE9;
	Thu, 10 Apr 2025 14:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744294505;
	bh=dEJNfddFbQgqgZyZJMMbg8KFOtcsawhyLbrR4L0XzlI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jxii+48qL50pjdA7yqa78xcRpLVZKm5MG303M4J57PrxoYaKv2uhKXslZyLpRdn2D
	 s9Sv0b7pjKAomdPHquiYzoYa70yZ0/Ebgu6XrENWvfOhrkxdZvdApSz0IOXALevVdE
	 zvIfIEuQLhPC/wboYB4n1LGvsTJ7jEVwvnmoxQ0JZH/anv5czFd2INi0HmmbYzo5oJ
	 lPC5IcjIWbucKZmZ6YZW2MXP+d+JYFdnJqM6rRCnvCU7ECeNQOnzgEZ/zTXSusl5ag
	 /YNqtCkozcdHsvO+gZIRaAOzgBX/kI0M4nL2HLbV8vX4KsK1YaHDXhFpwI7IAjxHwE
	 29supMGICfJgg==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so1490711a12.3;
        Thu, 10 Apr 2025 07:15:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2jNM1KYqVbVKnGDEZEyCfI1TyLERGedrUbjDRVIQf+S06rdebIH1Dnld7SEqETIGw2qQZkpdsoRMV/hQ2@lists.infradead.org, AJvYcCU79f9Z5vn+qHer33hHOIHrIRiTN+YN7YIltpRoLcQ8+mSnEqvbrUWCXtZsey4K5G/slHyxRW3qSIeyQsOFPfE=@lists.infradead.org, AJvYcCU7jyWMdUU5TW7QVAuVEdwsVLcTLEg4+ieCqA3bT0oCbISXru7ywrqIE0Fd+JXL93g+AjMfAgajBZgCPm8E2Dw=@lists.infradead.org, AJvYcCUgiec/GzVME45utR1EVQxUzNnvU/B2QHSugNduxXnwzBgWy1oNu0r8AlmILovXF2AuMwpiw1tftqDf6loYri44Cw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2xuS6z9IjckVK9Potx7Hxhv9EQGrDTURCVvuYuoNhuOyp8fXP
	S/l55vTxZMSkL93OFXExp0IMR6lLjkNI9uaFg+pUuD7Dd5Y3i862jr+V5H1m7pPmAY/xolLLnBs
	1S/vbg1rveGPViDa99TO18RLu5w==
X-Google-Smtp-Source: AGHT+IGl0fJE2v0I/oCPQTdxQfr3609BfC3sI9b3/3//9E+h8w2umLSUMiDkAMTe1571fUmkVBDDE3jtTLXPBwQHP+4=
X-Received: by 2002:a05:6402:13ce:b0:5e5:dea5:3eb2 with SMTP id
 4fb4d7f45d1cf-5f32c45032bmr2461434a12.11.1744294503824; Thu, 10 Apr 2025
 07:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org> <20250408055718.4azlqljvo4qxhnu5@vireshk-i7>
In-Reply-To: <20250408055718.4azlqljvo4qxhnu5@vireshk-i7>
From: Rob Herring <robh@kernel.org>
Date: Thu, 10 Apr 2025 09:14:52 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJyi=sR9jtEy9_U+RLVorvZRfby8vsWP6sXV+_4NP+Gug@mail.gmail.com>
X-Gm-Features: ATxdqUHPmJEIuVKadhgZM7F7MHPh64iWIlM7zDUhgEaB8t8IKqn3FRU8YxuohGc
Message-ID: <CAL_JsqJyi=sR9jtEy9_U+RLVorvZRfby8vsWP6sXV+_4NP+Gug@mail.gmail.com>
Subject: Re: [PATCH 00/19] Arm cpu schema clean-ups
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_071506_142726_828B2B75 
X-CRM114-Status: UNSURE (   7.06  )
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

On Tue, Apr 8, 2025 at 12:57=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On 03-04-25, 21:59, Rob Herring (Arm) wrote:
> >  .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 -------------=
--------
> >  Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

In the future, please consider acking the 2 patches rather than the
cover letter because 'b4 trailers' thinks you acked everything.

Rob

