Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F077C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 21:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmepHzHt9JVFvnS8JDKPsFHySoDTq6dXaw/2Vy9CkC0=; b=cIbP/xuGXGu48Hs6ee2RkROLsZ
	Y9MMcv9q1MCjakZXBN9M57n21x5VV4gMCIxnlJxrBnFur4fFkAlKe2eVS66Bx9c8wA/Msc5OmF8me
	L8sLAaRuJnxKsb9PkUFlixblly6Fo9u+Vk/x2Lc02sbsX2T62lB1Vfeqc9yOzoqQ4yQ7HZG/rD2W2
	XQbHPXP7nC6nrILk9k8/4tupqWl47xkl8Krzl6apqpl8j+sBQmfozD9LhSC57pLYqrj9qVmEQB7+K
	rk/iMNMJnh6cPJOuPvdm7VebSzmUbC65Z0MfREbr/N67NVXfVEF1ACdBr3ApQn5TcstJ/iPyZtW4h
	SayDQT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKhg-00000003Wo4-1Owq;
	Tue, 22 Jul 2025 21:39:16 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKXm-00000003Vol-2D0y;
	Tue, 22 Jul 2025 21:29:03 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-313a188174fso238568a91.1;
        Tue, 22 Jul 2025 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753219742; x=1753824542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmepHzHt9JVFvnS8JDKPsFHySoDTq6dXaw/2Vy9CkC0=;
        b=D/UVuRk8EVoHi6zFddqo/HeJgP6ZsKcLEFTqsx75OP62+5xTyBHW7PoKFrK4X3cJBZ
         gftNAS1QYTeoClvYU+owyOVCi6k0G8n/bFW4d4FdaSiIIi/xEh/44MkTy+2mKceZA2ta
         lcFz+BBouqPNCw4IaS46o3gZ2A+WiPIpYVGkfIdsEFmGpUlMQEKt3k7/oWLf4zml4HxH
         lRfc233gnYgn/OpaVimKBS//BJCgFSNuu8O1SlSNPIF0pYTYw28+tjxfRiddObCpgqkR
         hlYJ0u3ZHwZyRtfQ992FLGoo5s87RqzKLDbCmW1oMQemf3fv5yt0KfzqUzxTWJbKYu87
         oSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753219742; x=1753824542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmepHzHt9JVFvnS8JDKPsFHySoDTq6dXaw/2Vy9CkC0=;
        b=TtqyPo0PmFqPK28zHNOvCB3fHLeJmgSaHdjJwe+VqNCVUD41UAD8+UEfEsdfYorK68
         wZvf++9zB4uGin7ewJl1eTDNNdhAqraysfMMR34Kk4VZR45LmKAN0ITZGU97QoBaTxzX
         f5hl0kqIXDpafl9Tp0sm3MIZ/qaawnE1FXxMe+3kKUCs1I3JYW+RlAh1CyDCnt1Nd9F7
         DxDqzHUQqTAwO0fl0aRZ0XfYjEBDm8mB8M1M+rOKWMBwoajlZfHtlKPxw3KuCTWHwVZR
         R7LizECvaGLoQ9EeBF4HdhYA00NJQ5GPC6orM4zW2sJ/UW6oDBtZu7pt+WzhTZFew+IK
         O3yg==
X-Forwarded-Encrypted: i=1; AJvYcCVjyapmBt3ZsYv9JMvmj2d9RYUb25gas9FJ+Suft6Nu56XqNcxuU73Q6+jH+x38h2fZ/AOp3LyvHQGLdyjbkEM/@lists.infradead.org, AJvYcCVl06K9HNuYf6TaOSH+HQOjrik51+ZBi0unJhp/+3fy//hdAiR/mwtrjEW09FuB2q7i4rVXAIwLCZXZVgz/w1w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxly/+hfgjL4MUX0El37c3hRTaKZCr32lSa6L9Ras3HpSdDiCHa
	PkNg9B4NtMK82VMWdRK/D1TB4ZkfigpM09x+XQBEi73NZ5B0+JBiwjEeP+57nUsL
X-Gm-Gg: ASbGncu/xanQNgojdmZuaqwOTW6RJwTifiZTVO7L31KC+l3WqH1RZEHSVB7BBV7gb0p
	afvJgh/etsD50doCc2iqWSin1kjTODwtqH/S1XkXACU+OEzI5rhaDITHSqKJq89WZxmDPTWx/2S
	FgM3S6mjZfx5NnL13BbUWQMPnJV4mSbkaxl360DqC2s4OYY5sN7caQYhsvLBU/HjLTCuZFgohyD
	UR26w4Gz0j2BJ8zSt0r7gTYujI8IXtFSQhQyZFOvSj/d4GzOYYCBFvpw/c8fPSFrkYBskUdmF26
	RXKguV4SAf/FtcDhfMDota2VX5piojN8+WnTlFSJwNq2QWihNswg/tfB9nxZNhr3WUTGvDsg/no
	rI9A=
X-Google-Smtp-Source: AGHT+IG+E0Ci7wudIZxVA6QJDirzK3xriERd962AI/mtpe5WGnUieqGbw4ApECQVJBKNsAH0l3EfTg==
X-Received: by 2002:a17:90b:33c9:b0:313:d342:448c with SMTP id 98e67ed59e1d1-31e513cfdd3mr501767a91.17.1753219741673;
        Tue, 22 Jul 2025 14:29:01 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519ce384sm94942a91.2.2025.07.22.14.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 14:29:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv5 wireless-next 3/7] wifi: rt2800soc: allow loading from OF
Date: Tue, 22 Jul 2025 14:28:52 -0700
Message-ID: <20250722212856.11343-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250722212856.11343-1-rosenp@gmail.com>
References: <20250722212856.11343-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_142902_564561_906DC919 
X-CRM114-Status: GOOD (  15.23  )
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

Add a single binding to help the already present dts files load the
driver. More are possible but there doesn't seem to be a significant
difference between them to justify this.

Use wifi name per dtschema requirements.

Added OF dependency to SOC CONFIG as adding of_match_table without OF
being present makes no sense.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
 drivers/net/wireless/ralink/rt2x00/Kconfig     | 2 +-
 drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
index 3a32ceead54f..a0dc9a751234 100644
--- a/drivers/net/wireless/ralink/rt2x00/Kconfig
+++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
@@ -202,7 +202,7 @@ endif
 
 config RT2800SOC
 	tristate "Ralink WiSoC support"
-	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
+	depends on OF && (SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST)
 	select RT2X00_LIB_SOC
 	select RT2X00_LIB_MMIO
 	select RT2X00_LIB_CRYPTO
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index e73394cf6ea6..8015089c4a39 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -243,9 +243,16 @@ static int rt2800soc_probe(struct platform_device *pdev)
 	return rt2x00soc_probe(pdev, &rt2800soc_ops);
 }
 
+static const struct of_device_id rt2880_wmac_match[] = {
+	{ .compatible = "ralink,rt2880-wifi" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rt2880_wmac_match);
+
 static struct platform_driver rt2800soc_driver = {
 	.driver		= {
 		.name		= "rt2800_wmac",
+		.of_match_table = rt2880_wmac_match,
 	},
 	.probe		= rt2800soc_probe,
 	.remove		= rt2x00soc_remove,
-- 
2.50.0


