Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCBDC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7b6FPH7tpbMtyDXufMUwUF6RvC02CLrBmvJ944Zgtpg=; b=oKTcwrtcsW5MNwBGg93zaZ5D6W
	jHqtZpfbAqzPWNP0Lgn0yteYcwNpFnNRxGuCMbH7N4v/ooPbeWPIl64Wl4rp0N1otZLj8BkSn4d2f
	Zr+EZ1CchzWV0qZT7plBjfNdLNWio6IzDIvusf8HDyschYEFDMKjTsLMHDx4B803mpNEn/VH6oIrn
	PnLIHy98fXxKj4LrGNHranFMh35e4CfkVA0MU+jj6dMmtllw5ysxvUHtNKqJcRxN7C/o9btrUprSx
	o0nuyZtkBnYBSTFS0rBbyhN0moDwWGLpYXABJE7/ZiideL705q7gMhyDz3ifqppBjFRIlZ324LC2O
	9uYJemig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGEw-0000000Bh0X-1c6C;
	Tue, 06 May 2025 11:13:34 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEg8-0000000BORh-3oyC;
	Tue, 06 May 2025 09:33:34 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-476a720e806so51686771cf.0;
        Tue, 06 May 2025 02:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524012; x=1747128812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7b6FPH7tpbMtyDXufMUwUF6RvC02CLrBmvJ944Zgtpg=;
        b=AlkTlFtVf6fGxMj0VSLvAzXDEVc+nQxKxBKU3GJZBnkEpkML1RvfkOnpLJLOw9pihe
         HhbfpRmbkwYxmhqCr9Pyk9+XaaOqSgkA1VmZcN171ERbcl6VHTtETe+flytfDgikSlXI
         3Bbg2ZxpjsiQ+Ew7OCTteMRnJ6HsQqWNG2Ny8szDg5rFy/jiwgdmh3yOxKyoy+HXTUu5
         ODfA1JO7IQJPpSryPQ2ea0xDFVDgvGFKCeLmGP4wNcsH2dD/rwL/DvFUvXoDCvjxTzQf
         9rMT3/eD05P+qzzZi4Ew/eJTyFewe18eaGc5gERi0wAymF1Eho4QxAETAb/0JuAz5jih
         lZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524012; x=1747128812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b6FPH7tpbMtyDXufMUwUF6RvC02CLrBmvJ944Zgtpg=;
        b=E8F3DflDrKvWu8BBCD65fACXujOQdtAi69Q7zGiaeQWblgvaZoNzEXByUZnSnUlK0U
         qfThaUCqhOc4//rDnj49fkhvgSbCCe9kn2z93zIxpsAovSmCu6Ki96LdLPaF4Kwbz3Sj
         1WCKWKdrs+PS6R8te8UdcnjCpZgNSnfqpWWOl7sNucprVC+AhhdGW15pI3tDg4ta4Rg7
         6BXMJIB1HGdDLdqiUgUbBvhKy6BtMroq3m4jiiCX6zIqEFqFFXfwZ511ReiRxaFBMyfY
         k0ROeMMKh3GAsOyDuOVPZfEb/3b53yo2W7XXLBKIzla7z8aJrZhQARFQPmNlODUuqlb/
         zNSg==
X-Forwarded-Encrypted: i=1; AJvYcCVCdco4WSPkPExubuobjHJpTxhdJ6ZWnRaVv0Col4EonVW8OGurLqsMn1lXCGFLTTx/XNlj79VRgBvOUq4=@lists.infradead.org, AJvYcCXXAp6Z5RBa5JmLyvLYiDxBByI+4luJcfuSAAhbSII725lkGiJPybaNXHXjZn3Vy1/o2mqBIOimvW4SNAHr/OQ3@lists.infradead.org
X-Gm-Message-State: AOJu0YxBjc6apFGlxvsN6yECn8OqlGOSJOt7+uuK+foaOYNixK81D5Bf
	y29m1lwsY0ZW5IMtR3aXfWdTPL6lWuxU3rZ0p3TSshSKcrqLsVOy
X-Gm-Gg: ASbGncshR1mpVohp5irnmkKSAc4CyuQ5zmx75FCdDPq8hec+6tghSVZyR0ugH/KKLRg
	YmpdSBc+RHE31WduUTbj2ZetWQBA3cDsAwwj9sXf/dYj48TcrAaDJWd7jPsHQmwW+NNHy1MGUpe
	zMY33kJeJYI6DnbJwX6O0urz5p8+Eu0mypIpx4lr6QQq2x4+i1HrDJoO04IU8g9TXv88OHhpmB+
	7k2BjEOUtGVFoVsZl4zykK8VDJ5vgpV7Jq8BknkXM6MJ5ARD30QVaUmqysirMsLPPu+YhidekBq
	ZJB8u/Nl1oMczJku
X-Google-Smtp-Source: AGHT+IFxXii2pf1jlW5RlCREc3ls2A9Oonn2wTcNloToOzLYm2iAZfy1uAN+qSi/0vm0NCoUaFddKQ==
X-Received: by 2002:a05:622a:199c:b0:48d:e36e:9836 with SMTP id d75a77b69052e-48de36ea26cmr138510361cf.35.1746524011717;
        Tue, 06 May 2025 02:33:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-48b987209f1sm69892791cf.52.2025.05.06.02.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:33:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH net-next 3/4] net: stmmac: platform: Add snps,dwmac-5.00a IP compatible string
Date: Tue,  6 May 2025 17:32:53 +0800
Message-ID: <20250506093256.1107770-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506093256.1107770-1-inochiama@gmail.com>
References: <20250506093256.1107770-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_023332_949582_6D1FF962 
X-CRM114-Status: UNSURE (   9.44  )
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

Add "snps,dwmac-5.30a" compatible string for 5.00a version that
can avoid to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index c73eff6a56b8..de3098a773ba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -410,6 +410,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-4.00",
 	"snps,dwmac-4.10a",
 	"snps,dwmac-4.20a",
+	"snps,dwmac-5.00a",
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
-- 
2.49.0


