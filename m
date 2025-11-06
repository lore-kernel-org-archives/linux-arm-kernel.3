Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7911ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 06:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1QSw+y5HT3TcUyd3F/MxUjly0CwHD5TKPc20p//UxFU=; b=GQjQs1Yf0UvI7aZUiokMcYWgZ1
	b7FfnJDWXI9zxX3X8kl65+rpOWhyjnigUk/fVZoOZeiE8tdPbbe2p9nqw66ZY8Ss1ivsha7mUnAsP
	6u3J3vX8olsWfg3fBmDf+vLT/8eWEGp2YN/md/mupyqlmapf3GXdWUn8XvuzSLnbzKQbYe6V1PxNh
	w7o1IV7h/Gj8nkQZ28cwQBCHBxLWdNOo1MDOWP4TkN2Mf7vJVK0flFbpm5Yp2175uZ5SAhDxJC07C
	j0zLO905hpgJ9LvpeQs2Vbkfa91bMGJDTXyNNDiF/8qHSNiPyqQ81pMZBGn5usVKlH1d84N14salI
	qNa9lkbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtZK-0000000EwmT-1zwb;
	Thu, 06 Nov 2025 06:34:02 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtZH-0000000Ewm6-36bV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 06:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=1QSw+y5HT3TcUyd3F/MxUjly0CwHD5TKPc20p//UxFU=;
	b=LczhEutbWhnRAhZdt07+G3NJC4N8E2OK6xesEjD+hiUQ/+J+gMoSaxw9XSZxXB
	2q5eSubM7NTO40N35Od9PJms8Ok/YxVgiBuHbDIjZPJcF7lm+yC0pGKzUb5vN6aA
	RnR5ipNKuPw5eUKVWdc1qRNYRU+MkHRSIskuYoJQ9rmw0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCHRAJFQQxpjDa9Bg--.91S2;
	Thu, 06 Nov 2025 14:33:42 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: au88x0: Fix array bounds warning in EQ drivers
Date: Thu,  6 Nov 2025 14:33:39 +0800
Message-Id: <20251106063339.114596-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHRAJFQQxpjDa9Bg--.91S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF47JryDCrW7Cry8tr1kKrg_yoW8XFWfpr
	Z3C3s7ArWUJrsrCwnYva1UZ34UJFs8XayxAa12kws7Cws8JFWUGr90k3yDJw4IvrZxCF1F
	9FW7Xw13J3Z8JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piUPE3UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbibhj9T2kMMt8qKgABsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_223400_195781_E74F3C4F 
X-CRM114-Status: GOOD (  11.96  )
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

From: wangdicheng <wangdich9700@163.com>

In file included from ../sound/pci/au88x0/au8830.c:15:
In function ‘vortex_Eqlzr_SetAllBandsFromActiveCoeffSet’,
../sound/pci/au88x0/au88x0_eq.c:571:9: error: ‘vortex_EqHw_SetRightGainsTarget’ reading 2 bytes from a region of size 0 [-Werror=stringop-overread]
	vortex_EqHw_SetRightGainsTarget(vortex, &(eq->this130[eq->this10]));

Modified the array access in vortex_Eqlzr_SetAllBandsFromActiveCoeffSet() to use pointer arithmetic instead of array indexing.
This resolves a compiler warning that incorrectly flagged a buffer overread when accessing the EQ gain array.
The this130 array has fixed size 20 and the index is safely within bounds, making the original code correct but confusing to static analysis.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
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


