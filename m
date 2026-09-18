Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049BEC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=; b=KrE/rfyodyhYt3QY1CqAu2az6G
	uGJO83wlFA/RMlQkH4z6SuxIVDX/Ht4AP0tzo1WWbNxrfaZ0RnsclBAyFkgFBbreju3hpr3tNO6lE
	rUHmt75DsyDIPxbhEpe8zTz0G4Wehw5Kv8HOFQJyHBk7mypK/Oalmd4IoSd4PttEFKNArUWAiciIi
	R7+yXQPTC1jipMJaYx2dwLI5vYftoTTSCzgSBv8z58ND7H+MIMAR5vvuxTlOgepnZnfZ4aIpN6iKb
	k2hDnGkf/RPDmFZR+sjjAJgD4G8PCnxNY2Nt0be+OuNiN7ZmPVbRCvIv6N+CDq/HwY4zVixKI/vr7
	oKEfDVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OrU-0000000DM9X-24xB;
	Fri, 18 Sep 2026 03:02:04 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OrL-0000000DM5o-2UH8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:01:58 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed6d6eso2370625ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 20:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700515; x=1790305315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=;
        b=qFA2jG68nwuhIV7voYvJGuPfE9iFiCNnqcajzjUFeB/6x4jfeAk4mAdZ1j2TsU8MBY
         K2bIJpToe7LQBoFPbBP93+pgPS04EM5N0346EC0ciwtAnsKzngD7e/YsBbHGZaTVpbuI
         WFJtQ+mvPwyi4P4aCq0Jq+UDXToBqigLlGnpGEfGeU4APEpw21lMEqhfbVfi/CD1z9bm
         8r2lAvhCn063k+RjPKbF8z6nAtVBamLo4BXBJ8nTkXrJOUBOo/AQsDR9cWwB5R1jDvZj
         0XrHgg4zsTze6AfpZ70OdCN3D18y2gtvIiyvvp4iBh4PyGg07QcaT9jVGXYjh8hpOr+U
         HknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700515; x=1790305315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=;
        b=OfEXFlB2IL/2g142CCLd0wEwN2euqXmCIC++bEVblPWU+MIb3ItRfBYGjgu6aQX0Wg
         cDA8Q1NERl2yB61Os86RqVl576Tk2XC0octipaBpm4nOKO+oeG+gSgMBfx1iVhFp+aI+
         u/zVnARU+X9i8JAzKGUhvsUCO6PgUtDG/eMnPGqSF46pJJO3UDXIA6BCi4N77xPY1WIM
         Wld5dorTOLVAT/ib2eIE4BJl7lW/whHxeXuJ8kNBGKfjIcnL8l2uK3pQhVptjGkFu7dr
         2wSPYneDDQatNgjPYtwhQTlG7i7Zj3cxh21phEbohsv9xdKHB2jCqWb6RVlfXAZuzA6K
         lR6g==
X-Forwarded-Encrypted: i=1; AKwUvBwQJnoUwPpFvlxo10gyXut1MxfGCLXhohhO4260K2PuVPFSKoaHTddIboIzKZa2Jg4+GfQ9rsVdhqLumitS/dPy@lists.infradead.org
X-Gm-Message-State: AFuF++lvkzeuL6aDRmB55zGheL08xDKNjXjnm9onF7Eaiy8kLahxVN2H
	eMP2LOCokVXTeLBszgnP+KM4xTYw3RZtmsfRat5KKE0a3WY0SmR8UQMo
X-Gm-Gg: AYBFou371G0zSDflAUzMtHbKjCosfNA2QR9T5twDfE4F59fbpNPuUt2iX9ISGL1yUM0
	kUc/imVIGU8uw+EAt9lO+B9ZJXlhDMwWXqnwQUTxCR6oepheP/UxxS8SShC3C1FmYCPHEKjIta7
	tCm747pW3M+1FIWqKlCg8FAqvju6FNh8gvOMsZA6d7HkK0lfH4eXKfpcWp/wmtBqRwO5oGcGYCZ
	YsPTgcguFGCpsRzcw/A0MFaf/R3gFmQvXDM99UgNpiWQGDcnvMgpMmviqpSe2/FAa34LBuvKHDG
	ZOFMHyTxLeLJDs/OEqfVw3J/nIh/hoTXXIn64pU+URXaHMFFgW04lhpj2LlReohs8I1xcL6fIJ1
	G+p1y+lwvU/GjQ7i7cBFTDGrGMhL5cdSjACBWukybcXZSlTjxRm310dHZUK/7Io4EoXB5tPSCO8
	957OQOdklc26ELkfGikNfB8XdmhptvNW9fs+/TSUB1YYqoSOyKe4N6I9UGgpYpxgK6XLQdstVzq
	62l6t7ASt8fFsNC+GP0//SbYM5Vq5+GYw3C+hsa7yjlsVqK4Znwek1fZDB1KCw=
X-Received: by 2002:a17:90b:4b87:b0:39e:345b:3323 with SMTP id 98e67ed59e1d1-39e54fb121dmr2271373a91.22.1789700514999;
        Thu, 17 Sep 2026 20:01:54 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:54 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 6/7] drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms
Date: Fri, 18 Sep 2026 11:01:24 +0800
Message-ID: <20260918030125.315978-7-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_200155_629774_52EFC83B 
X-CRM114-Status: GOOD (  12.58  )
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

Add ARCH_MA35 to the platform dependencies to allow the driver to be
built for Nuvoton MA35D1.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
index 7cce86ec8603c..295d246eb4b40 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VERISILICON_DC
 	tristate "DRM Support for Verisilicon DC-series display controllers"
 	depends on DRM && COMMON_CLK
-	depends on RISCV || COMPILE_TEST
+	depends on RISCV || ARCH_MA35 || COMPILE_TEST
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_HELPER
-- 
2.43.0


