Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200A3CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 02:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ni1tZOZf60NuZfdoJF6J/0gev8lFnicQU/0S4esZy8=; b=OUIm/bM4k60v9QTOj1Ki8oyH4q
	d9L8k3EZt9EgxxhNw4I1tmxj9HbuR7BmaHITfFxuTMJZKJ77yjoUoZpf0NqSMPG2E54BL2XM7pg3n
	w8csTszlGrygeUXizv6OuaQjQzADxhGuTpMfhCV+4TE2l3I8a6qR6K5LeNLYgr8piJZTkGfbjcHeu
	iXNYGf/jCCtYsn6ITW/4aTmRPY2fXMelDb65Tqt6pVT/i7T317aJEIYzQyE04FjrMtYR3vrvAavAC
	GOWCdv2bccZZZ27zA/X5Il548glHcTzpTDRx5akWko0Be0JKh/Y9eJhHwqHCWt1hSaTpnVWGILG3p
	wHlWMV8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXZh-000000081uP-2hoq;
	Sat, 09 May 2026 02:37:53 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXZf-000000081tm-23kb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 02:37:52 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-130c9dcbd25so3092667c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 19:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778294270; x=1778899070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ni1tZOZf60NuZfdoJF6J/0gev8lFnicQU/0S4esZy8=;
        b=KEfcnC1SD/xMzKrJFMDTuvrYqCHAEAE/dD43Lty5JnTQwuEN7IZxCwqLE7NnF480v3
         sEbCqIm92qktVIK6ERFJmCI5GiRHRo+bv6XzUjtxQ+Gv40znnM5CNpd5CH4FqoqqbsBm
         ++hTHstHnOR/Zjs3GNrN/CFlT4EpAoQgrDPNIZU3jyzUVt0xGOBrTSUGk49mBYQ00YUi
         zqTDratInJR1mfsS8+t+kzcEvWXkqIYzsZdGuy46p3k7KCHkdk/AECLXAq9wQqX+YsCT
         1dWYHWnVskJoAUJtwomvawulIfU2cfogTDuXIKMFbty6DFXTJdhCHsSdlwrYM9UWoN+m
         7pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778294270; x=1778899070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ni1tZOZf60NuZfdoJF6J/0gev8lFnicQU/0S4esZy8=;
        b=h12VMEdtCzVExwYcxn+OtCyQhXBARF1l0cRNlppWEeQDPmoXbHio+HHmPNfiGb7U7P
         fsTqFDw9usse3l1DvUoAdaPzHugbWN0oaBpXT+DMRuRRJ2Kcck2fCq9AXV4iZOL1fOTF
         WaWNw+DH13pF5MkJeNDSJR35gzLwy10zZBI6aKXL1PLFq6zOiU9IPd6hHtxZHpvCbmNi
         zAgbG4I4htmM5nXuNTq4MoMNgln3JzOm3aho/V4YzngSllWMQ06j096PcX4Z0uA9uUc+
         kBtaSKEYWMyeelNNVa7JIwFrsjEFancbeYeSv67uFwPgclVzeFLdfbo2g29t9jyc21CA
         X30g==
X-Gm-Message-State: AOJu0YwbZqYR7ZjCwmjfiiZsMYYihuodmnFVLDbf+vyHH25/crjBGDX1
	rB97Hr+OvDckCSdj3nZ9dl5slKjX5jt1dijm0pqvn3FZEQV1QkvHeMrJ1v7W58pUO3E=
X-Gm-Gg: Acq92OEl8zxJxaz+bPkg10dS3k3B2eB9Zkoq7foA5u1KA65+eTizcZfqCjp3NxtU+o4
	mN/WHBiRn/fpUwfCL2JrKhzWRxsmAMP6NpMOGi6bs3piHasQL1GZIfHhp4QuptlVn3V9cG3SGzL
	kZTb0raTppDr1W3SZ0GvgyRVWsDcnHCpJjaEXaVFBb4OV2UkpkpBgrivK+nS+QJfLoIDQnHTxck
	im1c5n2ehyMZY9U769dibxD1T4U/Dr1mxnqEkKiIywgPgouP+miYym7b46/I/PkW4BjlhbJXtPW
	0dqUMq7sfONf44wtWaCdOY5qjTVq/0BM63dVWm0G8BGRha7HU8ekQinNpuj6pofGI66ef1NDi7l
	cJ7HB87EpiMuCDY5qEdk7Wd+ZyyRmnOrk24JCHdmzt6wPWXYT5mNKfZbBl5dD3uE5KRU4pCDO8/
	jHmBSeldlzRo+9KCiNio/+0KY6K6+N5V7cnkmuw1t0kgR5pVyxEIQMxAIH8DmxmgVsNUODurPb2
	6y3qB1bWyiqL+Qoh+GWhxpIQGIrrZLXfLHdnhxWUKUytjRC7n7rCyIQI5+MopXST0BtSorify1z
	8yAkCBfT2sjrzI9ejQ==
X-Received: by 2002:a05:7300:7f9f:b0:2f4:d190:37bf with SMTP id 5a478bee46e88-2f6e4563223mr3912893eec.16.1778294270296;
        Fri, 08 May 2026 19:37:50 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm5510395eec.14.2026.05.08.19.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:37:49 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH] net: ethernet: cs89x0: remove stale CONFIG_MACH_MX31ADS reference
Date: Fri,  8 May 2026 19:37:28 -0700
Message-ID: <20260509023732.42256-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_193751_532553_7744045C 
X-CRM114-Status: GOOD (  14.57  )
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

The legacy ARM board file for MACH_MX31ADS was removed in commit
c93197b0041d ("ARM: imx: Remove i.MX31 board files"), but a reference
to it remained in the cs89x0 driver. Drop this unused code.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
I found this issue while working on updating arch/arm/tools/mach-types
to remove entries for board files that are not in the kernel - this
reference caused my script to consider MACH_MX31ADS to be present in
the kernel.

 drivers/net/ethernet/cirrus/cs89x0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/cirrus/cs89x0.c b/drivers/net/ethernet/cirrus/cs89x0.c
index fa5857923db4..b4bfd6c174e7 100644
--- a/drivers/net/ethernet/cirrus/cs89x0.c
+++ b/drivers/net/ethernet/cirrus/cs89x0.c
@@ -1271,7 +1271,6 @@ static const struct net_device_ops net_ops = {
 
 static void __init reset_chip(struct net_device *dev)
 {
-#if !defined(CONFIG_MACH_MX31ADS)
 	struct net_local *lp = netdev_priv(dev);
 	unsigned long reset_start_time;
 
@@ -1298,7 +1297,6 @@ static void __init reset_chip(struct net_device *dev)
 	while ((readreg(dev, PP_SelfST) & INIT_DONE) == 0 &&
 	       time_before(jiffies, reset_start_time + 2))
 		;
-#endif /* !CONFIG_MACH_MX31ADS */
 }
 
 /* This is the real probe routine.
-- 
2.43.0


