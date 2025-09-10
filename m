Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856C8CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJ6uNw0HKk0H9/K2jkc1j6Gr8BtOWS9xg6hVUrGi3EU=; b=sBQwfBN3lIuL+gqhBp8kXce62F
	cxxg8GhQXY5VUy7k/d+XmWUXSKV3ZrOqe1Hj7Y7YDK4DcdX6kEnOVnDp2VzpZRdvIlL8Iyq3i+jW3
	pl4B2BZhwW2rPVrjB6zM0S+bP+yEfa5gJ32qB2BaLv/F9cwvGsXqVgVnl34BJpGYIQj1hwTcCYpHh
	/Dhc2g49c03cUs5GQzcNhZi+QDIZSYqaKVOfONx5+1Z2cOrI0BqGgX2REY/ipCFVOKaIQvuZHe6oW
	4oW1UVTHARB91bzTv3aV/LWGcCSP4bplmbNq0IiNbrW/2rz50TEO7AgQKm/o5S/DMUVrRfjG9AQ8I
	tbHzybxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNoQ-0000000FX7o-3u1G;
	Wed, 10 Sep 2025 16:36:50 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNoO-0000000FX4w-0zHx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:36:49 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-336b0b3d753so71196721fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757522206; x=1758127006; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJ6uNw0HKk0H9/K2jkc1j6Gr8BtOWS9xg6hVUrGi3EU=;
        b=M0+tFPVpl3eNnEW8J0k9Kk9gEtN+872EY1IxKacs77JNie6x6BgHkhpEEMu04J+9Mt
         A6Y1SXRwdHM7kH8DYNagVff9t6gxfMlN0IR2AZaej4NmznM83INE9uzF1i783DDI1A1x
         /Mz/8J76vzgswTucL22HTlpicOZw6vk4teLzzPfe9ev9UyvG6M+1iJ89bD6EB+whMj3L
         LMkZr7eJ58kVeCtfDP6+Bh/KK5n7j8FI4EX8YxCcOCuGavqZFB5BSLy3DZNwWrX2xjxm
         MsmQrOHbRdSue/PFZhQQ0Hk5b/d8GCzDvRW2UEcJykrgbrKm9+94frp//DxZc3FktDfc
         RnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757522206; x=1758127006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJ6uNw0HKk0H9/K2jkc1j6Gr8BtOWS9xg6hVUrGi3EU=;
        b=XfiVQvG8Q4qAMsldZvivycnv5ZGKdPeCexrKNgcKcDcFXuUdrVeDUs7ZoCLLITu4hc
         I4KbZlmjjz3cTN3ubOf6NnXcjz2TIGY0FI1eviS2EEYoF3XOu9V6zP814gyobrchCkPG
         lYidkYCWppPxqxxeY62vQr7A2dGqQ+udYlmIH8QT74D+6VvpvWku4fzC7+TDMVR+L8lR
         1hhnZPlhFccBiyumBwhBO7cOQupcN6CC3OLKVoHWIx4JOfs2yvR/1m6IvoimEyZnglOs
         mfT+3FzHfQmDenbE0BtqkHDotkT5b13qhuhCk8DNTREsBg6M0ZUrM0re3h05zQEdm+FR
         IwPw==
X-Forwarded-Encrypted: i=1; AJvYcCVC0cAmvZAF2M4sVKm5HiQVreFvU3dQU7R6WWFJy5P9XhdbrPdsfGILkx9IZdp0b1Flfx683/GYJdVTxSjQaJad@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+ZlM3dmiTJ8QsGig+diTtTm448z3m2jUVL3Z/4Q8phBKL0irO
	IyuS4B+9gEGcIKG0gToHy3wFnez5JlDaPoSXSLfJ8YiKg9Ikm60LIuYZHOmIopfk5NI9iex8Q37
	EjEXKagaAy3fU81EmG1y0TwJZmqeqWJA=
X-Gm-Gg: ASbGncuX9oiHO9BAB3acX6ZMHn/kmz340cBpSrPLdzN0uLL9A+VbXiI4jNEH8wBDOan
	MpzxHG+X3AVNl2SCMLaxpckkPT8X+l9vS/EgrVjE3LMT3PUWSmqD28g9GFZPnuBmyCrLJZH0/iN
	F+fgzKxpMyzuTRjTeAZIAVFnC48g9el21x6/j5s6BoI8vw3/6UNbyeT3ZE758BhufDJ03YqkSyb
	Vem4Z8uVyMpxErRmls5vW3swekmSmh4Y0siIAk=
X-Google-Smtp-Source: AGHT+IFjFrlIdQsJBkbl5UrFknUtSHC2zpRAlUQjHTiQtPng500/xUyi1rm6QWi644I+fPHp7fWPkvMNF1fxWMqbWDI=
X-Received: by 2002:a05:651c:1549:b0:338:bb4:6d6f with SMTP id
 38308e7fff4ca-33b616395b3mr51779561fa.44.1757522205739; Wed, 10 Sep 2025
 09:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250910020525.342590-1-festevam@gmail.com> <20250910020525.342590-2-festevam@gmail.com>
 <aMGfiOZrVaFIqA2R@lizhi-Precision-Tower-5810>
In-Reply-To: <aMGfiOZrVaFIqA2R@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 10 Sep 2025 13:36:32 -0300
X-Gm-Features: Ac12FXwaCBXY8HP2XPn41wXZeHzdr74VgHu-UVfAGT6QVSQ5gGrKs0lhgzUSNzo
Message-ID: <CAOMZO5BGFAfJYFZGCStYhGoFM9-P9=LfFKSNqoTAmMQoox2nEw@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 2/3] dt-bindings: lcdif: Expand the
 imx6sl/imx6sll fallbacks
To: Frank Li <Frank.li@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, kernel@pengutronix.de, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_093648_280188_7E4DAE36 
X-CRM114-Status: UNSURE (   8.78  )
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

On Wed, Sep 10, 2025 at 12:56=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> > compatible =3D "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif=
";
>
> Anyway, you change dts. If you change dts as
>
> compatible =3D "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif";
>
> needn't update binding here.

This was discussed in previous iterations.

The change you propose may cause regressions for other device tree
consumers, such as bootloaders, where the match may occur only aganst
"fsl,imx28-lcdif".

That's why "fsl,imx28-lcdif" fallback needs to stay.

