Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52501C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 21:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKhiFcIu3U/nZQ+nOoipt2+PvemBJAQMmi+1qUgcv3I=; b=LMCpRxRqZYqhOJLMOsS6XZvZHi
	sb5y+Ged5lBvWx9hWbRs+UriWp7P7xLkyMWSPiheRaaLe522jKP1NhLsP0GSMiXPaz9nUvpHPwawj
	PK+i4eL6YaiOqgpPqH5TF0rTTop31kUCYC3sWExxUvqxx3uwFoAusw/NFSclEOtzehnESufaolRN0
	pLTr/P6kOe6a7m3CeIhadIr69hKLTyZhbFpBmbbvobSu12kGiUqIGUk3K+ddBLVswT2BZkJf+6C8l
	vVNs75ZEeWWzBl2ofstxplOErJjt6Q5bmg0qYR1PGXWnL3CJmjteXoNUagufOskxCB5lJmoCT4VwK
	dljX1H8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1slS-0000000Fxpq-2UxW;
	Wed, 02 Sep 2026 21:45:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1slQ-0000000Fxoe-3xoB;
	Wed, 02 Sep 2026 21:45:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5098040A75;
	Wed,  2 Sep 2026 21:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FCB1F000E9;
	Wed,  2 Sep 2026 21:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788385500;
	bh=DKhiFcIu3U/nZQ+nOoipt2+PvemBJAQMmi+1qUgcv3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EaMxLwFqGWrC61tK2jVCoTo4fmzbjPJ0grEnLR4xmMDsp4pR95EcPG901+WWB721J
	 W6YyUYdNHj5kLffFOCRgKF6/wYav0tQ/SVv545TBl5XhaUbU02YneiWITBq9vXWQW9
	 vrCUoPkbhSOFpyQ0wV9rjVRroCqpQBxZEzC/FAOM9AMdAUAmMXbE1FS5knZo6wntu7
	 yMEkcMzNI0hUEFYECLJHWDwbMo1nU5z4OPTxYzUe/GkJzdhXFZJ0b+lVvrD9WB+49d
	 QH54fEhLSKAVf/TnA3RRNifjClCsXAryA4AQYvlSfheBSr0G3C38otP/hhTg2X7E25
	 72HODp6ZUu4Nw==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Wed,  2 Sep 2026 16:44:46 -0500
Message-ID: <178838546724.167607.3784743895923860900.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
References: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
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


On Wed, 15 Jul 2026 09:16:13 +0800, Jie Gan wrote:
> This series adds the CoreSight debug and trace subsystem for the
> Qualcomm Shikra SoC.
> 
> The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
> Trace Control Unit). The CTCU on Shikra shares the same configuration as
> the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
> "qcom,sa8775p-ctcu" compatible.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: shikra: Add coresight nodes
      commit: eed738c6dd0ca67e8e0ed0e18c97e4665078867b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

