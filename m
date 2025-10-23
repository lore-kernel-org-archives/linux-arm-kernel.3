Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB7BCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 21:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyDCy69Q/3azt6BaC0jOoV9WgJt8g3WAXELT1WMNnq8=; b=dTN7f9H/JGm5roxlkGZpy0Sv+p
	E0uiJKZqtg7MSIa538uC41N8pc+fu3skqPmN4Omdz69oMDq0uP7XS8ik8TNo4z1QHzVoqLoSEmFmF
	Tjb17T2H/o84+vpmKtfq3ETAE87H1mCWFuZoVvoM4Om3oo4dtjstd9kCiiSdd7yoWasVgfspdbjGW
	UTawmM7y7mPaYA6igI3FV4EtL6RNVbe/xomcIyPgoe0GUVsYous5TeT5hv/x9J0qMrarjPoTDQ/Ks
	ddo5l7vx1/Kq8r7CwfsAxG/HPex9mS4VDfdO2ANlkJdKWfcawZY+I3yxBr55d6MoZ+dqR/ANEW7KN
	1Ago78VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC3Hc-00000007hss-06Ak;
	Thu, 23 Oct 2025 21:55:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC3Ha-00000007hsg-0HB8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 21:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wyDCy69Q/3azt6BaC0jOoV9WgJt8g3WAXELT1WMNnq8=; b=jALsk8iEsA67Q9nH/Y5ufLkW7T
	Eba6T1Luv0ERxXlkGNsF+THhEYT1xLRY7d5TqJJ6KquWF+kzf8lXSQVE+TE5bBgAvV+vZ6vfGYBpo
	4SbYHKgw4l+uOiSkHeAhCgWalF1vVCx47UJIhL9h3JNp4JbmVNOTWVwlCw7ttAq1+pfyuR9x/IhKZ
	afvTE9Ad7PrtsnjG1XFgWyCObAi4U5fekpYLGXAp5hfUDxLuSTE8uPV2BV8gmDUtz1GEkhsD12YnP
	YKR50d5QXepCBb/ZjnPWz3WyIR1c4Jtux7kf+wkXd4cgAZcYocHpDXi2Hiy48j4HoWUvWVrWsvFu6
	udRqRLOg==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2Ps-00000001nue-1O9f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 21:00:14 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so2128775a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 14:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761256536; x=1761861336; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyDCy69Q/3azt6BaC0jOoV9WgJt8g3WAXELT1WMNnq8=;
        b=wLxdKlAKiczKD7ilU5JFWIlk+zUZoMVjGKnKWwlbk9RBsAV1ChbDCfXntUhkWmqaQ1
         MdwTn4MeE/w1SkaZLHu1WxBDJ+u5n74lHJJ8w5urFcGnj93j/qMYXq70koGwQAM45RsQ
         53AQk3ckqICdoh5ko6AfUYDyrWNNfg/CudVsLmIAE8iSckBPeC/qvzI/DG8gx1uMvTke
         QIxq4/QgLfM0KIhYB+gv+7Ik9Lkcqxt1vINc7eK1u5gNYRE99Vvmt+TLNdpHtMvmRHH/
         epuF9GRK4ptbJ159/UECyl96f3BCbnPh4ffVNNh/9eOpitP1PexU5QOLnCrNXgfX3o/t
         +M9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761256536; x=1761861336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyDCy69Q/3azt6BaC0jOoV9WgJt8g3WAXELT1WMNnq8=;
        b=cbYArhipcYrQcy/a/CKH1PI/VP+euBiU+E7hI9Z/J0T7a1ano21ePJAIBU5QXmfTEa
         90uJaXAPzle3vXawHyOAHPJCHpt9wU7E3f4zGlco4AtN4g6DKM6LKRz8mcvFnUCoTVuP
         aznM95wJiT83ErC3w04DgqhNR4iirICswTg/inwWPChqBycec+lxeHDfWXTNfnfHZyvu
         RJQAptB0VGFm2wI2LBmDqkXRK0lwwVTYq3cYUYecQ7SkDrJugcL77qyHZYQX5es3no9h
         E98GQjfnwLZrPcqCl5EVhNpvFYg8t28rjWBQQWt7iETGCCpKPlK1O2VeJ7vNYL+ekwxI
         iavw==
X-Forwarded-Encrypted: i=1; AJvYcCXZdqK4x5nCrnN4y7xQHGyQ+TN2Ba7cy838vaTjUkSBDYNZmqPyU0lAIR4uf1Q47G0piMCTW5MPH4k+RCu5PTR1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0WC6p6avwZGMgk8wwQXAzwKzHbVLOBI55xjsa8queKI2gL5Nl
	LUjg4N6EhPEWcbNMw8uHE1+/IaGAwc2vwtRTUhu7R6lOJmJjRG0q+rrtAbLnTKYPqjfd7p/Qn3W
	Q5K2Xt2HBtUVGY/we73vYWXp8WhuaF4uU9r9nFJG7
X-Gm-Gg: ASbGncuILMAUxHtH/cnUVhoCkuAa595UGp+LVJ0whCPy7zjpNzEijlDF5avWcaXE91V
	ROACHSnU2QB/qxG4sHXZGoFlS9uOSy/4AdcLSkpl11XZ+L2C33hzYQ4klGdTfBSihQOqPgu/X6a
	B5JDqKgW9noHc6o+8LFXxVONJMYGe0DmbNylFxWaBs4YiT8jhv0ers96KS5jnpMFuodg1MkHeX5
	tQ9Mha7xCmqQkGeMGWWHS7PdRVwN0QtfNA8bvY7sG5eH9158kn1vhGw+AibT2/ez/+PLxSfGtty
	dQj7Isw1fsQny5rXPm3iOoyZZQ==
X-Google-Smtp-Source: AGHT+IEqbJRbROlu/bm5j7ru2eVdv2x6DLq7HzQUwIw+dlex2w8ixWSRMneuISkc9NPo7yYqi/7YRgyhlNDhmAvraa4=
X-Received: by 2002:a17:903:1ae4:b0:290:ad7a:bb50 with SMTP id
 d9443c01a7336-29489e60c01mr3502165ad.27.1761256535858; Thu, 23 Oct 2025
 14:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251017235159.2417576-1-royluo@google.com> <20251017235159.2417576-2-royluo@google.com>
 <20251023-collie-of-impossible-plenty-fc9382@kuoka> <698ba0ea-3367-4fc0-bd4f-0177283c2e77@kernel.org>
In-Reply-To: <698ba0ea-3367-4fc0-bd4f-0177283c2e77@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Thu, 23 Oct 2025 14:54:59 -0700
X-Gm-Features: AS18NWDaD_LUo2BMw-kgQvNid_X2lR-GtxBED31qsEqmuEgC28zy2xECKsvSUZI
Message-ID: <CA+zupgxv9h1jOW=Jnx29yJJQBHOqBrY6tSBhoUaLb4eYuXhW7g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_220012_483979_CCC92857 
X-CRM114-Status: GOOD (  26.46  )
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

On Wed, Oct 22, 2025 at 11:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 23/10/2025 08:43, Krzysztof Kozlowski wrote:
> > On Fri, Oct 17, 2025 at 11:51:58PM +0000, Roy Luo wrote:
> >> Document the device tree bindings for the USB PHY interfaces integrate=
d
> >> with the DWC3 controller on Google Tensor SoCs, starting with G5
> >> generation. The USB PHY on Tensor G5 includes two integrated Synopsys
> >> PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.
> >>
> >> Due to a complete architectural overhaul in the Google Tensor G5, the
> >> existing Samsung/Exynos USB PHY binding for older generations of Googl=
e
> >> silicons such as gs101 are no longer compatible, necessitating this ne=
w
> >> device tree binding.
> >>
> >> Signed-off-by: Roy Luo <royluo@google.com>
> >> ---
> >>  .../bindings/phy/google,gs5-usb-phy.yaml      | 104 +++++++++++++++++=
+
> >>  1 file changed, 104 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-u=
sb-phy.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.=
yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> >> new file mode 100644
> >> index 000000000000..c92c20eba1ea
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> >> @@ -0,0 +1,104 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +# Copyright (C) 2025, Google LLC
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Google Tensor Series (G5+) USB PHY
> >> +
> >> +maintainers:
> >> +  - Roy Luo <royluo@google.com>
> >> +
> >> +description: |
> >> +  Describes the USB PHY interfaces integrated with the DWC3 USB contr=
oller on
> >> +  Google Tensor SoCs, starting with the G5 generation.
> >> +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2=
.0 PHY IP
> >> +  and USB 3.2/DisplayPort combo PHY IP.
> >> +  The hardware can support three PHY interfaces, which are selected u=
sing the
> >> +  first phandle argument in the PHY specifier::
> >
> > Just one ':', anyway this sentence and below does not belong to
> > description but to phy-cells. You describe the cells.
> >
> > Or just mention the header with IDs - here or in phy-cells.
>
>
> If you go with free-form text description in phy cells, then some
> example could be:
> renesas,rcar-gen2-usb-phy.yaml
>
> For the header (in this case clocks):
> display/msm/dsi-phy-common.yaml
>
>
> Best regards,
> Krzysztof

Krzysztof,

Thanks a lot for providing the reference!
I will go with the free-form text description in phy cells following
renesas,rcar-gen2-usb-phy.yaml in the next version.

Thanks,
Roy Luo

