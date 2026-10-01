Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AC1CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/ClGyojAdsXGc/BQReGBNWEln4ElamcBkeTBZDQp5g=; b=D9RniL696lplkntoQb1Xpm5JSV
	Tiwz/dCiMa8hiesphg5LYC9S92Wm95GOQ+1QHKvaP7PbRxfoKXsyTfdZZx0LAvFbMd5k+1N42zUIG
	mpbatInWW1wcdSzeylShw/kS9rhhSUPq3HecyXZlxb2ELyvsFWV3nlbMCAzFz/RAPLRorT1x1rgxp
	/m+YLL0rzfN+nzgZofGLmp56GdR6ym+3nwhLAuBXjLaVmDbMSrRrZPHU8KwbgA3JZOoXgVqxS2twz
	B8Q3jQv2m0pKEO3vxlLi2ZnzonGBUtKL1rEU9ONygyNr0Nl/x2gZvT7MH7E7v1D1SY++vZZ33dwtA
	xJDavdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBIO-000000080XW-1upf;
	Thu, 01 Oct 2026 07:33:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBIM-000000080Wq-3uWB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:33:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AC154477E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610751F00900
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790840014;
	bh=6/ClGyojAdsXGc/BQReGBNWEln4ElamcBkeTBZDQp5g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=QTZR654gJuawsV8WQZ4S2cC9ejU9u172RDHPIMUmSJPwuBAhJguLbYrAKBO3SfVlZ
	 sm74izZzPBFgtQhlIPjpVxWhVJCKuN/R2lfulXvfbJl2xU1LNeBY0FjcBWTs1WZQ1J
	 rj4XeWHTMG6PM1/8VznK7/Hi2znJdpa43ADDo1Jps9FRbWuOwp8HjUXVk+e4pHkduJ
	 17TI3DWeiSk4R1y6gYZMjzCpZWeuGhKEQz5rWDvEc0OytmT3RN5urWPWZhdiqgwHH+
	 BRfQQkN6gNDz35un6zsZd4eKnJZbsNV4ZM0dRbKTIYEufYBw4TgZbNBrbgSisY6ywf
	 3hO6xBRepmygQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e986b8b1so6318718e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:33:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwmXAVCzypg81ilGCC8qwkmKYNgjm5ZyL/1Hn0vCbKJadTbTEu4phdkWlmZczNbRRo8rr8AW+pOZ7/nG2bSQa7K@lists.infradead.org
X-Gm-Message-State: AFq9FYJAYvva0Gl6aqATIOJhyH5d+2EalXYaX8/53xvR82jzk839GWId
	aEL4APfi37CJwZJg3Jtodd5qEzF3OXFOzD9Vis8wLdjAheCdr7ISJD0xkxOGLRDft5Q0MqO2xt8
	UNZD2/WDj6sYUrZ6IlLCPLtrpiEESswC5q0mtojHXpg==
X-Received: by 2002:a05:6512:2115:b0:5b8:f4ad:6e49 with SMTP id
 2adb3069b0e04-5ba402b86b1mr998420e87.8.1790840013059; Thu, 01 Oct 2026
 00:33:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:33:32 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:33:32 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260930163217.4003d232@kernel.org>
MIME-Version: 1.0
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
 <20260923-qcom-sa8255p-emac-v15-3-e82f33720737@oss.qualcomm.com> <20260930163217.4003d232@kernel.org>
Date: Thu, 1 Oct 2026 10:33:32 +0300
X-Gmail-Original-Message-ID: <CAMRc=MfEHHny4x8pi-M-WqvcTxFY+98TvRa1jFTKQBjYCzy8FQ@mail.gmail.com>
X-Gm-Features: AclHuK_lOavdmNlSvx0sNUPmny1qPtgCYs4QE7hryCERWbwB8_l7zIoUuzlYZiM
Message-ID: <CAMRc=MfEHHny4x8pi-M-WqvcTxFY+98TvRa1jFTKQBjYCzy8FQ@mail.gmail.com>
Subject: Re: [PATCH net-next v15 3/9] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Christophe Roullier <christophe.roullier@foss.st.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 1 Oct 2026 01:32:17 +0200, Jakub Kicinski <kuba@kernel.org> said:
> On Wed, 23 Sep 2026 17:14:37 +0200 Bartosz Golaszewski wrote:
>> Implement support for the firmware-managed SGMII/SerDes PHY present on
>> Qualcomm platforms. Do this as a separate driver from the HLOS-managed
>> variant as they don't share almost any code.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/Kconfig                   |  10 +++
>>  drivers/phy/qualcomm/Makefile                  |   1 +
>>  drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 117 +++++++++++++++++++++++++
>>  3 files changed, 128 insertions(+)
>
> Hmm, why is this here? is there a hard dependency?
> Otherwise it'd be better to send it separately out to Vinod,
> this is drivers/phy after all.
>

Heh, it's always the same question of whether to split larger series into
per-subsystem threads or keep them together in order to provide the full
picture and let maintainers pick up subsets of patches. I've been yelled at
for doing both in the past. :)

Ok, I'll split the next iteration into smaller chunks.

Bart

