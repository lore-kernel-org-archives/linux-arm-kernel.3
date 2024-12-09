Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909B0E77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qETIrWIvBOaJo01797E2hvCoFBrPeIJqundEykxnLWc=; b=DP0ErmGOSDGTYdBE6OEcZVlaXW
	FhCyoUgxLPULIbX4vsFbsXkuSoP69XCuMr4MtHfv8XlPCzVp2AeTeCvJifEkwm2B5+mU8h63aWs96
	B+rE2p0fYmJ9sHxGGLQqjKNiHWRgBHraIgjCoOGyf9qQB5uKWf9c9h5bOcnhSMVAtqs/pBu+ZXhkf
	SSv/BLwQj5Uvc/UbdtM+zlSJENjYZdusLKfdKix0/G5xQd5bt2ZX8TzwuCbceCKoYihkENeY9XAp2
	KzroO/MtTrleBbB0F3hlFHUHdeoXiebiWM0Fg67UOBx1RuhtoaaZ8JkUWio2jpvW5Hd3CmiCmfKIS
	9d5otmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhs9-00000008mtk-1PGT;
	Mon, 09 Dec 2024 17:48:41 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhp4-00000008m4i-29mA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:45:32 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-725aa5c597cso3432820b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 09:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766329; x=1734371129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qETIrWIvBOaJo01797E2hvCoFBrPeIJqundEykxnLWc=;
        b=SD+SKQSVrv/1UQIqj4lTP52hxGaj3vw4KSEcUQzwKqZZnSJ7mMB++t6KWIPX9vI1Cj
         QUdIP0mXk/JK/EVPGX2rnVJ7dQFVKZA8hTAs/E93IjJcQnwKApdaUFr4xhXB1DL7uk/w
         PVXA3x02vv5zebPoU/P1TLkAEaHbeVp/Hy9d4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766329; x=1734371129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qETIrWIvBOaJo01797E2hvCoFBrPeIJqundEykxnLWc=;
        b=blx+EnFCBKT9gpSciQhYWi/8N32bxQmqS9rMJclHpDpFqIfy5YRKuTsRKJtIw8iq2K
         syh1/d7e2Br0Z1Uc/hHKJtbfL2u8YoEDcXCRiy8PqrU9OiTqRMMk6SD+jFZBIAs19YBE
         DyZlxpNUKrRmkocFpbWgutcNH7r0EwDXC66tE6xitM52q9nr61Jm6H00tn8D8CzCRdn6
         1C4pLLxa/YApiUMu8I5CDuuOD3D9pN6lEiCjRSrbst4XQhZbQgYdjjb7Xi5g9eT9VxWI
         Hc7ayZQC5Vj8gxr6nE6zz7/7Jlet9QMofgiL4gS6yK0y6YJql4cvRn2oWAClW53gWf7/
         IAeA==
X-Forwarded-Encrypted: i=1; AJvYcCXyT8CTgZJg0KN7kNHRXeMWQh7LTkfiW6PHQCYAIRRgkxIs6FkaHnC1LMf5TG0C7UMMYXA3zKMxKbcPc30wXGxF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6I3QyvWmoPXwg2rqu+gaFJNMndAeazwRq2EPvHOPXLiEQIHb7
	J5QhBENdJat1N2FjoQo4CCLl43by1SlqwlvWfOfIdHrMmJMwe1DDmhqXIA4KTQ==
X-Gm-Gg: ASbGncvq8xNG9bVByX3RJv4WjAaP37xz+Vcg0SjqzR85abx8UCw6sQ/f4DxrMTL1GZo
	Qm6kEgaujgvJ53w+SAqwBnw/j/n5kArDVkxZjLsVVUb02V6Dl8YtYkHj4bhEV+bERgc2P/XTlLW
	KdQETN46+yWLQA4IN4vt0qW/xfW6DH6W6DxoGgUhz/yHpVQF7yUNtADEwT7Hnl8UXyH3N4ljGf2
	Y69wUd5mx5vDWT2d1KzthfkNIzHOIhJqWvooEKroFYlDKuZ41pemLtIZ6bZP9rkKSTZgXTkKQ==
X-Google-Smtp-Source: AGHT+IEXGhJtpWKLCDTsUasg4AZJ83eo6fiziwMvcakNMUhC1SAx4Xv/ur4wHscvWzwdgagPxhNRYw==
X-Received: by 2002:a05:6a20:3d89:b0:1e1:a3cf:c199 with SMTP id adf61e73a8af0-1e1b1b8a4fbmr2336458637.28.1733766329338;
        Mon, 09 Dec 2024 09:45:29 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:28 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] arm64: errata: Add QCOM_KRYO_2XX_GOLD to the spectre_bhb_firmware_mitigated_list
Date: Mon,  9 Dec 2024 09:43:12 -0800
Message-ID: <20241209094310.2.Ia3dfc0afadbfbee81bb2efb0672262470973dd08@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241209174430.2904353-1-dianders@chromium.org>
References: <20241209174430.2904353-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_094530_557181_8ACD0911 
X-CRM114-Status: GOOD (  12.44  )
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

Qualcomm Kryo 200-series Gold cores appear to have a derivative of an
ARM Cortex A73 in them. Since A73 needs Spectre mitigation then the
Kyro 200-series Gold cores also should need Spectre mitigation.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't really have any good way to test this patch but it seems
likely it's needed. If nothing else the claim is that that Qualcomm
Kyro 280 CPU is vulnerable [1] but I don't see any mitigations in the
kernel for it.

NOTE: presumably this patch won't actually do much on its own because
(I believe) it requires a firmware update to go with it.

[1] https://spectreattack.com/spectre.pdf

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index e149efadff20..0437be7c83bc 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -925,6 +925,7 @@ static bool is_spectre_bhb_fw_affected(int scope)
 	static const struct midr_range spectre_bhb_firmware_mitigated_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
+		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_GOLD),
 		{},
 	};
 	bool cpu_in_list = is_midr_in_range_list(read_cpuid_id(),
-- 
2.47.0.338.g60cca15819-goog


