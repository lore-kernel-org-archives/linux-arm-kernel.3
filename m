Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCC1CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:CC:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NuZz9x3tjnhddoEB8R3j2apxdUhfw8w+LdxEB0nYNDE=; b=Sky1kBBf00uZXIW7fg32quoE3j
	c3gf6rW/vAn/7OqOm3QuGiElp5buju339u4A2MPJyiwX2tf9UZTJiCILgWYKH+/49hsbkMRDp/NNU
	ZC6Xfl7cw/JOM60oBc5OLDRIJKrpufl77nbzqKpq9I1KOziynEmd7zkkUypYWJtT3xblIB1/T6xFv
	kmkVaaziEIJhzqyz5YVamaPC0wC2oCTngTG8Kke+mmBgN6TZs0MKB0ce5G2rRJbjdZlGLVIxTkWh3
	ipoqCYSosi8Ys7vGr1cpoYE5DW2WbKu9DVKpdZgZmbDDcpevG5VHNjJjWf2aidfDFPJtE9TNI3NSC
	m2Fyvs5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVA-00000005QvC-3y84;
	Sat, 06 Sep 2025 00:09:56 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYxq-00000002zT7-3oyd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:07:04 +0000
Received: from [192.168.2.102] (213.87.137.226) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 5 Sep
 2025 19:06:50 +0300
Message-ID: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
Date: Fri, 5 Sep 2025 19:06:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
CC: <linux-arm-kernel@lists.infradead.org>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH net] net: stmmac: prevent division by 0 in
 stmmac_init_tstamp_counter()
Organization: Open Mobile Platform
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.137.226]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/05/2025 15:43:06
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 196074 [Sep 05 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 66 0.3.66
 fc5dda3b6b70d34b3701db39319eece2aeb510fb
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.137.226
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/05/2025 15:46:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/5/2025 1:33:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_090702_952836_A567EE31 
X-CRM114-Status: UNSURE (   7.20  )
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

In stmmac_init_tstamp_counter(), the sec_inc variable is initialized to 0,
and if stmmac_config_sub_second_increment() fails to set it to some non-0
value, the following div_u64() call would cause a kernel oops (because of
the divide error exception).  Let's check sec_inc for 0 before dividing by
it and just return -EINVAL if so...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: df103170854e ("net: stmmac: Avoid sometimes uninitialized Clang warnings")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the master branch of Linus Torvalds' linux.git repo.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    2 ++
 1 file changed, 2 insertions(+)

Index: linux/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
===================================================================
--- linux.orig/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ linux/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -817,6 +817,8 @@ int stmmac_init_tstamp_counter(struct st
 	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
 					   priv->plat->clk_ptp_rate,
 					   xmac, &sec_inc);
+	if (!sec_inc)
+		return -EINVAL;
 	temp = div_u64(1000000000ULL, sec_inc);
 
 	/* Store sub second increment for later use */

