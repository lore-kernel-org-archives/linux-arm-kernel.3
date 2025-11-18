Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B7FCED63B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdDgG0OEtr9VDO6FlrjC0lVVwasyx4VrXjolMp7eFK4=; b=URw4zM2+i91qmJrFelmvN8Ydlh
	3m4n8YBjkMhLM/SMcPu/hiMp/ZVUsorPwwZSRPOp87WqT8KNyo5X5ECUpFtTYtypGmo7emC14viKL
	4IqIlrRHyREjPQbl/l11+7LIC7W80NnaAW020/NyTMHmuybie8ia11FUplucns2TUZlb7pYBsmKac
	3dtTXz43/JZDAPFRdzZFPGckSF2vInxyCR03n9OF5aYHWs7IF0UY9H2aZx8r5swSwl3HFxcga7ga2
	AFveJZLQvKNlJwtRTLJUN923EhXL8m5ma/ZTQGhfvxvEpTcuYWWng/sapejEjMnzcPhidYq7o3jq6
	i/O4Xokg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMCY-00000000Vbm-0alR;
	Tue, 18 Nov 2025 13:56:58 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMC0-00000000V44-0Wlb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:56:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so3350698f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474182; x=1764078982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdDgG0OEtr9VDO6FlrjC0lVVwasyx4VrXjolMp7eFK4=;
        b=xrQl880+QLr3ek+mAD+D3t+Ss9eSvUMkCVQwmXyXRm8eVnQdUjjDJRfCFSB8PJU5M7
         1HG3a2j2kDyuQlzeORHi5l2nh1Kwx/9qAfpXE8j6mnONJFBJiMzR0fQjgdgQaawQtmb6
         tZSQ7FgEYL7W4LFusLdvCmim0BOmSkBNDTgtjA9t9VbRnEzwUPCAJRm0455wkUvdbE69
         sut2AO/y0LVi89N1bTop+wEKK9MFdYLRUQqqi4n1sPstwTM+gzSy7GISnCFoFk/Vca36
         UTyHoxcZsCbtIIx9O/FGB8meaynJ5yVxm4tH/1EKeO65zA5d9HaGxr+HkBhX58xuPP/9
         9CFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474182; x=1764078982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FdDgG0OEtr9VDO6FlrjC0lVVwasyx4VrXjolMp7eFK4=;
        b=Y/7WvdiylN50i28/0W10X0+u0wAqJtY5q1PSqBDhoM+wGF0xGSVfmDT5yhpsR1ced1
         FEHiUlEgzkflXoI8dLpP+yzheXD6dWwhKeSHsgnrAJ1Axz0/gmkRh3cn0KRl+9CB7/nP
         0oOBSO+40STdy0skvJ6UuKnudTK/1M9yie+RqOwjihOAbKsKtN6BruEyAZPyc/H16nOs
         gyC8M7TEWRjil/rnxLWNZ8hEsWkUqk+MMzoOdr8r/jA7wnYp9K1DpmKUBWTodw17bnmA
         hv5FmOCVS1fNcx0Uom7x/eNLufmRDjX217XxoFSLQSpRNP7P881mN5AdH+MfcQHv6Pua
         dZMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLBzdQ4WmY93U2fpnTbdHd9b4HulUU8tsUWUG6nU5k2WWldpPcqJzPiVsvYXxXbz2KvgXKvHj4LpjLymkkxORu@lists.infradead.org
X-Gm-Message-State: AOJu0YyG5g6oZIN2zZr7xFwX05Kdc+TGcTbNsqPxZME3Kj+EjhL2xIsL
	ja3ZRUD01PQXdPYsrKLAx3/mba/3lbmmd/ahcZduxRoekS3xo1hN5sWjZzvFvoaNxKA=
X-Gm-Gg: ASbGncuUgbWLbhi8ZOBYHCQg+pAsBk+q2Z1umkNg7h9VAF7nFSSMiFfrCm96AgG6G9p
	4+EdsM+RZTGuAMoFLJNWg192CMnT7TUGegnIPsd6AakcdKjevRjuyzDd9j7ehT+BXpxf2dCZuFo
	gqU/Zhoo6yux/ZeZa5659zzpWwfsbyNFrfyfLb3oH8Z2KhAMHARPYuW+AgOaFi2irZDBD0d7wxz
	cg69lXBuDQ3mHlP9UyZzrxAAYL9DIBM862CZ/Un4yoV/IWT6nsMDiTHjpbOI8hlxvkwaaEQFyXg
	sNofvaKN/c+yTbjxdCJ6L30pPmV+CnXx14+8mv8/MlaHqVj7DzwvhguVfoB1ctZqqn6OHzAL32e
	r1Sa8jXth+gdS5l58rkb9y2DOJbTDsfvZsweVdR36Oh7qPpMOtqf+T9vBAyiCZ6pC8KQRYjAZMu
	6d9koKknDekVaMMIliYAAcKx6UWyb6OCnKxmIBAqb0RapN/pITaqmpWUIrNuFYxD0mRfOHSMVsd
	pcJmA==
X-Google-Smtp-Source: AGHT+IGfMObgF/k6EWKW7rlaiPXKOVwaG77gXtBdH9U/El9uEDye1QZpAt3VR8koJaZq1/x7ozt+1g==
X-Received: by 2002:a5d:5f49:0:b0:42b:36f4:cd21 with SMTP id ffacd0b85a97d-42b593742e7mr15653326f8f.40.1763474182223;
        Tue, 18 Nov 2025 05:56:22 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:21 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:13 +0000
Subject: [PATCH v2 6/7] soc: samsung: exynos-chipid: downgrade dev_info to
 dev_dbg for soc info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gs101-chipid-v2-6-e9f1e7460e35@linaro.org>
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
In-Reply-To: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=1017;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TAfEcJT+KP/gybnFuuKe3YB9Vr01lZOY0yg12JjdBGk=;
 b=acfWU97bc9wGkUoK1rXcht5oTK4PtuVsKYgoVLSw2tRBT55ufu6Iai72t/xeAp1NwaT3i31gN
 wHgEFrsKmGkCnjVfQYW1FIDIJ4bVWlqAyFGVpGVfPJsZKyXYU23iwUX
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055624_217720_A0727053 
X-CRM114-Status: GOOD (  11.94  )
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

The SoC information is exposed to userspace using the standard soc
interface. Downgrade to dev_dbg to stop polluting the console log.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 7ed7f44b6ae5357b71fee3994e4a4265aa870d41..e1b939e526cea9b2069da6e37a1a16950ce5ac44 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -224,8 +224,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
+	dev_dbg(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+		soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;
 }

-- 
2.52.0.rc1.455.g30608eb744-goog


