Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E20E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldSIoyp9NzMDNJ5LpZ1ZVmXMctRJ96jT6CjLzy1v53A=; b=oVxZxXPdRqQSgus4Pn5BZJRb9H
	g1AUvcaovP2yWFlCOaMiPgmTTwQ/T/R4MYUz33QBOgj4sVGcfb2nKKfbm8taul8LAXjQvz4oJ7lWm
	+Ulns2HaBo4LfTsZsqtBM0Ge60rP5fLyKxjhJPP42Riiw1dZnGHSWgeos489m8m91IFmurAEGL7Jf
	nSJV+zNDPcp6/2CxKUhPggGHY/SYsqtZxcmgWq153gRdLD45DaRInGlvRD/pIdWhSXHoIOUugkFx0
	IUgth+F58KfKYufQ516l2bhfE9I9DXYs+pUHQYY2A87m8EC1hsBkGUoEcy3kesXDReoaqM1QAur71
	S8oZ7bTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhvC-00000008nj1-0ufv;
	Mon, 09 Dec 2024 17:51:50 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhpB-00000008m8d-0TZe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:45:38 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-723f37dd76cso4189614b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 09:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766336; x=1734371136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldSIoyp9NzMDNJ5LpZ1ZVmXMctRJ96jT6CjLzy1v53A=;
        b=Q2hU/odTZS8OX95CNVOMSWXkpACcAlv6Jnkkx+8ggei1jlvHPWPsji72Qo6jk886U1
         GQjzdE1rwI5OKm0aOlJ555gAp6oIK9mA8hqM0bHebdiQvnGQGz8vuFnctIdT/xO5Ki6y
         DE38M3VPfgE3OEnJI/CmPfkLTc5SM0N0ITJBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766336; x=1734371136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldSIoyp9NzMDNJ5LpZ1ZVmXMctRJ96jT6CjLzy1v53A=;
        b=SVNQu2fXzLyZvsNN7X08fMkkzrnjMIe0bVNpQ10ZzfoyqLe7eXJ3VPdHj4k6Dt1QeT
         b9349IUgWuGMqaN0fAcPqeyt/O9XxFGA9MctFyx78cLSRk0jHe0AtNnD+g6Kg3GlJg1U
         Up8hX5YHGTuOd9xTU2QHzrK17xc1NVH0ORnxsGA7z9ESIuyKIvFYO2UO2SPyd0e1/d/0
         70tmXjdkhjG2xHVJFG+1ZumbxSh1aKkzwLgkRnz9ORxbFdiR5RnildWZUGM++3M482Su
         xhjj0QXwWGFbtGm8tkDDB81rvVkQtMX7ZMdTCfvg+0WZ8to0hilzWf/ReGlg/uNajYEk
         Z0Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUFtLgE7uWq5Dhhz+Ok/kmbcKMQ6GcPUO2/xGgJA/t2TRXa87VfcHLhABzMFMTiVtMEi8Jf8YyUvdu7IKolkkuk@lists.infradead.org
X-Gm-Message-State: AOJu0YxiabiBLS8FeVGJzAsMGJSlYFw6/1pvjbWHdFTHXt6p8hjUd5xT
	G8YxvM/bLQMfNx8/eCGR8UnpqI7Ue30rXYVSOxOddcq6/cXM1VJlPqCE49lRWA==
X-Gm-Gg: ASbGncuqNjciArSbjQtvWJllkXjZZ/nqpImne7cNbeE1lXGyTlhGQGHHa3MDOt/ynw+
	58JgtUpn5P01jTmmnLgc5iGgsZ4MgKg0kHjGYvVy4wuB9PDFQpqIUiG2h58Ek3lHNmLEX6k2JSG
	1Q4JgzZ+ClPth0dhJv/VbuceObFje+nX5YjXRw1GgKA+AJ7zNhVeRZspdAGxcpKQjGTaK1tY0UX
	I3Tw5mvKsVUy0lo4Gn1CI28F1XOgfcsh0h6NraOCVqk8IUdH08VFR9lA2w4Hx4HtRnmggkseQ==
X-Google-Smtp-Source: AGHT+IELiiIw8x+6pqx5MHw1/w0eLnkGYWzCh4ZJPcD9ZKeamtyRCjQeyjxABNpF1rwAj87E+o4Ygg==
X-Received: by 2002:a05:6a21:32a8:b0:1e1:9893:9a1a with SMTP id adf61e73a8af0-1e1b1baeb1fmr2540833637.46.1733766335943;
        Mon, 09 Dec 2024 09:45:35 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:35 -0800 (PST)
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
Subject: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the spectre_bhb_k24_list
Date: Mon,  9 Dec 2024 09:43:15 -0800
Message-ID: <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241209174430.2904353-1-dianders@chromium.org>
References: <20241209174430.2904353-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_094537_151035_92B4A410 
X-CRM114-Status: GOOD (  12.21  )
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

Qualcomm Kryo 500-series Gold cores appear to have a derivative of an
ARM Cortex A77 in them. Since A77 needs Spectre mitigation then the
Kyro 500-series Gold cores also should need Spectre mitigation.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Yes. I know. This patch DOESN'T COMPILE because
MIDR_QCOM_KRYO_5XX_GOLD is not defined. That value needs to come from
Qualcomm or from testing on hardware, which I don't have. Qualcomm
needs to chime in to confirm that this Spectre mitigation is correct
anyway, though. I'm including this patch so it's obvious that I think
these cores also need the mitigation.

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index b1881964e304..212481726f04 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -867,6 +867,7 @@ u8 spectre_bhb_loop_affected(int scope)
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
 			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
+			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
 			{},
 		};
 		static const struct midr_range spectre_bhb_k11_list[] = {
-- 
2.47.0.338.g60cca15819-goog


