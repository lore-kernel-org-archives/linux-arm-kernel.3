Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131D1CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 23:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:CC:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ZqfmZ7SEmz2MhUMFhFA87CjSDiKi6lGAjx9JWaF2i0=; b=c3cO05YgVri7hHsYRFdtddpD3o
	dO23Nv7FpKuRSlg0zc+2PE/vy7ju19zvzoM2oYDJPrQXhw1bSw5728PH6IzpR0GM/vtUyohuDJSPc
	Fv4bG4s29sLEwhn7mNYpUZ7UV+TOWRuikT2XiWkNZiyTo2h11uQuhkOcZwtdbt1YOlouLdMm9csvW
	mINZDY6qZ1eLvKebscgxztQrTWX/rTHVffC0PnSIsWM14nzh7ktYztuhpfXK/i1TBpINZyRSdQSpr
	oVr1LGP/uk0hikSrf+MfO4IGikGsjhXzVFX4qMkCZISL0iDYpddgbaG7pMsCHdilDXZV8Swi2w7/O
	kX/TkBHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwke-00000007tkN-34TZ;
	Wed, 03 Sep 2025 23:18:52 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uttUW-00000007U3Q-0If5;
	Wed, 03 Sep 2025 19:50:01 +0000
Received: from [192.168.2.102] (213.87.131.167) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 3 Sep
 2025 22:49:38 +0300
Message-ID: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
Date: Wed, 3 Sep 2025 22:48:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] pinctrl: rockchip: fix NULL ptr deref in
 rockchip_pinctrl_parse_groups()
To: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
	<heiko@sntech.de>, <linux-gpio@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>
Content-Language: en-US
Organization: Open Mobile Platform
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.131.167]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/03/2025 19:33:07
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 196014 [Sep 03 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 66 0.3.66
 fc5dda3b6b70d34b3701db39319eece2aeb510fb
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.131.167
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/03/2025 19:34:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/3/2025 3:35:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_125000_125559_631D2832 
X-CRM114-Status: GOOD (  12.42  )
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

In the Rockchip driver, rockchip_pinctrl_parse_groups() assumes that the
"rockchip,pins" property will always be present in the DT node it parses
and so doesn't check the result of of_get_property() for NULL. If the DT
passed to the kernel happens to have such property missing, then we will
get a kernel oops when the pointer is dereferenced in the *for* loop just
a few lines after the call.  I think it's better to play safe by checking
the list variable for NULL (and reporting error if so), like we check the
size variable for validity further down...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the master branch of Linus Torvalds' linux.git repo.

 drivers/pinctrl/pinctrl-rockchip.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: linux/drivers/pinctrl/pinctrl-rockchip.c
===================================================================
--- linux.orig/drivers/pinctrl/pinctrl-rockchip.c
+++ linux/drivers/pinctrl/pinctrl-rockchip.c
@@ -3488,7 +3488,9 @@ static int rockchip_pinctrl_parse_groups
 	 * do sanity check and calculate pins number
 	 */
 	list = of_get_property(np, "rockchip,pins", &size);
-	/* we do not check return since it's safe node passed down */
+	if (!list)
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOF: no rockchip,pins property\n", np);
 	size /= sizeof(*list);
 	if (!size || size % 4)
 		return dev_err_probe(dev, -EINVAL,

