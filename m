Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B499EFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/JL70GXKn5s+hfezfz9Rkgqv8RBnS7tjEj5remHa41A=; b=Wcl9Q4qF0Xo0t5W97/65Fh6LYY
	4LHEne4+6Pibn3qfsHhNORM7b6G3HvRcUHqcqtlmBz4F/U173PLJraQuNdIXABrM8M7/bUr6ePcU+
	864LqVNeqjZF8Fp3cw6u/bvD2U4Gryx1MqHX85XX+NrDqunijwRVwkSug0lyFFOxHbHt++oARdyC4
	Ho+C8kEEizcZAH9AMN50BNErOcubQ/shArF+0/3hS0tuyMUHos0Qf6KnJhLYsdW/Udnn9RsEVR4/f
	mgPcCm2GySXofOjP0HkZ+oitxchx2sc5arpYy90+IGCWTK81tFiWgOVZiTNeN2rYT4xkwnGpsWdmJ
	we0QB9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyvh-0000000376W-34Nd;
	Wed, 29 Apr 2026 07:01:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyvg-00000003760-25lA;
	Wed, 29 Apr 2026 07:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/JL70GXKn5s+hfezfz9Rkgqv8RBnS7tjEj5remHa41A=; b=E0tArqkCNwxoDZ8HXunxFfdUOo
	wgcj8VMe4+Kwa3bm0Oq9aLjD8LOn6ngluizlhBN18qLst4X4FA9p4RwhwqBlmv+Cl/IlFByzeoToR
	+1YDijfWIMaJxSMRQ2clerA0Jt82eBSv3b1Up3O3NiVUWOunk61GB3gNTzpRGKfRlkqrLg8lGaY2U
	sf+Oz8xcriAvdZl3gZ/fewuErQOHtMdqPzHT2quTLnmpQzC5Zb8+hAxivtA2m/BLgx3rhgdlcxYy+
	F9ZpCzqaDLYa5WkPSmAE4I+YmdBojlGmKomWVPkaLKdr4QDGOqeED+qfgM4ifjay4NknMeWUPEaf7
	0LGyqvrg==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyvU-00000004iVS-2aVX;
	Wed, 29 Apr 2026 07:01:50 +0000
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-03 (Coremail) with SMTP id rQCowADX+N_ArPFpIhWJDw--.271S2;
	Wed, 29 Apr 2026 15:01:20 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	p.zabel@pengutronix.de,
	benjamin.gaignard@collabora.com,
	xiaoyong.lu@mediatek.com,
	mingjia.zhang@mediatek.com,
	nicolas@ndufresne.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: mediatek: vcodec: free working buf in vdec_vp9_slice_setup_single()
Date: Wed, 29 Apr 2026 15:01:19 +0800
Message-Id: <20260429070119.181876-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADX+N_ArPFpIhWJDw--.271S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWxKw15Cr4kCw47WrWfXwb_yoW8WrWfpF
	s0krWUZFyjyFnFva18Ja1xuayrC3ySvryxWw4a9w1Yyr98tr4xXryIyFya9F4UCrn2ka48
	ur1qqry8WFW3Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0pRiSdgUUUUU=
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBgsME2nxk7Bl3QAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_080142_113999_37F8DEA7 
X-CRM114-Status: UNSURE (   8.92  )
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

Add an error path label in vdec_vp9_slice_setup_single()
and call vdec_vp9_slice_free_working_buffer() to free
working buffer.

Fixes: b0f407c19648 ("media: mediatek: vcodec: add vp9 decoder driver for mt8186")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
Changes in v2:
 - Remove vdec_vp9_slice_setup_prob_buffer()'s return
   value, since it never fails. Thanks, Nicolas!
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index cd1935014d76..d034d84ad7f1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1808,17 +1808,16 @@ static int vdec_vp9_slice_setup_single(struct vdec_vp9_slice_instance *instance,
 
 	vdec_vp9_slice_setup_single_buffer(instance, pfc, vsi, bs, fb);
 	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
-
-	ret = vdec_vp9_slice_setup_prob_buffer(instance, vsi);
-	if (ret)
-		goto err;
+	vdec_vp9_slice_setup_prob_buffer(instance, vsi);
 
 	ret = vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
 	if (ret)
-		goto err;
+		goto alloc_err;
 
 	return 0;
 
+alloc_err:
+	vdec_vp9_slice_free_working_buffer(instance);
 err:
 	return ret;
 }
-- 
2.25.1


