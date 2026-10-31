Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB39606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 17:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IdQC9nna;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c0h/Q8p9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iBtZ+8x+9hsMF2RGzIf/j7mP7lqK838eZOHrYT6mP7A=; b=IdQC9nnaadvwV6
	SWRI2qMjD8ynPhoj5V2URjoq601mUfqxAKfxG8Tr4trJKny39IFQYnd1yGJ4CJpitzm/+ICUXW8v0
	7gFyC2oG9gFXAglU8wgoiI3vUB2sBgpVPX9hXCQ5kpe6nJHIItnDMg3o1LzpVGsXwjZ9LmscJT+my
	8l+LEjrXLmwpptUrNJbCc/gSvhWDIinm/5J+aIsxAblQzMm91ZMNVCXnkm0fFou0y6CFECdh3uFPW
	S9++T2TbzocmYd9a5pcL3lmRw87FBh+B05YiwWWWBcI/ar3xH4CAizQKOZceB92w51cj2g5qk0drG
	OKxLshXsTchP7I35brrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCb7-0000000DVoN-2gTn;
	Sat, 31 Oct 2026 17:10:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCat-0000000DViZ-2YRL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 17:10:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87532609D3;
	Sat, 31 Oct 2026 17:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B58D1F00A1C;
	Sat, 31 Oct 2026 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793466614;
	bh=iBtZ+8x+9hsMF2RGzIf/j7mP7lqK838eZOHrYT6mP7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c0h/Q8p9hVCQz45IKlhRwOBJeFegWtEuxzkAp2REt55hfjLJWaE/J4WML49lNsMB0
	 KtAKXjxtIhY2vtkrs0rLwHjOY4+55AL2hbiKv0nzUdyiY6OM9LmTU4Uq+tQL3sb4J7
	 +it1SZXiOmeyVtcdSNNWbr+L2ewiTE/R7clzwqtVsYCY+wr8ZY/m2h7/69I7Y0H10S
	 T08CbVXQ1ud0hawtF9+fw3oWCCYVhpqTsbl6sNBB99aSJRMMP6fTFC06OYZoqa/M/V
	 cgC77Io/6n7op10dyf3QnET/U4FVndx8ZLgH2Kvb0q3uboaJPpm2ymTTJv2Zzk6Lm5
	 eO4HOoozWpngg==
From: Joshua Crofts <crofts@kernel.org>
Date: Sat, 31 Oct 2026 18:09:49 +0100
Subject: [PATCH 5/5] serial: uartlite: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-tty-dont-use-autosuspend-removal-v1-5-7bdadcadc4dd@kernel.org>
References: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
In-Reply-To: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Peter Korsgaard <jacmet@sunsite.dk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793466599; l=846;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=mLeFYhwf3vQCJZ2IaX6xBHLUPjV63sPKWbZxuVLBLCs=;
 b=LPGQnS3CnIiH3EjafGjL8Rzp5cjrGL2VVHmjnYrEcroAxHodSxBBYC4Aj7QxIe+yXVCKa7SBE
 F0znZV6oZq+DlZl2/6yKf82m2sBb08B09sxwIV5plLuo/dDhnfs3lgp
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
 drivers/tty/serial/uartlite.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 6240c3d4dfd7..e7e2fd2b7c59 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -898,7 +898,6 @@ static void ulite_remove(struct platform_device *pdev)
 	ulite_release(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
 /* work with hotplug and coldplug */

-- 
2.56.0


