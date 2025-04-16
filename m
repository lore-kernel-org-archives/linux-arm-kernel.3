Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D180C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFJXzkHk3Kj2IxuOJ/Ep1Of/eMdCvzxnv7r1gWoCH1U=; b=whjQwFvuMOQWcbIhMFzLofodKv
	/sJOhGX3hYA+6X1A9r5tZz3SaEySscEynCQxPy7kTciybFn33a1Eac2KfXoXNuaMxTjQCNOzndQCk
	tsvuiFlSf6vzKAIRH9y1fpXg3D4juuVK4Ag50s+8nqDAlx7lfvb2dxpHWukx/FlgVDLYppRgqEcED
	/7wly/rcIELRmz5P9kp5bCHaSkMj9e/nlz4vvV286X7mwGFMxpYvEQYAc//eUU/3xGRwRAvWaIh6k
	nWdM4IPMPE2iq2J8VCebvX9yXAoyA9YFpaHro2AsdYpZ+ZTLxHHydgleQMRgADldapzIt//PD65sE
	foHFTlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4x4s-00000008ado-21AP;
	Wed, 16 Apr 2025 07:20:58 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4x30-00000008aAu-3LOR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:19:04 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso58956651fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744787941; x=1745392741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFJXzkHk3Kj2IxuOJ/Ep1Of/eMdCvzxnv7r1gWoCH1U=;
        b=O0iq+PeWmcF86l+qtbP3XlqLlE368IaaFH/gBVQx/Svd+9h4G9ltXMAZc0mxWXbhZ0
         pUs/KE1VVQvw4jxTVRPqhp/Fnb7zecxBO3UXInzJyj7MPjy9mQEJUfZAlFtqsFg+9ITu
         +GMiiyORVtkIavCmv4j7kSFEdxcQ+wgaSQifFXJxmzq+BTfE4pykjYBG/BQ+3Oqtv4jz
         FEdK12pdhSd9zSYotEXr4Uryh4WtInBCahVHMaa0yfycoJMMJyeqqvJg9S+9smfZr9K5
         g+2ktD0rzGWFkU1W+2yajv5yyJLRXorURpQDhbQ39Rtrtyafam62WZGYqy15bSFH1NXh
         gxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744787941; x=1745392741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFJXzkHk3Kj2IxuOJ/Ep1Of/eMdCvzxnv7r1gWoCH1U=;
        b=G5sOMfgs5/w1l/DWllfNFKWteIqcwIpOeNGUvTG79nkH3k6eleupni6mg6DYiBHY0B
         bawbjtHMVj6Q+dxczzvqSDKIiGUunR7uPwvymymtKKWPkxdj2KYViXft3byDMDcSxZWI
         eGsb1TQA7wh7+q1zPCdurHdk2rY7RjaKcs+sx2S/KmJczr36EkqvreoybO9OSM7aKPOB
         X2zktsnNHF/mRyhRI7YOk3RBrv5+xEoNOv2EV/6y924L574deD7cSdeMoL0CPDQr3hGs
         EchPNvdzWKNoBFYJkgae0+/3han75oabbIn8b/A7aA292Mc6DeUUg/VMqhUtZ14WXPD2
         azfg==
X-Forwarded-Encrypted: i=1; AJvYcCVVxXzmCQiptFvO8hxu/WozPO36JGzq2rTyqxb18i4vqbpy6ER5VA1b3VcHK3jJmp2gzUo0uXrrjRLNggKKa5k4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0qExncM83jWpWUzimJw9M9vw46T1XigSBJrQpIc+Am34YHaSl
	8bf7PV+KhWH5oer/JkoS1bon/7ocu6sj61BRDe9tDFBz+h2aGlhx8roQoPf6I6gPrlqQW6xll6Z
	p0okQ9pNVg4/xkja5zlLz1llbPmwG9FxYtAX7hn9w4+DTyE0e
X-Gm-Gg: ASbGnctK4VuCH7SVRGkONMfLrOHCqTvGZ89ZcpyZI/MwlrgFH/Ryzw/NPdnjXspp+U6
	A+l0ilfcaJ+gkQU+SwKth4GQP8sIKnxhTm1SyJo0RPMLur7j52+kZtxKXkSbEC/2GzS2EqdnPh9
	ZuFN2cbTPylQKb2VPSKF4OD+ZGkDEM8KfE
X-Google-Smtp-Source: AGHT+IEwGuf6I9l4WitaTnVvA0VbevlCNH9pw1Uf1YwESFwjIdIWV04UPwa2Rl6g3j8USJoLTzOTQddgM+ExezMBQpQ=
X-Received: by 2002:a05:651c:12c1:b0:30b:ed5a:6f3c with SMTP id
 38308e7fff4ca-3107f6bcf91mr2027921fa.10.1744787940653; Wed, 16 Apr 2025
 00:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:18:49 +0200
X-Gm-Features: ATxdqUHFBx4p6s8-l7d5L0o8ZWLKTNSVqhv1VO0pGzs9J7s5wacyrKjxAz3vpys
Message-ID: <CACRpkdbKXfQVNGm=QoCHE8xeMKDi5Z1jCmk18XAaTzCcWCDjuA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Pin Controller support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, sean.wang@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_001902_852945_D4C096BB 
X-CRM114-Status: GOOD (  11.30  )
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

On Thu, Apr 10, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the pin controller
> of the MediaTek Dimensity 1200 (MT6893) SoC.
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: pinctrl: mediatek: Add support for MT6893
>   pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200

Patches 1 & 2 are clean and simple to understand, so
I applied them to the pinctrl tree!

>   arm64: dts: mediatek: Add MT6893 pinmux macro header file

Please apply this through the SoC tree.

Yours,
Linus Walleij

