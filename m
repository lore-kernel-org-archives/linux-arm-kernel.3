Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4F1CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 04:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBEZF3iL75BUQmc2cJSCdeEU7vWSXE1LRIlX0mUh1OU=; b=uqPx9cgtJmpA3PPBCON5dUvFx+
	5GKyhqVhUcYZJN+HdZjvMNUe1n/ZYvN60J7Mr6Sjj97HlHlGUk4Ot4yhmasrEIm2Xf1xU7vhlqNUs
	nF8Q4wEP7l5FTHj7SWIPQn4+XlNpVXpiQSd7y+aXQukOH/T8krjsfJNC/JpaTsFGRtE0nPdS2QEzI
	kF3Vr2tNCRpYWAZ4gjwFwJdjQZ+GnsYD0Z8/dxgagizDQXNBertwsTHznl/IXSGc2YHuf8BruYuIV
	+J3xo8kCt77Xoq7O6BN5MhVOtlpDoMHw3sJHDetN40mUa4d0/DpCL0WoOP6PMRGdi4qEsLpxzsZf+
	u0VUgIgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOSO-0000000Gpxf-1jZj;
	Fri, 05 Sep 2025 04:53:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOPS-0000000GpHU-1ldE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 04:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6666644437;
	Fri,  5 Sep 2025 04:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5E8C4CEF1;
	Fri,  5 Sep 2025 04:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757047849;
	bh=y/5a7k0wUPRODTgPuXBBRsBXnaLaZ7amN7FTAS0julE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pStKVpOQSEipXtwkKTMPD0NGcQlfYLMrWCh4UsUVBIb4O6neA0b1XETdSZnYpbx2/
	 qBA85nn6Lu2V+hxKin6fTR4lmqfnT7qX4RbMlFxhWeqdX9Dn54nmmtPf49DaAEZq+R
	 v19NUgl5ItMBYA/Q3aSUaPlXPBvA7Y8aMAmtfzKuOHzFLvSCJE4eoRXvNF/SOev+kB
	 S1jf4UzJkQ33mtIAG6FO6PreKLPhdzRyy4pH1BAWcuKPYTb3npDft6u+U9Huo6MtKl
	 V7WagGFPJCMT3kyvxLm7NRwY+6KhZsKeyzOwtZCVvybgFRLosORX7RfEZe+KSa8jcl
	 1ZJwgIbAjno3Q==
From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
 kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250820022328.2143374-1-hongxing.zhu@nxp.com>
References: <20250820022328.2143374-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v5] PCI: imx6: Enable the vpcie3v3aux regulator when
 fetch it
Message-Id: <175704784338.6198.15508737938849793492.b4-ty@kernel.org>
Date: Fri, 05 Sep 2025 10:20:43 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_215050_488083_004C8C6C 
X-CRM114-Status: UNSURE (   8.45  )
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


On Wed, 20 Aug 2025 10:23:28 +0800, Richard Zhu wrote:
> Refer to PCIe CEM r6.0, sec 2.3 WAKE# Signal, WAKE# signal is only
> asserted by the Add-in Card when all its functions are in D3Cold state
> and at least one of its functions is enabled for wakeup generation. The
> 3.3V auxiliary power (+3.3Vaux) must be present and used for wakeup
> process.
> 
> When the 3.3V auxiliary power is present, fetch this auxiliary regulator
> at probe time and keep it enabled for the entire PCIe controller
> lifecycle. This ensures support for outbound wake-up mechanism such as
> WAKE# signaling.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Enable the vpcie3v3aux regulator when fetch it
      commit: c221cbf8dc547eb8489152ac62ef103fede99545

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


