Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62F5CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEM6zRrG0wrRh1d0tdQzRRFEwI97+Is2fI98UBxa5F0=; b=GWrz6kynhP2UG9ik4L9/GOV0Ay
	YUzFMUkl4EjjBTrhQqr4OTASm6S4Ms9EzLTsnom5xHCRRP3J72tix+5a9b7m8y0bsKuuqlUeqDsT5
	N+ZbKFVa4qzoR5NKksGXUv90NUGxmd0TL4tSSmA08eTSMVYeNNYbpO10jEgL8vk6QllMBk3EIax4g
	gBZ7//lWfD7qspn1PwW/XIf9gEFV3VKiyIOMmfIW2zlihVgE6L9zzzC45NOUDzNnBnXeL1uhh4j+Y
	+uWJebu1Sm6YNgBz+YxcR1ahVkg+yWVvrgldQxWkZTAJ8gAPMOeh8bbtkfziSf5Z+pI2oroH7toCX
	Jwd47KjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5Pt-0000000H3zd-3ZXF;
	Thu, 21 Aug 2025 13:33:21 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2yO-0000000Gfya-0TqG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:56:49 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-afcb78e70c5so131519666b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755773806; x=1756378606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEM6zRrG0wrRh1d0tdQzRRFEwI97+Is2fI98UBxa5F0=;
        b=mJZ+MLM/Sv7z9rgCCh2t4oRTa9nWxMokCkNn2YaXZWKHlYdIKyCa4cS5ri2zXh31X3
         LiIWnCknWWcwkau3Gk/AN9k2ScyrJat0q13aAjZgtcEFlGfrX6DQ5Ec2zbaL8+d949WB
         sKAj3vLtuPZBYgGnNQewwSfNY41s36XV9TYm1XSOdkTaDb7ADN6n5Ixqq2RyTNkIlcZE
         kMdbcveN18YdD81f4VAa3yR9ubSKfspwOuOuAhCZAbU0jIF3C0Kq8fdWGWQ6Wv+hSFKs
         4vu4tiuovdVyBALsckCA2I8dxmg/1sVqqJGTv9uHOoSb8D1pHBfg25u+gVI1CqlyChY+
         i/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773806; x=1756378606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEM6zRrG0wrRh1d0tdQzRRFEwI97+Is2fI98UBxa5F0=;
        b=R8Ehtsp/16aEh8K+995V4QC4Y1oHr+lpLWW12PDyXXJb5dDdMjQ3fDavkTMlpT7TEa
         KLdqBmy+paD6j5sbiQ4udKvzuyszCpAx5LvtdEnUxU5g9GdKzeeF22GArwxRpmgb3Lzs
         96jh7ETu6UhAi2JZIoTaHlbOcpvpU7tAWKom5PCpQW8ykdDgUvpdOYNo2q1NKA97Veyv
         HnTuVtjHYUkEtAvMR3y/99VbshlOn0w7yUaKLK/CDivsLMi2n6WclTBZ4/XZwNDgHzqp
         pDux6zmJ3FtXpu2rKrYRUs4PLTXlupibNpD7KvsPtiGIDLhUg2BNTk1VzFfGOKPEapEf
         Oj/A==
X-Forwarded-Encrypted: i=1; AJvYcCUw02uIQWBatFUawnBBPWRaArMvZeEiuEYKv7ORZPTtCtS2OR7Arr6Kh9UhkFuRU38AI/SOGJzLv8MrpoaDrwlC@lists.infradead.org
X-Gm-Message-State: AOJu0YyuOfFqZ8Hi2SqRYFYWuv9/2GaJov6Ygxjdsc5gaoWYoxjFGAKB
	0nOzHrvEZTIu5pbJxv1iHH9ct+mRRvLyLBCupvHgYULPSotpS4/W0lh7
X-Gm-Gg: ASbGncui1xQL68+o4CsBD8uJM1wayZ9nBIb9RqiAVxAS6XmyJxugtjZVettQoI9bFqA
	MbOJ+7soABJobNI8GbP5iiyVETgdT2Lv1eMDu9FZQdDwqSLGc2uUumeTDNPFmsHPiMxVUDZA3Af
	nUXXtADe5Nh21lzAy/W10c75Z/P3fKDx3F6KiPoCYMiFI2+yOEwS2fXrL6L9EcwK1tyjybQFyWZ
	se+fqHDke9hhBUqVjagubSxoR064SomtddFCp0R0edNh9GLepz1T41T+wHf6YL1AkTqV/ypTTwi
	vQqb+YVhHEB5McuBK8CLbTWEw2FJLR9HJdAugzeregmvLqObKRh5mlmtx9XxPSQiCvu1kcTPEj3
	k0PK6XUwjFJnAY+QVQWaQw8qq/tQt4dTXmsqvhV1pWMOowCItXgTi
X-Google-Smtp-Source: AGHT+IFVorh0obeXbG1Ko6UmVI+44XxAfffiT2uo5FSHfTA7gezl9y87WX6WaAGvvAl4Gewp22sq5A==
X-Received: by 2002:a17:906:478b:b0:ae0:d332:f637 with SMTP id a640c23a62f3a-afe07b3d5bfmr194996966b.31.1755773806255;
        Thu, 21 Aug 2025 03:56:46 -0700 (PDT)
Received: from DESKTOP-TTOGB9M.localdomain ([92.120.5.3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded4790bbsm373602866b.56.2025.08.21.03.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:56:45 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: defconfig: enable i.MX AIPSTZ driver
Date: Thu, 21 Aug 2025 13:56:31 +0300
Message-ID: <20250821105634.1893-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
References: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_035648_152685_0EEDFB72 
X-CRM114-Status: GOOD (  11.19  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Enable the config (CONFIG_IMX_AIPSTZ) for the i.MX AIPSTZ driver, which
is required for platforms using the AIPSTZ bridge (e.g. i.MX8MP).

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 667c4859ecc3..23ba01d37263 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -264,6 +264,7 @@ CONFIG_GOOGLE_FIRMWARE=y
 CONFIG_GOOGLE_CBMEM=m
 CONFIG_GOOGLE_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
+CONFIG_IMX_AIPSTZ=y
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
-- 
2.34.1


