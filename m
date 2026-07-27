Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AD4C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBybjZVCajX9cMes2e4kabGF5H4zgWEZNyEx9PG3cuY=; b=dlyhhd30bLhsWjMZfSafOpSKku
	LC6gpsoO+cRqzOWgOekWeuc9IVWgHw37PBh/asOiDxPKlypWFSy/w6m67JUmgNTRUknjOFfbBVasm
	1PFB3f8JpAV2onKHDfLXy2b2s8jdNCc2oisOCQbNm1E5yFmBfRr4ebGaUQoZd0+YFUdYufsePRXiY
	VO1tDsYA2TGICp/2datoaqRSX/eRtRWnc2xC2iKPV/soBcMHvnKVar8ywurtU34UvI7X0x/lYkLHy
	fbpUtQNU8oDXvRwfOVTA7wwk2MeN2CZQgwbz3oMuTVQqzpixiEIK2ntBRMgP4ygWbskCm5vi28Oxy
	JzNpcxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOW3-00000003RT4-0zpT;
	Mon, 27 Jul 2026 16:49:23 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOW0-00000003RSG-3N5d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:49:22 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 31B5AC0000CB;
	Mon, 27 Jul 2026 09:49:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 31B5AC0000CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785170959;
	bh=bu/sRwh9lWo8gPGQ6MOlZea0bD1CNukkp1JJ5jHhRKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6DOoXuraO5B6VcG/+INh+0f3oskgCFiDtm7Vvbu6JxWCdbUcTsj108azY5J9az0w
	 lOPYhaxkQQNaVmJsxz41/CN2rRpob6V3JzODm7CnLNlmThm2CtJ+9c65CikurlTI2C
	 RMU8kZ8Ummv2cm5zcVsOp2d/HxMGPygOFf7B2qGc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 062A0ACC;
	Mon, 27 Jul 2026 09:49:19 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
Date: Mon, 27 Jul 2026 09:49:18 -0700
Message-ID: <20260727164918.11230-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260628231156.1254012-1-rosenp@gmail.com>
References: <20260628231156.1254012-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_094920_858074_42D935D1 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Sun, 28 Jun 2026 16:11:56 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> These addresses overlap with DRAM on BCM5301X/BCM470X SoCs, causing the OF
> address translation code to route PCIe MMIO accesses through the AXI bus
> space instead of directly to memory, breaking PCIe. Remove the extra
> ranges to restore the original single-entry mapping that only covers the
> AXI peripheral register space.
> 
> Assisted-by: opencode:big-pickle
> Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/fixes, thanks!
--
Florian

