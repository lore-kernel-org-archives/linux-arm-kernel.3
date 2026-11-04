Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26671606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z+0jfSVL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXGekm/y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RUeutA5JYkN4XhBF86hLcNctDM+t6W84JjGNnMq4k/g=; b=Z+0jfSVLTi5cQUzFcCxhrFYPzJ
	Q7IUhmBLFFwwI3JsRx52UTySrBTTulGp/3REdD3Q4h6XNdUVnxakwVvUslzZeIr/9TmMze/zjT4la
	oBv3A9N3E33p5dHecRkSuXxoRNz4uFFSg1v51FmIghrWtyyCHX+X16rFHwFoci0b0ngbcQ4TLUMEd
	GgL8LcT3XQqELSV2J5E7Xb974V2vGFg3BfQ0Kr8DXpghoPI7UejM5pk/mBnFafkgtF+jGaLML+9Jv
	NGo5Ip0XSGk1FV3kFEshHhdMAILKkiVq2+LITAsU16Ia6MkaBr19J0Hy2A6AtISAYy3b5kmBbRt9A
	jiwKqwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjpE-00000007BWR-0CHG;
	Wed, 04 Nov 2026 22:51:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjpC-00000007BWF-2UVC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 22:51:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B823560C02
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 22:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FCD1F000C1;
	Wed,  4 Nov 2026 22:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793832681;
	bh=RUeutA5JYkN4XhBF86hLcNctDM+t6W84JjGNnMq4k/g=;
	h=From:Subject:Date:To:Cc;
	b=ZXGekm/yVt5HIKgWlf/GxGofKphsJujgUoIGb3SBxsrOGYPG7QKNSh54c4DxMJxyn
	 E8TEGDAq55igQoniZ7PNb0eBrVjEvddK1WhPaxBCOwjxJoBjfM17dpuO+aZsx8N/UK
	 2h+vhGwDE1woaOzsJgXoxdabiySBD7VbRWh4wO++cTcbKCZ2asdRMUo8zlTs6kgAcB
	 LF2dQstv3APFo19PEVWtz5ssCW6E5t8BnynHxglV9ZX5K6c/gTIBNR0eoSlKWoax2M
	 G60C2ueH06OkMNepwm6Z6AxyWOMrjVngNET9WpHS4FBcm9DPnNNwnUmVKBL5ZALHVs
	 Gx+7QijSIYqvQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] pmdomain: st: ux500: Implement DB8500 EPOD power
 domains
Date: Wed, 04 Nov 2026 23:51:17 +0100
Message-Id: <20261104-b4-ux500-pd-genpd-v7-5-v1-0-4b4f256f340d@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDMBAF0KsMf+3AjCS25Cqli2pGO5s0JFQE8
 e6FvgO8E92aW0eiE8127/4pSKQDYXm/ymbsGYkwyjipSuA58PeIIlwzb1Zq5v3GkVXCfZ10XoJ
 EDITabPXjHz+e1/UD4wyYbGgAAAA=
X-Change-ID: 20261104-b4-ux500-pd-genpd-v7-5-1048f61bc405
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Populate the Ux500 power-domain provider with the DB8500 domains and
implement hardware EPOD switching through the PRCMU. Voltage domains
without a hardware EPOD remain bookkeeping-only domains. Keep the legacy
EPOD regulator driver mutually exclusive with the power-domain driver.

This two-patch series is based on v7.4-rc1 and targets the v7.5 genpd tree.
It contains only the provider changes from the wider Ux500 conversion.

The related patches will be submitted independently to all affected
subsystems once these patches are merged into the genpd subsystem. This
includes the MCDE, DMA40, SRAM, audio, regulator/MFD, binding and DTS
changes.

The idea is to land these independently in each subsystem for v7.5
once these patches are landed.

The patch is split in two, if it feels unnecessary churny, just
squash them.

I authorize the ux500 Kconfig change as maintainer.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (2):
      pmdomain: st: ux500: Implement more power domains
      pmdomain: st: ux500: Control DB8500 EPODs

 arch/arm/mach-ux500/Kconfig               |   2 +-
 drivers/pmdomain/st/ste-ux500-pm-domain.c | 269 ++++++++++++++++++++++++++----
 2 files changed, 241 insertions(+), 30 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-b4-ux500-pd-genpd-v7-5-1048f61bc405

Best regards,
--  
Linus Walleij <linusw@kernel.org>


