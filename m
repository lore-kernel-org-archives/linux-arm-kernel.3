Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58D0C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNBROU6x+2i1pY+iIei6OiJ8Ea22UKXs/tlCyklORnA=; b=Jxk0dbA0X7m0cvQIB5wMXv2meI
	kW+c+N7EobzQOHu+uxWb9JKfbP8/Ct8852N14Y140VhKNag6UWOSePqb+z9heBpuQ+V7HiRR43al5
	KtJkTcOQcBVWdTnqGEK6aZYDBIw/kBcJzgrw1Vx8UPWvkZqVRi8vuTlmX9kbpfNc8Pl71eZTEQHAk
	c9NNakiEzbZJHwOXh0t0cnz1YgCp6Kbf59XNAqsFisnwB/QmayDF2nACNkHxwHF337njDMq+6Sxau
	lElO3nGFQTC9RIs8k4lbPBtxfWm8j3HbVqMOejplcxdL8hWuf2Iw5HW9slvCetWyrAyMPPWE3Co7Y
	L+SV0Y7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpa8M-0000000BUeE-17dQ;
	Thu, 30 Jul 2026 23:25:50 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpa8H-0000000BUdN-1W5M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:25:46 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7B584C0003EC;
	Thu, 30 Jul 2026 16:25:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7B584C0003EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785453944;
	bh=ZfVGlwDXqmEwhF/1zQwM5kRPmjjkS0ApWwpqdprns1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F5zP4M/a1gHl9+04AsxBpyfdokbga/s3DJqzXVHgmTFSKYCp5VrlwCU9Fv5ALaLi8
	 RT2YuyT47GkbkCR2UNOLY1vcxLDzXBW6B462EsDhAV2+qVHQWAyzbvsdvSQJufcoo8
	 Ci0WjTv1fWoRWx1o1Qgd5i+hv1W16GXAuGo39hYM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 171E0AD9;
	Thu, 30 Jul 2026 16:25:44 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM53573 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: AC9: set WAN MAC from nvram
Date: Thu, 30 Jul 2026 16:25:43 -0700
Message-ID: <20260730232543.2706653-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727202630.21572-1-rosenp@gmail.com>
References: <20260727202630.21572-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_162545_466743_06D6F3BA 
X-CRM114-Status: UNSURE (   9.59  )
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

On Mon, 27 Jul 2026 13:26:30 -0700, Rosen Penev <rosenp@gmail.com> wrote:
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

