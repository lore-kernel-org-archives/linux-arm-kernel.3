Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0EAC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a07HNvK2s/ifER9xOGcNCCEiUl0FR+rf5Vx8rLmQK6M=; b=gyuEd5g1x/30qNcsAsTrq0FqdA
	1P51YgmrxVTR3GKvDFmDZPqZ6Rygjz+yXPUh9/nCT8eWWZn84SeM+BagLaJfLFdpj6cAZTnloqKvu
	SepJzi4E3RTlCRH1RziOS4u3VyWkqjhTmEbaO8VFtCDrhvAWRlHkgvPB0oPK1Sfe/SejLymhznl91
	+omys1+7mQSzXP7xL7U/2bKoZKnlqjWBd1WwUeKqwPUj5nEZaDXpqmeTWs0g/tbGimvI/UBYhbvnE
	NxjRHYVAoP/MnAubk6VPdUopuFdOp2zXQBKrw66gHDoH9euY9Fdb1VFiH59mK8vrilHHxtR2m/uJv
	Sqv7uVbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpbC-0000000CTTR-1U42;
	Tue, 13 May 2025 13:23:10 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpZ5-0000000CTGb-3Gxh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:21:01 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54acc0cd458so6105057e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142458; x=1747747258; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a07HNvK2s/ifER9xOGcNCCEiUl0FR+rf5Vx8rLmQK6M=;
        b=rwZmUI0e6XOhL1ZaxYskwuOFVS6nbIMR+sb69Mf5nB/iwOpl5H+SPc+1OgmCR/idxi
         TUN3zoRj9j/O0+6CwMmu5tFdau/3zhnQdKWe2V0Gt2nNdKWH8Hcf6oC+EU/M8/Z7fcUB
         OiNvfMqBrYU128414z2ykfzNoiwBx11hwdqzPIa4C8wA+sNhDS9G43Mm4gVF/tfrakif
         crUKJzLXOpt2HWcZ8AdlU7AqWxGAq5dQRsBoDip5oVzT5zqNQbR/0FiD+Ng4iiAw/lqX
         9Ve1z++drMoJchAiWNoHXdZwOuTfi1Q+Dxz04ZstS5npdugEDGpayQ18xY1+KiA/8EI5
         seOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142458; x=1747747258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a07HNvK2s/ifER9xOGcNCCEiUl0FR+rf5Vx8rLmQK6M=;
        b=q+w/hXm3mcgwt9yyox15d5PMOwdbj2VGu1/b7ebm2MoL1ybgPg+ye4ElfKpiF9sCDl
         XdoqDaBjSgTWeBWpvuIBsUATtkKMemehzkIG/4Xwt4Tuzm5RB/sWrYIBMOFEyFpvuDx/
         m7aawqwK7ttCzOMETyyPN7XlQIbWWXe8Wa8WfkVEOrEjVDINuTDKin/SKG7XhSB2DNKf
         +9D5KOBuKfW3fdysDUwizLvKNzh4VfCYhCFqG44eHoLeXYgh6YOLf7MjqVp/rxbMQ02/
         mIVn4i8Ju4f7Sdt5jsh7J6CwrwmJRC42mJdSToo/wJ70XsH+aMSc+xgoZG9xqYvYVLrB
         nh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXcqNKMwV1tpHz2Cg78LVYlXazKKiy+0jI/phafbKlCwGa1tmdYGeNNKD+WrYQZxvqhDAT3PDCQnbo+rUHVzCp@lists.infradead.org
X-Gm-Message-State: AOJu0YzgbDA0vWVhaA1cGCavSNhtcEVCDtqdtj8qc3SFmSdwL0zHNhLz
	7/BJxWmzHMVdgrAE78y9UMKbgX9F/Xs+ub/sh1WOd6sjET5njutXIXSLMCvdQTB+zwJD9PopXZI
	LUFNaHH1u8uSrP9BWSnoynGbc5EPi4+b1ZC+n1Q==
X-Gm-Gg: ASbGncste4BQgBoG2yMAEd/p9RfNDcp0SMbuMDMZhgCIVeeGGDmfY4iarp3OgnQ4Wh3
	ph8bnxHNijbkOHgO+cHsZwGZJ1tirOhDR6XQ/CpVwqNmrLel5+1Addk+bGCxHQg1Y2jfPLDc9aZ
	1T+EV8ynyqmH0gMLRL1OSMaVxeHhSo9zNe
X-Google-Smtp-Source: AGHT+IGEAON4CqeWB7MIriXflZ3TKRdVPaHoB+BTW6X7JW4SlMZJHvBn+KzxohMwhUgzM+6fwnKvwVBVuufnBpAzy7A=
X-Received: by 2002:a05:6512:3b88:b0:54f:c66b:8b78 with SMTP id
 2adb3069b0e04-54fc67ecebbmr5256122e87.49.1747142457796; Tue, 13 May 2025
 06:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250512-pin-v1-0-d9f1555a55ad@nxp.com> <20250512-pin-v1-1-d9f1555a55ad@nxp.com>
 <20250512-mongoose-vacation-f81a56dd6c5d@spud> <20250513075532.GB14572@nxa18884-linux>
In-Reply-To: <20250513075532.GB14572@nxa18884-linux>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:20:44 +0200
X-Gm-Features: AX0GCFuZNXL7sad4G9E3lsfZTN1DW6pieeaGbeQGotqOwvfnEpDnUcCktC-com4
Message-ID: <CACRpkdYmupji8a0np0xzogjcvJ8YFstAgg_XwdxNczhQjBZOPg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: firmware: nxp,imx95-scmi-pinctrl:
 Introduce nxp,iomuxc-daisy-off
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_062059_824921_39FE8A0A 
X-CRM114-Status: GOOD (  17.59  )
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

On Tue, May 13, 2025 at 8:46=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:

> >Same comment here as was left on the driver.
> >I also don't get why there's a property being introduced from something
> >you can determine based on the soc.

I agree with Conor's observation.

> we are targeting a common pinctrl driver for i.MX SCMI based SoC.
> So that means pinctrl-imx-scmi.c needs support i.MX95, i.MX94 and i.MX9[X=
].
>
> Each time we support a new SoC, we need to hardcode the register offset i=
n
> the driver. But if using DT here, no need to update the pinctrl driver an=
ymore
> when supporting a new i.MX SoC.

I understand that it is convenient, but that doesn't mean it is the right
thing to do.

I would advice you to keep this in the driver and use the SoC compatible
to determine the offset, just as is done today.

If information can be deduced from what is already present in the
device tree it is redundant to add stuff like this, and it inevitably
will create copy-paste errors where the wrong offset is used
with the wrong SoC.

Yours,
Linus Walleij

