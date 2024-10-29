Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505A0D74941
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 21:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JblyV7WTsTnc5tXzfZ94G3EE4PGcp0Te58mEyBSswg=; b=tMotma00CqUrsMXNWIx43dqHzp
	NY4a5UvUnGRqhftx8Mag388ttkzYhzK6EYeuWwFtOmcEx1IQMy5SNgGF0ukucxJ7eUclbR++QQqdy
	aBmCXZ8EHKD16Dq6/kuVrv1k7luOH9oYHUnmdy9B/R13P47FKxBstJbBz99X+w54Hqna4JbQyE0RB
	6M6UiCbPGWzbGaEmxdKGfHvIQeXwe2/DZIyU/1JzSj8PpvzmtoR+qgLAHD++56EGRrcvtymVN8KYE
	EnnovQhPTfRL46kNVQ1/e0N4bdZmUtBPY5HA1rIUsCOEjbINZ+DJIj2PYw4YfkEBDdbRFKWSTU8mq
	kIwAKM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5u4B-0000000Fypm-419z;
	Tue, 29 Oct 2024 21:47:55 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5u2Y-0000000Fydq-0t5C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 21:46:15 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso58102881fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 14:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730238372; x=1730843172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JblyV7WTsTnc5tXzfZ94G3EE4PGcp0Te58mEyBSswg=;
        b=mPFqqe+tCUh7CeDIaZ9qXZPixt3lVSug7GFVdGxZ1Xf/mVcBSTyP7f6SenHi4SgA19
         56BFiH5qGtvGfBvtcMpYI2uVMjzffWbgXet133v85iTo8qQ24akMmnizw1cs1k2+TQ7s
         q2jH0HJLZZG8UTePIC3jJVLlLK3NLezGAVNlD/JfUmN0DYK8PHaH59vRjVh0Q1OBuU0z
         whpf+2GnY1kxtdeU1JrRnVvLniLGkV7p5wdwuIA7o9wxuGVPox44aBXBoDF+wwj8hGvj
         Y5l0Rq0uLvvn2x2VXXsyx6rmRtWcE/BSsq/Pa7dkFpCFCrFUlX8WK6k+/3jX5o53VVJB
         iHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730238372; x=1730843172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JblyV7WTsTnc5tXzfZ94G3EE4PGcp0Te58mEyBSswg=;
        b=CwHWYZYYKDfo13V2cd+bXIKHnJvzcbAD98crU9T3KgPDHYbQ4COZTmyBx+NHLuzxR+
         NqMMtIur63mSv90+5ttu6WKjMleJwvlGcGpLE5c8GN8BcMD8mapKCt3II0AsherARn9l
         esGRvtDXOgNhwFBCoQ/uAzzkzipAG0MtjNIqAQotpYUiJ+BiXxMNXmpBpxirMt+Uaktk
         GrIlCv3wP7SelkSVMXDi+a6Uiy/x8qAGNA2AOytAlZMzU3Rcsp0JKr9OEoVj0C0AtAEn
         tFr/Wy75w3DHfz28L9pZNQvPEnZRG+mUQb0hHu86I7HCy57rpMWIAldR/PJzQqA623ui
         hoqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKV8IRvPhWHSavogBLOOSihR/vLAYBGtgZvImszA9+S/udCGnLWa5bGxlr1vUgwuJjeTKChHXh/mlDgSvuX2Wa@lists.infradead.org
X-Gm-Message-State: AOJu0YxTI4uLeXPpWPIpUAfw6KW2uCf2MhycFueeITnkr3BHs8yUvA9v
	+mkTgG3Pgoj2xU/sHe+N+FGX5XAy9iAsdvrJ/uNAq6mxbL9qZytcwAcqrI32fvj0EbJ85CgMrJ+
	HHF4+3sx7Qe+f9h/ZkJnjSbCCP9A=
X-Google-Smtp-Source: AGHT+IHi88pfTT/7FGL5cee/QnViHlH7hwmFEHz8ie9yk7UIpmVR+ZWO36ke5t/IiJD3HDIGyxxtDXcGFtsxJ7egax8=
X-Received: by 2002:a2e:b8d1:0:b0:2fb:5786:251f with SMTP id
 38308e7fff4ca-2fd059e9c3amr6259081fa.37.1730238371622; Tue, 29 Oct 2024
 14:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241029191640.379315-1-festevam@gmail.com> <20241029191640.379315-2-festevam@gmail.com>
 <94745526-055c-486e-aff1-ae178ae0f2a9@denx.de>
In-Reply-To: <94745526-055c-486e-aff1-ae178ae0f2a9@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 Oct 2024 18:45:59 -0300
Message-ID: <CAOMZO5AVPCLsoWbtKDzN2j8rUvvZUQQG_RkuLoF4BnKQDD-QhQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
To: Marek Vasut <marex@denx.de>
Cc: shawnguo@kernel.org, a.fatoum@pengutronix.de, andreas@kemnade.info, 
	kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_144614_275897_9D083EC0 
X-CRM114-Status: GOOD (  12.08  )
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

Hi Marek,

On Tue, Oct 29, 2024 at 5:16=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> So you wouldn't have to write three compatible strings for the 6sl/sll ,
> but only two ? I.e. this:
>
> compatible =3D "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> compatible =3D "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";

i.MX6SL and i.MX6SLL have a more advanced LCDIF version than the one on i.M=
X28.

The LCDIF block on i.MX6SL/i.MX6SLL has both overlay and CRC support,
corresponding to the MXSFB_V6 of the mxsfb_drv driver.

That's why it is better to have the compatibles as:

 compatible =3D "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
 compatible =3D "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This way they can match with a more specific fsl,imx6sx-lcdif entry.

If an OS does not implement the fsl,imx6sx-lcdif match, it can still
match with fsl,imx28-lcdif as a fallback, keeping the DT
compatibility.

I missed updating the binding example. I will wait for more feedback
before sending a v4.

Thanks

