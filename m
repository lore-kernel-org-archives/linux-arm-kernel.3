Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DD8D167F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQ1tJffQT1qprHD9d7yQZUs66p4r8g3jJv8f9N6H0Jw=; b=HedkPm2RsROOLvYK7QKpabPdG5
	H5OiN9BwjZtgvRmBNS6hL381hdLYA0B6Xg58wfIxG3hrr7/ONmy7bC8+8tcSzYt7cfUJhAi9Y1xhR
	Dau8aTSjonOlT9qIHJLPEWpYYqNGVG4XuHBcWobkfR0QGLZgSAapdosDgmw0dVwBAJjCdpXOc3lX+
	chDVt59ulkjvJ0+TBdnoiSzVLAiv2qfM7IfQOiXlYWGOaIUE8NrkhqxxjYZTWtVvwBjKPXFSZ9Sv5
	rX9qAeS7UjoooXBpYeUKgKXVoQQglEAHgyfJM7ltKhW+Y9bzTTzwhRjOqGWXVWH/L8UyoG/wfGyX0
	WCdGnHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9AU-000000024BL-3k9j;
	Fri, 09 Jan 2026 09:52:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9AR-000000024Aa-2iAJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:52:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D324A44498
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8759C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767952346;
	bh=fQ1tJffQT1qprHD9d7yQZUs66p4r8g3jJv8f9N6H0Jw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h+v9zXR3HWbP85MwT80vJwaM9+gGJ2B1x1jbzhTJvwbE7JtROxnKqjBzFpB6/Bppb
	 KCnY67jWW5w7iztq15s8GJ3N4TbFJpDSyf6GHSmmsno/4qoy4R/gL3ZQyUSW/AgXi6
	 4klsGdtiDBn8RG/wEkhreeHE2/yNvuwryTCfEFjM/99Sw9iF9M60h0oVhjXyaHXxLA
	 yg79WP6Q1ClZybgSFBigxf2kOuMT72c7uxEFohv26IOSoXF9IuOUVJJLDbX71s55GK
	 Oyd9dbUiztSe+Kyb/QuSVf1uoNZXCg8ENF7292SyYWrr0oNJgNosGNvxn6pZGTedTo
	 1M7xXQm1mm6Hg==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6446d7a8eadso3637895d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 01:52:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZzOKeAQvu8YyIe2HwBEZwotan4qeadNOp1JcasPXekOpjTnSKiYeH9NLl9x4cqsvunyDPdBmzb3B2St7oo8q+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1xzNY8gBw7nwWnAVM2FjRlYMnuEAlfE8rkFLe1M0KwYSraGso
	XV+6Zfxe4henht42hyEYtwthk3IZY/K0dqiRrshE0Nk57z1JSaDIAXBL5XqhTSLTS5GJ4tIc2Gp
	84xZ4pc5r5uFnAmptanoGiz58K0lmWzk=
X-Google-Smtp-Source: AGHT+IFl+ErtwuC5vJB7FQDU7XpIoJtBTN3jHxe+AWD5ehVTJ4NoJsDHhflCFGEIV2ALI+7K1MxEBTnysWlIEE1/Is4=
X-Received: by 2002:a05:690e:1882:b0:648:3d3:790a with SMTP id
 956f58d0204a3-64803d381e8mr1065328d50.17.1767952345952; Fri, 09 Jan 2026
 01:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com> <20260107-mtd-memregion-v3-3-f9fc9107b992@bootlin.com>
In-Reply-To: <20260107-mtd-memregion-v3-3-f9fc9107b992@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:52:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLn9RdCPXQQi-7z2Pba2od4n5jSvh_7X-e0fUKWC+dfM-A@mail.gmail.com>
X-Gm-Features: AZwV_Qg5QQFy3AmO1hR3ASLJtvCVyx_cqfPdctjeTMOQ0Cjj3dOpo4MEYroa2cg
Message-ID: <CAD++jLn9RdCPXQQi-7z2Pba2od4n5jSvh_7X-e0fUKWC+dfM-A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: mtd: physmap: Allow using
 memory-region to access memory resources
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_015227_716042_C64A625B 
X-CRM114-Status: GOOD (  14.64  )
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

Hi Gregory,

thanks for your patch!

On Wed, Jan 7, 2026 at 2:05=E2=80=AFPM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:

> Enable access to memory resources not only via I/O address using reg,
> but also through a portion of main memory using memory-region. To
> achieve this, new compatible strings have been introduced: mtd-mem and
> mtd-memro.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

I have two issues with this patch:

1. It needs a description: telling us when to use this and why, and
what makes it necessary to use these new bindings instead of existing
bindings, like the following:

2. To me this looks suspiciously similar to reserved RAM, "reserved-memory"=
.
Documentation/devicetree/bindings/reserved-memory/phram.yaml
Documentation/devicetree/bindings/nvmem/rmem.yaml
Documentation/devicetree/bindings/reserved-memory/ramoops.yaml

Also see the dtschema reserved-memory:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/rese=
rved-memory/reserved-memory.yaml

Why is this using "mtd,*" compatibles? What makes is a
"memory technology device", which is admittedly a loose term but
usually means some kind of persistent memory such as flash. This does
not look persistent at all.

To me it seems more related to specific Linux-lingo around the MTD
subsystem and just happens to be handled inside that subsystem in
Linux. Which means it has nothing to do inside a (OS-neutral) DT binding.

So I'm a bit concerned, but maybe I misunderstood something!

Yours,
Linus Walleij

