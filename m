Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6758BCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 10:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k6UvRxauUxHtkSOdYEC9vPPJYNErnPXZyVXoKgtsN7o=; b=eZt7KrjF7uBkRym0GlxgfLiKei
	WU+CyeGgKoYSx/QY3USOogstnrj8DPR2yacJMrCftsZOhA9kSOmZZXtiZSJCDxxEANs4n/7TDrbY8
	dD8TILhu+UAeYH6uOaJEHqiPdfWalKoNry8wK2FE7lRWTxkesCEHFF6SXq61ZiAFYvIE/NfMaK0P8
	BOoykER4pRIFkMbdiL37Ll5RoMwSowkfqmkNB0b3uagfL4keUcE/8JsmsFZ/6hOXP9L3mzS+RXiv+
	PE4qk2AQx3mPUWpKt51vN9Oq65HS24Vdkx3Nonv1y7FIAtDPQupH91kL5GDcU78zDru2CrfHeJQAx
	Pg5jsj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQjZe-0000000D5ly-30IU;
	Sat, 23 May 2026 10:27:18 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQjZb-0000000D5lZ-0SSk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 10:27:17 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-83d31ac4017so4055826b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 03:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779532034; x=1780136834; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6UvRxauUxHtkSOdYEC9vPPJYNErnPXZyVXoKgtsN7o=;
        b=qrLLpt1aUvyBYWxF5iEiLhYerFSoNQN+GRdho9T67X2wXX/djOa81NOV/9PdHb9O6z
         z2G75JOgMzFBuKrS1mlu/UDYC8nP88RVhqnRlz2gunFon+eh+IahXi8jbf2ZUyofS7rN
         d0Dfg3B9t4tqGSsY+NtrtQFndrlIj5TSYmSILBoegS+Mdc66W7IsqcWVFAmhs6/WYxSu
         xczV/Dtaeslpg+1rlfo/ymAEWmwIsO0rdURj0hQGmyQVX2z4cZtT2Y3ffOkg9iymw8eB
         3WD4gG9UV5OIuyfbcnSGsDl08G34MQUpythUtuz7+pJOrm/ADgXkKgjuip+2c49M5SMb
         4aDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779532034; x=1780136834;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6UvRxauUxHtkSOdYEC9vPPJYNErnPXZyVXoKgtsN7o=;
        b=rVdEMKDPnPTr0pFvrV6s5zGq5syg3tj6ZYiNRVcBAApP7u+Rlzxu9jfulC6PRwBhuk
         7de2XQ/aJuMJIieobgz6oMymuPJnTd8jk3wUgJq2lUdT+2aCh2299z5rFfm+PGzPEAyL
         dLGdSdLVNUBFG2LzKIkn3Wxr5WfSkpNPXDlT2ONn5WvXQ7yZHLB34v8DPyodqbssXGJk
         d/KZmMtv3vDQq5U+z+wlgciO5LeyGE0OZ6rE6c+3jkCIm864GWWBn8HUfwgsoMT6QmqR
         lzMaMKXC/HZBaGdy5YJmwxwFhoit8NMvlJ2BWWX4XFyMe/mWhFJzQ5yI1vR00/Id4sun
         futA==
X-Forwarded-Encrypted: i=1; AFNElJ8tPYdvFVz22fRxTlc6YMiKhCm288TBWlWSnPauSCoIJvmHb8N6XWRni91loefMSxqxo6/3Wb9EhLgZDdFUJCil@lists.infradead.org
X-Gm-Message-State: AOJu0YwatF1O63iAmmjCLS1MFJkejf62OhZ9zBlYn1blGZrn5aAspM7s
	d8QVH7K3dyvs4LWzGu8mJg3NEJMf2xmlbJpWLld77+bFWFuIpzpuDL62
X-Gm-Gg: Acq92OESWOXka9FtC7dRzuNoCkV8rfHou6BjWcawYwDZPBIoS3GQra9rmFMeFVXnPfC
	j9XkdLA4fO4+V8PfjFFRSelkAAU86wY0VHmXdpEL3ZelB05wf+tOn0wnkhJ08W0E/+AQNFhexQ6
	65pU0JBi0LlQZ7+kH6Z23xKdw7hoR5HrwMP4C7Bs1XbpxszKlDb4GqD00WX851qJOlR+1xgj6X6
	tkESZUIzw8QzqqFuIO7jfPeGIFd9xbgs7Kk7a4OiVSFeYySKUMVfKZn0OOnrObNlhNH88TlgaZG
	BMYNpcQ0S6CAOoDLGwEre3PigQN06GRb/G5JhBKP7l3HL9lGpbbXhl1ot9P6+Me5Km33S1lbbCr
	SVB5XBn7Hy1/x9SB95YsqJjPbRb4MEn+cS8453O6pbQCjaQbbBGvApzu3Y1sfpt62hWKhe6p41b
	VWZH2IBqeg9jKAcbd9LKScPE+bu+E94W3gAyh1Hv9vnmRQYMTeGXX/rFRoDvPP93sqgxv9+oXW5
	OwJRYsojOKg2jM/rg==
X-Received: by 2002:a05:6a00:1d86:b0:834:df57:9d36 with SMTP id d2e1a72fcca58-8415f66dd37mr7142262b3a.25.1779532033889;
        Sat, 23 May 2026 03:27:13 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164e9e522sm5137201b3a.36.2026.05.23.03.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 03:27:13 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 23 May 2026 18:27:05 +0800
Subject: [PATCH] pinctrl: imx1: fix device_node leak in
 dt_is_flat_functions()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPiAEWoC/yXMQQ5AMBBA0avIrDVpKwRXEQutKSOUtIhEenfF8
 i3+v8GjI/RQJzc4PMnTaiNEmoAeOzsgoz4aJJcFz2XGNrJ6dzOj5WJKVKUps0p0ykAsNoeGru/
 WtL/9oSbU+7uAEB6uc0wSbwAAAA==
X-Change-ID: 20260523-pinctrl-imx-b198f8391abf
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779532030; l=1610;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=qcgqBwja4CHu5wwuF/A96Ah+f+QE9tKst8z6RkEiVGM=;
 b=TDWZmut8c/UsJuZ34Imt8NoqEeM0PpEU9Mu+fWpsx5fO0+0lK/CKvVOP1rGb0JTH1GYl6LIQ0
 m4LTlwTPTOgB7znVwyNrGhXUgbS3V/d65TmQ7AYntqW1v8GFhlfnklw
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_032716_791452_EB065F14 
X-CRM114-Status: GOOD (  11.46  )
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


