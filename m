Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356E1C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 18:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rto/zkmddcXFKDuBMT5owfeFn2l4lHjmJnj+jxGDxQo=; b=ZQVnYtdYwT25eYCLHA0kcMB9fR
	ju58gXhJCSiXrRzpg9IEdEf5HXkNCv9guclfCxiPo/XSm7RxCbL6XQDoVnkTVCR2hu97RfLcjDuEJ
	5f8lXZSqyBwvescF5rhIvh8sARUPv41Vg5HFiBQtAo1Pk5QCi63KgWc1TQ1nNtYs5qhiDbP8XOKm/
	Yd2SCd5fKMzbJE/Roc3js3V282k1EwH2aZakr1PP+UUQtACvr8A/3klVaa5grymkCo7u8nNaC5ssy
	LtKEXYWgNkDIUPZFab2mZBl/mYq87WuE5MZmpMiT5+rFvyu8LxMuDq1j629oQWiiTy+0wRTv8etAt
	/AMe5ESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1q39-0000000FcrJ-1v3G;
	Wed, 02 Sep 2026 18:51:07 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1q36-0000000FcqF-017E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 18:51:06 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c1712a04ddaso234405666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 11:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1788375061; x=1788979861; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rto/zkmddcXFKDuBMT5owfeFn2l4lHjmJnj+jxGDxQo=;
        b=doxBnuZ0+5fvR7STL+TiyfZlbXX5WMZdW8DniXRUwaXWE+bu12vHth3LsVT+zlaq9n
         sNncDDi5fRdxDGiuhXmh9EPUgcPXB/umAY/wtLQLEytz+0wyiNtr2eBe1WZMjjFCwOfu
         eM48nP5eF+/ObmUuOCoFpwk2WhMdZli9jcYFKgI7s4jI4Yt31FfoBvJdruZu2QyZsVyb
         ELrW29LHoc17qf7eyKEIsJ9pAU6rwdiLWM1QTb00MBhcrIE97ICPyb+MZYc80I2dIpMO
         poGUMHZXga/Mj/vETTH6EVRomSBT+ujtdskU5NdJTmEZlej2C7xlJd0VfYLqnWjfVWXn
         JySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788375061; x=1788979861;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rto/zkmddcXFKDuBMT5owfeFn2l4lHjmJnj+jxGDxQo=;
        b=Trcriu2jThIUqPQsxucx3CDeLfmqkXHlm69l9ALRXuq40fG4YpBcdCscHqYfAwo/bw
         JlAPYufN17doQoGA5yDGsSwt7ph652pWecVfDVBdhhqQ6VoYhrfkXexD+lxzcbBbwlHL
         NaVCBmpY2/QxzWfMKbe7Ny0zkDF4kfaDpo7sOV7v5FIT+eSkDy/oMb+FBGVA6eXVooiw
         hONUFrczlvPrh7IwIC5yI/fKFsLhrnBwfaqSHgbBkkl3h2y3J4SKqbaeNheu7ZvHGwPZ
         b2yboFwKTwJ+6UpXx0VYcx7zdZ+IvGDh8fWSJ5pTxkMSKOFk91wVE0AqLz7zmQjxO+d+
         w1yA==
X-Forwarded-Encrypted: i=1; AKwUvByDhYJGWvdfi69s2BZGUCld5syTDI6XNBvowlOq/nvLRG9ydxzKl1q+KhzYJA0gwTK2+JwFecFRYNIut3gvB0mC@lists.infradead.org
X-Gm-Message-State: AFuF++mW0kqHU2kUSUpMZYXV7o33zbPcJAKh+54cvWLwOPOcq2Y/5yUv
	cxDxVoAbYyXmk5+DSF1SfMOReGPu4885tzj57k0zOB57gAK1RMmeMZy+6REwSBDVSw==
X-Gm-Gg: AYBFou1nVv+CnhC73NLIqXIwWxV3DKwkRmnmQMGUkkIgO6/HTYLQnUkKZ5dhP/T3ly2
	rG6CFXO+t23c5OR+jBc90seY29SaBkAP987Jhm4EHdFHxw0ma5diBeOndYaPHBfKcon+YAuG+Us
	K3KOk8ffJdDRVtulJ/J1Y1+TdSpUr5p8wYnyjbg/8sAJKidHjHNpiaK63uOkTfXxnPHKVEB+P4m
	77QDTyP0y0dgTgU33u7Q54vD4/hltYy48aexIahmMUZhPWvnP+A9W5LxR+J0XbdqRSKPdH6rh7C
	Y1P9p3Rxvvqvzvq1uzPi9i77S/yq7Ho+1yfPgbdi5jLylesxRvwaVlzKHQQH0NCQbyNbskpXYWN
	Pe+lm2bl1NPQkbzTkBCqtE4XoQDCA2+31QFg/XU3gb1aR3tvHgVaEZAlKFbxrk+0JyZrhfelPh5
	P+d81Y9QgA+6roRunfQOjnQRLtkDCNCMj/KouBjEqlmEiDS+sdsHrDG/4/6SYxlrPBNr7r/lPBL
	j4G0T9fyNLtjqeHB7wl8XeacGBHog==
X-Received: by 2002:a17:907:805:b0:c25:895c:62dc with SMTP id a640c23a62f3a-c25d5496a24mr425850266b.14.1788375060906;
        Wed, 02 Sep 2026 11:51:00 -0700 (PDT)
Received: from localhost (5073F89B.static.ziggozakelijk.nl. [80.115.248.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172e44sm200366b.20.2026.09.02.11.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 11:51:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 20:50:59 +0200
Message-Id: <DL521SM75B0T.1DGK1GVSH1G51@9elements.com>
Subject: Re: [PATCH RESEND v2] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is
 supported
From: "Michal Gorlas" <michal.gorlas@9elements.com>
To: "Manivannan Sadhasivam" <mani@kernel.org>, "Richard Zhu"
 <hongxing.zhu@nxp.com>, "Lucas Stach" <l.stach@pengutronix.de>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>
Cc: <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260827-l1-conditional-imx-v2-1-40b324aa2a94@9elements.com>
 <178835947957.88571.7553170178358028044.b4-ty@b4>
 <gayg4xafgxcog7f7jy2i2e3wctds3do2ytttgv74f3y6ed7qtg@mr3xfxugjfeh>
In-Reply-To: <gayg4xafgxcog7f7jy2i2e3wctds3do2ytttgv74f3y6ed7qtg@mr3xfxugjfeh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_115104_434181_AFAE34B0 
X-CRM114-Status: GOOD (  18.38  )
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

On Wed Sep 2, 2026 at 5:36 PM CEST, Manivannan Sadhasivam wrote:
> On Wed, Sep 02, 2026 at 04:31:19PM +0200, Manivannan Sadhasivam wrote:
>>=20
>> On Thu, 27 Aug 2026 18:51:00 +0200, Michal Gorlas wrote:
>> > Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
>> > states for devicetree platforms"), ASPM states are force enabled
>> > on all devicetree platforms. This causes PCI devices on some i.MX SoCs
>> > (for e.g. i.MX 8M Plus Kontron SMARC eval carrier) to enter L1 even
>> > though CLKREQ# is not supported (and consequently supports-clkreq is
>> > not set in pcie controller node of their DT), which causes the device =
to
>> > never wake up from L1.
>> >=20
>> > [...]
>>=20
>> Applied, thanks!
>>=20
>> [1/1] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is supported
>>       commit: 94420d27973f567e5c10b631115ea8b9abc0172e
>>=20
>
> I dropped this patch now as I completely missed that this patch incorrect=
ly
> assumed that ASPM L1 is controlled by the 'supports-clkreq' property. Thi=
s
> property is supposed to be used only for ASPM L1ss where REFCLK would be =
cut
> off.
>
> As Krishna explained in v3 [1], you should use 'aspm,no-l1' property in D=
T and
> use it to disable ASPM L1.

Right, 'aspm,no-l1' solves the issue I had. Also forgot to answer
to Krishna's remark in v3 thread. Sorry.

Best,
Michal

>
> - Mani
>
> [1] https://lore.kernel.org/linux-pci/aabc3dbd-3e5b-4272-807f-f0743606e25=
a@oss.qualcomm.com/

