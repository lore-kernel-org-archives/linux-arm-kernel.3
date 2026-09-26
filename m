Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6A1C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 10:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a2QwrJTjNePGvVoDDQsoh5hhf8GU4fREmLPOvIhMRHQ=; b=thTcse2PSQaw9/BTUpwGl9i2Kc
	wMMoKFqnkSorYrlbu8gASWgQW5nuuKSro3axut37JPhP8FwGAMCr0pKpwf+zFYS0ybPGPPVvUslkW
	vqiUHIqpHmbBMQh8FWoduCPm4betkKp1HG18nZM5Yw0/LTMuQBo++X8pBkmFb12Ti80xDm4Rk/6kw
	bZ5Gx/tafWOqTQFs/DiBB+tXWd9fRRmVvhIC56VO5mlvu1McMcN4qPVv3DQcRrIJasmXL43cqPMQB
	vpn39LdCRzm+RgLK/bumpMHfL/5c1ACrIcv5pTg54wBxcCGLWqUWF37XLTIpPqP6odYaNZmXcfrvn
	MZEkWuUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAPMa-0000000FFhG-22m4;
	Sat, 26 Sep 2026 10:10:36 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAPMX-0000000FFgk-3Bbr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 10:10:34 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-530de452c33so16718321cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 03:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790417432; x=1791022232; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a2QwrJTjNePGvVoDDQsoh5hhf8GU4fREmLPOvIhMRHQ=;
        b=gyZQJ2Csz7munCHwH4G+xOggajppR2xW3YhXSns0RrkNnmJwSKfkj4Eh4HIny1VdKk
         aR0JMpdE93yHnWbFtyBcKX12+x6s771h6I5x6ETJ9Qu1hwuhiTlPLz3bQ4K3AwuWpY2q
         MUGmCGsxuDy2kZDSjWlpOdt4X+aKYPmG1IN8uuIx2i0OVZnMlcNYXOtt9Irytx+mUEZV
         mgcmk9hsmGPPnJPzozohd4Zc/rpFukadopjVzkV7vUl3nL9wJknFYlohE9vpDrZj3Jt8
         wyzBTuAUyTp0p2m/KQxO4lHV38bolpR8bqMkM1HUDhtjRcLn0HLN6izflujMu1KyKLpo
         SNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790417432; x=1791022232;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a2QwrJTjNePGvVoDDQsoh5hhf8GU4fREmLPOvIhMRHQ=;
        b=oROkIIskZDW1+kMXtQTP7QonQVbNEow/jE1RqgWATMIMfRaajF4lPP7QpBTZBFK9Lm
         rqPhTbSOdgYoYRUj38jEV6VBvqa79KFCsn7nFHpCwVBp9LvUb9QwMT2sAg9RgMdzAUnN
         c6QHaHa3c+7ufQnz2rN3EBzuAOJhlbYGWkew1q/e9DNLc/ObIrxeT5gROdngMcEJMLJL
         mqkyv7iJp6AwJrmEF6Zvs/Fw1vL0Kvn29Fmx1f3YYpCF1seryJ0VCPKfyYJPisZmyh/i
         dmO/O6Md28Ud+B970CPcVV+OefbHRBU+Puau63ybPzx6Qx7p0mkVilxpgcMoyzosE/Kf
         mVig==
X-Forwarded-Encrypted: i=1; AKwUvBzmuZWJOzB6IpWe2Vpa1EriqfSPf2ANJ91/jSUD5BZcwK8GzRx2CUhc3YD+6PbK4WwHgqqGXnJ+aTJE8BJdpTl0@lists.infradead.org
X-Gm-Message-State: AFuF++kER/W6ZkGdte4e35kH77Gg7EDobSHDY/EEpgy3pS5mUvgQWeSp
	c/uy2g47XZ2TVkJIF1BQBl3+a2MnHQwKR6ZhXF/Xnol3daQ1qxEmeITn5qoI3a6t
X-Gm-Gg: AYBFou0pGqb7nclicCR0mcqUr59f0Rjo3Yk1L13GL+F1i6phmOhyk9tXbPtBBlgerRq
	Ww/QXNfymQHjmtSqHt2eziHcKHNtqqFhd8GjKoGJ+Hc9wvYswmbAel1llWEp5rpvvNJvffBMT2o
	6VlF8QfSdEbB6ONkcdfhz4N5/OEBG13enKGMRDkHktDMf7rtHD7oPXjD/pwHyGrX8WnV0H4/Dqf
	EPgKG0Oqu/hgl74Uh4WWjZVnc77rRCM+4P9714b2d9S7Xe9Z45BLSBVN8azAv9PwmkCy0ECT5k6
	zgibOF+GxVxzlBI4lK7BhXrSqPsG3MkI1nyoROBJ9xlYeCX5nRuYwYCFEv9bNnC9C/0Cczhhoyq
	+dHaa/FrMeANv0MrQTkrMtLrevkaUlgkxu178CVmhCjSLIppXvM6h42QWzjzp6oEr9EWJ5uL7Bp
	vL4OpIjlK7H1wzvRDYihBTmtmWiw7mBaevmGIxEzHF4Ve2zb0zFcYKjGthayj85a6GP6ref6NSF
	wxdMIVKvkatKbdZg8dZYqQIvSOA3ZlU9A==
X-Received: by 2002:a17:90b:17c9:b0:3a0:c833:de75 with SMTP id 98e67ed59e1d1-3a0c833e54amr3104087a91.30.1790417063447;
        Sat, 26 Sep 2026 03:04:23 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9481e17sm8806891a91.8.2026.09.26.03.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:04:23 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 18:04:14 +0800
Subject: [PATCH] pinctrl: mediatek: mt7629: fix the 2.4 GHz Wi-Fi pin mode
 array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-pinctrl-v1-1-23904cb0c3f3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCMBBA0auUWTuYDJISryIukjjagXYsSSqB0
 rsbXb7F/zsUzsIFrsMOmT9S5K0d9jRAmoK+GOXRDWTIGU8O4wWXOjryuIqmmme0yXmybJyjEXq
 3Zn5K+z9v9+4YCmPMQdP0O82iW0PlVs9LKJUzHMcXouaD74cAAAA=
X-Change-ID: 20260926-b4-mt7629-pinctrl-1c6921e06627
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_031033_863029_F2BBE59C 
X-CRM114-Status: GOOD (  11.93  )
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

The wf0_2g group contains nine pins but only eight mux values.
mtk_pinmux_set_mux() indexes the mode array once for each pin, reading
past its end when configuring pin 78 (WF0_2G_HB6). This can select an
unrelated mux value or fail with -EINVAL, preventing the Wi-Fi device
from probing.

Add the missing mode 1 entry for WF0_2G_HB6.

Fixes: b44677375fee ("pinctrl: mediatek: add pinctrl support for MT7629 SoC")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt7629.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7629.c b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
index 385d66b8e3fb..29a4c171e8b6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7629.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
@@ -294,7 +294,7 @@ static int mt7629_pwm_1_funcs[] = { 2, };
 
 /* WF 2G */
 static int mt7629_wf0_2g_pins[] = { 70, 71, 72, 73, 74, 75, 76, 77, 78, };
-static int mt7629_wf0_2g_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, };
+static int mt7629_wf0_2g_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, };
 
 /* WF 5G */
 static int mt7629_wf0_5g_pins[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, };

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-pinctrl-1c6921e06627

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>


