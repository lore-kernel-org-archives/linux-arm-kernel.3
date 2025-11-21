Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E50CFC294
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tA1YZwkpqBYNCNgFaNMq2uv3rKscqjzMZ5GFDmRce68=; b=hPFT45XknegOouVhMwPsQzCarW
	/m/3gndSoW4IDBYv+SDlCyvM0CICNl/yYpTQGjflpAbRBdHf9O9AK7kLAhgT9Cf4vEQfi4AMFU+yf
	+ak5gXyuOWRsBmMLcdjUi2QVB2LDzOSHb1BqwdJbORhXCFsi+lSsz2gfdVs/3Q99t1xr+bVCDaJI+
	WoYnWF500pimBIGIx/ksrpFpnF6MOHNAS2KbWLO+qHt2dmbM5MU1+n1R9W9SSKdWPErOqtpvz7kMU
	C1M4Us0jMrIjYd9qAXHVAW89acgc57mDXWHPZJanZW+c4LipkyBDwF2P1HT9uKYm4OCoA57zMxQcF
	qy9cH5Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUKM-00000008kcD-1FqP;
	Fri, 21 Nov 2025 16:49:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUK9-00000008kW8-42wU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:49:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so24040525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763743768; x=1764348568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tA1YZwkpqBYNCNgFaNMq2uv3rKscqjzMZ5GFDmRce68=;
        b=FHlglN5xhSOQAu4rR0OhrXMAO3+uMoc1dNh0BMgJTCfjikrJz+NM10dm6FrlrBFi5r
         H2KYhr7dnJ5aZnlRoUtObXSqe0fwNdgPEFPsCYiFAtRT6ocF9nJnypXNz8uQrpxRSlNx
         RqTya4xEIof6krsBnsbgSv8gGD+5NPxF3RQJ2riKJO1o/s5Kw0c5tmAHC4CXZpOkoqpT
         L2lWsBE8tIA5DUbDo4FrvLw+kU6Sk/4QIlDShvxBZ8Q+MEa37uD2iSoJ6MX/bXrODH9R
         fJtqlvmCbiNv22RBL4mh1a6F0rRyN9kKD3G4AnqLPaw74Jhxm9+2u7EUKSVkQ815yZDE
         S8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743768; x=1764348568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tA1YZwkpqBYNCNgFaNMq2uv3rKscqjzMZ5GFDmRce68=;
        b=ZT96V2F2UeHkLXhtELIhAGLSI8iAj/3Xd44qw0JowIR4QzAzjtxeYuMqiv6aezWaTH
         SCjtWMRqoWmE5lWWsqHO1/DQCzs4V40BUph+8CEgfSfGM+Mv44kWuGNstY2braRg3x4f
         BKitDSWr48GgZybFslyVeszoeJaT/KuyhHtAoxDxQVe1WQ2mYPX1Exrlca0g8OGr72jE
         cuMAWE7g4uMtamp5688bod7N2hovyP5FSLgPr/bGvGK38nR7m2+hzoJEEEBzifRfD8lC
         tcv9sHpWH8CeUhtvKcTTCNQX0icOej8OVqni1pUAkcFocr7OnLpXbfLF5NZUPQ9GZxL9
         +pvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8JvlqfmLiVspDa7yzaQmO5r9ANm0DielwkR79uy1aUXGkGTLPRoBuQpe8TUvhsFRTDWPO5apL6iakdB4pV9/2@lists.infradead.org
X-Gm-Message-State: AOJu0YyexxVOURT8zzmjgkdfBBRDuEE/+lAQX3GeTt4IkgoPXbk5pG8C
	98KHZACh3jzyofVgpsX40jG0hjKtT46HA3atP/ffZ5IKIHaQvG3qkCkcMFySphhzIRY=
X-Gm-Gg: ASbGncvHcGN5OLAhhlSqnpsjz4/KlSNQxzj8YFNvFUqLZ0J8/g8KU9DxgEtjkQYvjMZ
	JvfPGZc6zU2Y2Ux61u6EBCfsRMkkMoHFs4kLorD6Ow/qKDZ7x3ZYlBdTgJy6gt4xfdIn68KqlpG
	Of1pg6MqZXswIaix76YR7vtlDbOoubWiUx7HNA06OGnqDVQSaSiNqc359FvRBWlnD6lLnOuAwPp
	3/F6HSV9MCmciPrSeZ4BXHXQy44kCX4q+XjHTIVMoYw5TDJqLkkccROSRdzhAXhtP8svyFPk/zM
	eLRunr4VtBtDfhiumBkjyEij83LVvy7zOmeqkLNtJZfQTsnOEeLfH4xui1zRRQUTE1BMrKnxWwp
	9RvVUYutgkDcVSqkypvq89SSmGNEkxmVwcFHoSZlnTwPMWP/jGs/su747xF8foD0/bpaxITs281
	0gxm0+7meFek+OsuE2i2k=
X-Google-Smtp-Source: AGHT+IECYLnmyytfY8LzC6PdkZB/9Qv9aOOwBQ8USRlzz0beo5YI3DVNF2FJyRPzQ4ThwhycZbswbg==
X-Received: by 2002:a05:600c:4f06:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-477c114ef3dmr30830045e9.26.1763743768105;
        Fri, 21 Nov 2025 08:49:28 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:803a:ae25:6381:a6fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8ff3sm12938478f8f.29.2025.11.21.08.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:49:26 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 4/4 v6] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
Date: Fri, 21 Nov 2025 17:49:20 +0100
Message-ID: <20251121164920.2008569-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121164920.2008569-1-vincent.guittot@linaro.org>
References: <20251121164920.2008569-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_084930_036208_9135C83A 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

Add a new entry for S32G PCIe driver.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64b94e6b5a9..bec5d5792a5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3137,6 +3137,15 @@ F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
 F:	drivers/rtc/rtc-s32g.c
 
+ARM/NXP S32G PCIE CONTROLLER DRIVER
+M:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
+F:	drivers/pci/controller/dwc/pcie-nxp-s32g*
+
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
 R:	s32@nxp.com
-- 
2.43.0


