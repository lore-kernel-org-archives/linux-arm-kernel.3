Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C764C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whAn9HDt9mSKClg5hziRBkx+g8jCN8EwgeptHANy/I4=; b=iUNiFucJ65sDIfeP7J3XJLhK0F
	FIAVqhcLLQuy+l9LODqFCaGNRmeWSs/fzgfShji/tYTfaL3iEzNXu/L4w465OsG9bK2SWFuN496Ds
	Q9JZydAgID56WBxKElFpEtxwpU387Qq5s3SvydfAlbYM+jPvnqK02/F+B7p5PkO2S/iLeLup8UoYF
	rygo+Mpwr9vss3aFRJNSAExCJMbjHZn2TkdW0Uvq77xxMH5dTI3+YrQV0K5mq//M3JaA/i7fNSz1R
	Vop4b/HMjR2fMzMNemHlEzfBZ23UnyEW7i/dU1OPWcTnCMILdLXxi1y7sU+5pe9uojx+L0tayCmuv
	gtLa7rfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWgJ-0000000DPZS-01NA;
	Mon, 24 Feb 2025 11:31:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWV8-0000000DK7T-3hOL;
	Mon, 24 Feb 2025 11:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C4C15C6979;
	Mon, 24 Feb 2025 11:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EBBC4CEE8;
	Mon, 24 Feb 2025 11:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740395994;
	bh=f7BaXmA/i6cjvHiTSfCrSYaivOytH1GHzL/ySrXPPnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bphc5cVXpYOotoA7rF6mTvaYimjWjtWzTqNCwQ14guVd0Rf0rv+JsCLnKIq2RlMOq
	 zfkppt4WB2IiYvecFUPWU1CILikbUt81gw4+CmRUPwV2qaGzjfGUMruEA17cx4G8ao
	 cBKDh7wydhDgmGQawmwlj/YCZsAk6SQS4heSlFI1qDOPSHk6n49jdX7TisywwawtKL
	 i/v5cpG5ADKLOv/JZS4bRryV9tbu0p3ecLk64S7zCZqxB5zkVL+VShNJRoARdjHtlN
	 JJnnR8cIFradC3cpyB8OSITx3l765PhfeBdzlzIu/f7le41K6u77J8ZAPYDy04TBg4
	 U+tCHZ4IwbVOQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hector Martin <marcan@marcan.st>,
	Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Keith Busch <kbusch@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	j@jannau.net,
	sagi@grimberg.me,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 16/20] apple-nvme: Release power domains when probe fails
Date: Mon, 24 Feb 2025 06:19:09 -0500
Message-Id: <20250224111914.2214326-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250224111914.2214326-1-sashal@kernel.org>
References: <20250224111914.2214326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.79
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_031954_963303_D8A576F2 
X-CRM114-Status: UNSURE (   7.95  )
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

From: Hector Martin <marcan@marcan.st>

[ Upstream commit eefa72a15ea03fd009333aaa9f0e360b2578e434 ]

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/nvme/host/apple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index 396eb94376597..9b1019ee74789 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1517,6 +1517,7 @@ static struct apple_nvme *apple_nvme_alloc(struct platform_device *pdev)
 
 	return anv;
 put_dev:
+	apple_nvme_detach_genpd(anv);
 	put_device(anv->dev);
 	return ERR_PTR(ret);
 }
@@ -1545,6 +1546,7 @@ static int apple_nvme_probe(struct platform_device *pdev)
 out_uninit_ctrl:
 	nvme_uninit_ctrl(&anv->ctrl);
 	nvme_put_ctrl(&anv->ctrl);
+	apple_nvme_detach_genpd(anv);
 	return ret;
 }
 
-- 
2.39.5


