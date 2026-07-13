Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D99AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 05:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2U7xmtogOkedtMhmF5YdkIVRdjdi8EoNr0JnfRtZng=; b=bqT2oGG2HVTfRQXtd06l8YSX+V
	w4u4RoixO51LPegkjwFpsSNvIOzbkJ01dtS492EDs3Ju1AlQbQ0s8bBr4C6M8l0GcMs1ECo+OnOdz
	Qa9slZbr9q0EPfogsdAvkVNfKl/iIr0zl04v+97QyZJ//Qht0GUlaW2I9a6hm3e/mYH1xv+04WrY1
	T2jwMEQNrwY88b8RUk55z/d7lvd4sSmL0cZfDTGz1jtQVPokjRvEqtUeO6NlPgGRdRR3dBkUChxaD
	gfwiQQR9PxXyWkLAVvxCGrr2d8sbt54XXEJ8oDf8IdUr8FALR1CfGKPRQ3Rsa3rNzWxCeDXHidku1
	8LoWDFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8sq-000000088In-343P;
	Mon, 13 Jul 2026 05:07:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8sq-000000088If-0uiv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 05:07:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 503F460018;
	Mon, 13 Jul 2026 05:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC901F000E9;
	Mon, 13 Jul 2026 05:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783919231;
	bh=q2U7xmtogOkedtMhmF5YdkIVRdjdi8EoNr0JnfRtZng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OicoISbqs/RCkT1ywtokj4Urfq+NAXL2Htqgd4u4jFE9CHvPa32SopA2F3meJBV2p
	 zrw27djh3eJYCnTL+v8eCggtMDyXmWwxwzQQdlzKJpcaQRmlpTlGm62U4jdSMRmW24
	 JZD7OqWo/7VvGoPVm1F0JMVqQzZvpFuGwQy66s3GXEGGV/xZ6sI1XGojp2afCG/5m5
	 mNNuJ/HF9nJL6TZPivvl7S3lEGl5f4Bi58BD874/rjlb8+gDt9N2VfmUxk+s8Q3Mf+
	 ULLgAo9PptTPeBA36sghrZznpeXz2XKSc0VVfndV2pb77tVJmxzwlP8qg3glB5TSRo
	 PnwYZwD0DoFsA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, amitkumar.karwar@nxp.com, neeraj.sanjaykale@nxp.com, 
 marcel@holtmann.org, luiz.dentz@gmail.com, hongxing.zhu@nxp.com, 
 l.stach@pengutronix.de, lpieralisi@kernel.org, kwilczynski@kernel.org, 
 bhelgaas@google.com, brgl@kernel.org, 
 "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-pm@vger.kernel.org, sherry.sun@nxp.com
In-Reply-To: <20260713023435.235765-1-sherry.sun@oss.nxp.com>
References: <20260713023435.235765-1-sherry.sun@oss.nxp.com>
Subject: Re: (subset) [PATCH V6 0/4] Add PCIe M.2 Key E connector support
 for NXP i.MX boards
Message-Id: <178391922306.2569025.9086897176970533972.b4-ty@b4>
Date: Mon, 13 Jul 2026 07:07:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Mon, 13 Jul 2026 10:34:31 +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> This series adds support for NXP Wi-Fi/BT combo chips (88W9098, AW693)
> inserted into PCIe M.2 Key E connectors on i.MX95-19x19-EVK boards.
> 
> For M.2 cards that rely on PCIe L2 link state and wake-up mechanisms, the
> card must remain powered during suspend. Patch #2 uses the existing
> dw_pcie_rp::skip_pwrctrl_off flag to skip power-off during suspend and skip
> power-on during the init path.
> 
> [...]

Applied, thanks!

[1/4] PCI: imx6: Move pci_pwrctrl_create_devices() to imx_pcie_probe()
      commit: 2c5768344f88b86188c5915327bb00e6aad24990
[2/4] PCI: imx6: Add skip_pwrctrl_off flag support
      commit: f26b1c697a2bd72b1b68dca78ab1e95701a0ffb6

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



