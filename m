Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEC3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 11:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9jUjt+XhjUvh1I0aAWgVoLBSUgPdrIuXqPuTwG7GS8U=; b=CtvvKYpkspQ5J6RtLsmTXZUslW
	igtrqrdCtvBbHva4wpIscz2A6uWxCvUK4gMucWeLl8lfA5w1f58LcwnzmZtf3VpBrc79Ebv7EIFdY
	13ByyJxrhUtHdmz0gKhmL1V+e687EDY+exX270ETR4NNma/kw+yFfNVlECF+G8248/mXdPplW9ZXp
	rBdjndqNFQMPTYmvzLyhLdZlUCTRAFDlH9nvS5TIsxNZEq7RswcAYxuLW2dGPPO2XSFccTbIKHGRD
	ZSbrcW57CLovIG2x5sn/Yv9flEwjYWYx+vzZMnYSuqNZy1PVlkp0sBBcQQYmH/gId591pT3rODeWV
	ik2Q6TJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fFa-0000000BYGj-0ywT;
	Fri, 04 Apr 2025 11:30:18 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0f9h-0000000BXIq-3XSU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 11:24:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso163456f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 04:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743765852; x=1744370652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jUjt+XhjUvh1I0aAWgVoLBSUgPdrIuXqPuTwG7GS8U=;
        b=pP6YNCEGuH5/DSHHls8zL9And4P2cIOB3zYwHHWD7CCe0N6YjFFq/Y/QgF3lE2Oyrp
         DzK2Uz4Rlksh9IPYt0QYM3QElCym4bvHdBwR6KfsmssnIO7pd6pWn1tc+6mZbgMl1MC1
         +iVxMlT5eTNenZOz/1oWh5xt3oBhJoLXjbeguL2Tz2HWiI+B08VMR29HoNf2710ooKKf
         ACbQ52KMYmyRzTwksHbbnx5TNDYnn+iGcaMsLgt9YplUcwGwn0zpTUhO1jKA30cqSCL2
         hFMcjMxgKeZLLU5mzSqPYlFi05uiSj3zqKZ+Kmem8R2LfHGn9sOIrPzdLxe1yXBJU6mO
         Icbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765852; x=1744370652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jUjt+XhjUvh1I0aAWgVoLBSUgPdrIuXqPuTwG7GS8U=;
        b=EkDPwWPD5LLi8YaaQx3H98U0srgauiGglxy8tl6OepivXsxy8DOAYaMtknNGu2w62H
         fmbOuyie/fl5pyVss9T6ZMWJV/H+m80yi+4swVjIhkvy777LhL4jX000WrL5Tw2ud4KF
         8x8N4YzAM82t9uifYhAPufU4y4vnidkUaToTCkX01g2XJsibmBJV0eQeNvbOyfIdbwc9
         6VEXPkYRnRb0Akzt0ABg8LZUzR0/FKOH3V9FCOD6XlQ33HKoaS3adDtSbVq6t8sJYAgb
         JOGTOioU4oiJpNOgHtPFCb1Gckain8PXyofjQoGYENewkNcp9Ecye9cLNitW8/j0iijZ
         HD8A==
X-Forwarded-Encrypted: i=1; AJvYcCVaf6XgNXPqGHZAbDNn6YWyQb3A1SXVtRlvSgxfxyBqIp7II7LtoyeQCtzctVTC/HcUn8Q/FzSuXUVgEadUdsvp@lists.infradead.org
X-Gm-Message-State: AOJu0YwhB3Q0ttChOaQd13ES0ks68FPcJzX/x7b1C8Bj/t4EXX3E/FAm
	yDaPphq9BDyryrSRf4FooTyGf856rN7MAW4D9OqxEr1gAsOkveEmSUfN7R8THUk=
X-Gm-Gg: ASbGncsqB7NoxyRXha5SN2T1misMYWcHrIjRn0mFwRFdabPgcR9DRc8yPJLC2zgkpck
	rd6XNfhDei+bJBK/geJkcmx+KW2vFmLPl7nIK/FveEnruCVh6d3BmV+l4w85W5qcrzksxZr3L4g
	7mhpEOM4FfCyewn//J4O/yh+MJK/qHd1Oq0eqYUWicSzqSPb5U/ib5fLA59wIVohx399GAvFZNZ
	m068SZ73+zEQiGkmHR1eLDSMxEm+WqkGLJ9biPOYH0kLOh9yL85o91fbw/GqLo6bDPITYnQIA0S
	WYG42wMZT1OWWY5Mnv7VBaN1cZejJ8wOLUb8z7QABEnva+AuFH+0eQ==
X-Google-Smtp-Source: AGHT+IH0xDqfEbADnFxB7vDYTyNme6txywLT76cZgxeW7WAkJ3R8qDIzLSJ028j7QznnYBlvsuDHag==
X-Received: by 2002:a05:6000:40c8:b0:39c:1efb:ee87 with SMTP id ffacd0b85a97d-39cba934e63mr788410f8f.12.1743765852236;
        Fri, 04 Apr 2025 04:24:12 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226b17sm4149403f8f.92.2025.04.04.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:24:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: fsl: Do not enable DPAA2_CONSOLE by default during compile testing
Date: Fri,  4 Apr 2025 13:24:07 +0200
Message-ID: <20250404112407.255126-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_042413_882725_9F56641F 
X-CRM114-Status: GOOD (  11.06  )
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

Enabling the compile test should not cause automatic enabling of such
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/fsl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig
index a1e0bc8c1757..47870e29c290 100644
--- a/drivers/soc/fsl/Kconfig
+++ b/drivers/soc/fsl/Kconfig
@@ -36,7 +36,7 @@ config FSL_MC_DPIO
 config DPAA2_CONSOLE
 	tristate "QorIQ DPAA2 console driver"
 	depends on OF && (ARCH_LAYERSCAPE || COMPILE_TEST)
-	default y
+	default ARCH_LAYERSCAPE
 	help
 	  Console driver for DPAA2 platforms. Exports 2 char devices,
 	  /dev/dpaa2_mc_console and /dev/dpaa2_aiop_console,
-- 
2.45.2


