Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA90C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 20:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49Ald9KJwatu8KbCg55GF4r1JrPt/AXEue5I5Kqlbx4=; b=gl16m9zWgGM6X3vRukPQqqiZGV
	2gxjN+tvGGZBo6ip1PP/sDBxW4kxtvp6Hk0J/Mb85NhOsimSK/cyndw+kIbWZQnBiQvfF1T1j7XY7
	duTXgFI4+IKn0tB2f0ToEdctJplZxdqeK7EVSEDRHMKqr6kIhwsoQOhp6teKqCFx++Xcc8Jrkax71
	It9zg8HZdX8YXJVpvfCOOIA4qDDA9HQf5nbIv6tOORP4xlW2yjSo5sFM9Mk3b4tCnlyixY8cnCCzu
	SF8m+BLrkrp/WHPPNQyCxWLC976ccQT4SV4b9aNNvi+YLnwAM9Py1O0MTdyuog95ves8tl05SWPyr
	OUUIJTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18Vs-0000000ARSa-3lnD;
	Mon, 31 Aug 2026 20:21:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18Vr-0000000ARRr-35FE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 20:21:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 272A34010A;
	Mon, 31 Aug 2026 20:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773541F00A3D;
	Mon, 31 Aug 2026 20:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207711;
	bh=49Ald9KJwatu8KbCg55GF4r1JrPt/AXEue5I5Kqlbx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NZabFlf+JTz1tv9m8SjNdokfX05IXB3NC9MpHW3Jpo6EtZocUsJ7ui+Jvvbjn7V18
	 x6fnpzv3mV4JE9JUd+ragcS+f2TNwNSva555nfr28eZRZD4eBvKtVHqf3a4BKxZmET
	 D2QDoWpLXb8396/+BiCKQL5KnHreWiADM3pzDNSwwWF0Qx9RN13kEnpmkQWnipa7Ll
	 PBlf0+iJRHrrLSc3ZuEvkqLQtViMacR0j8OKfoZ/ygfmpwArYwcMZRvciMIFNJOBbA
	 4VbltGVz4vymOAwl4sN8Bm1o9dVpMZ/ARiAsfwuu3Lm+wjt3txvB0ybeQ/CDe8wTCB
	 cfZOQgGtNipWA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v10 00/10] Add support for Video, Camera, Graphics clock controllers on Eliza
Date: Mon, 31 Aug 2026 15:21:26 -0500
Message-ID: <178820768650.1699313.8829513297811537129.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
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


On Thu, 06 Aug 2026 16:04:05 +0530, Taniya Das wrote:
> Add driver for Eliza SoC camera, graphics and Video clock controllers.
> The camera clock controller supports the cambist clock controller and
> the regular camera clock controller.
> 
> Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
> and MXC rails dependency. Add explicit power-domain voting for Milos
> which are required. Hence extended the Milos camcc & videocc
> documentation bindings for Eliza.
> 
> [...]

Applied, thanks!

[07/10] clk: qcom: videocc: Add video clock controller driver for Eliza
        commit: 223228051cdbdc6c8786b311b431ed162ee2be45
[08/10] clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
        commit: 10089c1832c993a2dcc689f2ddc934440390561f
[09/10] clk: qcom: camcc: Add support for camera clock controller for Eliza
        commit: 115631176f8aba9e281a3599c10f2d51263e057c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

