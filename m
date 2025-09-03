Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FC6CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96YaeCpb+HKVPG3JA2d5NfvcGaCRpyQaoylvRtxb4uc=; b=UfACwjU8caO7trXBfpGWz8DjJX
	sx6uyJ73xQ42gT34D1+sDQtBMcoRlYs+VVJ2KVJ+1vWLzX/7NnI/IJEFsUL0A3fizvyP4k2gLAVmy
	XPBQlVy13mt8bbjK5BmeoniFuO0m0FlmxSmucgZj9CiPmJuDIhOb77eyJ1q0qjduefRoXbjVrcn8K
	99lnPw87ly51vU9KKqSl/zDwIqMCOu5ukFNQwrx8lrioRBhgoajaZ5cvXmpKtV+UDce0sv/otifPD
	oHRjIG75bQCarUNA1zNaSMS/erF/2/0AjqL2cX/hq/f+ffDIiyUk3i6TvHQqyh18BdxltV3RmZDuw
	QMACHIIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utvIj-00000007iSO-4BIn;
	Wed, 03 Sep 2025 21:45:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utp63-00000006qCQ-3FRc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 15:08:28 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-61e8fdfd9b4so2272758a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756912106; x=1757516906; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96YaeCpb+HKVPG3JA2d5NfvcGaCRpyQaoylvRtxb4uc=;
        b=RWbqpkyrUhfISe7ygnyzQ4Qe9LeDFuGCKIF6lEFH05U5a8v+/5nzVGP/vO5i1Mtbiu
         bysbg2mFg0ZBNStS9WUJ0mnJF3M5UY+Wgtk22K17VUgbxYAl6pMI946u/fLlDST95IvF
         hwr0/IZkXkgslKUeyJxDRw13ctKkT13xX34yBI3NB7AhLVDxkCymqoMaDxF+5TRjygHS
         ppbY3v74Ed5nYXmVZ5c86uxVQKbrpy2a/vr6+ixy9tIeyGX3vrX8TpiabqhSO+tMR7h5
         8BwCHTZfFOLPDCl7dgcyjJL7ZMn782pEMUb9S075mhYZNZDx6x5Yi45wuAMwgp+Ma9Ek
         hw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912106; x=1757516906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96YaeCpb+HKVPG3JA2d5NfvcGaCRpyQaoylvRtxb4uc=;
        b=jwNeOUXHzDrmfQ2r9wlIFV9fcdttE/c+yPL5S/EQdtaZjqT1M+8L+oCeKjYokn3ErD
         fvE+aYb/I+iWI8Fa1FpNlFtZ9z53UVrZdEly6/hnjzOqD5YSYwW9i8D5OPuZKdt98+xd
         nBbX0//taI9JPEaqOOqm8C84E8H7LY8J5qeA8bBpoed2p2mlFsy5bcqwyYKxxOLdRroR
         T0GepVSqb9cDvkh8t9+LmzZgnDRPIxPG4ojM4iChbYMqzPv8IHqDGz+rVVtnRTw3IVJB
         vvGsZIhGDZME/3x3S7/YtT2UzA0DTYdGURVhEXDwgSSRenf9QD0C1bPLehg/p6ESilse
         bdcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmujkaKt1G0nXXoboG7gkPvg4ugAZIatTRR7HkpJi0B2NfP3pSdxVqDBefmUOtsx9Hq5Z0p7vyPJ8AezwF1Y2U@lists.infradead.org
X-Gm-Message-State: AOJu0YyxKI9AyKafNqcRNr0L/d6qPNjTbFUCMx9qHX28K/nyH9Inreza
	VVGBUt5h9aOZ+LhkFKiOQQYAkq1jmzqRm9uV9aFrUrP+trFr3Mz0BktPtNBKwgjIR+MTZ9DrkX3
	Bxt6BuDWCj9XUm0QrbyrTTr4aFd/VE1TZB4h0TIsXAA==
X-Gm-Gg: ASbGncvpSYz/QgPSxVJ5KcC9+DodhdTTAORgMwF3+iCq9aUT0HOTFH6v/90lg6GZqdp
	0TRONXCrrNWsdM412eRyHIOp5YGcoam8013/RV5qM9Ux7bbWENisjk1HDDbE74xUh5pDy7CeIzs
	ckAC9pVDTHNCiS/5B7K+P7wQqzsJbL37BZY0ykSU6mza4E4/TeSXmVBl1ySn94BncwT/JFS0SJZ
	ZzILxfY8One/lyAGFqOJJqYeUhlAHoWP8Tt/1EF0FLE98a1C5WFBCNnGgaJupcqSd8lgqhLLLc6
	ygG2ZXj59LKSS9rW
X-Google-Smtp-Source: AGHT+IFn7BWyhxyqlF2KcZUxCc0qBvV63/yqKBt2qJWo0WsCdrH2xfKlcteVT3gnPfYsWlvKxJ4MQhTpAo8e8ENe2Tc=
X-Received: by 2002:a05:6402:504b:b0:618:3521:6842 with SMTP id
 4fb4d7f45d1cf-61d26d9c52dmr14417866a12.16.1756912106252; Wed, 03 Sep 2025
 08:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com> <aLHOhKpAQbVCC76-@p14s>
 <20250830125208.GA22718@nxa18884-linux.ap.freescale.net> <aLcdmY-gqd5cFOYc@p14s>
 <20250903045611.GA8860@nxa18884-linux.ap.freescale.net> <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
 <CAEnQRZBCxp4rT=es3fDh2w1Ut=i4u3GCnyoOFjqJEMj3CLWPWA@mail.gmail.com>
In-Reply-To: <CAEnQRZBCxp4rT=es3fDh2w1Ut=i4u3GCnyoOFjqJEMj3CLWPWA@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 3 Sep 2025 09:08:14 -0600
X-Gm-Features: Ac12FXyQRSgi-B9_MD_FBGgX_7saidUAIRI9AwJxOjtr7PuEWmGlg5OZDn0enLY
Message-ID: <CANLsYkwE+6B_CgCJQdYF_n-XOH7AkDF_e2KTJnK4EtNtHRX__w@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_080827_815258_B8FC8427 
X-CRM114-Status: GOOD (  19.40  )
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

On Wed, 3 Sept 2025 at 01:20, Daniel Baluta <daniel.baluta@gmail.com> wrote=
:
>
> <snip>
>
> > >Please give detailed suggestions, but not a general comment.
> >
> >
> > @Daniel, @Frank =E2=80=94 since you've reviewed and R-b'd this patchset=
, do you
> > have thoughts on the latest feedback from Mathieu? Would you agree that
> > further simplification is needed, or is the current structure acceptabl=
e?=E2=80=9D
>
> Peng, please trim the message when replying so that you keep only
> relevant part of the text.
>
> I think you are both right here. I understand your frustration :)
> but also Mathieu's point of view is reasonable.
>
> For a person who doesn't know the internals of IMX remoteproc the code
> is a little
> bit hard to understand. Peng I've given you my R-b because even if the
> feels like
> it is getting complicated it is still manageable and you are the
> maintainer for it.
>
> Allow me a few days to see if we can simplify the logic.
>

Excellent.

> thanks,
> Daniel.

