Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FE7E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHxeofl98UpJxEPkYUNcU87+k4nJIUS9VT+0N18/vOs=; b=T6HkRJcqa49Yh7aQ3kEn2VZf7h
	bO82V1VbssOWlT0wFAF7EX1pUXW0t5RTqWf9NiXt80/H/C3iead/lNI8Yg9rHQwA+i+zSgEOmTmsr
	GlBOlqp1gLpTovaN8qwrU4I2apVIqRyT014FWOyZzj8JsrVBXu68x7j1HE6fJOE9PSp7OdEWVs6+5
	WsP8VgpTs0Uu+zp3dGEKG2DxDpMC/PZ4UW7VE6wUcG3bGFvwOchWOb1L1FwsTvpaB50LzMbP7qPpR
	qxnVDyZDJ0iW6IVk1tgqgm78YX7dMyqYhyK6Ic3CYfd4/5CDdXan9XlGMJRlxW35GNgfFQ15WcJhv
	056zcwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxOh-0000000HFXr-1ZYO;
	Wed, 18 Dec 2024 16:59:43 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxNb-0000000HFOv-0Eao
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 16:58:36 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-29fe7ff65e6so2237403fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 08:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734541113; x=1735145913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHxeofl98UpJxEPkYUNcU87+k4nJIUS9VT+0N18/vOs=;
        b=f35RjfQpfcMfZhgWq4eAFNTQ/s1sKfqgbxiJYhg5TqUVlKy9suchzxaz80j3L84T49
         DdbzVFjjaBvoIBwTxWixS5Jnp+UAvE8dhYGH0KRmr5n7PtchX9OnLReF6hykPJSxg0Mg
         B2nQjUWoB19jegEiJSbV8ol3NgrZuAY+d0doVbHi3/Q9S77lQbJq1/6YVUMtrnqCVFQp
         gOJWxUrlRF6y+ZZz64Ekwp7iO9f0IHQ4awXvWjVFoUlhLy1rlMf62bLkXOCRZRgSrJJz
         6Qloeph1FEqKsYwMXihsKVHGA8AmiiGkjjQFKFtHmMyivLdl9u970FbTByE5Yqn6V94e
         pVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734541113; x=1735145913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHxeofl98UpJxEPkYUNcU87+k4nJIUS9VT+0N18/vOs=;
        b=CXKKC6+nTvX2v158POH/4iJr3EIf1mjySPazSl8Nkw2o0Pz1YOCx+OzXCssvWH2VBH
         lPnEsa1R/Y1iDo/LcowBFmebhO28WcuoZNsgwxnRhkQl63rJEWuP8B4w1Jn/ih0ORglg
         aqH3POvZaMFcG1pUHL/hJso5JBj+lkfi++9VSkG0+/NuBWeQ/QrwRrX7AQlZxo/DhHbk
         9GycVt1SCIXoevjUBKHUGdnSr1caYdxBKERsUpW26OfVLpfNs5w3r7OH0+wNsc8Bh9hf
         A9nIN4NxfqeX6IXmza/0ibvFYybfh0/9COBly4rurCl4tbKQYnNOmsVwB4A6pC2nRlTB
         gcqg==
X-Forwarded-Encrypted: i=1; AJvYcCXvimBtVcYGK/5tAfIk+6PLYCw8sbM4aZCYzAT0ti6kXmApfg+dT1pAi9RgUAQ4+qlIFAx+A/w1LgVD4GrQd4Be@lists.infradead.org
X-Gm-Message-State: AOJu0YwoR6xWlvLsV1kQCAkquqAvS3rACclcW71eCipH42uxOLtzPv1a
	v3hwOdNYX+0n3SAuXzfczBbkGg7FTQW2HcqIAmqenvFBJ1Z8xi+mp/g//89t0IbIU2SikSbACna
	fYf9keVnyQEMjrry7RpzRZZpdwfQ=
X-Gm-Gg: ASbGnctBqClqP8ws2gfpMnDmLhX6Qft0WsggfXWOrams/gEEzgRQxcu7WKoWUL8M87p
	cKQoSd3gSITMw3xNXiZrGOZQdjl1N+LBxFcPHvPY=
X-Google-Smtp-Source: AGHT+IFwpZKhrVSIb2dpXxrrnWJbLQuoyY9JFnJrMzPrGSzl5sIBF6BA/u364X5aMpPKHy+UN0YRV4CS/l9z91ENjAA=
X-Received: by 2002:a05:6870:b4a6:b0:29f:d0bb:618e with SMTP id
 586e51a60fabf-2a7d080b687mr60544fac.25.1734541113322; Wed, 18 Dec 2024
 08:58:33 -0800 (PST)
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org> <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 18 Dec 2024 10:58:09 -0600
Message-ID: <CABb+yY1W7HM1pry+wf03HFur3F3YdZwpRjrdtZ6aJtWQ2Ed3wQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] mailbox: add Samsung Exynos driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_085835_090424_867F20E2 
X-CRM114-Status: UNSURE (   9.80  )
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

On Tue, Dec 17, 2024 at 3:40=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
....
> +
> +static int exynos_mbox_chan_index(struct mbox_chan *chan)
> +{
> +       struct mbox_controller *mbox =3D chan->mbox;
> +       int i;
> +
> +       for (i =3D 0; i < mbox->num_chans; i++)
> +               if (chan =3D=3D &mbox->chans[i])
> +                       return i;
> +       return -EINVAL;
> +}
>
Maybe simply return (chan - mbox->chans) ?

Cheers!

