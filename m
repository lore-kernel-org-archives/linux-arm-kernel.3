Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044E8CF857B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 10:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrOk2bm03bUPngyIHoBKhcf9gFSNhp+zCbFH+3YDqpg=; b=r75pdTr6/zZJk1r6wRwhR/FNMm
	opiqWI8ZQinJpU4pXLSdPhkkGR52h9xymoCnMWqWwnp4SbBB5Nx0nqFfichqe9N/QNQTWhdnoVayW
	CkzaVIGLgil6wO63gmUkXRRBsXpT0jPw3oV0idclBRpkBYJHc2wK1nowXsS7B3uSpVxD/ZEx594kY
	M6FUNsZ1EUTzojY1pGcM3SVc0PrQL8hz6oXxcn8MXOAoni5sZEeYp5SuiPR943u3XNRfnMDqRH5L8
	dHFmu2vHFTpzOdsZoR16aW7qwH+SIn0UlKUNqwG0WgFOxiusqKPIEsaNRzu0Y6kcOTQ+LYl0h7pzi
	HLBXXrrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1Wd-00000006TYh-468B;
	Thu, 20 Nov 2025 10:04:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1Wb-00000006TYB-04cB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 10:04:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47796a837c7so4313435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 02:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763633063; x=1764237863; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DrOk2bm03bUPngyIHoBKhcf9gFSNhp+zCbFH+3YDqpg=;
        b=fxjKLPQCWcvA2gZqDAAFt9FgONDToyWlgOaAaxz8FEyM4DX8YRIznBmGQT6fyh1wuK
         TWw5GjVRoPKv+1EtcOENIKFpwBlflWG83YzR9mlx2VsdRXZtzW2QbHC3PVQ9Oixtzf4Y
         1qx3cup2QpNy4pHETqTY/wKt8CTJVX7668iRUaOORlxt89bohMlDLC+RT4Bd9Ef8YenH
         +1A2WcG70Za/FHTgfWeTF1HCO4Vii1qy5OxEIaSzIhQ0lNKrWOLK0807rfuIclk5S9bI
         zWtTV+BtecKRA0IWMBIsB8fTgQtFUJWmnyy+liqBo70W9QUECbbbwF5UzcRM9/D0WRTK
         MNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763633063; x=1764237863;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrOk2bm03bUPngyIHoBKhcf9gFSNhp+zCbFH+3YDqpg=;
        b=G6XtgiqzvTlGV5aQfudr+xPiafXSD+YLRJoxpOu1TiioDL6pEC+SUx2yApkf6QhSxw
         LZ8rNW8+0C0d50kW+lqgL4V4yNAGJdw2yXbOha4benMmMjWyI4dNUevB/4fEgqRoUjM+
         8W//T7ztN+NInT67YSMAhF7cHQLhoR9TJzy9tW8goWzwU09oGFyQk8siVrBZaouh7vTv
         3031sl/IAl1STMggTvCDH2zR5ZRENlBltImzzIMb0yIuMMnqI8syi1fkRKUc/QYnBF0f
         6VxBdcPymvyXP+wLYExV14BySbFHNUcUfiQx4XjyQq6Lbp5CDIvzWRUDPqgU0sil1hZy
         XeTA==
X-Forwarded-Encrypted: i=1; AJvYcCVajUq6t7pXrEVTiT3J+VqGGzDTFQRHs3yFFjQeFb1JZ+lZDdG9yyEmEM4I8znFweMX5xac19dFFkIOS9+ZKxP6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs1luJe0RJ7dpV6NjgLo2iBhfFo9CP78EqvtrPiKAUNWfArEBv
	R0ifNnh+fOeCdOIJP0s5HlmJJ5DEpftdMCyUbKwNrhgSUfOjgO0EtRPCPjxH1mjJ2kA=
X-Gm-Gg: ASbGncvIM40nTgZxvg9vmNU6rw8xRgDEyCWrCnx8YchsgoUhQT8T4hlS5rAKJBQImEe
	/IyIZ8doAL4i+nvv7XEoNosAAPaNcqW0048F+nNuLlf7Ri7+xPKkdwX2c8SGVZ7j9vMgMsf2qNt
	b4qkK64NsHAfzp65dZQxlv/IFPa0PFK8hAhXMzaO3Ar/x7Ly6oYiuGourGEHmDZRY/+ij6j1qr8
	x9cjp3xc4YsxdrA76Fn1pxn6ziyt9rsobjBPxrlyRGBhuPke39oOFrmSsvdYJOf5IsBcXzhXf1W
	ar6dEm4coLoNvH+YbbL74BQqsu3mLl8E7knADs96yEYlFh1Jfcpj2KOV1CrIGLpW2q3B6nihetE
	f9qnRCxM3NJnO93cckR8QS96pOmz+29vSIKnrelhmiRaKThaNGiGicJtA2Z23Zy6xzVaeJeAOep
	4KS91O/JU8ViG9gJtE
X-Google-Smtp-Source: AGHT+IHrm5EaKYpV2W1s8pc4aTiYKHHkbeiQA9rV3WdkFR1VnTT0ZyX40PvNC5BuFfhZRUT8Fz32TQ==
X-Received: by 2002:a05:600c:458e:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-477bac0cfb5mr16019325e9.16.1763633062818;
        Thu, 20 Nov 2025 02:04:22 -0800 (PST)
Received: from salami.lan ([212.129.72.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9739964sm63387065e9.1.2025.11.20.02.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:04:22 -0800 (PST)
Message-ID: <b9f4103d8de37574a116164c50ac7e1bd09be80d.camel@linaro.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 kernel-team@android.com
Date: Thu, 20 Nov 2025 10:04:20 +0000
In-Reply-To: <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
	 <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_020425_097029_360A91F9 
X-CRM114-Status: GOOD (  13.65  )
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

On Fri, 2025-11-14 at 14:16 +0000, Peter Griffin wrote:
> Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
> The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> bus components and MEMCLK gates the sram clock.
>=20
> Now the clock driver supports automatic clock mode, to fully enable dynam=
ic
> root clock gating it is required to configure these registers. Update the
> bindings documentation so that all CMUs (with the exception of
> gs101-cmu-top) have samsung,sysreg as a required property.
>=20
> Note this is NOT an ABI break, as if the property isn't specified the
> clock driver will fallback to the current behaviour of not initializing
> the registers. The system still boots, but bus components won't benefit
> from dynamic root clock gating and dynamic power will be higher (which ha=
s
> been the case until now anyway).
>=20
> Additionally update the DT example to included the correct CMU size as
> registers in that region are used for automatic clock mode.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v5:
> - Invert the test for google,gs101-cmu-top (Andre)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

