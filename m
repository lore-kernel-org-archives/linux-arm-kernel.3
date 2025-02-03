Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BA3C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJmXijEdPvVQhPl2H+0CH9VW3oJvZ/5z3zfZg4wy3ds=; b=MMULJJJDvI/p5w/6PMiy9yf0I9
	Glew2iJ+k+yzpv+TlU63WmiS9WWFjsK7P/1NKi/JaGwarDsZ03QPUDx6bx+oTeUmS5mbEUzEhhFa6
	komv5gsQ+HzlPtpUMpJTbaCDTuCI7K9GsXJp99bSwUZJK1Wm0/DvCXoF3/SQ75pOvbVFirIW0+pqv
	KMGXwhUq40uR32p4yh5GGCo2iiEodEkFqOJ2jUaDPjVnoYivSC+e8e8b1Jelh1x8oB7AvkCV/A3Gi
	Q8nUX/MCcNtMND+8rRtVHT7CKG3F8eb8loUceaYcTHgVqlO6oyiAAFyRKxSsnr0nmA+QG350UmgYc
	hSvhQbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3BU-0000000GY3n-1WGK;
	Mon, 03 Feb 2025 20:36:44 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf37o-0000000GXJg-1Fxf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:32:57 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D3423259FE;
	Mon,  3 Feb 2025 21:32:53 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1vY3mYxwqqr; Mon,  3 Feb 2025 21:32:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614766; bh=NudPmupCZnC9mmHSDb+mQPgPttYtv9oaHlFss2VQSE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QWDeDRdsAfPyknkRd21EprJX+ifussKj0bTCt9dUrx7AZjLjHmoh6WD33Ma7Is3ry
	 dDleT6oqZYZT7tEp8xrK5aEPy16YssFZg2ijGrNNCgoJvUcDMS+ceWJW0irI4lRuen
	 nWJbZ0ez9IeelPn3vt0MAPScp6mfPlnXVXV8xWzDTvOopV5hhUIIqSyqMDDyyAW+cn
	 lBZeVWM0GIR1WcjLfC45MGwpOPASZJEaJx1GShAh3UJ8oTxfWtdGinoJb6eAtR1FPZ
	 zEud4jvUmtH0VFVYKJdLehYxyFH/H2RYF8C6zxo/dmvh+nNdFNafTXMZvUyeyecN07
	 jFy5A9V14NFMw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:02:20 +0530
Subject: [PATCH 2/2] soc: samsung: exynos-chipid: add support for
 exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-chipid-v1-2-0bf2db08e621@disroot.org>
References: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
In-Reply-To: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614748; l=803;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=NudPmupCZnC9mmHSDb+mQPgPttYtv9oaHlFss2VQSE0=;
 b=GPlzXth4lETRLGNpEqUWPwr5IT8WZqANFiLVMpjAkqvHEVayusoAxcyx3iNO3AKa/0vu3OWas
 Z3NAjcWoJuLB8GH4mTNazCWZljHWKlkjdQyNSBD1DA3bPiJV9v5GiJj
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123256_471481_731AF354 
X-CRM114-Status: UNSURE (   9.42  )
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

Add the product ID of Exynos7870 (S5E7870) to the existing list.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index e37dde1fb588ec61d4e6b7cfe156161a62e035af..db0529fe13ae8e2ff96f055562c0a70e1ef74cb7 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -55,6 +55,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5440", 0xE5440000 },
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
+	{ "EXYNOS7870", 0xE7870000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },

-- 
2.48.1


