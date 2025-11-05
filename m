Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C011CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iL8OVjWdHUzrhq3ZN/d9whcVawdUbvhGs+dukUNE9D4=; b=n5B1rQLsLjYLx8a4yei4JAXqJG
	jliI6TaRFCih/bcm3gYEl1Z3YHpmY3QnJTBg6kquUR8SEDgJifNNnhXZJ/Oih7EhJgKoSVSe0XU4w
	pF3z2OOeFyO1i60BPX9LFz0wssU+kcM8ZEYUpHQdQ52jBbNjWviTpg8F1o4xy/+MtEqBQC8R1Legj
	jDLqETB69fpIgnL354ZgtpOqEPz99A3tRWw8RC3SORUnLjnwUTmqxKY3fdy9vRP73GRTRU4qH4Dmy
	pIUsou4BeHQbI5yR4npsxAJU8aDSSMENHNY5IC7BkjSdhhWv/+HdFRUYDL9q6BtdhW+3YWc+AgXt5
	vFE/Batg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdge-0000000DnJJ-01Z0;
	Wed, 05 Nov 2025 13:36:32 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdga-0000000DnIy-0NWL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 13:36:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-421851bcb25so3725946f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 05:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762349786; x=1762954586; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iL8OVjWdHUzrhq3ZN/d9whcVawdUbvhGs+dukUNE9D4=;
        b=IoKMmojOuxg35ig4hBcIt0ecdKpAJYIeFCzdXNePJ9RRMKjn8K6nl0KiuCa0FfjMrw
         DFstIsKvR6s/2NTzzNjzxKpNq3fRyZh/GB72EL2DJOCmb7YfC/mruk8KdY4ZL1NDUc/2
         inczO0/AYpJhijKYaDuhH9tCLnC/xJc2QQp4LLlPvwUrwWpGmC1HtIsCZPnPDZ74rIAE
         sdhQ25SwRb+ISfVHYVyIawbV+9HykOrCUe+ECB+cALP/kGeKwEnCjRxp3RENUvMYErtX
         XeuBLHqg71YXZ1NOnTjczkQO8uRhTn8pAcyjjylWcQOjq84drJn2BnP+aSYm7FvEuHej
         eSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762349786; x=1762954586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iL8OVjWdHUzrhq3ZN/d9whcVawdUbvhGs+dukUNE9D4=;
        b=nle2zx5gT6vDJnLHihLMjipp5Z+hATsV2DaESIxnbI+76RPZtj1grz14Ti34a1NLVC
         hUM9CFlZgV/jWnhFkFNL2ThM23SsddF69PS+sFeFVPRNmzorwyHgIjbD0iXb04V6W1hu
         KFnT09ZsfcZsuoUQAW+z7NMMPS6K2UAAZeav4sEg8D8ALYKBqPNc1Zj9dD6f+4xhU5XM
         myQJS9SAch4IH5bBEh39RLwtOjmUJYv3+ltWcpIQ2+cLSU3ooRjWqdUDd0EBkKQQ5Dy4
         bY0IwRBvcwRf5cuRrvquR8+KdjyqR2a1J9ZRA+hpgc7uYRiOVrxjr3zg2TPFpjIZhVBf
         a1lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlxckLR3UXR0k5GWc2l/Be+uiAZEReRaKyCa3cczAff7HtCJ1woTs3BzPSgw2pjaKlHTFPGHcV10rQh7QYPwT7@lists.infradead.org
X-Gm-Message-State: AOJu0YzLoCMOMco7EaqB1SMA6q2/kZiZmQWvAzj2Hg19ssYXP+c9J2TU
	Xskbc55sHZG2c4/OHmo+QvN1xUkY+2EEDVqgxxOaTmjEyUKDu3dUV/X58M+EimswsVSSQbsRf6g
	0IwDkNyjllOnxVPRBxGmxy5SCA78xB/4=
X-Gm-Gg: ASbGncstQeq2vt813iLGcWrF7KO2SjXrU2wuY4HeCs1o405zg8V749vfr+mNOP2nGky
	lyRyaZtkLEExprNr1tlO0OAIN9xluiFrjw7y7/O9BN/yClROQ0PljBMPW5DVi0X26+zN1ceScfx
	RlfyF3OpSHeP18GCFRIwZ2SgtOB3krw7JFvfSFbLy5+ysGb4kXDK2J4OQTJXMKLl/oCVhWfcA7S
	9UZsvXuaeiJ3TzHXYeO82u8l7yFSyXutSr39+Vauf191R1Rv/8JM2LOileSKlTAG5Np6C4=
X-Google-Smtp-Source: AGHT+IEFGUCq5pOwZYnXFWPhWJEW8IG4enihXYQYe3+bMQEFYIeVw6QpuN6H25Eqsp92tVyTuPD9IkJCxAS5BCgQOew=
X-Received: by 2002:a05:6000:22ca:b0:3e9:3b91:e846 with SMTP id
 ffacd0b85a97d-429e32c8357mr2860369f8f.10.1762349785766; Wed, 05 Nov 2025
 05:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
 <20251002-c55-v12-3-3eda2dba9554@ideasonboard.com> <CA+V-a8sg4c697WTS=wXoWvgc_UCFM3+Qjh1br=rMm4F84NVw-Q@mail.gmail.com>
 <8c5a4c68-8299-4d8f-96b2-8db232df70fe@ideasonboard.com>
In-Reply-To: <8c5a4c68-8299-4d8f-96b2-8db232df70fe@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Nov 2025 13:35:59 +0000
X-Gm-Features: AWmQ_bkQ07gnEJ1TplADVmVgYPnAor3xF3-AhJKu46RGz6HGiG28aqTfQRb9Z0M
Message-ID: <CA+V-a8vey1y0QAxk7vYNHzPHrOrQ4uTpjf4LCb9wSRRCT3v3Qg@mail.gmail.com>
Subject: Re: [PATCH v12 03/15] dt-bindings: media: Add bindings for ARM mali-c55
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, 
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org, 
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_053628_178520_8E3604B4 
X-CRM114-Status: GOOD (  36.67  )
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

Hi Dan,

On Mon, Nov 3, 2025 at 4:17=E2=80=AFPM Dan Scally <dan.scally@ideasonboard.=
com> wrote:
>
> Hi Prabhakar
>
> On 28/10/2025 18:23, Lad, Prabhakar wrote:
> > Hi Daniel,
> >
> > Thank you for the patch.
> >
> > On Thu, Oct 2, 2025 at 11:19=E2=80=AFAM Daniel Scally
> > <dan.scally@ideasonboard.com> wrote:
> >>
> >> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> >>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> >> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> ---
> >> Changes in v12:
> >>
> >>          - _Actually_ dropped the arm,inline property mode, having for=
gotten to
> >>            do so in v11.
> >>
> >> Changes in v11:
> >>
> >>          - Dropped in arm,inline_mode property. This is now identical =
to the
> >>            reviewed version 8, so I have kept the tags on there.
> >>
> >> Changes in v10:
> >>
> >>          - None
> >>
> >> Changes in v9:
> >>
> >>          - Added the arm,inline_mode property to differentiate between=
 inline and
> >>            memory input configurations
> >>
> >> Changes in v8:
> >>
> >>          - Added the video clock back in. Now that we have actual hard=
ware it's
> >>            clear that it's necessary.
> >>          - Added reset lines
> >>          - Dropped R-bs
> >>
> >> Changes in v7:
> >>
> >>          - None
> >>
> >> Changes in v6:
> >>
> >>          - None
> >>
> >> Changes in v5:
> >>
> >>          - None
> >>
> >> Changes in v4:
> >>
> >>          - Switched to port instead of ports
> >>
> >> Changes in v3:
> >>
> >>          - Dropped the video clock as suggested by Laurent. I didn't r=
etain it
> >>          for the purposes of the refcount since this driver will call =
.s_stream()
> >>          for the sensor driver which will refcount the clock anyway.
> >>          - Clarified that the port is a parallel input port rather (Sa=
kari)
> >>
> >> Changes in v2:
> >>
> >>          - Added clocks information
> >>          - Fixed the warnings raised by Rob
> >> ---
> >>   .../devicetree/bindings/media/arm,mali-c55.yaml    | 82 ++++++++++++=
++++++++++
> >>   1 file changed, 82 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml=
 b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..efc88fd2c447e98dd82a1f=
c1bae234147eb967a8
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> >> @@ -0,0 +1,82 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: ARM Mali-C55 Image Signal Processor
> >> +
> >> +maintainers:
> >> +  - Daniel Scally <dan.scally@ideasonboard.com>
> >> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: arm,mali-c55
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    items:
> >> +      - description: ISP Video Clock
> >> +      - description: ISP AXI clock
> >> +      - description: ISP AHB-lite clock
> > As per RZ/V2H HW manual we have reg clock looking at the driver code
> > it does have readl. IVC has reg clock if IVC driver fails are you
> > still able to read/write regs from ISP driver?
>  >
>  > I think we do need to pass reg clock too.
>
> Yes - but I should clarify that the names are from the arm documentation =
that we had when we
> originally developed the ISP driver. The RZ/V2H documentation treats the =
ISP and IVC as one block
> that shares 4 clocks and resets, but when we originally developed the ISP=
 driver the platform we
> used had the ISP implemented as an inline configuration (taking data dire=
ctly from a csi-2 receiver
> without an IVC equivalent), and the documentation detailed just the three=
 clocks and resets. The
> dtsi changes for the RZ/V2H(P) [1] assign clocks 226, 228 and 229 to the =
ISP which are named
> reg_aclk, vin_aclk and isp_sclk in the renesas documentation.
>
> The IVC gets pclk, vin_aclk and isp_sclk.
>
> [1] https://lore.kernel.org/linux-renesas-soc/20251010-kakip_dts-v1-1-64f=
798ad43c9@ideasonboard.com/
>
Thanks for the info.

> > Also for IVC we do have a main clock (which is a system clock).  Can
> > you please educate me on what is the purpose of it. Just curious as we
> > pass to IVC and not ISP.
>
> The IVC uniquely gets the one called "pclk" in renesas documentation, wit=
h the description "Input
> Video Control block register access APB clock".
>
Got you.

Cheers,
Prabhakar

