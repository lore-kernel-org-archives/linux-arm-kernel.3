Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51656C4453F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tOyITwF5gA0R2Zbn4t4UuaiIFI8S3vxCcxh/8f3YKvw=; b=eAPof+lLEGteVawei6PKvS+LG8
	AzMF+H1wu983eMGSy9MBjY+KMva5B/0UCS02J8ilHP3HVYXlPd5JTWRfedPQ1psxBvA7REZpb9jKJ
	0VkZmOYrqUCcY1W9eFvB+fGcf5kkWP3EcXq5oBw/xdTWp4S8qC//VFOPIo+FdZlqX0G/pQSvoPTkN
	/BL9LaVK8FSX87cwIUU0HuoppoFthOJfdci+LDvEhS7g9P87PFXuRJwcxlI+h2gFNVvFZTxPPRv1C
	2DuZ/I7GvtRVwtegr/e7cUVESQ7gMHUHkXC4oqZaOeSkd6B+u9zpMC8o3MhGNyr1bl5+ljSJ2rTG/
	hidCJjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTAk-0000000BOMD-1Laa;
	Wed, 22 Jul 2026 09:23:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTAi-0000000BOLJ-3Bc6;
	Wed, 22 Jul 2026 09:23:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3986842AE1;
	Wed, 22 Jul 2026 09:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11FAAC19425;
	Wed, 22 Jul 2026 09:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784712204;
	bh=ddUZNX1kLnF7qdIKL+YEYld57GJfWQPqXwNv5z4AkBo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jBsIP/01lRE6GboTtRgtsIigGFaXobkEaaxCoUD1VvO0FE5JN6IkoOuOW0vGNXain
	 xH2LaHO4I+JGtwmm4zSbtokCcXMEtmin/qs6SgLrkhRxzjnqEfZbup3NGzOeZfFjOm
	 Qdo8KrVWWeUBKegGKuw4oR7SBlZW5wC4FCx89PN5j+YYRGeKFa5mJqXNCvrbU3h4Pu
	 A+fHqdB0QeyIcYJLcwGuNMuOHpRGBfUod2pNkn7S2llZY8tT+PqHLSREZrzJNEBRcv
	 TwcqWWdETLbka9I8auwj4pcoj4/Pf7BTt1/x/AAYIb8StpRYgJXi8Uc7q8pBmkTph/
	 81chgQgDdr0eg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B054AC4453C;
	Wed, 22 Jul 2026 09:23:23 +0000 (UTC)
From: Congcong Yao via B4 Relay <devnull+congcong.yao.mediatek.com@kernel.org>
Subject: [PATCH RESEND 0/2] memory: mtk-smi: add MT8189 SMI support
Date: Wed, 22 Jul 2026 17:21:56 +0800
Message-Id: <20260722-8189-smi-support-v1-0-b528a4fd878c@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALSLYGoC/yWMsQ6CQBAFf4W82k3utvDAWloLLI2FwKprIlxuw
 ZgQ/t1Ty5lkZoFJUjHsigVJXmo6Dhn8pkB3vww3Ie0zgx1vXWCm0pcV2VPJ5hjHNJEw91UQccG
 3yFlMctX3b3lCUx/rwx7nv7e5fUg3fX9Y1w89l6RQfAAAAA==
X-Change-ID: 20260722-8189-smi-support-e22d97ee071b
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Congcong Yao <congcong.yao@mediatek.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784712201; l=1079;
 i=congcong.yao@mediatek.com; s=20260722; h=from:subject:message-id;
 bh=ddUZNX1kLnF7qdIKL+YEYld57GJfWQPqXwNv5z4AkBo=;
 b=NWyWkGdp1PDyU5YCv8inrzIpaJTChYNnYiEmaEbgOWJN+uvpbI6lmPuq4TvJfF7cNJjgK3z4s
 vR3RvBYBMQfDuxwS7/N9XR++02MkwwVpGX633bQ4seBVfUEpvbQkR2h
X-Developer-Key: i=congcong.yao@mediatek.com; a=ed25519;
 pk=tIrmGxKQQxnfyb48iCCd19063tppPj89U3nupGYAIxg=
X-Endpoint-Received: by B4 Relay for congcong.yao@mediatek.com/20260722
 with auth_id=889
X-Original-From: Congcong Yao <congcong.yao@mediatek.com>
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
Reply-To: congcong.yao@mediatek.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Based on tag: next-20260629, linux-next/master

This patchset adds MT8189 SMI support.

The series updates the MediaTek SMI bindings for MT8189 and adds the
corresponding SMI common and larb support in the mtk-smi driver.

This is a resend of v3. No code changes.

Changes in v3:
- Change the minimum clock number of smi-sub-common to 3.
- Link to v2:
  https://lore.kernel.org/linux-mediatek/20260427070444.20247-1-zhengnan.chen@mediatek.com/

Signed-off-by: Congcong Yao <congcong.yao@mediatek.com>
---
Congcong Yao (2):
      memory: mtk-smi: Add mt8189 support
      dt-bindings: memory-controllers: mtk-smi: Add support for mt8189

 .../memory-controllers/mediatek,smi-common.yaml    | 18 +++++++++
 .../memory-controllers/mediatek,smi-larb.yaml      |  3 ++
 drivers/memory/mtk-smi.c                           | 44 ++++++++++++++++++++++
 3 files changed, 65 insertions(+)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-8189-smi-support-e22d97ee071b

Best regards,
--  
Congcong Yao <congcong.yao@mediatek.com>



