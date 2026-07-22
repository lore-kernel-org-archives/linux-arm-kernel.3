Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6EBC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYJOxwafJl8OVO7ncar+6PV1o72DMzw1345lwAkie64=; b=Rr4Aw1zQIFyf60GcQiTpu01L/I
	9m2gSSZ2InZ6p82enJuqtt5mf6s4eEDUJCjJWqiIh48qBXX9FlGflRPosfrkiy7H5LqRrBtI98pFK
	jVcfLUh6E+oGn/E7qr9R481RRMParZQTwHmZnYoT1Pa8LOxK8Ynba1cET+B6+LMOFxMF+nSGh3tIP
	F6Em9wQ1H//+WKaKQqs+23tCJPH4k16xgk1oxnpdBTZrIXxPCoO74yh2oVCfsjove7eRjN0dsF4Mk
	PKSxzl86N4IGfzWpT6z699c5bGWX3AMz1U+YOwm2lp26Qn2k3rYY6PLm5+LlJcaPHviVsCyh/KAM9
	IO6nk/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmefZ-0000000CpMi-25O7;
	Wed, 22 Jul 2026 21:40:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmefY-0000000CpLX-07Xb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:40:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A3A6600DA;
	Wed, 22 Jul 2026 21:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB331F000E9;
	Wed, 22 Jul 2026 21:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756398;
	bh=eYJOxwafJl8OVO7ncar+6PV1o72DMzw1345lwAkie64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g2T0ggEP+OzKgwGT1ua3fLRCEfsJHCUoE8FKfLu3rnKwkTwl4OJh4SY5bVUZGP20Z
	 ycu63WdemDnA4UHLqyRNyMJ7QDhBuZsNWPVsTb5RReFpLEwdiW5x85yqL858gXVBHD
	 2SbD5Qjb2Br81+olXRINqIV5qrw8U8x52zk9Et1epHCO5GDbboegW6SSAUq4cN4dZO
	 aOf9+DV94dTf6HUPM6m20DbTqXqMDK0XrZoli/ySD1i3Oxxx3SSw2+bEGxNRrHwnu5
	 lHLAqWw9fEreSZyWtuDLA+E679GcXpSQNFCmunk2SrLeiQQ7jYSRrW89JP7tv8pLhj
	 7veJ2m+sxh3DQ==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Esteban Urrutia <esteuwu@proton.me>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Add SM8450 MDSS compatible
Date: Wed, 22 Jul 2026 22:39:21 +0100
Message-ID: <178472263086.2852085.5726009348827145429.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260711-sm8450-qol-smmu-v2-1-41a6fba41c3e@proton.me>
References: <20260711-sm8450-qol-smmu-v2-1-41a6fba41c3e@proton.me>
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

On Sat, 11 Jul 2026 23:14:01 -0400, Esteban Urrutia wrote:
> Add the compatible for the MDSS client on the Snapdragon 8 Gen 1 so it can
> be properly configured by the IOMMU driver.
> 
> Otherwise, there is an unhandled context fault, because the framebuffer is
> already configured in UEFI.
> 
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Add SM8450 MDSS compatible
      https://git.kernel.org/iommu/c/d149c8b2c014

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

