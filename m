Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F5ED3A66B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m0RPAITzRHsXZ5OofhylNXltQHUN+yHYntp1o/XyG/M=; b=yPQw/T/9+nbhthlk3jwEmyL6N+
	4YEc6IIzg2qvhQBxosIVNA+kAz9MpA5WiRPm9xaxhnhCYPWDrN5RvF2UhTrNbgGAuavguGf8i3M4d
	aQw7m0fQUdr6hit4bAkwdfM5FI1BRBvH5169SdyjSqvx2QwxuENPHu8EdFwO0Im5Q6sxS6cE88BTW
	0rUY7XPBOs86RCnQstznmdMM/JBhNfv85QrycQjMEJdgmt4wSivqu7CA0+p5Y9qekQQHWxwXxgJah
	nxEE1zmwjGC8qR8Asd/L9/9scV2tRewfgh7E7HqhoOMqEq92ek4a/5A0eCgLrbErTcYqvqbPSYpC/
	wa+3YvVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5o09-0000000EsRf-1Uvr;
	Tue, 29 Oct 2024 15:19:21 +0000
Received: from pv50p00im-zteg10021301.me.com ([17.58.6.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nvF-0000000ErL7-00oG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1730214840;
	bh=m0RPAITzRHsXZ5OofhylNXltQHUN+yHYntp1o/XyG/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To;
	b=ZwPdPdb+lL8xoHbcZxk7RKv9WXJXTl3gMLYqI5pPQ/o+upMs9Sh91F16y69ETq7Nh
	 +CSujS9Cqu05y0OBMPUwGQgh18FVigj0Y/TAuSTGHAWVO4woyqmZhZ8J02yzO74zgH
	 51hNbYbV7P5cc63gqIPqZI5UBr0hTV7ZoH3FVhClmsn/aW8jb4jRhMCzdxrCksEodw
	 0KJ7R9SJm5od5EHCEVbbLIXIPWO2RAxpeh3C0CeFs6sqbgNdA8kKeH+UpxCmX5IVYJ
	 tuWswcdudWsSblO4XTyslg93asjskfxSQ7TXP5L+wDkwADU/INdy+Nit2DF4tUQkT5
	 HjJkjqFi8U4ZA==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10021301.me.com (Postfix) with ESMTPSA id B28925003C7;
	Tue, 29 Oct 2024 15:13:54 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 29 Oct 2024 23:13:38 +0800
Subject: [PATCH] usb: musb: sunxi: Fix accessing an released usb phy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-sunxi_fix-v1-1-9431ed2ab826@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKH7IGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAyNL3eLSvIrM+LTMCl0D87RUQwsjIwtzY2MloPqColSgMNis6NjaWgD
 YrKlkWwAAAA==
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Liu <net147@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Proofpoint-GUID: A52_arbNQN9AMkzMRMQ8e3GA-Vxpu0ol
X-Proofpoint-ORIG-GUID: A52_arbNQN9AMkzMRMQ8e3GA-Vxpu0ol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_10,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=658 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410290116
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_081417_091832_5EE98AAC 
X-CRM114-Status: UNSURE (   9.50  )
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

From: Zijun Hu <quic_zijuhu@quicinc.com>

Commit 6ed05c68cbca ("usb: musb: sunxi: Explicitly release USB PHY on
exit") will cause that usb phy @glue->xceiv is accessed after released.

1) register platform driver @sunxi_musb_driver
// get the usb phy @glue->xceiv
sunxi_musb_probe() -> devm_usb_get_phy().

2) register and unregister platform driver @musb_driver
musb_probe() -> sunxi_musb_init()
use the phy here
//the phy is released here
musb_remove() -> sunxi_musb_exit() -> devm_usb_put_phy()

3) register @musb_driver again
musb_probe() -> sunxi_musb_init()
use the phy here but the phy has been released at 2).
...

Fixed by reverting the commit, namely, removing devm_usb_put_phy()
from sunxi_musb_exit().

Fixes: 6ed05c68cbca ("usb: musb: sunxi: Explicitly release USB PHY on exit")
Cc: stable@vger.kernel.org
Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/usb/musb/sunxi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index d54283fd026b..05b6e7e52e02 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -293,8 +293,6 @@ static int sunxi_musb_exit(struct musb *musb)
 	if (test_bit(SUNXI_MUSB_FL_HAS_SRAM, &glue->flags))
 		sunxi_sram_release(musb->controller->parent);
 
-	devm_usb_put_phy(glue->dev, glue->xceiv);
-
 	return 0;
 }
 

---
base-commit: afb92ad8733ef0a2843cc229e4d96aead80bc429
change-id: 20241029-sunxi_fix-07fe18228733

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>


