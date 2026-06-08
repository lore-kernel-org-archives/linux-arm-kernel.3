Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F458CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BjHGCkFzbg/ZD73K254vrX5rNRge7vlm+P1PX504bSk=; b=NfURmwe1Sde94FEgVS3watIrmS
	jCbryrtVDspIuAaZc/9+Z2voNt3z2pli7yhdkFoSn8BHXWOFK+uaaPVZwWApbteMbMmgPyEFPJXE/
	f9TssFnDPg7CAwTxsQL4diqZIT4t/8qO8+ZAkkOMtYC/RZN6lkFFXsnRPT319c61B3G5VWOWTr9NN
	BV/caTJfFjgHUPlu3/FIUIFVnO8w4TAeIsEX3cjCGnlV++AmxA6sp37eT2zME7rl8EMHfnAPeQhqU
	IhnpLVTwTw4Xf5mFXKng3lpGsS8Kl0BUzLg6P87G3x9EtGj/oKCHHC81aSXbbDcKWJWMWfagK9DhA
	r+FsvL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcBu-00000003zsv-0Mi4;
	Mon, 08 Jun 2026 15:47:06 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcBs-00000003zs8-0kNF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 15:47:05 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-9158629a220so498099385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 08:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780933623; x=1781538423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BjHGCkFzbg/ZD73K254vrX5rNRge7vlm+P1PX504bSk=;
        b=SG4Qer4skSIYH6T5qWGB8lzL/Bv2tScrbHQvMA1kxEAfAMhJeG/yye1DUEwMmPmMT1
         VHwTXqr8wo6cGLkmMQ8XS6iuEDLQr6fhz+itE/8XSIiHrTaVxVjUSJwF9ZfXn8hiTMGJ
         Aq7C4EiBbw4o0Lv1J9u7FILhKb8pu9sHvZGwrkATcxoJHBG3rd/XFwohUObo6rHUYFQF
         L+9TR1KCjqxry+wUYRXEgM0gXxxUxB64CdRKQs8dKY9WkgjboBXCu1eVOozO2DHmAGz2
         h+jjEK6T8ljSK7YMkGUCWasHQpKCnd03B0UJbwMjIY0HvMiXWNRr5OCPxXkAKk47s5lg
         drIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780933623; x=1781538423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjHGCkFzbg/ZD73K254vrX5rNRge7vlm+P1PX504bSk=;
        b=bRd5qjBrXdCvBPtozULy8CWDdl44hH/y31TvbA2dRPSdBxKBqFCjIL42rztjmusojf
         j21Lk+rO+kWFKmPxRAgrznI7uLXFv6SZD88fbB+Yn/qQnsjMOUQlHWhZj9ABJyfkP8s6
         HyPYTa/zpPypL2eCBlU+WKN/FgJLzIhb1cDHoxeZbpnpHRn4k9zXKk0SndeSfkmsUknk
         0jaDu+AUOKng9a0++gcLyV4AY0Rtk5DeUVYitPu00+BN3oaoGjeiYk0dbccFgzoJ0+qo
         6MydFSF4mYzU6oCXdDradDL0PS6T6HhEqkZI0IPcPWDMSO2NfOEpgGE9iYuRiY8A3ORf
         4LXg==
X-Gm-Message-State: AOJu0YzxEc+ZB+NkILzywG9BdIXykpH4KjM01R16TH7BD71mo4JTbfyt
	RNwKhOLn2WqogDo61/ckKwblDs29k4x3RU/MTUaMO6QfqZ9sxLUc9G3B
X-Gm-Gg: Acq92OGW+HP+GqQRj2KVPCEReENuv9qlPM2MMpCmRfWKrRGZH3+SB/cQO/Ay05b7tFU
	l8rqhOM1qgGg6GB3JPOOXO+YFU5UyG31Wm9leoJid/agIEL1s6InDmAx7ystku/qx+8VZNnhfX1
	/PwydPCMJCN68mdybIo2CtughOk4krlsDVCc5f2jx45DfS4aYn7mHHBM6Dv7kyf3Pki10/Ci+7i
	1zkSD6QnRV99weYw1Ox+KWA3tyRwyhOEZuYCsC7w6RP5nBZ6FOUMYECkWuVqIkC2EUFdStojHAV
	q/U43khDwHAmgK6z0KvTB64V3Stv1PclCijnUGZUnDHYoPAAqCxDc3SrKul1kt0JBFGC4UZKDK9
	AQN7hNETJXC+a0ZmG1wJsADtgxUEyOOKw2WUScb1bM90ywsdJKHSsWFGzky/ScnsFzrRKJQUiNl
	RnbZBcuw9RQ+njj38QHX9Zm81pyUdx2cLPw4DcEx3CoeRDhGwKFns=
X-Received: by 2002:a05:620a:480a:b0:8c9:f8e5:9f12 with SMTP id af79cd13be357-915a9e0a7c5mr2691864385a.57.1780933622763;
        Mon, 08 Jun 2026 08:47:02 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a238f8esm1792846285a.15.2026.06.08.08.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:47:02 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: actions: Drop OF node references after mapping
Date: Mon,  8 Jun 2026 11:46:58 -0400
Message-ID: <20260608154659.37726-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_084704_242104_09AD772E 
X-CRM114-Status: GOOD (  10.42  )
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

of_find_compatible_node() returns a device node with its reference
count incremented. of_iomap() uses the node to map the register range,
but does not consume that reference.

Drop the node references after mapping the timer, SPS and SCU
registers in s500_smp_prepare_cpus().

Fixes: 172067e0bc87 ("ARM: owl: Implement CPU enable-method for S500")
Fixes: b6a0e18ca690 ("ARM: owl: smp: Implement SPS power-gating for CPU2 and CPU3")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-actions/platsmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-actions/platsmp.c b/arch/arm/mach-actions/platsmp.c
index 7b208e96fbb6..a0d0c1621bd0 100644
--- a/arch/arm/mach-actions/platsmp.c
+++ b/arch/arm/mach-actions/platsmp.c
@@ -105,6 +105,7 @@ static void __init s500_smp_prepare_cpus(unsigned int max_cpus)
 	}
 
 	timer_base_addr = of_iomap(node, 0);
+	of_node_put(node);
 	if (!timer_base_addr) {
 		pr_err("%s: could not map timer registers\n", __func__);
 		return;
@@ -117,6 +118,7 @@ static void __init s500_smp_prepare_cpus(unsigned int max_cpus)
 	}
 
 	sps_base_addr = of_iomap(node, 0);
+	of_node_put(node);
 	if (!sps_base_addr) {
 		pr_err("%s: could not map sps registers\n", __func__);
 		return;
@@ -130,6 +132,7 @@ static void __init s500_smp_prepare_cpus(unsigned int max_cpus)
 		}
 
 		scu_base_addr = of_iomap(node, 0);
+		of_node_put(node);
 		if (!scu_base_addr) {
 			pr_err("%s: could not map scu registers\n", __func__);
 			return;
-- 
2.43.0


