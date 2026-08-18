Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAF6C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vrupXKe6GPwgDHcB/YTFakkBHawtEgPr4xEuzVXfss=; b=kdt4dO/Xz+KgsNptAYFMWdTYGQ
	kOoA+6x6cf3h47e1UHq6LkLUGeNNIv49dNPfmg/A0R+oCECdXVGOqt/JJGvDOtbsEx3tPEkSH7oJm
	p7bfp4vaOK0yYoURz0i7MShrjkorgV1jKogEBdtefXyf0RxIiOEVuMdEvvQZWDaUcYIhohG/NEPIK
	ijlkQKTHBne6j6P1TlDsHCrxFRwg5qM73DgC9b61gKyLQATj/0ACGw/vOsq94XioSjOS9ChtjH6UN
	8e4r4bF3w1OIT7dcOqaQoZS+mlmJUKGoLJmMB/8IJnHYdDqeh79j3Uf7D4ZsPrKy9W+1wShHQ/DiR
	x+hnbOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLPC-00000008E3y-0OPQ;
	Tue, 18 Aug 2026 15:07:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLPA-00000008E3J-3Hk1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:07:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4202643A51;
	Tue, 18 Aug 2026 15:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CB05C2BCFB;
	Tue, 18 Aug 2026 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787065628;
	bh=r444rkKnnmxJSFdTtlazkLelu/fRcjvBfJQaLoZOfIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TF3hFp+kE/pEhUDUvChrYWIEHO6VRV9d0BA9/g5+akCy0B52GAc2vAc8FaEELBKsX
	 TiICIV5kYJVcw4cEDpQp0ZP81RHy4FtiQD04hnr1UHD/3zA0DdR3/e3I+mSSN6R89V
	 +OvbTFaHS2EmjQ7eJmy8Q7WH3BcnN8BVFALerXt+fh+lqfuF109U0NjLm1cJPaBF7X
	 WCInUGu215oype16Z2gjWNnVrdG6MnFILW5YeZHQy4jllVgORwKdt+er1kwArncqCB
	 S2wZQam3RegZRyycueJnVoN+6NWfxCLQxfc8ywkU4NSj0JWhJX653vadYwlL/5Larf
	 tUn0BvNdU12Ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F43C5DF81;
	Tue, 18 Aug 2026 15:07:07 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Tue, 18 Aug 2026 16:05:43 +0100
Subject: [PATCH v2 2/2] soc: samsung: exynos-chipid: Add Exynos5515 SoC
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-for-next-lucky7-chipid-v2-2-28ae49f5c349@member.fsf.org>
References: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
In-Reply-To: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=767;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=KrAvbTcjPgbEqmHaN4JftTy05Ws77uQwQ2XXbRU1taw=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqhHUYhckpPyuaAWT392LX/C6uN5uPLPi5/tBVa
 ktbbqmfOgaJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoR1GAAKCRBJJwGyxHrX
 668zD/0RgG3Qiu7GFJKFaVrk7O9inGucMKIg0JATcjQFzegBFbclxxmBKUxIpPIcHKPvSIcDv97
 9llDqe9WcvUC9HDMvY5tV9yzqW9ZLesUS718CGo7ltIoJnao54yDxAR+NKfAX4DsDAJ2ZuXzJj/
 /Fg7sFZNwkPpRdIMGwFThauaXQ1hEB2gEX683A7S3padQcEa5YNEJVSXoDqPUMRpqQ1eCatgvU7
 27DRSqo5LeaPS8I53bazB6uKGotJV34+3TkGVpBNUHhsEZKiSYPLFmm7PRXImt3jhJ/ksuF+dpv
 ANBaXwBWG5jSHqbvQqQ//EZyCYN1D8wbKcRuJDxQPQYiyH/iyXSlhG499ltMdFCT7CWDkJHrggS
 PK55zp5r9XeVLONpiuvikwk/L5edX7DyqE7am4/QMLWkAVvUnVq9AkUw+q5hJzf2aAHY/KMMWC6
 jkGDoxqyZMLvhfjytmWaFptJ8tq4BByEPTGryb1dHARJiup+IU1aYRBVwKZrvoofZf2sDSPIBIp
 T0fhN9pt8ZGgBcWxECthLhiUGdqIkI6FWjbdGy77RNLcfUoYwDLwcmflDbEnfHPsI8PL+DfLIjA
 w6MqXTBxJmFx2C1ODz63a7E6vKT8J/CVL1tGx+S0+XLiK5FhsGfo/v85m95oD8+EuLrVYS43Mt8
 bE/zwlwr9lSMjlQ==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Aiden Isik <aidenisik@member.fsf.org>

Add Exynos5515 information to the soc_ids table.
The ChipID for Exynos5515 is "0xE5515000".

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 6ef9751e2509..506a0bcdfe30 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -64,6 +64,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS8890", 0xE8890000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS2200", 0xE9925000 },
+	{ "EXYNOS5515", 0xE5515000 },
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },

-- 
2.54.0



