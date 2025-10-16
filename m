Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC019CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 22:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMIxLZM/6U/tLtbB22xRRXB39dw+qCRALwooxcdMsi8=; b=JnKgLwNaJVi9DwIU9Vo3X4LwnM
	Qj4W+WPzaD75gbKK1nrTVhlgOI06kx/h0AGsfRqtDIv8fCbSd1VSIqhPfy9uIkmBb+IC+AYipQut1
	xCILjzsIwWwmb6wZ9ZsnCB0DA5htgykCUSoVgaVQrp7zrmTxHTQbQWnCjCtpG97QxG/MgYwY8jjhC
	Pn4jM4XcUkpV4C4NdxOzMWezH5o9nQcFGeYeUo5UaKHbTyviR18TTqNmQkmyeJ0i/emfgDG9Aflum
	MwOCv71SAFQZ+O/784ZcsvYSDVAPhKSmNCRam3tpQHe6rr/ik7E8zdk6ZJYVpkfb9oVE2eOmHya2e
	f6yz0p6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9WfB-0000000659M-1DoS;
	Thu, 16 Oct 2025 22:41:37 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Wf8-0000000658s-48Eg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 22:41:36 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-362e291924aso9862241fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 15:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760654493; x=1761259293; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMIxLZM/6U/tLtbB22xRRXB39dw+qCRALwooxcdMsi8=;
        b=kxW1eDiuLlvbXgP2bCPLsHEMGVn0ei6A9OdY8jPnz8oDOhb2YmsLg1Uoo5UaHW3bW8
         S4pR/yhd7xY70ee/8YEr1cOWwapawyBx1M8H5ont4OP98oMMpL9DldiW3k5M4THwhhRB
         Ihs0DoKdX2v/Bg68cEaavQTJu00m7/HJelyzifIzMDXqwrEcRRUBK+SwX3pAkpyROvVO
         d+L5UByqLtFk8RVltJ9R3EYsq8YtYQx21RBZxvzDamvjt4L64QDOHJPk4PnEYClM84Kt
         NUqnJkwC3HFL1r5moiW4CDcLQB3y9X+4RITLji2IJZ3XoY0Plt3bVS6/LzKsAqSphHVq
         1hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760654493; x=1761259293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMIxLZM/6U/tLtbB22xRRXB39dw+qCRALwooxcdMsi8=;
        b=EzBYVDfNyTkyb58MSfI+TCQ8Nlj42BnKmkFtMJw87AZVDkMUdNTLtf3ZOUGTjdFIjl
         jWUIVs0pwk2JVlVEp1cLh9PrnCVclMZsq2rLkROO5y1ZiAS1MlOS9t7fxOEwv2om8G7u
         0HtLL9fs3MzoHnWfBmqTBnfY09nCkWoGLJ3dDoYkPoJosj+nYm033d/I1QHctrT4m/Kh
         2xoObnkFR8otlKLJq0h7n3ufOl2ynS8UipIW81FPcNbj3E5jSrNrJbNWZR1NYnRw5Gn+
         wFjhrfdFmcrFOHr7C+I3chi7MshnDBHYjs4mAjEjcUItylquZVgbW0MOnXrweULoDy1s
         x16A==
X-Forwarded-Encrypted: i=1; AJvYcCW11SbOi2zXZDFk9+Z0RoGlY8edN0f43jgSYQwM8pE4SvnxFZEDWcjIuSTzk+LM9lSAOqJk3ObtvaDv1gLopCmP@lists.infradead.org
X-Gm-Message-State: AOJu0YzWs/uulMmRFSe+FRjnzGAleyRgqPhWq+EoexPSNHw/bPSP4YuZ
	QMlm0LVVdlDHBWDImjup1UhUA6f4C5orOcy2eLMKb3K9Mc80HIji7JAkOv6pi5/wPPM8KFCX38K
	5Z/w4SIHDdrU8b5zk4YzftZZsEHGBTm1iDW0pQb4IGA==
X-Gm-Gg: ASbGncuvsluSCCH0mUfzfnxh7sueHtCTyvEA7Z4C98UMk48Nf7MgEPrKKINLu3x9Yqi
	bQmoGzXuYaPsk0MBjbYfWiYsOpTFxQ72WkwAeuBthFN/AnT2wh86LFDyZDOT8Uyf3MIJyp3v1nW
	nkiTrlVozbalI9RqJVmFj+qoeyABNyaY68vpINFBGWvneHQjuDUfcVsEwcPy/O3rJoa7WIxrIU/
	ph8UDzPrnmMRlO/i/+z3chTXd4d4hUoK6ryjnMPktQMQsTfIBuaCjWgK1+v
X-Google-Smtp-Source: AGHT+IGgJO7Zemo+LpoVZasQFrmgPrpk7XQQVTw1/TLYvKF3dmLuG/UrVSSNariPEoGP40bDmIuuuFjLjUnIT++2s6Q=
X-Received: by 2002:a05:651c:211c:b0:365:6b40:8656 with SMTP id
 38308e7fff4ca-37797948f9bmr5445311fa.35.1760654492708; Thu, 16 Oct 2025
 15:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com> <20251014-barbecue-crewman-717fe614daa6@spud>
 <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com> <c2a0f301-ec5e-42d7-9df9-09a852a199ad@lunn.ch>
In-Reply-To: <c2a0f301-ec5e-42d7-9df9-09a852a199ad@lunn.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Oct 2025 00:41:21 +0200
X-Gm-Features: AS18NWCfvCVaxN-I2xhCPM2ryQoUWNo2dnNVl4LEycz99TO_NsvVsr2xAwj_RzE
Message-ID: <CACRpkdZX_KJ-G_teTBTwjm_KNmTa5iX4n==yovixvKTOBqqSXw@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: pincfg-node: Add properties 'skew-delay-{in,out}put'
To: Andrew Lunn <andrew@lunn.ch>
Cc: Conor Dooley <conor@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_154135_065631_806F6CBD 
X-CRM114-Status: GOOD (  23.99  )
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

On Wed, Oct 15, 2025 at 6:37=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:

> > I don't recall the reason for this way of defining things, but one reas=
on
> > could be that the skew-delay incurred by two inverters is very
> > dependent on the production node of the silicon, and can be
> > nanoseconds or picoseconds, these days mostly picoseconds.
> > Example: Documentation/devicetree/bindings/net/adi,adin.yaml
>
>
> I'm missing the big picture here, and i don't see an example of these
> properties being used. However, since you reference an old networking
> example, for RGMII delays....
>
> adi,rx-internal-delay-ps should be deprecated, we now have the generic
> rx-internal-delay-ps. The point about using -ps is however still
> valid.
>
> However, i would not like to see pinctl DT properties used in place of
> rx-internal-delay-ps. How the Ethernet MAC driver implements
> rx-internal-delay-ps is left open, so calling a pinctl API to set the
> skew is fine by me. And if the real use case has nothing to do with
> networking, then i don't care.

The scope here is to describe skewing the timing of any line
connected to a pin, no matter the purpose. Could be an MMC
card for example, or something else, but the point is that
the control registers are general and inside the SoC perimeter,
i.e. around the pins, not necessarily related to any specific
hardware block.

But I guess it could be used for a line used by some ethernet
interface.

But the config here happens on the pin controller, so a specific
hardware block distinct from e.g. an MMC controller or Ethernet
MAC, the latter just have their lines routed through it.

The pin controller will handle some pin named "TX", which is
just a string, a pin controller does not know what this means,
if it is a UART TX or a MAC TX but it can configure the skew
delay of the pin named like so.

Yours,
Linus Walleij

