Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763E7CFC295
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97IM0y9keENG43ISIlS/0C0BXR0E7thIuAT6dZAC+oc=; b=0XQjUSc8+pn3gLwZMPqNy3aEqE
	qMgsyxcNO0g93l4fhJh+Z3GQ8bNreDqCGuFUnWyw3Mf3E6rlvIVsd/rQnoxF7z0CCrP0nYBxBiSDl
	F5M9lY4zofKW7YWUD3ZJ4zVX7Xl8nh8XbxX3Nbx9R5aET+w4mf55hClfm5Ri4FQYERzCGtVRvKuvA
	Gmi1YPypSM5+I4Y0aI7j6sfdQhX/gXIF3WN9ntgbHAottuKMlJXCvinHo6Mi0ckex6WNPKfy38L6K
	SmVzsojsjOxRkuXALhNJnfSw3RNcmWBIAN6KJraILXXllr6csH3weQJU2euqfUlogP/+kOGIyUmDi
	PYvfoWdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUKB-00000008kXE-2leU;
	Fri, 21 Nov 2025 16:49:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUK6-00000008kUg-24ku
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:49:27 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-429c8632fcbso1429040f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763743765; x=1764348565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97IM0y9keENG43ISIlS/0C0BXR0E7thIuAT6dZAC+oc=;
        b=kzQVez+d1QePiudFw6FJSq8NX5PVGq4qN/VPKxBhp1ARhRyN1r0FO1pQpNqY00CU06
         drBFvN+0RdQwi9cO4dulTXLQvBVx2RZb8028I1J58O/9k/GJFwDCakLxbplM0LXBUabj
         TPGxU3TCz6cHK4ljU8VVJVyh69xK5urkdf1Za7rJZzg6UADl5O3OBKqA3d6Mcs3r6Dyo
         AxUENg/wtrIUzKThrS1lIjDAjMf7v5QDLhUpxLuoQl9nydN9lzdU7ZmIxgCg1OPKgrnW
         EvzJel5pAg0ZfvbtR81wcLysKVU2vlAvSPhI4kAxUjkR1x63HtvQpyNY4NyLIshYZkDi
         EiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743765; x=1764348565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=97IM0y9keENG43ISIlS/0C0BXR0E7thIuAT6dZAC+oc=;
        b=MhF9sa1eHXdvMsa7wqAOPpB539x/6nFIyNl7f8qAPUODVfyR24kc7cpe9zAK3M5ynm
         xCxwOcHJaBv/oMk0/kZ2nym8v3HZxzCM5NsXQ3vx4hAUQt7sgsCSt7f4WeLopbODvvRY
         9vGR84Suy95teWf9v1aVkpq0+kw5EWLTzOBCVqUb22BCqz/xpDqK0jPcz6iQ5oVWhkoP
         AHxjlFyB2ncH2FUUsPiq/PS/IQ+VOjGDLn9wG7g1vyc7Nu/MP/fGoNCh28I7GntA8xOF
         M2hO0JaYVwO+6rjKnuy5979rQgkiTGQ/AG1jdzxBrnVpD+J25hCc/25YzGaew6aeQ54S
         hZyA==
X-Forwarded-Encrypted: i=1; AJvYcCWsUlCgwRHFI5s66Cc1+hpE/ClapfYtGbMVKTh4BpAYAuIpyi4EeBnfxVuFWp860k4qzox1xUNtKMwvhwbTYfFN@lists.infradead.org
X-Gm-Message-State: AOJu0YzF+ixiHuM6prChCO67O4k7FRL3PPjbEapL1mBuS4vK8XTbcYap
	6M1NYDAvrYCLR2JHzdoyIFRSGJ940S1Wr2mkSsc3r9ccGLVp/6Omp5Uu3RH7+3fOB1M=
X-Gm-Gg: ASbGnct0rDXr9lcrgfq5wb7NAyODCmhpo0gJdW2R1esEesvFaYL4KWuX7uABU8NNyhp
	TGwKrNrAPDCWAtPfs8QuWYFZwWdP20rs6Hth64rNTKLMzvUjO4XCqJkmyK8MUSLwRQfAeNfvGgq
	OvB74LfG4nUOkHimzPbjSKWieOT4h0Zx+RVDH0aAxv+exIPYo7MZ5iUsAJpm3zktuHZY+tCGdkb
	VsUNryRCwuqq9HoNtPHIXEHeq8QpeHEy+ElLDhqdd54XoQqqvjuBvGR0xO+O1FY0PMi5V6OBAVB
	AOR6sH5yVJ994sfeaZ6QyIMUoKwr/7B1/E+BU8/yqjpvAr3Equq4AuAmrR5NFK/1jDhwKlIMgxb
	O82ECGqopYzoQWIVpleDmYL8hd015ajcNNR6Ua+Gs0T+/yAxOOKU6Opl4jRHaj4fzI+8z2Uurg3
	zVmQ6egN2pmp/smMnsh40=
X-Google-Smtp-Source: AGHT+IGP1z5eL7MkRZMuT+/A4f802SQOHcacTCZ+7w4s9B7xrEEQz3dSr55JMvgGIquLZen+ZtXkxg==
X-Received: by 2002:a05:6000:2909:b0:42b:40df:2337 with SMTP id ffacd0b85a97d-42cc1d0ce73mr3080145f8f.50.1763743764670;
        Fri, 21 Nov 2025 08:49:24 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:803a:ae25:6381:a6fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8ff3sm12938478f8f.29.2025.11.21.08.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:49:23 -0800 (PST)
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
Subject: [PATCH 2/4 v6] PCI: dw: Add more registers and bitfield definition
Date: Fri, 21 Nov 2025 17:49:18 +0100
Message-ID: <20251121164920.2008569-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121164920.2008569-1-vincent.guittot@linaro.org>
References: <20251121164920.2008569-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_084926_554112_82DBB919 
X-CRM114-Status: UNSURE (   8.46  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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


