Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E936ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 02:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiOd0XzAn1FM61r0kM/cs9yS59gZHmDbNmnaFYT6kPU=; b=DDHFaM653Joa248MK2MsosAiYq
	wfpNxK2/CFs5vGqwCN+PDHsj1m64sR00l5J0Wn9C5lIYIQhC6RkIh4qyGC/wjJz7qJe3C1O14w9+3
	Eq9gQO61xGa8D2mwRafs6dcyMEusjFPKgm9bxOsUxTdvl+ce7piNV27flQff8Z/tQEaSw867MCPxL
	eNu6SnfSuunAtJJxLkh6pNO6JpwbjxYVUsuPnkfSmn4dn9/DgE7NHeSr4AuQ98QjC+TfdfIGeJdfq
	L/qIxp3u9DupEO9kRR9SfP7u9VdlVuhv2pcODKl1FAdBRH4/AYCu3z//cRI5smE9leyAlfxiNeleD
	leywxLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq0wU-00000005dhW-2zMA;
	Sun, 24 Aug 2025 02:58:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq0tn-00000005dJK-2yy8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 02:56:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B077402BB;
	Sun, 24 Aug 2025 02:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AD6C4CEE7;
	Sun, 24 Aug 2025 02:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004160;
	bh=+OE4zk2QOOZCHgX82O6BSFFjtdDPcgXJ/GXAHDpLonY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LnR50E6QfsaE6+wSpYXZysqcrTN9KQ+uP78ptO2NQxUXzvuVhewgxe/RoHsPCj1Sp
	 0TPHDcTpz+Gi5fIOUZFS2d6U04pj2K7nG62H+y3MZ3Do3cxXUFcFUfCa0dCY+JxyPQ
	 pEc569a7+UMwpbFtugTZ3Avhot3Yq1IOAq3PLMe6ztbrUbodgT1sT9dFiEnawpcw0X
	 zKsTHT8dNv8kZfBwhvNf18xNaDnEs4qFV7ZGrq1QMtY/NKv6aT0hIWDSpCAaATdEnW
	 e7Zc+yEHilL1pDTvx8Gnble7gd712hzuqq5IZ33VC/WcogO5syktkLFKpCnRJyiDVy
	 3QVTZ+mKw9CYg==
From: Bjorn Andersson <andersson@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] Support for Adreno X1-45 GPU
Date: Sat, 23 Aug 2025 21:55:33 -0500
Message-ID: <175600415279.952266.17398839743993518772.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_195603_772995_14D0C3E7 
X-CRM114-Status: UNSURE (   8.31  )
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


On Mon, 23 Jun 2025 19:42:05 +0530, Akhil P Oommen wrote:
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
> 
> Tested Glmark & Vkmark on Debian Gnome desktop.
> 
> [...]

Applied, thanks!

[2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
      commit: cf0ed173d27a2a832642aa441eb28a4dca53fd19

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

