Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1647D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 02:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JFoCG9If5tB3iqR5NtPiIwHM5+YiLPesQV7/ZikZQ8=; b=gEvck693Bzs//QnyS2b1MqDHOp
	DmmitnvQxz+3smhzAF8f2gEIFb7arbMy6VvCJ1vifDL5mjzLJGHvz1Z4YEsZwu9ESBMN56MOasOmJ
	JfRJLBhBboLb2IP9FeqdKMbHPVyGpmyiF5jutXzDapzbSKaY5yzxccmt8JhFKBHOOp6oiR7MtYIfO
	mivZhaDuoWFEEe6+KaOREIJ+p87mn/rIoO/cZNIWJnsv4KDmn0mukXqaDThtOPRCyDUiUWMlr0g2W
	uLtDhAK3g6qKiWmqUCWl6GqdcoXrPRTykTxiRV8HKuyxpl2bIiFW797bcR4Lu+K4fThHk6x8AsUaW
	zZn3zW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKeU-00000004ZPK-483g;
	Tue, 16 Dec 2025 02:19:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKeS-00000004ZOx-3y3c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 02:19:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3374442D0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 02:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B392AC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 02:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765851539;
	bh=4JFoCG9If5tB3iqR5NtPiIwHM5+YiLPesQV7/ZikZQ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NyfGuVAJv/QEY2bcARVonqHNfYA+JuwyB20TWD03IdnYQKPeEcexb8QzTfNbRqK3c
	 uEKRuVaQXx6K6rwjzn6g2sSHxzCE1/YRCpTbZMMToRULt4s2QRVfSsVt2xXarhyNG3
	 BIiysGbuekFPN1gDDo6qyKznRTmZFBmR8Bpd6YODehpYTjJ6MSkkGA29u82gVEkWn3
	 uxBo3WAV1dbmVhKBaUWp5F6lFFVpeNKyl0xbMhsKdura5Mfwca0583uj5PQKow2Ff1
	 O33fvHCUvZN+21nD2iHeCp/NUtE8E55ddBIcVomK8ncSF0aqLvmoAafXCsXuOTRxEM
	 1HkJm6sYyfzpQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b72b495aa81so734088066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 18:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKfO1cKm4RHOALaYCTxhynuAm+zPxPbT09bpsbFwKDePmPGST5Fa1goK1FfxUtpYB0v6Yh5c1/fOGvAoWP+AtW@lists.infradead.org
X-Gm-Message-State: AOJu0YzRwT+28wz3t+n4LPCt8u/Sp/Yjg2TkYWT7R5xJ0XhkqEZzUQo/
	5l4wSj9JFOk1/9VU2Jvub9DgB3B9V/9+b+CvMeMyLWPHspnIY/dB2hHqsvfHoVgfByahzfnFaRI
	maJFzj/P9B/X0zL7VZ2vPNRFqn4DgNQ==
X-Google-Smtp-Source: AGHT+IF8vGt6ajNelT4B/K7XHFLr9QG4M8S0hXfRfi33LxOzf7V9qsrSQ1r2+OIcRtCUwFMJNU7gNKNpTvCYqLxm6Eo=
X-Received: by 2002:a17:907:3e10:b0:b3d:200a:bd6e with SMTP id
 a640c23a62f3a-b7d23b84caamr1055488566b.47.1765851538210; Mon, 15 Dec 2025
 18:18:58 -0800 (PST)
MIME-Version: 1.0
References: <20251215212456.3317558-1-robh@kernel.org> <3f1b7852-1494-4a73-8783-b578f9ad5d40@socionext.com>
In-Reply-To: <3f1b7852-1494-4a73-8783-b578f9ad5d40@socionext.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 15 Dec 2025 20:18:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJKpQRMEac4e1T-s+6HWbR9mOZXRQCHVeTCnHqJYa=TYg@mail.gmail.com>
X-Gm-Features: AQt7F2rTRnyOQZ6KvlYwXbGLSjJsM7VHzB8YZxXTxLEwIFQhb8L6Y1pd-C5epdY
Message-ID: <CAL_JsqJKpQRMEac4e1T-s+6HWbR9mOZXRQCHVeTCnHqJYa=TYg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: socionext,uniphier-pcie: Fix interrupt
 controller node name
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_181901_018564_9A46D806 
X-CRM114-Status: GOOD (  15.94  )
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

On Mon, Dec 15, 2025 at 7:21=E2=80=AFPM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> Hi Rob,
>
> Thank you for pointing out.
>
> On 2025/12/16 6:24, Rob Herring (Arm) wrote:
> > The child node name in use by .dts files and the driver is
> > "legacy-interrupt-controller", not "interrupt-controller".
> After your change commit bcd7ec2cd720 were merged, it was a long time
> before I realized I needed to fix it.
>
> "interrupt-controller" is included in the list of Generic Names
> Recommendation. Would it be better to apply (i.e. restore) this,
> or fix the PCI driver and .dts?

It's an ABI. So we are stuck with it or have to support both names in
the driver forever (and backport the driver change).

Rob

