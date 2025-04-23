Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108D6C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eWzS/Ah2cnA75NtUgIRsIHb+DY3iDF+Qb9KegxCV7A=; b=gZh5XKVw/Fu0L8nzhdpVEtXdsK
	dQWPHIh/5AKXrUQPg8BMO+vXoLg1ezSD6TnAdEwnmGB3aNCZBId3hJfrrgYeoofmRZlrDFAnF28Gk
	x8wFKniPxuNRfqk/dWyiFAG+jwxhunfiP7ZnZvouyHLdjBQZ9uZ95KSRrG7+cjaVIui1bFuYkbD/c
	PVuO/xWlrlQrI5vGh1tNzJXhn23UYkLO6LEHbgoPawZYEggVGK6Z2Wor4aBHPoAnW1hpaarRNM8TT
	elfjg6FvP3Xy+0GyE6rb9y1CLx1BhgXgW20lTYhq021P2JzoR7Z9lX+F2dSHOYhetCjbNldOq6cjq
	31dTf7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vod-00000009pDR-2nE5;
	Wed, 23 Apr 2025 08:50:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ux2-00000009ams-3uH6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:55:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-440685d6afcso57060115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745394922; x=1745999722; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eWzS/Ah2cnA75NtUgIRsIHb+DY3iDF+Qb9KegxCV7A=;
        b=FcMM9DlIySMYjcgrK5aTx2xXYdywTD5KW8n3uf3QIModmK2kh8/KnuE7cvOUg3xOLA
         cIwogfXTN/xFJdI0oenghPdwU3r3L9mOgTAmSKx45PtPB7TNJ9dt9Cs955EMT+Cp78MD
         6gfp68/RmH+/BpL6wUKkFXny+shPecIks+910sdLQqm8IDg56WlPsD+E6WdM77YHLufq
         KNF1TZ/22t2X3llukIpkw7WDyTiR4HjC3CSMqyLg9kw9bK/TsSoTVRbiq8cPSIazsxG6
         YIhTytekvS+JiNxfBe6xp7/hS1H625DaPiBGWAhP+BJhveHGPiDcyIio/qbM6jZ9F3Wx
         qwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394922; x=1745999722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eWzS/Ah2cnA75NtUgIRsIHb+DY3iDF+Qb9KegxCV7A=;
        b=iFWwaBoqMvj7o5mnS/mcBUGtciELP7m2gETyLhPTXnEFiD7NVUj9xmuMx0hjuIJ4b1
         g8xvHn66WdBrBjXhkN8K1mZ6RqA59kz1wzb42b065YS9pemdWo/DGkHX4kLQyb58EQb/
         F6yJlqPpuYOGpAA0MqAnpIWXehZR9noIttSOO12IxOC1lbYWrZYskiinfeuz/RpUmIwQ
         bFQBzgddjFlMgpVDTVrTaWe55lsnDEJa1qxDvzit1Yn4OWBydWZYmEfPar2tNmbwFbbv
         Yxn3jCN+TCGvoGAFmyySN3yaDXer/LYNHy0ug2EkNR8Ylzq8gMaGSnxy/jaU4s2XGzic
         ssKw==
X-Forwarded-Encrypted: i=1; AJvYcCWh+JhnR+x5V0b3j82LAxuVZMXBxNzYUQs9+dw4RqKhb3p6EeompQhYqA2Le2E/pfIefpp2Hxtdm8EP7UINq9uW@lists.infradead.org
X-Gm-Message-State: AOJu0YzjuR+lYsR5MXjBlC5T3jDqD5nvmQzls54uz4uf/g9dBcgpBDrO
	aXGqg4blHnqvUz4FBLBMkhs6k7LPhQ7UoZD3P9C1Vktdurd1bL2qd9dmBEfl7Pr9aIQ4TuVRVMF
	83bn8ps/V/9tYHI0JyLN3x1YLBgQ=
X-Gm-Gg: ASbGncvRL8bQ/a55hLEuE+7m207czo/aNiR1kTWBBEoZhX1fxtZiMaFCk6dWIqFewQA
	7P01qj8Iu0otXStSYpudsD3CiOLa3gaeDn6nlOlxEXjdiiB3lbHCYYN2WUkq7gqOL5HAoDf2q0x
	MjRgqeW2liX7sK80WzfHBl/Q==
X-Google-Smtp-Source: AGHT+IEetajyp7tewz7gSg2bUmPRDylKdQxo3ZKlMaQaOjNuvNTMi3XEyh1phX3DcIWXuVWrhzLhzxViAkCb79CfcaQ=
X-Received: by 2002:a05:600c:358b:b0:439:9424:1b70 with SMTP id
 5b1f17b1804b1-4406ac17329mr182625395e9.30.1745394921859; Wed, 23 Apr 2025
 00:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250422184813.02b21095@kernel.org>
In-Reply-To: <20250422184813.02b21095@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 23 Apr 2025 08:54:54 +0100
X-Gm-Features: ATxdqUENAmcd1iPlreTGMgox3_qZS9GKX_Vez1-JK_b3xBLNPYkG-7O4wKnzxvI
Message-ID: <CA+V-a8uk33D7m17nOa3tFviq+OEajPFm-haU+oFJwiE3Hvo3Aw@mail.gmail.com>
Subject: Re: [PATCH net-next v8 4/4] MAINTAINERS: Add entry for Renesas
 RZ/V2H(P) DWMAC GBETH glue layer driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_005524_993170_E4415AD9 
X-CRM114-Status: UNSURE (   8.42  )
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

Hi Jakub,

On Wed, Apr 23, 2025 at 2:48=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 17 Apr 2025 09:40:15 +0100 Prabhakar wrote:
> > +RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER DRIVER
> > +M:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +L:   netdev@vger.kernel.org
> > +L:   linux-renesas-soc@vger.kernel.org
> > +S:   Supported
>
> I'm going to make this Maintained when applying, please see:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#suppo=
rted-status-for-drivers
>
Ok, thanks for taking care of this.

Cheers,
Prabhakar

