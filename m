Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354CBC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=; b=GPf1DPawP+D1tmECHrg73L58v/
	9Jl4gZK+DgFNgKRyI8ZOSS4RpJzmGtyxj3Hu/oRRAN+5cZ5vG97n294FwPrgjMy19elHbaaWtcXl+
	r2BHbOKAVGw5QysvlN7I85hAYdjqkrFlvgc6vwrFcf2oN/7Ow8mjUGGw1kqfiIoP6b083ytwkp+bG
	1vVyIP/nimfjKcVH+w4WrE6SOFJ9J2o00joK4LAmSGyUeIDX3A7xXaIlX/lMMWUHZypzvKeIYNKsX
	WFSXaCHeK1kkKOnc+nX0LPAy5BVRs1Fw+IuvEgf4zFBiyOvMVUhZgx5+qD73w1FCVVmZVh/VsVIsT
	qMKYHJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4m2-00000007vqE-2n8r;
	Tue, 10 Jun 2025 19:36:42 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Qg-00000007P27-48eW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:02:28 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a361b8a664so4613717f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 09:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571345; x=1750176145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=Q6gYfQjqvP0NVsOsgOgiD21qyEbearVLByUECmT+Wt5e0FsyOrioTZ9mM/d6FvD7oo
         1AUYXrx8T/ziTpi974AK+G4Ql7JbtnPPy1N7UiPZfG5UtoV6gZw+m+6XsKRzNXYPskiJ
         UaEIAPHMBjMT8NPOx/uAlhHyzhrKLM2aNqGHEQjtR9whp7+FSO0wZRJxEV/CKZUZOTO9
         hQTgjtIWzVbO6+fAqqUJZf00n4PfeLnQ46XG2FWa7nyyDrk0tsGStn7bZPKySGA1nfkZ
         7FWfZWORpbhNWgnH53cR1+x6conGKEefWihQdcTy44YUW0t9FnrhpkddmaEQ8wOR1bD9
         UoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571345; x=1750176145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=bDfgMploQ6ZTp5UG10N4bUwyoblRI242ykhcijr4tuXfKUI8LjmVyzswDtuWjRnx1X
         DMVSNthzkURdAsXazxqTTPCp7jQAr4Je0JlPI3ZKIjbzcUt7RR/eUCF54leOTHa/mbNd
         tD51vgSXrxK6bYq7CcZl6r9djxdBvo+lURJrCpVKI6aqcNle8nrm99/B0dUYZ9v1MVgg
         2AZcW20pWtlLks/MpqJBJ7zVRd4VpuQzbnEfgdkLLvZgvOMPSneIlL25z2qL23I4gs3j
         0mDWQuAXzoUG0H4a7pSSCvOakLVSepHtm1UisKzn9zcB00flATNPBcTT9rgLVIcACXyC
         wOMA==
X-Forwarded-Encrypted: i=1; AJvYcCUpUmIkGw07552E34tjLlrelRXmojzRJlR0CuNhDZ/OxsF2xG3yhyZpRi1r/jpUpJyDclBepr77p0SyoS5FvR9w@lists.infradead.org
X-Gm-Message-State: AOJu0YxusKtdwmo3i0sNsNqEhNfzDAv67BxyvIvaFTpQl3Q2apZkKAi8
	m+onHcj026zczLpKb9+6PPozdpeVJeIcZr4uSbBKZsdYB0z4SIZdxxUv
X-Gm-Gg: ASbGncvvNBoyc9GCD5efVJwrxqpL4Pkl8+VopRif+iUHKw7MzxkzNR4Ieo6195MGsdE
	6OeqBbg2AbOjzfmPEpDcaAqvulf9Uaj6wIkz0LrZ0W85aHr64QR6pebnqb6T5HV01iK1qY0XuHo
	NBjLB0jUVZUxIOCAaypG4s5VMwKNdGIH1nFda2dh4r1HOlJauV4tpmH3j07pmUhnxsBRmVTOT8j
	4kqIcNbPLNbeHSEQr7bnQwNqJF1kCCBm2p0PeB6+pofUq1ZoHUYQbcbK1bv0XkEnrHB/67FMF7Q
	d6Ea6PIAvr5+W04zDFyZ4Dn1nrkWXX3kygBr3nVGm5fo77Kg2bM/h5s6JR26zH2qLmxgslx8wWG
	8KAZnOWtvhbNdLej5c9mOBAs=
X-Google-Smtp-Source: AGHT+IE40dc98wMFPx4uPCgW5ShheukO7bwqGFEpXjw3tHAaGruG35TyY17fMDbCmkoqNX7lS0vi5w==
X-Received: by 2002:a05:6000:26ca:b0:3a5:2949:6c38 with SMTP id ffacd0b85a97d-3a5522ddd75mr2710478f8f.52.1749571344655;
        Tue, 10 Jun 2025 09:02:24 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:24 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/6] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Tue, 10 Jun 2025 12:01:48 -0400
Message-Id: <20250610160152.1113930-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_090227_028701_EA3CDF53 
X-CRM114-Status: GOOD (  10.55  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some DSP instances may have their access to certain peripherals
conditioned by a bus access controller such as the one from the
AIPSTZ bridge.

Add the optional 'access-controllers' property, which may be used
in such cases.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index b8693e4b4b0d..e610b7636a08 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -91,6 +91,9 @@ properties:
       - const: runstall
       - const: softreset
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1


