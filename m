Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E128CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkhFCZ5ofWJHJ2EhMv0fguBBuTeG4Pes0q1AF4EcfFA=; b=eGLTl1+0oiarqXw9N07AvhZRt+
	6vilMkcxGOZADwKYYq6Hd46+e0uQLghYb2ofBu/mqFKoAEtjNuZv5nR/k2h7Uk+PlW9Kl5UJ9OxgO
	c5DnDwvih6+1sH33wCr32v46ifdKoITjCUGHC4W3IiL41i3yiH/XkQFh9gyuN4Ye0KPKnvMJU1UeP
	gUQ0z9FzBkjIOY1Hf5VJfsedyWBw3Ln+QqojoTIbyStoWZ1GnVOPgtg3AyP5T+JtiUt6n4vxm1WwL
	DQ3oXPRjPqWpgHSDEUjlR5ekrzR1GfcOv6wnAzHYvTokujABX+MtyCyOMs3n2becK5GkuRyMWXEVC
	6nNk+Saw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwM2N-0000000EoI2-0gad;
	Wed, 10 Sep 2025 14:43:07 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwM2K-0000000EoFJ-23Hx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 14:43:06 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f6507bd53so7507330e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757515382; x=1758120182; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkhFCZ5ofWJHJ2EhMv0fguBBuTeG4Pes0q1AF4EcfFA=;
        b=fUTIThl84+faf9QRxmt0Nb1JLgSz1jG6xrVpRA+zZ14ywgp+x0Z4avreacCphUpQjE
         oyzxUZFck5bxNrQG5q/C20QrYtOj05mCWq1bx+xP8OmQdakZxpti3QLoFurxOUVRjYyK
         e8jG0vgnOt2htqlETTmsPkPsHwjYh0/cMgOc/zUjDpKC9Rnp04Y5O9oS0wfWYCiN6JGf
         wBzDlYi3u7pa7w3awkSqEhNf+7Puci7XskXiNM51FAAGQbzmx+l8WYXjPneQxYX7liK3
         lnkpo2A1CsfQD9cD9n5MJBYz/NglIMrV3/T2kxqYTpU+zLWoUbrMhjCU33BanuIkmxXX
         auGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757515382; x=1758120182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkhFCZ5ofWJHJ2EhMv0fguBBuTeG4Pes0q1AF4EcfFA=;
        b=H7Nc50EsmhspNNgyMSfYHvjXRYaXCNpbsugeORBbaFXRkT4LKbUug6cvr/bbIr7HII
         8LiVhKDmersr0T19QkzkkyBoV5NekN1A3NaGUa5k+SMWrj5slBD45NeM2zTRsU0CUpRO
         MXiWLTiqsYb6EvHHe26kyp84xaetnggigBeOaGs/5nimmF6Ket+TrVIgy9EASFnkXTDX
         O8V5INwlqpri3edmzvRVCWKyy9IUiaUi7z/Wk57Cf+5HGKzK3QcX4XUVAUgrd1uNFhXt
         JdGQYuCeBIw1BMHyEG7CD1uQ3dr1euoW+KOdr/6tgjoCjmdYDhvKV/1UBvOYEWzijH1t
         +1bg==
X-Forwarded-Encrypted: i=1; AJvYcCXQLtImLOIFGVfNdnuRSaA8Z+XN/aMrYdqFLrXQEtpipk4UEyxm2fFhjOuf0xOXH1WBjOzNv+E9SwdKLp8yfkyw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyba0WnnbDu9dV4KEgNRFIAypXvOtycfQcOQMq8wloVbfDg8aLO
	RxJZBaJyIurDK+jq+wd5dS+sj8hHWAcQ7S6OHEGqEkm4PzhIX7E3Zu9Pj2du5mwvdMkCytoyhwi
	fnkJ7gkG/+H1XmTX/lAC+vb3I/w6u8vFDT7jn5gMmPw==
X-Gm-Gg: ASbGncvaKu2kK2PpCbi9xQffLAvOTjtDPqYPggukIPnLavH/vP+8A5srtT32eIf98B3
	N8D6pfcTKfXLMALtxgtvbO8ZucWF0LT9bAmmXHNO9Vc4ADbFFu8QsqlsmjGwJqH5GxQr/oopW8t
	E504tEGW6lwbzcbyxf5Q87iaik0q/LTTbvXG4v6/pRMEoa6jf5lpvXEXQs/OMOWFDpd98wUWxB/
	np213qq8VgucdUE5gCi6dHgkOKsmu1sMOyPtzQ=
X-Google-Smtp-Source: AGHT+IFwwWMP72rjU0xLemNq3S4L4evCHuBoOQsJ51CqzV+zQGmHuO0tvNuPBH/4DumR325PTGGiK6U/D6n2L75MFaY=
X-Received: by 2002:a05:6512:e82:b0:55f:4429:15a6 with SMTP id
 2adb3069b0e04-5626310e5efmr4881766e87.48.1757515382294; Wed, 10 Sep 2025
 07:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org> <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com> <20250910143618.GA4072335-robh@kernel.org>
In-Reply-To: <20250910143618.GA4072335-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 16:42:50 +0200
X-Gm-Features: Ac12FXw3DEUYlNQHBVzd7vCIYANNaG3yJ5y0y_Zklwl-sYjU6Q6eUcIMkXz0GhY
Message-ID: <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: Rob Herring <robh@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Eric Dumazet <edumazet@google.com>, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Vinod Koul <vkoul@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_074304_795124_C6AC7A3D 
X-CRM114-Status: GOOD (  19.64  )
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

On Wed, Sep 10, 2025 at 4:36=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Sep 10, 2025 at 03:43:38PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Sep 10, 2025 at 3:38=E2=80=AFPM Rob Herring (Arm) <robh@kernel.=
org> wrote:
> > >
> > >
> > > On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Describe the firmware-managed variant of the QCom DesignWare MAC. A=
s the
> > > > properties here differ a lot from the HLOS-managed variant, lets pu=
t it
> > > > in a separate file.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > > >  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++=
++++++++++++
> > > >  .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
> > > >  MAINTAINERS                                        |   1 +
> > > >  3 files changed, 105 insertions(+), 1 deletion(-)
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-=
gmac): power-domains: [[4294967295]] is too short
> > >         from schema $id: http://devicetree.org/schemas/net/renesas,rz=
n1-gmac.yaml#
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-=
gmac): Unevaluated properties are not allowed ('clock-names', 'clocks', 'in=
terrupt-names', 'interrupts', 'phy-mode', 'power-domains', 'reg', 'rx-fifo-=
depth', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fi=
fo-depth' were unexpected)
> > >         from schema $id: http://devicetree.org/schemas/net/renesas,rz=
n1-gmac.yaml#
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-=
gmac): power-domains: [[4294967295]] is too short
> > >         from schema $id: http://devicetree.org/schemas/net/snps,dwmac=
.yaml#
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac)=
: power-domains: [[4294967295, 4]] is too short
> > >         from schema $id: http://devicetree.org/schemas/net/mediatek-d=
wmac.yaml#
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac)=
: Unevaluated properties are not allowed ('mac-address', 'phy-mode', 'reg',=
 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were=
 unexpected)
> > >         from schema $id: http://devicetree.org/schemas/net/mediatek-d=
wmac.yaml#
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac)=
: power-domains: [[4294967295, 4]] is too short
> > >         from schema $id: http://devicetree.org/schemas/net/snps,dwmac=
.yaml#
> > >
> >
> > These seem to be a false-positives triggered by modifying the
> > high-level snps.dwmac.yaml file?
>
> No. You just made 3 power-domains required for everyone.
>

With a maxItems: 3?

What is the correct approach then?

Bartosz

> You have to test without DT_SCHEMA_FILES set so that every example is
> tested with every possible schema.
>
> Rob

