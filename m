Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B286606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=prE8vBlG;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgDXR5r8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rwgOuZt3/daKJP7MDhwWg9Xwq6IOExj4eF3w/XLEjcI=; b=prE8vBlG6rBWHYOPquOl8Xl0Ax
	kT1h4W4kQBRr3vHAEM7Iwck4wEYNVquLUpl/j++/XVzj4Jy9xmP2HEYN8oWJDZcVH8op3936KwU3P
	oE0HMYgNgwZ+G41XUzEai1Nm9pEyVmssbru6vW9RSyxVR1i6L6fYmlw5i8kcJw9tqXddaqdCTXjsh
	todrGNU1zVwVXDS76vhKXsZJWCyMnfQ9suUkMhwlD5f4BUoNe3p0GJvlXCCLfoTtMeNIRhQ7DVsum
	HxJcxbp85PDl/PCPJz8cbDUo6+A/84ARp4iSHXha2H6AJEmE8uhZ8YPfdlRt8RKrZD2GwvkLuDJ9v
	mUQdf46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCaj-0000000DVev-0Elm;
	Sat, 31 Oct 2026 17:10:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCah-0000000DVei-2uKc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 17:10:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D12EB6061D;
	Sat, 31 Oct 2026 17:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FB31F000C1;
	Sat, 31 Oct 2026 17:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793466601;
	bh=rwgOuZt3/daKJP7MDhwWg9Xwq6IOExj4eF3w/XLEjcI=;
	h=From:Subject:Date:To:Cc;
	b=DgDXR5r8uhoVW7rNG1/mUea4nbNWPx3W7h9kGOxAutQWk/LgQcYM7jMxtI4ybU5z4
	 /VXY0Vc3/xUC4zmUsi2tyuLIuqHNG8fD0fu92wb2ksBVDhgo4x0Eq8AEYzt0l3ugdu
	 JhbD9+fAq5zhMzHcMB0lATI8fAHagVmjja8m8MYinnDL/+vv66DJu100jkfbkH+SrZ
	 fSN98XEcY8flO07fTzoLAL2IikYASnTV5/ytWZB+2nFdQQOix5XUmdooHdMvB4DsTj
	 6VEKODdjgl2kb/ZSRAScUfNhNeLRkowbvy0z78dYFTI27GFlHfZyg/p1pbOrjNhpgZ
	 ilEVZ/THNJyiA==
From: Joshua Crofts <crofts@kernel.org>
Subject: [PATCH 0/5] tty: serial: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Date: Sat, 31 Oct 2026 18:09:44 +0100
Message-Id: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQrCMBBG4auUWTvQiVLFq4iLmPzqgCYlkxSl9
 O4Gl9/mvZUMRWF0HlYqWNQ0pw7ZDRSePj3AGrvJjW6ScS9c65djTpWbgX2r2ZrNSJEL3nnxL8b
 JyS0IwuE4Uc/MBXf9/BeX67b9AE/dmkZyAAAA
X-Change-ID: 20261031-tty-dont-use-autosuspend-removal-e821bc1ec476
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Peter Korsgaard <jacmet@sunsite.dk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793466599; l=1149;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=2SRCu0EHsDqsQ6XggGun3l8mT6gihtWOiO8PI8Na/OI=;
 b=GJ7+wDp1zdB9c844WCb+h+JMrXpw5Q//cyIE8FCrJ/Xud+6N0TPvu17+EryGgO16JKE8QJDjT
 rt5UknaSnZnBGaaEkKSgawxPZKnBY/i7jBXMJIxlAoYyLtMwvcwnoBX
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=
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

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
Joshua Crofts (5):
      serial: 8250_omap: remove redunant pm_runtime_dont_use_autosuspend() calls
      serial: fsl_lpuart: remove redundant pm_runtime_dont_use_autosuspend() calls
      serial: xilinx_uartps: remove redundant pm_runtime_dont_use_autosuspend() calls
      serial: port: remove redundant pm_runtime_dont_use_autosuspend() calls
      serial: uartlite: remove redundant pm_runtime_dont_use_autosuspend() calls

 drivers/tty/serial/8250/8250_omap.c | 2 --
 drivers/tty/serial/fsl_lpuart.c     | 2 --
 drivers/tty/serial/serial_port.c    | 1 -
 drivers/tty/serial/uartlite.c       | 1 -
 drivers/tty/serial/xilinx_uartps.c  | 2 --
 5 files changed, 8 deletions(-)
---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261031-tty-dont-use-autosuspend-removal-e821bc1ec476

Best regards,
-- 
Joshua Crofts


