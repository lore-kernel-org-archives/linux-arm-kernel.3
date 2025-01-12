Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365C3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 14:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89+brYfYqC3xcQN8cw83uBeAvkTGLTPLGSbQMII6Noc=; b=ERo2C4HkakIkLZMhx5TkAgw9O8
	9ywZBWTUdUZ/KScLy7h2WHBqamJOpaMm4agnRPKFyTavBq5c7D2rYhH3ultQszotN6CakIgH/TQ4u
	mtpvL5w98hCzTr2n+3vZRpIAHSbfc2E1CvKj62+41TBNo7M9+mpXb9GnWaK1oG5WPfSm47w5UiBOY
	jKQUmPHf0n34BIEcXuogvrEf0LXW0UZUla4LD8NA766Jo43p6vR6+tTwbJuzNs6pFNU7lNJhX7yBW
	RPkjP1n/dZ0jlIb0RxZcyyOogo8DmWYz/wAmdvHs6MoFXORkgXEbsAITlRadlpCPMspEG+IOIy9lx
	DPyRXSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyYr-00000002pHG-2qDO;
	Sun, 12 Jan 2025 14:03:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyXb-00000002pBo-06PB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 14:02:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9BC11A40A32;
	Sun, 12 Jan 2025 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA06C4CEDF;
	Sun, 12 Jan 2025 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736690529;
	bh=LkIr9/qMHsqCCXEL2skzxvD0LdZzq3jF/JileN/w4jw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zhj19cq008cHmAcc1BbuLxVaBOg+52Dy4VUj4XFLqfkyf7hCic/gU47KrLHhrspu3
	 iwXmmPzW0VXy/MySqRbivBrPkQC/xd/+3C93eC/wA8v7pEzypWtaT8+EBEdxMqooMD
	 s7NeqWgm4oJpdotgRxK6aRIQWc75r87vhxtkN1NxaigS44qXKjPLaeuUvtnWUlzZFU
	 njeMHOVo2Or2Sex1ANK6cumunmYgUl7BnpgyqCRMRjmROvVu7ltvMNN3Gkm36jQcVq
	 3qy6ELfLcK+uAjvt0Z3Ozg1p93Ti0wKAVhR+f9kUnLJ8ZIBNya5TMFWCI6ff9k01Wr
	 Hr7DxHTWut56w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tWyXX-00BM8R-9A;
	Sun, 12 Jan 2025 14:02:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org,
	James Clark <james.clark@linaro.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v10 00/10] kvm/coresight: Support exclude guest and exclude host
Date: Sun, 12 Jan 2025 14:02:02 +0000
Message-Id: <173669046278.1179369.4535548560849309424.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250107113252.260631-1-james.clark@linaro.org>
References: <20250107113252.260631-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, oliver.upton@linux.dev, suzuki.poulose@arm.com, coresight@lists.linaro.org, james.clark@linaro.org, joey.gouly@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mike.leach@linaro.org, alexander.shishkin@linux.intel.com, mark.rutland@arm.com, anshuman.khandual@arm.com, robh@kernel.org, broonie@kernel.org, shiqiliu@hust.edu.cn, james.morse@arm.com, tabba@google.com, rananta@google.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_060211_194913_28E83119 
X-CRM114-Status: GOOD (  13.08  )
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

On Tue, 07 Jan 2025 11:32:37 +0000, James Clark wrote:
> FEAT_TRF is a Coresight feature that allows trace capture to be
> completely filtered at different exception levels, unlike the existing
> TRCVICTLR controls which may still emit target addresses of branches,
> even if the following trace is filtered.
> 
> Without FEAT_TRF, it was possible to start a trace session on a host and
> also collect trace from the guest as TRCVICTLR was never programmed to
> exclude guests (and it could still emit target addresses even if it
> was).
> 
> [...]

Applied to next, thanks!

[05/10] tools: arm64: Update sysreg.h header files
        commit: 38138762faffeb923d9f49efbcc09884f1530786
[06/10] arm64/sysreg/tools: Move TRFCR definitions to sysreg
        commit: c382ee674c8b5005798606267d660cf995218b18
[07/10] coresight: trbe: Remove redundant disable call
        commit: a2b579c41fe9c295804abd167751f9fdc73c7006
[08/10] KVM: arm64: coresight: Give TRBE enabled state to KVM
        commit: a665e3bc88081dd65642d83fc22a1abdb6a901bc
[09/10] KVM: arm64: Support trace filtering for guests
        commit: 054b88391bbe2e470c5484cb91622238314344fb
[10/10] coresight: Pass guest TRFCR value to KVM
        commit: aaf69eff6cdb8613ff1f6a520821f769dc92f969

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



