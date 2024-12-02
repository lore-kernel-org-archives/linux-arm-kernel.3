Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1445BD78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pxSoz1ajcI3n8y8uPzRsEcpmfNX2HaWKguXvR+KRDQ=; b=t2vcpzoCunjsnM3/ZjoueIgKfy
	Lc1aUBNeapkwTTbbYpTBF4hY9LiyKxqERLQIqn6OKKMsDv/TgtRsknwH6AKf3mN3qAZi0l922oEDu
	3Ux2Cf2vKlmJKFNEPKRgEUe7JCVEKz46PAwM6p7kEVj/cekjlPoqoETn0ChsDqrV6TeoZG6cA4Dj1
	uW97hpyKxVi+Sm1s8XjoKaYMJyXc9WlJR5Ux97BCVvxtizOewB0xv/dIA5zL2xGiIBsdO675L+1C0
	o8jKwhZMvPIb0m6gyKZrrk6J5ldBhNjMoQbV6f5Z3a8nLGZ5bwsl8AuPzDC3CUUFt6D1cHHm965e4
	hpXFOoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8jL-00000006jcT-1Otm;
	Mon, 02 Dec 2024 15:52:59 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8dx-00000006iKs-0d3U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:47:26 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-85b92397fe2so517151241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154443; x=1733759243; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pxSoz1ajcI3n8y8uPzRsEcpmfNX2HaWKguXvR+KRDQ=;
        b=e4JH/3nvq/DVTYMyawz/A10g+fFtsty6yuX89g2psHdVfRE9vdi4hjyX5PNJPOyis0
         KX6UzJSSOof4NGO5gQBUkam73BZ6x/AP92/IcUAaOk28U2WNi71ED9X3AYyaVpwUNFwJ
         WYNz0mBNRL+0Mi7H39MQtVfbVKUKK31jEBoGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154443; x=1733759243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pxSoz1ajcI3n8y8uPzRsEcpmfNX2HaWKguXvR+KRDQ=;
        b=HYFzjKd70syTg0mhuXrcV/p9FzlvsZY7Jh4XLtpp7yNHv2J3jnsDgHxUVy78D5P+Ya
         ZWQxFpqPZLbl9zItGJJiB63xZJ7v/90zYH04OqSmyVYCLToGeTfxhf4LgOh/z9pb8s1s
         nK0vxTdedxN+r4Gp1poYFU+63NLHCFtwnlr3+farkImsLxVQcKA/VoM9bBHOfbInRhwG
         0B9Hz+nx5pHJg/Wy8CbYvyex11S/CWtUMXSvX4gj8hpxgv/WKonE/S/iH2hF1pNro5UT
         b8yr2eAlA6cKlFCUz8AEy6qyr652G08kNSMNyMnhTI1Fmz7RDlNcuDJTOMzJwItUAWzb
         6s6A==
X-Forwarded-Encrypted: i=1; AJvYcCXc+fmoxP3QXuJC9cZqVNgTKzId1v7hIW9An+u09M74GTnDm3chwT2kNBRWfcX2rarbfjLMyeyzUx99OSjdLWe5@lists.infradead.org
X-Gm-Message-State: AOJu0YwjgNhz+p0jtQhimqHPZxfoCiqXDOCuBQc8AiOUKgNlpZWOw9E2
	jN8mMp8v5ZPnSSLwKWQKzXWWhH7JvBAsOskDINU5Gx1a0GVLq6s1cW3JxlEgrA==
X-Gm-Gg: ASbGnctb8qfrgqcnJoKa08IGGAUj6oYv710Dx3R1p2KROpX1YIk4RTdMQTOiRDwajQS
	N821rFEl9Mm1Dv1+E0vSD7fOhmLs5unFGsOL/vKsXCnF1ZqDI29PWRbhpaMhcIU2AYMjJojJSoi
	5NvugtWX0d1RAAyGZGXhlFIoZHVMCAUknRd4/17VPWyaqYejasBj+xilLSLmasgQXfx3jNeYMU/
	Fv2YH0Pck54XhubJdP+/5S/qQB540eLX/to8a8mVNkvEOfiKIvt5US33wpQpkFPqE2PzFMMK7zq
	Ey8HwDyv/rQI5bBX8/YNxohb
X-Google-Smtp-Source: AGHT+IGaWcZbV6qtojnjaBkX2eRGECUPG2dd+i3FQicKN4gnW5JGkqWcKAek6j+Ilms9M2b0vFq/qA==
X-Received: by 2002:a05:6122:3c4f:b0:515:3bfb:c7b7 with SMTP id 71dfb90a1353d-515568dab17mr30842699e0c.3.1733154443629;
        Mon, 02 Dec 2024 07:47:23 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 15:47:16 +0000
Subject: [PATCH 2/3] media: atomisp: Use the actual value of the enum
 instead of the enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fix-llvm9-v1-2-2a50f5acfd0b@chromium.org>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
In-Reply-To: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074725_190404_4DC3238B 
X-CRM114-Status: GOOD (  13.89  )
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

hrt_isp_css_irq_sw_pin_0 has a different enum type than
irq_sw_channel_id_t.

Replace it with the actual value of hrt_isp_css_irq_sw_pin_0 to avoid
arithmetic operations between different enum types (and make the
compiler happy).

It is required to build with llvm 9 without these warnings:
drivers/staging/media/atomisp/pci/sh_css_hrt.c:68:19: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
drivers/staging/media/atomisp/pci/sh_css.c:1233:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
drivers/staging/media/atomisp/pci/sh_css.c:1237:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
ro

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
index 2c47e7820bd7..69e68ecd6bc3 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
@@ -18,7 +18,7 @@
 #endif
 
 /* The IRQ is not mapped uniformly on its related interfaces */
-#define	IRQ_SW_CHANNEL_OFFSET	hrt_isp_css_irq_sw_pin_0
+#define	IRQ_SW_CHANNEL_OFFSET	HIVE_GP_DEV_IRQ_SW_PIN_0_BIT_ID
 
 typedef enum {
 	IRQ_SW_CHANNEL0_ID = hrt_isp_css_irq_sw_pin_0 - IRQ_SW_CHANNEL_OFFSET,

-- 
2.47.0.338.g60cca15819-goog


