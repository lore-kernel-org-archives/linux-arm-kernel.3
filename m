Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C23E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FstVX3CFTj+42MS9laftTg04okRbVpQOvmKeh9DZMHs=; b=aTkebrddddIobdD3hQLSuhWV7T
	KFkEpq6tUoKuz3fC3OResiJP+hfZIAygVft8pF6Gm/9UlEpfgpRFdx6Gu6Ns7LWkiZogRC7+oaZIM
	CvzEwtrA3/92Z+Jg8q16oi4NlzqDoZ0hoQRtd9Lg1lN/6stzhk7C7W5cGWdgyMEy/aNVxsfDsPMkk
	DByGUOdDjIL9jhkeun/7o3CSy7oNfnUBYkhUJoQivJ6Q1gKSXucskm6G5wGWQCkWyI3syjqSw6kVQ
	vcEfH91ptpdAjXviZcLV69CS/uqo6iAfeDvZt/F80ADucAkGl8nZmmTjqlEz5nj3SFVIkT6BagVC1
	xiY7FeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXX0-0000000DYgo-08Y1;
	Tue, 17 Dec 2024 13:22:34 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXUp-0000000DY0g-37BZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:20:20 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso5423908e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734441617; x=1735046417; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FstVX3CFTj+42MS9laftTg04okRbVpQOvmKeh9DZMHs=;
        b=K7DF54akf7izak+WsrjZriQLpwIMYVs99xeCPR2rpVo8B7akzbpFIKzVk5xQ0CO7/C
         e7VkG0SOPvBYi1lzuwr0iIZf1/s2XpiL/KW1vOASzHNNcL/QBoags+i8AVRcUTJ8VhG/
         1ERj2cibzyBufsI/q+8GD8ranHgbCKZNOFNFaZq4/ZumDh163m7sUsl+bklcZ0t4T9Yk
         D8J0BwCXE1i7poi8RnIQ3OnxG5H5/9fFqHnGwZARSBsd9XerFghl61rLhweXNpxsB4QR
         Tnm0RLHw7TQAGb0yb9Lqto8qLR5ZkMqF84FlgKv6x8fCqwjtQ16R0gLuB7eMTDO9AA6P
         4yfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734441617; x=1735046417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FstVX3CFTj+42MS9laftTg04okRbVpQOvmKeh9DZMHs=;
        b=M9nEwactVMPfrG/iaKSZRn5akIFpBu/8zALF3JWkWkCbq0l0yWQBoWcR6ZUNt2F8XQ
         a+DkYYpseLg7SIDU1h4uKKuCdU1xos6hQ2+WRe9l7m75bZzArA/ZTkLmkDUq4dsDmwU0
         grsbUiBj0JXXt+faSIf9FpOqsKkufNSEAMGntGNMxWcb1yScqJLpxWC/iG6OZUNaB/AA
         Wb+oQKtlwXRp+u1Mvwcs78epa/AbobHf52NvNOVOyRA/ej/8nldd8s+vkIQCgfDcNI+Q
         8bOxpKM0CZ3qWre+Xl7ywYpUPnQbokgupH89iw2dbxdkgUrZFc2IGRgUoHpkGyqor4vb
         /MdA==
X-Forwarded-Encrypted: i=1; AJvYcCW4Df7Ub8Ja8vC9KXmgs2JJ3TFyGqDeLeiiXchcnwchIhYUmCWJ4mZ6QVnR4dfexZfTJQHmRAl8OYtBIcJEdzNf@lists.infradead.org
X-Gm-Message-State: AOJu0YybIbUD/P3eM81z+Jbwr6Zh62mNfHXHJ1wq49QEEyAz1/D6euH9
	Gw/7/ymuv1H19Koy2uYQwFHMWe3F+w4Ed9R4rpxUwWhXOFGVbONC132OhpPerQKJRlzMesPCI5X
	VWp0w55t+tSToLLKeGm2TZVJ2dWQ=
X-Gm-Gg: ASbGnctFxlIeTj91mG1eMv/5WsFt9YWqLszenCAVPYbH65CrmGudgIq3UwzYDN3TfKQ
	ih4rbXz6SJHoiYIZkgD4r3M0mUhvUIWGkJJX46MKo06AHYwD20gZ1maKznQOTmxW92tuj
X-Google-Smtp-Source: AGHT+IFFx90kPbpMheYOE1177/QLK8nVCI4FlXeGlR99M7gIZTPd37rucl/NQo0g2oJIrbiMhA6SNFXFscAA/m2smM4=
X-Received: by 2002:ac2:4e04:0:b0:540:21d6:d681 with SMTP id
 2adb3069b0e04-54090555494mr4984098e87.19.1734441616935; Tue, 17 Dec 2024
 05:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20241101135406.47836-1-festevam@gmail.com> <173073495749.210192.9138587910771237679.robh@kernel.org>
In-Reply-To: <173073495749.210192.9138587910771237679.robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 17 Dec 2024 10:20:05 -0300
Message-ID: <CAOMZO5BVLpQecZH4vvmRi=KfZ=MvCgUQ_tUKjvUzMGO=wTU-MA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, shawnguo@kernel.org, imx@lists.linux.dev, 
	conor+dt@kernel.org, Fabio Estevam <festevam@denx.de>, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	krzk+dt@kernel.org, a.fatoum@pengutronix.de, dri-devel@lists.freedesktop.org, 
	andreas@kemnade.info, marex@denx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_052019_777716_5055DE58 
X-CRM114-Status: UNSURE (   9.60  )
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

Rob,

On Mon, Nov 4, 2024 at 12:42=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Fri, 01 Nov 2024 10:54:04 -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > imx6sx.dtsi has the following lcdif entries:
> >
> > compatible =3D "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> >
> > This causes the following dt-schema warning:
> >
> > ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
> >
> > To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
> > 'fsl,imx6sx-lcdif' fallback.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>

> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Can you apply 1/3 and 2/3?

