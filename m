Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE941099B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+YZBG5es5IrNys4EfQ04k6/YfCygjbkTB/CFHAOJ0Y=; b=1GsEdedkJWkhtI0J9w87DZ8NTQ
	6yLv8RMxEsu5YrA6ZWWWbFUMXp5mjkZxQrH9el7u+hmFPS82G5f9RwDVQEAxTzRZYcknlLA2N150y
	xayuP3xMwfyAQUma6uibkiYaeWEOt8kr3WoZgIfEGGYmk5ls9oJgSszDtBN7ZrrWqXJFgzyyDo87l
	DGW9FR7aSdBjQIGBf4MJ5ZjtqHmjXPOfaEyZoXzAUYuLDW2pkAAeUd0kgCqT+zuX6AiJh+x+SLPgW
	gd3dywyoEDuCES0x5qw776lzor0Bt+GFeT54SrHLSGWOr8hRSivdLflnkL5pvtTkiXcJIXFl4edlB
	8BT6P2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dcd-0000000DFEf-2GT7;
	Fri, 20 Mar 2026 17:26:55 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dcV-0000000DFC3-1zsE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:26:54 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8772FC000813;
	Fri, 20 Mar 2026 10:26:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8772FC000813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774027606;
	bh=nE/vW2D+wEn7UJ/6B88/Ij7aHIhwCj42B79kzM0zOss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=beyFpBvH7wwfdJXoJ+/OfeEcCfM93BpTzuQewv5hJkXaYQYVejGuonarhbde6OAJo
	 s7eJAX1J8My511QRCyuUg616CfNz6Bdb4rWL9oe8+fructPPo3TJeGMXq2pfoxyXSE
	 wFTKS2SANVdjMgz9kp8oWma9kChTEP+vJqRvRB1k=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 2A959A83;
	Fri, 20 Mar 2026 10:26:46 -0700 (PDT)
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
Subject: Re: [PATCH 6/6] ARM: dts: BCM5301X: EA9200: set MAC from nvram
Date: Fri, 20 Mar 2026 10:26:45 -0700
Message-ID: <20260320172645.3072323-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319035324.269905-7-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com> <20260319035324.269905-7-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_102649_015766_ABC75ABC 
X-CRM114-Status: UNSURE (   8.76  )
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

On Wed, 18 Mar 2026 20:53:24 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Especially needed for the WAN port, which is part of the switch and
> inherits the MAC from GMAC2. Added extra definitions for the wifi
> interfaces to make everything clear.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

