Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09E0C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqFBNWTpSNMo/yD36L8wOxLdBSJhPWa9jM192nHoomI=; b=lE4dErkuGQKp2Fzmqdk7kTmI4c
	X8h5lI/TRwSL6/TpGp5EA1IA/FDjZjwu/zSHCvt6xLZMcmCGzeFcZ2cc6PCOW4qsnrOpt5q/p/rcw
	8QcEDSiSCgx/o7pNwzZOME06K/Cy+9jv39CeyVBl+qG/OjbmCiXP4GqJl/AUUKwFm6Ds2zEkuf7qb
	lKazZiU/is2MUOQADp7mPxUZJUpjhQDoI9NVCtTE1vsXJIwqrzkDvsVLKUykq+GY/G1fmxGZewnnW
	L7lmeCoo6WNKJqad3GahVE7vc0ecVYvR3QPaLKtAszdfp08A68NVKNcCLe5kEuwLCghgEtip4jgks
	+WUqSkMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjdC-00000003rcn-2gkY;
	Mon, 10 Mar 2025 20:21:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjUx-00000003pJa-1EiA;
	Mon, 10 Mar 2025 20:13:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CAB245C5EAF;
	Mon, 10 Mar 2025 20:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E66C4CEEA;
	Mon, 10 Mar 2025 20:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741637594;
	bh=7GLoRHKS9iYVNYJfuUKGRjevJBrW0r+lm+WU7ZOcQPs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZJ8vKHZmcKY8F5ftOjLbHpIXfL9vJcLwlK2jN5GDj+OeY/AK3WwpEIRr24pnwB4hK
	 HAd8v5xsV0YYi1iL2UwB3WLehnN3pXe15rTiCAOb9+fDbbajK8X3VF1GYOibsdsEJZ
	 C74Z1gvOhH/ql1VsMfxQdaOyHiOZsd1Lpz/OIviw7N6Tcl2YjxZ01NQHC+Sb+twY/B
	 lisznoqjirHaV8D5BFzFWkcjKR7pzinDRljOndnDCOGIGTGkKmQYJrWLPA9tbYAJVO
	 w7AMVcp1CKUIKgt47flRN4OOj0Z9VY+yxeZ3qdvLtntfPjE/KGADGkVQ72cLRxdCJZ
	 nHS7Bk86rRUUA==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de, 
 tharvey@gateworks.com, hongxing.zhu@nxp.com, francesco.dolcini@toradex.com, 
 Stefan Eichenberger <eichest@gmail.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250305144355.20364-1-eichest@gmail.com>
References: <20250305144355.20364-1-eichest@gmail.com>
Subject: Re: [PATCH v2 0/2] phy: freescale: imx8m-pcie: fix and cleanup phy
Message-Id: <174163758978.467704.1139455752621643908.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 01:43:09 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_131315_393022_3A4D91CA 
X-CRM114-Status: UNSURE (   6.95  )
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


On Wed, 05 Mar 2025 15:43:14 +0100, Stefan Eichenberger wrote:
> The imx8m-pcie PHY PLL fails to lock under certain conditions when
> returning from suspend. This is resolved by asserting the PHY reset when
> powering off the PHY during suspend. This ensures that the PHY is
> properly reset when powering on again in resume.
> 
> Changes in v2:
> - Remove unnecessary check if perst is not null (Philipp)
> 
> [...]

Applied, thanks!

[1/2] phy: freescale: imx8m-pcie: cleanup reset logic
      commit: 97e8a2ff28a3dc36ca3cdc94f37359852d7e1c8b
[2/2] phy: freescale: imx8m-pcie: assert phy reset and perst in power off
      commit: aecb63e88c5e5fb9afb782a1577264c76f179af9

Best regards,
-- 
~Vinod



