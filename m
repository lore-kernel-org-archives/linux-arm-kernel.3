Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BB8E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qWCv9pXBNXlSLTUOgXh7xlzBdgLrJ6tkCgRkmuCAqU=; b=NWqBUqeq1J8zXz26pL11cVfRHg
	FVZ/8Mt9JBMFZPdlMlnGyMGqYNbPKJc4S+eSjLS1JxJ7kgbkgSa89dU/sXtye+0YuIBhJGqhlDMXs
	uszclhfWdWVMtiRiK08IYTRwTNB0+kzDAFHv0tWekyc6hkPLtARVHE/tsbh2oYFU+9kVZXrmm3q3A
	wUZCMoG2zPY0lnNMAFl8HzTWx2nBv+iYd6+FoJLC9RBX5zwM63RzvV50UlOdsbN54nNFiOkViIkbL
	f6ktbVO3wgwuCWfu0qkYZliFw5GxwQjBdquunEY5iA3anI2oNEE6Qk9/lvSFKJ3tITLu7hbQ+c+1j
	XDLbzuaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtfk-0000000Gei4-0NE2;
	Wed, 18 Dec 2024 13:01:04 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtee-0000000GeWG-0MEU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 12:59:57 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7fdc6e04411so4016048a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 04:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734526795; x=1735131595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qWCv9pXBNXlSLTUOgXh7xlzBdgLrJ6tkCgRkmuCAqU=;
        b=lP/6bYLbkORbuES74lcKA+fe9LBHxBqLtLJ3xtuv5/FDOei8p/SYQ4oV9iksgWM0/W
         46gmf4PocyNSK3Wd3XXV6d8RFpKpksau4K0TbY34W3+ciGIUr+pGFiIk2LdC6kMYakhw
         1DLx3uKhBQzBge37yoHLFGDhKUBQmfBoO9bYaVt+Kit/yzee+L494XZtgSxS4J92clie
         ZKCUe1S+c9YE6rG/Q7SnOjMUdSXiAKmGzVuUInk3awcVddnBAwXDAUW6BLynFs5cexDe
         zOT+6esuylm/ACoMj3ODVksrUjf3BEauGk2k7iML349uX67AxyKnZp/D3CKk1GYy+GYk
         YV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734526795; x=1735131595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qWCv9pXBNXlSLTUOgXh7xlzBdgLrJ6tkCgRkmuCAqU=;
        b=NILZRTomV7AyuUJ0xX4Zq3BJ3wu2jbhCogbPxCGQiOZ8yJ/NiBXJpazwtWcmOZJrBr
         aRO980FOdRyOEwliMV+JqYVXEa+c75tJOlkygupoJYgx4wEHnyV7iuHx8BsNrEPUiG83
         Cpk/3fQpTgEx0Qgut/Py7mbvKNUgH7BfE5l9RCDd060P7LsOZMV4+zmEGU4OIDvukZRt
         cXbxZJvnjICEdxlhot7KhqIRd7rbXGGV12+zlfBgnqydD3UGOwQSqUDD/Xx3sTVNC4R4
         cjmNN4jnZIJjuzp5MY0wy+spqhjCEbXFbjo2GNjIU6BOEfhtKGa6MNbfjHvi1HoGiQbh
         t26A==
X-Forwarded-Encrypted: i=1; AJvYcCXfjxCyb0vdrdHRTvzlgVHrLovzWqFHzBt6h9Y7snQqg3cMCH4ZT9UYhLpnjhRYVKDDE505ttAHyO/mZ+jLh2AZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx04G27IsRwxQKRBOBAj+uf2EFhsMgh10H4+E9Q+qE6lPuLOtBI
	DMamxmL3y0tmPa8DLiPaW7TiTbbHat4zpxJKuSiZeAZZYmRcnIn1a9jWHJgykXd4vIMUvOtoTVw
	rO2uhyV1JELIX9uHWU5CkrJoQIeiZFPToAfs=
X-Gm-Gg: ASbGncteVWj/KCs6JApZhY31NTh0iJx+03FlVIlZK7NmQIJ/9Genh90RlFuXVieVD+B
	cr/7KvVPSQEVM5GWdkRRId19ZZC0ZuBoU7A==
X-Google-Smtp-Source: AGHT+IHrwBpS6CcQxAZmukcsGo476EQmoqWM2slhHPAXzThtNb2IK1NBH/tbUgYtw/82HwemO/owjrylht1ANbiMZYg=
X-Received: by 2002:a17:90b:380e:b0:2ee:f22a:61dd with SMTP id
 98e67ed59e1d1-2f2e9374547mr3475436a91.32.1734526794842; Wed, 18 Dec 2024
 04:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-5-laurentiumihalcea111@gmail.com> <ZzUJQCeWclsrr/lr@lizhi-Precision-Tower-5810>
 <c47710a5-7e53-48b1-bd6b-c0123865aee5@gmail.com> <Z1r9hWH1ioR5vI5H@lizhi-Precision-Tower-5810>
 <c3c9389f-5116-4a5f-99f6-1b37c1e8c457@gmail.com>
In-Reply-To: <c3c9389f-5116-4a5f-99f6-1b37c1e8c457@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 18 Dec 2024 15:01:11 +0200
Message-ID: <CAEnQRZArKSOtka46A_SOiV2=8bs9B36ubAJM3GqYJZkKyBt_4A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ASoC: SOF: imx: add driver for imx95
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Takashi Iwai <tiwai@suse.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_045956_129123_33388871 
X-CRM114-Status: GOOD (  16.61  )
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

> >>> Frank
> >> the SOF drivers do indeed have some similarities, but each of them has=
 their own quirks which IMO makes it a bit harder to add the 95 support. We=
 need to figure out the common parts and then move them to imx-common, but =
I believe this can be solved incrementally.
> > You should create common part firstly, then implement equal function wi=
th
> > existed part. Finially add imx95 part.
> >
> > Frank
>
> Yes, I'm aware of how this _should_ be done, but, like I mentioned, the c=
hange is not trivial and will
> require tweaking the other drivers as well. As such, I'd like to get the =
95 support in as-is firstly.
>
> Are there any other thoughts on this?

Laurentiu, Frank please trim the emails and keep only the relevant
part for discussion.

As for this matter I think we should go with the current version Laurentiu =
sent.

It is inline with the implementation for imx8qxp, imx8qm, imx8mp and
imx8ulp which we already have upstream.

There is always space for refactorization and improvements. The
current version of the code
is simple enough to go in as it is.

With this,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

thanks,
Daniel.

