Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE95D2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9mgi3TL0eDGl2pTGxPI5X6I1yeHKcio4o8DKGeuzng=; b=Xalh1LpABV+zM2WGdSb/Q+pw/6
	tKogEK42sWjpgbiIweKvOe3/lw9ktpu/p1D+v506sS9nbBzlnpbe8lelnm/YaRtvRbRi7BKetc/xr
	DqfQCalUZ0eqwlGqEZiBtlZbWhqg+dfPHJge8D2VifeZ4aPbeOgst1l7i3Hz8yTG+b4R0oh41wo+R
	oBvjw+h5q+TUnte7RcsaXS8H4ZAzCDuMZ5Uznck/0lzpDOAUe8Y8FQi7WDHZSMQFnhdGPP64NaUlL
	svcnXOaXViw/Hr8WZIXSKhKtPeltbWf1Th3dI3HIsFE7cj+DC28FGAlbi5OKA46ZHVUGPkL01OcPw
	vmJBoKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viC0l-00000003vVt-3GuN;
	Tue, 20 Jan 2026 13:43:11 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viC0j-00000003vV5-052U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 13:43:10 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-123320591a4so5358171c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 05:43:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768916588; cv=none;
        d=google.com; s=arc-20240605;
        b=QjhZoS2dtA6B758RRX3ZKAd5ZP+dZ1mkTHTb5ZAiog2P7R432wR2P3NmjKXlTmthNv
         hcX8+jt/3BZsdcuwD/wWnokg2Wax37vbBAvW0XeApSvveTOupjy8Ew8OGTe9oo5cXeCs
         1IQj5gNcvBcSHVoj4yQMV//ac+xkzWbTiETcQc8I1VdhvpprOl5bul8UqJKXydQWCqZO
         qAlSk5Y6zAU9rHH/9F+y/8LZhluRuBCFgu/iMvqal3GCKDKtPYrYPo1B/pQmSLySexyG
         97I/8OB6suc5eiMWxUPYXmTaxE1LjKkQKVapA5ynEr0qM3UiV+HLVBrKv4s6L/S+IhBi
         /q/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x9mgi3TL0eDGl2pTGxPI5X6I1yeHKcio4o8DKGeuzng=;
        fh=vbwaOKuN9g8CpaITK9zSdmz+cjkP3DxP+JYpD3rS35I=;
        b=Sb8Mz5LNq1kCvCyHF6odU4ZseoEG0QvPuN56H9bbLmBZUNyjYO+On/UGLF8IzoaCxV
         ys4TVav5n4bsOhWgfORhAM0w+385yo1q7w2G+Ejlzclm6HmSUV7DQi6gJg/atuFoMDSj
         XuAQgkzlCUYixCClV11huHgYd/EC1l5dR5abqWRJuGqKHm87yVblSiP8reBJQE4O8fur
         /+dztTL8nmY0rY6L+y9mDxocaBPHlmIJuc9QJQsDr2vKAWf03q0TJnMlRXeuB5NPNTnW
         BFZ/VF0IxY2zglK3ihq1OIf/lggKG74xb6JuOLzh0q5Vd+sGQj90Nl3oCrqHgYwBpL0C
         MTHw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768916588; x=1769521388; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9mgi3TL0eDGl2pTGxPI5X6I1yeHKcio4o8DKGeuzng=;
        b=mGmQ5xdxidXASJCkqDcwdvrKEuONl/IA47mUqTRDLKWq7Q0OXbDdSyNAuEIdBWlw7C
         k2atNFVgJR8OCD83EOJGcfUZqR2g6LIbMCcies0XJ2XM1BMmxRUjb6btg2N7Wwliobi2
         4+Zzi6d+Zwhad/JABnRbtSUNG25lp2+gxrYls983AnyRblqH6jbsanU6IvFp7KcIcy0E
         G/5zHTxP/ltmYTcFi+i2eQECCmrOZ80Nt8fWakqiAFm/jOgApuT1ZYbR7jRNcIbnAuXa
         4M22TXgm7x7hUCvuvB43R6czqa65s882m4xkvTKgCZGWl9UTfg30wMM3H7FRJFS2eHFj
         ks0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916588; x=1769521388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x9mgi3TL0eDGl2pTGxPI5X6I1yeHKcio4o8DKGeuzng=;
        b=JPrIPd9By/U6X1AVLuERVqlXFlg9DkjZRS2uhtqF0WxQhsPybs8i7Lt1wjMoMtrTMf
         JfHce3O1pfhigUNiYprA1+KeGbQ+v5twKiGkaIAKy/ONDsWsCUPrIW6tGhH93/4IgfnJ
         ycywr/9160m0ho/0ufLsb3OMmjm//mmqQuRma7wk+0Dneg+1xlsqeDK7W7ZPADd+hrEU
         rgJuXb6jF4IURwLNTcHrbTzLNCIkxkAvl997ub9Awv6CykYtMSpJbjTl7YQdE/gZfv6O
         w4tnPgyKmUHxC9TFvgg24T6oCFSzzORRT4A7Z9jqiOzBzspgYlgK+ga46QWBu6UBBMNK
         Wazw==
X-Forwarded-Encrypted: i=1; AJvYcCXeaw0Ka+rRrilfb2j6aR8C0PCFFuoCPIBaOFRn3GlTh37LqeqQeeLzZY8K23WVRBC0+uZRlfijvsGWeXEjRHlL@lists.infradead.org
X-Gm-Message-State: AOJu0YwD/I3glBWeZDQig+CLL/ZLu3OQnHcbc1qJmJtk9AmDvv2NS0kk
	RJ1c1agD4lTYbvHuASMep33JN/9FmGaFd1lFCWidI3P+GFzilHINk9VCXUgXQ+HsFt+ORRQAAzS
	tXvDryOS+whxkV7ZWPyt4vhM+eKRuU48=
X-Gm-Gg: AY/fxX5jma+FOkZclERQMFuoPyhtKjnD2aE6mKgYyrHeEc76JrXHVdqNGMNAYISiQdf
	isFPydS+JWW8qHaauUy+UTfc9OZ9YsyA4M07w1DJBPg19mG+KY8Dhjxz/ZbFqI7IU/vSHeNZGtR
	brZw8GgUYhApYG8AutNqYXAJB1JfWOvFNX9X0TaBRhwKagncHxkH7zLFxVSIO29yCR3TEiXcExP
	aTbxIivzEr7DQ3aJuTpFHq2IshXO8xgmdrpUHfznMEwyV6nwPajSuM9rZXdmWaxtHUEhfzcm5g9
	M231Mh4DZ2Wkwjkx+aZsJfsKfb2Af4D1sLQ6jPNNqJNccrLG8AFOcUUQZ1GgiyJrw1Dd344TvXA
	jFl/pUPj08w==
X-Received: by 2002:a05:7022:6b8c:b0:119:e56c:18a6 with SMTP id
 a92af1059eb24-1244a7257a4mr10880097c88.14.1768916586232; Tue, 20 Jan 2026
 05:43:06 -0800 (PST)
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-11-khristineandreea.barbulescu@oss.nxp.com> <CAMRc=McD0cRxtb3RCzzYPewFisto=4OjvA4gjaTcOk8ghTw_qA@mail.gmail.com>
In-Reply-To: <CAMRc=McD0cRxtb3RCzzYPewFisto=4OjvA4gjaTcOk8ghTw_qA@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 20 Jan 2026 15:45:46 +0200
X-Gm-Features: AZwV_QiPrjYIgkrWuZvZ77hO6EmYEBB8e53YvqXAvD3NoIb32l_6NmOignEguN0
Message-ID: <CAEnQRZBNKBpwhO2Pr9Gb4cPPBwXf0bMYRuQzshCMJgOkOJEKVg@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] pinctrl: s32cc: set num_custom_params to 0
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_054309_066990_B56C4FAB 
X-CRM114-Status: GOOD (  14.47  )
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

On Tue, Jan 20, 2026 at 2:26=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 20 Jan 2026 12:59:22 +0100, Khristine Andreea Barbulescu
> <khristineandreea.barbulescu@oss.nxp.com> said:
> > From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> >
> > The `num_custom_params` was not set to 0 and the pinctrl_desc structure
> > was not initialized with 0. This would result in errors when parsing
> > pinconf properties from the device tree.
> >
>
> Shoudn't this come as first in the series and with a Fixes tag?

Hi Khristine,

The entire series could use a better patch reordering to arrange the
code as follows:

* Bug fixes
* Code refactorization or API changes
* Device tree bindings
* Driver implementation
* DTS changes

