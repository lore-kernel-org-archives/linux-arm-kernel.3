Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D929AC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04rpi8Qi0ASHQrqKFAWwcdZ+O/U1M86p5o7kV03aHOQ=; b=U+aWe66pvCgnaxNemoopFQr271
	lxpGJqS/7ZVF1/tFaA87JYlF35zXIXzm3gEG0k2KutnZUSzWhZrRdoKNSH8fwYh3mh8rgdBijQfg3
	iO0lrQc0AieWtielkk1SwVpz6XDxSRE5Ac+sL9AXVCECwU7jJpizTkQJXzkqcXlS0zY6ZW5cdhhdh
	f8q1okouNpHwPi97rz/6ER0WqcRQxHxSEbAObBdOGIyyPpPNk5AArSTFcTgZH7N3zi5hfqFVsI5+P
	E4TbIE40nAuZZgAKflnHLXGhV1uPbBLRahVGE52DMoAUHEY/eiUMW8SfUWrQaahP6EdkdyZHdAucB
	vi0Z5bEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU78-0000000BXhY-2jBH;
	Wed, 22 Jul 2026 10:23:46 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU76-0000000BXfJ-1nUP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 10:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715819; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a+ppJtpyAATcCXU3G/xQl9DMxrcl1gkAlSh56EZ72Mol1bjLALaDa3jQSbG5XHons
	 ZOLc65wXl2ksd58VogQ0DEv5Jhbs/DNAAgD5od+bCs4Z++hYekZTsvOOk6F3yR40V9
	 184JLGyS5F7C6RigdI1ZNBrkpeBvHwLNIjRJ1TIqWVb49JcE2R8gHlFcAKWprNVsp6
	 DUf5oXk+y0IptKnyjcGO6s3qcijjGX8eXtXCYa2D2lDKDp+zJvvz5lLFZxft+nswF2
	 D8BSuHsh1vlFyo7WaeZICleToJbrpgY+UAXBD2/h5cYJZtn2egslW1LFlccwYZOu5N
	 2JUeJeQJS/4MA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 8C0E142530; Wed, 22 Jul 2026 11:23:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715818; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uv2FKRFT84ykdKx7onLLSFTGseJbNEemYGtWO+rOyasrKPrnWmQMAdrYVvhXq0ZNx
	 pQ85hOrm9R2FigNnlnekCma9uR1rl/MjaBsHQ7eDL7a4NXvE+At+/MhuCJIItC5hdX
	 0HNuWSjKRxyGHc93YXKf/YZ2VIU4h5Ug0/f8t/r92u/kfXNjeW7StJztyptjttCzRx
	 kP0iiW9C4oVsY5ub4bY3PykIaKMRa3BwrwcZ0G3ZafuTLMbo5i0JSvE1+LPA5ZBKq+
	 vWb4JwcuhyekZ3rleVemrKwscQ0Y3wHBtAgngJ0Ol0qAi0+60AuNBYp1y7cvkQNR0U
	 QsqmOC9ssDEcg==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 6F0C042526;
	Wed, 22 Jul 2026 11:23:38 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/13] media: sunxi-cir: Ensure no more interrupts can occur before free
Date: Wed, 22 Jul 2026 11:23:18 +0100
Message-ID: <d16aa75a7f94678499b37e45a5215f231658e0b0.1784715737.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_032344_612720_73B4E802 
X-CRM114-Status: GOOD (  13.35  )
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

Only call rc_free_device() once the hardware has been stopped.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/sunxi-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 28e840a7e5b8..af1ee08ffdbe 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -374,8 +374,8 @@ static void sunxi_ir_remove(struct platform_device *pdev)
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	rc_unregister_device(ir->rc);
-	rc_free_device(ir->rc);
 	sunxi_ir_hw_exit(&pdev->dev);
+	rc_free_device(ir->rc);
 }
 
 static void sunxi_ir_shutdown(struct platform_device *pdev)
-- 
2.55.0


