Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E277EF588E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjF89OvCLnsrV+6lZbmIDeKZlvIagJqlQKDM+Fhbm8w=; b=YXQ/iry765wdTlTgJ0J+YCy9vs
	KH5n+hsdZ4nCGq7maYUYAgf2Xo21FXM57TZnb1BD9LfNOepCKggeHZQWxkcyaYhjJ6vIwXPt/Jz+Q
	ovHdZ8CcYz94FYexQJ3N3Ml4u6rCuIey52cGnGp5NjDO8ZriGl7WM5S+2hNdssWu3ZyUc67GB4xSu
	iChY+LeS0vzT9/hpaFq0suSrh/6MweDpM5GX0Wu70EIDUzNmy58byqPZtot2OcBOQ3dX0Tupp1TDa
	+pWURuV1LH1GphXFMimTdJX5E7XpGZkZhg7unn3ngx1LS1Gl3nbSOfVZjcXEPwl7HUZfaAEdnIEo7
	1Ghlhm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqB8-00000007DV5-2aWy;
	Mon, 20 Apr 2026 15:04:50 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqB5-00000007DUX-2bCa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 15:04:48 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so440998366b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776697485; x=1777302285; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjF89OvCLnsrV+6lZbmIDeKZlvIagJqlQKDM+Fhbm8w=;
        b=BEU9AvlniDPRMZVcbd+KWC4hv0Qhl+wsNewmeCpnAM3JZj0ieStOIF1S3biWsddOq2
         gs87D6i8k+GVRejVcMXOmaEM9CAOOrBR8sKI1WD7lTn5iobcHkStjhzL0oI12eO63MKj
         2WsVj6xPGfmC40WmTtyy+XV0qh3yRClh54DthTw6XXglERk0kBTDx/x0xxS7Bhbze+b2
         s/BXe+n/VK9argZan8babrdXVr2KCY+bKxKH0dsKEXWPC5ammoF44m3XLZ9jjxsNvSO1
         LtqIBDELeJzbeC+2sNSHBvsd5gPLbwU+JxMWtCPql5XQntHedT0r+fB5+5cwlaIRBRzs
         ybNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776697485; x=1777302285;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjF89OvCLnsrV+6lZbmIDeKZlvIagJqlQKDM+Fhbm8w=;
        b=BV/fbJaau2te2JbFELx3yYGtEZ5fy2GhwmpksEw/FokbNjFrRyDDwvI3jQTB0EsbUu
         6gMlabyN2u/9pKS6N09gnA0zEl/CRsOCJIn2KJpS/EYGUZCtFQuchCrS5m5hgsEc5z1+
         cPD6gAdtHKryGEsLw8ZiEVVbWvTtjBC0XSi+cZekMPKAbvWlKX78X5PTNz6Tcz7t2aU5
         5vTIRImgDDVTy2dha/EzEbrmmMWhiFvHKv/Xe7WdOR5lc5xeNs2exxc+0cLSCamY2vgh
         zwgquLdOXICWD3l2vJWAaTCalEhDaWOMLoVzUbVTrZpV2Fe8LNlG+qqQkzXJYERy8DOG
         4GrA==
X-Forwarded-Encrypted: i=1; AFNElJ+DF+nHwtyagYF5YJCpNE/jLuM5gb1FgHdPj/e5RMnK3JsFYq8TK9cOk5AiM4Bm2958JFy8XysUrCvbUC3/54n1@lists.infradead.org
X-Gm-Message-State: AOJu0YzwVHXYCbZmfrAlfNXC2+YCNQ1R68isOFYXlMSLnFQmWynR8YTk
	7V35uWW9CALBdjiTDYJO6T7wWKMHb0LX6RHYQ2cQ+7NaY/hxb0Hx4VP80vEu3Gut24I=
X-Gm-Gg: AeBDieuNOPgyn2iog8KJe38G84ex/wwbrXLGt5VysWeAvIVw85acZF3rpDYVu2MjjA3
	MhLy6XP9oUgSu2NoYlwq/LPPi8s9TPfiocgPhOryZkHvozIFIZX4KrAjxUA/rd0J7GY7vZZwiUf
	/VEAAZoOemFZkcX/hiIv/gRRHE6qMPpFZSnJxtVIZBVJoNAjxoy2waHHjAZzcsUIn2F/FQSyoW8
	cFLaBA/mpebH38JVwBKgGwR3JdvxQGIMnS75v4Cxlzj+lzMnp5lr8lNrRmHmJ0vzpvFxh/Jr34j
	bqdbyacJinUrixHcIj3hskMrJOCuVOZBCBY7HQR50mLPxrAnudoRrGPVA/inXyDyOmoLwQyWmQe
	l9mRp+Hz1DDtYV87x1023Rx/EUkw7ckXwMxCpWLXuJlZbSJnqLUKhJApqpxLOhM9EhyWE9YAqUp
	gaR4vERYGQW3lMfw6536jI6lwHLWcE+v4uHBF6QUbq9U+QGHfmDarL0peCh05C1QRPaRmo1ysnN
	gkyJFFlfTJFIdGTAkM5u/7F
X-Received: by 2002:a17:906:6a13:b0:ba7:9eae:18a9 with SMTP id a640c23a62f3a-ba79eae1ab8mr235029466b.17.1776697484784;
        Mon, 20 Apr 2026 08:04:44 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4550468d6sm358274166b.52.2026.04.20.08.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 08:04:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 16:04:43 +0100
Message-Id: <DHY2P02B6E6H.J79TDOADC4BS@linaro.org>
Cc: <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos850: Add syscon-poweroff node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>
In-Reply-To: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_080447_701936_A3C7211F 
X-CRM114-Status: GOOD (  11.77  )
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

On Wed Mar 25, 2026 at 12:26 AM GMT, Alexey Klimov wrote:
> Without poweroff node Exynos850-based board continue to draw current
> (around ~60 mA with my test setup) after poweroff. Kernel also reports
> different lockup problems and RCU stalls warnings continuosly after
> last kernel messages about hardware being switched off.
> Turns out we missed a write to PMU's PS_HOLD_CONTROL (PMU + 0x30c)
> register that actually switches the SoC off.
>
> Add poweroff node that implements this.
>
> With this change the current draw after power off is in range of few
> milliampers and lockup messages are no more.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 7 +++++++

Any feedback on this?

BR,
Alexey


