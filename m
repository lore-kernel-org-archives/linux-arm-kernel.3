Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB38C9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDZDm+F+vmrFcUjSN8q/XEiPjVl5A43rJxAi5NUM+pU=; b=pY8hRY6Vb0O+JjAkTpMZAUGqyP
	DlRxr5FO0rZh3wKlkqKOwk73nCzUAoyTDve6T5r8VtD1rOcIRKfEQtPLFR5BiVsGeQ2Vs61uoOis9
	hTd/Ee80sBrNQo+CY6qTyKX4diUr3N2BVjCZ/C3xuwzFo8G/PNcScXtNn+jLkQo0ALmr0haDmp6L+
	zBK0Q+YT0BjXlHoLxLbhKqWe+hjghxqDOzIcIdFqIcg4e+1jD93G73cIK0a7t8zpT/aqOQXgtXTbJ
	dk1NqigmOrt3UvR5cQ5RJxTnviinULhdj2AdVputsWHVWd0pLQPq8AlX+Lus6+Q2PwhdUd+OlYr9d
	HGRnwgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJIb-00000005Zj6-1tR8;
	Mon, 12 Jan 2026 14:53:41 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJIY-00000005Zid-0xWo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:53:39 +0000
Received: by mail-qk1-x742.google.com with SMTP id af79cd13be357-8b2d6df99c5so553939585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768229617; x=1768834417; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pDZDm+F+vmrFcUjSN8q/XEiPjVl5A43rJxAi5NUM+pU=;
        b=WtH7Bn+mULecW+MSQ1D3fDBofoCDryBsBlTHEhPhh8sCsIIyecQ7CK7KbTPPcQMT8Q
         yPkqGXIaWXe4NKpNX61r+vdbAuew+95f1NYUOzJ8xUKbRPKdqGXkOjmN5KH1s5mchNoG
         ENjOsBbGdTpzXI8MC3E4YvLEr6CWEZwzJmhdK7NYK/d9dPX0UvUCDrBIEhSJVTTUxRVU
         SLEV9dPkiYvrU9W+Cwe36PHk9NGIQMtOKgPoIrC43hnUwMqloVsR5uP+7Qp7RGYjxhco
         eMut/VwVhhfbcHsrcGMZF9YtnXM09PiAnJ/Rcom0KWfxPGNYACgM/R00FvruKOOKNZRb
         tRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229617; x=1768834417;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDZDm+F+vmrFcUjSN8q/XEiPjVl5A43rJxAi5NUM+pU=;
        b=bz7QbxlAm634bqrlYWODHr2wBL5RuQ7T6f/qXyJlSw3XAnKIlFW8RJqMasTOGUBtMk
         1W7gwd1yaySKTtgx/XT5d2km25LGxLTXJNy3RfNmTwpgtynnvTPXmvLuFLdTynsQayOH
         MGCJnkZ/UJIjPdf+/A7j9caRPnYS2K8Q0PkaQiSec0g9gohJR+f8cu1iOjHfpnfTvZmE
         T/WHqtNoj1RIeTtLn58osfjDZQzdXBgh9uTKjLmiEdIL2xVR4MxBmW/IYbxEV8YyFBhO
         dCfny0Uuh0uLd1SMc9AJDtRmI8DRQecenMMpWld3aflnVcW0V0NhHkQwMqrAly+XWQLZ
         QwNw==
X-Gm-Message-State: AOJu0YzOmqhPq8nkNd/OLLLfBgzw/xl6vjnT4Z+RtjI+w4doVOQTlMOs
	SDoiG5RNmk09OcllsHAdTCknAaT+5wMTh2Fz5dIw8RHpHOgUzdf+P6Sc8heL5S4mKIE=
X-Gm-Gg: AY/fxX6+1/1DYXBaP4eZqBhS9nuv0SFnS2Dkm36ojK5b8KX5cS2uhnVLNgEA9REtYni
	tyDldUA5EZulaFCp4RRwI50C1/iv1XixG2oA/wbuKg7yZgCkXxWXV/PDUe3hjQafnjX7WbNjopD
	6kFqIKNFyfJReXM+XycevpNX6i8QkPwPABjsuHL+C3UbH5TSYrp3639xn7zliP0xKuPkvRlodHg
	dqGncI1klyTnGPtY1xoto6SATF31Ztv7ZoDdGT5pwYf1W9VpvOoevTEPJQ7Nd58H8wajOj0o0Ei
	psE2dP7WsE7Xjq7wTuRq/AAYS18xb0MVIuG7ynJ4ujo74/AxqyJD2qLAaXyyjmApIt0Kqav5C1/
	hmHDh6dYfw3o9orQ3gGopQa1hort7U0W+D1Q3kGB/zPEPG1/OjS8VSwzB74ZlEhL6mjF+Q3iJPZ
	+/uqz9liSs99TYUXoK
X-Google-Smtp-Source: AGHT+IHT8VjWMJ5Rzt6/g2IIlWMwlHfMloJNg8k85JHX1D4CqQQ3AYqCTokG+u+U2mL3ZC97mPnI+A==
X-Received: by 2002:a05:620a:4096:b0:8b8:7f8d:c33d with SMTP id af79cd13be357-8c37f54eb44mr3088215685a.45.1768229616536;
        Mon, 12 Jan 2026 06:53:36 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53c422sm1585790285a.46.2026.01.12.06.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:53:36 -0800 (PST)
Message-ID: <b30ca585bf401a3f68316afa8c217ff7130e0af3.camel@linaro.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos: gs101: add cmu_dpu and
 sysreg_dpu dt nodes
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Mon, 12 Jan 2026 14:54:14 +0000
In-Reply-To: <20260112-dpu-clocks-v2-5-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-5-bd00903fdeb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_065338_508519_B4A9DF87 
X-CRM114-Status: UNSURE (   9.81  )
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

On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> Enable the cmu_dpu clock management unit. It feeds some of the display
> IPs. Additionally add the sysreg_dpu node which contains the
> BUSCOMPONENT_DRCG_EN and MEMCLK registers required by cmu_dpu to enable
> dynamic root clock gating of bus components.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 17 +++++++++++++++++
> =C2=A01 file changed, 17 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


