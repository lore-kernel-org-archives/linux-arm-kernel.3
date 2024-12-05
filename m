Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52926E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 06:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=635HXEH9z9+euuYtdUWAXhck3oezPbylgKy1CXvtRrE=; b=3178BZbAMRkoeB9lPLNjM3LNia
	jxT53pNVSR1mEQExbPzCiFwe8bYZ5f2R+4COI6tgtAGCPG5pYWE7IrayEEdKTBq4eD7X8Fqxg6CFC
	1Ok70VwzOHv/d0XCSDuaSYcOjtLTPsawrZ/jR2R6omFPk2NmM5gLa7bSIrpNVMNtDtEQpZaNi0LW+
	3ULiy9vX7pqoX1ihhDVXRwokxGFLkVSl+ty/o5N4x54+yU2P9IMUy/lN5SHShVZpMkYDeWzIwo53y
	gL76mnReXBkJGR5SSHxKREKavu+ZJugS04tmq1xpWAI0hB+kVglX+nWWcoscCtr3UCdrQrwLCBHCw
	JN/LN3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ5Gm-0000000Et8y-2VXg;
	Thu, 05 Dec 2024 06:23:24 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ5Fm-0000000Et24-07fw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 06:22:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385d6e36de7so473170f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 22:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733379740; x=1733984540; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=635HXEH9z9+euuYtdUWAXhck3oezPbylgKy1CXvtRrE=;
        b=sz/rVaFZFV/pDXRabuh6+hF2hG3cSwibQb4XhtHy9awuU7Cu43VXTazfHOcHtyVctm
         aPqXMV1RRx3HHQ1x6QQumc8cPPNQ7vJoa0Ny/Tg3/dv9BFGvvwqWOi9xHxdghdZ2ERiE
         ngE7zcRDs9FcFTqvlYrEKfhI00Ymmori1uyM5PkjVaP8dT0970RyqMjRUwea88LcDmBm
         jp1u0ETo/W6g7dhDxqd7t+bZ3IdNbyCfeYG4rk4ZvnOPgn+gb1U6kVh8vK+XNWlOyE1l
         GV/dc8eb4CdbW3OZQAzfVvnN1RDUaoW39MGdKmr5NLIIdtQFEx5113gEygXhKL6vyBNb
         CZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733379740; x=1733984540;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=635HXEH9z9+euuYtdUWAXhck3oezPbylgKy1CXvtRrE=;
        b=eDn1wPadU4oSUK7Za/IPw86hGEnJAvCqik2yyFx7IcmJfj/in6dW0Gx8ZNDHD0gF67
         wgL5smbM9yTTpiirK23hRqcyHWB40+j3IXDvhO10IDV4XYOkGc5jfSV4mTiJmqg4eTCE
         GvJ/cB5riyGVA3AtuBnizbyfEj457Geqc2lY4ikrJZjZVs2JXyQUf6R5d2K27D0SrDEM
         1ByrNCKJdfto8WcmI7qkAJxXN/gFN3loLD2BBYcD8Cz59BFzOOHmkJXUwW3DM4Zv7Oav
         lP8KYxXDOlS+23vT5+bQME4fKPIkwKMB2i3Cpv/f+JNvzbXIGn6EHKXc9r0RmhONreyc
         EH7w==
X-Forwarded-Encrypted: i=1; AJvYcCUHgjNgF8B/xsrq0pocoC+2T+b76ltlvwsFsmk+NcXDXGtNUzKJLbLVMS65DoQqeoWMZM461grIKCQkZe9LHqoD@lists.infradead.org
X-Gm-Message-State: AOJu0YxUA8vjzeTB1nEbkRhMXaIxQayc0TLJDouH+diRZuY+dJzwIr65
	DC0Y2yQ7BEREr4xzkkyF37+6Rh1bCLlaAIryVHlPnrO3dU1UA6OUu68DlZXJbJc=
X-Gm-Gg: ASbGncs9iu/sr2BC4vEW58P/Xheh5z7yYcKi3Xar0g5jEeWVQwDesZ6Vw+67Y04xUwi
	/2+NX2h/x8w9S3vcOMr+6HBbbTSSKWzAtxDUenvFwKuAHPRfGdCrg8r168nswWOW38FzkbR21KQ
	gpiDotkfYKqyybebJOOjIuzpCYd+/9UpblhS0mmUa4jTr+/XZan7ogWF3kNjX2VTL6f2q+2eWR+
	13ZOroQMmWV37+1K0W2BmNXLBTNAEVZXlwPGFT46r6kgchrcA5RxA==
X-Google-Smtp-Source: AGHT+IGp/jNJTmdaFQ6E6rKRxd5mOl5DWkdNmDAnwmLFHgFS6wCHCx0RvANhN0Zro7KAfaQqmMGFCA==
X-Received: by 2002:a05:6000:1a86:b0:385:ef8e:a652 with SMTP id ffacd0b85a97d-385fd43c331mr9424928f8f.56.1733379739965;
        Wed, 04 Dec 2024 22:22:19 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52732casm49399175e9.13.2024.12.04.22.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 22:22:19 -0800 (PST)
Message-ID: <2a20b243ade39fa240f75baf22a13f02239e3411.camel@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: power: supply: add max77759-fg flavor
 and don't require nvme address
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thomas Antoine <t.antoine@uclouvain.be>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Dimitri Fedrau
 <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Thu, 05 Dec 2024 06:22:18 +0000
In-Reply-To: <5281f86d-6917-4f4e-b85d-70502a24c5bd@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-2-98d2fa7bfe30@uclouvain.be>
	 <e23721ebd766f410103ddfb8705f3d7d6e5ae3e9.camel@linaro.org>
	 <575b3275-b2fa-4e5c-bb6b-759394b02e18@uclouvain.be>
	 <30b0995903fb7db3f866d1304783d878f563fe2f.camel@linaro.org>
	 <5281f86d-6917-4f4e-b85d-70502a24c5bd@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_222222_073492_46A10FA2 
X-CRM114-Status: GOOD (  21.40  )
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

On Wed, 2024-12-04 at 14:13 +0100, Thomas Antoine wrote:
> On 12/3/24 11:40, Andr=C3=A9 Draszik wrote:
> > On Tue, 2024-12-03 at 11:23 +0100, Thomas Antoine wrote:
> > > On 12/3/24 08:12, Andr=C3=A9 Draszik wrote:
> > > > On Mon, 2024-12-02 at 14:07 +0100, Thomas Antoine via B4 Relay wrot=
e:
> > > > > From: Thomas Antoine <t.antoine@uclouvain.be>
> > > > >=20
> > > > > As the Maxim max77759 fuel gauge has no non-volatile memory slave=
 address,
> > > > > make it non-obligatory. Except for this, the max77759 seems to be=
have the
> > > > > same as the max1720x.
> > > >=20
> > > > What about the battery characterization tables? Aren't they needed =
for
> > > > correct reporting?

[...]

> >=20
> I looked into it. The probe function launches a delay work
> max1720x_model_work which will try multiple times to run
> max1720x_model_load which leads to
> max_m5_load_gauge_model -> max_m5_update_custom_model
>=20
> This last function writes 0x0059 to 0x62 and 0x00c4 to 0x63 which unlocks
> the addresses from 0x80 to 0xaf.

OK. The regmap I had proposed was excluding those based on the
datasheet I have, but you probably noticed.

[...]

> If it is indeed the case and that all of those are equivalent to their
> max1720x counterpart, I think the management of those values should be
> added in another patch which implements it for both the max1720x (and pos=
sibly the
> max77759) as the mainline driver does not do anything with those values
> currently.

Thanks for the analysis! And yes, I agree.

Adding new required properties to a DT binding is an ABI break,
therefore I was trying to ensure the binding is complete from
the start.

Cheers,
Andre'


