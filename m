Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2331CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4hpL1WjqUwGCaqWkzYGDifvsElcMhYMPsGMRUV9Mt8=; b=TFcjI7bldoqozSE2QTGXgHH5/j
	bvuIdhqC4mgedAwB9EHrjWmpzI8mcTjpkFnWwq/KJ1ora4F2If4FCdQUwjMn4l5V7xF2uYYyx2GG+
	22di+hyp5jBjisMZfFeV6IFBHPFW0/+s9W4KUfqkdcWW8yja0aSvwBAUxORwzCIX7ZMQhTA7fQ+fc
	uLbcz1t12imqKYl7jc/NjRGqnNWh3ilRLS3HDmr2IJ5joQhLntaHc4+AT1QQNloregr3NX6Aj2nND
	Tg/UXCyrpVgdckZsJqJgbPko+2Xxyd332Irlv2t5udK+RTxov8LtPpjH1yGRJkhQdHFuKEtG2G8Fg
	e7bvNRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0OJ-00000008NRe-2BK6;
	Fri, 12 Sep 2025 09:48:27 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0OG-00000008NQY-3Nai
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:48:26 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9mLV91008151;
	Fri, 12 Sep 2025 04:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670501;
	bh=r4hpL1WjqUwGCaqWkzYGDifvsElcMhYMPsGMRUV9Mt8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Q16QU3RUq3NqRnLwztT1oObzs5RQ9HBg/64I5/34nKjWYKYRXvUF0xAqenQ9rupSm
	 DMDLYcUGpMrMC2FMrdaCCIf+THvnRcVL4q1MZxP8km86Reh3oR+YtkLSCpW/LqMw7s
	 xca8z1LyEo+Pu2BSGApkVozSY7+vZx0pnVuj8a04=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9mL8S2685103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 04:48:21 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:48:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:48:20 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9mKuC3715494;
	Fri, 12 Sep 2025 04:48:20 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Anshul Dalal <anshuld@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/4] Add support for TI AM6254atl SiP
Date: Fri, 12 Sep 2025 04:48:17 -0500
Message-ID: <175766786841.25865.5286816232704724647.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250814134531.2743874-1-anshuld@ti.com>
References: <20250814134531.2743874-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_024824_929682_8DA50119 
X-CRM114-Status: GOOD (  17.09  )
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

Hi Anshul Dalal,

On Thu, 14 Aug 2025 19:15:26 +0530, Anshul Dalal wrote:
> This patch series adds support for AM6254atl SiP (or AM62x SiP for short)
> to the linux device-tree.
> 
> The OPN (Orderable Part Number) 'AM6254atl' expands as follows[1]:
> 
> AM6254atl
>      ||||
>      |||+-- Feature Lookup (L indicates 512MiB of integrated LPDDR4)
>      ||+--- Device Speed Grade (T indicates 1.25GHz/1.4GHz on the A53 cores)
>      |+---- Silicon PG Revision (A indicates SR 1.0)
>      +----- Core configuration (4 indicates A53's in Quad core config)
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1]. As part
of applying the series, I have had to fix a minor merge conflict due
to the order I picked patches, do check if all OK and report if not.
Thank you!

[1/4] arm64: dts: ti: k3-am62*: remove SoC dtsi from common dtsi
      commit: e0b9feca7329c495a76891d7766a781dea73787d
[2/4] dt-bindings: arm: ti: Add binding for AM625 SiP
      commit: 3e915577cf0b7d3f9088c398888e5e01e10356d7
[3/4] arm64: dts: ti: Introduce base support for AM6254atl SiP
      commit: 7c1d13a14e61ab33eec330cb6cabbddb37eecaa9
[4/4] arm64: dts: ti: Add support for AM6254atl SiP SK
      commit: 2517e476b819df986fa1fe53927c099032bb72dc

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


