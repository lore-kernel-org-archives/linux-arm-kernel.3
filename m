Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CA1D2E9F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 13:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aySs7bPSbKHWLCsqe0IIm6YT4GwJ1SdufWSYkYaSwbI=; b=0HYvMBs29bCvLfeljs18Z1EpQR
	sYR1QEI+pe6wUTV3jTnpjq9c4bghFF+1D/cWYDbF2F532XRyVph3igv+ikoq9wELuDbAW8mfhLUwO
	+FF4ojqKREJfeN3ecfT01x+ALzBxUWgpV1aeMxxZ0lGGtGPrcSwcQDKPhfApnQQpu4pUcqjYbzX93
	BYD+X4s+dka8lO6fRIMhD/gdkpUZEc1eKz7Vc7t50OASi0k618G3VZYUitdXhfbGHqztRU+zyrcAP
	R5jMP0ZKZtV0wDz+pP+X6oWC5PV8EyOGhnAyEZ9IjCFiKowmc3dy6r6PoxskfwvpbspdkxRPYBEpW
	MRm9Pghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUh1-00000000Coi-48of;
	Mon, 11 Nov 2024 13:43:00 +0000
Received: from smtp-25.smtpout.orange.fr ([80.12.242.25] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUew-00000000CSG-2Eo4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 13:40:53 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id AUeotDgOMjazzAUeotYuEf; Mon, 11 Nov 2024 14:40:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731332445;
	bh=aySs7bPSbKHWLCsqe0IIm6YT4GwJ1SdufWSYkYaSwbI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=O8PY86N9o1YxVmAvOi+EPQ182u26D9pzzm1S1y6qWETG6+O2hE66wviD3oAwa2Gt6
	 9nIIMvC4ADzLn1TvnNYhVDo//mJuQAavXJjQC6yx1YZjwPgmeVckyMGIMtLCLyVh25
	 3iHLtI2DuUTMNTE5pt4ejl8e/Fwe4XPqrmKXA+agqkg2S+0uIO4dhvkaxH3VwA2X/M
	 RumGr+FGQoTQ6ePSEu5YlXfHNydANZ+b0jeS/GU14Twiu4J8nLBOAruIITf/XiHhxo
	 SDj8578AqRNmy7e4E2VJ4OK5xTwtsHVtDGINf+5TS3aWJI9Q3Z4W7h+nr9KyDCuuq7
	 bbGJtXZuY83ig==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 11 Nov 2024 14:40:45 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Kalle Valo <kvalo@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-wireless@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] wlcore: testmode: Constify strutc nla_policy
Date: Mon, 11 Nov 2024 14:40:35 +0100
Message-ID: <78810e3ebb74ddbd3a4538f182bf1143b89baba7.1731332414.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_054050_733594_329D25BB 
X-CRM114-Status: GOOD (  11.21  )
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

'struct nla_policy' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   5062	    528	      0	   5590	   15d6	drivers/net/wireless/ti/wlcore/testmode.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   5178	    404	      0	   5582	   15ce	drivers/net/wireless/ti/wlcore/testmode.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/net/wireless/ti/wlcore/testmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ti/wlcore/testmode.c b/drivers/net/wireless/ti/wlcore/testmode.c
index 3f338b8096c7..fc8ea58bc165 100644
--- a/drivers/net/wireless/ti/wlcore/testmode.c
+++ b/drivers/net/wireless/ti/wlcore/testmode.c
@@ -45,7 +45,7 @@ enum wl1271_tm_attrs {
 };
 #define WL1271_TM_ATTR_MAX (__WL1271_TM_ATTR_AFTER_LAST - 1)
 
-static struct nla_policy wl1271_tm_policy[WL1271_TM_ATTR_MAX + 1] = {
+static const struct nla_policy wl1271_tm_policy[WL1271_TM_ATTR_MAX + 1] = {
 	[WL1271_TM_ATTR_CMD_ID] =	{ .type = NLA_U32 },
 	[WL1271_TM_ATTR_ANSWER] =	{ .type = NLA_U8 },
 	[WL1271_TM_ATTR_DATA] =		{ .type = NLA_BINARY,
-- 
2.47.0


