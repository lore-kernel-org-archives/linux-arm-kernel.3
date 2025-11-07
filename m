Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5352FCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 13:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWO/8gHk53RYXD8wsffSK2ke0SFZ1bG9gjIfGIFTJuI=; b=VX0/mpIp2SFxYy
	tEAAmIhlRnOE8mTWGaHcbqw//8pRakgwVvR6G48x0A2kkrLDdb72f32NxDIPu0aaZANL6hYQzwK6J
	dgaQF+RYEZG6Vwt1Bo72pgbmbqmMOUcx7a5SUnHYoRILYnSck6Z1uGqXo41QUA2OiJpHVmkKGYNbF
	S9CiwcBFzUaBRoXbc/6jt5SOmpQl50Sr67vqjAJ4MdoXEQKjgDlK5lrhaV/jMUL8NpE1eOWxDzmCI
	t8cZ4WdXIdTzUU3mT5MB9Re4jTiatrOm6ziCAHb+7TRl8XtyGzon02zKEQ5R8Vp4bUxsGOr0AVe9n
	oVEdO0yIe/CwgrScY+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMGp-0000000HNnu-40V5;
	Fri, 07 Nov 2025 13:12:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMGo-0000000HNnT-3Qxn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 13:12:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B55E61904
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Nov 2025 13:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33731C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Nov 2025 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762521169;
	bh=FWO/8gHk53RYXD8wsffSK2ke0SFZ1bG9gjIfGIFTJuI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=VmUk856LB3Ktid9JTM1p/HRUccXaDtTvjP+q4dhPWT4wSln/qPkV/VQu6vernisKV
	 TOiBfbwqozLZk5euuhK+PjZQPMezUhrIMdpfuKw2WKuqOZ9jIxlM+qYSwGmHlb53q7
	 YFWTsYSshNNpUqj4G0nHtU6ckASu72pJffLn1WR8CTKW3neiXm4XGYq8wXTMRuiXF0
	 YQTpO7XP/wsIoQ4PycZ9vGqeoMSSJWdUR0iew6wB1xUFKvfd1ZL3P5VabnSdmxy6IY
	 Em8ZkCAL4zE8XdO+35qZJIBafvwOzJSsIhwygOORffdFKPGIo4jxcwhjKvwckqScZx
	 kHA3V9Bh9hbtw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a3d86b773so7360291fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 05:12:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgjA9U3nUsbzsibtE0BOKNYzDAhoJLapQKfaF4uY7W0lnGkCrBF4z+hHdnDIcpSr/+Wn3NnBZroUAXY5426fRL@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ7dSKajLFbV+pI0Y81vTAeZry3AmO+UGJfe6bqXEsojXRFcUh
	kTY3bx96IWrRQpWtX/UBB8NOLFPyrS925iOzw1P8MAVi1obWVLleAVfFJEZARFxDOT4HQhevfe0
	yLUVxesirzYm0q3bB2knTAEtbcn7kWZ8=
X-Google-Smtp-Source: AGHT+IEi60U+MS5fuwhOECte6O05g72+EAD4tfI6rsUD0G2v7W8zO7uqdgB+Fmi8wi+riCfy3k40Cuh7KGFUeVlePak=
X-Received: by 2002:a05:651c:4014:b0:373:a675:cd5f with SMTP id
 38308e7fff4ca-37a73335a70mr6546391fa.39.1762521167522; Fri, 07 Nov 2025
 05:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org> <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 7 Nov 2025 22:12:34 +0900
X-Gmail-Original-Message-ID: <CAGb2v65fcCEqJEdSuH+n1BFtoBxSCxEXaxAk7norRWzpPoT2cg@mail.gmail.com>
X-Gm-Features: AWmQ_bknqHyNaA5_RcBhQtheiViI_1Nkl4lCccfeS9SBJtkNwcoPaIb-tzaunfo
Message-ID: <CAGb2v65fcCEqJEdSuH+n1BFtoBxSCxEXaxAk7norRWzpPoT2cg@mail.gmail.com>
Subject: Re: [PATCH 04/13] cpufreq: sun50i: Simplify with of_machine_device_match()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Nov 7, 2025 at 4:08=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

