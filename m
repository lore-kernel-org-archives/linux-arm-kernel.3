Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A73C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 13:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OwwKmFkAp2J0qb4yxIUg5I9TkgocSV5eAHa3wY7fqCY=; b=aCls5w6voYQe5J
	77Dl4LtNLX0DaOK6j3Pg8FOZdhmh4TWdJp7RbLldqYi5FHgT1qJX9UFUIlPEpmnu+r74dHurDo4QC
	yhDTleJbR3g5T13stb2ixUL7xc+GBeM31thHuvnKbsqoN6vuIOo8X9Jn+KZTTaf/vgLuYpaL5w98D
	M9vj0Gr9uwiBru1W0Ekb5HLIoQ4LfEm+UHCEHkwE0nnIoaaDSh3Y1ybl3jqb0zdVKyg8VPgGZRpJj
	LDoA1KR98XeAFqNPtil/BQbgnATICMd9kl9SCHfkYNAACCvgwv2Vcx7z8HLde4WmUh3gz6Rh1WSnb
	b2s8hFl9JliuoYNlcrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk19P-00000004eoy-0LQu;
	Mon, 17 Feb 2025 13:27:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk13R-00000004dJL-0ghy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 13:20:58 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739798454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OwwKmFkAp2J0qb4yxIUg5I9TkgocSV5eAHa3wY7fqCY=;
	b=nrU3+vgAuO3eYcJhJ/xLeK7GhWTQOhJHC9lXbEUSX7onqiOBfV7nL+a0CBAOKMshioU5IU
	5unxTGhiRxTpuNwEq47+hmJt/clDHAHKo3pWBKO2Gfe4SZay9j7zdaiuO8FzN9tpm9i5Xq
	L7pNld+RbdCMstx/GlVwO5lXU/JJs32BRapLX58quEvuOVBUV7GmaX3vjZtD6Y8gtqkt0q
	KvbMY6Ixs6elHMYNdf4dBBhfw27ACGCHH6Q1OGJ8P76n6SGF6/AIscxTb3VS1e+diZLcVH
	7n7NKVD7Drz7yj6qEEp+/c7Xu2uFBp6RqFdlornt3mrKY7L7xqM2ci3j675SsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739798454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OwwKmFkAp2J0qb4yxIUg5I9TkgocSV5eAHa3wY7fqCY=;
	b=ojBYFnzMHGCI3ljD/hUOKv+fsbupD3JuAZnMzv/FTeInIKOlFOsIiJNfVy90dg3YjG+Pup
	LE5FStmyQeZAkuBw==
Subject: [PATCH 0/2] usb: Don't use %pK through printk
Date: Mon, 17 Feb 2025 14:20:50 +0100
Message-Id: <20250217-restricted-pointers-usb-v1-0-78da55158832@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALI3s2cC/x3MywqDMBBG4VeRWTtgQq2XV5EuYvzbzibKTJSC+
 O4NLr/FOScZVGA0VicpDjFZU4GrK4rfkD5gWYrJN75tvOtYYVklZiy8rZIy1Hi3mfvYOTcHPIf
 hQaXeFG/53efpdV1/Xn99c2kAAAA=
X-Change-ID: 20250217-restricted-pointers-usb-8c711bae6994
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739798454; l=880;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=S6D6f6XcQVacKxAWbsLG8Xh73igMUnfYjfS04GYSDGo=;
 b=wCRSdLbNARTGHY8b//DgQCLemBjgMNKOCCZ5RUk0+cvehKIs7PhfDCYDCHGN3CmzpmEjESL0A
 F5zRUzWoYm6BWq/GnyJjxzF1KECT658QQoHC/j3zaQUgwgKdZaCm4dV
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_052057_338730_0C2CD815 
X-CRM114-Status: UNSURE (   6.56  )
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

Restricted pointers ("%pK") are not meant to be used through printk().
It can unintentionally expose security sensitive, raw pointer values.

Use regular pointer formatting instead.

Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (2):
      usb: core: Don't use %pK through printk
      usb: dwc3: Don't use %pK through printk

 drivers/usb/core/hcd.c     | 4 ++--
 drivers/usb/core/urb.c     | 2 +-
 drivers/usb/dwc3/dwc3-st.c | 2 +-
 drivers/usb/dwc3/gadget.c  | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20250217-restricted-pointers-usb-8c711bae6994

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


