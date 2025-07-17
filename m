Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8858C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EugVGfjpT5aZcVn3tOsIXI05r1gcEejxN6RL3Ma83Wc=; b=rxZC7Ba4twIsHEp2nw3n7+YdtX
	e4s7xNQE23tJwxohN4nf0qAvMLNF7MEEILTqsYti8oclsdevdKQAQdmkeFK63kQ+9t1uAYvuJopDJ
	ZLyc0xfAye/EDmVF3DRlVYKuCRdkURPDJfeMoIGzo7LnA5YFEG0Ib9kkaaKXuI4+/bIeZefWPno1D
	qNLr+mLR9lznVJWPMEpEr2ztAcwE7PWx+K+Xq6RK9xbRfwnXztPLrgmzvlMzhWJ1EcByIMfATrbFe
	1nZAGI+CZQ4DbtG2EULcGlYFwHH5V5DBQGxJQSdNiRqVjqukLFX3V/wYwfZM0MTfru5XAunklszjY
	PfFoxpMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLkY-00000009pXX-2SB6;
	Thu, 17 Jul 2025 10:22:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLRD-00000009o37-3LIj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Jul 2025 10:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EugVGfjpT5aZcVn3tOsIXI05r1gcEejxN6RL3Ma83Wc=; b=WZNwgsqihnBPVEBpndAjnRc/iQ
	SCHwSJHr98XUM7WgMXTcdXrILze1ti/b5M2TkKDCIEayXz5zYiJA98WpsIGZ2OXC5qlKRACoPF7m6
	I4KqwZaJtvErYWGEh3reZ94ExJzuYIdIjvmtam0NfByEgE80T6apFqLnaKRw0I5gztly9LX/rnyG2
	V0uHRPxv4irxMQocRCQSzmDkFFCPhVMf+xCLzwNBxajxoKD4f43rr79y4um3h1l9rvtujThRt795A
	kdO9iN8m2x82E3BGa6I0bA60ioFa5Yz9yCbRuBJEF/dAQIVLSTbyiJ+XdbQ89oHyR43FJbHqOJvpg
	jlxVXDJA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLRA-0000000AFDv-2wl8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 10:02:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 481A85C0072;
	Thu, 17 Jul 2025 10:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30F6C4CEEB;
	Thu, 17 Jul 2025 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752746516;
	bh=fJQ+2oEx65X73kZYLhyRibH8bNmQTyazpPzrgi/ip1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WsID2V0soseOGU9BAyxuzAMgdU0jAWJjMiXP1mJKtiYoh9vWjY0isSL5b1zJlopj2
	 /ZGr2CYFkjNNJa8Owr+PPRu91CPJJJdHIhhI/EQUTS8C+vGOAAs5OxcO12C8oaCs+w
	 MXuTCMjEB07ZcN3csUeoGU0iy7Hp/HG8Fepv5geMeHVeTpd9mKNMMJtGaTNbN2ETP6
	 Sq4+EBQ5JFu1zUR/vjBknjp7+e14Cr6o2s5kIZeukQc0OdyLCe/837clqpEsFBkfJI
	 nkmWhLZb0KmmZOLa5f7eKB2jRlPpuFdSeuadPLB5u5tw7SmNkqMps96Fh6s8+fUWiL
	 9jGivpbfd2nXw==
From: Will Deacon <will@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Retire SDM845-cheza devboards
Date: Thu, 17 Jul 2025 11:01:30 +0100
Message-Id: <175274460748.247797.878702173890066148.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_110200_996244_BC31ADB6 
X-CRM114-Status: UNSURE (   8.74  )
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

On Wed, 16 Jul 2025 12:16:06 +0200, Konrad Dybcio wrote:
> Cheza was a prototype class of boards, based on the 2017 SDM845 SoC,
> used for bringing up ChromiumOS on Snapdragon platforms.
> 
> Today, almost none are left in existence, and the small amount of
> remaining ones don't get any real use.
> 
> To ease maintenance burden, remove it from the kernel tree.
> 
> [...]

Applied SMMU bindings change to iommu (arm/smmu/bindings), thanks!

[3/4] dt-bindings: arm-smmu: Remove sdm845-cheza specific entry
      https://git.kernel.org/iommu/c/ac1207f516c2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

