Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B66AC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GOsVFvfs9abJpzfdv5FE5oUL6nD9+8KoT4TO3PIkAXA=; b=lclAR9Gzk4qa6M
	+NUrujdhXXEQ5v1KFI3XduxiYfciGfEosA109JdGJ05NSeoUV1MHdJfC1+2KbLXo6fagxHaRpMBnG
	U6TbgZf/oAwHR7p+h/YAfo67D0i85GlxPn31QPw07oamw1TsR8QcVCVBmHBnGInMQD3VloGdhAWmk
	Zb+1Zzxkft5qL29WQP1inJzHuH2XTnW7UOUt70XolA7q5KzhAoYZkinfX6bxDabwlz6oJ1k0GGPer
	Tl+4HJYdjGKcXXB8crm9fv+dNakrzsgCyQfcu17PqMZtkA/nMhj6Iqe6yb18hnPQaU0HSD4uTNC20
	yb1X29o81TUmSgOvXmWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gZX-0000000Em0E-0yFB;
	Thu, 10 Sep 2026 15:20:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gZV-0000000ElzF-2oJZ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 15:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=GOsVFvfs9abJpzfdv5FE5oUL6nD9+8KoT4TO3PIkAXA=; b=LDK9+kZ1WjZUDYp1wE3YA9BHJ/
	Lxy16mQ6xWd/RixvRustJUYcCazlukxDJpJqDYEOM675AWubErsLV4xt6E96uM9q/TkmZ+f2mIbMw
	f8DwZR4bsHsOicJT/FvV08bD2FtTZ8Eekzfp7QbS/TjLH0U1px1k3RV/XBoYyps3yRRgkaMWMnwHf
	GSBJK8caB7k8/ou8VJC1c8xs2dCsyYBwtUDJa/uYe/YCdPo7APowN1mEAB+Br+mDmabLYwkanJWwp
	VGGSayssejrVS3Iv4xMS0OLBJ49ef25JjYCKMbHBttl03dJftv5XLMAF2wkeur/fhicH5XlTY0Ezj
	Xw7/qdTA==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4gZR-00000002fLw-1rJx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:20:16 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789053610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GOsVFvfs9abJpzfdv5FE5oUL6nD9+8KoT4TO3PIkAXA=;
	b=byESV2104IdEMzQol13nxZzBPLHwFMyELAO/DcR57rXlxvXdp/QuJP/mMg3Rhj8FMVeHht
	INai/IVH22VDGEH7qixwE7gBl7bDTk6a6ZhRuQTdz9hD7cgZ1Y/iOdv1xstS40QezxGHU+
	oKPf6Cwmi76ypnMNkaSKzlWUygRVKcebi7hFsIRmn3Mmj0KE8kNsLTxkDedie00RqvQ4Ub
	/sj6sM0PjxD6lyMjV5d7S4Re3FOBZCzLre3Rsn1S96xmrp0RrbeM84iAZus0ViEn4jO9Wf
	yEuA8UUSYiH5BmBKVCKqKiFUhjUAh9y4oGQ/gu+EmxUgVEcBoTnfuy6o2QtopQ==
Subject: [PATCH 0/2] arm64: dts: imx93-kontron: Add support for Kontron
 i.MX93 DL
Date: Thu, 10 Sep 2026 17:19:05 +0200
Message-Id: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBA0auQWTtJKVTBqxAWpYw4BmrTAQIh3
 N2qy7f5/wChyCRwzw6ItLLw2yfklwzc0/qBkPtk0EpfVZ0rXILMkezEfsD1hgXytNUF9ixhtPv
 InrArTaXIlNpVBlIoRHrw9ps07d+ydC9y87cM5/kBVviVuoYAAAA=
X-Change-ID: 20260910-upstreaming-v7-3-imx93-displayline-b4580e542c85
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
X-Developer-Signature: v=1; a=openpgp-sha256; l=725;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=rkzUcBl2k304SJJoPUFSmGOHA1IleL12TzXPwoRlnA8=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWvRqVkuxX+aZq3+cyiSvabnVHPbMaEJMqaKkkaXfK6Lz
 U5OUnHoKGVhEONikBVTZJHit3htaxbrI3+sOgpmDisTyBAGLk4BmMhbQ4Y/HMtiWsL0Lnvprnjr
 pXeRLdk06bn1Y81IWbWYcz9EOJKKGP5Xe02yNr7659TZTZGxp38xccpdcWP2rz7bkNl5/s37po3
 8AA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_162013_676228_69753EA7 
X-CRM114-Status: UNSURE (   6.64  )
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

This adds support for the 7" LVDS panel on Kontron i.MX93 DL
devices.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Mikhail Vaniulin (2):
      clk: imx: fracn-gppll: Add 350 MHz support
      arm64: dts: imx93-kontron: Add support for Kontron i.MX93 DL

 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../arm64/boot/dts/freescale/imx93-kontron-dl.dtso | 104 +++++++++++++++++++++
 drivers/clk/imx/clk-fracn-gppll.c                  |   1 +
 3 files changed, 109 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260910-upstreaming-v7-3-imx93-displayline-b4580e542c85

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>


