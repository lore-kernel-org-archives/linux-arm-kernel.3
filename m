Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA505CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhJXcqq868xFjQ+f2mcUdb/MvAHJ+THjbF03DgxYzVY=; b=FxmuI/GKi6J8BNC6fG3zndSMnC
	rQ12Gt4EAECXqDKN+rgV0EJVjp3irKHkUkhgp3WjXjib1Z4QaZQYctG+NOaSs8RH1b/vP5czWLCum
	xKWcv5wqPsh2hEYfq/JxaO5ObKX9a7/U6rdbJKL56V7ZlVEIPCeWINgTcmHPZxfSal1/rsvcHBYEC
	r6nCZyhKOd0kQtv00wpIoR9yyVe0avFqDylHxx0CEuhSNL3ShQaTUd+dRmLhjJ5PRZYWXivFVV9Kx
	Cd1XPaE/VwZKpy/H3g3IrhoS+zdmg9LGXb35yx1Kcjy+Q7dAcgQO+P8G+sj9Gu2DDF8YwggE7cxYC
	bsKsXVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzzP-0000000FZEG-1qOj;
	Thu, 06 Nov 2025 13:25:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzzN-0000000FZDv-11xB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:25:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBD1C1596;
	Thu,  6 Nov 2025 05:25:12 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 53F783F694;
	Thu,  6 Nov 2025 05:25:18 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [subset] [PATCH v4 0/3] coresight: add static TPDM support
Date: Thu,  6 Nov 2025 13:25:09 +0000
Message-ID: <176243547814.412543.15801325459022165451.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_052521_325159_CE83575B 
X-CRM114-Status: UNSURE (   8.99  )
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

[1/3] dt-bindings: arm: document the static TPDM compatible
      https://git.kernel.org/coresight/c/8d204b6f1f7a
[2/3] coresight: tpdm: add static tpdm support
      https://git.kernel.org/coresight/c/14ae052f7947

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

