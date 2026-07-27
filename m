Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C692C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OafQ5EzDsXGCXwEyxawnlSLtfljVHFw2Mn2ju8bwBe0=; b=urYAfVfMuicYvGbdXrfV9ioRBf
	ITl8rCmJ5/EU7NwfzBVoyy9D/wpV0nOW722jsI0XYEPhMJh+uS/XmlsibRFH5FNuwvWiSrb9df861
	M5KsiewhxYbifBshaW1VzyVVqzfdK9uXXetdLnxIMoBMJqqvx2pDy82RGqJ6aq2HNdtEBIgKVVmQA
	V6/e21ZLaWbBhuRwla655kV2KXCrHxSW4tWQ4hf549YeW0fWYYIcj0ut1bdi2ORYXYwur1V2Iamn1
	YlhqtKrLTNcdWna30R5hMmJKGFSxXLce7GWGPM1V6e484a8rcmtjUQR+3M/QARrRLoCzhIre45EIU
	hA4pV5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOaz-00000003SK3-3Zm1;
	Mon, 27 Jul 2026 16:54:29 +0000
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOax-00000003SJC-1Pdl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:54:28 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A2297C0000CB;
	Mon, 27 Jul 2026 09:54:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A2297C0000CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785171266;
	bh=ITwqBTnMUTxn5aS9pdWWj5KaaXl3b3z95rNNRj6ttGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iOqsmOOm9hDVqKAlkYrQlBUzkkmV5qh2Gctqz0v1wurcedHouT1UDpIKk8HUp4KO2
	 lVfkrVh6BrzhAlL6yCPkOmmnY+FRFta0K0yLS/lTqh0tZOwwIyNdctMbD57njdAlAV
	 65aNG9rIvyVUzmVnJYWAdrrTErQ3rZOCkGtnTuEk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 75A90ACC;
	Mon, 27 Jul 2026 09:54:26 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
Date: Mon, 27 Jul 2026 09:54:26 -0700
Message-ID: <20260727165426.11987-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725215722.9323-1-rosenp@gmail.com>
References: <20260725215722.9323-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_095427_397048_F8C43B87 
X-CRM114-Status: UNSURE (   9.65  )
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

On Sat, 25 Jul 2026 14:57:22 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> PCIe controller 2 has interrupts 0-4 mapping to GIC SPI 138-142. The
> mapping for interrupt 1 was incorrectly set to 138 due to a copy-paste
> error. Fix it to 139.
> 
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/fixes, thanks!
--
Florian

