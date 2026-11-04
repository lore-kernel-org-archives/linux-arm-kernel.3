Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07FF606C908
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XKW4VySk;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V/in0QRJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w65VE/XbCBeV4IGTEn2ogHKLd81LPibY7DZfAZW4xlY=; b=XKW4VySkrwQy/K
	jYcmCmrSuoj4/apug9zSZMzUzstlg29wTYx2FU6dO4xtI5ep4eiChs0J3Y2ioiWxQ4T9rYOb7L99I
	iU+CIfUxl1CHOFy8KoItLOelzf+IfBjBX7yVjFhqDpVV+bxeUtDjS2YhU5pJPEVsMAYLsztCVNaT6
	ck8CSq+OTXM+s1JW6dYVkK0a3MijZ23KNqXGQhrWtSVN9XY669fbyhK7YcO8sIOxnhETmKdiE1PRq
	iebeWpGcJu44duKOsT1caUIVIQn64dc3z6LxBFDQio5cxbz7EAJhPee1Rbm+266ALzNap92JVETtK
	TkxPkMBDneXM3FO5g7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiax-000000072Wy-1nK9;
	Wed, 04 Nov 2026 21:32:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiau-000000072UG-3TpF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 954C142A08;
	Wed,  4 Nov 2026 21:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17AD1F00A15;
	Wed,  4 Nov 2026 21:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827952;
	bh=w65VE/XbCBeV4IGTEn2ogHKLd81LPibY7DZfAZW4xlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=V/in0QRJXbjp1o+Aotb2GXJuCKa3JHAmbD+UvHEV6/qAsC/DwJTvOz36DPJgmMQBx
	 Rw8GmeIMUcJ13+FFIo8FGCNRymYbIAEr1ZSIjDM7ZGT5X55iwWTRNJf4xlSF7Cg2L2
	 kXSpWGHlwATUYBR/gQ0o4606UkgJnuQ4wtKZGUIqDfCa0nVb3W+lGgQzHxceXMMKY0
	 HPO9nNOleoWgqm0K38UiBxVlTTh+sC4Hll/jb24SSWFtc1pP1QL3PlYXGjda37Yync
	 XCvg0z1+UPqGzZk4fZJIW/9qjMDsq+aT5Vow34tOM0Zw3ZQkaRmvg40kwr+bglF5Go
	 l1NhOFYJdlpUw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:24 +0100
Subject: [PATCH 08/16] ARM: configs: u8500: Enable I2C mux support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-8-451d0537d49b@kernel.org>
References: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
In-Reply-To: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
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

Enable the I2C multiplexer core for peripheral buses.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 0e7c1ccc907e..2bfe2ba8286c 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -137,6 +137,7 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
+CONFIG_I2C_MUX=y
 CONFIG_I2C_GPIO=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=y

-- 
2.56.0


