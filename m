Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5E1E7545C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 14:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7+JGBFRKWqyrnVXzLUaDYsKdcEDRxDNeUF16RxUnpo=; b=I1nwL1DFLk38/pTNXkvHCmTxUz
	TY06ENTmNWaa/YGDgy2aHm00li1Ak+1vjdQuhS9/ZRT3idUpEQJdSVuqi1ooV9xeO7XFhFvi9pZd+
	vaPikiph84iD/GiJ2mruJDPOWztBdKuCpE2xnv4mT7EFL2o/HFIg2ShJkPoDxrS6IQCr5o++9DiRP
	gzZzqSVQ5XwIFi48wCe6xxWUcC7b493VsR3veikxrJxhhToZKbMDmys5+G4kmLg6qfVT7/rLrQ4Zd
	31UlWcyZalwJNgMI70b7NQlvYIOidsQwWG45TgOriopUk+je0j0xgGYixfjOfyzSavpzMBsZ7b9Xq
	ITV6+6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPQe-0000000GxJL-0gA2;
	Wed, 24 Dec 2025 14:01:28 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPQb-0000000GxIP-3mZJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 14:01:27 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b83122f9d78so68770366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 06:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766584884; x=1767189684; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7+JGBFRKWqyrnVXzLUaDYsKdcEDRxDNeUF16RxUnpo=;
        b=ptwkZvzqnyX4wqOIArgLjWHDxr27Pz7aGxn9VSz6huqXO6BpaFny/JHDEl+meqUV3T
         nJKHJf1DTvBeaf9WBmtyMLNKCOK7Ii1JR2glGmJ3HVC8oJYyB+gq8ZCh0eLPrZqLT1Vy
         +fwXkEGi+pLrrCPcrwOTPWWcnM6MQJk7kbjqhTgxkLslmtAskQEnxiNPghldmCic/Cg/
         3KISq/H+b3X0XNKKO3dBsWOyIrRbzprlp1BAeSYgwDp3AU4puSm0lKlrqcggVG+O8hKA
         zLZ8SKo8Gx77Zlx+QaMJv701Q3NOtmxRVaEQRXMeDfc5CsuQONTziJ3+e0ZgdSs6d1nF
         sgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766584884; x=1767189684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I7+JGBFRKWqyrnVXzLUaDYsKdcEDRxDNeUF16RxUnpo=;
        b=LEThOU5IesFL/Ga0IzYaEbbHoB/4CbmUkO3rz4B+IhbQwGBuRL+atfv6hdAO3WyzTW
         JuJDfyyzbNBCSmgQqKET3fEIu5I6+fkpiUz9Wu768lLQfKFdbpbSSWlwm04F4B8G5xnR
         ZlYsXPQTtMmNlPZpBfp05Ac84E1MUSa8AaBLnCC08iovjjBv3i1/WZ/CCyHjvpvJp6bB
         qNiJrF25zsBV+dcV9iqigmsC9cgEA16HU3u3UfKn0qKV7a/rtTCpEfEMB6r4lPkrqgLW
         KoJfF5VqlVrqpURIYCGEdhWxqDVhhK6wdhU3OrV/DW7xXuzv0IUUUfxEuuDvdj4j96Tl
         tiqw==
X-Forwarded-Encrypted: i=1; AJvYcCV5WZg1EJ5e7CPQgLIvi4PapLauofAY0GVQGSgEb6aGDF33X+qhC4QeW5m6wGaMKsQaXfTqMuNN6rjsmqm1yOrw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/lII4MgaT1s6a8e3LcNqXsW48o8oeXg1RvVqqrVCMUZL8VG0t
	DKFSEJ1ytdL9DygaUizA7b+rOs9Y03HbUr9+LE92bkZWaRDqZlPAFovlw900QuZHA0zarQ/fhvR
	LEkSZQ4csnm2gegrdnq2r8C1QuanEC8N2zK68YDfjzA==
X-Gm-Gg: AY/fxX6ZZSBvqZTp18eZbj7vPLldkaMD6PWR1P4V5ObI/e2u+I5KbPNE+cBx1IPg2W+
	p4YCn3QKFJvzRrnWRgpD2Q+p5fyoCiuEPVVnli7NqzOKzzGfbkw3nDOAaCyXrG8ToUK+z6ylg8Q
	rAabCnefOgxG57XQfw1WHXhYEqp9m1qbI/6PcYErtD9BaUp3sALDWjqhjHMLg5yap0pkofNfHWN
	B49j1I2tkAkADJTmBcHGOek4e9TPkjYi1Me/Nej4L0CNyLRfiw68jy0c3+50pdCE5JNbj6LbkBc
	sKxQhZIxyYpvczu9YluCQYn5HhNmNU+P1UH/ERtTUsKdfHGrCQ==
X-Google-Smtp-Source: AGHT+IHCXMeYFxQVcU8rJRtC/cDnDm53nQPvIw0Xbx77plqQqDjE4I50qoqJy3GeuDjgR14U8tTAxFKyl0h6HDv3chw=
X-Received: by 2002:a17:907:6e91:b0:b73:8639:334a with SMTP id
 a640c23a62f3a-b8036ebd999mr1821689366b.13.1766584883876; Wed, 24 Dec 2025
 06:01:23 -0800 (PST)
MIME-Version: 1.0
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr> <20251224-berserk-mackerel-of-snow-4cae54@quoll>
 <CA+HBbNGym6Q9b166n-P=h_JssOHm0yfyL73JZ+G9P81muK=g4A@mail.gmail.com> <78bf252c-fd5e-4a36-b1a3-ca8ed26fde7a@kernel.org>
In-Reply-To: <78bf252c-fd5e-4a36-b1a3-ca8ed26fde7a@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 24 Dec 2025 15:01:13 +0100
X-Gm-Features: AQt7F2owdEGYn8vQgdJCyQRcW10NeJzDUOJWapd16DEqGEP6zPqPRLNSqy5Q0Bc
Message-ID: <CA+HBbNG+ZVD6grGDp32Ninx7H1AyEbGvP0nwc0zUv94tOV8hYg@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_060125_955283_0094289A 
X-CRM114-Status: GOOD (  17.43  )
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

On Wed, Dec 24, 2025 at 2:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 24/12/2025 11:30, Robert Marko wrote:
> > On Wed, Dec 24, 2025 at 11:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> >>> Add the required LAN969x clock bindings.
> >>
> >> I do not see clock bindings actually here. Where is the actual binding=
?
> >> Commit msg does not help me at all to understand why you are doing thi=
s
> >> without actual required bindings.
> >
> > I guess it is a bit confusing, there is no schema here, these are the
> > clock indexes that
> > reside in dt-bindings and are used by the SoC DTSI.
>
> I understand as not used by drivers? Then no ABI and there is no point
> in putting them into bindings.

It is not included by the driver directly, but it requires these exact
indexes to be passed
so its effectively ABI.
LAN966x does the same, but they differ in number of clocks and their indexe=
s.

Regards,
Robert

>
> Best regards,
> Krzysztof



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

