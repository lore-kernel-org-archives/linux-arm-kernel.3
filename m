Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475E1C5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W6N6Z2WANsoVl4DA94aJ0ccJCMvWNevZeBoqhkYAfO8=; b=rSda8lB1TBeKRQ
	jTIAsYFIrJpnWpkRqav4FHKl56eqz2cRYFvzLJaLDNzx1eyKGdHZBUu0c7rwLbl7tk+GuUpF2t4up
	EUjUMvNnlGmF5J0c9ng5dCoJ1RmdV+HQSbiuaUt97RT8pBAkAxoSe3S3apwlJfqe5TuMwZwHSE+K1
	znroXdPUU9gaUyZrHDtsgyT9MXWi0iU2sYCJx8Z06JB490nYFX9wS4sfiFySkvypgHTa1p5EfGkjS
	Bhl4c12nN4Hg6zoe2P2+s/t0o7p+6RRBT4vdXkGpT5gfV/yszZdj+ocP2VlxJT/tQv+KoP8GVe3Ug
	3texaT+PlA8mTvwm2ETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdt-0000000DSkh-49zi;
	Fri, 21 Aug 2026 13:50:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdj-0000000DSbO-0CTV;
	Fri, 21 Aug 2026 13:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 262FC60A63;
	Fri, 21 Aug 2026 13:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C36E5C19425;
	Fri, 21 Aug 2026 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787320233;
	bh=mSWx1NCoUEXQwAwUZ0o2hB/XTB0iO2k+EF+a/falyL8=;
	h=From:Subject:Date:To:Cc:From;
	b=AxcydG9ekc8CpckRJjPgIbd6h/zPAucpsHUxEDdaXgklU6PVqe/yFxuAso0M9ATsW
	 3t4UjjCv2ELSqbmfoSWgVhb2oI36Xla8RA8fKUEzayN62VPnC/5qOCRlUp1BHdJWWr
	 6B2fLCrCn1PJnPdZEdXkGbZF6aNwNJvTDShyaI9I4sZIJ0EGELx7Ef/0fvtZDeJfct
	 2R4RbsWxKBmJk3IyZ4k3vhnTQpogRzKEHlD/sCe+HcHZ3ur+gDpD2Zb2d/iU0oo1EX
	 QrXohoAr/tCDaknhaJKSCiHWPYgROZGICjgSxZ+gdqmmdJ6dOZplEIw2sDnrDDw2Ln
	 nKXsjpJ5aUKMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A970FC5DF7D;
	Fri, 21 Aug 2026 13:50:33 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 0/3] phy: apple: atc: Prepare USB3-via-4 tunneling
Date: Fri, 21 Aug 2026 15:50:26 +0200
Message-Id: <20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDVpG5FyFbHQmjIWSAchjbsrd
 u9bvD8CYyBkqLMIAQ9iWuYElWfgxm4eUFCfDFrqUhqthC1Et7l1vMTOaXvjKykNeqt6SKc1oKf
 zCzbtb97thG57K3DfD4G6K91yAAAA
X-Change-ID: 20260821-b4-atcphy-usb4-f8f9008efb1d
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sven Peter <sven@kernel.org>, Paul Cristian <p4ulcristian@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=868; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=mSWx1NCoUEXQwAwUZ0o2hB/XTB0iO2k+EF+a/falyL8=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1ZH+JLUjq0vpsevMmM3en3Byt2qQ+nux96JvjdOZd5Nv
 sR46dOVjlIWBjEuBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBE1hQxMuxvUL6Z0ilr+sA+
 tP7XEXmpVNaZNzTZL9fu6/v2tZ514kxGho7EyQeVvlR/qsrbZnrY6PS6iba3a2acyMoVWHR6zzW
 DBCYA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Hi,

This short series first fixes an oversight that prevents USB2 from
working when DP AltMode with 4 lanes is used. Then it adds the required
sequence to point dwc3's PIPE interface to the USB4 Native Host
Interface which I plan to submit soon to support USB3-via-USB4 tunnels.

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
Sven Peter (3):
      phy: apple: atc: Support DUMMY PIPEHANDLER state in configure_pipehandler
      phy: apple: atc: Factor out the PIPE mux sequence
      phy: apple: atc: Implement the USB4 pipehandler state

 drivers/phy/apple/atc.c | 91 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 59 insertions(+), 32 deletions(-)
---
base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
change-id: 20260821-b4-atcphy-usb4-f8f9008efb1d

Best regards,
--  
Sven Peter <sven@kernel.org>



