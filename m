Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75034D59F44
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 22:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsQwqXmGfix2YeAXAoUv4kLWbk4s2jhfO/LPyPeEEYQ=; b=2SjVF+t1vOEy2MnLTn/tPNOkM5
	WRs4Bcv6XFJyX8cbfaR9w8wpqwIilLDpriM6OqyLjRjU7XtbNkD+AYmiFjGkUp8DyMEGL1YV8YGX5
	xsz9kTIRAiFEFLCn2vSHZHRpt2RVoH1yWwN3Ocl/uyeLnWCH1URSUO6eeSqVszpV52YsbgAGuDmaH
	hjMRUTW9gMiFH4zE3/TGdCrCpEzCencbS4OseMFxLoAUijDgbFu4gl151/YnunyTCZYzW0hSKT8IM
	lHHW/h+CdKydblpKfbDpBZkVHViKrkfYNIxUYUNLZyq+PAnHwqnr00z76pDhHl4fChIAa0c+PXDub
	JXeO5p5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBN3-00000001919-0oiu;
	Fri, 12 Dec 2025 22:12:17 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBMz-0000000190q-40Mc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 22:12:15 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59578e38613so1779336e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 14:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765577531; x=1766182331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsQwqXmGfix2YeAXAoUv4kLWbk4s2jhfO/LPyPeEEYQ=;
        b=Yr94EoAtMbVMoDe7JgEYnM83m1K2GBsznoWeD9cOcNvIC7BuhyB/Qi2Eq6ZaBqbE8K
         c01G/iWRqRTb3qPIF7UKPNKUBfqP6k9anHn1hup/x/XiLJMYfcpRluM8TeBG+Z9oim+y
         S5IUtssf7TNiq38amDdxSV8HKz/bngaCDcxCBrORCthxIg43aJNHWCg8Gfnx6qpGd7YP
         HyqycTw/GD+SjbxCorFoDMBcYM76RI1tI6Q+xG+y/HdDOjCeO4Z7k17deukMl+uAb7OW
         dPdotRYqJUUPKHMK2YTmh2shU1PU5Mw/Vv8neKE015pFBlR66U999dY51jaXFYSPOUFb
         kpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765577531; x=1766182331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JsQwqXmGfix2YeAXAoUv4kLWbk4s2jhfO/LPyPeEEYQ=;
        b=sMquSbZFnJrZcGq5FhcCXWZUGb/Bb9IE8xgWUxGjpWGW/FFqh9MrySMAQvYEcoUoOB
         NpHizqXfLVmbSotFov4XCephjU+JTgLesiQZoK7oua46CIxUmPgi7kT/v/d0ELhfU50a
         9N38d7VNT82g1pIphjlwQg9FkgPxoNVBsmiIxf6MIp3VC+zWt1zdRknfsG+LhbTmP2+7
         ehhHy+fcDC6PwH49VjDXfnql2JVgWNUVvgTVZYI9a74BVBnuHvZV0DL8pi1aGJKP1G0T
         7CAkAgWoLCZy2PP3EETmN7QgBfPrhqcM5GKcQjLIeB1ninzuSEIw3ViCAcKTYbemdmnL
         qiwA==
X-Forwarded-Encrypted: i=1; AJvYcCVZxgzxxH3/b/cThWZ2H4J3Qs6fUCkwNELlSAzXSQ8rEseUq8IncCYndx+EHLhxpkFz/mVrzzwoYZQu6a2g94F2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/naBFcXw6YTvWteTsg9ksOZSF1xfSbt7R2RUy92P3dW8Ea/GW
	NCqFGKS66GEjTw6iwmSWh5E8DMSuSqMWXIKOpsEVODQL3Y3H8o1tCzcn9Wm0vZJypK7ohMRgp/Z
	uJ8PXeE5y820IoiX+8tgWsAgug+ZfG7E=
X-Gm-Gg: AY/fxX4hvjFLCr73kSO95MbxhnFiGtSFgkDW0jIfZyj16YBtIAUxcKOnunTHP8AB6QS
	L7uujRJwWI7h6asFiLn9/+fwkulcwTMqxCFp6lmta+RmfQNYkrxlwHb3cnrj+EsfM9bbp3le5yD
	779HA/S5VLy3dE02otzrHWnHF1MweFEe9vDvEdqEoL17YJuSH6Sg2XQubIDkVDpKwl1lkHKv8aG
	JnEvfjFNTKB6EOb3C8BT7khTasazBye1UvyuUyxqPklopU74Rhhzw76tJ+QjfJuzht+nToPmiil
	CBVlWzaiL7TmQ03XEhJLpJqAjMg=
X-Google-Smtp-Source: AGHT+IFrHfwuqwr9V4KpZ0A+wkTg0vJDfRRhzq3tgpbB3l6i+Djtge9D+UN764HM9ic91SDaegCUnSstqGx3yLAseEk=
X-Received: by 2002:a05:6512:3d1f:b0:595:9152:b932 with SMTP id
 2adb3069b0e04-598faa97309mr1123655e87.47.1765577531199; Fri, 12 Dec 2025
 14:12:11 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5BuMLhMyMkfE1xhOwEs2U=+pZnVq+FP+_bp5W_Qg6oMxQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BuMLhMyMkfE1xhOwEs2U=+pZnVq+FP+_bp5W_Qg6oMxQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Dec 2025 19:11:59 -0300
X-Gm-Features: AQt7F2rx42oyhjZjDE26CeukYpUL_DDtpfRSipXSf75rBpghyxozipg1BcDtvZU
Message-ID: <CAOMZO5BhmvC1_AhcKTerd1p6PdJ7+YLonU59CcHfmpTVavgqdA@mail.gmail.com>
Subject: Re: imx8mp SPDIF TX does not produce a lockable signal
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>
Cc: "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Viorel Suman <viorel.suman@nxp.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_141214_002590_AF984D45 
X-CRM114-Status: UNSURE (   6.78  )
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

On Fri, Dec 12, 2025 at 4:11=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> Any suggestions for debugging or fixing this would be appreciated.

The SPDIF TX audio locks and operation now works.

The key thing was to pass AES1 information.

In /etc/asound.conf:

pcm.spdif_out {
    type iec958
    slave {
        format IEC958_SUBFRAME_LE
        pcm {
            type hw
            card imxaudioxcvr
        }
    }
    status [ 0x00 0x0A 0x00 0x00 ]
    preamble.z 0x0
    preamble.x 0x1
    preamble.y 0x3
}

Play the wav file:
aplay -D plug:spdif_out  96-24.wav

or a 440 Hz tone via speaker test:

speaker-test -D plug:spdif_out -c 2 -t sine

Thanks

