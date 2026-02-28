Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D1C1048924
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPEh3zztA7YgJb9ba/eJtCr9uFxiaZIfC4av1XaSlvI=; b=C2gnufixkhfB57uaQsZHRVy80s
	ixk+hYL/NCcLUkk5mwxUw0Nx2wpzD0JwgB8mR+qEqjbnmTgOU+lN5xV5J5nQA48S4bx7TDCeikRut
	cWSTY6AfHfIszRYo3GKmDjUPucJ7G5xDDyEwE/0ZHdB8JYPxiD7TYT3o3g2sVAh+j5A0OLMIYxhdA
	rxS7OyFxPlKlZYVVgkicYHVCyj/9goAHiJd8CUOIe5NluRElR80xY9lZqZ9QKJsaxHq5Ae1tQVhTf
	LtO6e5B8BOPWY5uA8hICZOp10xVlFBQoikNxqz5wmmOXX7BP0qxEr5Ht10+Qm1hX0L4y791QCaeW3
	sXv7seyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qA-00000009IK6-43H3;
	Sat, 28 Feb 2026 00:05:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qA-00000009IJR-0Kx5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:05:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B1BB6132B;
	Sat, 28 Feb 2026 00:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA00C116C6;
	Sat, 28 Feb 2026 00:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772237148;
	bh=QQUUYYwURbACdUIdjrLHGvnuoEjtWjpzzgCNWpWSbAM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k814RJnVMTNgh1HtpRNEA3slhlQ00EMFmeKrS4XdH+jHqiHaRdjDgZwFELJ2pvhX/
	 IFzcKaDARylZbdKahLNFgCCB+gC6MFL6BypDObfiHs0Jfx4xYMttFehAtQhnVq8Z4L
	 Ipl/oNuYh4J7VZ24UfDFtfwlBF5n7Mt8fjoa4OhSqQT9Tqa7jE/MNtRra7qxdtvGD0
	 I1Gp1BtLEhO/BFm7jV068KbM1QYUoOJB0mlx6zEccDgzvkLLBkVbEmjzvj7bmhv9py
	 IW+3ysSa1pnPaQX1V5Dn+UhE1oY4qYGDkVyUFyF18kXz+wddeaF8pE4TvGiRgMVwUq
	 fzBTiJUgc1hwQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Feb 2026 01:05:41 +0100
Subject: [PATCH 1/8] ARM: dts: gemini: iTian SQ201 need to boot from
 mtdblock3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-gemini-dts-fixes-v1-1-0c6f6d0fb4bd@kernel.org>
References: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
In-Reply-To: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Alter the rootfs partition to the one actually used for the
rootfs.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/gemini/gemini-sq201.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/gemini/gemini-sq201.dts b/arch/arm/boot/dts/gemini/gemini-sq201.dts
index f8c6f6e5cdea..fb6959324658 100644
--- a/arch/arm/boot/dts/gemini/gemini-sq201.dts
+++ b/arch/arm/boot/dts/gemini/gemini-sq201.dts
@@ -20,7 +20,7 @@ memory@0 { /* 128 MB */
 	};
 
 	chosen {
-		bootargs = "console=ttyS0,115200n8 root=/dev/mtdblock2 rw rootfstype=squashfs,jffs2 rootwait";
+		bootargs = "console=ttyS0,115200n8 root=/dev/mtdblock3 rw rootfstype=squashfs,jffs2 rootwait";
 		stdout-path = &uart0;
 	};
 

-- 
2.53.0


