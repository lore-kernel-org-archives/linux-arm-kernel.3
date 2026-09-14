Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C92C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OZJc4pE75EzQY4TF0i25vLvB8iiwVxxIUeR10SzMyg=; b=SEQ2yF03vvIFMj8U+u0C9OkIMy
	HSumMrGVjTXI9lmKxyq1mtJ3dlgYErJPA/2IqANVNpnOVMEhYzl3BiKHT9KUgH9r9+JpX4VK3xICd
	OWTuxQsZ9zKNbgpEYd2G47dr3PcE5VD+DeXQ+atWmNDPwPS0TTZYY17AeGU1evVhpEUNxpzRfCJaI
	PIM8YoDJ31tKgf0ZMTYeaSqc4rTe3CJCVbjYxLIbjCdEEaiDAgqM0pM3yxhO01SnaNa6LL679xi6u
	oT9OHd8UtAblhZM20QFu6iJCXg6oiQVRaRH+qoNN0kUJD6Mvc2Y2NEMCgG5qZj74Eb7v9zTE7myAD
	SilbRhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Y1-00000003V6W-0wu9;
	Mon, 14 Sep 2026 12:12:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Y0-00000003V6Q-3ZAE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:12:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51310601E4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 12:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B75D1F0089F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 12:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387952;
	bh=2OZJc4pE75EzQY4TF0i25vLvB8iiwVxxIUeR10SzMyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bw2nOGPjucfG7nhjRzYodb3iK4DV8+USHY06ZbAUWNQk/2XDQFpyxnuKDAXZCfU+i
	 EP5EbUlHuYNOou+YJLAMnFILQzAgHclGwLbJsRck+i3l9djbcp/agUAwq3AxEZNJcN
	 rMpgNvw8dgIXF9lLAJ4vF4E4lEJJ0wm8uw4MiyMzO5zyT5SmomV+DXthqJlXiTHahn
	 D+Fb6IC/sm84hD/GtdVi4vxA3X551CeqTVC9frkqWXdRex9VavFP7bpnqTr2XhbIbz
	 XMlgyk9QHzwHCyAsAWAPlTMCmvbCmeYrUTVsRAXajHarneswJ179cphFT3O4STlU4T
	 92kU020jTGOAQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1651bso1566823e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 05:12:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByg31Cn4T9pg5zagDGNDSu5SSHNhWC3c6450wfrgDYVxW81ySlLo7BnsQFMoRCqOiiFSjVoqFAjcthbueGJA2hS@lists.infradead.org
X-Gm-Message-State: AFuF++mzFRg+iBm31cMOypV48gLsGXCqVdv0ugfWVHlvxnjkcT1Xm/D+
	ylHUdHS80+mvrzC1GoSAZhYVodFRAKxcPGR6MZKQoczOSTBPZ5DvH10mkLusuGhtSMcec0x9IbI
	RP9xBrHVv//GB92rVbavqzBDrZ2wSze0=
X-Received: by 2002:a05:6512:3b25:b0:5b6:4ae:3ff3 with SMTP id
 2adb3069b0e04-5b8ae68dcf4mr642559e87.27.1789387950724; Mon, 14 Sep 2026
 05:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260830084104.14968-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260830084104.14968-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 14:12:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLneoGy4q-ihKWVhW3iyH2YEATeGf76RB9NiDLk3-OW1iw@mail.gmail.com>
X-Gm-Features: AcwNN1V856sA9k7HWfZhF0PQNVfwgYy4TkqwdpzU71qB7kL_qOjvZ23sMHNDQ8M
Message-ID: <CAD++jLneoGy4q-ihKWVhW3iyH2YEATeGf76RB9NiDLk3-OW1iw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: fsl: Replace tabs with spaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Jesse Taube <Mr.Bossman075@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Aug 30, 2026 at 10:41=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> YAML files do not use tabs, even within the values in DTS.  No
> functional change, although dt-style-check will warn about it
> ("[tab-in-yaml] tab character not allowed in DTS example").
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Pulled out v1 and applied this v2 instead.

Yours,
Linus Walleij

