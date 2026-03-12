Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE25FED2F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pu5XIQSGCkSF/OV0YlHjxKCm6okhTIDdYRaAvJzmT7M=; b=KikUww2khmnk8UoW/IZOwsA0By
	5hhtqYhbyxENYvEkGRewmCkROq9pCrjVX/fN9YwD3UBMbXVMp2QpF+BFzf3Pwq1UEMKalwApGhK93
	vy6ogWZ5WZvNt7i7rIkXOg+y9inU3hFEr9ULzCIeO8VUv5nc5UAeknCGBSNnAqpNrkOpSrBJ8LYoy
	aq3pN9fip2bPo+6NEP4rkavxh6K+LH7E+KclaHSIia0dhUdgiktcsb4iWI8ouZ5dC6fOq8Jg+iIXB
	y3lnt2f04ZVaplVTdD7fzM7NWCeR1uQkcVC1Yt5Y1Hd0O9lq6wWUFAaBgvyZr8wJcOGrngO3LXuLr
	YEYr0C0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cjy-0000000DoME-3ySk;
	Thu, 12 Mar 2026 09:54:02 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cjw-0000000DoLs-3wYc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 09:54:02 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c7384f5a9cdso336747a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 02:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773309240; cv=none;
        d=google.com; s=arc-20240605;
        b=I9WUun5tGyPigxAAVoTFg6UjzifLsFz2z+3fp94S4I/4iKX7xnPiFHF7csAh3j2uey
         uOwUc+qnn//dAIkAJrFEc45PSXC4rMOv8ZETqrOUPj0DGaeZQMETMsf9gyBNA0MYr+1B
         y9X2CYvF0yodEknorBakR3aWNE5z3mTSxEWkTUdiViRtuVD9VaXLSktaF3zaP3mtCfIc
         eTHegESbUQVKuPQ6nNftkwh0Bawa/OUf9eypfXmquLrj48u11EsJeT37KDPYT6RG0vW/
         DZRCLFuxzkMYR4+c/L1Zlx5nKLBzyKK3+E1fXGmnXrliZXr8GSnDzVvOhc3BGDarv8J4
         tKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pu5XIQSGCkSF/OV0YlHjxKCm6okhTIDdYRaAvJzmT7M=;
        fh=H0V8Pf7GNQW88sCQV/K6Qfb4+/jCzyuHgwCgxFejJn4=;
        b=JW0+NwffC2SpNGDeqiRS8AhYdHMXZrCWWuhhIcT0fflaeP45zYLiK+CASLiTRkJQS8
         4wsGccVE+MsmhwEpUt52xawCOMDj/IESl6b7H5KDTbBg53OS1xgR+lbxCbLcbj3e7smu
         Jfns5BKJGbbRHmxg8+9w14johYgrzhzxroSHPzFPYIsgcbxBAiZ+Ep29Iz2QIfxbfjZ2
         0p+L+kd8EEYf7EoFynFgK/IuLYuxuL7MOAdEuuaAXiBjqcxzOKHS5OcggjWtO4/rNdrc
         tVPv1zEHK1aO+Ug1S7WIOFFm5NscGeTwl+lpxPSFCS265KuYd0DPHpDtT10O6dxtv6yX
         uJbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773309240; x=1773914040; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pu5XIQSGCkSF/OV0YlHjxKCm6okhTIDdYRaAvJzmT7M=;
        b=LRKQhjD/Yuf5fzarJvYiz5XW72EHPGZtr2QNWQbBao1cI0iGnBCn157Zfk4ErvKu9R
         3e+wYL2HT40XPg1at0+DEmLvC5U2OTcZOaChhxbaaJFbMj3eCqKC25j1q6YKRAJsDsl3
         9E6b/hApdbH9qccwN1w3Fc8YtR+sk8TlH5p4Te7ON76CbPMEZkoWsQM/TADQX9EtTnq4
         ziu8ZGNoRsdCB9iXLvrwc7+awNd6l3fDHv4RInJ0aiPDLhXBtJ/HaUwTk5bYcNlWWqAy
         gvQTMtsAq2ZqXKffmHm7BvCpVYtylG2eL2i8Tvzd5BlUCVrajO6XNEI3s14gQILN4SIe
         LWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773309240; x=1773914040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pu5XIQSGCkSF/OV0YlHjxKCm6okhTIDdYRaAvJzmT7M=;
        b=iSyc2oh63cRKE8OJrnEHrNJIebVWKXzkK7tEWUDIaB/a4GFQ49K+VUyh2IM0FKlMZQ
         fnpuNTtDhEn8ZXiNUVvabcYncqX/1o4p7dTp0LLBmsp3Qa4u2ax0XaCZPcL0q8FVzP/H
         +EXLK7jc9anRYXRMLz5W0qU0iVakgnktVCJIZLgUq+E+XWoH1fbT8foIHuUwZKtDwQSh
         5xdUeh4TjMC7ljn9tlKACIpTEDvT9QgBaXvcePleml/kn64UAWfeMsG1ey2a5rXtbF9I
         e6agKsQpu8vecvf+ibXR7B8S09/DnruGmID+xNOKQY9GSMNYCJaYuZ1iSvUgg9000whG
         2q2w==
X-Forwarded-Encrypted: i=1; AJvYcCWXVbw8N7qx5a81Y9faxblCBYgKgLSiC7CezQFheFzaCoJI1KmoO0Vl5b8/RbpWefj1vXbbVa0hGrTJnD55By0j@lists.infradead.org
X-Gm-Message-State: AOJu0YyjVJ2rgDUixm7BkrcnOkDCpaNaFbebYDAEirYDh1GT/jHosCUs
	n6IgGrdiNlmYtlm7MeUn5L3eYBNmtFdGJYFcVEkMOpgDxId0KnM+LNmk3cEZvnqJXUSReUZhDyb
	deqhcymuCWjKbDlRBVkZkGqylP/2MCEs=
X-Gm-Gg: ATEYQzxJuL1ggLGR4qfTwBAFpykLvZG6I49WZusug4I27cBx6a1fmBZP/JcN2WD1N7Q
	qZydWblcq54UB8+2aTL/9BPmo1ZgSzmOG9SJzkRQ4f7TJs2I5+eT7WLRAq/866Is8Cx087C62NJ
	vBNbZ1bo537qZpE7wjj2wpkG2SevtTd3G3q9SdPtwiF0HVaOmBE1qX2Zv/sGBcaNWq+54hlm0VU
	Wkv923JZBf2kvqRxP34jnnlsd39DNT9p12RaLhUWMFGU0+Ty/+/i+qyGnqCKtRdVAxhGv/bMIob
	9Yk9+PUutX4cDLze7Q==
X-Received: by 2002:a17:902:e950:b0:2aa:d506:d189 with SMTP id
 d9443c01a7336-2aeae89463fmr59366865ad.34.1773309239948; Thu, 12 Mar 2026
 02:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
 <20260312034912.4007057-2-shengjiu.wang@nxp.com> <af948fb4-4f63-4276-9368-9d41e80c3e7c@oss.nxp.com>
 <CAA+D8AO2-C8kRiF3ymYd7fvAL_Op5ohwk=m8ZbfjHUWXCSn_3g@mail.gmail.com> <8b4f6c08-9d4a-4af6-80a3-9e3a351ce451@oss.nxp.com>
In-Reply-To: <8b4f6c08-9d4a-4af6-80a3-9e3a351ce451@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Mar 2026 17:53:42 +0800
X-Gm-Features: AaiRm52mG1WKwAEkIuooQ_iRETrNiaYWjlFWELMoCo_5r-yCY-ygySmvazvcFFw
Message-ID: <CAA+D8APVjeyPEypiJYXJLWEf6ye6c3EPb=DKBfLnBxOYoNGUOg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx952: Add audio device nodes
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_025400_990309_23F04DDC 
X-CRM114-Status: GOOD (  22.52  )
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

On Thu, Mar 12, 2026 at 3:10=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 3/12/26 08:54, Shengjiu Wang wrote:
> >> On 3/12/26 05:49, Shengjiu Wang wrote:
> >>> Add audio device nodes, include SAI, MICFIL, ASRC, Audio Mixer.
> >>>
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>> ---
> >>>  arch/arm64/boot/dts/freescale/imx952.dtsi | 199 ++++++++++++++++++++=
++
> >>>  1 file changed, 199 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/b=
oot/dts/freescale/imx952.dtsi
> >>> index 0f86b5626cdd..5787c12e788f 100644
> >>> --- a/arch/arm64/boot/dts/freescale/imx952.dtsi
> >>> +++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
> >>> @@ -823,6 +823,156 @@ usdhc3: mmc@42c40000 {
> >>>                       };
> >>>               };
> >>>
> >>> +             aips5: bus@43000000 {
> >>> +                     compatible =3D "fsl,aips-bus", "simple-bus";
> >>> +                     reg =3D <0 0x43000000 0 0x800000>;
> >>> +                     #address-cells =3D <1>;
> >>> +                     #size-cells =3D <1>;
> >>> +                     ranges =3D <0x43000000 0x0 0x43000000 0x800000>=
;
> >>> +
> >>> +                     asrc1: asrc@43000000 {
> >>> +                             compatible =3D "fsl,imx952-asrc";
> >>> +                             reg =3D <0x43000000 0x10000>;
> >>> +                             interrupts =3D <GIC_SPI 376 IRQ_TYPE_LE=
VEL_HIGH>;
> >>> +                             clocks =3D <&scmi_clk IMX952_CLK_BUSWAK=
EUP>,
> >>> +                                      <&scmi_clk IMX952_CLK_BUSWAKEU=
P>,
> >>> +                                      <&scmi_clk IMX952_CLK_ASRC1>,
> >>> +                                      <&scmi_clk IMX952_CLK_ASRC2>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>;
> >>> +                             clock-names =3D "mem", "ipg",
> >>> +                                           "asrck_0", "asrck_1", "as=
rck_2", "asrck_3",
> >>> +                                           "asrck_4", "asrck_5", "as=
rck_6", "asrck_7",
> >>> +                                           "asrck_8", "asrck_9", "as=
rck_a", "asrck_b",
> >>> +                                           "asrck_c", "asrck_d", "as=
rck_e", "asrck_f",
> >>> +                                           "spba";
> >>> +                             dmas =3D <&edma2 97 0 0>, <&edma2 98 0 =
0>, <&edma2 99 0 0>,
> >>> +                                    <&edma2 100 0 1>, <&edma2 101 0 =
1>, <&edma2 102 0 1>;
> >> For consistency we should use symbolic macros for directions like you =
did below.
> >> Use FSL_EDMA_RX for rx direction and also introduce FSL_EDMA_TX for tx=
 direction.
> > Yes, should use FSL_EDMA_RX.
> >
> > But introduce FSL_EDMA_TX, it should be zero,  FSL_EDMA_TX =3D 0.
> > is it necessary to add it in include/dt-bindings/dma/fsl-edma.h?
>
> I would say yes. For consistency with FSL_EDMA_RX and also for
>
> code readability.
>
> A user doesn't know that 0 means TX.
>
> We could go on and merge this patch as is right now, no problems. And com=
e back later
>
> with a set of cleanup patches that do this for all dtses.

I think it is better to have another patch set to introduce
FSL_EDMA_TX for all dtses.

I will add FSL_EDMA_RX in the next version.

Best regards
shengjiu Wang
>
>

