Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2AECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UP5dGRqrdTptZhQQ4EtYFVr64j2KjS+2vfjCc+4QY94=; b=lHRij9EIV1dUtHB/rROz9qm99j
	Mhrt2MHPtO9iwRyq+gKXBufLjy/+q4kzx6gX/XshgJQmez5IBNJdxKvxyttgKGULLjNg8RozQ8LB0
	7+4Hx0hJcd8pCXrXI+kle2xh5pf4TRt8bsLGASPL1VNE33XhtL0EZorSvRGWvFxJnPcjX7bZPnmq7
	BLdtulXXcMdmCczxCx/d0VfRKdYR+KN9BnseaA/ZaVayutA1L+ccUF3NPUq0g6reFkpjgtI+yTxrT
	SZJVWW08ClhJfi+hAyx4E4TK8mF5+Gjwg4jB3YSiTFvym9J1EOLehto36AqHkKsFN1ccaQ5isc1Eh
	qfhuyPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdVJ-00000003QuC-2APx;
	Fri, 19 Sep 2025 15:58:33 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdVG-00000003QqU-0zHn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:58:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3ee1381b835so1257045f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758297508; x=1758902308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UP5dGRqrdTptZhQQ4EtYFVr64j2KjS+2vfjCc+4QY94=;
        b=p4vthC3lUGzQQm+mv01vw8ZXu42wmp/mE8+h0nAedTZY/Ua7DSRvPyqg+P8ouniXf5
         MTP1GhX/cbj3k2bagqGw2yhWHUNkqpyRFPftFnCZHbUvAbUsVO8P+HQg5z/QKX8bKanf
         nwhjTQ6mUa5hDhcmqAtTGPpOINPOoXBA9Xfzkd5IKTcOMwEz1/fhcc8JcoafyXin1Jwm
         i/8nO1X6ra7qcbDU5Q6lB6zUxyvewHfSoTsXsXQtbenCCbKXYJk02M6A4M9N8ri9xyBA
         UOlZ3F9vSUVDjnn1vRWGtUroxVwQnoH6+TbR37PQe6uwsd9PQRlu6YaMYxfaamAFcPi4
         oUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297508; x=1758902308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UP5dGRqrdTptZhQQ4EtYFVr64j2KjS+2vfjCc+4QY94=;
        b=XGpcrzejlbZifg1ILiNWOMEpR5kcKUYr4/0m/oDCdwpGLW28aeMgkssULRii3ZZYpq
         7LHeuu9ovFsXXY4Dkh2MZmxNdWU3wWMbwQ8Ah4tQqX1SfWNHpfA3rmKRuECpyo4hM8Wa
         A44CxrAyZLYnK+aa32Yrv0dWu2u+2RAbsHkpIqgMHwuW3EwleZizPqaURZihymq1RbR4
         8WrinBPbQtqe+1/TeymiU11n0srUEvkBvZxxbCI3XUi+5yC7STg7XoO9PYh7gvsupUZL
         rtsdxKSQcTpmhX0lM6Lw52MN97TA18c1rELBn1CUD5o0bG2/4ci6Q2czUZp0tN2kpXrW
         +AfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfaEFDVQtK2OsJ1kOvkM2Fr2dyJGJIYXksg7Zhp82N0+RmhC1aLYDMNCVs2NlBPcE7ellPzZmwSzojVA5QTuTB@lists.infradead.org
X-Gm-Message-State: AOJu0YzNanVo6hUm4E/kcRukRDZFGRExW0QWuFBihnXtJZhTKBLPsR3r
	7mz1NPpB9zpig6go25oUNekPW8FCDApQwLUW/+ycLem2MHflsRfiLSeeyCigNUjAS40=
X-Gm-Gg: ASbGncuzs7PQjzHKWlYb9ISyvTawVqkhUC++TXRDmEHYibbjB3vwIzEc31p2zSMcL5X
	f5P4bc956841gghePQXvyrpojxMucHf+1Z9MoiGjYyLqJW1gqUkFokE9zkBqn/lhfP70symV6C9
	Ls1YGVJGa5crxlGx8Rc9eOr4Gusam5S7AUnrJkP38JuHeLRkYZc1vSHFDYJqeX/zKZ/w9mQDGHS
	mE0CYLULiaAV2rtxxtIKh+b7KMUKVGRS9yp8VXXqAwcmLC0Pyw+DhO/eextCmv8hEJKjgi2KT79
	68w3uigRiViUc/wl/VSafL6USQ+MwROnmVhc0AzmvEYPP73sy8U7ZUDp4CJ/r+XE08d1PPB3K4k
	46WDEiipc9E8xop7Y/w5aQsvCLzMXqU8=
X-Google-Smtp-Source: AGHT+IETzqsiuBysZBMfPLsmfeqemqt5Mwb8f51wHMHjVVo0pcnRoASq/BUs1RN16Mcn5F21Vi0GdQ==
X-Received: by 2002:a05:6000:144f:b0:3dc:ca9d:e3d7 with SMTP id ffacd0b85a97d-3ee7c92548amr2737996f8f.8.1758297508355;
        Fri, 19 Sep 2025 08:58:28 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:9dd0:62bf:d369:14ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07407fa3sm8367224f8f.21.2025.09.19.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:58:27 -0700 (PDT)
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
Subject: [PATCH 3/3 v2] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
Date: Fri, 19 Sep 2025 17:58:21 +0200
Message-ID: <20250919155821.95334-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919155821.95334-1-vincent.guittot@linaro.org>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085830_296884_CA4844E3 
X-CRM114-Status: GOOD (  10.56  )
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

Add the s32g PCIe driver under the ARM/NXP S32G ARCHITECTURE entry.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d32..fa45862cb1ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3084,12 +3084,16 @@ R:	Chester Lin <chester62515@gmail.com>
 R:	Matthias Brugger <mbrugger@suse.com>
 R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 R:	NXP S32 Linux Team <s32@nxp.com>
+L:	imx@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
 F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
+F:	drivers/pci/controller/dwc/pci-s32g*
 F:	drivers/pinctrl/nxp/
 F:	drivers/rtc/rtc-s32g.c
+F:	include/linux/pcie/nxp-s32g-pcie-phy-submode.h
 
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
-- 
2.43.0


