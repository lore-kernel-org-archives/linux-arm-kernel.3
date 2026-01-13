Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F56D29DEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3aLnsBMqI01ig7SW8ryw/EZMSWS5ROTkw8/sofKnPg=; b=tQu52JoDS//bArao2s0El2kh0e
	GcQXSxpBGJkNKzi+CR3mDW4fXod5FL+qTT/bAmFz42EbmZN3Vm3buaHCFj1NhBp4zA9+ncJhxwQCY
	YiSi3dfjlqvyPJT1xi8+vmD+8t9VVia4RL1Nnggnj0a5Vod52z1m1AszZOaHCdOKGBlZfWfsU8YPN
	czToR8N6QW4dU7z8FWsTVS59a7aswB8vpypMuziKppukoxxzjXlIVgOG9kc8KrAfATbdfapVTWAMx
	ZSnB/ecCGjbmZkjFnrDEilFrBvof89D4y3/yRNJcwY+IW8xxyZn0YH7oIcgwRlwtSr7eZAwt7mCRo
	jZH/85Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaDX-00000006mkh-2hg1;
	Tue, 13 Jan 2026 08:57:35 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaDV-00000006mjx-3lnx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 08:57:34 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-11f42e97229so11575637c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768294653; x=1768899453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3aLnsBMqI01ig7SW8ryw/EZMSWS5ROTkw8/sofKnPg=;
        b=EvbJy67EHm24cM+2GyscLqeKpcHMZyqpV2Pm8lkehbwSqiZL3PaPboVtZis8LLSs5D
         l11kQx9+LaMnwEtg249oDUxPzNqQLRTV9/71YCjcC3J9CGoD4ult0DZFhFvtQHTapArd
         TJZkVvTmN0VHw9hJGOL+jefewbTJXsoa+eirIOqP1u+RHaxO85RWciEIc+Y22VFwJ9T2
         yxXo8W7URWvW7rDZhfuLLHt2n+GOUL0M7dQFZct2doPy/JU2N+lJz1EtN4HJyBqOpw9Y
         m0MfWQaICUCJu9JX1xxZgB+i7uguwUozyXTrqrNqcm7G+h9wqenw7ImbK+1q1bk9KYKv
         Qdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294653; x=1768899453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z3aLnsBMqI01ig7SW8ryw/EZMSWS5ROTkw8/sofKnPg=;
        b=Wap150fL66mtc4orJen/nz4Mzi9IIcOElqvzV7mdwju+GVG1GoV2Lwo881WlJWiPqU
         a9X0quZSoGZLxO3ZdLXINNI4dqPicH4TzDIa8Da9Y20Yi2OMvadiHQGFocLwqS9G2M34
         +DoGkIYVHSRU1jTdiebEgX4u5dqg/dBJ60YXP2aaJ3PNG+JtkgzaU2h6TuaRPXxbWoth
         qkLwPk8+FC9/XtLzVZ9pfcGPwsaChKLT9WKusiRzpcocL1JzOwTmedpZjnTxqb3pRYCB
         lp3mXIwRpYQmGAFI+yuVmw4f0+POWDOhLmW8gROTUpDbm+AtVO98HwyXXf5gm5pQ4bR3
         u49w==
X-Forwarded-Encrypted: i=1; AJvYcCVyR7YzzJquPlRYq+rTUANKkaRFj0Vdhm3zZ9oIWs1wt39MUwpPlbVxM6ymQ7haYHb+GXlQoh76rj461SLbybNd@lists.infradead.org
X-Gm-Message-State: AOJu0YzSkSjvUYmcldZIyhgVfMH3JqFa56ppTuUSNo1alkSTCFcI3LUX
	b1KxRQjDvaM6wvmQg5e18C0zivnqCssRGh/Q9QCTB4OLpnjRllST1oFycfJSONe1U95+Xwns4j8
	c1EZjYPPWf81+0emiY6+QX8aV2/RuNA8=
X-Gm-Gg: AY/fxX7JQsBfCBsG7HUhHWL/Ulugy0UuvxtXsN3a8mV3m2Ed1AhgqKolpVw/muMzjMR
	fn8WirbWuIneSmTdeN741ckszZaQZ+dhgQmqLlQSxShl5RsN3j7CKn4qi7T0FFn1GhZgom7XqQ0
	bmaIUhTsXNNzn1zhPxdE/rLfPsFw6HGe/kei164CGPt4vN66picqKNgojznP25xxbnG2AlAN1ty
	zTxGhYgbbaIpW1wVzXb4sFDMC0cDTHMUV1iQciJGLaRMJDXD+OoY85lsmGizsZ5alS6SB3SCFix
	kXm6k0CPNyGWcFtlbifMrlBlATpylw+fGNlKbc4V5xlNY7zCXPFeRRnxOPa7pI2DA0ZkCYnMzsU
	GsQTexgqsAw==
X-Google-Smtp-Source: AGHT+IGmM3x0udx2jF6xiiwxJaTLbY/+mgnqHtLjywrZ5fL93iuUCbplfZKnu6LF3+3HUR+s0JIPBWJA6Z1zKzj+SNQ=
X-Received: by 2002:a05:7022:b89:b0:11b:c1fb:896 with SMTP id
 a92af1059eb24-121f8abb3acmr19422193c88.4.1768294653032; Tue, 13 Jan 2026
 00:57:33 -0800 (PST)
MIME-Version: 1.0
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com> <20260111-imx952-dts-v2-v2-4-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-4-5773fa57e89e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 10:59:59 +0200
X-Gm-Features: AZwV_QhwFp5t77VYOIbQmjoAD6m22-epBN6U6A_kPYCLkLGP8qgHDvodNf2mkP4
Message-ID: <CAEnQRZDy7nbidWqhd8AxV6pHhHYOPw3Cbd8f2ky6YrYs8z4y6A@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] arm64: dts: imx952-evk: Enable UART5
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_005733_939154_411ACC47 
X-CRM114-Status: UNSURE (   7.88  )
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

On Sun, Jan 11, 2026 at 2:43=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Enable UART5 for using Bluetooth.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

