Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005DDCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 23:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ng115hWZ2LMwKhDc1Httr+OsIIIboQhXGl5/aPDAQoQ=; b=wMuRLkoWUR9jz1nx5SctnsSgqF
	5arDUBGsw91qvC8GUe2ZO407cOUue39bBaBOq34gCkoLJhr87XWfibN17cZBziB5Mp3/ziu7s41zB
	UYyItus77PjhmiMUCFGrUpc/XUO4E6v8y90Av8eNWL2sUS6Rkh3iHxOGsu0ACtveW1/s7nnIrX4Ud
	Ckxx7ay2XREOfcO25RksEX7oMJdJwVF1AViM7urVfw+flT2GGSlIZUlfAfSugIWfVxFViWYGyxJ5n
	a2cXCVvQoY/B0TRkxdDecFV2MdL+GWx/P5IiY+8DbDxtrXfjBX9DSVT4OSCeAgm2CAtKg6jNTkpNy
	6F257CSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC3mf-00000007S42-1jij;
	Wed, 30 Sep 2026 23:32:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC3md-00000007S3V-3yUo;
	Wed, 30 Sep 2026 23:32:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AF8440D96;
	Wed, 30 Sep 2026 23:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C3C1F000FF;
	Wed, 30 Sep 2026 23:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790811139;
	bh=ng115hWZ2LMwKhDc1Httr+OsIIIboQhXGl5/aPDAQoQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YKzKQScVQVhjWvsISsBvvd+RZk8usvWcSOdVDF+hEZmkCSypcdgnfyxLAOWFWnGUi
	 QQEtlC7xApH7XqyAoqUafqECurZATIh9SGxK2FQ0WsjPQgbReJZlKuzNRlqWqi4EPw
	 8SPR0Dl+eXnngN0zEKgnmlMMy3a9TkzwfiLB0VmPHYpMR3k8e0iCbwYDWCIiRllFh5
	 vOckl23hCF9F09n+LN0KGaC+Y1drrkXrkVoBItWgbdX7P/CqiN3H9WihVWBbDes6E5
	 hmQ9VdXbGtwO/GBtB/pNrkR78Ld9LQx9p6P8JW2bgZbSZTLc3hZldUygvFbZw/h2IT
	 rp0CwiCFJHtvw==
Date: Wed, 30 Sep 2026 16:32:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Radu Rendec <radu@rendec.net>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v15 3/9] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
Message-ID: <20260930163217.4003d232@kernel.org>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-3-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
	<20260923-qcom-sa8255p-emac-v15-3-e82f33720737@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 23 Sep 2026 17:14:37 +0200 Bartosz Golaszewski wrote:
> Implement support for the firmware-managed SGMII/SerDes PHY present on
> Qualcomm platforms. Do this as a separate driver from the HLOS-managed
> variant as they don't share almost any code.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/Kconfig                   |  10 +++
>  drivers/phy/qualcomm/Makefile                  |   1 +
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 117 +++++++++++++++++++++++++
>  3 files changed, 128 insertions(+)

Hmm, why is this here? is there a hard dependency?
Otherwise it'd be better to send it separately out to Vinod,
this is drivers/phy after all.

