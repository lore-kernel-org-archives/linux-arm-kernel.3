Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46875CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2msBzv7WSueld5/KoS1mtRsvHobokM0CCxMsMp1dgo=; b=gUs65B0ej/5JN6oN6PY9lxt1+x
	7+7fw4V+ONjjSqaxMdPD0dgtEost8GmLS+NFXxbZFzab0j7ybUcgflxQl4yJ4PfImiOOYvLiso6g3
	+qiMv61eCusRLvUL/3YusVGi1YK0IOSK1vkpJgYPp4vpED+6BvmVfZDoZICQSKecvxz4HzUiClSR7
	5kmBvwtuRSbcx/OI3GQOAxWQdIr/sm+GOzFACtRLtV5xa2N4WsLQr/oDrtq96SSwFnO3ER+tJFN+8
	uCmqj0F/9N7vmXNIhYbVaC3Qc6yAUH5qZeRVmCAnRIWYIuzHwHyDFJTidQneyOgZuCOQZjGELaAZE
	VESqo47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0ah-0000000GHXP-0BWm;
	Mon, 17 Nov 2025 14:52:27 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0ae-0000000GHWq-1Fo7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:52:25 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-59578e38613so4761719e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 06:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763391141; x=1763995941; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2msBzv7WSueld5/KoS1mtRsvHobokM0CCxMsMp1dgo=;
        b=eoMoNNGOptPUZzTQFr5t6z8MhIKeP8y2yplRofWnVK7Z6x3uFaeCmFbhj1RPLGMQTy
         8G9xyxVpmRiOh7IiFD7hYJbjLiCBLGzH5+urTF3eC3WWAPgvmay2xdGHC/As6TbV0y3/
         Rt5+eLZrFarbFNepmzli6qj+eKu/mUAmLbJcRZfPuaSvqwwoDmJGGXK/Nxb1mN2C3Gps
         VofCMB3qnEsw83gc34yEzRPxAqgQzlQlI4viPooyWWzYJH4PY+Btnh95+4iG5ur9LrIH
         xZm5+4j9yOZUdvS5bQoEa9d5u1lwq2BeaEMwZpDnfte8pdswxiIm3NEpV+Djjlc8XQcs
         wm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391141; x=1763995941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E2msBzv7WSueld5/KoS1mtRsvHobokM0CCxMsMp1dgo=;
        b=Aj+i+EO0yvrxdvdjCuAFCrrfdwdfCCnYNDUT5ntxlpGUsCRFI73xTpFTVNDAwLhLL0
         WB4EpXeJgQ0Na66EBCtYLdtCSTd5RARt7/t2/z1hnEBuOFSyey1HS4++us+EE0q5DWIh
         SDWTosgglzF2PixtFlcOrttgLdvjoOjKayTlLb1mbJpVAq1JDjygfN+9/NpdBW8Nq6UO
         HOaQS9V3PKug8pW36vlCwrA30P0Y5bfrrCn8cgxoCdN+iEVsWfBNFMMc7pRtJq7inGOT
         9XwyB/rKh3P2SY1kuYgsmSmdWgXgWNLfGlJUOsJiMwqds7LCgO6jJ5p0T1z5zr5IH/iN
         RKCg==
X-Forwarded-Encrypted: i=1; AJvYcCUNXF/S69ApFweEBy0AiuplAhWVi3hc9tai9dyFyqw+4aU2mHbctxUBbQ0/FAANB7YJ62uE1Kjp2foOZlwXhiMV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9LuzYBvClVEMwUkNwBOEY7kRjTxdYPUdAP5b5EEI2evvWZ51p
	p3EDhUJICqm/t+HTwcb07W0l5jOSyZv3tXfulmT+xckM4kS+uu3UNwHqjZwm7Q1thnwbKGQxmKM
	djPr8EbO4gpJgxJHyVl4YILs5bPVyuiE=
X-Gm-Gg: ASbGncsX/aPCm/CVPYNZJ35lKHG5zCEPWzJRtUkdUxVQQK/t0Ygs8tP+15XMekB5OuB
	HKqW3TlLvu2514t6eQGBE5vdcSmDyc/NkMx9KX81JkLOJi6rX/h3DqsymZfTrvsgLfHrF2tabri
	xS3dhrRg+mARgxGoYwGAgJCUmuA2U/KphJfKgw8fub4Badbvza8lv4Av8DX2J8g5WpHxMMbq5vl
	OeVRLe9LUT8bb0OHqbrxKX4pF2r8QAI/RS1VN0f8cZs/mxslbiFZchLoKTlPwJdZbL9kzugVY0s
	TH8RvUabMBBpg3AxndevpENXq1U=
X-Google-Smtp-Source: AGHT+IFWM6h2Rvtm8RkhWj2jEpDk8QuIv+uwfqZ7nxdfep6jv5iqz1/m/jBBMwF7isKVulGKioEmeomT4OdX1HrsVJQ=
X-Received: by 2002:a05:6512:1552:10b0:595:909d:1af6 with SMTP id
 2adb3069b0e04-595909d1dcamr1123293e87.28.1763391140693; Mon, 17 Nov 2025
 06:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com> <20251117123643.711968-4-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251117123643.711968-4-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 17 Nov 2025 11:52:09 -0300
X-Gm-Features: AWmQ_bnEYQsdBy2VHM5TVlUlvxtXcSe8WkHYIS9A8Mb6DlSo_EpO1i8bwOVaCQo
Message-ID: <CAOMZO5ByfNSYLAMwxFh4KfwtpPRFiFydQOtB8_avu0un8u9rMw@mail.gmail.com>
Subject: Re: [PATCH 3/8] arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad
 control settings
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>, linux@ew.tq-group.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_065224_379399_6A63B829 
X-CRM114-Status: GOOD (  15.64  )
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

On Mon, Nov 17, 2025 at 9:37=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> As per datasheet of the HDMI protection IC the CEC_IC pin has be

Typo: "has be" --> "has been"

The same typo is present on patch 7.


> configured as open-drain.
>
> Fixes: 418d1d840e42 ("arm64: dts: freescale: add initial device tree for =
TQMa8MPQL with i.MX8MP")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts =
b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> index ff2bacf24bfd2..03b75d4cf699a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> @@ -868,7 +868,7 @@ pinctrl_hdmi: hdmigrp {
>                 fsl,pins =3D <MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL=
 0x400001c2>,
>                            <MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA 0=
x400001c2>,
>                            <MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD     0=
x40000010>,
> -                          <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC     0=
x40000010>;
> +                          <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC     0=
x40000030>;
>         };
>
>         pinctrl_hoggpio2: hoggpio2grp {
> --
> 2.43.0
>

