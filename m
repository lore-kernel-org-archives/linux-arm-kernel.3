Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826E6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbqWnfszZO2tpVYAjg9JWbWMTQTT2mkVql/ztM6vVPw=; b=a42EiLn7ayVspgRBwnjxvoS+lI
	snlDPiAyKUxEest1kvsFuzwuMuwaGSiNa88noVxStEUOp736/GsiRbOPcGLG10giw1XOiOdpLSzyF
	sGrnYd5NdZNvhzYEWv5nsWd7r99PN4FFoYTS/wYnAeyS0YIH2WBpc87GY7HjPGcal+OZ2wWY2kSE/
	0O7CklVS1+HmAGeCRSmFMparLFF1PonHEZVRteHC1Uew8GxcB2qnHlI2oRaDzPy9vp9y5Ea4sUVcU
	Qeg3oagKUYoqpV6hvGgiSPErezFofZtAFB1/ppK2LZiifal9pu2/Nxcu2a/x+nZlmR3usRFzNpkbv
	xx2ZTC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6P-0000000EevQ-2wjb;
	Thu, 24 Apr 2025 16:07:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xmg-0000000EQ77-1mdI;
	Thu, 24 Apr 2025 14:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MbqWnfszZO2tpVYAjg9JWbWMTQTT2mkVql/ztM6vVPw=; b=A+ThlWdmwHZbEDLHhYQvPGCfJd
	nw/wKVgjzeMk5a+ihgx24OEKgz7HN48DOjwDUx8LIsPe/sbN98mSEQa6hbof+D9nfGu9eRDEzCbz2
	Z32Mn8nzBFC3iMCcqqnj64+lpgzGQbWIthvTv+69fUNw2nXxa0/5LIYA49oxDh2+0hq0rHEPh/5Kn
	gRA/jM5DT7pShJuGWMvgFwUq9rNMsoGr19ELG1uGYxSA6cMDlx6lADnSXI9XEN772J4CwmF1Yomgr
	34kZKD3P47ek0p80dpBnCWEAUxLS1AZpqsXWCz4XpNxl0b/YD/apipVAaxxSHzD/K1tb+AAlH+rVO
	33k7jvmQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7xmd-0000000BqD1-1R8Q;
	Thu, 24 Apr 2025 14:42:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 500B1A4CE95;
	Thu, 24 Apr 2025 14:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F3EC4CEEC;
	Thu, 24 Apr 2025 14:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745505750;
	bh=MbqWnfszZO2tpVYAjg9JWbWMTQTT2mkVql/ztM6vVPw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S1uCbVrUh4gmgegvzwAZPPVyp6WogO8Mt/f7cUv01bi7CqeCaeYlAtzZeDEO4C51y
	 LPjnnu7+oxVkI/mfyZU3WX8f+sQD6pGVuhn2uJjNXpS/Qh/h08dtLpUx+hdtFX6Z64
	 LM6zb8VMTXnFmIyl+LnC6kitOtKLSKHU8eTEwLDNUZUdvMRwVkBJvdT0c3EI7pxYuo
	 RRZZlLDpl6Eowie3D0tbeHXG8K0alH44FT70ce6sBbHpzVNbzdoHES7Vo614/GfkuM
	 xD4SbYD44OCpLhAWO1JWfPy9QR1Pirl+wvqLl0oQn7CP9rsK3c1RhOaR0vUPFZA4QT
	 rizAIYDie10qA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so203391066b.1;
        Thu, 24 Apr 2025 07:42:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUC+0W6kVR+x5QIwyJm7QMAYNgnue/2KJmj/1rf0t1g/JiaphNg2tD6N5kD8maGNQv3n+xYmfuJIWHTy5m1@lists.infradead.org, AJvYcCXjzFuvkqNEm8tajv32stTRLxSnkmirHq29qRt/wiWudXxCtSR+21sfs/tkKWqvFq39+7iCkSCVjAtQbYLQY8UxXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0F6i2FVJ22aaaeOr+xUONg0xljwGVdg1rknO7arAQ5Et1E31m
	Plt9ffxlfa3TbzZUiX9+JOSN1SQOYhpS/6+z234TPaNMGxhslibuOvWDl4JofPrbAouS3ZkoW/G
	DcpBqVSPD8mWjYGmcq2rg/11c5w==
X-Google-Smtp-Source: AGHT+IGGFqu0L47CHz2DJ5cIaB7S3hoAageJyJhrGdRr9cOUHUygoaN/XZusHvgN0Jkxp1vNsCp8qBoorCHtV0sHXWs=
X-Received: by 2002:a17:906:7305:b0:acb:b1be:4873 with SMTP id
 a640c23a62f3a-ace570cd13amr312500966b.2.1745505748560; Thu, 24 Apr 2025
 07:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-uart-binding-v1-1-eb0f6d97a654@amlogic.com>
In-Reply-To: <20250424-uart-binding-v1-1-eb0f6d97a654@amlogic.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 24 Apr 2025 09:42:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKD=yespd0WM90VBr_XWdppimzDzecmwNfGMV+hNSHuRA@mail.gmail.com>
X-Gm-Features: ATxdqUHKHPJdWFXmqoM4Bm1TD1_GnaXoZ-XsaWeX2h598TzyyhAIydJNjtK4jps
Message-ID: <CAL_JsqKD=yespd0WM90VBr_XWdppimzDzecmwNfGMV+hNSHuRA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: amlogic,meson-uart: Add compatible
 string for S6/S7/S7D
To: xianwei.zhao@amlogic.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_154235_586306_343FA365 
X-CRM114-Status: GOOD (  12.39  )
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

On Thu, Apr 24, 2025 at 3:43=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Amlogic S6/S7/7D SoCs uses the same UART controller as S4 SoCs and G12A.
> There is no need for an extra compatible line in the driver, but
> add S6/S7/S7D compatible line for documentation.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> This patch has been reviewed in the submission below(patch 4/7).
> https://lore.kernel.org/all/20250317-s6-s7-basic-v1-0-d653384e41f3@amlogi=
c.com/
>
> It is just sent again separately since it goes via the tty tree

The default assumption is a series is applied by 1 maintainer. If you
want maintainers to pick up a patch out of a series, it is best to ask
them in that patch. Or you have to resend like this.

Also, for bindings only adding new compatibles and no driver change,
it is fine for the sub-arch maintainer (Neil) to pick them all up.

Rob

