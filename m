Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A58C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 22:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Js/I4/QcWnb0zbX3gJ/7hcd5ufvSHyxR3nJSzCYliA=; b=BnieEUCOkYhsro4LllGYNoCqB8
	92/lY46pe0oKcVqBSYsx5WStVVRZn90C52wiEvXY0+3u1Afg6Citir5I2pO5e31f+KLez1RJsCjwQ
	6uIq247Mh5JjDRq6L0ZWyF6iHD6E/CRM+3U3SOD2L6ZzIi3IuhkgYEaUrCV6b29y2QM1n/EYk3So8
	MyI4XsnG1aqlMYy/i6IIBky/E91iGKLw+vRn5IUUrVpjaKajnLHie1TLzTz/HJ8CGwiJcdnS0puHn
	4Wsm5hDtooiyZgVkh5F9gBecrA0eheqppo6c/GVIhrU21dRtznHJLzZJm1T2ZJwEtDWRkMjLG8qBe
	z5cGyDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOeU-0000000HKC6-1X42;
	Fri, 24 Jul 2026 22:45:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOeS-0000000HKBl-3w2X;
	Fri, 24 Jul 2026 22:45:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C502A600AD;
	Fri, 24 Jul 2026 22:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7801F000E9;
	Fri, 24 Jul 2026 22:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784933155;
	bh=+Js/I4/QcWnb0zbX3gJ/7hcd5ufvSHyxR3nJSzCYliA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ezEc5WAtQmjF1QNZEepG+PeGNUSM1i0ETfgxrcmRp2dFbxVSIBg5Ug2rt2jfXSA/J
	 /BJ8Q7Q8fJGb/Fy06yCqKiRQD6fukqeCaNl+KEz+xTWvMe74o/PDAZ1cOPXC2klD1l
	 CdT2J1YMHvMXMZovWR/n65Im1ZcZLRVhAL52YiF55A8NElc5hGew7qh1bcT/QdhDYC
	 8JConp1P0raofTTt2KatNTEbDBNoUctVg2yhjzeIDngIzInOwIGh7DAleTGovW1TFH
	 VWi+Ae3CHAb/7wh4nSQnZkyyC4s2uq4Zv0pO0d6folIFc8CXTpntfDy+CznQO/i3SV
	 k/19l+KNqw3Jg==
From: Jakub Kicinski <kuba@kernel.org>
To: bartosz.golaszewski@oss.qualcomm.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	vkoul@kernel.org,
	peppe.cavallaro@st.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	shawnguo@kernel.org,
	festevam@gmail.com,
	jan.petrous@oss.nxp.com,
	s32@nxp.com,
	mohd.anwar@oss.qualcomm.com,
	romain.gantois@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mripard@kernel.org,
	christophe.roullier@foss.st.com,
	brgl@kernel.org,
	radu@rendec.net,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	dfustini@tenstorrent.com,
	linux-sunxi@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mips@vger.kernel.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	bartosz.golaszewski@linaro.org
Subject: Re: [PATCH net-next v13 02/10] dt-bindings: phy: document the serdes PHY on sa8255p
Date: Fri, 24 Jul 2026 15:45:48 -0700
Message-ID: <20260724224548.1648931-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-2-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-2-119f8699ef8e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
dt-bindings: phy: document the serdes PHY on sa8255p

This patch adds a YAML binding describing the SGMII/SerDes PHY present on
Qualcomm sa8255p platforms, where the same hardware as on sa8775p rev3 is
managed by firmware over SCMI.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
> new file mode 100644
> index 000000000000..9e846e381555
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
> @@ -0,0 +1,50 @@

[ ... ]

> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    maxItems: 1

[Low]
This isn't a bug, but would it be worth tightening the power-domain-names
schema to constrain the actual string value, along the lines of:

  power-domain-names:
    items:
      - const: serdes

As written, only the number of entries is constrained and any arbitrary
string would pass validation, whereas the example uses "serdes":

    power-domains = <&scmi7_dvfs 0>;
    power-domain-names = "serdes";

Would matching the example with a const also help keep naming consistent
across DTs using this binding?

[ ... ]
-- 
pw-bot: cr

