Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E623C5B542
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 20:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ID6k8G/m1AUKE94pO2jDeI/QTg83jtJQKI9yRG0MB4=; b=qdwBujIgmrLL+XnVB4ElqJWci3
	G/9T1Np9PLunxmYKxT8H/D0C9a7I884PkZZYUjeV4ReYMkkoxzRnhOzSZHroj5hA1Do/0mGemtEVo
	xYjntzSFKovDtjQXYoGr0jI6FzMHz2CertUEF0TD6VRzfFOV/YHBAw3EB/mchOBBUhP1XxF9QeCR9
	litE8oG4GLmqds7kA2PkKFAcfW1jJjQo1U0lDTvtx8+ouM9Rjamclkif8zPpXQOaR5TwfMuGDyUyC
	qWDY4nt02eiYwQXVD33PmvQKtTQnocrAIn8+rFUEFjMD+XoPzqCjuyoL5S4HS4GJ2TB8twEVizstt
	yBb2ad7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK157-0000000BWLU-2pZC;
	Tue, 27 May 2025 20:39:29 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK12z-0000000BW7F-0u0A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 20:37:18 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-87df8fa1c6aso1495963241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748378236; x=1748983036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ID6k8G/m1AUKE94pO2jDeI/QTg83jtJQKI9yRG0MB4=;
        b=b1epr1GynVQo+m3zUWsyPjdQ+FS8p42mmzKME6YkDi9hj+Dsrv75NE0i3RWoqfktgP
         h3uV7BlL69YjFYS8crG2EfWrnc/RnqKERCBW9S8YmNYaJdnHWGqXzEwzSbvLLxxVQp8m
         W2wm/6moa45KNGSIdsukgz1EsOmIUmnFMpK1NCT08jRwEXCoMvmUfLZIWS6kq/v3JETE
         u26DowB4whqQ499jfRneZlX66goaomSnLr1Ha2c6Cfxia8ViBdK4uLMYeFKyDol4+8v6
         j4tWLmgFhizh7hkP8j3SB4K/4IvvQZH4Y6xoapJyBxD9uCcWZtFoVGVoYje+R9Aigr1y
         aeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748378236; x=1748983036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ID6k8G/m1AUKE94pO2jDeI/QTg83jtJQKI9yRG0MB4=;
        b=A1/8eL1twDHFputxjPdWvApL77Sv8cEO+o+EEwL8LblJqCqtOQk83rZ0Lyv15jBDPW
         4hTMFHyOvuKMqkJRAZTq9Z6vTCBJHQygr5tboCmIqYJ5HujiUp3OwoqSWP/ojPDLTban
         Gl+fNM8+exbNan/l/HE36dTVNGmJ0r+3tjFEYjp+UcqBvDOtPXOFknv3wqKmFNCc1Wsa
         kAWgKKSD873CVEsUhkLuTxkvSVItWS6/Asr1g2ZQg2KxASeWjdvxiJ5VYuYOpRFDta/F
         7kWSFeI8Cy3R9CZ7DGytw87u8//TpHdCcxKDVVrsrHT7R1hXr+vFhwv1ulbia9XYnog/
         BpTg==
X-Forwarded-Encrypted: i=1; AJvYcCXJal+8nfKr+N0Gfi2ectUz2B16Xg3ymkbst140jHzQVbC8iR+/AQmojusX5lBnM0VSdsiNEZqj0OuSUk9ADPgh@lists.infradead.org
X-Gm-Message-State: AOJu0Yyakn9iGZcy31NxIPSnhc/BmvHx2pZEylnAJtGjzsoozHUJ//0A
	NNMYuFHHIkMTU7PYr+H/L9LaiJ+QRHD5MHN8QU2cKea1Vofo4lA+smTNNHBOXeFrNqAPJ7P1CbZ
	oUB+hwmbqy7XDUl48uwlpEItfGEXF2jc=
X-Gm-Gg: ASbGncs4jUX5y5PS0vlm5QtvKIQrsiFubdgFWgTfDXVKFOJVbEc1qP7erQ1FCwGt2CF
	149MOJx+wVnjEmnyObSzk/XgP4kb7ofJ5IcReCgHMOMXJW9GEhs6vgXiIlsWoAGVe5aL5X7RYgH
	C4h20Xqngg0c6dXIO7PZf0CYWL3uvZWO0ZXQ==
X-Google-Smtp-Source: AGHT+IE6IGadDKaQe14cmUEPJjOThWelmyPbRkm0rWeExh7Z+iiuaCMzGmZ+bOotchpiLT4AwMawTY9UCWRMvMcye3A=
X-Received: by 2002:a05:6102:cd1:b0:4e2:91ce:8cad with SMTP id
 ada2fe7eead31-4e4241911f0mr12890455137.24.1748378235982; Tue, 27 May 2025
 13:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
In-Reply-To: <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 May 2025 14:37:03 -0600
X-Gm-Features: AX0GCFsHvzxiinsPSv0WqpWYNJug5PA_MZLWR3SDuULgtlfcH0M8oGfitOEajfo
Message-ID: <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_133717_251606_12FDAA8D 
X-CRM114-Status: GOOD (  13.25  )
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

On Tue, May 27, 2025 at 2:30=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Sure, that may make sense to do as well, but I still don't see
> > how that impacts the need to runtime select the PHY which
> > is configured for the correct MFD.
>
> If you know what variant you have, you only include the one PHY you
> actually have, and phy-handle points to it, just as normal. No runtime
> selection.

Oh, so here's the issue, we have both PHY variants, older hardware
generally has AC200 PHY's while newer ships AC300 PHY's, but
when I surveyed our deployed hardware using these boards many
systems of similar age would randomly mix AC200 and AC300 PHY's.

It appears there was a fairly long transition period where both variants
were being shipped.

