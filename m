Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB418E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev4g8LO+jsu6za6TCZISAQbXcC0h2bQ18wxFdEcBjYE=; b=TEGdfBQF3/3JhpP4CTKx7e4WrQ
	Wn5fAwKgbg40++tAYulQvAw+4U3TISivUF5B0NrMSoaxW/H5vAZIx6cGFfZxquzNpFU2NKsIwLO36
	apdwkkBWswW+fkIUyz3S/9tySpmO4kt8/5I0stR6Fn02bPdyAEF4rn/B45w+EhO2BNK7NWob6Snol
	RV9xalJQpneBvwskGJCAsqBqIIp7LsO/PxoIsFOasBM5fvyN7CPCD24WwtJS5gu2J8dP/u5ukr5R0
	uz3p11je+CLp/Y69v6bahjBXQwVGXDuEWESxOj+S8Wg5VoZhDxq/stZe70sVSN9ovV3qO9XsrW9lO
	Tx25CSyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhuB-00000008nYZ-2X75;
	Mon, 09 Dec 2024 17:50:47 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhp8-00000008m7j-1mPT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:45:35 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-725ee27e905so1346731b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 09:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766334; x=1734371134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ev4g8LO+jsu6za6TCZISAQbXcC0h2bQ18wxFdEcBjYE=;
        b=kQ8kIBTXJoyeRC+JBZBG6SJ23AV4120hmMPbBoNIIGz1P9tiOcNeWtESI52wS1R+6g
         c+XpA7eHM+qjR+ZLtc7eybR+4WoAqMJAItxkRwQ1IRrKCCS7XQpJZr/gF8mkDamrwRRB
         vIWdhWvU5Km4r0xk+PHEMJj0SBKS431hYNihY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766334; x=1734371134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ev4g8LO+jsu6za6TCZISAQbXcC0h2bQ18wxFdEcBjYE=;
        b=imFpzGN0lKzOhSKeu41JiE+savtzylh0xkCno7pzBoiggH+ZEclQMqj/SqPZy1LrRz
         lDh+xYl4iUyxC5FbGUkK2bMU3Uz39fltfs0+2LaxE0F1EwFS8sRQzRTsOAhmR4ZOMp7m
         mKMLbLXFA+UkJxOJLHOgVEiIyDyquwH47XTM50iBF5RJNx+296feaD5+zBqw8Te28GIv
         Ap50tpy7meAfwUGxonixw8YG7a1BU66RpC1z7wEeLscFqr/4cQqxwrhdKv7CREdoUvLF
         yGoWqGEN94CT/WkKFWQrJPVVBaSncwF8Kl6eEdQ3tp3MKvBvBzYnr7gdYxVb6MLWBm92
         4lgA==
X-Forwarded-Encrypted: i=1; AJvYcCUqLTKDJLxxtO4imggEcoS8kbvk1J5obkeUzJ8fEXzRZhUja3AwG2+7J9FgblbeLQtW+deUi1OWewsm8rmDQwIE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8NOFQMCm7eqbTNGbMyMoBtF3vAXNkcFWkTu389KuVXpmnFvYS
	5Q6/sFHSG9VGppjs7GfiRnSXhbk6PwJXZ6bFyoVLKT9ULfDg8Z9/T35CzAO0vA==
X-Gm-Gg: ASbGncu2+tazFnDmGokUEaonUPNlHd0xSWU7oDUDxAu4B0ZHS10YP3Qsy4/E1YLA9DK
	qfYft1+1l5zjw8qd4JiAeCIFLCPIgg4W/Ya3SycidbnT49GDOvQhPVrIQFA0Y7ggL9jwlAGEn2p
	5uGJmJnugbsKfFzvR62Z2eUK/Mzx9cWW1v48iuGpu5Utcw/dogddJ5HMq3JwRKpa74CuMDnkByN
	gtWyPd9wqLkvjotKIDh1Y0OlQ/EThGtZEQV2XNcPJXfKBX2x2dWvFtbY6BWgBf8+6UEgg==
X-Google-Smtp-Source: AGHT+IEnZSRvcamRsFqfzU4vT8XoxmVAFMYsZp4K0Vnxwtmo9CBfsTPWh3l3tzKCmptOqc3Lav+yqg==
X-Received: by 2002:a05:6a21:3290:b0:1e1:a885:3e21 with SMTP id adf61e73a8af0-1e1a8853f19mr7243347637.7.1733766333900;
        Mon, 09 Dec 2024 09:45:33 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:33 -0800 (PST)
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
Subject: [PATCH 4/6] arm64: errata: Add QCOM_KRYO_3XX_GOLD to the spectre_bhb_firmware_mitigated_list
Date: Mon,  9 Dec 2024 09:43:14 -0800
Message-ID: <20241209094310.4.Ic6fdf0e43851269d10596da7e6ceae959431f9fa@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241209174430.2904353-1-dianders@chromium.org>
References: <20241209174430.2904353-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_094534_458113_68264BA1 
X-CRM114-Status: GOOD (  12.28  )
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

Qualcomm Kryo 300-series Gold cores appear to have a derivative of an
ARM Cortex A75 in them. Since A75 needs Spectre mitigation then the
Kyro 300-series Gold cores also should need Spectre mitigation.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I have no idea if this is actually needed and this patch is purely
speculative. Given that A75 needs some sort of Spectre mitigation it
seem hard to believe that the Qualcomm Kryo 300-series Gold cores
wouldn't need it.

NOTE: presumably this patch won't actually do much on its own because
(I believe) it requires a firmware update to go with it.

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 0437be7c83bc..b1881964e304 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -926,6 +926,7 @@ static bool is_spectre_bhb_fw_affected(int scope)
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
 		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_GOLD),
+		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_GOLD),
 		{},
 	};
 	bool cpu_in_list = is_midr_in_range_list(read_cpuid_id(),
-- 
2.47.0.338.g60cca15819-goog


