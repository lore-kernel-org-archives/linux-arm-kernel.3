Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C6ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 02:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BVjtQxRr4Em1qccmrXpR3PPL5QbXoRMY7Rprht5+Ncg=; b=neR55plJXd/6Lv/tciHLONmMY9
	AbfsX02kUBVr7XMfIPvwQ5hZoikGMkvRvI9EO5PdCVY/vyf8ApE9hW1QVfbwbAuywhM0KxKHP+cTk
	lMFwtHZh9cmqpJrf4cQtMbdzyBpjfG7buWhlFs2OcWnAzY8bkvtGNzmyiSw9jsSObqI95WLrM2NVj
	Cg3G5nm/+xiMMj+vbU/P3eKxYJGQU1sXOoaobLFj5Jdr+DDj7tv6LJse8OilqYAmFD7f/CfYUcWpo
	WC/aYh1UiFvO7L8J2ETOR98TGcBSQExNZ+MwtstKe/zRsY6iyfanIIEGQRm32WESGRTFRcW8TKbrx
	eP7E/9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHCUC-0000000Gade-1w49;
	Fri, 07 Nov 2025 02:46:00 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHCU9-0000000GadG-2wlB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 02:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=BVjtQxRr4Em1qccmrXpR3PPL5QbXoRMY7Rprht5+Ncg=;
	b=R1YWm3WyNBcbXHAqVIYbSvtH/J7qXz9LDeD9Dja86Crdz7p9+Ub4ilxDxHw70D
	pNwvOCzSY/8I8hmGCwn4z/x56nIWYmh01gAIv+MUkPfWYvNLrZdbS2aXmUolr6oH
	nf6/qFaYJVBPxLKI21IwO9ae1Bmr3xVe52HDO2iwiNbW8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD33z1HXQ1pfrTkCA--.1006S2;
	Fri, 07 Nov 2025 10:45:28 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2] ALSA: au88x0: Fix array bounds warning in EQ drivers
Date: Fri,  7 Nov 2025 10:45:25 +0800
Message-Id: <20251107024525.38454-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD33z1HXQ1pfrTkCA--.1006S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF47JryDCrW7Cry8tr1kKrg_yoW8Wryxpr
	Z3Cwn7ArWUJrsrCwnYqa1UZa4UJFs8XFW8Aa12kws7Cws8JFWUGr98C3yDJw4IvrZxCF1F
	gFW7Xw13J3Z8JaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYApnUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwAgHVmkNXUhQjgAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_184558_179969_5AB63677 
X-CRM114-Status: GOOD (  11.15  )
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

From: wangdicheng <wangdicheng@kylinos.cn>

In file included from ../sound/pci/au88x0/au8830.c:15:
In function ‘vortex_Eqlzr_SetAllBandsFromActiveCoeffSet’,
../sound/pci/au88x0/au88x0_eq.c:571:9: error: ‘vortex_EqHw_SetRightGainsTarget’ reading 2 bytes from a region of size 0 [-Werror=stringop-overread]
	vortex_EqHw_SetRightGainsTarget(vortex, &(eq->this130[eq->this10]));

Modified the array access in vortex_Eqlzr_SetAllBandsFromActiveCoeffSet() to use pointer arithmetic instead of array indexing.
This resolves a compiler warning that incorrectly flagged a buffer overread when accessing the EQ gain array.
The this130 array has fixed size 20 and the index is safely within bounds, making the original code correct but confusing to static analysis.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---

v1->v2:
-Align both From and Signed-off-by addresses

 sound/pci/au88x0/au88x0_eq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/au88x0/au88x0_eq.c b/sound/pci/au88x0/au88x0_eq.c
index 71c13100d7ef..81a63b5bb31c 100644
--- a/sound/pci/au88x0/au88x0_eq.c
+++ b/sound/pci/au88x0/au88x0_eq.c
@@ -568,7 +568,7 @@ static int vortex_Eqlzr_SetAllBandsFromActiveCoeffSet(vortex_t * vortex)
 	eqlzr_t *eq = &(vortex->eq);
 
 	vortex_EqHw_SetLeftGainsTarget(vortex, eq->this130);
-	vortex_EqHw_SetRightGainsTarget(vortex, &(eq->this130[eq->this10]));
+	vortex_EqHw_SetRightGainsTarget(vortex, eq->this130 + eq->this10);
 
 	return 0;
 }
-- 
2.25.1


