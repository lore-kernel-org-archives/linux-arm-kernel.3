Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2750FE677F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 16:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXXaYxB4OKZhMx1Cgr83/lDAFT6ZmYFvI5JvjRgVink=; b=riZkLlTb8tIhvLpnSf1CXQu4LT
	i7xnK2H+LlPsYrSnx/DqnYdii7lRYVehMb/WsXJLDUAZjTSxmimFJJbx+MMO3GQSTVYYVfSAgv8Vv
	kX/79Csha1Mk5+IDsMtrQCMc/9fIah1UIazC8r0uDwTW2JpAmrS3jzW44MMaIHppiWuy3ztH0ET10
	eSlpxv7y9fmQTFLt7IqsoPijtqbbNkYTSq7M26ac3hl36e57WNSQKv8ACAY2qXGR1Oj5GzXvbjg7B
	4jTPGp3vg2X84bFfEVjBiKcYz6ia3cWf+KEd268Xixkmi0PCBcayV5XR7e2RF1/xjITQRDavGOZeq
	OmjiXSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXio1-0000000DyA9-2Q31;
	Mon, 22 Dec 2025 16:30:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXint-0000000Dy6y-0Mrj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 16:30:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477a1c28778so47733115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 08:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766421035; x=1767025835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXXaYxB4OKZhMx1Cgr83/lDAFT6ZmYFvI5JvjRgVink=;
        b=OM7Ki7c+OqZPC76zwVcfsqE99dFfF4kMbDlzcAGgIhL5p7jTiQEjxLVxbbFep4YJGT
         pUsFgDri1YxbZyvXe/m0eRbL4DjpCRhbTfG3roo8BoRILgAluth3puRguvb3361Z0mRZ
         LE4PksHDLJPsKbMzgxzQwuDCPyufj3AGSu1VMtbJGH3RFlF9waQQqkK+LFjRthvvslhX
         KJIwCkvFl3bUvzvkaeWuYGYTQfG12Wp/TnGmccU8vxDcm/uuLkb60JeR+TOKW9fSarkA
         9DARXvZZh05te/Vx4INIst0j0yXbbCwe++nXCWx3MBorL5N4XNxaCKZURqCZMIqwBkfv
         Di3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421035; x=1767025835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXXaYxB4OKZhMx1Cgr83/lDAFT6ZmYFvI5JvjRgVink=;
        b=TW+H4I7HtyDu/OOoKMBhbMdqtxB156SwDZ3xLsJJz2IHdOpNhz6Dn3bmMOfVYEyz8J
         3TUq3Iv+LmA5cwcVeTdxaAwwHEikFtErnWGToZ+eCEeE181NmJVNPhtBqbtBJBi8LtBO
         Lps7sODlxirtUPfJ165IiZs0vKCnFdb7TbsA4mYRPdozLpssbuS+oQc+bve8gj0U9a1f
         k9mUZFhrerzX8NLXpf+Ntchn8mzfkXkkn9gPwwWXYadF4RCMUjRiCUz5vAhRwiWzbb2E
         cYF3QtVhrzS5TFm1dLB60Hmfm8fIZgI+GGbUVCGQL0tU5OQOoieyHURSL2ZiHa6xSN/o
         htFw==
X-Forwarded-Encrypted: i=1; AJvYcCWysgCPVKb2THdvz0pGncJUnIKfTSc+GUN4kuxrOZCFEnDFITuI/5I9A8r+s9r+JJIVty6C1KG4XB0/gLp3mfHX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7TwHbJ5f9lyJCvj0kg71FZszzlCLWSIVcxqgGnKkd/FujzmAe
	VoFGVWSJnPau0kq11A0wr3/wyjSeS6shKPgUHIYV6VcQ55qFjg9d+RTBIBsLBaBARac=
X-Gm-Gg: AY/fxX4WUej/NO/hp57gJVt7ilYjmAjeswYN+F3i6qYRubhXb+zPfn8VTtKw2bAMcPh
	rzacTPFr/RQ3QgIhjf0gM6S5sYTDMvL5TMLQ6+b6MUpL54iQKaM2iz6bORLuoF13z1omjkoT3Ol
	rLY8O3l5Z88Lw96Yy3ZiyVz7be08xQV4yBx19K5uP8dca1D6N7xbVwwxJ3SEuB9AF/aACV4fiaD
	07mHC0wUWmaESbgV0fBbrG+woNkDE66XmDyjXQB8s62OmhBApQ4JOFEQ6Ai5Ir3G2jA9U3lAbyd
	MwLimFxt/tanQAcgNEVERGFvr537uKn2Dw3RB/z1p5/YTElo9WxudjbDJdsflmjW1+CTfuzltJi
	S2YFaO0s7VM+vj+6dBSWPeWXYw9ecpTSKF4BgkJZ8D/tjz23XaFwzE9hTadkMeZoI17N6WCis1T
	7sE1osvukCoVhmnwF7qIIIfDzUtkLoF02iTcLaPy1mlmTSgj7kgBxTYf2nWuGcR52u
X-Google-Smtp-Source: AGHT+IHa18+n1INgxxNo+jf340UUAvjPm3Dl1qgbTOuYp1h5ebszYQYHTtgf1QwtGS2Gv5CnCqOd0A==
X-Received: by 2002:a05:600c:4710:b0:477:54cd:200e with SMTP id 5b1f17b1804b1-47d1c6298f7mr113410625e9.1.1766421035039;
        Mon, 22 Dec 2025 08:30:35 -0800 (PST)
Received: from ta2.c.googlers.com (62.221.76.34.bc.googleusercontent.com. [34.76.221.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23071258f8f.37.2025.12.22.08.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:30:34 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 22 Dec 2025 16:30:07 +0000
Subject: [PATCH v4 3/5] soc: samsung: exynos-chipid: downgrade dev_info to
 dev_dbg for soc info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-gs101-chipid-v4-3-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766421032; l=1069;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6z9CUWcsp9GVIL5C3R1I8VF/DTTGwdHlesVb1AdIEnI=;
 b=Bom7RtVo7DVIXc9G1f8o8cMGq6lBwLRC5DuHeb6AVEZqt1vgEnNM+UnyOKQPFoJiTN8ReY/47
 QJ5u61AajSJC0O2yc+yCafQBUBGxK+5ktnIuamalzQ+eLDgO2ZE/HVd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_083037_141932_ECDB1868 
X-CRM114-Status: GOOD (  11.49  )
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
Reviewed-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 88d264ef1b8835e15f774ff5a31f5b3de20f74ea..5c8660374269c87ec38ebca242918bd7b1d362e5 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -170,8 +170,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
+	dev_dbg(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+		soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;
 }

-- 
2.52.0.322.g1dd061c0dc-goog


