Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937DBC982C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 21:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xl4+aD5a2wGfhdlRWHVKDy+ht1ha1pJt3Ne+m8a+hqQ=; b=tSoS/AA/pxECRTU5EMmOvLxPXf
	nyhpv4jOAFlD8JXoHFMbq0DKtIqHAtXaIVG66yfRd89y3YFd39h9GOhfHnplBi70XV6WJNN1V2vpD
	KCzUwrVCFt6gCT8P70jn6Mk46CYcnedbaEcOjTNH6eKmHfC71VDKON16PwDw/d897mbYrQOp5scof
	9639X61UWoK5k2MJ16lVFsZp+3c/xPB6cxzuaYnJlcESGUFZhipVOdxsx02io4qoFj4Xp9cDn/P4c
	7A3zm41QiXhuNgP/hH4p7owMZzYikfsYCyoiYXE5eXIUZiUxj8enlw5cQwdKauSabVaWoDm58aHud
	n6a4C5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrXN-0000000EwG8-3uU2;
	Fri, 16 Jan 2026 21:39:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrXL-0000000EwFQ-1ix2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 21:39:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57FD243D52;
	Fri, 16 Jan 2026 21:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0B5C19424;
	Fri, 16 Jan 2026 21:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768599558;
	bh=MV93CuULcAQqOgxT00b+4q6eXAoEm+4NJrLeOYWjNxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HhGG1Tmg9cBnEM3zvY9stwYh4ihZECtFGABriKCXLv2r2RBNXixXoESrbuRMqi0uC
	 zOvGUOjkUoK6AQpks32bpAiDxfGF39U2+I8zmRA9cMNBizV2msGH4n8506+G197EmX
	 UgPGSgwyEuuN2UEy/D4KFNYbJ+LPBKbrq+hKII6CIms7LoCdq87NZ6WhKpPNQ0no8u
	 DE0Au5189MyzVJvbLFzGgscvVcARsZa+786N1CpCX5pcC+m6k2AcQ2kk9shFZe7ayY
	 5PXOb8VYzs52Tcym1Eo/A/m0Px7M43XehJBtyIv2LonYBSb4sFU5Vg/nn6Fh7YE0Am
	 UIdlDBN7HUnbA==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/3] coresight: add static TPDM support
Date: Fri, 16 Jan 2026 15:39:09 -0600
Message-ID: <176859948752.425550.17875918305781401789.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_133919_472675_7C6B23F3 
X-CRM114-Status: UNSURE (   9.85  )
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


On Tue, 28 Oct 2025 18:11:39 +0800, Jie Gan wrote:
> The static TPDM function as a dummy source, however, it is essential
> to enable the port connected to the TPDA and configure the element size.
> Without this, the TPDA cannot correctly receive trace data from the
> static TPDM. Since the static TPDM does not require MMIO mapping to
> access its registers, a clock controller is not mandatory for its
> operation.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: lemans: enable static TPDM
      commit: a91b64f55d0697cfa554a1c112479d66db6b0ed4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

