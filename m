Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F55C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZ/QbTWZNshBxb5hC06ZzjWtL5HiviO0RmZtIpOJ43M=; b=jwESZvIHR7D3RgIPNyX3tLfgw7
	FgXfGz4XymCbM/qGr6ZHulpMYGYlqPPQKGwIvLYIhzL4OFxos5q46VlyMi1IBJYKVxYzyBZeLMt37
	KQdvnBK5jRu7sGgtVEKZBhQRDP+dnIS56vGfn1NXXRuiTeVxEMOhPBY4YrgHzRoziJZxqAVUkGZdx
	8qWDdkoSGxsWgKIqxidpm4l0flYG4ozM2Tcb85zWr6uHnfPil02farimHPf9RC8c5vhiU9IO87Du8
	6nvQMTZ1LijnRb1zR2uWiRV3KT7qEQFJZt4cREGcs46UkQyaf8ocB5xvce945cXFR6nR2GWjkEPLV
	ADmP2XcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJPI-00000004KI9-1eJu;
	Wed, 26 Feb 2025 15:33:08 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJMn-00000004JhW-0Cmx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 15:30:34 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2fcb6c42c47so10761936a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 07:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740583832; x=1741188632; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ/QbTWZNshBxb5hC06ZzjWtL5HiviO0RmZtIpOJ43M=;
        b=j0P/FOhnqVKLcvcugiY6DkquM4Xisrm7oTyLbkcxd416IeWbGh4Fsqva3w4pThai5E
         CwDrE7B9e7D20R/rxnPhGB2cQdGc7A8+3EhckzpGQlmwlJ2Hil2vfKLNgtOOnt7HFX1S
         DN5QEhWL1XXAcgL+N3AurR16Lh07DEIoJLzyf+ZakDmZRbAPyvqFwaP3nyE7Jq0dLvep
         X8sHSngMt7A5C4TPH1MWqLmxyguii5BEFEIaHjTxx0AR3Jh8PZPAUF6flKtEosVJeuwP
         WmofriDs3hICF1pSaoujlRD/8mWCkuYmbMcw/TqNaWHKg6uedIWMdsrw0PphqSFVywbx
         EKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740583832; x=1741188632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZ/QbTWZNshBxb5hC06ZzjWtL5HiviO0RmZtIpOJ43M=;
        b=cQJqZuepryfMTJUYD8NBRficHH8xhVbh0qK5yoiuM42jULeLXv+NyneWDr8U3zqnj6
         P36cmSRNqFo55a3lQNEsc5Pt2FZ61vJEGV8LyoZRzNL7rmLPqVF13YEhop90D5h78Mk1
         jy9MdZFfhQm2u30/JJM3qnJu2UfD7cCYIJN++xyO6Ec7UttrPiWuhGY+k/QpL/b64moR
         ZUHVLwMykPN7Db29iAuNvO/z3wQUr/Zej4OAWSBP6nffA8OSgVhhPbXOFpfAaItnOVgw
         js3Gi4Dh4m8P8WTCUSSgprTa8QCOyUTZ585iUcldk0kIR3BsUvRVO1uhlrUPGPNIdXd3
         33Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVwf0oocpEbs8ubsd0bXcTQRU7tbo60t7WSEzz4uROayC+jtufWeLkLGB2LFVi+JZ/ebodswnF+EC7LGpc3Q31v@lists.infradead.org
X-Gm-Message-State: AOJu0YxDL6GLxvESk8ImL+yimWf+Tr5cnj8/QQ3v3AXQe/KPDq76wBp/
	QfADCv1rxRH9d5p49jKfI5bNGSBlzjbM6j3D9mUKAnyTNBrIJzPZkWUhL/o0xXt3B8tjvrOM0Wn
	d2HZNdc9qdV/jfQN3X9Vk34L96Yc=
X-Gm-Gg: ASbGncsgT8P5VMmCgAhasy0Xno7hCWwGRm3Hw57N75yiN3fxZsnZ2u/maGH3f0M3Kyj
	EowjD289D7ra3fvLKGPf5KJKQuqymHSuw2pDSI//o+tsFvVqjBUuM37HU1kQ0wj2f51QqKVriiJ
	hEUKGv
X-Google-Smtp-Source: AGHT+IFo6DOoGnTsS38LlUXMIhC0H9EtIGCJVFbM5Bu56nEtT839xcPAHtRDebmakeB9TC+KDHHS0qohqRpYH+q6d2s=
X-Received: by 2002:a17:90a:c2c7:b0:2ee:e113:815d with SMTP id
 98e67ed59e1d1-2fe68ada148mr12284035a91.8.1740583831681; Wed, 26 Feb 2025
 07:30:31 -0800 (PST)
MIME-Version: 1.0
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com> <20250226-initial_display-v2-4-23fafa130817@gocontroll.com>
In-Reply-To: <20250226-initial_display-v2-4-23fafa130817@gocontroll.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 26 Feb 2025 17:32:08 +0200
X-Gm-Features: AWEUYZnVDiZ00SedBZ6EyKd9EOM22xcDBV6m1uAzMRnVUY2vdD1K52vvrRAuSvo
Message-ID: <CAEnQRZDXxuviih+o-iFOtiS6j8=JqnhUOHaZf3RhGL++fg=moA@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] arm64: dts: imx8mp: Add pinctrl config definitions
To: maudspierings@gocontroll.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_073033_092914_133938E3 
X-CRM114-Status: GOOD (  18.44  )
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

On Wed, Feb 26, 2025 at 4:23=E2=80=AFPM Maud Spierings via B4 Relay
<devnull+maudspierings.gocontroll.com@kernel.org> wrote:
>
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
> register is written in the dts, these values are not obvious. Add defines
> which describe the fields of this register which can be or-ed together to
> produce readable settings.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
> This patch has already been sent in a different group of patches: [1]
> It was requested there to submit it along with a user, this series also
> includes some users for it.
>
> [1]: https://lore.kernel.org/all/20250218-pinctrl_defines-v2-2-c554cad0e1=
d2@gocontroll.com/
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/=
boot/dts/freescale/imx8mp-pinfunc.h
> index 0fef066471ba607be02d0ab15da5a048a8a213a7..0927ed11ec687d5b273c4a4a6=
455e8d81468f676 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> @@ -6,6 +6,33 @@
>  #ifndef __DTS_IMX8MP_PINFUNC_H
>  #define __DTS_IMX8MP_PINFUNC_H
>
> +//Drive Strength

Please use C-style comments /* .. */

