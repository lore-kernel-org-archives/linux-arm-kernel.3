Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0C5CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzs0fcUa+DxpkLkc7ASzbeG0qA3dcJ9VCs0pVkhY65M=; b=WfOoiCI7SOC76EAH1iF8SgSvZ5
	WYSPKiWMCje1zWbpk70C733+/pkl0r6oVR5AfKQpxXHBf56/BkAIcYuEQ09B62gr7+FfBA02vCctE
	v3XlCvzkH0uaD7uyEQOmCFUiSg5VuVZB8RTNlwwrIFb+ri3HVhFOeqWQLfiY7l7TG0HF7VQsoRhIE
	iC9wkCVwFC1YBAPcYkM23yFh6latq9QHKcFwKB28TD2jv55oust0KeRbImRXeumGwX8RlobLQ6eam
	TEJ55hL9KoypZyyN2SyaZDuQguppu8hyG79qkPyLa9Lcvh5poIDRAbgvHzSJ9LOPz8GwAqEvF9TtE
	3Hfm81XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZuw-00000003MHc-2NHF;
	Fri, 05 Sep 2025 17:08:06 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWR5-00000001xPY-0BUt;
	Fri, 05 Sep 2025 13:25:04 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b47173749dbso1396565a12.1;
        Fri, 05 Sep 2025 06:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757078702; x=1757683502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzs0fcUa+DxpkLkc7ASzbeG0qA3dcJ9VCs0pVkhY65M=;
        b=JfP/gPkbjOvK8821uQN1ekifveK1ctZwzB8UuLrqMfCsNbLHH05z1HsI5aVwOjoi0x
         lW1SHThX3K87F/y6Orz1FR6yHcXLwpKc+4Dh7ZFdugLqCZfQ4QJIP5h6avLhqdIS5aEH
         CrdiWOjXICDsNp9ZI5b5lXyWVlPjyBSp9PGWzsDe6bJ/jHtJ8qkSGHnFkEJ02up4q6jy
         lAFyWyd8dOaeL1CyVpO+HJuegH4UZJ7IhGOlMox2Rvc8BnZpO9WOertIbj0rJiGw+uUn
         JY8jvbl0U+ZydnTw9q5REZCsDZTLmx7Jq6D1v4yErEjT0vDdWygS6pkYQaoHNODLkcPw
         fapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757078702; x=1757683502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzs0fcUa+DxpkLkc7ASzbeG0qA3dcJ9VCs0pVkhY65M=;
        b=vrKs0gay1ogJG47nGVA5tvWCKPqzi8pSt29RTf8MhW+/AsMWn20dy69c01/pbKn2pQ
         ztEOvn4wHrXILOwHWgoecZLIaGZF/879NoW0q7IlzCudrskJZyebTDzezdG3lpnseqOK
         24A65Xx2eSXRHFVzHlZAuVDwsWYh1fV7VwJrZ53XK7AiB9TzcRf83x02iGm7PcbHL7hQ
         i4GEByU48evGFSZmnvnpsUsH9FYcpfOhvnIqPNrWNsNTCaktIX7G+hjGTc5cz4c4x/9y
         n19Qe7I0Edv/rYmGfipJeu2V2+qjXCQB6Qv+JD0wkgc3VRCPriaCdtB7qJGV02cqd8L/
         Q5qA==
X-Forwarded-Encrypted: i=1; AJvYcCUT7tDOEr5cQP+yl2qYu5EDTkkdKYepn/hNy5F5rnH55cbQWYmaCXqv27zJw7tw/yACjkhn/muXLXy+QlZ1Uus=@lists.infradead.org, AJvYcCWulfp3UzongM2NtfTCJkJXABHevzKLTffNnNv1JzEWy5c/5TwH5P7t3/7CDbbptNKQQRJbujt1FGCLKXiYnKPz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhzt5ZUKVvZc6euEEt3Cd5XZyqlBg7M10i/9sLPJi87+EVMtxr
	fTt4qr2eUc8mZjzvtGbx++aex4XC0qUT7v4VUn0Ll40FVzxRlMjcAxRt
X-Gm-Gg: ASbGncv9DTqwlTUUnQdLaOFCexNHTeAtmE/1Q2GFselK/fyhPCd8vVdn4M5uiu0cr0n
	8e27Fe7GyJIgT3a0ZaVr9jpLHFrRh3jMa9B/DQ9Lv2ENOM+IC0blsvymrotxpo7HbEAzsemb98D
	qqfeouolFyHFEZXvYnUn/n2WrE1w/Mvc/1Q4Si3vTgKsrOmObqT1Tg1loYb9GEt9HJXt+SB86/S
	zge6myCY3Znp2X7Q2fp0PDPNcGkcnJXx/ehtFTu+YqfLe42efrwlLVsv2RLRZLMd0TB0raPQyop
	WcjZ5ThIodITeIFN9i/2IWAJ8ljs28p1blYwyVYuWm+KQ8+jy2UE55gseJUsygsrZhFmzLsE2Wi
	eYyFB8x7cWnUxXcKETOcQFg==
X-Google-Smtp-Source: AGHT+IH4zx4sI6FblJmB5He7a6nYAWLg6d3RbumYzZWccC7zXGmeUwtWGArXlU0WRJI06Z4GqaIqDQ==
X-Received: by 2002:a17:902:c40c:b0:24c:b2a4:7089 with SMTP id d9443c01a7336-24cb2a4744fmr134900655ad.31.1757078702100;
        Fri, 05 Sep 2025 06:25:02 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c8945d8d4sm76447955ad.127.2025.09.05.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:25:01 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 1/4] clk: rockchip: rk3368: fix SCLK_I2S_8CH_OUT flags
Date: Fri,  5 Sep 2025 21:23:25 +0800
Message-ID: <20250905132328.9859-2-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905132328.9859-1-cn.liweihao@gmail.com>
References: <20250905132328.9859-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_062503_081727_FF036960 
X-CRM114-Status: GOOD (  11.09  )
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

Clock SCLK_I2S_8CH_OUT has no capability to adjust clock frequency by
itself, add CLK_SET_RATE_PARENT flag to fix it.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 drivers/clk/rockchip/clk-rk3368.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 95e6996adb..8159f643dc 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -371,7 +371,7 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 			  RK3368_CLKSEL_CON(28), 0,
 			  RK3368_CLKGATE_CON(6), 2, GFLAGS,
 			  &rk3368_i2s_8ch_fracmux),
-	COMPOSITE_NODIV(SCLK_I2S_8CH_OUT, "i2s_8ch_clkout", mux_i2s_8ch_clkout_p, 0,
+	COMPOSITE_NODIV(SCLK_I2S_8CH_OUT, "i2s_8ch_clkout", mux_i2s_8ch_clkout_p, CLK_SET_RATE_PARENT,
 			RK3368_CLKSEL_CON(27), 15, 1, MFLAGS,
 			RK3368_CLKGATE_CON(6), 0, GFLAGS),
 	GATE(SCLK_I2S_8CH, "sclk_i2s_8ch", "i2s_8ch_pre", CLK_SET_RATE_PARENT,
-- 
2.39.5


