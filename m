Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA129C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUdc1ajS9G7+JyBN4Vd0qdQ7XA8eh/Dl4R2Vtt/aRyQ=; b=pTAoLlLl25JnsmSDKX06ii7Hn+
	H4E9RW3FbscGrvQAMgmfxXf7x9TffLI3Z5oBQfhM6pnM+fAgMcrXmGnzv1NqDcvttTPlbjLqUhKa0
	56amBL5EClzfZfm2udVF5l1WhZDb1s3Fn0eVGdj8kgjOL8w42Htq9YP8cx+sN63TIgmGtlzMB5xXG
	K+CNfyAI67L/f9BA0LmfVzgtUGeb4pqryfpc9BLyuRdHTKy7BusdMnxDRgKIiCDLseIHEcED41hHR
	Uz4CMQYyDbvS7/su3qmB+1jv+jKIpLcK7Vh/iplH4iHOI9UjILq4+xmCJ+C7heQNsLXwZiCgHa5/x
	ulDjiEWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ed-00000008ggQ-2eKj;
	Tue, 21 Jul 2026 07:49:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ec-00000008gfm-1D2y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:49:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10BB243FE2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44461F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620189;
	bh=YUdc1ajS9G7+JyBN4Vd0qdQ7XA8eh/Dl4R2Vtt/aRyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fCIxwdakKOHlbIEvrOkZaMzRZ+jNwc3O70PBDHYMq6ssKGwaPrBT3QGuXYAjaR6cq
	 95qNW/QFvDgx6QCD/H9UstQsPwKmvruxK9GMzuk0sldFva3Kb2TD2oM6y8H2Zzy3yj
	 ItD1kOHL/PbiXiSt7z4NfRWT/jU0k0Dbti8JVVL/YONR6r+9hxS1htZ3PQZWaPdaV5
	 rtqpUBPybZucQqN4XbYP+kyH6vd5xw7L7D5w7XwyvhOQrrEWJqC8jEz3kG8+vi4qGw
	 oZHXUBq/g6Ze1oi3HwN/gUcrhrSzfSPhYTcU9/jSt0hCjcb8Tdz4c+WFwl9qP3/+NR
	 2itJC+U4AfXIQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso10155130e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrqfF1c/1paHZ1p055pLqj/020EjXxoGG5RTmxP2D63Xk3pNCONNiViBvOarKmWEdksynq7VuNZ8A5q+PKC1KeL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw47tBCio05SZrKqwHylYRf+ldzanErtK/yPViJBaCKXAeyspP
	MjvEJi55uq+2ZHyZeQZ4NVBOUZJjdGkq8fLBXsvgpX/H4sP53BvhZ7FbN6VDHVXpcktt/9XVfoU
	Bxk5Cb6ikETFUY2ZlZf5mdMg2ZJQyZCE=
X-Received: by 2002:a05:6512:33d0:b0:5ae:d80f:c77c with SMTP id
 2adb3069b0e04-5b28f998d30mr4171034e87.30.1784620188475; Tue, 21 Jul 2026
 00:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260721052859.171341-1-manikandan.m@microchip.com> <20260721052859.171341-7-manikandan.m@microchip.com>
In-Reply-To: <20260721052859.171341-7-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 09:49:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLnvCaUaEm0m9w3CWcuahgt1VwpYC=JLTLp=O6J-y8wgZA@mail.gmail.com>
X-Gm-Features: AUfX_myUpn3DxB2dpHt182zW3JGQBje1oWK611TyiUzfnfgPlR68CEulMNYYBjE
Message-ID: <CAD++jLnvCaUaEm0m9w3CWcuahgt1VwpYC=JLTLp=O6J-y8wgZA@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ARM: dts: microchip: sama5d27_wlsom1: read MAC
 address from QSPI SFDP
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, michael@walle.cc, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jul 21, 2026 at 7:30=E2=80=AFAM Manikandan Muralidharan
<manikandan.m@microchip.com> wrote:

> Describe the QSPI flash SFDP as an NVMEM provider with the
> microchip,sst26vf-sfdp-eui layout, which exposes the factory-programmed
> EUI-48 as a "mac-address" cell, and point macb0 at it through
> nvmem-cells. This yields a stable MAC address on boards where U-Boot does
> not program one, instead of falling back to a random address.
>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

