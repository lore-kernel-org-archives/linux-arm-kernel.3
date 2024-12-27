Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2F5E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 08:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVcsrmKwkxIKz+eCCIw3WHKCv/X66XMcWh6vJ2SRqGw=; b=yVWTt/sUnpCtlCxA9zJZT5w/ln
	Gjv1uXKldqzCsPIbG1+N++95mW0hA1Rn8u7j40Mwm+r4mo3itMSueeI6CJoslbjeKoLMYraMaJl/p
	QYaDyb0XD3WXoPmBLN4w6i8FNNsthNbKhOf7GQZKsNXc+FrLA41ndLrjPqhgXMGoXhxJqn70Sb6+y
	xMZWs2osEU1yn6TFp43uj8ncQX2w/S2wKzWnAf8jLwRsZX+3Kpzr5ILB5S4wlS5tNMTbcg40m8VBh
	YLKxhk0FhFuxL2UnY+lmQhQfcnGozd5YFieWERBpa9ea9w6ZOEtod1/648MgangkJntPalDEQHuac
	9ocBsPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5eD-0000000HMaB-0XU5;
	Fri, 27 Dec 2024 08:24:41 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5d1-0000000HMT2-08XM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 08:23:29 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so7589334e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 00:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735287805; x=1735892605; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVcsrmKwkxIKz+eCCIw3WHKCv/X66XMcWh6vJ2SRqGw=;
        b=bAFbxPpXRb0LF9laWfrIJnb9S/T5T2WRc7k6fm4b6RENrdLUbb6k+UnJy5dmrw8zw7
         JpJVBgIxqC93V3FtJCfY7wME4dtR3psOd9y2A8YbwWzCDHGuFnCw9qT3D3992ws3H7on
         BFVsOCWyfreezeu5pOPpBSeDZjwI37dvPi8KqPMzkocHRYMbHY4HQvxngDb0woOBuf3s
         lgMnslu67Y+m5PntmcnJHw0nmWRzw78qA+BqPZGTDFT4mvhzKq0bVFgkXSpKcFGG0jFC
         gEfa5hqf5b1P1XeW4jWhh3or2rHKp+xz6sI5dRNHm1eUSP30ZCyiqyqaKENdvevEU4R+
         KdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735287805; x=1735892605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVcsrmKwkxIKz+eCCIw3WHKCv/X66XMcWh6vJ2SRqGw=;
        b=sX2OfBsbCkbnR4mnsthUs/YqW5la5o2e8AVndLa7a2EbxzUYi16erwpZo+Zxejtz05
         +OVOI+X3MF2GFlsfm3pyYgfKl73Lz+O7g/59QdjcOjqPdr8eShQt+zRXf8Nr7tFpzeEv
         yVGsYkqNZjlTCtjX5DvtpiiH+xlCW1/If9wzqUvCqYmJmOA8ulN/NEo87bZmoMv+8IhH
         JhTXG8tdPrS4dXwh73UffGI3pS7Md0LmNIk9YorhmcHjp/efrS9wBB2tXd+VKDazL6JD
         BbFEtsB/+SppbSklrgNEtIGGHt7Qa3fLj0YOmrCcK53O2127m8KyGJNUGlLueKWOldEB
         Fb7A==
X-Forwarded-Encrypted: i=1; AJvYcCVTyto19dBfeX+UegroLDVpZh4d9JUKtvgoVf9MN0upYA4jZLlSGzfuDBcAOokZi/09lXjKSBdet7SymlNQBi+1@lists.infradead.org
X-Gm-Message-State: AOJu0YwKfSvR6ZS6CMG9aK5VKzLvVPLElPsRl6T+wyvh9rrNIe/xC7aD
	U/XTF9/2BRCogd5ZPN0+HMtl/LW0v+7CkTuWv86BdVaFN7+f9uenLJFN2iXir1HCdGjILZsoVGc
	eam4M8X4XYhtlhkfI1jl9LahczxxKv/+8+IT6pg==
X-Gm-Gg: ASbGncueCCx6RFeuwIdYCBT92cbHWjAul1w5jYBRmCBoGl9bNiijJpLMBM2L5Rloyyp
	esJW+xxDndygBpAxRg5UqwY2eMeeOY6ukusKE
X-Google-Smtp-Source: AGHT+IFYIOklSZ9sJMM5TQ3zMjDwQ23DBG0sFeGBh5tQkGSxcVbvZSf9AiFrryAVoUGw4Nv3w5+5ALeURj3MiEoam9I=
X-Received: by 2002:a05:6512:1283:b0:53e:2f9d:6a7a with SMTP id
 2adb3069b0e04-54229562a50mr6753089e87.46.1735287805076; Fri, 27 Dec 2024
 00:23:25 -0800 (PST)
MIME-Version: 1.0
References: <20241217085435.9586-1-linux@fw-web.de>
In-Reply-To: <20241217085435.9586-1-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 09:23:13 +0100
Message-ID: <CACRpkdakCrw3v=iEq_chxxhcEaUipqhyPA2GDZ9gp3tMTbuWBg@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Add pinctrl support for mt7988
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_002327_086237_CB05F11D 
X-CRM114-Status: GOOD (  11.05  )
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

On Tue, Dec 17, 2024 at 9:54=E2=80=AFAM Frank Wunderlich <linux@fw-web.de> =
wrote:

> This series adds pinctrl driver, dt-bindings and dts node for pinctrl
> on mediatek mt7988 SoC.
(...)
> Daniel Golle (2):
>   pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
>   pinctrl: mediatek: add MT7988 pinctrl driver
>
> Frank Wunderlich (3):
>   dt-bindings: pinctrl: add binding for MT7988 SoC

These three patches applied to the pin control tree,
please funnel the last two patches through the SoC tree.

Yours,
Linus Walleij

