Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F47E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 08:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qt7Z7l4IzJbSbBd7IGeNLP8mVs+vDf3JZNjAJLXbLd8=; b=DMa1wNZ8SnUXx/d5hkAVFUQf1U
	nsv3LEF6fl4lYIJ0K7QO+TDCaftml/gPVk/QhytyeQF4m1As5bPLGiyfSwIsq68ZDaQl/CuMZpBo/
	RboeRvuznSfT3lvDEX+42Yhzdw/5vZES0UX0q/gFZ+aer+BOdzXmIo/CHa72Vzv7u4pdhAaxPPIQS
	RAcZZdnogiVKrunZCdeItSYfSLLGCkyPPT6xXDbmuuXpkouKBKW8mVXWFYNebJ1tdOOap9emSoI2s
	rAyQnxZ1TD4PFXFx//nY77nayFX0Apgc2aHpcAvqrPMPPemPUoBvLvKVLVm6aHhC9n4Wy9hfr6gbL
	HDSNUYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJU8D-00000000zmm-1KDy;
	Fri, 06 Dec 2024 08:56:13 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJU7B-00000000zZd-2fpT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 08:55:10 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so136653a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 00:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733475308; x=1734080108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qt7Z7l4IzJbSbBd7IGeNLP8mVs+vDf3JZNjAJLXbLd8=;
        b=I1FIKxmVL+qUDnSzJ4xN1xz+9ogmcQOebi7Z47MqZrL7tMBAt1Cl5wBJuCJ2TtX0eJ
         C2JrMNC9kXS4r2tvPPPuj1f1bwOH2OSkDTjhPaFlj6GnADYW3n5gAetJP72mcXTjcgK5
         EFpAIhI7eFSmDHO19zdkAdHtmc7tnffwa/nhKwTYuZ+Tz38ew7T1TcuXR6xASIHJNi9f
         W4tXdrqlnzOjMk2MdZxRfoQfGvmdb+jGvDswI/+7XRAcvV1q9FcoVNyqiJzYBNy2WVUr
         fdH0OBi2rRMfLGuC/rqS8J+Th0X2MwWU0j8TyIO3yN6uSbkPFzg1wqMGFaFQIZ3r6CBD
         ltBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733475308; x=1734080108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qt7Z7l4IzJbSbBd7IGeNLP8mVs+vDf3JZNjAJLXbLd8=;
        b=b8d4yCutr4MRY+oAAgOaXR+8/9m/LZPlWwCi57nXaJSwdyd8YyQJxvJ29gid8SjR5d
         Em7XNG4t/qsFd5CXNXpiXNPVmUvLcTqh6wkKYQt7/cUsqSNi+aILd4dgfO+KUHguE7eo
         dlaqVzVPmK7OuBdVOOrkXgowYBLH2mstl8PqjuIE2H5H01tzpNvMSKlTnoniCobEGtdA
         kldq8iYlyOsMIw3jlxCmB6RND0JtsondRPcIfinUlHy/MYK/Ontf9D1uxT9WRqRo6K20
         fGv2PkBBazyFyymJ2Cd1xHAAa5P4ssILD1hFLlJ85KKe+bMTR1ckV7yz8YkIii+++0f+
         huKg==
X-Gm-Message-State: AOJu0Yx8v6bPZRzWTOwCGZayyLJaddL7cinJSxndCHtr/Khteo973U0u
	592x4TPuy4wPYFUASNlcPQR6XJqXnPb+ugb12/Ox23h+EM/V69OX
X-Gm-Gg: ASbGncs3EfZoWowEBMphH+GN8Swt7RtKd8+eJr5gvNsFOG8v/13VhsYZ3lvmIhXPDCu
	lgVhp8eNkaP4AfjDGnEDdmRQa9QubrhP+et0Pb3G0NBWnUiTwMHS1BKUYr7YAzp7Sq/Yg1qV9nh
	GzhsOtHIOLTcUMw7QQCTV5bhzpctN0ji0TusfBQSQdHiadYLRYOQXxHwdho+aEVGxobTZ3+o5y2
	4lswKPbhJ05JrK30YFWFbuHbC8vDs+R19Kci12CAVD9hTuqlBrrPozCnEN7IdhSODP+G1xPpeBg
	eNDhvyEDLYZzw9HKBufXX2gy8NeXKa6bQ+rImw==
X-Google-Smtp-Source: AGHT+IGKo685mMivDdAq9M3LGWmjjpmIkL1RsgmqJ3QTFCAEaj1zx7+8CJggDOCSx47c/z5zEUZ+FQ==
X-Received: by 2002:a17:90b:2d05:b0:2ee:cd83:8fe6 with SMTP id 98e67ed59e1d1-2ef6ab27390mr3012606a91.35.1733475308511;
        Fri, 06 Dec 2024 00:55:08 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef270795d6sm4548157a91.42.2024.12.06.00.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 00:55:08 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>
Subject: [PATCH v3 0/2] Add support for nuvoton ma35d1 pwm controller
Date: Fri,  6 Dec 2024 16:54:59 +0800
Message-Id: <20241206085501.2623772-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_005509_700854_714B70BB 
X-CRM114-Status: GOOD (  12.41  )
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

This patch series adds pwm driver for the nuvoton ma35d1 ARMv8 SoC.
It includes DT binding documentation and the ma35d1 pwm driver.

v3:
  - Update nuvoton,ma35d1-pwm.yaml
    - Add maintainers entry
    - Increse "#pwm-cells" to 3
  - Update ma35d1 pwm driver
    - Make include header and macros definitions organized alphabetically
    - Rename macros REG_PWM_XXXX to MA35D1_REG_PWM_XXXX
    - Add macros for register address

v2 resend:
  - Remove wrong 'Reviewed-by' tags.

v2:
  - Update nuvoton,ma35d1-pwm.yaml
    - Fix 'maxItems' of 'reg' to 1.
    - Remove unused label
  - Update ma35d1 pwm driver
    - Remove MODULE_ALIAS()
    - Add chip->atomic = true


Chi-Wen Weng (2):
  Add dt-bindings for Nuvoton MA35D1 SoC PWM controller.
  pwm: Add Nuvoton MA35D1 PWM controller support

 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      |  45 +++++
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ma35d1.c                      | 179 ++++++++++++++++++
 4 files changed, 234 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ma35d1.c

-- 
2.25.1


