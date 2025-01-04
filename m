Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE0AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNm4lO8LttsScN/mHpd035i5M1a7i15vRYx1Fsr1FUU=; b=3aKfG/2wJFxnsKKT7lcCie65Av
	oXX5GJBo6dgfwM9U+lIudiERZNI8UMwySYg+ByY5hBcUtpTsDAV75feojygM/bhdU/rOwto/zuqnJ
	gKppG/M80F7rvhG/gOY82VCprPNzzd0Qy6A33hJgBqnPQantX/lUQrPkWgPoig89N/pNqZzdAzjtn
	SMV2Wy/wWIn8e2i8Z72XdMWa09Zy9+cD6fAwF738AIqxOfOIMsVUBnKtexLdB9LwxNgQCSbovxEGn
	INZgXVtW7BEfbdbwxwPtRytUopHDpMlFSaNISiZkDLQRYXCtMWbHe301WmS7xmJ8QJ+KYFDkoMHiv
	Qjo9gUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU535-0000000F6Mt-1Ult;
	Sat, 04 Jan 2025 14:22:44 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU50n-0000000F5t5-2fzk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 14:20:23 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d0d6087ca3so2717215a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 06:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736000420; x=1736605220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNm4lO8LttsScN/mHpd035i5M1a7i15vRYx1Fsr1FUU=;
        b=aVDsmO3g3BHuWiDZF11Z52UKs/vT3i0YLqkiuNmnF+9/gjvke0f08AR4WLFqkGo2Fu
         /5XVt7ZLQ6Zalfnri41d8q+oY3v4WHzDFA/1nsyCAr1nL4cfsKv4+dIJ7FNy0GU/1Pbf
         uHpQIc8vS+2E6rip0MzvgufSnxKNiA0TeT8VJgOQfI32TIJ9NTJR0BoKb2Jrboab6qfI
         PnDTD9e+O4Uj7pZ5UdtN9N9vssqxasglwkqPynGqhC4K+THJCBMhMikIOINSpcbLZlUQ
         6lpyYkTndXW/WeGpf2Z+yuFqpcHKKaUobHQg6x3njznMbuArU3OGeyyykYAqkU/iqrbU
         b6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736000420; x=1736605220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNm4lO8LttsScN/mHpd035i5M1a7i15vRYx1Fsr1FUU=;
        b=vufcuyCzNUzNJEv6iPhWOSJEXEABpxU+nGdz/88C2z6O0mrjiR5aShOTNOzcbbXtqm
         w2woYxOVKrRnIcefhYOGl56u23x0iphsCOskUQ0m9PjAwJh53AFrpG4a7FJIfmkp+idO
         TMF7DPr9ZXDzqtBq4YyLjxcPnMtHce6Q7egflpcdRZgVIXhoikEyy5+edEtjWkVMyOum
         Y7K9nCJ0y9GwxRHCjiBdNmSj9xFNq+3GVOXHEDos2Ca97WMhCQvM1gMXCstoK2k2Rf+h
         t0P7RDlGaMBZSV7ZDjT9Rp3Gw2p3QXEIRuLErKKKjqiAzP6y+dWDbf620GMU5EJJZ3p3
         v3PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwlljL7JJenlt/TVQBzX6M12Alviti5x9RAWu7ZYJAAzLXvQd7BuQeJopzXoTq5uYhYtGwm9nZRjvsBpVd8VU4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo97uHMc2AWMjbNxMDEBHmNoufFhA67GHKOPSTMgARrHHzEUvL
	8h8GgR1BE7bLa1VFA65MxAU+KYbAAnGN633clvH+mol+qI4333CVYGey/w0Z21o=
X-Gm-Gg: ASbGncsDwmZVLxaEO+xZreqVUOEvM7nRDOT59fOMQ9HvCYpdOyP5njZG6kKE6pkRFKg
	798AjyLBRWmg96d8pyUYeKmJguKAV/5hS2oW7cfNzEy450U5r3WBRhxoLmBguziwLwfUHeRFFED
	lmXyiyWNFC7HKf9ipiYG25JEdh/uEiACJjyTpVcu/iMV2OTHz05i3/ebSD6WIC8QvlInq9xklLf
	EoFiePKwCMVw0LUAD5ejrUAM0y8AXFG85QFKDR7Iu64Jr2LLGY94UfSyDMCobU3U9BPtzM=
X-Google-Smtp-Source: AGHT+IGPmJFIHjn+qicLAczIza9y3UfewpY8vqEm6a6NDH7ku9/Oq/dk8QplINPtjBf7vNpk6BgDGg==
X-Received: by 2002:a05:6402:3221:b0:5ce:f524:c15d with SMTP id 4fb4d7f45d1cf-5d81de33f7fmr16791923a12.11.1736000419643;
        Sat, 04 Jan 2025 06:20:19 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed4e1sm21376270a12.70.2025.01.04.06.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 06:20:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neal Liu <neal.liu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove
Date: Sat,  4 Jan 2025 15:20:12 +0100
Message-ID: <20250104142012.115974-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104142012.115974-1-krzysztof.kozlowski@linaro.org>
References: <20250104142012.115974-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_062021_672015_77109333 
X-CRM114-Status: GOOD (  11.42  )
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

Driver removal should fully clean up - unmap the memory.

Fixes: 0890beb22618 ("soc: mediatek: add mt6779 devapc driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/mediatek/mtk-devapc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index 500847b41b16..f54c966138b5 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -305,6 +305,7 @@ static void mtk_devapc_remove(struct platform_device *pdev)
 	struct mtk_devapc_context *ctx = platform_get_drvdata(pdev);
 
 	stop_devapc(ctx);
+	iounmap(ctx->infra_base);
 }
 
 static struct platform_driver mtk_devapc_driver = {
-- 
2.43.0


