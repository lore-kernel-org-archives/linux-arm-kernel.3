Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B47CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yFFyIA+CgINlUCj7lwlqsFEta4VX9fsImCL1RKQOBQM=; b=g+fJ0RrRNM3yXu
	mwN6g82JRkzE65a3ZrEKMd2Fe8IpEhWhCpQTFAYyafM1DPT2qWMZ9j9+qZO5ihQ9g3elMwg3F8PoU
	CMkBxY+vtWg6rvod+prJmj9ogLvCA4Kjj3crJ6FjHBi0FAupj48cYDyOSTShULY5p6bRlnoLOhN7v
	zR509uEYAz9B9aiqRTLOKkvo3TNraNcia2aoCsJaAQKnTKrmAkiFIofybr5oQI4AY4xXiLH/1QWxM
	YE+4PXbGqZwAEQPeQQU/WJe8vY4oPDWSY3U+84E4/C0IQcoznNYvq+SkNpnHvPqpSfVNjfkrfjq9o
	if2WUe27T5r+sI+J5Dtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCerH-0000000BrMw-3iGi;
	Fri, 02 Oct 2026 15:07:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCerE-0000000BrLi-0m8T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:07:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BF5F497;
	Fri,  2 Oct 2026 08:07:25 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03DD53F85F;
	Fri,  2 Oct 2026 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953648; bh=pvgnMQIOoGbDrwhtaTkdZY88ra+VR6RHSHaH8e5JJyk=;
	h=From:Subject:Date:To:Cc:From;
	b=vJIobw6OFbsqbBpxSJwW3ejz3yZdEaPjplM2TQYPkXh6IZWsRkJ1Z9lA6RMbFJgho
	 xgdqvasLD04LgVpl4sl3RQKYD4/1dNZYWz/CtX29xNmoYJUz0pQQ6TqYobCi7OqqJj
	 Ul+cANRfgpKXvo6+n7L+6TG3gFGudyQ5N0cUByuA=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 0/5] arm: coresight: Clean up funnel and replicator clocks
Date: Fri, 02 Oct 2026 16:07:19 +0100
Message-Id: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKfIv2oC/52O0Q6CIBhGX6VxHQ1QsbrqPZpjiL/yL4EG5nLOd
 4/ceoEuz3dxzreSBBEhkethJRFmTBh8Bn48EGO1H4Bil5kIJiRnjFMdnTIhQsLBTspiISVTEVy
 YQXWL1w6N6l/ew6jMGMwj0U7UdVVJ3cK5I9n7jNDje2/em8wW0xTisl+Y+Xf91cQftZlTRjkry
 kurq1IIfcuOkwmONNu2fQCMOEqw8AAAAA==
X-Change-ID: 20261001-arm_coresight_hi3660_remove_dynamic_funnel_clocks-d277556abe8d
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790953646; l=1242;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=pvgnMQIOoGbDrwhtaTkdZY88ra+VR6RHSHaH8e5JJyk=;
 b=cmOXFv8KVTg3rB3iEzKjFXWOXWbQmhWuQjuWQI7YpZ06cTmNmfYDanvXRLwkG2qi0mpzkOaGD
 uTZeNE5+L4vDZrQ+m03XYIFEJaz8vqQyGwG0zJZgFtxfEIoSMvtwWcC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080732_537115_D3568A38 
X-CRM114-Status: UNSURE (   7.54  )
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

This series documents optional atclk for static CoreSight links and
removes unused clock references from several device trees. It also
describes the programmable Zynq-7000 funnel as dynamic.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (5):
      dt-bindings: arm: coresight: Limit static replicator to atclk
      dt-bindings: arm: coresight: Allow atclk for static funnel
      arm64: dts: hisilicon: Drop PCLK from static CoreSight links
      ARM: dts: zynq: Use dynamic CoreSight funnel and trim clocks
      ARM: dts: qcom: apq8064: Drop PCLK from static replicator

 .../bindings/arm/arm,coresight-static-funnel.yaml  |  6 ++++++
 .../arm/arm,coresight-static-replicator.yaml       | 11 ++--------
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  3 ---
 arch/arm/boot/dts/xilinx/zynq-7000.dtsi            | 24 ++++++++++------------
 .../arm64/boot/dts/hisilicon/hi3660-coresight.dtsi |  4 ----
 .../arm64/boot/dts/hisilicon/hi6220-coresight.dtsi |  2 --
 6 files changed, 19 insertions(+), 31 deletions(-)
---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20261001-arm_coresight_hi3660_remove_dynamic_funnel_clocks-d277556abe8d

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


