Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A66C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 01:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Q0sRttI86mEpJh7BtqYPvvcOCP+5t2tb7f6cBrMGu8=; b=SI+OhieHr9lJ0Vrx8XQVcpgSRA
	rxidla/tzUJBgqjzQDscqxekNUhAu+vi3SzR2RahkKOA19ZLdtYQ9DIdHPTmG7y00ulhRAUgxbmb9
	pBdDShyI9J495CQhbn6ZvfnoZOTxWQFWQhwTESGT4PwAMF1glqfd1rCQuDai6H98NnsnOu/Wn0zkC
	5J1r4DVUbVAXSi2riStv/V+iBEkIDZ9KZ6QbHDmynWbIzX7+M9laqHdPbyGl1/wE0Lqa9hN65i2WR
	MxTmmC5xveuBDt6WsnvJpdsa35KbohxrIUbLHxz9+YeQm0nUoOvh+XY0AdNcYf6i4LxJQ+PJuXAQW
	fIE3B35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgv0u-0000000F5cs-3T4Y;
	Sat, 17 Jan 2026 01:22:04 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgv0s-0000000F5be-1hDo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 01:22:03 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-11f1fb91996so6262652c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 17:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768612922; x=1769217722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q0sRttI86mEpJh7BtqYPvvcOCP+5t2tb7f6cBrMGu8=;
        b=HeKoGNtsTnPqoxGeqNXE8J/kyqrVgaSDtU6xonpXb2Pay6Mih7cU7Ra6czvyAi+V/A
         p5qVdlZWYwqQmxik4QxK97jmUxucac3UouxVh5HtOfKa4ZfGykt03bzAsYtfUDvQ9elf
         9GFmvmf3o7dfxObu1c1ZrYfOzEZ5/aVnxcb62Fp4QIICcOToT3ARciF6tj4s+3/rWKN0
         sc5xjYLmfe9V8vYuP4pQPJsoQBneWIfNgJQyzR9ByGYIKCPW3qS0zFqDZSDFVXKS1N2K
         EjdAyN1ajjweEDJ5ZzoTs1dgvstjWSuCdHG01IPpjy3n9NKEuj8HQD0TQIcRTzYnBmhC
         F1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768612922; x=1769217722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Q0sRttI86mEpJh7BtqYPvvcOCP+5t2tb7f6cBrMGu8=;
        b=YSzzbuO6XmG2GJmWU94vync9qn7qn/CUV/CxXervk+MDl2IKbpXtTRN6wiWe2WirIb
         i+j8Yb4Rv2v56rqUfV9/51YhK1kDL5FRunZW2sk0qhBWLG6eUdRF3eOH1CJspVg8Gko3
         XUhTbEh7/1FqnrmEwVFwBm75dI18Blv3PZUvoVnD9f7DDrMwqnwJpzrvpUM7HpeR13CI
         uhME9UjgBgt1C6U/jR4I4LJWvJleR+fCER01NUL2RuxbvEuOH0G5A8lKh0tdRl2nw6zL
         W6rgI0W31P7DPNvGDcuA0XFXKiIbamap2TDrxydeswe5xJ16W+Nyv+QxvMeM06yYBNoi
         0vfg==
X-Forwarded-Encrypted: i=1; AJvYcCWhX9f6urEL8sQn2M4c47+MMB9GNnEMukgnpH9+poZiUSQ66PPER4tjnnv5Z0Xsj8TqWwIOqxnmO8ZwFfoqmw7q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+p3HNmn8rlLBrebPfGESsf8v8kYjr0z+z0Np1Ey2cs9zPEBfq
	NtTXnunSv9inFbCdawANSpbU26eSqy3anYJgQ6/vb4MYeN4E5MVFjSEXCZ07uwRywug=
X-Gm-Gg: AY/fxX6ndN2GyH7Dd+RELrqM5kS04Dvobd57zcXWS2uQMOPgbw0GqsGNfGvvPI6Gfzf
	JEvXjjuO3ACK4tP65EwNtaTnGMon+1WEkc0p0ZpujAX69h6LzR/FbKEfaGmilvBc22ZsDU+6ZdW
	gBMarVApXcAHg+Y+1mGZTPKSEc3rU76sOI8fBv1/YTczL7xbHaqQODoaXQwqsIh3z+bQPSK0+Bv
	zow/5vgPAYqkQxNvZvtPlsJuqt4FzHR/9p9qxLMZ3L1VPicVrfKToywWYhaY7tNqiWnHUWt3mI+
	rJkym682R1gI9LsayZYNeE8TbsLSmprqOCktVCej8zB3+2uLNTXiRZ/l7xNjojIfH+9QlW/FGLj
	iPjyLHlEGBmwFft+jr48o/RnUchy7Z3vNINL7xlxqkyKAuRJuOsdYRgyM2HDacxwHECo+WVl5Qy
	BNncCjI7Si3RU=
X-Received: by 2002:a05:7022:322:b0:119:e569:f279 with SMTP id a92af1059eb24-1244b3802e2mr4431118c88.34.1768612921745;
        Fri, 16 Jan 2026 17:22:01 -0800 (PST)
Received: from localhost ([50.145.100.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4977236c88.16.2026.01.16.17.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 17:22:01 -0800 (PST)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v2 2/3] spi: xilinx: make irq optional
Date: Sat, 17 Jan 2026 01:21:35 +0000
Message-ID: <20260117012136.265220-3-abdurrahman@nexthop.ai>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117012136.265220-1-abdurrahman@nexthop.ai>
References: <20260117012136.265220-1-abdurrahman@nexthop.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_172202_440131_9DBF5049 
X-CRM114-Status: GOOD (  13.15  )
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

The driver can work in polling mode in cases where interrupts are either
not available or broken.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/spi/spi-xilinx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index c4b70e95b695..9fb1da2fcce4 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -471,7 +471,7 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 	xspi->bytes_per_word = bits_per_word / 8;
 	xspi->buffer_size = xilinx_spi_find_buffer_size(xspi);
 
-	xspi->irq = platform_get_irq(pdev, 0);
+	xspi->irq = platform_get_irq_optional(pdev, 0);
 	if (xspi->irq < 0 && xspi->irq != -ENXIO) {
 		return xspi->irq;
 	} else if (xspi->irq >= 0) {
-- 
2.52.0


