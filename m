Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BCAD12691
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nEqLHF+CqyXKlF1XNZ7kaW3yqu7m2xLMRFyungjcvA=; b=I7eWqfzndkzHfsOWUpUrbDRtA4
	irvOspDfjH8TP/GEyEGLR95/YA1WPEbJuIZtabVA+bIj1GHoXtXV49fh7D8Kaomxklz2LhdmT6nv1
	I8JjOw5bPnHirO0k3uWTuDc+KUeL4rVpczn6oqPN2BHJUuPWosIfgju5NhR0ekqeipmTDzLRDs2Yc
	DRm4igKlmXm8XLFXr0ZWq9bzWVoeV8KPX759REoLURb3Acj9Kh7nhOOXK+sp15NEVeytNEywkkoVU
	Cmp75xaJrp2LIhqC1ysJxMNVjupZdC0qdFrswhLfwcBcRDXL9z4yzsh4c5w8EDAzWkieLVvDXxTLW
	LuPn7rEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjYf-00000006QDD-12Id;
	Wed, 03 Dec 2025 09:54:01 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjYd-00000006QCh-1jxP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:54:00 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so4523352b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 01:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764755638; x=1765360438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nEqLHF+CqyXKlF1XNZ7kaW3yqu7m2xLMRFyungjcvA=;
        b=TBgJoY3iiGPy4ks9Ig1kY5N7mhA/8BiLlAW8vWNaNn4xBCqm++v6HPJmhYpS8SvN2V
         v8SMo9HN5VRM9HTh09aEaI+BE5QQ9EirogDsqojtlTyYHyvbRIjkTsMS05b7nTr35VT9
         YQlMsPgWLcZ+XA7dV08zfqPTTW+zwVcyyjTOwh9/3h1O8EkzTUnBc/jSe0obGYb1JuiJ
         w6+BHBGBFi7B6+zEgR57Jr/NAOwE11JdUY7OU1aWUm+LqthH1jirum16CCPFtaT79KWy
         PhQhwmKtKKfHpy5RiwhXsj8amoPdiAJbLY5wXRzjjgiXpFu1XoeBQNxpBjSggTnPR6vy
         UGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764755638; x=1765360438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8nEqLHF+CqyXKlF1XNZ7kaW3yqu7m2xLMRFyungjcvA=;
        b=PFFfPMZutte95t0LEUFtkzCvGg20KDh+OWLRAFyeL7xzP7yUKEfMZv1IPvmvnFF4yI
         7Nz4TzfswK0UNWOsDiiKnHObKoOOdZ/4pQcoMP9IGRN+6egcRcXiX1i8jgpV5qSpkPoq
         nj3nKUhu611AaEeDR2jsom4FrHpv2h0I0CUIzcnTX3FQfTQ067A0iR2NokGBe6arbCkh
         RVb95FPku31Opx7l7WWGue2sOW6M4rMqFN76GlnDIcGNlwXR26zFf/YCMprBPpLfZvZP
         JT92MQgK3EJ9NfxkPNKk1rPqGVwVHJUJcmQv9Nj8emUJV1al8p7Wo8WdtY0qz8aj0iLq
         zVKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS7LmQZ+seHwRK8EQkTgJLjp5Z1A69XD9Hv4E4FoD8UX+hU/+X0FjuNEsz24blQUPGeaiY3WyhT9vUo/ow6kX2@lists.infradead.org
X-Gm-Message-State: AOJu0YzqSi3Xq4TQx5l3N6MPXsXSwFu1UsKKOn2jkGxS70slHohyJzKj
	iQikhyJ9eV+QV6pGg8Rke3XFsxd0szQ6o7KxxhxpfE3rS4Px3EsT9RXq2f2O2DRAN2X6BpR6yHU
	TAr6u/F8z2AvcDd6VRiqEVLgjz6Wtfk4=
X-Gm-Gg: ASbGncsK04xAK7muchWLuRxwl1nhnFAaDoYenHNBPHNdsHqX0hvP2XfOFEXQvdOq5xN
	BG0V/YVxySNJKOksos8ydkn0oODla5x0A2QXP2D3h1oM0XFE/DDZmPaI+56CevvDO+3Mj66QXEb
	9a/XtD1lkvFnNrZug8YEGl86CCiv2mwsJU773o+VJFIbdyc6GvMS7Z4Txf5+81PjWrhE+QIw8Sv
	rSuLOJsN8ggC+mJcSsQliuUK42b24kJiOHOfy14n30xuUoDEOa38m7z/SzyCkTjbsK9oZyeBnnA
	v08zLZ9reDJpkJGpdSsaKNMnGK1edBVPs4jerIX4LUSz8nx39gA3Llyb0KM0nULol1BATw0Ko4j
	zPXVx196l5g==
X-Google-Smtp-Source: AGHT+IFzArW34PLOuMOqsY2Mf51Xf3abtZlLQpsJqEX+QB1I/ZifDd61nnFzkTDL6Eb9u2KQsY33FhUiPJNwz3uxy8E=
X-Received: by 2002:a05:7022:f204:b0:11d:f037:891c with SMTP id
 a92af1059eb24-11df0cedae7mr1266205c88.44.1764755638420; Wed, 03 Dec 2025
 01:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20251203070605.1868821-1-chancel.liu@nxp.com> <20251203070605.1868821-4-chancel.liu@nxp.com>
In-Reply-To: <20251203070605.1868821-4-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 3 Dec 2025 11:56:31 +0200
X-Gm-Features: AWmQ_bnfHQXGg8duSmQZFhswRPptS5H3VYBS3CWyQw8E7GoI6MsPER_sOfjPYMI
Message-ID: <CAEnQRZAJuVq_HnNE7pZkJ6O04QgE0K=AzmmyiREaVxzzL4QNEg@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: imx91-11x11-evk: Add WM8962 sound card support
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_015359_450882_20E14683 
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

On Wed, Dec 3, 2025 at 9:07=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> wr=
ote:
>
> Add WM8962 sound card support which connects to SAI3.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

