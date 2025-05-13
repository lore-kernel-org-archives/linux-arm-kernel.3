Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D883C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Njp3v0VwqR8TQR2XZwY23w/e/d6JfQiVfEi+wjHazR0=; b=yWF0CoGvqZwMwZ8vEwtq6+zgXP
	HIAygid98KZ8jISKyMuOZ8M0+jDhE4aXk2Qeq1BNRy3EBzzQM8R4AY4lzT7f38NTUECX3G8J11nwe
	E7dIOrb+2ZCW1tPmTXCwt1tPXD0VZnr7Ww3VMxjt6S4Y7iPlR5yiw4rOMCn+7u4j/oKphqTPBLodm
	d6olpWv+qUN9lTk2M8QRK+KKOotoXakfbFkcL3zKJR66kCbDhhftG3F5H0Vv9jPQx35tPUL54Cvxq
	DHeJjQDWWxPjal9u9Tc45qxmwnck+sOZIyHA4l9EMPJ7RHL7Co+5K8Uxbf8Sm4yAEpimdflK+1Wgo
	I+Jw8IhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmSh-0000000C0PP-14qf;
	Tue, 13 May 2025 10:02:11 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmNi-0000000BzWT-41kD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 09:57:04 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250513095700epoutp04f7b52e3e2f79822660ddd5b4fe2e8d74~-Da2x8o960982509825epoutp04f
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 09:57:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250513095700epoutp04f7b52e3e2f79822660ddd5b4fe2e8d74~-Da2x8o960982509825epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747130220;
	bh=Njp3v0VwqR8TQR2XZwY23w/e/d6JfQiVfEi+wjHazR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NhJOvmP/hrf4W7XFVWgrL8fikHEEBr2i1QYIU6v+pFfXeh9eTmgi+mHIwJlBgZpOU
	 X8y0wtmMAM7bt5lQxujFktCzZpj/JdbuNu42EMSRW08KayxDZMhbeMSgM345R1m93W
	 oT8NkAF9Du6FXguKHfIp5COA2L6z84XxG5wjCXf8=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250513095659epcas2p39e5e57064499989652855bd563dec51c~-Da2eytN_0169201692epcas2p3l;
	Tue, 13 May 2025 09:56:59 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.70]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZxX232XVpz3hhTB; Tue, 13 May
	2025 09:56:59 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250513095658epcas2p1d35060645d06e67687ff743a330027e3~-Da1jqqxH3111131111epcas2p1H;
	Tue, 13 May 2025 09:56:58 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250513095658epsmtrp22439b394d5444b3b813b911fee7e4a0e~-Da1i-hIK3179731797epsmtrp2P;
	Tue, 13 May 2025 09:56:58 +0000 (GMT)
X-AuditID: b6c32a28-46cef70000001e8a-0a-6823176aad69
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	25.78.07818.A6713286; Tue, 13 May 2025 18:56:58 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250513095658epsmtip23565f355bbae5c2f2e339f59a8f7bc79~-Da1RaFGv2395923959epsmtip2D;
	Tue, 13 May 2025 09:56:58 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH 2/3] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_MAXCNT
Date: Tue, 13 May 2025 18:47:10 +0900
Message-Id: <20250513094711.2691059-3-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513094711.2691059-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRmVeSWpSXmKPExsWy7bCSvG6WuHKGwZR/ahYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZbS+fc5Y8IOzYvX3fawNjFs5
	uhg5OSQETCSuN91l7GLk4hAS2M0o8ePAbZYuRg6ghJTEu2eWEDXCEvdbjrBC1HxglJiyoo0V
	JMEmoCMx/R9IPSeHiECcxLH2zcwgRcwCjxglrszrYQJJCAtESlxd9YQZxGYRUJX48fQVI4jN
	K2Ar0XHhCyPEBnmJmZe+s4Ms5hSwk/jaogwSFgIqeTdnCxNEuaDEyZlPwHYxA5U3b53NPIFR
	YBaS1CwkqQWMTKsYJVMLinPTc5MNCwzzUsv1ihNzi0vz0vWS83M3MYJDX0tjB+O7b036hxiZ
	OBgPMUpwMCuJ8DZuV8wQ4k1JrKxKLcqPLyrNSS0+xCjNwaIkzrvSMCJdSCA9sSQ1OzW1ILUI
	JsvEwSnVwMR8wknEQO/K8cpr9+6a5fVvfXqgqFRx74SA1fv9D+6Ja5ys+ohZZ07/3F1Pb+ax
	V3oLz9WW2fbp0OTMyc4zxR67zJQU2GJ73O5cRvGndQ4f3+7b98BPsXv76mU22ryXU1vPXrg0
	SUFRRHpz8yrlinhbkc01Vy6v//qm6nVemNvhVXKmZwsaNqg8vvZ//o55VhMfX39ZvKrI5jlb
	3boT+5aX9yjtlyjwninkne/4T+7p9KVnyox929QXa7N6X5aX+vts5SaB8/x3Knc2nt76Taxr
	d2O/3W6vPwybrTx5HQ8prVjJYry/dd/q0/cC529ke7/hKsNF0fTtDxduF7dbuv3YEZbpl0Mc
	V7lfL9PjndjJqMRSnJFoqMVcVJwIAOsy18PsAgAA
X-CMS-MailID: 20250513095658epcas2p1d35060645d06e67687ff743a330027e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250513095658epcas2p1d35060645d06e67687ff743a330027e3
References: <20250513094711.2691059-1-sw617.shin@samsung.com>
	<CGME20250513095658epcas2p1d35060645d06e67687ff743a330027e3@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_025703_430455_899200AF 
X-CRM114-Status: GOOD (  15.51  )
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

Enable QUIRK_HAS_32BIT_MAXCNT to ExynosAutov920 SoC which has 32-bit WTCNT.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index a13768a11f20..48819246f1ac 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -325,7 +325,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
@@ -338,7 +338,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
-- 
2.40.1


