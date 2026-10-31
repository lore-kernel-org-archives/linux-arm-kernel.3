Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF27606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eR7wmVe3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zu9SzP/y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4CTsh8nxRb2X8cmU0Jey+Z5jlVLC75ufMhXQQJivyZE=; b=eR7wmVe3eI3L+o
	g5CjgdunWgUe209NnyR0k5Ei6kFKTGCnU4TZ+0OGpzDdxj6cqniyOtSuwUOvfdJhQDeb1xZg+pnQr
	WFzD8v3juJiL4dS3uicrNFEyKhpYLQycps08IuCJmXpBAF9tFBbbpI4f1/x2tuW3zOy505VQ8fbU8
	u00xtDmtt16I71jlAniNgRCrUUc2tDGh5bgloD3CoHCyQGwRAd3ET2Rd8wIAyRSt6ImWJwqa2+JNh
	AUwS/DUO2hT9l5s29/WYyujc6F3VH9Wm/p3ZVHytIqgDWnmxq0/vp9T8jcTyNxd0DLZEgbGwoJw2u
	3ra3xLXYkP5cgGydQMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCb7-0000000DVo3-2JVK;
	Sat, 31 Oct 2026 17:10:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCaq-0000000DVgI-1LOd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 17:10:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDFF36061D;
	Sat, 31 Oct 2026 17:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6427B1F00919;
	Sat, 31 Oct 2026 17:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793466611;
	bh=4CTsh8nxRb2X8cmU0Jey+Z5jlVLC75ufMhXQQJivyZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Zu9SzP/yYkVsnWGjkdYeUtFV57hncxTNx9UJ1zyn3xkJoHjHGeG8wDehR2anIgzj0
	 O3/z6kmk0opv/5EafMBzS6mfO7rQZWdGFBCdRWADeIb8BwuigUsqTK3BCuIRPXca42
	 NgC9sc4/BZB8VJaIGtIdE3NAkYWr+XRPQQ1jXYw+J4dBZKfd05mOpflgrcITXYL94b
	 KMlRZ6VDuUkaOz0zmolnATIxT9Pa/5HXCxttPpDT23HlfXris8f9qihhK7TW32oBRw
	 OLoHnESlP8hqx5uub0YyWAJtUTfmhh1td+zHKWoMccvggBOp3eABqTcyEtuOJ7SnKt
	 DPDpQFLAOgD5g==
From: Joshua Crofts <crofts@kernel.org>
Date: Sat, 31 Oct 2026 18:09:48 +0100
Subject: [PATCH 4/5] serial: port: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-tty-dont-use-autosuspend-removal-v1-4-7bdadcadc4dd@kernel.org>
References: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
In-Reply-To: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Peter Korsgaard <jacmet@sunsite.dk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793466599; l=799;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=0iA/K3T9xMXKK/WgdINwoyl/ULJr7C+Mzbqd5roxlfc=;
 b=pAcAxURFQmxpy8S9dcqOibIvP6niVBuKh3MMhpiovRL+x++aHTN/z1TBDmkQpIQz18aZzg2Jd
 zm8F4ICi7hEBu4C4Rok/VOcEQS/C9Sk5dKGH9Ga+bYH6qExqHGLgpAb
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

Remove the redundant function call.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/tty/serial/serial_port.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/serial/serial_port.c b/drivers/tty/serial/serial_port.c
index 2fc48cd63f6c..c6243b8fd58a 100644
--- a/drivers/tty/serial/serial_port.c
+++ b/drivers/tty/serial/serial_port.c
@@ -128,7 +128,6 @@ static int serial_port_probe(struct device *dev)
 
 static int serial_port_remove(struct device *dev)
 {
-	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
 	return 0;

-- 
2.56.0


