Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8B2C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HLgltB4THJQ0RUi7GSCFTI/VqfppCPMEOUm6TCN59DA=; b=L2TIwRBDpbUbtAyhDjzCGaPD2E
	+u6Si3YJxt8ojCnxvYHhiz+qLm/EFR0ZSUzKorUBTe/WvAwBS4dmdsb3lxv65yBqFJCpI5RyKtgp4
	YE2GJvJt6Q5IMYc3kYdnmOafzIFyb8Z5IV0qgNyx1yyftWwk850SC+bjQ94erLU+0SvSNAuu9jEqc
	G5DtFoW42UegJGw/4/tZP9rsotMEbWW+ktt0uGXAPAYOC8gUVGT5DRtHDkcnnWJvOu62Fh475cxcb
	0KB8ONeqflKdk6Uaz/ZKw+8LOm2UoPGyA5GDcjCeHwMopeP/meFEAt+bvr4ufGSGjJs4lEkCq+QzU
	azN3XLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vk4-000000098Uu-0Njr;
	Tue, 08 Sep 2026 13:20:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vjz-000000098Tu-3PvN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=HLgltB4THJQ0RUi7GSCFTI/VqfppCPMEOUm6TCN59DA=; b=WqTSJAw9RVIwbmvKaZQe9NYcuW
	ESRRmmDmyVGgArsDYjsX4djbBQK7SgPICOsjc8mZTQ1Wm2+zbW7Sxv5BVXm8cmw9RnuKnNi8K/OCY
	fPgnz9GVM3YjN/ng4wzK/aTMl7upm7NtHSMV9UppHfBkaXqCHt+553Yy5IuKnszZDnEozAkwPrrdw
	ox9MuDm3GoyHIN7/vj5y/wPktT0gUJ4PuXvn5KxZSINeHoMxcVzU2AQZppa6iUfMkMYECVO9z4a+z
	CId5PZdbQHTMkq2jYETaV7pr2qh+5Pym6lbIDAyZAgWvPl1E+eydpqXAPOuk7UewKQMAXpNZct56G
	jehyUmPg==;
Received: from mo-csw1120.securemx.jp ([210.130.202.131] helo=mo-csw.securemx.jp)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3vju-0000000HSXW-3BgF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:19:58 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:Cc:
	Subject:Date:Message-Id;i=nobuhiro.iwamatsu.x90@mail.toshiba;s=key2.smx;t=
	1788873584;x=1790083184;bh=Zw6CDH1SqvRAOoGf6u6YMlXMcatv/Kq25DVxobnhcVo=;b=iDV
	f92uZW3j4c8Sj+1SNWNiBKXx2Vdm7w5cxI4a6yJchePBdebhVRneJbFUKMHOassGG6d1v70q44u1l
	afJUXtQKE6kj8JYV9rh+leLKLrRsAbZsWwDyUSoAFSeuZC4obFmyZ7iSwxuNRsqVAZ6IRtE6YaDTg
	Ww+5OGWJnfpbIo+OKzYMNbUXdSTZVIlyaaNw2nM+efTQlRUFQBaSAJbeFHMYnNwUQS2zTfEt4IAag
	ElsWxxgB35omr2WdOAD3fjTxmPOofzBA2AINcdYSLxopDVX1C+xPVcO3LooCc1nFAmmU+VhcPIpoI
	xV9WrECN0+7eOm1ZHV1p9+xnpiMvA5g==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 688DJhR5390204; Tue, 8 Sep 2026 22:19:44 +0900
X-Iguazu-Qid: 2rWhoBnMSUnbwtukGv
X-Iguazu-QSIG: v=2; s=1; t=1788873583; q=2rWhoBnMSUnbwtukGv; m=CsCSc32dUtUyIfxbQTWAKz096b3n0mVzQSY5v9ck4zk=
Received: from imx12-a.toshiba.co.jp (unknown [38.106.60.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4hfPg263Grz4vym; Tue,  8 Sep 2026 22:19:42 +0900 (JST)
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: [PATCH] MAINTAINERS: Change ARM Visconti5 architecture maintenance status to Odd Fixes
Date: Tue,  8 Sep 2026 22:19:26 +0900
X-TSB-HOP2: ON
Message-Id: <1788873566-7765-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_141956_134446_D2FA8158 
X-CRM114-Status: GOOD (  10.86  )
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

ARM Visconti5 architecture is not currently actively maintained. However,
if patches are submitted, the fix would be applied.
Therefore, this changes the maintenance status to 'Odd Fixes'.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6215fcb077705..f4d678bbf0a9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3806,7 +3806,7 @@ F:	arch/arm/boot/dts/nspire/
 ARM/TOSHIBA VISCONTI ARCHITECTURE
 M:	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Supported
+S:	Odd Fixes
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git
 F:	Documentation/devicetree/bindings/arm/toshiba.yaml
 F:	Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml
-- 
2.51.0



