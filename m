Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AF9D33992
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lze2D8j1O7gv9ahMxtht6Or8GHfd6On32yyYfuBSCwU=; b=rPkeMN12Lt5ma8
	D8virM9Xw5GlbaSyJy1SH42whYWcE1aMDXFzJwB6YbnLRjornm/RfAeoB1UDiKX3Rw1yHLPuH34m1
	v4TCwmI5tS7yT/eWUmdn/hcBp2PBpmVv/6kuA9VXFhP1JKPwioqHu+4i6h//W69eBXwt1rZUJxaDQ
	CzdU6BJTyyRU1bsRCX5zL8qUZX3xUP+UDHUKmuLO5dm5/nzhIYJgA5rer5Sz9WP2q41QNfr/ZM8Fv
	c0Wv6IlLedUbu8al/9ssSIDfvpsswIV9nYlUT0fEbRQN7PyJKVndgu1boSFIhPFQ1rZHPpQkPIKnt
	aQEMkJsdG5cWYd7kvZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5R9f-0000000BD1D-0yY3;
	Mon, 28 Oct 2024 14:55:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Qe9-0000000B6Ty-1zhy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A2CC5C5C30;
	Mon, 28 Oct 2024 14:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF3EC4CEC3;
	Mon, 28 Oct 2024 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730125384;
	bh=ZQCzSCdRJnarUvUNjH4dcubxSkcXGcHBY3Q+CZQ2Yus=;
	h=From:Subject:Date:To:Cc:From;
	b=kntAFHzSa2STXgjS3+YZA6rDD097Rmxcv2cwb13ucIBzhSUPKir7czv48YTSwBCmk
	 s/nt9qfNjkC8hx4YpyCledjyzk3Xyq6fIVbpDpqhgtWh/+ymhhjwE4ssKqOZMDoTsf
	 0FicV63BQ+MfiTFrj8eouf9lv4cu0hm3K4FfcQ3d8117m4U07LL5WbIjSLm+Ba04ml
	 fWCUvy5Cwmb6hQTNc84YnNhUelOTQryn21sTuJ6qRu/r/qyn0Thfats9R78w0U5L91
	 5JdWjwqGTA4y+iz1eyGMnXOJqxfhiovfuWpksRMUxoifQLHcacIK332IFoMZqmWW/A
	 H/woj9j5T0ggA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] Allow specifying an S2RAM sleep on pre-SYSTEM_SUSPEND
 PSCI impls
Date: Mon, 28 Oct 2024 15:22:56 +0100
Message-Id: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAECeH2cC/x3MQQqAIBBA0avErBNsKLCuEhGiU80iFaciiO6et
 HyL/x8QykwCQ/VApouFYyho6grcZsNKin0xoMa20WjUERM75dI5yymJgp8Fs90VmsXpvvPa2hZ
 KnTItfP/ncXrfDxOo+w9pAAAA
X-Change-ID: 20241028-topic-cpu_suspend_s2ram-28fc095d0aa4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730125380; l=1608;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ZQCzSCdRJnarUvUNjH4dcubxSkcXGcHBY3Q+CZQ2Yus=;
 b=CJb5iv370J3U0frllG/BZzoHQSaWIPmZgpGoQ58p2btL7ihJwcbBT8zD1VKQ/ziRzdc1U6Uas
 0G+Ugzn/wmLBSi4AbM9rrHA7dtq5o+QUORoJO4QpnMwGDqz1XQcdumk
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_072305_648874_74D51EAF 
X-CRM114-Status: UNSURE (   7.89  )
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

Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
CPU_SUSPEND instead. Inform Linux about that.
Please see the commit messages for a more detailed explanation.

This is effectively a more educated follow-up to [1].

The ultimate goal is to stop making Linux think that certain states
only concern cores/clusters, and consequently setting
pm_set_suspend/resume_via_firmware(), so that client drivers (such as
NVMe, see related discussion over at [2]) can make informed decisions
about assuming the power state of the device they govern.

If this series gets green light, I'll push a follow-up one that wires
up said sleep state on Qualcomm SoCs across the board.

[1] https://lore.kernel.org/linux-arm-kernel/20231227-topic-psci_fw_sus-v1-0-6910add70bf3@linaro.org/
[2] https://lore.kernel.org/linux-nvme/20241024-topic-nvmequirk-v1-1-51249999d409@oss.qualcomm.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: arm,psci: Allow S2RAM power_state parameter description
      firmware/psci: Set pm_set_resume/suspend_via_firmware() for SYSTEM_SUSPEND
      firmware/psci: Allow specifying an S2RAM state through CPU_SUSPEND

 Documentation/devicetree/bindings/arm/psci.yaml |  6 ++++
 drivers/firmware/psci/psci.c                    | 44 ++++++++++++++++++++++---
 2 files changed, 46 insertions(+), 4 deletions(-)
---
base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
change-id: 20241028-topic-cpu_suspend_s2ram-28fc095d0aa4

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


