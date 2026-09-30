Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F180CCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCb8pD0GTaCJdPRTDUHDOrP9QLPA+6gtpfNrrUBXRJg=; b=OtbID1o1yyUtNlC1M49SwW25/g
	U5yUPvVMrnC7YWDTpMsXJupjJSQ++OTxpGeNwDy69AaSrecINKZ5Mfzun+fGnYv3EYPHc4RFbcfPf
	bVfB5kWRTC1QNiGaJpp3pVG80t/BdJtcDGv1qyq6kThfkPcde54In0Q0rMqObWEra4VzyRmrW9F9H
	8m/aT4/igf5imdJZ29MHdm5STtmZbBaMUcFBnTIq8HSgCTqkoxAdytz3BzEcU0cirztgXMhyszcMz
	NiRoRDidYrqb+M4h0hMGyomEscyR+UBMOn+O7K7WhSPM78/jEMkap8aEVHiNJopDiYzXXHcR87VAj
	deg6eagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBr62-00000005dgH-24jZ;
	Wed, 30 Sep 2026 09:59:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBr61-00000005dg7-1Abf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:59:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ECDE43D41
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 09:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E753B1F0089C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 09:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762368;
	bh=oCb8pD0GTaCJdPRTDUHDOrP9QLPA+6gtpfNrrUBXRJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UKlR4Mzlio3ueEA/PjgwIA3gAlgGElwwdLk5nx8l3YdQoQHbfHZBfLoYxcBDffpIB
	 CDgMDXXoqqy1vGb0t9ajW+Lafs882vdcmFrW9t3sxbgzlvBIwGXNld9RMprZZr11k5
	 l50TxsBM33PAEzWu+hTKjeGoPuxPacFUrVeRrsskD3HRFuWAWSb8svbRFsSi9mfHBJ
	 J1/FwH7fqHn6Yvv19MZf2wPneLTfDwRrFQIFNDXj/F8NnY2hod+QmjoGGtp9tN3dCI
	 dUuEyXJUQPoj6w7ljJnv6HAu+cZ6IvcqEOT44O4gwZRpc3hSIPYxdTfJ6GHdp2aWIW
	 f2DMRYML1OWCQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3d17a999so198784e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:59:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBygteLv/mqQGouo0wKXiCh65QMWmSqEc7Z8eeg0qQAgGMgn9/7Wc75/mRIEMaGHiEpQqO2t4gIlVKeTAxLNEQ3k@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1yDnhlmpiZMOF+3PJ3GgkhsQtRr1HhdFnKdoTUsZ8wlqDwHpM
	19Yy3cKP/LW6Ej2ee4B+rpUktn8VCEa0tWC4EZrTnqE7gSAhUmvchVMVM6wCKelULs1wz/RNZXc
	QVayw4VC2fgi/+fRClFU3yXD+SSbdFzY=
X-Received: by 2002:ac2:464d:0:b0:5b8:f573:35ea with SMTP id
 2adb3069b0e04-5ba4069be69mr221068e87.16.1790762367713; Wed, 30 Sep 2026
 02:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com> <20260930-b4-cs75xx-v1-2-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-2-4617c4463529@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 11:59:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLkubGK4wetxXQz8PPDU4aHdSC7e0RgZtwOjrAWzHxX=RA@mail.gmail.com>
X-Gm-Features: AclHuK-m3HmD7lYV6qupQKjYpsgXbfMsgcuHzWJL7-TIFY8_vvfiqbhmnPD4sQM
Message-ID: <CAD++jLkubGK4wetxXQz8PPDU4aHdSC7e0RgZtwOjrAWzHxX=RA@mail.gmail.com>
Subject: Re: [PATCH RFC 02/10] dt-bindings: arm: Add Cortina Systems CS7542
 and Securifi Almond+
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
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

On Wed, Sep 30, 2026 at 9:00=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Add the top-level binding for boards built around the Cortina Systems
> CS7542 ("Goldengate G2") network processor, a dual Cortex-A9 SoC, and
> the first such board, the Securifi Almond+ touchscreen router.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

