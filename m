Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C950FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9MuhWphSIf9f9illjEo4uMAH+8TeZFbhm0xQZOz9I0=; b=m+oVM4wUB0EX8amMFLThKwcT6J
	2c5TBR9rScqi2WQZFHili6JvMl6a4lJiO1ek0EdJGd0OrLUsN5WgHBhpkxy9UcxK6eidBpvbGF+NQ
	GSONORMUzYfTzeULEFluQ5Bc704LgWAGlwJzuROcm3xxSZPxSNbrFe3xLGMqYsMYOUpNMDWwINUIE
	gCKT5G/3zCkqutgT2RWkk9AnCKBYeikG/16EQ0WtYydvycAvjO1MF45lS2bkrdwOxWnh5mXiQ1Z/r
	E5BOXOLU6YUo9YhjL1eJYEE6IqbK/yrDb/+/rzKq+lL/S2jVVeYeFiBDtolCnKc8HCl0knmiUs7IF
	uCn8UQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVD3B-00000005lSP-1QEN;
	Tue, 07 Jan 2025 17:07:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCbt-00000005fbV-473P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:39:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46A2F5C2F68;
	Tue,  7 Jan 2025 16:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4391EC4CEE1;
	Tue,  7 Jan 2025 16:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267957;
	bh=dGGq1GOMLGpltwL115aYMu82H56aoheRTxWP/kPyr/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZunkHfJzDOlkGbJq5kZU+VL5TeBxTaCTAWBc1G4iXHRlA0JaPtXsj/mxLDpCW0L3d
	 oxFaxsmRgifC5V0oQdSQRnnOABOoDScprP1YWVozmk2r3o828nb87T7zsYwJBYc74p
	 DmAcgNhlPdHtTXasL4+Npymbxp0V6j+mqqIGxhBQvxwV6qGAYJ5nLFUAF6Bi4svcwS
	 eluaIzzL85K2644+UsTYj1I5CNyZT/JF54dODLy1PTxiW7yDlSYl5r9kPB43P7NmbO
	 d5He9q/v+OV91bJxQdageOLoOGUyIHO/0Y0PxSS+wCGZ0ncSrJyZgXtTU+rCWAhGoh
	 kcyubVx75OEkw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luo Jie <quic_luoj@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	quic_kkumarcs@quicinc.com,
	quic_suruchia@quicinc.com,
	quic_pavir@quicinc.com,
	quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com,
	bartosz.golaszewski@linaro.org,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v8 0/5] Add CMN PLL clock controller driver for IPQ9574
Date: Tue,  7 Jan 2025 10:38:46 -0600
Message-ID: <173626793388.69400.11516262692578602679.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
References: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_083918_058922_4B187184 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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


On Fri, 03 Jan 2025 15:31:33 +0800, Luo Jie wrote:
> The CMN PLL clock controller in Qualcomm IPQ chipsets provides
> the clocks to the networking hardware blocks that are internal
> or external to the SoC, and to the GCC. This driver configures
> the CMN PLL clock controller to enable the output clocks. The
> networking blocks include the internal blocks such as PPE
> (Packet Process Engine) and PCS blocks, and external hardware
> such as Ethernet PHY or switch. The CMN PLL block also outputs
> fixed rate clocks to GCC, such as 24 MHZ as XO clock and 32 KHZ
> as sleep clock supplied to GCC.
> 
> [...]

Applied, thanks!

[2/5] clk: qcom: Add CMN PLL clock controller driver for IPQ SoC
      commit: f81715a4c87c3b75ca2640bb61b6c66506061a64

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

