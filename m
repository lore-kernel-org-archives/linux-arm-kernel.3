Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B346AC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 20:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+04m6eznSyBhbjS0PKGg3bosFYCHCTWpv+ldj+00L1w=; b=01/n2PCeQd+bvfgPY4lYKJFlUC
	L3iz5TfHqgDuZ9SlLKZiK47iubwu4n+I8/s2nP9MjjE46Yp3oxm0Zr6f4UdDNS44BDgjQNkccZieu
	8+lKYklwDd8zOmlSz1PQkqKU9VazPaKZyOmtkdT8LckKPhKD0ei43ja3qn8Ty4OhTa5uFGZdpMusv
	6VmO78fUF22fFvV/EBGTmwsm6tduo24PxvxAuRmmSvtZFK6Rc5qRWOmCWKpiGDwRZL3UeiKu24H8t
	miN2n+djnDgMJHAy7jNtkH5Wne0aVfxuGY/kp17frDlc/talL8Iyk27Y5jdASCKYoGMqN88aC3X1X
	8K75SKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttBHS-0000000FBNt-3JIZ;
	Fri, 14 Mar 2025 20:05:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttBEG-0000000FAeO-3sxX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 20:02:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67DEDA44E4B;
	Fri, 14 Mar 2025 19:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8252C4CEEE;
	Fri, 14 Mar 2025 20:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982519;
	bh=xeyVeLcjMNCPDbXinsEwmjc5sOvb501OOGqXZ4DrlLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QAcceZxPZws3aK4NXKlfdtvQTb1P+QDyu7hew672AlwNZl66Zv2Mo3rYVQRNw4IA7
	 pImp5znWviWIer9ToHBn6hDQ0i2xBgXbz23PhhIAB968CmGkFD4SWJC8nH0mKT0Y3N
	 9W+2D2FgRy6YDqyt8AV9ol7aYbgRER5uh5FKWvxKWujLkyJIihrEgcD1+BZPzZu6Ub
	 MxK4EJdb5D0ep1mlAfrnXEbuqZIywgjcWyM6kq8fX4oEDWux6wlZYSoKU06oErwxOA
	 rf3ajHsPD9QZkj3IvSMGoJxmW6RanJ/TNMyDXZcev9P+vKOWep6CSBJt9iK8sQgJxv
	 HWz9AiZoUhwHw==
From: Bjorn Andersson <andersson@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v6 0/2] Add support for GPU SMMU on QCS8300
Date: Fri, 14 Mar 2025 15:01:12 -0500
Message-ID: <174198247897.1604753.3634981110002933426.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310-b4-branch-gfx-smmu-v6-0-15c60b8abd99@quicinc.com>
References: <20250310-b4-branch-gfx-smmu-v6-0-15c60b8abd99@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_130201_035862_7E47F56B 
X-CRM114-Status: UNSURE (   8.09  )
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


On Mon, 10 Mar 2025 16:48:33 +0530, Pratyush Brahma wrote:
> Enable GPU SMMU function on QCS8300 platform. GPU SMMU is required
> for address translation in GPU device.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: qcs8300: Add device node for gfx_smmu
      commit: 28ef67df3658365b0a8ae6b54c800e70b0216778

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

