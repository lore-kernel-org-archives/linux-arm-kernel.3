Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9A8CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=50SE8l3bKCw1R5C7MBcazdi1YXMeu+dYN+l8lo26Bi0=; b=nagjIt0IBzWW63xrJnLFxnMX6h
	Pra40ddQAwELkkFYsBouz0QtWMlMSD3ifhmhyqXyyTQ+7kOdIbzU6pgoWTryDuYb75cN6oNzfu3Mf
	1FK9xhq4FWDm4N/kNoLFQrXi3J0xoniMJWC1KaMtrzvSCg+7poR4yadTavS1aT75mUkjEOGLALjUF
	2kokpSsRTFX1WGmwrSlm6JQxAX3ILLTGaMWJQyeJcjP48Cx6cRy9zmbaMlU+AUQT2YkRUx0RPFRsz
	p1K/x4b8sp/U09PmNLtIcbYpU0LYfu4g6HkvXGeR87o4uP+ENQwWleLOcrU78QEGjf9hZR034Y5Dx
	3msGw8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSh7-0000000FkhL-02P5;
	Tue, 16 Jun 2026 12:15:05 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSh4-0000000Fkgt-0Gq1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:15:03 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so2857604a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781612100; x=1782216900; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50SE8l3bKCw1R5C7MBcazdi1YXMeu+dYN+l8lo26Bi0=;
        b=Z9YKVr0PoLZ3oGfO9iOCzNeaWjhRPa7q9E4JY9Bic528OzGr6Ezf166am1zIbQY9kA
         eiJ1DQkp2kxGeqyxzY97v0TjLt9zzP88hl0/qkoLN4dmYWcm1HLwEivX4lHo9fNS2HBv
         Yu8LKDOzCHtJBhQpfgpa+tQ7rN3mjcbnrYDa50zx8OOduEtaqugg+cNLG9PWvMlsrlvJ
         caLZZYQx32yvery4hTlmuX2qJeAxSf9eO10Rpl6LDrIWwPhOi2Ea6P5jQcATz736ordy
         01yOOqEzlG/PAMTjrpTzrPVuZNkC0xveSh+l0NQb5jEu5PEaq55+vLueQ2xAlVeL7jik
         2qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612101; x=1782216901;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50SE8l3bKCw1R5C7MBcazdi1YXMeu+dYN+l8lo26Bi0=;
        b=jLwrAcuV6dRVXjPLPB792rCiopOINtYw4M12M4zb732EXx0lmayoEjE5eOR/YvgrxL
         +K9pA26fRpm8W6DQA8jh1osaddHf/04JRvC1RBOgedU7SmEifdnuDEsLDIasGDojrXPs
         kEsLYBbBPS4DcHL5klm9to6J2damdgk3LXvj8VD8v0I0WrLOlpVEctoWIw1yRFj82ow8
         /ZpDPVOgBH4R+GlCm0dmWPw7SFHGxNILY1ECSD3DHlKCN+rZigJinlUHYR5oT13/E5rC
         8NR5SESZ7K8cbbRFAgmZkFN1wXJ1Yp2NCQOsDujN/eo4df+K5we5mfACANcuZrvO0f2b
         ua+A==
X-Forwarded-Encrypted: i=1; AFNElJ9pIWQx5dOrGbHoBH0aFR9akV2J4ZPNA9voRTybNM2N4HpRI+h25F0OUNFTLyiF4MmoZJfd0NURivfjv64Qzb+f@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4ubBF1On/n9LFH4oR1gVEZsOvSsCeyd8sj6ejvMsGCEpC2A96
	HmRY0CDDh5zaML8Utc5glF03r9ishee6vNdlIo+5bY3SOTdpH9XQ9sQ1
X-Gm-Gg: Acq92OEdWGw8agt/MfAu8d6saXzuMlq1zjuxyI4YvK1zRxMmGTRg+ltFte8oYquUtuY
	2ecVS5kgrELn9QwmbwpT8KMzIdb5xTCc1aeeoKRGFYKfBY0GsYL9hxCf7mU3CeFYoKqIe62ChNT
	rCAnbRZcvTLE0EWMCcTyOTUmKCh/qySjWNcTinvilBuUcbUN+iqz3verZP6ByPkR2HP5jFHKQnm
	eLug+yOiqUeWDrStz+7ITRwcpWilv2IS0KHpqil2oSJzqnGvpSpT2jADBwvPQousB0BYlqoXNYc
	hblO7SOs7d8c3bpZZry/Hnspr/rSqYQB0H63ePH+jTv/whE3n+1aQ8kzNFhxGD2Y7eHrIpe8tcy
	aXHLEWZWusuuTM5Ynof1DKTb1bd1ObQcUKslLnRzBKkAL0evlhXW7fijlzBKZyBZhBvhWPwcu06
	+6EW/eXHxeFcikKLtgCLXGYGe128nifxKpMFmGETw8rQva+QvNpm0L0SUvr8E1T3iIACbKZLzSN
	WfOc2EiXTDETlgNXA==
X-Received: by 2002:a17:902:ce03:b0:2c6:a99a:52a9 with SMTP id d9443c01a7336-2c6a99a5426mr9079815ad.7.1781612100226;
        Tue, 16 Jun 2026 05:15:00 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm135118355ad.12.2026.06.16.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:14:59 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 16 Jun 2026 20:14:49 +0800
Subject: [PATCH RESEND] pinctrl: imx1: fix device_node leak in
 dt_is_flat_functions()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-pinctrl-imx-v1-1-777c14cd2858@gmail.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781612096; l=1643;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=6S8wuEyltAzT8/X/ySOKtLmdWupADMGiotqEpc6gdtc=;
 b=Zku0M2FJaEoEwwEmrCy//KeKEm/UNXg9nSoC03e69VuLUmDz9Ml+HSmsuuOUOgc4xg7mHQJS5
 d/LUhvYU2XUCGf2+Y9u4oXQNobiZ7p+MVx3pW+HgMzZyL+314bfXKqO
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_051502_176180_D5577E32 
X-CRM114-Status: GOOD (  11.48  )
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

for_each_child_of_node() holds a reference on the iterator node that
must be released on early return. imx1_pinctrl_dt_is_flat_functions()
has two early return paths inside the loop that skip this cleanup.

Replace both loops with the scoped variant so that the reference is
automatically dropped when the iterator goes out of scope.

Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function nodes")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0db..4a6bdaefa42f 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -547,14 +547,11 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
  */
 static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
+	for_each_child_of_node_scoped(np, function_np) {
 		if (of_property_present(function_np, "fsl,pins"))
 			return true;
 
-		for_each_child_of_node(function_np, pinctrl_np) {
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
 			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260523-pinctrl-imx-b198f8391abf

Best regards,
--
Felix Gu <ustc.gu@gmail.com>
-- 
Felix Gu <ustc.gu@gmail.com>


