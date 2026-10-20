Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEEA606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GGfBWUbl;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JhUQZ9PJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2A3uGIJMkHs6ITfKSp8oe4Vb62b28JTSZYQB9mlviYk=; b=GGfBWUblqX1pUSgbWNy+q1CcUx
	fwEF+x8lz1SfyX9X1ZpD7zU/9zXtiv8TSjgjUzmiIacyCXVYL04N0d4blJbzk4/axoxg1wOJc/oTA
	gapSQpU3GVrkZJLx6raj+Z+7h+3rUTPGGRUM6u74LpHPc4VBfosyycTWU/5zhGHopTOftzFAJYAMS
	0wMdGbHMIPJLqJecaMOucjO8uva2cvghxGtdYayzz5uwSKfp38rM4ntjeHKn2Z2K45XZwsyYEWctG
	bxsj0kniSUOHwXcMGl7CuVIxVohlISiLySJq1cYRGweF/Qui7aCPGqS3PRX88R6LdQF5LSQNUMx4u
	DZCd7JYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrw-00000008huy-0dqr;
	Tue, 20 Oct 2026 02:46:28 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrb-00000008hfu-0O8n;
	Tue, 20 Oct 2026 02:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2A
	3uGIJMkHs6ITfKSp8oe4Vb62b28JTSZYQB9mlviYk=; b=JhUQZ9PJebh/li4Ray
	b4EKQiPN2/5cRVWBBrSc31nJXTF+5Xw1WHfO6xrhKpYEu1HUlYTF8FKmcb5S4bBC
	jo0294juKjPd8PClVyVMtbH3w2E5GXGdwHR71C1RyF8la2APAasPBtwNcIRgRFFO
	QCbbHuJXWF82JPe03mpkuJSVw=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H9HZ1dZq2OtmBQ--.60682S6;
	Tue, 20 Oct 2026 10:45:52 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 04/11] wifi: mt76: mt7921: validate testmode query response
Date: Tue, 20 Oct 2026 10:45:36 +0800
Message-Id: <20261020024544.3101738-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024544.3101738-1-yaojiale02@163.com>
References: <20261020024544.3101738-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H9HZ1dZq2OtmBQ--.60682S6
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr15Zry5ZF4DJFWrCr4UArb_yoWkJwc_ur
	nY9r9rXr18G3ZYyr47Cw43ur9IyaykAr18ZrW5t3y5uFW7tr9rCF97Zr97GrZFgrZxZFW7
	Crn8ta48ZanIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8gzVUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgH9OGrW1eGLjAAA3F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194607_525839_F451BDE7 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The testmode query reads both response parameters without checking that
the firmware returned a complete event. A truncated response can cause
out-of-bounds reads.

Reject responses shorter than the testmode event structure.

Fixes: bce844584799 ("mt76: mt7921: introduce testmode support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/testmode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7921/testmode.c
index e60ee992edf8..ce95b0db1428 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/testmode.c
@@ -98,6 +98,10 @@ mt7921_tm_query(struct mt792x_dev *dev, struct mt7921_tm_cmd *req,
 					&cmd, sizeof(cmd), true, &skb);
 	if (ret)
 		goto out;
+	if (skb->len < sizeof(*evt)) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	evt = (struct mt7921_rftest_evt *)skb->data;
 	evt_resp->param0 = le32_to_cpu(evt->param0);
-- 
2.34.1


