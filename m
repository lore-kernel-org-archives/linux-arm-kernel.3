Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21F8CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 22:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRkL6rI56VizezYwLeWm0zrgjPeBK553qzrGBGrNUbM=; b=OysRdZ/TghwOLVn0oekSDA2yse
	Tq9CIL7+Eoxh7ykODNhAJZ5t+tPFNLxGCH19Ck/39OYuxj69xOSmv/Y29+Olrq9QdrIFgf95pqJCl
	iPhFvNww+Y1jbFlXh44S53laBr5tv7HakKruitpFfMv5TuApiohnwUyAwYO+rLBBHlomZ4EW3svom
	SBXfWqECmSClzJnZjOVGUTHRTH9E+DwZbj0IPw4Y9UQwzAHUGJ0NWJw+4nIKbKJ3ZrXkUWQ12NpqP
	OotJWN0xheRRiwZNRtR39m5R+5ibcH0XHFM44vgRJskN/H1SQBhmW+M1Asgvr/FN3k/WkR4KefKwh
	q5cH9LlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulx4a-0000000C7Xx-2rVa;
	Tue, 12 Aug 2025 22:02:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwz2-0000000C6Ha-3MXx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 21:56:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10D0B45962;
	Tue, 12 Aug 2025 21:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C98C4CEFA;
	Tue, 12 Aug 2025 21:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755035798;
	bh=VgXxxA2NG8Ilx12xVQPJsG3ZIK+2Y0VaQVCI/PW05JA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a/X2ApBGlWSt/wUjFLkE827HNM4kEH6sJT6jzf2+DbfQ6oM3dy0rXjqWVZUksM7lS
	 lh2oEmxSJT8p6yFq3g+yzPeIZTJY/qQfi5bgFuKBM8M6LBQ+WDlnIfkxYtwidI+Cle
	 Wcp3c9X+zRTVNvpZjBpBphLwvAlyZp9glAMT+HEaqVMceQ2iDSr8dCd8NqwYcVPYIY
	 WvDSR+T9HmeDaMmftRvDHlpr7GYWU5BHDkL0oDp0K51zYT8ntpzHCGfHZJn7cMZ9+H
	 jmmj/Htb2u1Rpc6j5bdKG2aqtNVsK2HZ61OKUaEYgXhPkiNAVDDATfZkLpJ53hwvIU
	 Q0pKm2BoOmz5g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: (subset) [PATCH v11 00/10] Add support for videocc, camcc, dispcc and gpucc on Qualcomm QCS615 platform
Date: Tue, 12 Aug 2025 16:56:19 -0500
Message-ID: <175503322859.231048.11811110407884093606.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
References: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_145640_856224_34574E1D 
X-CRM114-Status: GOOD (  10.17  )
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


On Wed, 02 Jul 2025 14:34:20 +0530, Taniya Das wrote:
> Add support for multimedia clock controllers on Qualcomm QCS615 platform.
> Update the defconfig to enable these clock controllers.
> 
> Changes in v11:
> - Add a new reusable helper function to extract PLL_L_VAL, PLL_ALPHA_VAL and
>   PLL_USER_CTL / PLL_VCO_MASK [Dmitry]
> - Add static to fix bot error in gpucc
> - Link to v10: https://lore.kernel.org/r/20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com
> 
> [...]

Applied, thanks!

[10/10] arm64: defconfig: Enable QCS615 clock controllers
        commit: 4e4afd6bb9657d7cf23f6becf23706882b9822c0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

