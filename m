Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8D1C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqGmJn8cJZgdCQ0s0hosjUCyOf8EkpHhMcNeiToi7DM=; b=mxUPBpuVsitw9xySG/O6DQ4cgI
	o4G8kxlabJ4f94yUbmC2YqO1x9SYm7Q7r5Bq1vLkXATQYmZ5Hu5MTuAXeWfHP74fea0dGA8cfr89w
	4KskYZkyrJ2QvqcbnyfDq2o9eqc1/Jl2LR/ktHTkOEUif7pPBO7BRNbTWSy8OZDV9qB2NIyEbrnU+
	6yEBzpvQKhv9p2Of6HkwJX0wdJYWNhtzOGlTkVskzstl71s/dhFdY10mXySIdiVFTGT8HIHDBmeB3
	mlG3/yXw7eNz5Kq69VS+DGg5cINOvzfW6oGrCq/SgXgb4Oi5Ec2bnuyNUpa3K0GQDE2cCGel5ROPp
	mZUMkLOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiRN-0000000G0ZJ-2IhW;
	Wed, 06 Aug 2025 18:00:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiHQ-0000000FzGF-2F9H
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Aug 2025 17:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uqGmJn8cJZgdCQ0s0hosjUCyOf8EkpHhMcNeiToi7DM=; b=ly+ThpuiDubEi3vT/15Y8X/P/X
	baV8UAbu6zJRpBSKGvbTamMRoovny3GYgLUt7BCKMNZbscx5I8MvG5zRBMwtjH0A8Yk5xsqNE7qQr
	tXUhfOMlWd9eVDIqUFJZx+Rv1qzCPn5AZ9cpzj5MYxQCfwATMMvNZDcWrKm6v1lx4xa0Z6ZUpAHsD
	ul5oomdkrPgqVwh4mWDYvSclICYaV0xSGjnZNmxSu55uHxqCSR15RsmzocE00KckUmteC8p4zGsiT
	LhaxaP6vu/oLsFoBGQ62Awurug3aDpI1sICwkS9+jqIzANoIDlxrqXQsykWFvYlHEtHyV7KsuxJgS
	cK0TxYvQ==;
Received: from mx.olsak.net ([37.205.8.231])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiHN-0000000EMNK-27iN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 17:50:23 +0000
DKIM-Signature: a=rsa-sha256; bh=uqGmJn8cJZgdCQ0s0hosjUCyOf8EkpHhMcNeiToi7DM=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1754501632; v=1; x=1754933632;
 b=Oxlo+nVBCnRdZT1wE0LNmuNE8GlrGS86Jm//yANCp0yD7Wykci7snNLbOJCYBIO6FXHwwZcD
 pzy3JGhgAeX+be8t6sQHKyzPu/FDP6i43T7RvOi8DEM3v6HQn1EjNj+Wbd/WO4FGuUI0T2lbLEs
 NKhGj/2nKS6Pi5s81j/FJKjaHp3ATW6vhY21y3Lc9xLbU3kOPYScmIVJGxbYC2IzbgGzle1/Q/S
 OK+G7dUY0lPNyK7TsUAOnrEevUnzToV8ngbeyvn+TyfqaI+GMpl6Tcs1QcBSaJKLLwZ+TIPBMLP
 ig0VMZng12VR0k9nmSpq88hw/3om4Z7cxJU3AFqbzwu8Q==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 795d6579; Wed, 06 Aug 2025 19:33:52 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Wed, 06 Aug 2025 19:33:23 +0200
Subject: [PATCH RFC 4/5] MAINTAINERS: PXA1908: Add power domain controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250806-pxa1908-genpd-v1-4-16409309fc72@dujemihanovic.xyz>
References: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
In-Reply-To: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=eJGICosdXjxas1ToQdEVslbW48DwDha7KI4VsUvnZU4=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmTJ/45pGTdFuJ03XYXV7mHxocLPjnGy+d/Xfbimntcr
 VZG5V3zjlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZjIyR6G/0F9f7a0fqxOU2J7
 w7F0Kfss1nO/6lQf9AlMrc5eYJ9WLMvI8EbgdZifmF/uyzNXhC89bbdYeKJXpTZA8e3RB/8if2Q
 GsQMA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_185021_818003_9705C83B 
X-CRM114-Status: UNSURE (   7.97  )
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

Add the new PXA1908 power domain driver under the PXA1908 entry. Also
add the clock schema (unintentionally omitted previously) and a link to
the PXA1908 mainlining chatroom.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fda151dbf229e48d791e082b1f6be2e43fdb8d1c..905f3027d00e0cd5edf59fdc7dcf6aa69ec608d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2869,9 +2869,14 @@ ARM/Marvell PXA1908 SOC support
 M:	Duje Mihanović <duje@dujemihanovic.xyz>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+C:	irc://irc.oftc.net/pxa1908-mainline
+F:	Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
+F:	Documentation/devicetree/bindings/power/marvell,pxa1908-power-controller.yaml
 F:	arch/arm64/boot/dts/marvell/mmp/
 F:	drivers/clk/mmp/clk-pxa1908*.c
+F:	drivers/pmdomain/marvell/
 F:	include/dt-bindings/clock/marvell,pxa1908.h
+F:	include/dt-bindings/power/marvell,pxa1908-power.h
 
 ARM/Mediatek RTC DRIVER
 M:	Eddie Huang <eddie.huang@mediatek.com>

-- 
2.50.1


