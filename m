Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E0CC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auSLqFK4DeDtNP7SJuyUdFWdh7u/goMr6LMYKY0lWmk=; b=4GHLCicm6ZaK3xbQGlw0R2MgwG
	BvqWdmb/oKtg7NEniJrfOvSFbUDVzynTAlCLgbdSuLW6CIPEnutik65yjwAT3BITbTZSnKkMm6CGk
	wmF7fByE81YVKVrtbGBZCo4zlTpoWMsbbJ5kaXJeccZEwmn3wRbRbaAPTSmcs5IS/GrlmX65aucxC
	+qtYfWUDakbs9qTTMd51NNXRBoCkjIVlIrGS0la7Wy2yy5Bc66iZ1Mq/WBksBLnjOdegFjaLvl6ka
	NDAXwLDg04cNmingNv35v6FgsciRuFV2RgTLrxUVuUk4Q5z6uiB7o/NxbYpWu9DGQUZjSBtwyp8a1
	W9Ht2EhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCGl-0000000FyVx-3xtO;
	Fri, 24 Jul 2026 09:32:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCGk-0000000FyVY-0OnS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:32:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DB90600AB;
	Fri, 24 Jul 2026 09:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01211F000E9;
	Fri, 24 Jul 2026 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784885556;
	bh=auSLqFK4DeDtNP7SJuyUdFWdh7u/goMr6LMYKY0lWmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vw6ax7tpkZIfp20pClx13puLmVLbQ5aozAHceUjyU8Q4/I1JqJYDdV3K3hwt0poPF
	 LpAY3GNAqCflbHANOU65D4ViRyiVk7m3Kix443GtDA7VENtICGRJLrJ1fBnyOEghgX
	 BIee8I56GCBObGM428b+wsm88CqR2OaIHWmRwPotKPxbfMly7riziH0TsVUjbfDe78
	 bxvPpemUBIfHke80PTqVSMNmvP0MlHKTyimvMcun1ciCxoMpio09B5u7eghFoi5i4X
	 61z4ctbfr/PNpmBkpJZtXtCaGa0cfqbVnzxQAYa/qvmreOFxtCE/N1P9E+pVDg6KFx
	 z8E8m6bQHkhDQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Fix requested device removal race
Date: Fri, 24 Jul 2026 10:32:31 +0100
Message-ID: <178488551620.2847386.190019543861220832.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722095250.2011630-1-sudeep.holla@kernel.org>
References: <20260722095250.2011630-1-sudeep.holla@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 22 Jul 2026 10:52:50 +0100, Sudeep Holla wrote:
> scmi_protocol_device_unrequest() drops scmi_requested_devices_mtx while
> notifying listeners but continues to retain the per-protocol list head.
> When two SCMI drivers for the same protocol unregister concurrently, one
> thread can remove the final request and free the list head while the other
> is running its notifier. The latter then dereferences the freed list head
> after reacquiring the mutex and can free it a second time.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Fix requested device removal race
      https://git.kernel.org/sudeep.holla/c/2c4097e6c4ae
-- 
Regards,
Sudeep


