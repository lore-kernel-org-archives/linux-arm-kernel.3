Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C31C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 08:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3J6gYorDtO7mNp6Qmg57Ase80b6wKmggy4kn3B0XUVM=; b=k2f4ix9LD9fHMXY7Pnm1oBOjNT
	viZIbbqfyo0i+IzWnnemoP9Np/mmyErotSFE1r/p4k4RN4qWdwjjJpFq92JXxBmm8bDLncO8cxcpV
	eiBT0zbe8Qsrt9rOkXRwjUb6SffavtGGk8GGKlUBZEB4lH57gi1WwFAciq+qAYa+e3Hc4JWU6cy34
	SxUWmiRxfNITrBC4YnF6nkBDwbYi0CtTTbee/QRTcjIasWRmiHPUIToH0vE0/KI2Fjq36wXJjBrf9
	hgLNoSs3YTjcJyRKIPKK5/PO7Qwrob9keztyt7n73mn63CY0hKfUQZQnt6ehrfHUN6bkgSdt1vbza
	dZNfwWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqVS-00000006h2M-3fAu;
	Thu, 22 Jan 2026 08:57:34 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqVQ-00000006h1z-0Yqa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 08:57:33 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1233b172f02so1097288c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 00:57:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769072251; cv=none;
        d=google.com; s=arc-20240605;
        b=g7uve7eHwQ6D9a0+j0reZNmOMvnYmsZ9nDVjjCyurfA7deLEcWb4Pv7s2fYPb12daT
         Ozj76eY0JMQR5BxiKE46LG30c93bt3URXc5tKSdfBpgKMNEaIzxZLTUc7Lvk9HNcPeFx
         f2LA8I2OexZU/J/UqDscHMM9kUnew6knJffgf1Km6vE/4+AtJGOzGFJMJIXoVbDgXXIg
         ys5bo1naa11oaO8WlezJ86oiHcREeipQI0cMPYiMu/6CoQP31NcbX99InQsS88LZtmYH
         WUJos9gzWtgRgpkSVLQpePtdWMIthjNScCbMTpVPabK1WA+wxfO3xr6ykp2zsA2A9oQB
         NgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3J6gYorDtO7mNp6Qmg57Ase80b6wKmggy4kn3B0XUVM=;
        fh=WIdIqpLs6PefFS502b0mgtZvDlLp514oUztAyVgTXRE=;
        b=I0tkaEJIJrplTW0FfXr6h8X28Q0Wbjqdz0CAmOqphZ3qzAcNBj0SUeUKhzIdOen46t
         RGBBEK+pt5xdg4Bhv7I7WCw2WTDpQ0GwFiTohBMrlkm3Lbue2ILeWquQMCHc3cCFBTDD
         q9SDYNc23d90pz9epWoiu9vMDVvmhoCfXK9jzOlJWCVldFTWv7UhiRo9ryPu/OMX+Ixb
         QoxlgC4U5ez4VMuql68m969Ia9LeasZJ9YDSNyMwFW/AXIYKoPUnZum8Q4wBDzXFUqqR
         +0HX1eFAXFWYq5kg8Vbcj/QCFbvH2dFv6von12hr3W0neNhJ+rFN6H02iQSmZ3lPu+ad
         rrJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769072251; x=1769677051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3J6gYorDtO7mNp6Qmg57Ase80b6wKmggy4kn3B0XUVM=;
        b=ZiuG7F6PP7GVuyK2dTmtQYD1GkR0O8/8hKW2X2+wJ0qUQV6Num6MrLsIEM1tX9AKAF
         LLJrCGQ74DiaqCk6yWPTvshmRS66lgLs9JahVWhTV/fsYORiK+MqVv+ze4Alz5Y4YinU
         EziwT1B5pB6qB0NllMw69LCkmpM7ts6O743BP7Jzx4Kkyj70AtCjisgwrwBrMIgvZ8qK
         bBlvBBWEWGMoxfIjCkep5ut6uYddQRbN6IVkW26OFIq0b5V8/pg+jXzxutTvSjdik593
         VJGvVleHmJRjQIchRJEpjbaXfKKeAjcNsIVrJ6fpxfAn1ikLCM0ipo3uhjLXU0OI5zjA
         IovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769072251; x=1769677051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3J6gYorDtO7mNp6Qmg57Ase80b6wKmggy4kn3B0XUVM=;
        b=DskKTlx9fGKNa6q59GujJpUEhmg8d+ylC1qzL68ETM2ydz/QqUNwOpVjkOtqo8FkWR
         nttSrhJMsU/9m7+hukpk3h7CAZ80O4zNURWBa2z18KFf1VPfy5ZTKA6WYjbTqM08kyEO
         sQdGea652iYw5EHogDHxrf3m+Zkvgqfb4pDhxbncB9YW7iF7tcehau2sdIMzRMEethES
         oNbSSfQZpXB4jwjWVIJcvvokDEURvQ9lYgrZYxz7olkAR9QrDymR6cXkEF1Vm0xmDr+k
         xBQbefjuQAW+BUgFH77Xkctv9EjjJy5+nc+OUBQ0Fg6ZsFB/Jpc6ai3kVwkYgMkeuF8K
         4Mgw==
X-Forwarded-Encrypted: i=1; AJvYcCXDO+H3BBq0p2XJw1h89FdKCHRSENSxWnvJWppEh01mvLTOzuELPGth1W4H35cV4myeCEqOtEwrF1O6zhKssAxQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5cxgnwT6HFVmolRl/pSZQWZ9+rDd2jNn2+tfRIbbWIn+UrD6t
	s4vwSHKxjeOaMT8tvSvqNVTBPh18oCkJCjeO/pMxEt1f6GTnP1R1nlvCLpl8GO2QUxhac4lMutU
	7oveX75ZCGducO4Ejzpa7rsmshwH/3Wk=
X-Gm-Gg: AZuq6aKrx+e+6G/zxxgY/JHPmGlpi2dMglrXPuO7q5GNE15nQT0HlFk17pTrA4CuYjQ
	RrvFIb9ZUGiXhIcFBriDn/TGPt6vPZ7yTgeSqiKWecA0kahmoesIxbSryGzur8TmQcgyczcMIkv
	s19W/QMxttRlH5JcsidivC6Agrhykxq6xvec9/en8XeYx3PhKhpDGaaUkNRgidmQVV93TjpfAkF
	spwGCgqMQ+lVtb7+fJeeWGdycFoch8xrdkifTD4IPp+BgaNp/jUcV4GPqaVjzp1e+9PHrPHqqBg
	XLkOEw86ygzXXaTbeol3wAofmQcbV5RtDPxmwZU8rx6/3Qhd/ITB1oz4jRilB1bC5N6eQD3wFnp
	mSFZNsexIwA==
X-Received: by 2002:a05:7022:f86:b0:123:3364:2ca8 with SMTP id
 a92af1059eb24-1246aac4ac7mr5540316c88.39.1769072250797; Thu, 22 Jan 2026
 00:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20260120-imx8mm_gpu_power_domain-v2-1-be10fd018108@nxp.com>
In-Reply-To: <20260120-imx8mm_gpu_power_domain-v2-1-be10fd018108@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 22 Jan 2026 11:00:08 +0200
X-Gm-Features: AZwV_QizKXTxpcD509WTM7FJXkGnjUZe72Tjh_1y1VK3GaZGPTzVAx6Yhm6EfFE
Message-ID: <CAEnQRZDo3Y+m3+Pdq3QTaPi0M71NGAc40NxCw0c-GUuAQ5ZRhQ@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to
 wrong adb400 reset
To: Jacky Bai <ping.bai@nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_005732_177566_B9C1F42C 
X-CRM114-Status: GOOD (  12.06  )
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

On Thu, Jan 22, 2026 at 7:54=E2=80=AFAM Jacky Bai <ping.bai@nxp.com> wrote:
>
> On i.MX8MM, the GPUMIX, GPU2D, and GPU3D blocks share a common reset
> domain. Due to this hardware limitation, powering off/on GPU2D or GPU3D
> also triggers a reset of the GPUMIX domain, including its ADB400 port.
> However, The ADB400 interface must always be placed into power=E2=80=91do=
wn
> before being reset.
>
> Currently the GPUMIX and GPU2D/3D power domains rely on runtime PM to
> handle dependency ordering. In some corner cases, the GPUMIX power=E2=80=
=91off
> sequence is skipped, leaving the ADB400 port active when GPU2D/3D resets.
> This causes the GPUMIX ADB400 port to be reset while still active,
> leading to unpredictable bus behavior and GPU hangs.
>
> To avoid this, refine the power=E2=80=91domain control logic so that the =
GPUMIX
> ADB400 port is explicitly powered down and powered up as part of the GPU
> power=E2=80=91domain on/off sequence. This ensures proper ordering and pr=
events
> incorrect ADB400 resets.
>
> Suggested by: Lucas Stach <l.stach@pengutronix.de>

Correct tag here is:

Suggested-by: Lucas Stach <l.stach@pengutronix.de>

Also, no need for a new line between tags.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

