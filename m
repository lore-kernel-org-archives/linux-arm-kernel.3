Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356A5D167E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7L+vSRDTKzVhMW5uhxK2UgtWU6MpTyHtxzs1hw/M3/g=; b=WdiZrdCxe59sFozL4JYMGuSXDy
	YsUYgTArnKjLe5pf+f5ss6WEsqJEBqr7lMv63uPkWOyRtxVj9CyrQXfcACLNi820jcJFxgwrGUU5q
	Jn+TlE/MghidwrAjK2s/TZw49ziEXPXOcIqFwbDvjpVxuCnGrnwiJFSRub+5xvvCWYdGEZAG94DH2
	fu8fvBE66EcF9KYIJ8FSlooeBvv96/qe1jxsAv/7bu2ylZRZU3AS3KkxjKnCBdqIBxUjGYX8+sQNP
	yNtMBJFPlk8NYm7r1GKJm2l619rzlYAOAkbgfEA607GCQWYA8f8oGzlDmBGNuNhIkSJCLhhV136K4
	jgtMJ3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8u0-00000002220-1RWX;
	Fri, 09 Jan 2026 09:35:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8tz-0000000221N-1AzS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:35:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A078F6016E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D62CC2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951326;
	bh=7L+vSRDTKzVhMW5uhxK2UgtWU6MpTyHtxzs1hw/M3/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AH/W5KKFf44NZgtKCeRwscvcd5f5OtMnEYBV1os7Xp3PrbVfqE5O8lmxtHr+rO2yr
	 NcAgyZgBU4IMHzy3s0wz0/R7f1WwGy0v3zQSRSxCGkoAjzg2Ifl1gozBMs2DGIwtUA
	 vNh35bPc7x64nokZhbHkMqQt3xbw+/nYKREnhzMJzWrVQVnpumY+9ME+PWH445hpXY
	 0DsB9Y0bLVcpLaeDXTBX446uTpplwpcMUcrdkUGCj9AVvMxfOblx2kcHG+0wR+mnDF
	 UEL1hUhhcM3FrpoFeHzKePOUEDOz0DFw6FckEIm4I6Go6IPaAjnl5eHXTq/KdIgGi/
	 8Hrn1qmumtNhw==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-646fe7f70e2so2925524d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 01:35:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXCyGG2zZaB9kyxj82BqcrfD8NUkcfh8TpJwg4l2f2eAhZvbGMLVKdWzqC76QTLG+wdjI0FishjRU5j1gaxgK15@lists.infradead.org
X-Gm-Message-State: AOJu0YxBbK+qxiGDfKFP/I3FyHcHxCQnaxuVJB+YbdluGnwy1yb9t8rn
	UqE5gJUqxZhVN1mBjyfLVIPIM8nVuZXPd/xJwzBQFVll70cSOiDfvvo7QV8S6PF0F/YiLc2Klm3
	4I1j4INPA0nBKNPLPbjdjvAVSk7cxEjk=
X-Google-Smtp-Source: AGHT+IG1nuJdduHBaBbJWNLEpBHS/0bPJdMz2cSjVZpwv/kW086sM7bXE/jQGK5lNaXH05HMk/BcWVmQ+kqn/43rNZQ=
X-Received: by 2002:a05:690e:1516:b0:63f:b18a:7819 with SMTP id
 956f58d0204a3-64716b70afcmr7942611d50.23.1767951325652; Fri, 09 Jan 2026
 01:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:35:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLmdBefq9JJrfw27Y-FkvywJ9bzJBSOo1RXmS0HjoC5h+Q@mail.gmail.com>
X-Gm-Features: AZwV_Qixm-JNI9h7N_giBE-Mr4reCD8lf22oFl6XaRV7hyd7tvwUPsENCkrLvCY
Message-ID: <CAD++jLmdBefq9JJrfw27Y-FkvywJ9bzJBSOo1RXmS0HjoC5h+Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jan 6, 2026 at 9:53=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization. This will cause
> lockdep splats when used together with shared GPIOs going through the
> GPIO shared proxy driver.

BTW it is a very *welcome* side-effect of the new shared GPIO rework
that it just happens to find these old bugs, I'm very pleased with this :)

Yours,
Linus Walleij

