Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9A8C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJPEBo8/2FklhBRXQVrbXJ0ddjiV1/Z3tyBLYizuPbU=; b=Hlbm0HTzmjKDlM8vr0QTmkNDcc
	OT5+S6jrHyH0inL67bs7MtkJ4PEgKTBmeTpTYh/g6M+5i2lRFdFvbYoTTq5+MYzY2XQEV2BBIMBy5
	vRMC9ltIavUzdLdNA5Tt2nG28+uyE/vZRFg0WUEvGWkebZpQ41dbtlfSCPDMMmuBJnwwZcFOclYjq
	M57m0mTuGY0w+njiuwNJ/PME42C10/7oZ+NWVw7MtwDnQZWNdui2khEHfBSDGm8DbMOsQG11wbwO4
	V7jn1fvp2h0lYR05Ugr5OBuKFElOY3YcaCCNK0Tfu5fiQoRvaVjZVTAyWBKfbtFM34SpCo7mvn9kR
	aogYrYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLxs-0000000Cpgg-0nDw;
	Tue, 06 May 2025 17:20:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOe-0000000C8DK-26Td
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:31:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ede096d73so34357915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538303; x=1747143103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJPEBo8/2FklhBRXQVrbXJ0ddjiV1/Z3tyBLYizuPbU=;
        b=QRVfpM8Dl1zl3bijHeSp6iO19DCDYMM76Wi1KF4TWVcEMOEVrv/97adhKFaxfQ6E+k
         3pQuJUWWOTmZ2FO4kQEvxZ+k05f41jYEe7P2kAKnlhmIhe5hciZqz7jucfzs/WQutj81
         cd9vSO2YL/tsXHCX1tqh1KxWXCNouhMUB6GGbROaajFhdNtnbLlqr9Ianm7OSRn3SW0K
         N52nCUf/UfXseUjIGlxm3gkn98iI4QdujG5ZNznydhczrzy0zCT+dtgtWxeDTlGJp0iW
         2e8KU7v5Nf2GeGZVpEhKEbe6mgAG42UQ+8aFDO8Q+Vu0/U92a2H6kFL3HMnBZEKTaAwk
         hbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538303; x=1747143103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJPEBo8/2FklhBRXQVrbXJ0ddjiV1/Z3tyBLYizuPbU=;
        b=qRf8lW733ACwVt/Jc8tpbU51A7Ms8xZmgomz5E2HRkhD+PZSJgiaKWpxZY8w5jo9S0
         LPyGbZMpmq58bN66Km7mwv3TcUXbSzZDzxE/f1LE78AAM2nIZE0URpd9Y3LOnkId/vO2
         q/XpRKq6fJmBDUwj04ptbFARe3WdjQ5m3SdZToye+DvDLuASVqR+0+qxjXpMkRnSfb8Y
         ztiqmVAM2JJSnMCo8mQiiU2jf/nC02x+mAwULOsKw4V1/xKWxzWS/7zPR1eBwrUD6THs
         KgQLxtlgLgquKRcG48r4oUcMVedTYPS6alYjw03z+BXLTgvN5NfOHkwEJPTQLbcG/DFv
         6uwg==
X-Forwarded-Encrypted: i=1; AJvYcCWOzJ2TQ+AwDPRtcqilgBDxy0x0JHQmq1bUjhwIOrvvNsNyMUMTtvsdAT9831ViIuxZ22UEhZ7rRawmvGQ4DVqy@lists.infradead.org
X-Gm-Message-State: AOJu0YwVpGjecMozqx78fYrlT6JzYASfut16wQm5pCjmzLBmTSYh6g5Z
	n8px1CyeImkvE8PZCsFcOctWWOvQIgcDdNbeShMZCjfANI3Ec5Ot
X-Gm-Gg: ASbGncu79pk4ykJZQZcOrGIC4SdhxTSYQCwEkMtnVV2YqS2fkuc7jTE132e3Yw0Klhe
	b/maZcMP5SsA3IrbQPxG4GzNZLPcLwinb4Be5LlWf7hR+RedQ0TVRKoEu3TDo5RFRvHga+kkRV+
	Avbuj4DXRC6oYECnwBjk07XWkExSa8otfc6yVlZnaDIwIfJi3alH/om6GDFjEc05vDjyT34ndgB
	/txoxIYnMMXvKaRcdoGXWeSLKYgqRIv1uYyqNNHJ2+LJhWb8FdEy9Vb+H83GKuq6yU+BI+ZYRL2
	ah2y3gPVZBpHtds/1NPbmHOVYYwXKafbdDPvBqqbSlz7CbeR9C8BEnc/PB7XlW/v0Ufo6tyHvCK
	5wMvOz+ObYN3vgKDWeDHTBOS3sHEpBICr
X-Google-Smtp-Source: AGHT+IHWN2ziCJWY/SQ3yYjj4A1xD22hrlquQqqAdwEjP8/KN2UnvdeQdYY1NbydhcBBozsl8m2sqA==
X-Received: by 2002:a05:600c:a014:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-441c48b032fmr110754555e9.5.1746538302562;
        Tue, 06 May 2025 06:31:42 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b8a286cfsm168041535e9.29.2025.05.06.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:41 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/11] soc/tegra: Add Tegra264 APBMISC compatible string
Date: Tue,  6 May 2025 15:31:15 +0200
Message-ID: <20250506133118.1011777-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063144_539449_A9F34105 
X-CRM114-Status: GOOD (  10.21  )
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

From: Thierry Reding <treding@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index e2ca5d55fd31..0ce94fdc536f 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -128,6 +128,7 @@ static const struct of_device_id apbmisc_match[] __initconst = {
 	{ .compatible = "nvidia,tegra186-misc", },
 	{ .compatible = "nvidia,tegra194-misc", },
 	{ .compatible = "nvidia,tegra234-misc", },
+	{ .compatible = "nvidia,tegra264-misc", },
 	{},
 };
 
-- 
2.49.0


