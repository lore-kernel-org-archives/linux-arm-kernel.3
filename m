Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B61C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 08:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlIgqCz0Bm+91Vdon2hQ0cQM2Da+fTaQGYYMw9HsqC4=; b=H2tYmtBeCpdrsBIXAfe+kmGmD5
	djEf41RjPc3ZvI1Ry1bCfXbiDq9g5fWpDUIkQodE5iYm8v1L491aYwj+oAEYwiDduqvrbzsD7hoz6
	m0IcCm0D+6Iw0M1nRDQYpT/BElOKquNRSy9eHDou6yPEntCJsfcAuoKMBmLmV+ZKPRhES8QcMjp/g
	oiT67N2LTeSgqtchJmpkGfcTHJoQdgMyfmfZTonixCm93ACKZqjc/XCEIp7gBjsYCuM4XEWEq6gam
	gTrTTvrmJYHl72Kp7CUBf+9WT9Kn2lcGbVkedS6EX8ylDYrmfJ4z+1FJnFhc5/Qst5rPiRtWDw1hl
	chZaPYug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOor-00000004njD-451V;
	Fri, 21 Feb 2025 08:55:37 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOlZ-00000004mzI-3m6S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 08:52:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2211cd4463cso36470255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 00:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740127933; x=1740732733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlIgqCz0Bm+91Vdon2hQ0cQM2Da+fTaQGYYMw9HsqC4=;
        b=ZoqPB8HC5PGvG8nwb25ya6lv4/EwxzBa21MiBDC+RoUtehCixD0BP0yrmDdZIQOI8z
         mc5QJZ1KkCCQzQ2+/KyeueTxlNcl9tqi5cKiwoXNcu8jaDIr5BB17MHlhGyv+gxVht4M
         g+6H+2GhDlcSoJCo4zBOkNWKEvXyuWnwxZ+2r2F3KP4uyggOU5O0dN5M+RoZgMOc2j9/
         OodFcIn0W0bnOZhteaccAVIAP9dOnjDltyjGdPPRijmz4Q4ezrlQN3fFVIZ0hawhGBS8
         1ho88Xh+MlRHm30H//fQDhZXIu/TS+T3H61j4Ns6AIjpGMRIqSpAZgFl1CUrHBwjw0ij
         LQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740127933; x=1740732733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlIgqCz0Bm+91Vdon2hQ0cQM2Da+fTaQGYYMw9HsqC4=;
        b=XRJeu0U+NL7vp2zxVTsz7UJ5/cWim5R1PvW2MlQMYPk3iffDNUqq5U0ULbhDIc/qF2
         mfd3BmZ01XjxPIBOK4UJs2A8fnXb5Dlc3dA/6WX+JqjF3nT4GOrtbtPBxn6gTcS4f+F3
         qX3DzP1WXQ/vqX4X7Zvy3QFjBLSJG0GTBRlNN7H/HNLA3aoVAh2T4/ReKvwbQZfceOhF
         Ha1sV2KDRNJNdQnbpcvlDiIEAfqsAT6S3vicgr9Yu3Un9nIkpFdo0PoJhx1QwmnJFwVB
         HHmlXJK2+legpgknb1TNg1YAsImTRe/cBrDrA6E8tygp7AbQPk/dxsQo9dJxRpA9N3tL
         9lNw==
X-Forwarded-Encrypted: i=1; AJvYcCWSyrLiw41OfqYhHXt8sJUkFA+cFFj7k3c3QyPUl4sjQr6sAsr9cRa8ave3bJX0xNaiDyIwnrtcJUmKXODLF9iz@lists.infradead.org
X-Gm-Message-State: AOJu0YwN9V4qQmFxZWuY28Wrx01JlVFHpRAf0C9VmIic2JvmN4YDszmj
	ab6bdpZ/YyBr6jgq7oeXrodgcZJtFDZWgrZM5UCTxO4Hy6pRM40DP45jDaTYncFwCwJATUQSdT0
	343melMySK9nKqmdTuWtU5dw1mdA=
X-Gm-Gg: ASbGnct2Fd4HQhd6AT297VdNya9oHpK+08JBpu/6Gj6aqxtSrnvBPJHa/T9MdAb1tL9
	A9jJ3TKeDBTwyO2IDgdk9C6gexCDImugTEqM6IInblTotU0F8a6DNRiCemqWRVMPKaoSIsHIGnz
	1f7HFJvtPUmaSnY9qMbysRGv4Cn7CFMLqk27ldGdkN3Q==
X-Google-Smtp-Source: AGHT+IE4RNFZsUdcC+Az/pPyn8dX9rljdP/Z5hfEIBv+Z54mKOPsANtz1C01SeJk4ImSyu09+DbDaPKDwVb/a6c1c1E=
X-Received: by 2002:a17:902:e80b:b0:215:6b4c:89fa with SMTP id
 d9443c01a7336-2219ff3604dmr36634085ad.8.1740127932926; Fri, 21 Feb 2025
 00:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
 <20250219192102.423850-9-daniel.baluta@nxp.com> <c52e6c5c-f49e-4727-b669-086ae7cb0e1e@gmail.com>
 <6e03b0c09c4e6d222670025c6540f73a0a0a819d.camel@pengutronix.de> <9028f7a8-7cf7-4ebf-86a6-0d894c66edb1@gmail.com>
In-Reply-To: <9028f7a8-7cf7-4ebf-86a6-0d894c66edb1@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 21 Feb 2025 10:52:00 +0200
X-Gm-Features: AWEUYZk3O0UDfRBUUGtaK3pMjLH9rJuAF3_7PiIGx3Zt9ZlWm0Pjpm4mYFBC0o4
Message-ID: <CAEnQRZC=U_Bw7Hzr14qu7O9YM=qcXeMTSGQnM-ZX_hqSyg4sqA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] imx_dsp_rproc: Use reset controller API to control
 the DSP
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org, 
	shawnguo@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org, 
	shengjiu.wang@nxp.com, Frank.Li@nxp.com, peng.fan@nxp.com, 
	laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_005213_943125_94814721 
X-CRM114-Status: GOOD (  34.98  )
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

On Fri, Feb 21, 2025 at 3:20=E2=80=AFAM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
>
>
> On 2/20/2025 5:45 PM, Philipp Zabel wrote:
> > On Do, 2025-02-20 at 00:22 +0200, Laurentiu Mihalcea wrote:
> >> On 2/19/2025 9:21 PM, Daniel Baluta wrote:
> >>> Use the reset controller API to control the DSP on i.MX8MP. This way
> >>> we can have a better control of the resources and avoid using a sysco=
n
> >>> to access the audiomix bits.
> >>>
> >>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> >>> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> >>> ---
> >>>  drivers/remoteproc/imx_dsp_rproc.c | 25 +++++++++++++++++--------
> >>>  drivers/remoteproc/imx_rproc.h     |  2 ++
> >>>  2 files changed, 19 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/=
imx_dsp_rproc.c
> >>> index ea5024919c2f..631563e4f86d 100644
> >>> --- a/drivers/remoteproc/imx_dsp_rproc.c
> >>> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> >>> @@ -19,6 +19,7 @@
> >>>  #include <linux/pm_runtime.h>
> >>>  #include <linux/regmap.h>
> >>>  #include <linux/remoteproc.h>
> >>> +#include <linux/reset.h>
> >>>  #include <linux/slab.h>
> >>>
> >>>  #include "imx_rproc.h"
> >>> @@ -111,6 +112,7 @@ enum imx_dsp_rp_mbox_messages {
> >>>   */
> >>>  struct imx_dsp_rproc {
> >>>     struct regmap                           *regmap;
> >>> +   struct reset_control                    *reset;
> >> Maybe rename this to "stall"? There's also the DAP stuff that's actual=
ly used
> >> to reset the core so this might be a bit confusing?
> > So Run/Stall does not actually reset anything? Maybe then it should not
> > be modeled as a reset control. It looks to me like the
> > DAP_PWRCTL[CORERESET] bit in the Audio Processor Debug region would be
> > a much better fit.
>
> Yep, it does not as far as I'm aware. This bit is used to insert stall cy=
cles
> into the accelerator's pipeline. As for the DAP bit: agreed.
>
> (Daniel pls feel free to correct me if I got something wrong here)
>
> For a bit of context here:
>
> Previous approach used a syscon to manage the Run/Stall bit (see [1], "fs=
l,dsp-ctrl"
> property). The main issue with that is that syscon doesn't enforce any de=
vice dependency
> (e.g: PM) and you do need the AUDIOMIX power domain to be powered on befo=
re accessing
> the registers from said syscon.
>
> Now, AUDIO_BLK_CTRL offers multiple DSP-related configuration bits (Run/S=
tall bit included).
> If we ever decide we want to access those bits we can't model them as res=
et controllers as it
> makes no sense whatsoever. As such, I think that modelling Run/Stall as a=
 reset controller is
> just an arguably unneeded and inaccurate (assuming reset controllers are =
supposed
> to model only actual reset signals) solution.
>
> IMO, unless someone can think of a scenario in which this would break, we=
 should just cut our
> losses and go back to the syscon-based approach. The DSP is already attac=
hed to the AUDIOMIX
> power domain so it should be on when attempting to access its registers. =
Also, the DSP
> should be the only device wanting to configure the DSP-related AUDIO_BLK_=
CTRL bits anyways?
>
> What are your thoughts on this?

Thanks Laurentiu. Your summary is spot on.

Controlling DSP is done via two memory areas:
 (1) Audiomix area for Run/Stall bits
 (2) Debug Acces Port (DAP)  area for software reset

We need to model this in our drivers and we need both of the areas.

For (1) the DSP node needs somehow to refer to audiomix dt node and our
initial choice was to use a syscon binding to Audiomix. This got us a NACK
from Frank  and  Krzysztof as we naturally should always bring syscon in
discussion if we can model the behavior using an existing system like reset
for example.

Modelling the Run/Stall bits as a reset controller is a little bit in
the grey area
but Frank Li made some valid points in the patch 2/8 of the series.

Daniel.

