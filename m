Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3C9D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FFpEL9NcSyNwFOdBNUyHmSYnBxBxO+PAWBfQ2Qv2ozs=; b=BR7Li0DoL0IVQWR8vo+nBONbbY
	kQ9NMV+70GwFkJE2BvwO9uO+Opkp9QkkrsBtqLue/8XtGCY4FTpZpOYFdjBULY3WeNt6TIxDtun8t
	Slzx/EB5GhO4LvolRIcJKvHxmRQAVv4gQfOd3iK9X4fIXRdr53IAdm8NSZb16yPvGxwbyE7H+dQUF
	h0XOuKufMV+VGuMiY2jloNTSk8o5FGQmFu4o9EeTdw9NFwJFhcCY4ZEGidiCP/jpDi7OVTM1jT+tb
	7O068gUdvnigxmx60GaDAKyBPuhH4hyiKpVH7uwMdJM34eqFwam8ftPzfhlZj4QQfA86GwAJek5Fj
	cKsIK2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOY4a-0000000GGBU-0JIH;
	Thu, 27 Nov 2025 09:13:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOY4X-0000000GGAi-3Oep;
	Thu, 27 Nov 2025 09:13:54 +0000
X-UUID: 62dc6b4ecb7111f0a52f393f94899d25-20251127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FFpEL9NcSyNwFOdBNUyHmSYnBxBxO+PAWBfQ2Qv2ozs=;
	b=M8GMUYoBKDmecaoHHy7ky4zWU8CjUCtPxVE1rFnde6OJSyqRXOxG+tn766mTROaD63CtY5R07G421hj+yZiAj/V5PEiOInUet1Yyz3ld83rRMYhP1tB7dVgwHMHy2giZXyRw1xbwe7VpapWX5IhGco324mUhzkGSUXtvA2Y1ggs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3fd7651a-7863-4db8-a6d3-79485ce1f0f5,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:4bf29d6b-ffd0-409b-bec6-a38e02803690,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 62dc6b4ecb7111f0a52f393f94899d25-20251127
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1948472352; Thu, 27 Nov 2025 02:13:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 27 Nov 2025 17:13:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 27 Nov 2025 17:13:46 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Macpaul Lin" <macpaul.lin@mediatek.com>, "Garmin . Chang"
	<Garmin.Chang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Jian Hui Lee <jianhui.lee@canonical.com>, "Andy . Hsieh"
	<andy.hsieh@mediatek.com>, Zoran Zhan <zoran.zhan@mediatek.com>, Cyril Chao
	<Cyril.Chao@mediatek.com>, Chris-QJ Chen <chris-qj.chen@mediatek.com>, "Bear
 Wang" <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, Ramax Lo
	<ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, "MediaTek
 Chromebook Upstream" <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<Stable@vger.kernel.org>
Subject: [PATCH] clk: mediatek: set CLK_IGNORE_UNUSED to clock mt8188 adsp audio26m
Date: Thu, 27 Nov 2025 17:13:21 +0800
Message-ID: <20251127091321.2853940-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_011353_869568_A5A7FC83 
X-CRM114-Status: GOOD (  10.75  )
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

Set CLK_IGNORE_UNUSED flag to clock adsp audio26m to prevent disabling
this clock during early boot, as turning it off causes other modules
to fail probing and leads to boot failures in ARM SystemReady test cases
and the EFI boot process (on Linux Distributions, for example, debian,
openSuse, etc.). Without this flag, disabling unused clocks cannot
complete properly after adsp_audio26m is turned off.

Fixes: 0d2f2cefba64 ("clk: mediatek: Add MT8188 adsp clock support")
Cc: Stable@vger.kernel.org
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
index dcde2187d24a..b9fe66ef4f2e 100644
--- a/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
+++ b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
@@ -20,8 +20,8 @@ static const struct mtk_gate_regs adsp_audio26m_cg_regs = {
 };
 
 #define GATE_ADSP_FLAGS(_id, _name, _parent, _shift)		\
-	GATE_MTK(_id, _name, _parent, &adsp_audio26m_cg_regs, _shift,		\
-		&mtk_clk_gate_ops_no_setclr)
+	GATE_MTK_FLAGS(_id, _name, _parent, &adsp_audio26m_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_no_setclr, CLK_IGNORE_UNUSED)
 
 static const struct mtk_gate adsp_audio26m_clks[] = {
 	GATE_ADSP_FLAGS(CLK_AUDIODSP_AUDIO26M, "audiodsp_audio26m", "clk26m", 3),
-- 
2.45.2


