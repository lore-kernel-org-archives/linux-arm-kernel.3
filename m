Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C69CCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X8vmjhEGyAb9Q+g3zprM6UMlHqaEvwlEm446UF+Fb5E=; b=opjfNsxcEvR3x7NfzyhHFcTnwC
	p6SFQfKTr1PWw3drZlb9hun/tMDjQSZqTJFfCvG6LpuaYHcHQRW/mXuc552eZwRBLoSfHgOnMTasp
	XUTf0p8oI/wVLMnkYi+NDppEcRhJ4YI0fWYn9nFEoe3xsPxWG16ophXGh6YQwsW2rz2NIvTU9KdDX
	OgBcH2o3WP1wbLCletQumrdE+Ty3lGZBru3w2PCfcnCz4NOdXtQvJ4qv5YLIqh+9Ia5fBmjbOpeHT
	XElWtz3Tmjq1iJfa98biNPStt0/2PsG5nPnJptmwfLHwU/Pc9zlesFMY+46uC76OS37Kwe0RbLgIv
	2svn0O1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESX6-00000004Bm7-0LYP;
	Thu, 30 Oct 2025 13:17:40 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESX3-00000004BlM-0rkO;
	Thu, 30 Oct 2025 13:17:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761830243; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bykFlocPyOEv6VJ8hGJ+2SlM+xv5ccun8eDeb4CYDlJ4o5ga5Un/K8leZovV9noOiAjw5Uvj5SiLsrRDkQBi3iNgnn4eiiq+NzpPfPBHqfb21Z7TJmCFREStXPu87hZl0wfYt0K/xs8oeUG2So3YXKnoqyPVdnwf3Vle+uJZ74c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761830243; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X8vmjhEGyAb9Q+g3zprM6UMlHqaEvwlEm446UF+Fb5E=; 
	b=TWYhI7IamV4ShVe5DfQv8czH5tnOKVadQeBdwRkjabBS6oV7ddLysULY//VHCn9xurf7/xkOqB+7ABr42PROAjtZ5uLe9LUqvpD80fQFu1054K1+wk0yO61EaWIJBPDlKB8isOH8WQLOOAnVgYjqZ40qc8xoPpjSeAJBIV5QMvk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761830243;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=X8vmjhEGyAb9Q+g3zprM6UMlHqaEvwlEm446UF+Fb5E=;
	b=HC7j2p0ATKIKWHZ46ymqF+vJrTlNWIOnCOOYqQO0MMDfr6lfyrD0Z80kqZhYZVSV
	lWO+hfdud/gLWlY2kAE83UVYj+aKhjGkSl0yKAtdO49d2EavR4alyJvyx6l1clowSsp
	A8gD2CwNk2qC14FSAv3NvKOgIVOHYmGIr1uEBE40=
Received: by mx.zohomail.com with SMTPS id 1761830240160609.6007241076173;
	Thu, 30 Oct 2025 06:17:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 30 Oct 2025 14:17:10 +0100
Subject: [PATCH] pmdomain: mediatek: mtk-mfg: select MAILBOX in Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-mfg-mailbox-dep-v1-1-8a8c591aff27@collabora.com>
X-B4-Tracking: v=1; b=H4sIAFVlA2kC/zWMQQrDIBRErxL+uh+MoV3kKiULY8b0Q9VUbRFC7
 l5p6PLN8N5OGUmQaex2SvhIlhga9JeO7MOEFSxLY9JKX3s1KPZuZW/kOcfKCzaGHTRc+3Az1Kw
 twUn9Fe/TyQmvdwuXc6TZZLCN3ksZu4Ba+B+n6Ti+3kVVl5IAAAA=
X-Change-ID: 20251030-mfg-mailbox-dep-ec32ef510e6a
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, kernel test robot <lkp@intel.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_061737_532730_B1162F06 
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

The mtk-mfg pmdomain driver calls common mailbox framework functions. If
the common mailbox framework is not selected in the kernel's
configuration, the build runs into a linker error, as the symbols are
absent.

The hardware mailbox Kconfig system, MAILBOX, has no dependencies of its
own. It's therefore safe to "select" it rather than use "depend on".

Declare this "select" dependency in the Kconfig for the driver.

Fixes: 1ff1f0db6aec ("pmdomain: mediatek: Add support for MFlexGraphics")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510301311.TcOCnZ1s-lkp@intel.com/
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
I assume this can be squashed into the mtk-mfg driver addition commit of
the maintainer that merged it.
---
 drivers/pmdomain/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
index b06aaa9690f0..8923e6516441 100644
--- a/drivers/pmdomain/mediatek/Kconfig
+++ b/drivers/pmdomain/mediatek/Kconfig
@@ -32,6 +32,7 @@ config MTK_MFG_PM_DOMAIN
 	depends on PM
 	depends on OF
 	depends on COMMON_CLK
+	select MAILBOX
 	select PM_GENERIC_DOMAINS
 	imply MTK_GPUEB_MBOX
 	help

---
base-commit: d78b0fee454c25d292fb6343253eca06d7634fd9
change-id: 20251030-mfg-mailbox-dep-ec32ef510e6a

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


