Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD32B1076369
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 04:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Er/UMqcx4ckP/cOLow8b5xPe3OYHBVkCHhXLwhn4wRU=; b=nFsIJDC4fnGEsmCNheQOs/qc1o
	N5f0GTyJ0CoEDeIE88vgzrdfADYXJVb4s0PI4P0Bqwb7kyNY79fmOv5CflNy0aWoG7ov161n2ul1E
	ymg1wuLQRHXVaTSUhbxf+/p94BtYuvYXwHuAj+oK55sA00esyjclEOKv5kTUN2J5MnLuwoCnpDJIU
	VIr0yedYvY6HlC+NiFmMve2IN9eQw6r8RuO/lJvdoicHC9RBUryAYrGsCYf5d9405dPEcaR5YXK6/
	E/piWTsgnpE80a84LNGJXSQRFldw7XG9byOXZ3Ahf9jSlZCpfsraOoY80qfaNO4KkcIkaLk+fpKon
	Pbyhy/Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nYu-0000000DxT6-2Ugn;
	Wed, 01 Apr 2026 04:52:16 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nYj-0000000DxNv-0r3c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 04:52:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso3723730f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 21:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019123; x=1775623923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Er/UMqcx4ckP/cOLow8b5xPe3OYHBVkCHhXLwhn4wRU=;
        b=NfQQ4A8yxx/DncbM2qOO2e0I1yYwzHnbx1HUEUfxTb8SAx4Nbh/MFfkYd4gr3aP4QR
         XfY/tq5asvusGODH3262Vx8Gd0CE8QVOAh7TDHUCEPLrUQLls+T8SYxZumiDhJmbrabL
         R2U7HYnspmT9bcblQYd6myTfGlEHErixAkE4M2piKVj9RieMdzp8OMdvILmc2cshfhsd
         Ta/fTmtE62TZpVkqYbFn3QeR+mRQj3gaxqRBqHe+QoyKEqljp37INIYYEV1x+Mljec6U
         2kzu9GBhKhaVxPwW28x+qrfi0L2x2M/3WjR0+q1mC8zJ1ZQm/VRYOpOXnC9GCu4wdfjO
         7szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019123; x=1775623923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Er/UMqcx4ckP/cOLow8b5xPe3OYHBVkCHhXLwhn4wRU=;
        b=UK2uMd7NNgt2wqTUHczhy9jjaGeMjc/3VdSW+YbEuLuwE5g4RFftPe2MFPBHLf6ATE
         23AaTdkZLmf/Zp+TUOH9/teL68dsuScF9v+WErW/K+rOrSA6nzw9dB72dzI6PRuaAZjO
         UfxmFOl5tAYzV4Jb6RyBzPJskPoLbKP1dPsOTQ1cCNhpM+IDZytRcv7a/jlyJ+tvHMU+
         d9LxPjfS7qjH04W582iwqicaFgjKiTePyTJ5MyS4Swe9+1lrkPU1zMXPjsg19QUIjvj+
         C5lHkclGplBTMWdEBRVDFrgEvyUW4eNH4Bu2XyBavXbrKeEN3sR7VCFSDpstu9Y0GppM
         W/xA==
X-Forwarded-Encrypted: i=1; AJvYcCUqFbZg/wyAQOvwAVxXepKgz0QGYmNurEfoxHDEXmbnuCFnGrVyNpPwIz6/NCrCEoZrTDVFMClNWefJl4vhfySM@lists.infradead.org
X-Gm-Message-State: AOJu0YyCiUzU/MW6aqh4SKwC7ZuzZIKskBz4NUK+UMV7Zs4dPLQdFDH4
	3f0didfC2BiAXMwYAGWHel5q6LckCbV4LHSYPHskJnyIvwbsV+IhgRLZ4eBti8al3SM=
X-Gm-Gg: ATEYQzyfnSOq701sdPo0G8h6SjajrWdfHn4ijY9qpxmEf0vZDY+hTvxccZT0x5tLkh3
	v1dCJf7ONgn8xuHCH/858kAL+Cdv9ViIhRxeeARop7cmZxxDgo/YF9cWuKzfW0KZOz+aCGQ2zKk
	GVcXLCmH06li/CtqNiDGoEPkP164JERMF1XIxpgid3D6jY5oa6hHw08MqItRiydklkEw+1a4Q3u
	xW2AobqldpDxF0s0ERMJTnsrEMfNDDG8i9S/b8/RBSiRbZF8TfpPUHo13qUT/lzLRLtqMlifCsR
	MVlX/UbRisAFWPBbm0OzZX7RA4rFxga5GHjFVlIO09PXc5aGd1Kprr2Bgm1vj0C+MOkqP3cR6H3
	78up2qWo8Cq8z/3wmyh1i3oMu+AAH9auQ9FseLUqdhoZL4dSEXEWeJjh67eViT3oj6P77DlFeCZ
	+SBFF5k3Qes6h8V882BMv9nNrDiQicyUCOa2CMuHhdzxt/K3ap5brqEhepO9xQZfsUamoPQdSWI
	LtHVJM/Tt6JX8OY
X-Received: by 2002:a05:6000:2483:b0:43b:4f86:e985 with SMTP id ffacd0b85a97d-43d150e2f1cmr3908311f8f.33.1775019123164;
        Tue, 31 Mar 2026 21:52:03 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:52:02 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:51:59 +0100
Subject: [PATCH v2 6/7] MAINTAINERS: add exynos850-pmu.c to Exynos850 entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-6-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_215205_268841_7FE804B6 
X-CRM114-Status: GOOD (  10.38  )
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

Update Exynos850 entry to include new file
drivers/soc/samsung/exynos850-pmu.c. Add myself as M
there.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e14e6f874e05..4b28e92b4d9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23601,6 +23601,7 @@ F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
+M:	Alexey Klimov <alexey.klimov@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -23608,6 +23609,7 @@ F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
 F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
+F:	drivers/soc/samsung/exynos850-pmu.c
 F:	include/dt-bindings/clock/exynos850.h
 
 SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL

-- 
2.51.0


