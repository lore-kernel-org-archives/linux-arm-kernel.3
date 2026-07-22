Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D800DC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/L0EEWlD/DcdfcxCfCAtHF82jai0TGxC5F+nIJ0vii4=; b=F2YUY02XYvmegpSIaOaSLhwZG1
	6evzWcvVKxgxGMg/nXpum0Wx7raxR54Z7PVbz08WkrEi3MrYrRE71l7SzGepwWRuDFmaHH+Fxhwf0
	08LXYsRJlbGjK7Wj2IWOGh1GZMKGVPMzNjRxsTaFkWniKrRnz9KdE7L4mV+I0HWO+4RfWgM9NtPsH
	G/gOxjROHEzt3HuzAmd6OG7F/iCWGrimY3OEUknhXY5uIsu3zpZ3j+aeA8mUd7z59/FJYUqhJxsHj
	eZhXBxS9eW4UPmA2fqldBSRYD8ethZcK6+e82WXTmS0RY7bqPBmRIow7pOVUroqVEl8KGJn+4uRsz
	AYFDP3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVij-0000000BhZn-2t5L;
	Wed, 22 Jul 2026 12:06:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVii-0000000BhZG-1Q4G;
	Wed, 22 Jul 2026 12:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF67D4063B;
	Wed, 22 Jul 2026 12:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93AC5C19425;
	Wed, 22 Jul 2026 12:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784721999;
	bh=7xNjyyJHcIIbAta7PdSl/iTJSUHe53qhyhTm8L5BFTs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=AuentVCr/r/SuaHPqtKgzC+DSfosg88U9BwS7Y+bUA7HrZMwtdk5NvbPzigP752Z/
	 kK6Fd7S3XWv3AE6EjHBl4PW/ij0QbehSj6CWPDf5zv9hDyzVPMXq+9c9P2UMtvkJaS
	 aFNeVuQPxw3ZguNkJvoTwUOJW9+Wz6wzdUw9d05w38Ney8b5XXef5yHfnYLgVELNuW
	 LeH/jyN0YmcaivgmMjEahEqhGlxCOeLhYrQrrzOvqDnj+52eQTNAZn4pSOS3lupvQ3
	 gS1wjgubhMu+Rxed6TL78OubHqGl3FX7/i1sWosKUXiIC67bWlecgXjOc3vDY5riZq
	 wFLwNd5ehOiNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62875C44532;
	Wed, 22 Jul 2026 12:06:39 +0000 (UTC)
From: Congcong Yao via B4 Relay <devnull+congcong.yao.mediatek.com@kernel.org>
Subject: [PATCH RESEND v3 0/2] memory: mtk-smi: add MT8189 SMI support
Date: Wed, 22 Jul 2026 20:02:42 +0800
Message-Id: <20260722-8189-smi-support-v3-0-ae00e13deeac@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGKxYGoC/3WNPQ+CMBRF/4p5szVt/WhxcpDVQUfDAO1DngZK2
 kI0hP8u4Ox4b849d4CAnjDAcTWAx54CuWYK2/UKTJU3D2RkpwySywNXUjItdMJCTSx0bet8ZCi
 lTRQiV6KAadZ6LOm9KO9wTW/p5QzZrw9d8UQTZ99MVhSi85/luxcL//+mF4yzYi91viutVtqca
 rSUR3xtjKshG8fxC6I+Cx7NAAAA
X-Change-ID: 20260722-8189-smi-support-e22d97ee071b
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Congcong Yao <congcong.yao@mediatek.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784721998; l=1151;
 i=congcong.yao@mediatek.com; s=20260722; h=from:subject:message-id;
 bh=7xNjyyJHcIIbAta7PdSl/iTJSUHe53qhyhTm8L5BFTs=;
 b=/yVGxiVm7c2FmPvaazWIztBy3My9KyhM7cYO1UDfHIEDmzDJQ/bPMGCZwfwTJ/S/f9GmXlNv5
 EkECw5hf+gHB1gxrvgkg+gD4cJwU26G0jqenaHLd5OT3V1kGXNkXTb9
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

This is a resend of v3 because the previous submission was sent with the
wrong version number. No code changes.

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



