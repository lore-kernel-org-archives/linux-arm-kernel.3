Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60D0C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 07:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YQZudOGNvkR0POpXebfKi8eVH+mytkHJ+3Cmk6/hAY=; b=G51rRsHTKMLjoTxX6XsIAc1YLt
	hWsPo2FCCUCnSWVYWpCoTWb5DQTVezKkgnfTBhxvilLhDzW1VZp4xgsyK5H39Z7WclVxVi87twnFi
	0UvvYuHewGzUmqnbOGbChw+sauLyCHbXXiI7x6/LnZNCpiNgc6qqt5CLOOebJKHVmyg4NhKhYyaBu
	dlwzwECwU2kJebnbqCztaDp8Gip7zCfQzcoc+RQplSu0mNVcA6pMB6VLRswRoPRlDSXuTXA/wybD7
	8/EdDLRsADXq6OAxMsHq4fAJEqVeyxtgqO0XePkasyNMe0c6tOPzChNmFyYsohodYlHCbb3t3rcmL
	ID/BvzTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkQH-00000002nFl-3iOR;
	Tue, 11 Feb 2025 07:11:09 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thkOs-00000002n6o-0aQC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 07:09:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so7168067a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 23:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1739257781; x=1739862581; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YQZudOGNvkR0POpXebfKi8eVH+mytkHJ+3Cmk6/hAY=;
        b=nqJ320wwXhBlresnVOZBi10wsGbKUGKwEvQRlUTP/25g94cdPYQ473G3EGOtjxUptf
         OEKKyQnJWS2Zj0zttekZ/GCazvgx48qCW+yu+7iIN2fGPoK7BgIPhwuti3s3Bp+VU7MF
         Yuo71q2oP1bwK/VnGgza3p6kC1mepMzw8gXfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739257781; x=1739862581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YQZudOGNvkR0POpXebfKi8eVH+mytkHJ+3Cmk6/hAY=;
        b=NgiZpuR7XnoSdXJu8kd7q/OHNle4lVh3HSQHP4q0Hn53BpseXT/c1r2GAKTMK8W4tC
         UkpAsvnZcxXmUvur/NKd+266Wi2cXnU1Ef+mY5ZlHf807u3lyfrLGHczq9kLQa42t+hZ
         KVy2mH/C/O515ETBw5QaG+f+OC0DHmE08s30wdVg7LEmUWLSb6odCvxUK6Hmynf1mSqZ
         v6hwU3+q5ud4zQLethfN43yjRauGcpFSn/VYk9V1WpqVOm7zs5+VGvjR936XyfN3l8r4
         LobFjTBC49BW4uLSX4Gw6JeXA6XRyFB19h0jjLw4KjwPlOgazXIaM8QlgM2eVfklHoCa
         Ufxg==
X-Forwarded-Encrypted: i=1; AJvYcCXq0mkzwtwIBaLiIZl6OSCkLTsyWKLzN9Jz7m9CE5jjLshidJZ5b8is9KgsWOISpv53CWR0cocx0/8mIgKyGcQO@lists.infradead.org
X-Gm-Message-State: AOJu0YwhodWfZZd5yacpRc0VMYMRpsM8uU9XWAH0YzMhFSg5XtBUv6a5
	IjuXozsldrzXCa/rfex8/S1U6ylihNA92sARP5fyAjB+pPNyXr0STIZKP2W5q1zNgy4VWkGWJCq
	iBh3/dfoqWrq/6p3KTVCNzMYKnh6LWBFtuNgpNIvNzF4U4BGlucZSrPBo
X-Gm-Gg: ASbGncs/6S1EWQ1z+JRrzEF/7VwCXBO5tfQNtB1EN6t0eiwDXSDiJSxWAl48WMGs1VS
	7qE53o9P1wzZMEq/4u1PcD9SObjXhr1liLFLtxs8BsEBlcNiak5vtZYL7f0K8SN03Rp3CQlJ1
X-Google-Smtp-Source: AGHT+IF6/kMYKGoqb8z8PKvfYxW3vFDZ3NOQjBidlyDDtrCJHoNkcja89D52JpZrvb7FprFtvnctZRHZdvFdQjq7wfg=
X-Received: by 2002:a17:90b:1e41:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-2fa23f55e4amr23173874a91.5.1739257780832; Mon, 10 Feb 2025
 23:09:40 -0800 (PST)
MIME-Version: 1.0
References: <CAOf5uw=SHCLAH21RbZCVYyU6m4KRD9g=KsYg0b9vq=AFu+cb+Q@mail.gmail.com>
 <DB9PR04MB842936EF132C8DCDFC0AB8E992FD2@DB9PR04MB8429.eurprd04.prod.outlook.com>
In-Reply-To: <DB9PR04MB842936EF132C8DCDFC0AB8E992FD2@DB9PR04MB8429.eurprd04.prod.outlook.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 11 Feb 2025 08:09:29 +0100
X-Gm-Features: AWEUYZkymAwhKg2ovzXKE7CQCcxoAKl3k8cxf-mFe8uDI-lhEFsjZN47KTe4pQA
Message-ID: <CAOf5uw=68M=prCv22=6yXXTNgNvN_rfV0yFfX-4rNniwdGLvJw@mail.gmail.com>
Subject: Re: EDAC on imx8mp and ddr scaling
To: Sherry Sun <sherry.sun@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_230942_194813_621A652C 
X-CRM114-Status: GOOD (  29.14  )
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

Hi Sherry

On Tue, Feb 11, 2025 at 7:34=E2=80=AFAM Sherry Sun <sherry.sun@nxp.com> wro=
te:
>
> > -----Original Message-----
> > From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
> > Sent: Friday, February 7, 2025 5:37 PM
> > To: Shawn Guo <shawnguo@kernel.org>; Sherry Sun <sherry.sun@nxp.com>
> > Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
> > Subject: EDAC on imx8mp and ddr scaling
> >
> > Hi Sherry and Shawn
> >
> > I have seen that with this patch "arm64: dts: imx8mp: add ddr controlle=
r node
> > to support EDAC on imx8mp" but on the same time the ddr scaling is comi=
ng
> > from arm_smccc_smc DVFS frequency scaling that is managed from imx8m-
> > ddrc. We have tested it a bit to understand if the circle to have the c=
ode call
> > from linux to ATF was somehow working. We don't check other than small
> > things.
> > If the imx8mp is compatible with imx8m-ddrc and synopsys memory
> > controller, should not needed to merge the support in the synopsys
> > connected to the board platform data?
> >
>
> Hi Michael,
>
> The imx8m-ddrc you reference here is totally different thing with the
> synopsys_edac that my patch adds.
> imx8m-ddrc targets dynamic frequency scaling of DRAM, while synopsys_edac
> targets DDR ECC feature(error detection and correction).
>

Ok, that is clear but both insist on the same object, the memory
controller. Now I need
to check better but the memory controller is de-facto coordinate by the ATF=
 in:
- memory frequency scaling
- suspend/resume

At the moment I don;t know if  I can consider them independent. What
II have done quick is:

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 5db541f0eaf1..e923d789757c 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -556,8 +556,14 @@ static int imx8mp_clocks_probe(struct
platform_device *pdev)

  hws[IMX8MP_CLK_IPG_ROOT] =3D imx_clk_hw_divider2("ipg_root",
"ahb_root", ccm_base + 0x9080, 0, 1);

- hws[IMX8MP_CLK_DRAM_ALT] =3D imx8m_clk_hw_composite("dram_alt",
imx8mp_dram_alt_sels, ccm_base + 0xa000);
- hws[IMX8MP_CLK_DRAM_APB] =3D
imx8m_clk_hw_composite_critical("dram_apb", imx8mp_dram_apb_sels,
ccm_base + 0xa080);
+ /*
+         * DRAM clocks are manipulated from TF-A outside clock framework.
+         * The fw_managed helper sets GET_RATE_NOCACHE and clears
SET_PARENT_GATE
+         * as div value should always be read from hardware
+         */
+ hws[IMX8MP_CLK_DRAM_ALT] =3D
imx8m_clk_hw_fw_managed_composite("dram_alt", imx8mp_dram_alt_sels,
ccm_base + 0xa000);
+ hws[IMX8MP_CLK_DRAM_APB] =3D
imx8m_clk_hw_fw_managed_composite_critical("dram_apb",
imx8mp_dram_apb_sels, ccm_base + 0xa080);
+
  hws[IMX8MP_CLK_VPU_G1] =3D imx8m_clk_hw_composite("vpu_g1",
imx8mp_vpu_g1_sels, ccm_base + 0xa100);
  hws[IMX8MP_CLK_VPU_G2] =3D imx8m_clk_hw_composite("vpu_g2",
imx8mp_vpu_g2_sels, ccm_base + 0xa180);
  hws[IMX8MP_CLK_CAN1] =3D imx8m_clk_hw_composite("can1",
imx8mp_can1_sels, ccm_base + 0xa200);

And in the board:

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
index ffd3672255c0..f96a9d9f64d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
@@ -194,3 +194,23 @@ &edacmc {
  <&clk IMX8MP_CLK_DRAM_ALT>,
  <&clk IMX8MP_CLK_DRAM_APB>;
 };
+
+&edacmc {
+ operating-points-v2 =3D <&ddrc_opp_table>;
+
+ ddrc_opp_table: opp-table {
+ compatible =3D "operating-points-v2";
+
+ opp-25000000 {
+ opp-hz =3D /bits/ 64 <25000000>;
+ };
+
+ opp-100000000 {
+ opp-hz =3D /bits/ 64 <100000000>;
+ };
+
+ opp-900000000 {
+ opp-hz =3D /bits/ 64 <900000000>;
+ };
+ };
+};

+
+&edacmc {
+ compatible =3D "fsl,imx8mm-ddrc", "fsl,imx8m-ddrc";
+ reg =3D <0x3d400000 0x400000>;
+ clock-names =3D "core", "pll", "alt", "apb";
+ clocks =3D <&clk IMX8MP_CLK_DRAM_CORE>,
+ <&clk IMX8MP_DRAM_PLL>,
+ <&clk IMX8MP_CLK_DRAM_ALT>,
+ <&clk IMX8MP_CLK_DRAM_APB>;
+};

I have just a quick copy and paste in the email. This gives me a quick
idea of the status. So from one side
I have on reg =3D <0x3d400000 0x400000> the imx8m-ddrc driver and on the
other the synopsys. Do you have a plan
on how those two functions can be coordinated with each other?

Michael


> Best Regards
> Sherry
>
> > Best regards
> > Michael



--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

