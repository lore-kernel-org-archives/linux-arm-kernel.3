Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DDAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HdsNeALPBRl7TJQey6t9d/l1PV0RD8jB7VsA4lZuNc=; b=AcoOXXQNmKVuyVT9E1pmx/Te2g
	l2/mUiZ60aSLxUjyyVfc9lV52zfXVe5zj4V8caZ0ig1bYq1+zqyyipOhXIaRiYIOP+BPMY/gmzRcT
	l6Ao7GyfTYev3s6PIv+T4U0v4ZHtOe+pn5H2ZTfG81QkyoGGcy+6PngEKa38xq0C//zpnyx0Zif+H
	cjb5opfEt25iVHkZnR+27LGrOAJppBnqM4iUtQwUSNyYDGCyauKhOgYL6zWuqGuobsb8PQnBfknwb
	0WvWx/HxVCCU1V9y40jA5GvoX7+uVARAqZEl2Iy0ikp8X2TCOF8lqDnpDexj5wo4iDNXeVZHnCE22
	cOf2IV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Edg-0000000Dxqh-02Tq;
	Fri, 11 Apr 2025 13:41:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EUv-0000000DwN1-316B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:32:47 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54d42884842so1670567e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744378363; x=1744983163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HdsNeALPBRl7TJQey6t9d/l1PV0RD8jB7VsA4lZuNc=;
        b=JS2lYyci9yebaubgDioSE9SOWXxYQYbLQCn+9LcL/S33aIFYfamT0pTkhc2Y9K5S/E
         y2Bl9Gfkt5YCEHdNGxRj04n8tvucRQpNPAWzaUrd8iFj3j8PjfYRqMx5RoQaA5J7VQPZ
         RCsijILingZJtgzmhrsX2gfT1EuWai6qIpPKheQ6QSsmq6EWQgPuFxS76AgFVJJnLBen
         OeiVZ+sTSCiBYXfN4iPn2QcXl9bOfMVQFVDaQ1IZhhJTzpKez7wNdyG/JpJLzbDIM81n
         5sWGl/2BaRZv2l9UA3CLm6BRUlWacJokfZ2xjlzWvIjD8FpMeIdEAM+Hcve4+K4VVhJP
         LCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744378363; x=1744983163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HdsNeALPBRl7TJQey6t9d/l1PV0RD8jB7VsA4lZuNc=;
        b=cSOHh+OXsbA9F+OnXytEoliH9YdAhBxpRqMCt4SQLiy13Tw9BYmRg0XR6UWNmRqzmX
         xZg2QXM9gxeCW+GsgcAm/DStxqe/29ef9wBICWCRgUH28WYZ46vB3mnuoIxTYd5PCvMx
         +0qHCSNCQNBs/Stt3v4izeQb/JnxE7zhptXpcdJj0CbCNsQfwSeoHuLkNL9KNvLbHk+z
         Fl1iKoMp7Z9JydmgQUa/D/G+DcB43wkCNHg/XAZyttLZWdv9s2AMWfSjJuExikdVcrvH
         95cLlHg8Cc/pNjFZj0ernLFIgYV98QzjfmHLRPHDlCJ1KT30PlDDnPAGcJYiE9soAKz7
         LxZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFF31xIR96ZCwSn64iJKofxAH0f71V6IOSape2I69IsIa2v8z7GNT0AS2MVv/nI6YZt0IaKQD7zmppV9oiTT/Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxSRMqRZd7nzWjyEeqXR2JGpQH6TgmDKimO7Nhy+EMhztSFKKSD
	iv0g6+4vFBl05oEpRqedEDMtksPnhMR7+it/aP5kmjP5iwHH5MZw/CpF+GVh95wUwYDuTUEiyzH
	imF5+DamtKSMjoyedy1MAnk4vdNc=
X-Gm-Gg: ASbGnct9IX4VJzHZJyWynayGOCtl7gajeHcRf+oxBx3MC1FsL7y0Dhp/+YJb7nEIdLt
	cIXwfLY6jfd5eiwV3LwNpPs2nknTlNpShwFudzqgsCcuHbkZBExAJVdeXwp55VgMjDjvme9VSuZ
	f4jvwBUIiHKZxDlcVov0dXuP3Fdh2TeaPbI2BZPE9ecOG51wNXTjv+uA==
X-Google-Smtp-Source: AGHT+IE33NDJqid6qPgYC+c0Q5rSljAhPbuipqNwWv+AwO2kvaeyl/9m5RUa6zx/o/+6PMIcz7x+vDzf+xQLmDGeeMs=
X-Received: by 2002:a05:6512:1095:b0:545:aaf:13fd with SMTP id
 2adb3069b0e04-54d452e33e4mr939323e87.51.1744378362995; Fri, 11 Apr 2025
 06:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250407145157.3626463-1-lukma@denx.de> <20250407145157.3626463-4-lukma@denx.de>
In-Reply-To: <20250407145157.3626463-4-lukma@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 11 Apr 2025 10:32:31 -0300
X-Gm-Features: ATxdqUHrNbX-n4olVG1x03xQyfka5HcmTFZKe3_PzzPGFy-GrmPZgKlTzpzOW2Q
Message-ID: <CAOMZO5B6q06nvk3+hzbioGpcW8_JXPZGEebApTU5JZbKvMLzxA@mail.gmail.com>
Subject: Re: [net-next v4 3/5] ARM: dts: nxp: mxs: Adjust XEA board's DTS to
 support L2 switch
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Stefan Wahren <wahrenst@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_063245_754344_7C1D053F 
X-CRM114-Status: UNSURE (   8.19  )
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

Hi Lukasz,

On Mon, Apr 7, 2025 at 11:52=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

> +               ethphy0: ethernet-phy@0 {
> +                       reg =3D <0>;
> +                       smsc,disable-energy-detect;
> +                       /* Both PHYs (i.e. 0,1) have the same, single GPI=
O, */
> +                       /* line to handle both, their interrupts (OR'ed) =
*/

Please fix the multi-line comment style.

