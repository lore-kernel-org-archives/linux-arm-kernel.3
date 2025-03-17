Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9B1C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06QGEsbiDHTPlITpRCkSEygiFBtZganqjlJySZAtEPM=; b=0HrHuYdR0//buiyJzIs1RZzib/
	yla9GvO6NFtDy7Z0aETpmJsJwjrEEvy3Tl7iBE5s4kZ8pCYv/SIyx2C7rZxHirGHxxSgOTwnR7qze
	91Pa78dvcvYyPeZUIyzvNK+RjsWFE77VaT7ll21kKALlikCcKzCmrTb9CuaJU7QBjn/FYoSF1OBcg
	3VpNT6uLZ2BqLEgPMFZL1L3es5t9wuZVfVowo/jjLWEEkyzVLWZrFX6+ntQ7WoELAnu/AMtE9Z/v1
	p0BmC6dZyz2kRP+12/d+4BFoqlMgkbc+sPDr/JyixajA/z8mLHAZuDKbKzr0SyF7hJF/NMJrlzDjx
	xbVZ0sqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCsX-00000003EuT-0ZR8;
	Mon, 17 Mar 2025 15:59:49 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCqq-00000003EPh-0Q5b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 15:58:05 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so4647921a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 08:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742227083; x=1742831883; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06QGEsbiDHTPlITpRCkSEygiFBtZganqjlJySZAtEPM=;
        b=llHAOInjzuuegrvu9hjD//5RQ6QvdlnxopgXfrD7TIUCUA4QupIN/guCmzLMrx3/uo
         w5KmXQRhrZr+3/IFI9TwQuQVLV3EpHqIrhWOJyw/VAe5vGN/wMW90jYCAnHceNi60/PJ
         GLznekkhl8bkDMIEUBzxfNGtCGDLB+E2Nmd9PWjyboOJSViF3P/12JhtYqYuvuh8BY2S
         nn2SWB9Ed4lzi+l47Y5FuUT5GBCNdOX9SDa9eLC2G2PU/f0hQj0XdMsvmIPPdkjm5Tn7
         5a76/SBe5JzXx2us84dYAf36QAE4YBF1j34oexQKlBvz+JShEQi/7OePW1Zy/q09RVYC
         2Neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227083; x=1742831883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06QGEsbiDHTPlITpRCkSEygiFBtZganqjlJySZAtEPM=;
        b=b4ssw5wphzt7XqFPZHIiPz97KwqaeUnhGoeA/I/sIQHLiExIcmwLXjs8J9jp3BfBlz
         Q+bOIKmnpdxXTCE+ofSInArtVwRcN+dJeE6lgyBGbdRZgX25OqU9VFhiJkpVjLU5zQtX
         EqgMMwD0zvIOG/5/OZv8HMLm/VrPnT4yUpM1bAjbP+II6jygYKetCYYIPMue44klKCeI
         JqjptQfqr0Mt52DNhcWLmBfn6bw+/SxSUOTENROaVJAx+W+Y6BbYReqtOFXpH+rHASat
         o9ezU+bqzst4pYbLSIvpfc/1jTzDyUVuWQhxFVsaIvisUECXqP475/YhQKgrqOHWrLV6
         44Og==
X-Forwarded-Encrypted: i=1; AJvYcCVd2ljqSdGs3Yr5wamsYCsVhF7n2tUuTQxLe2ap9kXYaClq8NxYyfGdEoNwkeb29fne+LrLnQHFVGHysiq9cxaY@lists.infradead.org
X-Gm-Message-State: AOJu0YykRW907DnNKXzZczouWsdCh8eG04Q78yHQj/k6VTluFkgauvyA
	+ALqXTRybW/XgBw2+PxKFYv8wxorZDK14SjLcQI0jk9vdp/Ylrx1RaIkIfKhdlbPzMlSfbjX9Ab
	7YP20R97ftwqCd7KOm7AOzuSYFVs=
X-Gm-Gg: ASbGncuWS/nFEL6xWHbrHNnK/2Q8GsMidtE68ZreGjHkEO/89cSof1ww58kM4zOvMpz
	TFfItjqJkWsbW/pATrahnPxXXDWHDzgJJIo58v9682ULjl+EtLUBbdfOAIHLoU7td0TEzh8wwUx
	Dulc+l98GrKNSWUvVwfMhhEIMxepM=
X-Google-Smtp-Source: AGHT+IG3Ayo9k0yRtjHNBCfqhmNJz3asFcvcSqQ3hdNGSq7kkzqBge1sZkHTYixEYa/8f6gTrblik9jUofUotL/jY/U=
X-Received: by 2002:a17:90b:17c5:b0:2fe:b735:87da with SMTP id
 98e67ed59e1d1-3019e7a3ce7mr409937a91.0.1742227082981; Mon, 17 Mar 2025
 08:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250317133306.2003909-1-daniel.baluta@nxp.com>
 <20250317133306.2003909-3-daniel.baluta@nxp.com> <5873285.DvuYhMxLoT@steina-w>
In-Reply-To: <5873285.DvuYhMxLoT@steina-w>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 17 Mar 2025 17:58:07 +0200
X-Gm-Features: AQ5f1JrRqDM8p6JEGxBqM22DUaeaV1igcAM-i6by99ARfroWOHqb4YOLD6MREdU
Message-ID: <CAEnQRZCsCYbQU8uxpFeyLmji65VRoO0rckRcoyc3frd2_B_KqQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] arm64: dts: imx8mp: Add mu2 root clock
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: shawnguo@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, krzk+dt@kernel.org, 
	conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, frank.li@nxp.com, 
	aisheng.dong@nxp.com, laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, 
	iuliana.prodan@nxp.com, a.fatoum@pengutronix.de, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_085804_143896_C02C6CE8 
X-CRM114-Status: GOOD (  14.71  )
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

On Mon, Mar 17, 2025 at 5:30=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Montag, 17. M=C3=A4rz 2025, 14:33:03 CET schrieb Daniel Baluta:
> > Enable MU2 node and add mu2 root clock.
> > MU2 is used to communicate with DSP core.
> >
> > Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index 3b725fe442d0..5b443fbeded8 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1253,7 +1253,7 @@ mu2: mailbox@30e60000 {
> >                               reg =3D <0x30e60000 0x10000>;
> >                               interrupts =3D <GIC_SPI 136 IRQ_TYPE_LEVE=
L_HIGH>;
> >                               #mbox-cells =3D <2>;
> > -                             status =3D "disabled";
>
> There is no need to enable MU2 if the DSP is disabled by default, no?

True, I can enable it only when needed. Will fix in next version.

