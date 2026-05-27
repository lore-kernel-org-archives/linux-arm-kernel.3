Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFE4CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 21:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xwGOVfYvO201sEUuE8/pQvxXnipLjm8iFFFY82DZt50=; b=lQ6h2iGXSEncyp2DppmH+H1Ds5
	/QJFOGObGCndgbNMGdK5OQx0HQf/G1JXxDYiGh3bMEDD7JEhd72KLPOITwNTtGIJJNjCrxkBlcOc2
	JHlaBhWNLIu28oYo+agmefH8HCxVAw9UBSBj4kg/aZTT7jpvFS7BHOmjYqXm8zd+vk96OV+1wMLit
	pVLtgScpSBRHLhguXvNfIbiiSfb1QzUshbCtVAAMdo/Bt5eQgcVayYkOdetrpbxHx99EiZC5qPKNO
	FI/HdPGVZ25RhXx6H3Yo8v7c711svLFSv1M7VDkSMWY4Op5Lo9+7M/pTD1rOjuKze+SpMrs3MkVKc
	hA9Hcv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLUr-00000004kOa-3qDW;
	Wed, 27 May 2026 21:09:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLUp-00000004kOB-2I65
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 21:09:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4891b0786beso80878215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779916137; x=1780520937; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwGOVfYvO201sEUuE8/pQvxXnipLjm8iFFFY82DZt50=;
        b=u8kvc3FluWZDWCs6iLfsUbKM7aWvo6VH8Gqb2y1rTElDqBLbtiTHKO+ELvNQf4ggNR
         xXspBzznjFwDEpXMI8NHP5z+RxuLE01ocofrjk/BOwxrIu/Tgt33XnEsqbkXYPJWCKcj
         KvodxALkWIbBqfazdNJC59K+82BSIGV69X/fTZ9Zv+cogk2k+7GeIC4rAMZG3oKXojMw
         HI72UzZKOlxc6Dwa2XhU2vaB2iSFlNsAC03Rj4hXEYwZNF1hjC/FAmbwyUnbeBkQoXM7
         p0czw5Bx2XipmmFDNpHcdBDdhxjTxZ8cOufsktGcCHXPE3AgbMGJ7OwKKNIHl1XMisag
         P7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779916137; x=1780520937;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwGOVfYvO201sEUuE8/pQvxXnipLjm8iFFFY82DZt50=;
        b=absuzNu93wG/TVgxAdp/VrJB5klPBm1jpeDs58YX/lLorPeDxSJojkUF8moHLKDwqG
         TS0sN9/C8nUfv/dijFcJ/JXgYLHKlb9fuZOE0mlMlfDRKLCpr2trn+5UV6nX/v0exqvb
         Zv4FrzptG/L1uHb0f/qMoyL0az+LEnl4zUthytNUuYslfFjtpQJSLGFAzr7W4BQyqq0r
         j1fi+IFTjhmBq+nV7OYBc+oFdVK0LZ//CPc+QpyHIaLyCkxi6VxNggjhPf6dBwUViUBH
         p0B+sgFT4mjUIx8GbWPZ+pmsJumdAmscP982Tek8IMF9wl9X1vUqkmY3kYuJtfwwpKwq
         t9MA==
X-Forwarded-Encrypted: i=1; AFNElJ+zhDT0RUQGvZnfATMqFJSIHM5auNMMinbLXwDreha/lZ1JeXdx8allUV+YuC94eVmJHYpQ2wecvdotPfwLeoee@lists.infradead.org
X-Gm-Message-State: AOJu0YzHc56PfegG9RPhLXVCQkzMPiLwNCp2MCR7wDzmi9YGnYZTAENj
	H+L0VY2T5A/TcV8kWqnDaNFnUmwxmEKdhEto+pwtNmVNLPAxmOcLvV9GayALcmVRctw=
X-Gm-Gg: Acq92OH9JV0Zrj0Yd2hi/7oDGzbubgI6o5xMZeeh2+RIsUQTQh1Oxlg8j8BcCU+lJWb
	WP6oMBV3fVjOg4cYqM6/JiorOcvvBhZf3uVuma51iqDFI+qBkOKiaTKkq75PLcX5SrgcrMYJJD1
	1ZLmOcPzhDX8hzDop1QIAPonSIRt2REr1YUEuNLvRBGk7+2xQjALK6TlDP/8nYjVCcvkk/IVCLy
	DKCT//Btarnd151RD3x/sDyR0mtqeqmfUNIJJWuS7LprW2T5JoiOcaX/qDEw/SV8ehbiAXgz5d2
	WQoUyvFDQTLuzJO8upcr9QloT/0jH/7wIgdHf3GTEIK/LjP9Zpcg5TCGMZ4vsC1RSavyeOXGv1v
	OmiFmYOM45F7RHG8NpNgBmOEpB/ZthUvPhK2FU4P1GcXpc0xPjsG8JqPzW1ZMg2zYYnB6X4k0Sw
	zSbT2wDtAcHxFTHiWy7MNbQcobTsGbkkfn7NgKCuBaXcMJS7pwlPGtSlyayglzBBOjDNTZ+vilg
	W0smg==
X-Received: by 2002:a05:600c:4f53:b0:490:7136:ad05 with SMTP id 5b1f17b1804b1-4907136ae08mr166302985e9.31.1779916137581;
        Wed, 27 May 2026 14:08:57 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3124:1301:985d:3d5a:fde7:e337])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a2a7esm8894393f8f.20.2026.05.27.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 14:08:57 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 27 May 2026 22:08:45 +0100
Subject: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
 pinctrl drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
X-B4-Tracking: v=1; b=H4sIAF1dF2oC/x3MQQqDQAxA0atI1g3YOCr0KtLFqFEDGiWxRRDv7
 uDiL97mn+Bswg6f7ATjv7ismvB+ZdBNUUdG6ZOBcqrykmr0uPhPR9xEu91mXKLonmJDClwThRC
 GtoA02IwHOZ55872uG8KlVnBsAAAA
X-Change-ID: 20260527-samsung-pinctrl-maintainer-24e722444fb3
To: Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=j6wFuV9ThpOiYYv2+F20SQy9uhrC4cWysfOvCPDsdn8=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqF11oeZy9qBNJRm/bBBlN5oqdTNhD+u/OcJlpE
 7nz7tJGHqqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCahddaAAKCRDO6LjWAjRy
 uiezD/9RiQ+SU3hWpIFufpXvMquOn7fTgIPsWh1qTpvzmvn//E2LOCyUwHfpvOvpeTwe08c+H/H
 s3L8f/MrClZ7biqYXvxf8uWRfjL8Nc7ww8pcGc82wc4e2pSXumJsjiZl4hFcFaLxVVTB94Kovko
 GRqVBSSb+UtAA8dFfw47sguk9M5t90T7F/ixhn1mkAIXBy2RnQVV2QEXOu6wwkgzOp6faciW61J
 N9ATjWPukTOci3t0IdgF/tN2p44ilGsBTyqgJTqRXJ2wXZ+huHT6VNLj0YFYL3wdAXThAsO1e07
 iC/aVY6FtSJ7GGV3GkL5hPu7dhdx2pL6Jej7xOwhyFHEgrfH7Gq3Ye56XHyNkGkKPbkGlM2yTjN
 lP1bGjKwgDUbtwpxJu/awzKYN4lQWXcFuxZ9TScje0CAZECK2AamqT7M5RWCRfhJLMoT4Y6UMYg
 mdRmns+ysMHYcHG95Qw7q6VJh0s0/H0cRJVYJjakrU51S1zPVez5f+iyed4Gr4GwtNbGsjG4vZi
 b2IJfG+w+ABeakd9GrFWdNSx/raKFbLg+KdrvumftVEwpuG/DlVcUEmzZwQRH+nBaZt7n0XLtZz
 sabWY12UGFj49Bsk7+nfI4S9g2NHieiSeJkgntWWiFp/6Bgy6uVjRLALxLP/Qo1ujL+/Ms2PrQX
 g5yRRYdlL4yBTFQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_140859_617102_D009D2F4 
X-CRM114-Status: GOOD (  11.02  )
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

As Google Tensor gs101 is based off a Samsung Exynos design I've been
working on the Samsung pinctrl drivers and have an interest in helping
maintain this code.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
This follows discussions with Krzysztof about expanding the Samsung SoC
maintenance team in the kernel.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4087b67bbc69..69ad1913a9f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21298,6 +21298,7 @@ F:	drivers/pinctrl/renesas/
 PIN CONTROLLER - SAMSUNG
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
+M:	Peter Griffin <peter.griffin@linaro.org>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org

---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260527-samsung-pinctrl-maintainer-24e722444fb3

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


