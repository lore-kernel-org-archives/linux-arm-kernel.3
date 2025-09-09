Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C336CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/JnNvzakffKPPEMHSBabUxrFocT7sdCvSDe3/0LkLI=; b=EbMuTvIGacuPybY4l/e4KVOJ/Q
	jjJNteUbWBJSGvfVHhpCRIDa9YnUE/O8Pxm4Obg0hUP70AWW0SsBJbROUV26wCOcH/R3zYP2NvRMj
	z9RkQK5JkVTO1YUPd/Lf2Am1Fgej5CGFKl04exS3ua8soTV9+iTqJJj38QGkKIGepe7vmoTcZrDvD
	VaSZ1IesjFMKl9ZP1d+m5hQywYVQg84q03Wd2JM0mRsbjbfonIWk6jsTekCNdpu7/IbPU5A6gqX3v
	G4SJ+LvtdVPMWxOl4l6s+73SJhdO1vaVThO8os6QPNBvZu523JSSByQPOBOtGQO6ccqg6COZ4lC+l
	2m90OEVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0UY-00000008Cow-3OFQ;
	Tue, 09 Sep 2025 15:42:47 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvLB-00000006Hog-1o7X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:47 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so34294865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412764; x=1758017564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/JnNvzakffKPPEMHSBabUxrFocT7sdCvSDe3/0LkLI=;
        b=SpkE6PDvNVQMYbrcDOkOjmhFtfaiGporuGBQZVejnXsocUc4+7Scd3nOmUM5j6yAQ/
         gA2BTh1HjIkli4Vtrj/aKBPJymWx8QM0noFa8REaZm1PYLEti6kFxhNyEx1LlXWxmAEY
         GK6drELzkRtirh9pfQPWo6eYdlAC60/9OA9qvwrhKIELFtTPEcIdPZKR8+2Af87eLTF2
         QPQ5D1ikjQnx4L1u9oGbvFktvNVfMqU2U+6D7I3QN/ymF+cZuIJm++Xk3AR1RG0dWfhI
         My4PEyHET3AQ+y5Qi0rc5H4o8qL3+HPZ3Zun5duFMzYZfTSH0yefG/jDPoSAtUwRAhVP
         DUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412764; x=1758017564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/JnNvzakffKPPEMHSBabUxrFocT7sdCvSDe3/0LkLI=;
        b=F9FkRAkxLS4weRAAPgqKGdBW1M2i4VeOXhcq/qw4uKXRo05AWM2ZcU61iImvpGDnQF
         iyael0pAGL3gJWw+0Bdx5JyKGHa6ngtc0hH0Ky8BkuvH2wu7ElTowdlQBiVopuYARUMq
         IUjBBIcm/ewm0LMeoSXCnnMoxPHY7s2wlMb6Nlbs04s9ImxWWg9Qr4/PSJtSxmC8usR7
         bLM3JaaRDTgdAeMYgtQ0JQa5/rir9HSqQCp9u2C6nuFPxeu6bi1xLyWO+35TIpchsbz/
         OaSArtha3S5n6bb9au5LkzZYSGqIIe8qxhc5yMauLxIerbdEHFejrBEWW88Ml3h1vF9a
         8TZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg6CZ4DNwi1VCVxODi8LlDY+dKXZQQia/dnhIEP0FLxsRA+vXZ+05xHtzVcVVQh9btMFHXaRtcdymPr3SZewQx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8rt4oY7NHCFS8r0IAZQQIEjVi1w68i7u5PwfknPg3B34FT8ZA
	be9zsGJQAkn7ntmKNGSchM6TWdACDTzB9aLoIHIVDatHGIzSmtob5Qle
X-Gm-Gg: ASbGncsgvJjeiMJCves1CIXHviPa2krFDUNfvVb3h2/4HJFyAL1yosHJTu5+7VlEfNB
	OVW0ZHbo/N3qcf0Zsrm/aNidyftqDTU7+CLR1AJBItAsrxhGfTG5NHUyjOmKJG8lTLkG/oTn7K+
	V93BzI0StcPsuLsamzg9CWKNvV0j5GhsIuA+X4vJHGufH/5Mwin0+ncpVz4I5CclqVmRvasYJTa
	w6ycQB31gYxRbRuBqxHIZDLHwvoF6owB6Oy+JT20j9qQXMuAxYBjer0ZTQGCL9dSlgUT0A+Ixj8
	rCCHUWVHtDxI57ooQbRIOM2p/SdlZ9x1LdoNUCrDfb3B1dNBWD7FtHjrDrEEIhI2tqUcsHutqM3
	uu1J6v4e6AlOl8kY87CiLY3UwCBjkNY2AdFJvURw2gdaT5FRgHPVWCVVo4jJp1JwNuX5I2b4mXq
	hEr2LZ4BgWOHMxvOsauag+JEQRINSkmtYCxLJF
X-Google-Smtp-Source: AGHT+IHYgNE08p6/wajlNo3gODYmIE9OcboUMxxGcEpzItxEg+T3n0c8sN0TtIa1aNSeY+YV/NhdLA==
X-Received: by 2002:a05:600c:a47:b0:45b:6275:42cc with SMTP id 5b1f17b1804b1-45dddeefa72mr99293505e9.28.1757412763707;
        Tue, 09 Sep 2025 03:12:43 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dda6da5casm181833615e9.7.2025.09.09.03.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:43 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:22 +0200
Subject: [PATCH v6 15/20] MAINTAINERS: add myself as STM32 DDR PMU
 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-15-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031245_595961_40A1EB04 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add Clément Le Goffic as STM32 DDR PMU maintainer.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d32..a35c48ae925f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23865,6 +23865,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/st,stc3117.yaml
 F:	drivers/power/supply/stc3117_fuel_gauge.c
 
+ST STM32 DDR PMU
+M:	Clément Le Goffic <legoffic.clement@gmail.com>
+S:	Maintained
+F:	Documentation/admin-guide/perf/stm32-ddr-pmu.rst
+F:	Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
+F:	drivers/perf/stm32_ddr-pmu.c
+
 ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained

-- 
2.43.0


