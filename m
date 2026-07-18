Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C80C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rWVwE/9DychYc9K/smhGvixkna2otDPJRQGtaKRGia8=; b=ABqn4VYTVU4TAHkC0Cxdv+ooC9
	VNE//YvO8zhQzEyw4UV9kvyl3KKKhF1erBIPsOfZj6kTr4GQ5eA9XJYnJSVQHeWb/jr4eh2I8yf2+
	iqA8gomm5DaorvzySBs+x6xt+xDO5jc4fEnadU/MrfKSuQ7lHXF88Eu7Jf/TRjQ3czFtNsEH5BTOZ
	FzQsRYCIB4ai3W+Gfn3XZ5YLEj9OabH/Z72wPEl+VD+n6qVTgsmCuDaW+t0+DMSK4VdaUmf6TRAbW
	wiZ0OIzsMy6MvKh3VedLbyVu/EvaTkVqlPekdjMY82Hd/ix1aPlpklqpsEVD40HJXkdwtj2e3yU0k
	rFcdO6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl2zu-000000042UR-1huU;
	Sat, 18 Jul 2026 11:14:22 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl2zr-000000042Ts-29RI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 11:14:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784373246; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=if8p2g63ITDvhABr/zWpriI9BywMAXDKj3F8s6oHylzQxuV9QMb8rigA5TzlZ102uNdhAFlD9LatMSG9xF2fzrlmcuWLAjWOpnD9W0kQ5PnO5Q8ObHvdse9gbtadOpRmCttMcW26VPQQdAnJi22KeeMfBz6Z0dOYzeLK8VKuP0Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784373246; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rWVwE/9DychYc9K/smhGvixkna2otDPJRQGtaKRGia8=; 
	b=lUq+iEFnrSttvegBx1BRVaCPqc+3NKbHvjjluyqDXZ8svEORYUqT0zU9SoEgzOLSPI4kZTxsUmHVAvWp93AdfNpPpEjh8dSXUCa3pExEsfZgsgMBM2YenRy/QOtXdQjcKJRN9mGlQmlQ6UpbUoxG8vbetR/BQGc1y/fg/h2Dm2U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yoavmoshe.com;
	spf=pass  smtp.mailfrom=linux@yoavmoshe.com;
	dmarc=pass header.from=<linux@yoavmoshe.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784373246;
	s=zoho; d=yoavmoshe.com; i=linux@yoavmoshe.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rWVwE/9DychYc9K/smhGvixkna2otDPJRQGtaKRGia8=;
	b=OjxlDIQPZsu0xwlECLDxUoqFVJpPMd0C3flJrzhOgyl//qNXxbC2+dWxSfP9mMDb
	SmclIl6IqaNPBtVBtOQIwAPGMzBqZBxttm77vABDO/NWGppuD3LQzGvDgtJe8oJXugn
	9Det5OsDIAYohDiaR5fjSli0xnhniJS2fLuOb98M=
Received: by mx.zohomail.com with SMTPS id 1784373244727305.1665306068262;
	Sat, 18 Jul 2026 04:14:04 -0700 (PDT)
From: Yo'av Moshe <linux@yoavmoshe.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yo'av Moshe <linux@yoavmoshe.com>
Subject: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
Date: Sat, 18 Jul 2026 13:13:40 +0200
Message-ID: <20260718111340.159896-1-linux@yoavmoshe.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_041419_605769_6BD7EB99 
X-CRM114-Status: GOOD (  11.68  )
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

Relocated suspend code in OCRAM lacks compiler-generated CFI type
signatures. When CONFIG_CFI=y is active, the indirect call to
imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.

To resolve this safely without reducing CFI protection scope:
1. Create a minimal wrapper function imx6_suspend_in_ocram annotated
   with __nocfi to handle the unverified indirect call.
2. Remove the __nocfi annotation from the main imx6q_suspend_finish
   function to preserve full CFI coverage for other indirect calls
   in that scope (such as cpu_do_idle() and flush_cache_all()).
3. Mark global variables ccm_base, suspend_ocram_base, and the
   imx6_suspend_in_ocram_fn pointer as __ro_after_init to prevent
   them from being used as target vectors for CFI bypass exploits.

Cc: stable@vger.kernel.org
Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>
---
Tested on a Kobo Clara HD (i.MX6SLL SoC) running postmarketOS edge. 
Before this patch, suspending the device caused an immediate silent 
hang requiring a hard-reboot. With this patch applied, suspend and 
resume work successfully.

Differences from v2:
- Restrained __nocfi scope by adding a dedicated, minimal 1-line 
  wrapper function (imx6_suspend_in_ocram) for the OCRAM call, 
  avoiding disabling CFI checks for cpu_do_idle() and flush_cache_all().
- Marked global pointers ccm_base and suspend_ocram_base as
  __ro_after_init to fully neutralize Write-What-Where exploit bypasses.

 arch/arm/mach-imx/pm-imx6.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
index a671ca498..3d5b960c5 100644
--- a/arch/arm/mach-imx/pm-imx6.c
+++ b/arch/arm/mach-imx/pm-imx6.c
@@ -61,9 +61,9 @@
 #define MX6Q_SUSPEND_OCRAM_SIZE		0x1000
 #define MX6_MAX_MMDC_IO_NUM		33
 
-static void __iomem *ccm_base;
-static void __iomem *suspend_ocram_base;
-static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase);
+static void __iomem *ccm_base __ro_after_init;
+static void __iomem *suspend_ocram_base __ro_after_init;
+static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase) __ro_after_init;
 
 /*
  * suspend ocram space layout:
@@ -360,6 +360,11 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
 	return 0;
 }
 
+static void __nocfi imx6_suspend_in_ocram(void __iomem *ocram_vbase)
+{
+	imx6_suspend_in_ocram_fn(ocram_vbase);
+}
+
 static int imx6q_suspend_finish(unsigned long val)
 {
 	if (!imx6_suspend_in_ocram_fn) {
@@ -374,7 +379,7 @@ static int imx6q_suspend_finish(unsigned long val)
 		if (!((struct imx6_cpu_pm_info *)
 			suspend_ocram_base)->l2_base.vbase)
 			flush_cache_all();
-		imx6_suspend_in_ocram_fn(suspend_ocram_base);
+		imx6_suspend_in_ocram(suspend_ocram_base);
 	}
 
 	return 0;
-- 
2.55.0


