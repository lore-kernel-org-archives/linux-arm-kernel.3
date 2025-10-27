Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F12CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 21:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mU5C7SFfUC6J4CkhOJClsnPEoZvWyJV/mtXvk0G7No=; b=qd1HtGauIvxT+7pdMj7LJ+nNHl
	Q2HPE2dwWuMDKBtaNB9MabX3XoUMjPPVB6CvU5uLZ+4+UK7gkFdY5vNv0/Yw+TH1VZEvTJp3ZFHZ1
	IuCulOU2f+1mBQUyRDtJvxZSRuY2un77/bXC2lS1Eo4HiX3dw+s5iQFXpAsnTchHRiE7DbhTSsNVN
	+skIhoJUzJeoWWtr/IL7k5jiF8S/zJ66ZKsYLQmlvuaS5ZXJwxPzGp99hjTzv58e9U1CU2vd/yNtd
	JaIqnhK3OnnWP6EKjvKwbo7WiTb/+Y01NDl+z1bO9Ery2U11O627ru93MHcpFoK7/lF4FkBWx/3PO
	OxQY3mRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVEw-0000000Eore-3aGg;
	Mon, 27 Oct 2025 21:58:58 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVEu-0000000EorD-1GEU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 21:58:57 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-592fa38fe60so6039580e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 14:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761602334; x=1762207134; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mU5C7SFfUC6J4CkhOJClsnPEoZvWyJV/mtXvk0G7No=;
        b=d9KliUdy55pdZP5eW+Fq1jfK7YhWxDRjoWwfbmML9b3AZ7q5xn6EooHX3Cz20eRZ+L
         109HE4guxbnwkUFs5O3qd1FhQLviJ1hXIoeZJ3GPOdgVwj/xKP/w0wgmaswx8ALBQeat
         S06WSaeJ2ZaMtnSyYYbbQw/EPDa+Bx6LyEcIM5yPIAQHh8PDLpK8cjoiq7HVJRM/ywFp
         3YCyvKOeGNpINX/gmA2PppyCbNLO8nDet2pHOFyR3G7MyynO6gI1PkeEvZ61C37HhzXn
         BKrKqEt9E11foLKYL6FXTaGAXo5orCNT1UxWVVowB+dSpONivEBUmJhB/zkG0mqVzbd9
         uHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602334; x=1762207134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mU5C7SFfUC6J4CkhOJClsnPEoZvWyJV/mtXvk0G7No=;
        b=KChT1ophNBBEt4o9Eta7fyQbI0d/KPf1XU1y3ghcBPX/TkG4JV8dLWoSW0okKBCmDi
         6WkuHS+oXv2tYawLOpvJWhtTgUs9UEh48dub+7d037CkKIcy3t1+2+FBzzXLeDWe59oM
         tnJLdijpgy73vzR8sKxX3p1dxX+JkfwcfqWIbZfCaR+KP8PNwoWuFI9bKWa1W7NYSdjm
         hvg1kbp04+eDPe1ONguoKZsV4Wpbf0o6uPeE6YiJ1vUZ+J50DFXV0cmgQXWUl9X77JlX
         /9zOy04l9ky06p5SA1qiWIGAtbt1EiESqnGldkabzcPG8blx90nO7znhW3Sj8eR5YGz7
         szOg==
X-Forwarded-Encrypted: i=1; AJvYcCXIuf8h4ekiIBhpgHNVPxN3h0r2W0GJjzktT5qjUlHm7XedhLKdecAcXPz4DTATWrO5FRKKK/NXQMIhYwWtJ0mE@lists.infradead.org
X-Gm-Message-State: AOJu0YxmKlWc21u12oa/w7/NRI03M3M9/YecdhSGtBIGW1AtiyvtptE/
	T9kLgi9zq95ZiP6z3Y+W4AsS37sF6yOFs791ty5d7Avq3Wi+D2rSRZ1UsNTjwsOKcn67665/QHn
	o8BVWGVrv3zRZdUbSH1jlIK1yUDJ/xCuqH6D3FJbXMg==
X-Gm-Gg: ASbGncvD0RZnyC4RMbMBKhZGIfUZeAtI4lJDnnVWQg8sUnlN81rJFqdXDQ+m6qYWM1U
	ZL8fI7czmefk5YLaQxBHUkZeIJJeZS38GEJ+7UquIkxAWjsrQpf5OC13F94geUxlcl5RDjH/JX2
	t2TPkZ17qRA5vAzssolQQVaI41Vl1PlaqW2ma4XgVxP7kdkTav/rpn0BHi3LiBIXGBjK+/FC4A/
	GMy5N0izM3TATkLVFVEepyQyp8D5RrRKfqpusHmTIMUrshPNEriY43T0ZUS
X-Google-Smtp-Source: AGHT+IH74o4YwHFrblcCgtKny6KnIQvfpnqGtyi6DTdYt7rXfkYKCJxr/ADLzmPlUwLvMuIMarNyWU51gxQT7nyU5+s=
X-Received: by 2002:a05:6512:3f0e:b0:592:eeb7:93ed with SMTP id
 2adb3069b0e04-5930e9cc2admr556166e87.32.1761602334166; Mon, 27 Oct 2025
 14:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251022165509.3917655-2-robh@kernel.org>
In-Reply-To: <20251022165509.3917655-2-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 22:58:43 +0100
X-Gm-Features: AWmQ_blAMBN4XZpjKBnIGmFZUkW4sspYUvqfxOKik98qDG_Txt9XayPb2-OwUdA
Message-ID: <CACRpkdYioyktQ5is6TJnkgX=MHk2-zf-XO-gx6sKcST2GABNiA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_145856_361941_E6465EEA 
X-CRM114-Status: GOOD (  12.23  )
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

On Wed, Oct 22, 2025 at 6:56=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the Marvell CP110 System Controller binding to DT schema
> format.
>
> There's not any specific compatible for the whole block which is a
> separate problem, so just the child nodes are documented. Only the
> pinctrl and clock child nodes need to be converted as the GPIO node
> already has a schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

