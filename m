Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033A0CD6E71
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gGk2esZ3TPP+U/Xv/QDaG4ohk1EPYMCao+ua5Ut7t0=; b=wpJ/3I0KBgUcpYnnq5qOCgiZ8i
	yAAsAzTRGLfdfe96Xfwk3R4Gl4GTvMYCdAQbjiL6k2Q4b/2Xt9lcbjNPtav0SFpDIL3QvQKwZU5TY
	rArxtZ/e1enXmdbwD6gESE5HMz+lthMVYo0jd3krln+VWa0iP2OEuGYQ8hSwVSGjNLy3+zNXY7VsM
	ZL3bc9qC1dUHL7s+Aduj4MyYI4EwB7O1T4HOlpFJ/Lrj7s7RtIkOFlyTg5uJoE+Huj34ryk50d/UE
	gDKPmNDcvsXO0qPRwJ1HANpHtal3AY+dGY0qkdZwlHH6BydQmTxHMq2ijlf5dhCCrhseo+NXIeUdL
	GHaWbTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYAU-0000000AbKT-3BxS;
	Thu, 13 Nov 2025 14:19:22 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYAS-0000000AbK4-1UD5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 14:19:22 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so1213177a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 06:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763043558; x=1763648358; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8gGk2esZ3TPP+U/Xv/QDaG4ohk1EPYMCao+ua5Ut7t0=;
        b=OPLK+hbeEcHGW2eUpj9s7FkxLaB98vZvj/CIwFPZDtqTZHElOjmKcRENZCFrdtpY5r
         aRwL0Ak7ZAczBIcchtsBdsmyaqBtVu8t1sG7FiI+1JoXyetaSb8X5jX6P6xo8pB4SPuF
         DEYB1O25fcZHjBBLwOrYlEqJKbT0W8e2dtOfAj1IA0r0uCJGYoRQHx+OpGyokKNqThpz
         kqc58kuBLUnbgBCyleiHFlap3CU22+wWVbp4cfISuTSHdsJNxPgRUHBNn/dGz7hzp/NL
         iu4/WaOXJmWM3aB+rk86DJlLzuR7J/VUCgH5Gzmc2xOh3GPOPXCQvqW3ztTFVWf79kAM
         30Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043558; x=1763648358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gGk2esZ3TPP+U/Xv/QDaG4ohk1EPYMCao+ua5Ut7t0=;
        b=gyajcMedGiSndxjjc8S077VBa2329QdKtIUdMixk/nfTXdnGxAIHhblh9zEo8NnDBg
         1o3EF5AwAbTlCFY6ZFN6fW7Pi0gNrXNo63Mi1cStc43acALdTaM886cyw8kFDFf4Ct/1
         T9aufVmdOPqnVm1EGh24iMSsxPAMP5MfVjl6zBD8mfMaHoNNAs7LLQfwbnHh/KEsNRg8
         DBhVpW/xQG9MmE7nlgGa0Ux6hA5zLjkwT1NVYykNPcnU962024mnaJtIBy2YKBKOf2DM
         +Htqsrc2csC1R2QGsNq6lSQK5uoUNmOKwKsX4M45Dm+sTxfR7g/fc/ycZC1HslD/8eu1
         sCRg==
X-Forwarded-Encrypted: i=1; AJvYcCUh0lJWx1Lc7sUzj2YVa2vSemddLhE8IFOL5iBPjTIICe1nmQuykQyn2SAfE5Egsay3Uq2dB+ECAZ+km7FO4Ib0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5nCViqKcED8Kj2PhnObDtr6VYKpp5OuggTwhRiNM6WsDEAohu
	YPiz+bTO0bx/puLEV8jDQuO4veZVmMpIMFD3TEguwQkYOLzqCppPv1j/b3QNsfktNHdBmMIXhFA
	OoY2uEAF3KxdYueuAALxXrfFvWaI9xn2o9nt2EJxrDQ==
X-Gm-Gg: ASbGncsqvBazDUnyPuOcrh9AVGnM6dRXxYDc2NtQgQv4Wwlu4Vq5vVzptpFOmHhRHFS
	dJh2s2GATunhZSxfeelubOVIp8WSv5K7dcqmix3oyQ41WQ8aD8Yx5ssVI+ESl7vNTy1X6rHKvS6
	wgnk4mymzfT4ASETJbc1o1Krc8BSr8j712yrotTrPxK+JdtD+Bxl8Zqmesok2FN1C/3/ANPsE78
	mrmE8HD0znSJsl3rNZosz0+H0daYkOqMmLDK6VrUfSX3DFPGAPjk/b+2B6hV1xgW90EP+4hbkHj
	cZCqfYtz6oiyGA==
X-Google-Smtp-Source: AGHT+IEk4ZuVDBz3u+9Uv4/zJfB1Emeu9cNMcz6aWafXiAHCM1K8SOZabMAhPk/X3XNWJIyPPXn256y5U9W+nbjKzzM=
X-Received: by 2002:a05:6402:27c6:b0:640:95e2:cd17 with SMTP id
 4fb4d7f45d1cf-6431a57e355mr5833525a12.36.1763043558031; Thu, 13 Nov 2025
 06:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20251110173334.234303-1-vincent.guittot@linaro.org>
 <20251110173334.234303-2-vincent.guittot@linaro.org> <aRIn1COnQG6Mz27j@lizhi-Precision-Tower-5810>
In-Reply-To: <aRIn1COnQG6Mz27j@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 13 Nov 2025 15:19:06 +0100
X-Gm-Features: AWmQ_bn4_FBV_0kJ1ugPYoCrbCQQh9T4qf5dxZ1Dk01YEW7NuCgTcJxJ5cXExLg
Message-ID: <CAKfTPtBT6qT2zC8toUOEFD_ZkJPBMJgZrZc2NCAFSUXANYJ==Q@mail.gmail.com>
Subject: Re: [PATCH 1/4 v4] dt-bindings: PCI: s32g: Add NXP PCIe controller
To: Frank Li <Frank.li@nxp.com>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_061920_457922_D1177B25 
X-CRM114-Status: GOOD (  17.68  )
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

On Mon, 10 Nov 2025 at 18:59, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Nov 10, 2025 at 06:33:31PM +0100, Vincent Guittot wrote:
> > Describe the PCIe host controller available on the S32G platforms.
> >
> > Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  .../bindings/pci/nxp,s32g-pcie.yaml           | 130 ++++++++++++++++++
> >  1 file changed, 130 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > new file mode 100644
> > index 000000000000..6077c251c2cd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > @@ -0,0 +1,130 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/nxp,s32g-pcie.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xxx/S32G3xxx PCIe Root Complex controller
> > +
> > +maintainers:
> > +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > +  - Ionut Vicovan <ionut.vicovan@nxp.com>
> > +
> > +description:
> > +  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
> > +  The S32G SoC family has two PCIe controllers, which can be configured as
> > +  either Root Complex or Endpoint.
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
>
> Suggest move allOf after required, in case add if-else branch later.

okay
>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - nxp,s32g2-pcie
> > +      - items:
> > +          - const: nxp,s32g3-pcie
> > +          - const: nxp,s32g2-pcie
> > +
> > +  reg:
> > +    maxItems: 6
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dbi
> > +      - const: dbi2
> > +      - const: atu
> > +      - const: dma
> > +      - const: ctrl
> > +      - const: config
> > +
> > +  interrupts:
> > +    maxItems: 2
>
> Need match interrupt-names's restriction
>
>       minItems: 1
>       maxItems: 2

Yes

>
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: msi
> > +      - const: dma
> > +    minItems: 1
> > +
> ...
> > +
> > +        pcie@40400000 {
> > +            compatible = "nxp,s32g3-pcie",
> > +                         "nxp,s32g2-pcie";
>
> put to one line to save LOC.

Okay

>
> Frank
> > +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> > +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> > +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> > +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> > +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>;   /* config space */
> ...
> > +            };
> > +        };
> > +    };
> > --
> > 2.43.0
> >

