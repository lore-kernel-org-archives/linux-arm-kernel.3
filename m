Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA85CCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUR/YLwF1kCyO5ZC5rt7tI7UKtYf9pEFcXU9Gk48s2A=; b=br+hl1K2pQjt59fOXsMVRp1pab
	rSzcLV0+biT5bBXLhryNWgWilQN1zhQYEKbjCVnlILfCZfBZdyTbEA5jp5bqD689qNOYc68vsh4ZQ
	Kq+AtpURR08Sed/eGuyEyWP56OL1yB3zF4QdQepSgrJpIGugbXk/db+XOPI2+vM0MNR7h96Y4oRH2
	rlAwSjaE7/6zhDHGgMtxUobcPsecLNLuRb3ySSbJ5ekDQi7ylDC7/AJbXH203qZGD4iQX2rpIz0q4
	ZnC3WaJnguuoEEhvAj/iQYB6ibUF/7v2kb3vVbRMPBId3gv8tPGS879JhP+4xj2EDwP4enHNpGaRo
	oDiVQZbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7n-00000003AmF-3ISG;
	Fri, 16 Oct 2026 14:41:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7k-00000003AiG-24xL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:41:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so317095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161690; x=1792766490; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUR/YLwF1kCyO5ZC5rt7tI7UKtYf9pEFcXU9Gk48s2A=;
        b=W+i/1prK3Zo59SVz19mpQbg+p9I6vZerep/7Kxe8K2f6Rh1anl/3HWdEYSGYznKlMC
         6zxny2+Py1gRO4xsQp0nFSZBmHDYPQFYsn5r+sgt0qd2oRPzzkjyTmrku1XxJbuwx/ha
         gsEnfM8H30dcVTZd22X4DcVbiANjzGKGOskk/nDGnp7wmrgsLik4riLncikT6cnFNuwY
         IJViQW0PblPVYlz/pmhGfynsFpYtcFllBvpxBIooL5EcIyo4lpstuos59bsrQvS51XBG
         X6mlPNLiR+OjWBKu8j2q3iu9Jkf/1no8yjHQ56V9p3ya8ERAB2tp2tSeLKKyFoi82EiL
         TeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161690; x=1792766490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aUR/YLwF1kCyO5ZC5rt7tI7UKtYf9pEFcXU9Gk48s2A=;
        b=wqdtI928DYtyFI8NkWXBzJMVeWsox8/Q+2pOuAGv/5Gi2RFlykVc+9ozwdr5HtO+/3
         5cmeja2s1nbnZHt7DRxzIoKd/Y1EldncJmYAl+dvmxZYAtCAGIyuqKD2ywF1er9MzOB/
         sgcss7v+3b/eTasol7NjrPzpzHAVGYAjhw66gPEc0eY2MdbDNhp86JvSUcdkDVW2iBiq
         iooM8dn8eaqtjUnHymhEc5DKwQln/VWbU3g9ji3EaYKNoyXUHFHTrIY/E79NFNyuHLZ6
         d4rM5RjOK6rza1wgp+hatjSWM2dfEcvMFinigyc33jCD2Eii2KI+h7VVfqg9qZywvacd
         Jh9w==
X-Forwarded-Encrypted: i=1; AKwUvByYYX1SL+bXqov/rXmyl1eLxF6tHZmtf12TqNdwrn4U8v6rnilsTpezqezW6+HG+rU+zHXn6PnOawxfpdJsrrSB@lists.infradead.org
X-Gm-Message-State: AFq9FYJiHk72zgyqGDhinLGZfCvr/QjfZfSx5I2s1Vo3HKwun+9IGQOz
	LlmWN/ke76qSW/6VLgl9rwG4YySu+LaJBMqKKf7ssH37mCyZcumFtB92Dd1sHgMWyIw=
X-Gm-Gg: AYBFou25WDHwwjr1EtWkDGAv3H8guNLmFHXmvGmUtBzEbGupgn0lxtsFfx/SmSqrT1n
	I11mh9H6gzjj32tD7VkHaIlabc/2MW0wOv2kag/HozLZCXQ0VgaLyD8fnAdxtDwemvSV4C+nkt3
	durqt0rwgpFwTMiiKF0UwuHk6E/btFjZsZgKXNqGRZIycZM+m6CwTXCCn1koKOPKcr2X3Oo6sCG
	9llUdOAJnYaLohJ8AP9zaDpfIeMd0Vf8JD8NJWc6QLFSnmFCx0ztJxNxLWJGeyO2ytX9yK5G/os
	+czYV9U30hh2AtPuYChjhnbZdV/HS6Ik0sfMa3dKgAEQGm2Tu8qzDEcOVmRbvNiR5TrRY2nLHvz
	WfgU9DgMZv1eGuo/t9FzlZsXC/9ipb4lQLBj/A2jTbqQcxTmLV72LqFZ4dRFCLixRUDrW/FegA7
	dFkjgMq4ROlKNaEKMEskhxmeDv0o0lcmfazHoIw5Eel14KOrnrskNSTym6REQvjwu7DiLQVcKrm
	aIPejzVgc3o7nCZOOYZpQ3jcjhhP7I1latelgzs4eS7+F4Wg4oYKrzN+bHV/0n4lThvgg==
X-Received: by 2002:adf:e001:0:20b0:48b:efb:4a66 with SMTP id ffacd0b85a97d-48dba7b405bmr33972874f8f.6.1792161690556;
        Fri, 16 Oct 2026 07:41:30 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:30 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:22 +0200
Subject: [PATCH 07/10] ARM: omap: dm816x: Match up capability flags for USB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-7-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1043;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=CFF/I+D31PVrHYKqsweOt6vSe2R5OqOPYaNCWBw37UY=;
 b=LP5fDZPwM7CVSE3wLSXa89nNj26IEaZ31pwORyTzdSsNC6k2TVwNfT2MMN8qAxmunIxVtM5C4
 gkH5DkC8cTODb8Sw0gMjv5I82BbIYKo1g5/JP8vQzI06VB+kG8hskYd
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_074132_562670_8ECE7D61 
X-CRM114-Status: GOOD (  13.52  )
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

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Fix a warning about flags and idle modes not being as expected
for the USB driver. Updating the capability flags for the USB controller
after updating the USB devicetree node.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index 2f55dc32e150..d2c20719c100 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -616,7 +616,7 @@ static struct omap_hwmod_class_sysconfig dm81xx_usbhsotg_sysc = {
 	.sysc_offs	= 0x10,
 	.srst_udelay	= 2,
 	.sysc_flags	= SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE |
-				SYSC_HAS_SOFTRESET,
+				SYSC_HAS_SOFTRESET | SYSC_HAS_RESET_STATUS,
 	.idlemodes	= SIDLE_SMART | MSTANDBY_FORCE | MSTANDBY_SMART,
 	.sysc_fields	= &omap_hwmod_sysc_type2,
 };

-- 
2.56.0


