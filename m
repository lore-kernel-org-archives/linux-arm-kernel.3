Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07543C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lqCmfeP0xQwuN32agbOG01rcruHs0PGUCAsDEFU7jU=; b=wklX3fN2e6Gxvfq+cuNPbQ6rWE
	PH+E4aAxG0iDnTbm7DpgI9KSB9wgY3Ezjrwkqi2/eCSawmN6n4M6E5tAZ1uonJW8WJLb6AbKi1Syt
	djOG9Omk58Zs4NqLW1TpqrChPen1F7vzQ3xjhH2HI+ckEDXDVQrhqPHafuDb5A++IsYgf8kzslbls
	MlpYShfCYETOR+BOMVroUSoGj10jd+c0CiCh1PyS6j4UvE9fC78bc+4LReujODSHKaKGBxDQTduZo
	vBTCAtDIglaVetyDj9yHVWXPYsa8tGoXmgAyfcB2rilTdrLDMLUA5nOF20w5OJyfrTU5nOLXJRyPq
	CN69B7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpa8f-0000000BUkB-2A7S;
	Thu, 30 Jul 2026 23:26:09 +0000
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpa8Z-0000000BUi5-29ut
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:26:06 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 20E1EC0000DB;
	Thu, 30 Jul 2026 16:26:03 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 20E1EC0000DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785453963;
	bh=77/sbrLLqgTpymVXILb2mY9H828DXe6nW6ySkXv13lY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Do1Ni0FH34X4xhN2tn7Qq6aKIkyNDMm/R+IbzTrAlSzPWugz9q6c6T37YEz/RTQmX
	 FngYvqGy8MCvwr2Z3B2tbFAPoaHutk+HpZAS9RxKfTW44zYFK6RBtn6p+C7Bgguo2X
	 JD1ZHWb3PZ4cNIOtajB3YWgcSViH1VnIF35VPW+w=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id EBEA6AD9;
	Thu, 30 Jul 2026 16:26:02 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: SR400AC: set WAN MAC from nvram
Date: Thu, 30 Jul 2026 16:26:02 -0700
Message-ID: <20260730232602.2706827-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727202817.22085-1-rosenp@gmail.com>
References: <20260727202817.22085-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_162603_575015_DE74BDDC 
X-CRM114-Status: UNSURE (   9.58  )
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

On Mon, 27 Jul 2026 13:28:17 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
> userspace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

