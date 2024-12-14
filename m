Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9E4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 01:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nevtJ7/NdNl+3R/l/o9OoX53K9dVtdSsX5xkWCrYzfY=; b=I4lN0UBimuPJAolKCCKtM3Orkj
	DiPp3MIyEgQlyj5S2SOdzCzMqTBjVaqBMzgaR9De4D08c42fAp6aLqrJ6MpCD9FLp+K9b1xaEaXWI
	rIyhwWPMMybrjsVgE3tkd6T6gidMXW7e9ApxH6ZsYLkpF0PIHACBtgfsUBUXe0vcsI770yRs0Qg9i
	RLihdKalRuqqFSHyODlZQvzkD0KycmVL14FYAPecpwv1CQaiQCvFJDNWXULEdKqk2fd33xKEK9XBF
	pdp5OlcaPrn+ZNupvahuqymYgUzZLwpASxgyjP+3pin9COBJdoAn3DW8l2BLnf0RFV7rORFrVYQpY
	ohQHs/mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGXV-00000005S85-2V8H;
	Sat, 14 Dec 2024 01:01:49 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGPJ-00000005QoQ-4BsX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 00:53:23 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so1705804a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 16:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137601; x=1734742401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nevtJ7/NdNl+3R/l/o9OoX53K9dVtdSsX5xkWCrYzfY=;
        b=KMFX6Ydb6awfjPpuu4xtONuY3bdgiUuX6q0Bd1Bd4No6i8MpU3/THb42rmssQzT4pC
         TFf7ZOmnTQKCqP5lsy80zOSbIIgZdmw3D7Fc0bD6j3V5DIT3bQgGI3f7ueE8dZvdwTg7
         WoIRfsCaXWZ+csRlG/9evlh/RZgaOd2W/ooRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137601; x=1734742401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nevtJ7/NdNl+3R/l/o9OoX53K9dVtdSsX5xkWCrYzfY=;
        b=Paux98FCgsIiKRMv4uDOEPT7el2TDhCHLubOAu/6mGq/J1TyLFJTPQlZ17vyR8Kkk7
         0aQpYvrKRkSt9bbFjj4kSniVn5i8z0OQkC16u2UgvhiRfLwJyDeNcXOAlFRwcZ0uyZuY
         dh18lxotzSIQSwqNyZzvi3vxIuX9xObnQAjqQzS4v+AQYaqDGUJ4cP/9vo5WoSZGWFB0
         0g2Usjr8DFV7STLkP0lWmFIhO6UKYqpqKXwmW/XDMYvJLWNIoBfRs/TFGQdGS6T9L5HG
         48SHuLlUCgXSfbPphGfXVlU4fH5D6czySiIvNbFDQRooiXdYXcQhY6r2btrlygk6C2S0
         quuw==
X-Forwarded-Encrypted: i=1; AJvYcCUzK+QVWGxue31LYP6jaxNoIfo+uK5ejrE1oMcDXFF0VZLI6Ibj2+3SYIlI9cEWI7bZe/LZTfFxrEpFrmIMXWIy@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm/OWIdECDOacJYqVWFehT+qSkdnBlqqeCRn9bDHCNlz1s39tH
	BTLu5pGQy64KXojlakNRtIFy+wAv1HqUul1d55Np+VHn/ISoa1A4ejbTNxqWyw==
X-Gm-Gg: ASbGncuNRW5uvRnEkbZWfyKqu5fe60iNw55DzI8sS3VW5rnE7WkRhUYy2+cKUG/XbsN
	2rQ7iynvk4nXxtWveX9D8y8MpIa7eErUXNBC9q4gENyzKTo0lIT1RO+7YAJOcjIKXJX7/HUvjBL
	9RnmHvAz83RgHiXafQ8UarflLNyv1SC80kAZJ6G7L1t2TB+kyp4gJsYOzMiSlAgvihAWYhTV4rm
	8uhkYWPPARu9/Ittrotb6hlV5IQhH4HD+ZTla41JS+wBOf6Zf9hbDEt66BzZTQFssE8XX/Mt+sg
X-Google-Smtp-Source: AGHT+IFJ8Kx/APKjEY2akHY9UEwVqJx5Yk5K0Is7GrRpeWUBuPmnbC0N3jdlyzrLaN+NBvohTNedbA==
X-Received: by 2002:a17:90b:28c8:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2f28fd73e92mr6735419a91.19.1734137601489;
        Fri, 13 Dec 2024 16:53:21 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:ae86:44a5:253c:f9bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm3788270a91.41.2024.12.13.16.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 16:53:20 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Roxana Bradescu <roxabee@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	bjorn.andersson@oss.qualcomm.com,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: errata: Add QCOM_KRYO_3XX_GOLD to the spectre_bhb_firmware_mitigated_list
Date: Fri, 13 Dec 2024 16:52:07 -0800
Message-ID: <20241213165201.v2.6.Ic6fdf0e43851269d10596da7e6ceae959431f9fa@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241214005248.198803-1-dianders@chromium.org>
References: <20241214005248.198803-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_165322_032868_C51BA4FE 
X-CRM114-Status: GOOD (  12.99  )
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
ARM Cortex A75 in them. Since A75 needs Spectre mitigation via
firmware then the Kyro 300-series Gold cores also should need Spectre
mitigation via firmware.

Unless devices with a Kryo 3XX gold core have a firmware that provides
ARM_SMCCC_ARCH_WORKAROUND_3 (which seems unlikely at the time this
patch is posted), this will make devices with these cores report that
they are vulnerable to Spectre BHB with no mitigation in place. This
patch will also cause them not to do a WARN splat at boot about an
unknown CPU ID and to stop trying to do a "loop" mitigation for these
cores which is (presumably) not reliable for them.

Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't really have any good way to test this patch but it seems
likely it's needed.

NOTE: presumably this patch won't actually do much on its own because
(I believe) it requires a firmware update (one adding
ARM_SMCCC_ARCH_WORKAROUND_3) to go with it.

Changes in v2:
- Rebased / reworded QCOM_KRYO_3XX_GOLD patch

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 3b179a1bf815..f8e0d87d9e2d 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -845,6 +845,7 @@ static const struct midr_range spectre_bhb_firmware_mitigated_list[] = {
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
 	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_GOLD),
+	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_GOLD),
 	{},
 };
 
-- 
2.47.1.613.gc27f4b7a9f-goog


