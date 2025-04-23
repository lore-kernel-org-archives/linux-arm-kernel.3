Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EC8C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4fBjY+JS+i/AM3UxHubpvXPCnaUtBYz7O9TpCe/+80=; b=LFkLSrxWOAyPKKIFSnI/aotP/J
	vgkIwsBGrDhjeeJnw8O/pkNZg7ZCEB36TLHw17Fb5JJWVmHXJ26mcRZMzPkxixcgyIrW97v8hUNCy
	+aJEuWX27JdgwVFxyMWfV0n5NB8lIlhft3NW0v8d/C/t4uNgdk1joXGVs0+UhekT2gTc0pmL2RQ1h
	oNqNnpABcJFbT3TmQtzmv36MlsNMwmUEIMK+8AEIMWvqJREJ6i2j6VJckTQaAPOTHhmgoCw9PquRw
	E/I1FpRWFvKIpcocbyUUK0WSdkkSgt78c+jdBnGpqnbiyDoRy7YXQmc3dCdozr48ge0AN5d2wVXU4
	ewn/ajMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7g7W-0000000BpsW-2Dsm;
	Wed, 23 Apr 2025 19:50:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fzb-0000000BoQy-3tDW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:42:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0272244E7B;
	Wed, 23 Apr 2025 19:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400B0C4CEE8;
	Wed, 23 Apr 2025 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745437367;
	bh=F3azllxUB00Zjj+oyESkLHmmdJpPPIUF3Md9fl4CSXY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qyjGsfeKW2GqcFpbWB3Kb7mvyy2Xoq+aQoDh1c/CoCcOoFyHg28t1qqkV0fIPJCkH
	 4OUZ6PRJoqEgjXGexarz0xJp7gH73jzW4MhyuWTN89MBqcBul7aqBEa3pSsZwfBGIM
	 +HcPAhQVvU3iYoVDTo4bVvwNjY9dsBEcSppmkUBTA/zD48tTfHCjdOxDh3faN8Pu+H
	 7SZ8MFljQ0ztYHcPBYFW5zKWJ5rhQh5b5aSyGJAPacb1vt0bbfu9VUWeaVn9ENoE25
	 ZoZUWC5DLuCnZ49Vi9akP16BmfWUWfTqrfZPBUSr8cvm5n2x1C7QSTmTZTWlQbcQfs
	 RlVvMmkZSPanw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 23 Apr 2025 14:42:15 -0500
Subject: [PATCH v2 3/4] devres: Export devm_ioremap_resource_wc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-dt-memory-region-v2-v2-3-2fbd6ebd3c88@kernel.org>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
To: Saravana Kannan <saravanak@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_124247_990914_B45CF837 
X-CRM114-Status: UNSURE (   8.13  )
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

devm_ioremap_resource_wc() is not exported, so add one.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - New patch
---
 lib/devres.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/devres.c b/lib/devres.c
index 73901160197e..378b07730420 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -206,6 +206,7 @@ void __iomem *devm_ioremap_resource_wc(struct device *dev,
 {
 	return __devm_ioremap_resource(dev, res, DEVM_IOREMAP_WC);
 }
+EXPORT_SYMBOL(devm_ioremap_resource_wc);
 
 /*
  * devm_of_iomap - Requests a resource and maps the memory mapped IO

-- 
2.47.2


