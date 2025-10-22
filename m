Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CA4CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=; b=qfhOsD+/1CIFVHqv+iGzzx5+My
	qm2xoAFCRDv/rBN0UgyiPpNumZKKGroheyl8zF6GhkFvb/xMsXCVQKy6/Wr/iK22RunjOCdJqbJd3
	RhBpPbXAGB7OHaEpuuagrjxHSneO/85b0hagWVRe3neU41ii8kNZITrrktV7cMFm+tOo/3kC4+mHU
	ax0Wzgb11oF9r9Lx2SMpE1U56FWfHSP3j5IL1KZc5Dc8rlHFQpFEDts7CCjGbWO99JmCl+UWT3wdm
	uQ054qT+r/cvIpCx7czr5J9o5TKgNJJU4gAVp2+MZ5ztJqL6Jtsxs0GjR51FqnYHPd4KwgLkWiKNs
	0MQ86PCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcrm-00000003pqt-3IC6;
	Wed, 22 Oct 2025 17:43:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcrk-00000003pnu-2Cay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 17:43:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-471131d6121so54624595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 10:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761154995; x=1761759795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=;
        b=Xa7U3d4xRrhcK/LWVKwKeMzwyT7iPyxupkZVkvVBi+LDrPX7mZWti2e6ryjLiINrvr
         XlXPFoPmGEfenkYw8rJQrD1EQSzTJFFrMRq0k8gulJ6JShrLRhf2XzIaeRQBGGvAteDb
         4YBMpyCKzJXytEp/cw3MeWWHzC3TIDQYERfM7wQ8Odt4pEpghSdbArju3CM+QfQbXYUW
         y+p0iPMkCADNU6H7+tgcAlFObLvryUMG4N3GUbpn1NqZAlOoPo37ASD8R6Ajbbp3NmB4
         Wdd5H7A9ypXxwS4RtyJEuaBFFGrS7xcpKwMlBjGMBs18BNswBtNfWH5Y47ze99tUrS1l
         LKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154995; x=1761759795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=;
        b=nxGWLttJQ5u6k+mItxqstdz6dqIGw8PqSXKEgbZGIKewekVl+eiFjt/iSb75MJWYoL
         MQNw2sOkoggimpAd8SzlJOXD0F+oYFO6pkyWDys1uKXtdyR53adNk0DByZwZvvbycnVW
         yGI+ZYFRB6PIDCuMD72nzJPdHYqZLjRZUm1iCoNkgG9ssR6brlm6+pdbbr6AsG1uj4XB
         zAiKWjSpIrEY6UyfAgCWlkR1oZTuN+WZBFjBcpnjhpEeTx83epJ89XYRenpQJtIfbuua
         LirHAvuTnYxdbKVMwrzvhrlKQRl4NaUL174oMpEQz7wAN2404t9osGmBAjGowHyBqpJQ
         LYOg==
X-Forwarded-Encrypted: i=1; AJvYcCU2+olOv2l5rvBD8ZOcu8yQw0xeWn4dEiaN4Tj+0y/vDe5/L2+UjrfD+4Lek+JmnayFaYEnDB1jXR7t1IdrOgmi@lists.infradead.org
X-Gm-Message-State: AOJu0Ywil4lmUS8cg1tly9yWtVcjt0QkHVo9TUzwFYZu1+f/0iqab1/E
	TJHaESHSHONtkTrUHc74fRJ2mgt6bea1eqMeS1krEijN/Jb2oRlcEHutQRnHkT9fVzE=
X-Gm-Gg: ASbGncu15v55sDmWSGv+8Whw57V4/5GhzmTkQpzBGaHhIoR78a8ijegVueHmnJAqrds
	l8GA2vTPsmu1AFY6nF9ZwiI2O3kW5TaxgyAYCR1gFvibbkFP1vXSFXnHk2mISqjNS0M0bq/jfB/
	0FzaInheERIsAMY4uR+XpqDKNmbg6J35WND7HdgdVe72zOGBoqqHjkCc5Vj7yQMh49s0xkvYtIp
	wvBrTFJ281NdlqhH12/bDiriQFsy/ftWG5uFFb08OAJlHxF1JrxQWev8dlJEHjI7U27Ett4DxH5
	oA7bb9nYS+49vKZSJXx++mPqehbL0HynPLWPB9gK0Q9cC9S1WrREQlv0U5CcNGqntRzhU7fSqf5
	OXnji+T6JAZVNaVwSy2hO3nQUXVcDtSNWt/fgFsaRLqUNS4N9Uwt+Z85f6hYIykp0xgW5vKyimE
	icxGLYFHa9
X-Google-Smtp-Source: AGHT+IFA9ek93FErYNmJh5LdN2QDJprClDXAFVaAVFgE+OTKe5HXqKKsARiJ6YdVC5ACPC1UbPa9Gg==
X-Received: by 2002:a05:600c:6095:b0:471:95a:60c9 with SMTP id 5b1f17b1804b1-4711786d054mr173817175e9.8.1761154994747;
        Wed, 22 Oct 2025 10:43:14 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:edfc:89e3:4805:d8de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494aad668sm43434755e9.2.2025.10.22.10.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:43:13 -0700 (PDT)
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
Subject: [PATCH 2/4 v3] PCI: dw: Add more registers and bitfield definition
Date: Wed, 22 Oct 2025 19:43:07 +0200
Message-ID: <20251022174309.1180931-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022174309.1180931-1-vincent.guittot@linaro.org>
References: <20251022174309.1180931-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_104316_582435_9177E3E7 
X-CRM114-Status: UNSURE (   9.23  )
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

Add new registers and bitfield definition:
- GEN3_RELATED_OFF_EQ_PHASE_2_3 field of GEN3_RELATED_OFF
- 3 Coherency control registers

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index e995f692a1ec..e60b77f1b5e6 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -121,6 +121,7 @@
 
 #define GEN3_RELATED_OFF			0x890
 #define GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL	BIT(0)
+#define GEN3_RELATED_OFF_EQ_PHASE_2_3		BIT(9)
 #define GEN3_RELATED_OFF_RXEQ_RGRDLESS_RXTS	BIT(13)
 #define GEN3_RELATED_OFF_GEN3_EQ_DISABLE	BIT(16)
 #define GEN3_RELATED_OFF_RATE_SHADOW_SEL_SHIFT	24
@@ -138,6 +139,13 @@
 #define GEN3_EQ_FMDC_MAX_PRE_CURSOR_DELTA	GENMASK(13, 10)
 #define GEN3_EQ_FMDC_MAX_POST_CURSOR_DELTA	GENMASK(17, 14)
 
+#define COHERENCY_CONTROL_1_OFF			0x8E0
+#define CFG_MEMTYPE_BOUNDARY_LOW_ADDR_MASK	GENMASK(31, 2)
+#define CFG_MEMTYPE_VALUE			BIT(0)
+
+#define COHERENCY_CONTROL_2_OFF			0x8E4
+#define COHERENCY_CONTROL_3_OFF			0x8E8
+
 #define PCIE_PORT_MULTI_LANE_CTRL	0x8C0
 #define PORT_MLTI_UPCFG_SUPPORT		BIT(7)
 
-- 
2.43.0


