Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32050CEE331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tA1YZwkpqBYNCNgFaNMq2uv3rKscqjzMZ5GFDmRce68=; b=uRZKkgI0F2nlixBAy8tNucMqb7
	TeD2fNZ/Y1MG/Rx4cPfOIkSoTUXusRcZ9H7VZh9lzH6RQ4568UsNOYGmBAejLiHyZNkQYwellsItr
	plI4YVBFQHbP72K0sKcYCcaMEb9FnJ5pun9qJFPjB4+wDxbm+w8RWAGks5iIHF8pWDvvmt+m7JXME
	atcOJcLrKzbrrPNi4T0kqSPJDnE6gJRaMiOHfXtwBIN+XJdIFkYP0ihmOfNrJoA63tbhexyKChu11
	nRLYnC6GQjJ8Y30q+2CTgtEsspJEEAFDwN9J2/WRRUVfp8xCPYPlkVDdJeUKAv/DprJ5dVTDDPJed
	fUBlB5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOAd-00000000gB0-3icP;
	Tue, 18 Nov 2025 16:03:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOAb-00000000g9G-1QDv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:03:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so26682215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763481783; x=1764086583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tA1YZwkpqBYNCNgFaNMq2uv3rKscqjzMZ5GFDmRce68=;
        b=RbUiPf+OKW4DOdXMDYa4Ts7OGNY/QzsXxnOe5R2iwNCMmkTpvlbCsAy/aWOLWzmFvk
         ughSgyDflSVDM2sExDuWBoFnK0rO6bAZROZu/FHCpqAUQMS6kzz5Tgzp4t1C1I3GWzyN
         DB/aGOkSctNahMrLxtw3YmgVStbhjysjf9LNCLr6nN0pA29dvg21rpwpOkr7bUhM328n
         m3+eTh/ZY8tjJeJm/VxMtl0Tfk4kJQsCD8viLyogcP5Y15aeaXV+KgtnwWGiGpntL+7u
         shiljEh9CBDa7oxMWju/ud99mN78qk0GjQLxj8dLWK1gPF8WcQs63RruliUTW874ITx2
         /tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481783; x=1764086583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tA1YZwkpqBYNCNgFaNMq2uv3rKscqjzMZ5GFDmRce68=;
        b=FCkQ0IbMKDMp/SFdJOBNVaAMry15FLmAanJgzM7PdJg8cyJA9/I2wwlm9p724uls1C
         uCRNZbcGLQCxShiJKaJreAqX1pIORcpiLT7/u+1G5PAg9F11hCdI6rdg4RKwRhtwtcUr
         6svf2yuOyGbH2LOZI8/pk5NHc8Uxdz86MGJ8Np45Hd588BMx4UIYkaleikt64atnEOvx
         iXZPXXZ0r7YsXYCJgBhhZMZRunYlZ1ojBrkAFvTKEaTUfFqhT08Jav8xP1ZmxGLJYNYr
         9ZNmPeYI84Bu7p3JoP/egrlH4SVndM4O++xApOanFswiSrO+WBy9tn8IdtxMy7Y65m3I
         ZhGw==
X-Forwarded-Encrypted: i=1; AJvYcCXVopJt4SD6IIgrjs7rqUhADbB9MMdC2yWefL1wSGEWpno6JqSVFfvbDVG9JmEK+PqxBxn+tqjO004KaEnSuwre@lists.infradead.org
X-Gm-Message-State: AOJu0YyIvAKbFqHIme3GHwOd8FpWpdJgQtYPdqMrRBKXQZHXyqQj1dK1
	m7Rwf/T07Y/LThBCyU1Os2II3dvmV1p+oeqvL2cva5+KkCHqhomi84qFA7LbNmDJq5I=
X-Gm-Gg: ASbGncu/2Pz7yxnu6A5HCIGDxaWbI4ukXQZyAq8cMlN/hXrNLk66kHl93NkBgDriGWD
	rdkwgEleJQjvp2xF2ZUnjUSCj6qZTaBGIk8nwjZhuCNaATAlObXhYqwXX2qYYY8yFqrZJ+9Aagv
	HQer7goHQjXZZAtW4YEHcQ5XFvQhYv84pBm6eEOKXWE4MHGbfImR9uEFEKYEjmxfmVy9m04773+
	7x7h2b0u86DZ1dJOBE1I+tt6jP88B99Wk1Bcrng4oRS4cf09mB42VBYSPUfN98FmeOsTj2zp9yH
	GDAHx4FI6nK5ABAW3Qftsgq5+4rs3DP8omQVqc2ZFHCkKlPuxH956/U+zkPRaYABpYMyG73rF6k
	e45BvqSY957QEjr8XCZlYc1I5a9KDmugH0Os7idSExT3qsjaPagynFi+F5TnVWtCNIpapUmmh/W
	GARp3QcUtf998k+TpnU34=
X-Google-Smtp-Source: AGHT+IHP42lpaoxGDvnSTeMKhUhW83P2qJNjoVXFLokLHe+fGU/P+jnllwRuJQY+oQ4sFZakhTOjHg==
X-Received: by 2002:a05:600c:4714:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-4778fea8d93mr142436175e9.26.1763481783366;
        Tue, 18 Nov 2025 08:03:03 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:76db:cf5c:2806:ec0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fc42f25sm171954575e9.6.2025.11.18.08.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:03:00 -0800 (PST)
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
Subject: [PATCH 4/4 v5] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
Date: Tue, 18 Nov 2025 17:02:38 +0100
Message-ID: <20251118160238.26265-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118160238.26265-1-vincent.guittot@linaro.org>
References: <20251118160238.26265-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_080305_393041_2F90B540 
X-CRM114-Status: UNSURE (   9.80  )
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


