Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE916C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQer7swYK2oi20wCDErd/JR65aQPpZ5vZcxvbE3I9Pg=; b=W3d2avpFNF3ATB1hg2FM0PZwwP
	HalWCOQHUueR5FJiBkGERA6wBykdtWhrLOloQMu8eOe+7WF6kd8P7iJqZrLThBiXrMxarLJvBB4nF
	F7+o/s+Nij+oZpX2NM6IEwrofsjn0C3DH1yGy6QfK95NZ70L9FZW8itxiUUTf0QtLG0XfogxCvWBu
	kOEp9uwyHFE5kEIv5qfGvIFIN5DV078yHy9Ak942jr1drcmr23Fz2Qc3NNP49yzOdfFzlHK8Vh89H
	gj0QHtLYJH2Ax/HADrDKZFxVsm8+4t9ivAzT7PDgGHeGz1GG5RRIqkd2WGkklV7N0OtBSSPqmeekd
	LEpMQPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGz9n-000000094oF-0Gyt;
	Mon, 19 May 2025 11:59:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGz7j-000000094W2-3JOa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 11:57:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 20AA8A4CB6D;
	Mon, 19 May 2025 11:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20CFC4CEE4;
	Mon, 19 May 2025 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747655858;
	bh=n4TMc1TjZswiMa7WKerU3X857XR5hZINxfXi4bLAwAk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OgBn5VcVyZ8E+hHyTq89VzmkV+ZpyOAx9Uw+PWWpK0W3iuMCBMlvpT4dg/8kKdB4i
	 KhSFRKoxfqQEJmyUBUc22jBAoPKier0+/NYaIJZMcQadFnyKBOY80pVUXpGZvd89fe
	 IT+MxPUg0kJTNOXUFN89cVSC/RnKNlbZP4xjkKfSzc34b+FJx/KRGK+kiymhmkdgFj
	 DnrCqT/JMt0qYmY6/hJ/DNLr9QsB3iRZt33ydGiG3lE/LcuA+hYNUDjAz48oYlB/Wc
	 TIbjlou8TcIBkorw3Lzh8hi+2+Fzp0ovzGE1Is2nXIjTahFzNI1/WIYcBbqC7w79qC
	 QejpcNuHa7KfA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uGz7g-00GDWO-6a;
	Mon, 19 May 2025 12:57:36 +0100
From: Marc Zyngier <maz@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	James Morse <james.morse@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	D Scott Phillips <scott@os.amperecomputing.com>
Subject: Re: [PATCH v4] arm64: errata: Work around AmpereOne's erratum AC04_CPU_23
Date: Mon, 19 May 2025 12:57:33 +0100
Message-Id: <174765584507.3054461.1827773057173102898.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513184514.2678288-1-scott@os.amperecomputing.com>
References: <20250513184514.2678288-1-scott@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, james.clark@linaro.org, james.morse@arm.com, joey.gouly@arm.com, kevin.brodsky@arm.com, broonie@kernel.org, mark.rutland@arm.com, oliver.upton@linux.dev, robh@kernel.org, shameerali.kolothum.thodi@huawei.com, shiqiliu@hust.edu.cn, will@kernel.org, yangyicong@hisilicon.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, scott@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_045739_887271_8EA932DF 
X-CRM114-Status: GOOD (  11.45  )
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

On Tue, 13 May 2025 11:45:14 -0700, D Scott Phillips wrote:
> On AmpereOne AC04, updates to HCR_EL2 can rarely corrupt simultaneous
> translations for data addresses initiated by load/store instructions.
> Only instruction initiated translations are vulnerable, not translations
> from prefetches for example. A DSB before the store to HCR_EL2 is
> sufficient to prevent older instructions from hitting the window for
> corruption, and an ISB after is sufficient to prevent younger
> instructions from hitting the window for corruption.
> 
> [...]

Applied to next, thanks!

[1/1] arm64: errata: Work around AmpereOne's erratum AC04_CPU_23
      commit: fed55f49fad181be9dfb93c06efc4ab2b71a72a9

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



