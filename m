Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6071ACA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0CTjS7yFkhDUw+iDXIDuiAzpBXHh0hjcv/EEJ3JGDs=; b=RQUt6XeJ/kfJxi42s0pvWDZ9TV
	gJaFknvojM2j3mIHjtn/VWdINPPyYHb5Cg6l4Ye3BT+GUo7hn1erhOm26kl8mQb9/LFKGCRjnw+tB
	zoQGhn/ohALoHOkjwfZwTprG/uW8AiZ1Wpr9+MHjiVdtbKYn5iZzMHxEmAji+AXUGWyARBHem0KzJ
	U3PtZVIsN0/DTL2FLpg3tPPAfcsS7cfdraxjCrh2Ugs2BzBsLevhRKsoy0XXbPHuscUONSS7fcjCp
	pi3jgEw6vIXDDfOkEYbdv9o3+fKfQaeo3gmHvMGeBHVV+ohHsPPqVfqU8iKsn6nDoc3zweFpJF442
	LDeTcBEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOKT-00000002Bny-38Ni;
	Tue, 29 Sep 2026 03:16:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOKR-00000002BnH-0IGY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:16:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 83C0960008;
	Tue, 29 Sep 2026 03:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA431F00899;
	Tue, 29 Sep 2026 03:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651786;
	bh=F0CTjS7yFkhDUw+iDXIDuiAzpBXHh0hjcv/EEJ3JGDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oA8CL9vq/wIWnCIlahYuBGTm+51jH6ASoouihS9wSoZq2Xk4mab7ftGB1fRA7AWmX
	 FpzbT82Yc7snvxzrcs9dwCBTGzU1KduOEYcGr3hkSXr2ncJAJvf7g9M+GGgE9ogYSo
	 ymzeZD+9kHufCIlWrOw9EKhbErjRKzugXNxDCCzpSVc0T3w2ZCqf/TfxyC+V4to9TF
	 x0a1NsBJG4ehwvCX+ulpkj+/i/yh5bs8LXoCUs6vRQnsTB6mCLk1u+mEPbg2QXNLqU
	 1yDxGn4JTCiWs+KB9F9C6/k4EkOomoBK4fD0ruW3TbcmQXqgb7xOK9hfX4W6g9oFBf
	 6+6EjV1TPeGgQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Suresh Vankadara <quic_svankada@quicinc.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/5] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Mon, 28 Sep 2026 22:15:14 -0500
Message-ID: <179065170904.2673486.17917322298927031673.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
References: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Wed, 23 Sep 2026 10:27:27 +0530, Nihal Kumar Gupta wrote:
> Shikra EVK is based on the Qualcomm Shikra SoC.
> It lacks a camera sensor in its default configuration.
> This series adds CAMSS driver support, CCI definitions and enables
> the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.
> 
> We have tested IMX577 Sensor on CCI1 with following commands:
> - media-ctl --reset
> - media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> - media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> - media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: shikra: Add CAMSS node for Shikra
      commit: f1e325d194fb0d719d848a42ec522e0f70250e44
[2/5] arm64: dts: qcom: shikra: Add CCI definitions for Shikra
      commit: 7a3fcdb8d28fa5f162003b4f28f0160c82ee62af
[3/5] arm64: dts: qcom: shikra: Add mclks pin configuration for Shikra
      commit: e1f5d59e0eca23e2e69353f769bfaa187ad94ab8
[4/5] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
      commit: 9cd1efbde98772e08a79a7b5d655cae60b38264e
[5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay for Shikra
      commit: a4be00ccf9e0bdcfd407397368e0599c559d90be

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

