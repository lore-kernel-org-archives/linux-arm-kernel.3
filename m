Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068FDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9OqEDY3JEcssGMHTHMMKW2DIA2hSwtYUS+Auc8BG6o=; b=PyxpVwx2BfdGRoivFv2USoSCT+
	zyIPApRYqv9OYgrFICS9p9AmTRjXyoJhCgFIIHBgDn1EWhn8HVYchPpLWs6Sj1DxrqBeB7oRP24Qo
	6Rbi5xEQK33I1xQWfmuIhBa9AnWG+zHTlOt++tIeWOC3qaSD0r7YLbtyUfXyGLWmKSyYbMvYT5Lvl
	SMkUOmayS1B4x/t1zJtbHDzRk/gB0X3SRfgHnfR9nT5tB8gAeawJHVXnfX1bG4yBLMEOYxJoKm4zx
	b6kVvAA3Oz7+EiYdb2Eody8Izs4Zv0XcoPpQ2cxAIREjfyu26E1KELPNHkKmy/EJPLltvun8IxcFX
	JUXD3bRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aQ8-00000004kR1-19SI;
	Tue, 15 Apr 2025 07:09:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aBh-00000004iL1-3gRV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 06:54:33 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-301302a328bso5066323a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 23:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744700068; x=1745304868; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9OqEDY3JEcssGMHTHMMKW2DIA2hSwtYUS+Auc8BG6o=;
        b=CfpFxfcMO6XEsqEqz6UE9uaNHzCXBQmAGKsYYg3EzYDPnUPIwrDwMOe2bEZU9wh7ZH
         IbBSpLpFmYxkUJ5lpq9bNmwmefn/hk+NcHMWsdRdyhb/wM7Su6hZnbLXNaygKt8kFDtT
         G9YMccrKb8tagxQ5/yyD3uGfNRlHHI8xcxoQU8ajZ/py6GiJdB9IYmtEEAw7qNsQvgWv
         LCX+hMnH8OiHcbR9Qv8fJ+Tp86lHMpxHVkiWC9nTOtn83Ksjq6k+jMebx3zEpOsk0ybT
         BaXjY/ET4Bq7nn+CJnrkX/MzknUQPK8YsdIa7yIUObevi++ZPkb3y3rxRQcj2ERvJYAS
         yn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700068; x=1745304868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9OqEDY3JEcssGMHTHMMKW2DIA2hSwtYUS+Auc8BG6o=;
        b=MEdeqC5LfkxmxDzAUwVjyeun4hX/Cr7/Fx5/gqTnz5WP62+12X4Yq51C5CPN2K9o90
         RYS/6S3yR3GJl3vOnco24t0XMolc28CH0dp6oqdw7OyfKwOqDcipBFGTn9yvZtuGG96V
         la30+vLW1ChLwBCjLSReawOBCGFKGLcmLY8BwrsFFTG2o+WuqkhAvab7pzLAJUP6SKzk
         eAxOskl8s7mG1QxIwv6Uj0onYvwqKiKUC1gWU1Q9OqvS7Wq5FF3fFbKJvmDUR5sYY6Dx
         lYfpVHQHw1m2VCns5dr1TSXMMAysgEMWcSKsZ59DvI8L+0O9aNaNiXvM5xXSbnUAPv7y
         TQNw==
X-Forwarded-Encrypted: i=1; AJvYcCXjnzxYCVHZjy0AJhCk2M2QfppYFYioE7CnNLPBrtPgbl5bvTqdBVUGV1mZAC9Rt1RxoTh34hdn0eBRNiz+9mfI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2ixLD91xzYfsf5sG+TkYiFbT0+bmiblu/XdqNUEq+1KlC6TWK
	026tEWy3viIhhcyfLFt7ixIymcXs3lwiEdvg0CYW1ROq7gzvsLSLxJoGrcFHjAl2VLCAvsL+g+S
	mDtm/93s/905O+gbdnWhbwYV6FTU=
X-Gm-Gg: ASbGnctWXezWsF10FFHWKMRpP4qU1SpAxudESiUB0PHh7k6co1xK4jk8oJlTaGmdulO
	7A7Bct5/lwCYuMYYmdwh4hffC3byhDxQdNUVis2h5WpBIXkkojsNAvplEiaAKYRpXy9cuqSW1+b
	DvYL/zPHmZtpa1CCKaUA==
X-Google-Smtp-Source: AGHT+IGsWWhYe9e4mWSJsic/j7kKIeW7DfXwjL4Jb4i7m9zXmuDIJPuuX3HEnkVvhnsbqUdqK2dIfJphOjrZOmuAgmI=
X-Received: by 2002:a17:90b:2811:b0:2ee:c291:765a with SMTP id
 98e67ed59e1d1-30823639c94mr21764256a91.8.1744700068456; Mon, 14 Apr 2025
 23:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250414123827.428339-1-ivitro@gmail.com> <20250414123827.428339-3-ivitro@gmail.com>
In-Reply-To: <20250414123827.428339-3-ivitro@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Apr 2025 09:56:14 +0300
X-Gm-Features: ATxdqUGxqJNdcd-JZaoJQzqSGgpBMKry2SLqzTD77e0YfcWpcDRWqQ9RF6-oALY
Message-ID: <CAEnQRZBt7mgi2ep8j5U=8DWA+KfO_nGfczXrSxAy_HaSeGNTMA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add Toradex SMARC iMX8MP
To: Vitor Soares <ivitro@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vitor Soares <vitor.soares@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_235429_950962_1154B318 
X-CRM114-Status: UNSURE (   8.85  )
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

On Mon, Apr 14, 2025 at 3:39=E2=80=AFPM Vitor Soares <ivitro@gmail.com> wro=
te:
>
> From: Vitor Soares <vitor.soares@toradex.com>
>
> Add DT support for Toradex SMARC iMX8MP SoM and Toradex SMARC Development
> carrier board.
>
> Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-im=
x-8m-plus
> Link: https://www.toradex.com/products/carrier-board/smarc-development-bo=
ard-kit
> Co-developed-by: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Audio part looks good to me.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

