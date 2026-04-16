Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE72F8D76E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 20:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0T03nzSg8o1Xiwn3g5TYhAqMiuGuUlEI3maXBZPCdug=; b=zhsDHXP1AzffrrsNXzxBlV1zbQ
	3js8249eIJCfoeb9rynu4a6he7pqPqwEVwc0mWVIrAg4C5URDkqoRkDjQOF1Lq3HPmtRo/MTuptsi
	3SQMYMV1mxHjXUZcuY2I46Qy75ND+0Jj8xGdQU3TWkcygdwi2qWZF/VYrPoIlvcfjsVBy78ik9h7S
	SUkvi1ps+e4H8VFVd/8VrsFZshXab2+t7m6XkoaKwOpq5I1uR/AfRdzs0Zqy84CLj+0M57+5K19EF
	r6ciKq8GfBP7PbYaFKxPUzgluBKAV8K1ZPq0SvwtENwt9tBJM04XYmuj4ru4oLw/LbOTd5b9J/RoO
	9ViGs70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBx-00000002yBx-3urP;
	Thu, 16 Apr 2026 20:20:01 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBu-00000002y7n-2b4n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 20:20:00 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43cf7683a28so5700558f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 13:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370797; x=1776975597; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0T03nzSg8o1Xiwn3g5TYhAqMiuGuUlEI3maXBZPCdug=;
        b=WZdkX5klWvkLJ9j+Bzak5afoOUOLVM6Sy2yEzhzBF7zNsmApVtpaJaJ5afSwA3AYJ2
         QgW8W49o+7qQ5BfenDp6b+J8HfxfYH7uyho13rbshBqMFjHpsxcvNxXXdhG6S4PmmtS4
         qXm1fSJ+fXf1LAVvx2mogeES6JCDPYF7spfBlKX8hJSL9Jfg4GAhZW4r82/hZvVNTTlo
         P16X6DqNNHaV2u4G9XCDgoVKGMUTuXwiqlMMyFa2zdDgsi6K/WtDzbgdXoGXZ216z4kK
         tIYcnzNYR9L3rZDt69595c5+o1zzsPn0NInBUILcdFoJbZmVQi5jbhNYjRsYIj0GCrwc
         ToEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370797; x=1776975597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0T03nzSg8o1Xiwn3g5TYhAqMiuGuUlEI3maXBZPCdug=;
        b=fUBAbRTvK7k9FmxQWrpuRiaZ1MxjPSoRTrl6TFslYAe+zJ8pnIaHQQGGWA7fY+Y9BB
         4i7Q26ObieVdvUQz8KxMHlVvJiWfZsslehElM68A4Ed56d9oYOyRvLcPDWYnr5Qf8z0R
         0BC4jjLStiPPseD3++YlSriXTkQo7b5e+hNgyUcduke9DQUni7WsDzyrmPlW338tyXmE
         L+Trn+InJNz5Dy0jNZ1xcoSVrjEoL8tO4HfaGxUES3C4V48kYFVL22i+5g1i/5M+tlv9
         FWq2ao0F1CJ+DmT8GYAhjQMxM4aWuVInKMPRLdWK1z7k6TTDaraux7Jso4Iig1aTGsm7
         adtA==
X-Forwarded-Encrypted: i=1; AFNElJ+AeYgejUX9cBSqzB453eF35Dh1erQl+edhwIL5uteJZVM/a+PPS3rUMGXG8peyiYQnyNYAvePGCvWtWApH7K1w@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz29BGwfk8gCo9ZUj+BsWbf1dS+1YWrD0x+M1EXQu385YOyxg5
	ijR4vxm7hqYrvYovbhECQgN1CDoacTJ6KGaL4Cu/EvD63efDJriOGeHr
X-Gm-Gg: AeBDieszH+yeEvLJUIRl0orhGrTUu9L3jcqXCG6Fu8O02SAXL9fNfpI6x5p0Y1ND8fb
	a6uHgr0uBgMvvvD503FWgAcuu85YMu/QqrHlHl3JMIxaojS1srRifSLaDKt1+y5115njuIl0RNn
	XZvzu0c3703OyNNnDheexdIk8ymL4LDWRPa+1z13a0gtm7so8AsJZCjCBVkB8A0DNXZW1Ix2qxH
	kHahznCjzcdWChfCMJSp+N00Lub8LrPE1Oy3Brn6ce8S5OeWuP/q6KECSPEMK72Ht6XHspg/OXk
	RtNoWFxUCn9zxr3rl2md52CfB69QNiioVtYRzmlt4PYojzi7z+Mp/o5PbyoIsSBLPrdgq41ADVg
	9flmsqGLbowXzeXd/zhbzda/b9fzW1kE5qqkVSVOf4gaWACDQvd57uKrSie8WHEfu5XLY6SSZvT
	nlakqsullbyYyzzYkV0SA6C0bAhodVAIY9eUoLEKOX67yR2Q==
X-Received: by 2002:a05:6000:18a5:b0:43e:a69b:d810 with SMTP id ffacd0b85a97d-43fe169d563mr1185520f8f.38.1776370796893;
        Thu, 16 Apr 2026 13:19:56 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:19:56 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:14 +0300
Subject: [PATCH v4 6/8] ARM: zte: Bring back zx29 UART support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-6-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
In-Reply-To: <20260416-send-v4-0-e19d02b944ec@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2641;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=zqX6tFIGEUCVaeZF4QkxvcJ5oMEM87X0rHqUfEPpl/g=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URLOAzH1tDsqAQM6YsZ7GEyIYJznmL2L8uIk
 nhr3jf9n4yJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFESxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKx/w/8DjeLetUi3csxyMsp3tA2IS2LYDPYepk
 nusCL8dln6bs70+ADwKi4Y4a31RnjheChLnfNcfosGcDQiO00EXr5uP5c/PRGfl/oOLslI3uOkZ
 5VY/xxMT5nuqII8In4qpDumJhiEStbYx3EUYZ7+Zwh+4UUtnxVKpqcPnhoHKucrfETgSCykXo2Q
 fUsaAnCy4JQ+S1pkPa2kE52QzqYRhV9wEFf2vsQcpfdlObUuxtjl/xhYeKy8SRNhx57Odec5vuj
 9sqRIke/0799ZtihtMrHMDSvmpZiR6Ea4u9Hl1/5LOt903k8E1iUF9a2NYnSPmnMmYJLPdQ4UPj
 n6vlHIJpXlkxFYN23/W3YU5+gEGY+hvL1dALjmwmvQclDe5HCyDmkU/ZrSi3rtVbvAr+wQ8Dxgf
 Jkh6iEbGRGRZG549PgjH+uCDgF7+hWCNTE9uJt49lFe0lXkrmgmrZMNmlq06L8vcluLTaAbnK6D
 +5xHw2T2tcuviAmrV6ovuLi4/UaECUyZbSKiMTH/0sqTUFMHATLO9iLwWt3zR5u6Pf75BYOGnjb
 dV1GlpeL86CeIaFTQ93V1GoEQIlS8tM0E9PHNxgC/O3ZarpJIRT5Mf1XyFWVRlWb5DSC51YcHw7
 Xu+XbvZWPNUuqTHq1jDa3p2c2w+UZqjTtBqmK2pyHU42ZwVkbn0c=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_131958_699860_73F88B3C 
X-CRM114-Status: GOOD (  14.87  )
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

This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
zx platform"). I did not bring back the zx29-uart .compatible as the
arm,primecell-periphid does the job.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/tty/serial/amba-pl011.c | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/amba/bus.h        |  6 ++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 7f17d288c807..858a0edd3e3b 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -216,6 +216,38 @@ static struct vendor_data vendor_st = {
 	.get_fifosize		= get_fifosize_st,
 };
 
+static const u16 pl011_zte_offsets[REG_ARRAY_SIZE] = {
+	[REG_DR] = ZX_UART011_DR,
+	[REG_FR] = ZX_UART011_FR,
+	[REG_LCRH_RX] = ZX_UART011_LCRH,
+	[REG_LCRH_TX] = ZX_UART011_LCRH,
+	[REG_IBRD] = ZX_UART011_IBRD,
+	[REG_FBRD] = ZX_UART011_FBRD,
+	[REG_CR] = ZX_UART011_CR,
+	[REG_IFLS] = ZX_UART011_IFLS,
+	[REG_IMSC] = ZX_UART011_IMSC,
+	[REG_RIS] = ZX_UART011_RIS,
+	[REG_MIS] = ZX_UART011_MIS,
+	[REG_ICR] = ZX_UART011_ICR,
+	[REG_DMACR] = ZX_UART011_DMACR,
+};
+
+static unsigned int get_fifosize_zte(struct amba_device *dev)
+{
+	return 16;
+}
+
+static struct vendor_data vendor_zte = {
+	.reg_offset		= pl011_zte_offsets,
+	.access_32b		= true,
+	.ifls			= UART011_IFLS_RX4_8 | UART011_IFLS_TX4_8,
+	.fr_busy		= ZX_UART01x_FR_BUSY,
+	.fr_dsr			= ZX_UART01x_FR_DSR,
+	.fr_cts			= ZX_UART01x_FR_CTS,
+	.fr_ri			= ZX_UART011_FR_RI,
+	.get_fifosize		= get_fifosize_zte,
+};
+
 /* Deals with DMA transactions */
 
 struct pl011_dmabuf {
@@ -3081,6 +3113,11 @@ static const struct amba_id pl011_ids[] = {
 		.mask	= 0x00ffffff,
 		.data	= &vendor_st,
 	},
+	{
+		.id	= AMBA_LINUX_ID(0x00, 0x1, 0xffe),
+		.mask	= 0x00ffffff,
+		.data	= &vendor_zte,
+	},
 	{ 0, 0 },
 };
 
diff --git a/include/linux/amba/bus.h b/include/linux/amba/bus.h
index 9946276aff73..854c962d70f5 100644
--- a/include/linux/amba/bus.h
+++ b/include/linux/amba/bus.h
@@ -103,8 +103,14 @@ enum amba_vendor {
 	AMBA_VENDOR_ST = 0x80,
 	AMBA_VENDOR_QCOM = 0x51,
 	AMBA_VENDOR_LSI = 0xb6,
+	AMBA_VENDOR_LINUX = 0xfe,	/* This value is not official */
 };
 
+/* This is used to generate pseudo-ID for AMBA device */
+#define AMBA_LINUX_ID(conf, rev, part) \
+	(((conf) & 0xff) << 24 | ((rev) & 0xf) << 20 | \
+	AMBA_VENDOR_LINUX << 12 | ((part) & 0xfff))
+
 extern const struct bus_type amba_bustype;
 
 #define to_amba_device(d)	container_of_const(d, struct amba_device, dev)

-- 
2.52.0


