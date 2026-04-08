Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB64FD5F99
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2wUntJq6mMuHKrvX5Pc4RcmIMae/ycm7tp/NWMwrwE=; b=sC7R6cJfJTrfK3L4dNZRCKTipH
	k6D0unbVttuGilQRv5U6OK6VEvFx/Euddc0GVfZVMa6+6pTbtDc83VV3r6oZFuQdZ9g4PX8QTJKC8
	gxPfdSViE+Slzsh4jVTospkZV0jLidHqimkuFDUHR2Vk3bk646VoQMCfa2oSm7j9/VeYYSiBRSTAw
	aHGjEONdLK8lLyGcvhT5aJIiHSQK0I5xKcRQ1Sk2XH1Vi+SpOUi2vWEULErQLdWXlyc6avd3Y7j4a
	xodfpxcKypt2pUk415IiKXhdCY7pW9w+GQ6cUNQx5/8/MyRUrHARlthlPcze7LSCYuiC7x8WSpbi4
	NCu8ACyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOeO-00000008Y2G-2KEb;
	Wed, 08 Apr 2026 08:52:40 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOeL-00000008Y1p-3ZV6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 08:52:39 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-56d8a5f0e44so639255e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 01:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775638356; cv=none;
        d=google.com; s=arc-20240605;
        b=VLSSvITo9BzaX6Qsem+JQta5qTfhyp5120f7W3zll53ZjRbyjDjsIiNM/6hqa4USMQ
         fKLDk4iOQleNRqBPc9k/o3fB9CpUeq2PVxTnML8PZjaVsrnKHrNzh2ZsEHT8QqGLzXnf
         rwDgapdiyUhAMMmFhIJUt3xkzUqiWflJaT+WosYCSpwNmDnqY/0OLKcMR7T+o+l50YvJ
         MQfcE7t/NXB0MDtdGzt2PQkyarp0q0xm8AgDd4XukMSpsfPjJfqZ//GQ5Qb3yNFjr0zf
         qjhevyqGbS2xK6NcTf3f9F72/FsynFe2Z6J5hAzhlJBmleb7ctcBFTk33D7XULjsUH0T
         6eSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I2wUntJq6mMuHKrvX5Pc4RcmIMae/ycm7tp/NWMwrwE=;
        fh=LX9xN3Hyr53cPnKfyUA2eYpONfuFx7dn5CNIuDdtMQk=;
        b=IbsSESIK+CQkoNujf2AkozhM/cZMmSHeGrcXnPheVyTmTd3q3SRstSxIgXYnTEiQ+9
         63ZAoMLMJDro7KLHM7pqsa7FFBuV3EBrcJWhkLmgcEv30ODqAkoI3tkomYImesvQ61n1
         GC1L6XKzTWKk45VDYOLI69eQEgz1XDB+S1nfefmxr8i7Je2maChOdhMB5ilmGJlYAZZL
         AX22T/sSwKVi2xwo0a5EdCKxv38CFQH707qiKUyb8F0hkPIl2cX5430IJ7T1KzhWTa0M
         BPwB712ERg0uQFKKI8J2iXVwoTvQzvcvhFPlxiO13Zpao9eHisqwZlNOVQcHPpY4a8hZ
         vScw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775638356; x=1776243156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2wUntJq6mMuHKrvX5Pc4RcmIMae/ycm7tp/NWMwrwE=;
        b=AyN0GA7m1BCLCO4bWzYxajCr1oPajsaGV4/B2GfBMA/wGId31XOyYjjw3QNCW1o/dE
         7mrFDPNyMrjEcfyek/QrAOeNpdL4MCQLxJbM3Op/osB/Mv70fgAgczL/zkWPtR/+Zek0
         hZM8fRG4c4x7BP8E02rdsevFTw1SL92OmBQ/q7B8CUT7zDnT+Lq8Ybcjea50Git5xlqC
         lYeu3zGtvf4j4Ce7By8wahH6VPsGzsKETjL/gt13VP0uJRitmwciWVoexFqLaZgqH1ZA
         5rqIn9GBP0uZFEH3bU1YiSPrDiwyUWlG+lo0MybeOZlBR90IiVKDM2GzFNpvZvYBnXwi
         QNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638356; x=1776243156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I2wUntJq6mMuHKrvX5Pc4RcmIMae/ycm7tp/NWMwrwE=;
        b=FgTFKfp951K/5PWdAw85BgL+pYtX1h5pQlglxoTMM0KAa/mMmzFUsV47MialkpE2VJ
         uu0RmGSCBDN1bUog3MW8rGkf4bk64xXiaqip1cIhSfQNKoiY8oqk4q/i/h6dqkf+FPRa
         BZBvc+wCP7Mepy37SftZ817sVupmIbszVhW+xRsAUeZsvyqKVILA0nTOI0rkHiBOS2Nl
         0EwhOirI07VNMdqMIqmq5PeJpVSMCD2b7UcTeft9T8fU8W1S8LGQMuuYE/P06SNq0T9w
         I7WVmBNVNTtt9Gbp6v6XnIKFQnytNSPYa7hVcgK1gxrWZykEr/w7PMILd8IR+qxEyoy1
         ztFA==
X-Forwarded-Encrypted: i=1; AJvYcCWE0C2UTXKGm1lPHlnYNGVuCzR5nIqQTW0ZBzuba0CWwdzQTIAyJmEMJjJMpTmuEp3kxr7kM61GQPU5eQzOjFq2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1XxVPISicaDxqo2z6YosOMzgxmyPfYBmYu5KY0YEZ8tZbbo6l
	53ZThbFCQKcuJEChENJgf5pcpraflu1apivXDW7c9hZC3rEY5n4hAnQuHg9bt3susWNPH41RsCC
	JHqZsnEVCc+ivY6QmmVZIsE3He5yR3MQ=
X-Gm-Gg: AeBDies6/bnLhzVqlCmzAqw833CHhE8U56+ONEdJIYKY4IfRmQ1CXBb+v/BrjZ8YsZR
	bsbADEmtAOUfSCvwgs2pUV9TUs7N9ei/9uPv7f3+nTkFZ7i9VnQFo7buQrdif9sUS6zNq5GTe1E
	d02FcTeBwuntVDAdo+U9TTBlofRoTfD2E57C412VeGGK+CFSMrhEEEaJlB9yEkYzutq38FkGL5m
	Mf1RD6XxhuYLOOXm+Rgi4JP+QwAZHE6Sh1KWTvUdirQF4XxmX9Ifh7fBx4B/+2DWq04ZvY6R6nn
	dD+jJl1lwQ==
X-Received: by 2002:a05:6122:6d0e:b0:56e:e652:2c10 with SMTP id
 71dfb90a1353d-56ee6524f13mr4595571e0c.4.1775638356381; Wed, 08 Apr 2026
 01:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com>
 <20260407-anacapa-devlop-phase-devicetree-v1-2-97b96367cac3@gmail.com> <20260408-glorious-vehement-robin-b6def3@quoll>
In-Reply-To: <20260408-glorious-vehement-robin-b6def3@quoll>
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 8 Apr 2026 16:52:25 +0800
X-Gm-Features: AQROBzABPSvPPBL8e_J-mw47skeWFz5_1Z95SvdlAeCuqOkW0mY25cXhSnCT2fI
Message-ID: <CAPBH0A-ER9-_KpknyOKTmS2sBk-xv0c016y9WsLOvZ8CjSiwCw@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: aspeed: anacapa: add EVT1 devicetree and
 point wrapper to it
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_015237_900142_2E21448F 
X-CRM114-Status: GOOD (  20.36  )
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

Hi Krzysztof,
   Thanks for reply.
   Could you let me know  what kind test I need to run?
   Following is what I do before send.
   * I build this dts with linux 6.6.x
   * run "b4 prep --check"

BR,
Colin Huang

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=888=E6=
=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Apr 07, 2026 at 09:54:33PM +0800, Colin Huang wrote:
> > This change introduces a development-phase devicetree for the
> > Facebook Anacapa BMC EVT1 hardware revision and updates the Anacapa
> > wrapper DTS to reference it.
> >
> > A dedicated EVT1 DTS is added for revision-specific hardware while
> > keeping a single, Anacapa entrypoint used by the build and deployment
> > flow. The top-level aspeed-bmc-facebook-anacapa.dts
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts    | 1069 ++++++++++++=
++++++++
> >  .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 1064 +-----------=
-------
> >  2 files changed, 1070 insertions(+), 1063 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.=
dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> > new file mode 100644
> > index 000000000000..a29b7fa1155b
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> > @@ -0,0 +1,1069 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +/dts-v1/;
> > +#include "aspeed-g6.dtsi"
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +#include <dt-bindings/i2c/i2c.h>
> > +
> > +/ {
> > +     model =3D "Facebook Anacapa BMC";
> > +     compatible =3D "facebook,anacapa-bmc-evt1",
> > +                  "facebook,anacapa-bmc",
> > +                  "aspeed,ast2600";
>
> Test your DTS before you send, not after. Your binding clearly said
> something else.
>
>
> Best regards,
> Krzysztof
>

