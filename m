Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88147C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 03:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=guOvZvhnofpuciLtaF8WyaHhY6OyItiA42hCWdF3Kac=; b=flrJno4PhY0qvAOZ2D2FNvG56w
	XWwZf4xJXl4rzLi7wXmRqIYFYdzf/QJPsweevpMdPu5kHIiD2XgaV7QZOvGIJQYWTmlIXItpDJ0Zg
	kxMd2MNqW/dozpf1YfnYBsQcjOLt+joEXhHUMSEG7OBGzj0nzA10TjtnvL1jpSOIw/z3PG8IPzHcU
	K98QYPhfg0f5jUb7qoHbQVD4TAnroEFzAWLXDebHj5jC+pAmBneLqdpEx+jpglPzwSeQF7hJqrrMH
	DotgMiWybPrzIyCnHrO1IzpNTK3WyK7lSnwsuLnNoAy2uY4qaKhgwl7fZ+NuSc25CEZ5i19mnarIC
	HhjMMxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rlz-0000000FkhZ-44CX;
	Fri, 11 Sep 2026 03:17:56 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rlx-0000000FkhD-2wfP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 03:17:54 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-939109fafd7so40082285a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 20:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789096672; x=1789701472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=guOvZvhnofpuciLtaF8WyaHhY6OyItiA42hCWdF3Kac=;
        b=m9u6FmMv6figgKYKPDSW5o6Wn4u8MPQCZmHV4dlM6dcmxjBZcH5b/wTYFyT+UCceDF
         IqyXc5od28nkzHb1WxQ0xfANYojZ8rXAOVgjn7zuzgvND4OWMqZC0aGhXTbQ//ayZNwb
         qbxh+oFylEwRUuFkhMlVmFYrEph4YGF0smsM8GsRsGaDxemVJTz1/RZiJ3ZqYjzQ9Zfy
         KIJSz9g1be0HUj6MRxyNhzrQHjV4nk6G/MzsoagcO1fI8rlhoMxzZZUtmySZe80Y9IAI
         642rPhZv0zZACR7xMH+TxqA2GaJelKQnB4rfRAumqvgd5mRI5kWF9XlWM2QUw5coClAe
         N4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789096672; x=1789701472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guOvZvhnofpuciLtaF8WyaHhY6OyItiA42hCWdF3Kac=;
        b=tTK3EZA9bSs5nLi8skpQGkR7wXFeKW3QkBpNtYEMA0NoNm6mQinXcrOgQVu7O6aP7a
         fFuIYlbuto+z/6X7XAdY15li42d1O+HucTT2PLHpSx9P086sfFUr3BMS1sDWiux94vy8
         G29ZufQNWj6gxb5PwzDJ+pI++mKXn5nSk1JtMtm0P62UUkaF/s65RbTp4O7yZKaotK4T
         wfwvbsgjadCtQo4Y/1od/0h/fxpLI9nUNqBq9ltyeGhRAlGvWxOfE/4hwJUuAkvfHemq
         iu6TCHFtnORHpNuWMW/zwoNCHVuyxzjTMC9Go81iCnEnZegUcpZ1wDf89sO5IxuOvMG7
         EdxQ==
X-Forwarded-Encrypted: i=1; AKwUvByablPTsVvSGBm9v0LPbba75kPFDiVwFKm90lA29qyWkY671dQ03X1xnf4yZeAPkAuVb5saChTnGQ9ZnEng3aUC@lists.infradead.org
X-Gm-Message-State: AFuF++mzjeocfMSV/a28pT/2qhahXO0sGuYpLJ2DeMxJn2sdNuhvD2mz
	7nGj7FizAd+epftNJ3DtbLWQcj+H9TFybu4ZVsc922Hjv9FU3TIZmAUlBRQUpKk=
X-Gm-Gg: AYBFou27ygt6e8mz2VlNadNasJvPJjeOc2FUcjhG+WSQlDXcP4arZSc24Lpb/unKoiG
	Em6o/p1QoWLF6wdioomNxTBh+T/1jL4JiSSJ9vggzeMx5cfDOkooagcNTxmSI2CZmpSdBBhRgl1
	FOSG1QzWK3B9rKezvCdwBMOEIXQcdL7KGmdy1wfhzKXXC0pGcy5IkEQl1/RXSHXw2KnxgxSh0uQ
	6qON5DEmbDebfaHlT+QQBO0fXEH50xr4g680+jpgivi0yt53jCNH/d4/UmG1tNls8WkP51MSgvz
	LEsHgZV0j6U/Kswq+QWzUGc6nyF+271qNJLtZEEpsgppQtulyCqdykbQdsEesqw2pWacreOiQZ+
	baMWIKyb1MFIG3muUzw+VrsllkoT1D9a3PxCOV6NGyroVgmFDhGgJu22q/9nye2pWdjv1lPWaFm
	+2o1L5bM/vlGwh5z+Mo7W9s3Lb5pZx23PVMjSm3n3lNjZRwJbIoGGzFqdnT3o5hYPmdx2VNr4RX
	tolYZbZJSxRRdQSsOUsAXc4JEx6miUfCtYhZw+PwgPqHaBYluMNte+OZf8JNAmMBkvCcLGcF5gY
	ok96Elpgw2igUH9GbZp2/DER4VGm4DfPt1U=
X-Received: by 2002:a05:620a:890d:b0:936:2fa5:387a with SMTP id af79cd13be357-939ea1dcc91mr265058185a.43.1789096672159;
        Thu, 10 Sep 2026 20:17:52 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47e800sm11211576d6.27.2026.09.10.20.17.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 20:17:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: s.nawrocki@samsung.com,
	a.swigon@samsung.com,
	djakov@kernel.org
Cc: krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] interconnect: exynos: Remove the PM QoS request on unbind
Date: Thu, 10 Sep 2026 23:17:50 -0400
Message-ID: <20260911031750.8182-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_201753_778027_FC622083 
X-CRM114-Status: GOOD (  12.32  )
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

The Exynos interconnect provider adds a minimum-frequency PM QoS request
to its parent devfreq device. The request is embedded in the provider's
device-managed private data.

The probe error path removes the request, but the remove callback does
not. Unbinding the provider while the parent device remains registered
therefore frees the private data with the request still on the parent's
QoS list. The child's device cleanup does not remove requests registered
against its parent.

Remove the request after deregistering the provider, before the private
data is released.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 2f95b9d5cf0b ("interconnect: Add generic interconnect driver for Exynos SoCs")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/interconnect/samsung/exynos.c | 1 +
 1 file changed, 1 insertion(+)
diff --git a/drivers/interconnect/samsung/exynos.c b/drivers/interconnect/samsung/exynos.c
index 8e8f56186a3669ee834c21bb73e13eabf2cf68fa..9a4789fadac2ea5ecd017db12e2cc226eeba4f17 100644
--- a/drivers/interconnect/samsung/exynos.c
+++ b/drivers/interconnect/samsung/exynos.c
@@ -98,6 +98,7 @@ static void exynos_generic_icc_remove(struct platform_device *pdev)
 	struct exynos_icc_priv *priv = platform_get_drvdata(pdev);
 
 	icc_provider_deregister(&priv->provider);
+	dev_pm_qos_remove_request(&priv->qos_req);
 	icc_nodes_remove(&priv->provider);
 }
 
-- 
2.53.0


