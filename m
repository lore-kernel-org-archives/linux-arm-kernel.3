Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99F3CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 21:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9Wr+oB+yImWWeNWztttdaO+JL7qll64cuGGoO1pokQ=; b=wznIn3UkriMFnQFLt2gPxy5AtH
	5OM5OaZs1dtoZTaHYz+qLxK4chaa4MlHe9xbv5uOLx4SVP/exeD0rRbi7Y6VFGH7q3WkNtqFmKZvo
	zUl86Cd4sFvF4WZM+/fjXVlEZdAwmOHQr5FvwwCsgYlVgr8252a33AJhZCwaAt0/4K/5q9Uq8VUbX
	u57f2uC7+Axkvck/irxarz+4WI77XdPRWcZ+nXWm/Ppb5Amf7sLHAeISwTZ2NivmJY2kztx1R7/bk
	cYePaP14g21/I0p05JQ/5fG3tjoa15fnLqIf/V+ol0KBKNWc3DnQcjWf08Glgl2A7vRxWhKESG6AB
	CKRh8BMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ygq-000000005vZ-1gYx;
	Sun, 28 Sep 2025 21:12:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ygo-000000005uk-05lH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 21:12:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-27eed7bdfeeso33082825ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 14:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759093933; x=1759698733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9Wr+oB+yImWWeNWztttdaO+JL7qll64cuGGoO1pokQ=;
        b=Vm4Xdosuc3E4qt8PzYKNbqtn4PkuWoCh3mCGhJqB2kd5SjLilLKFR4NLp4gbKuMinY
         zLMKTMBK91Ggc/oSiayw+ShZplmgQsFnQweravUuLge95fSgUHb02xOcPQl6nrIFyMvl
         n9rhZlUI/ydjh3j0F9oxc4y3Q/iWXds+CqobFAUycufs0CBOvwNcfHm3ivMTjLhVDRUc
         ce+wyNg/BdHwl7O9qt0ymRT0UXcKX9Ac+8C7zczSgf31A5I53440KpW8vSA2G4sRQq8F
         Mnv0RoInjre/5ltoL8NYORi6RAX4LD1YO0NweT70qXcju9cSWD2ZZgjZxl+QHUxPBh0n
         2Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759093933; x=1759698733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9Wr+oB+yImWWeNWztttdaO+JL7qll64cuGGoO1pokQ=;
        b=CEsJNxDWNajI6tyVftkArzzZaxHicIrY9hKHshvAKCMx+emWiYEqznr24hlwtfx+4v
         CZ3KY50qhS4Q4KDRgE/NiRWPeDze/l9RQnjLg8dL6EeHU+uY86kw5YH2VP/Iw58zVaKo
         RyFQ4v+yRbG4xlDVZVvosJKH2wvZGN1nAw+w6hYSK4ApyUvLZEh85R8JYK35sK0E9AMD
         gT9jjL/xzhuplCvH4L7g6IbZYCsU4fG2ZREKgyz92cctTE90MvUPfWC6/p+bzY/sPjEe
         QKHR6vl+eFJNYhWdmhkFzWI81c/eYECLy4curfK2RB7ZTo5lGKjzDLrDmrx3ymG3/wta
         buBA==
X-Forwarded-Encrypted: i=1; AJvYcCVmIYT22JH/TyTVoBK/8EtDDbbE1JtbnoAwDqL5rvN9TnTsFcoq8QvXloKzhJl5RYKupaMFfd6x2/kWhmOdFAiv@lists.infradead.org
X-Gm-Message-State: AOJu0YzRzscDgrSe9CRc6vw6mXnug5h3iPHxNZhD1zxl7cYrzhum5xof
	V8w7M9xFIWn1EKsN+SJpmlT5xaO4eTxH/76HwnRonpjERYn/iXIeqe7BgtnT8SP6cFJkrQZGOYc
	+yl6/Fkx9IK62/BIhUVlcBiIrcovR6V0=
X-Gm-Gg: ASbGncu0bnu5E7041H2sXCdaZPSRR/o3ohctJ6bcBZ7ELC1xTR603wkczztJ3N5Gm0E
	yqHqRUxYOh6enIAHKZLxkZ1Y0ElIkUxYDyPLro0TpqzvUzl1mHW9YGjZDjbXF0b/4Omhua7krYm
	foV0gVwKWZucZaKHocczcMuRM4EC2NzqjcxwilW7yKh/zvcBqqCTcOv/alKGFOY29uSeYstswxE
	VpjCmnC80+Az2pcdV4ovv6fyrb4ouCOO3uFCyalu2M2v1GVNax31ej2qpluUg==
X-Google-Smtp-Source: AGHT+IEzeCWoAcjeQc0mkokrPasLODpJyV0OvfwXH4nf4WOVTR25YxHcNFHmxB2wa/0TSLPGrvZCSjajqVhJuA6GrUs=
X-Received: by 2002:a17:902:ce01:b0:27d:6cb6:f7c2 with SMTP id
 d9443c01a7336-27ed6e0575amr147835175ad.17.1759093933080; Sun, 28 Sep 2025
 14:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250927125006.824293-1-christianshewitt@gmail.com> <20250927125006.824293-2-christianshewitt@gmail.com>
In-Reply-To: <20250927125006.824293-2-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 28 Sep 2025 23:12:02 +0200
X-Gm-Features: AS18NWD6fXr03inON1_wapYEKrdYX1AMtat52gOUZi0JEEmswI8favZ4PtmwBLQ
Message-ID: <CAFBinCDQc=2xrKbGunSKJjLhGd0bCGN+3oYd_bg0ySs+WHxZjA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add initial device-tree for Tanix
 TX9 Pro
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_141214_059529_7175A523 
X-CRM114-Status: UNSURE (   9.69  )
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

Hi Christian,

thank you for the patch!

On Sat, Sep 27, 2025 at 2:50=E2=80=AFPM Christian Hewitt
<christianshewitt@gmail.com> wrote:
[...]
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2016 Endless Computers, Inc.
> + * Author: Carlo Caione <carlo@endlessm.com>
Is Carlo really the author?


Best regards,
Martin

