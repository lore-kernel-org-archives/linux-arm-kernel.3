Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673E7F459F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 16:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oluQq07hbWM4djS+jCA/ADoiyW5DO706Oh4vC4FPtUY=; b=AJYPj44TRmkC5DSx3BUHG+UaDX
	JqpNPeBd1uUGY25eKNZ17Cs41adJSl/LFE6a5m1J38EwmpPqFGOqDdFJHARSzwa5bR0wcA5wQCN+u
	ooe66Ul0wmGWM8bJ6DrLWETWh05fi+UFhY7E/f4WUFspwEZdpUpz5KDFQGje0ij2IdolH6gOgcKj/
	ECSCyQ+qPNbdeHYa0rfZzgA6dty0BDhrNwSJ+yeXrYX/o7R+mzP5qDU4k8DAmEMbjPjBup1PFv1WR
	n5U/e+0o+Yq3p3LOm2ccpinaY7H/DzxWoWU/ZneTTtoKlAgp7ie2FBCquYxPcJnViAUdVRTYYKCev
	nfOVK97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF2X-0000000CYmM-0kqw;
	Fri, 10 Apr 2026 16:49:05 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF2T-0000000CYl2-3l5N;
	Fri, 10 Apr 2026 16:49:03 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775839735;
	bh=gEByb17aWEuS+y3knfgxZufJ5uAM0e8FrkZagNP6esI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PGX2gsl1yyc+ElHo9FsLIsNLdz0wCQ4AqJ1oVIagtF+w/VRPb2fJUfeFwtApN/lLT
	 KRzWyKBNiZNnqsfcaEB5V+x9VA08l0z3E8bxPZ/UT5jXnpu3KzWmW85Xqo0bzwuWBK
	 9JUQsqnU8Y/8WR1RHhlWiSp/efZ8eULlcwPmZebc=
Date: Fri, 10 Apr 2026 18:48:04 +0200
Subject: [PATCH 3/8] firmware: meson: sm: Add thermal calibration SMC call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-thermal-t7-vim4-v1-3-19f2b8da74d7@aliel.fr>
References: <20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr>
In-Reply-To: <20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1775839730; l=1805;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=gEByb17aWEuS+y3knfgxZufJ5uAM0e8FrkZagNP6esI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCZXPWgNcIzEeEI7sgiKyGvolQvqu+W2iXUpuLgewQ+KT9tqCB33rJpAiFgCiRuOXeroJaJ+ZpJ
 TlX2RqgZqmw4=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_094902_375256_18D26065 
X-CRM114-Status: UNSURE (   8.51  )
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

Add SM_THERMAL_CALIB_READ at SMC ID 0x82000047 in the command
table and implement meson_sm_get_thermal_calib(), which forwards the
tsensor_id argument to the secure monitor and returns the calibration data.

Also realign the CMD() column to improve readability.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/firmware/meson/meson_sm.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 3ab67aaa9e5da..da0dbcd8a2ff2 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -41,12 +41,13 @@ static const struct meson_sm_chip gxbb_chip = {
 	.cmd_shmem_in_base	= 0x82000020,
 	.cmd_shmem_out_base	= 0x82000021,
 	.cmd = {
-		CMD(SM_EFUSE_READ,	0x82000030),
-		CMD(SM_EFUSE_WRITE,	0x82000031),
+		CMD(SM_EFUSE_READ,		0x82000030),
+		CMD(SM_EFUSE_WRITE,		0x82000031),
 		CMD(SM_EFUSE_USER_MAX,	0x82000033),
-		CMD(SM_GET_CHIP_ID,	0x82000044),
-		CMD(SM_A1_PWRC_SET,	0x82000093),
-		CMD(SM_A1_PWRC_GET,	0x82000095),
+		CMD(SM_GET_CHIP_ID,		0x82000044),
+		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
+		CMD(SM_A1_PWRC_SET,		0x82000093),
+		CMD(SM_A1_PWRC_GET,		0x82000095),
 		{ /* sentinel */ },
 	},
 };
@@ -245,6 +246,14 @@ struct meson_sm_firmware *meson_sm_get(struct device_node *sm_node)
 }
 EXPORT_SYMBOL_GPL(meson_sm_get);
 
+int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32 *trim_info,
+			       u32 tsensor_id)
+{
+	return meson_sm_call(fw, SM_THERMAL_CALIB_READ, trim_info, tsensor_id,
+			     0, 0, 0, 0);
+}
+EXPORT_SYMBOL_GPL(meson_sm_get_thermal_calib);
+
 #define SM_CHIP_ID_LENGTH	119
 #define SM_CHIP_ID_OFFSET	4
 #define SM_CHIP_ID_SIZE		12

-- 
2.49.0


