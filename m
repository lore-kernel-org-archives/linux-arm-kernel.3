Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B41BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPxl3QSUuHKTV79x7MMAWoOiUWB66qwESu+TwnhAWUM=; b=4vfT7KHCMJ23T9jm7t2tmMPc/l
	LjWpZ6RkEPCnUYYAfA2XpOrxxhXXqWcqy3yM9KX2t1D8Giqz1byNIHRHdfupk+Ri31tfQDJfOmKko
	jK3ndqhmwRHEPSe0uXtqvAiQWWj4bINYd8e5MMPRK7RYZeo9bKuyX8sDmGWZPTjJf0pOrYlzh/1EL
	effnlgMHJnbnp0HNK6PTg5JS5Cj4AJ4prEzADb6+JXeCULL2mIavAxh4ukBslcQpky2fzhfkIvnfi
	f5oCNhXuG/Ahmn+f96qa5dLKGQoRSoyIdzXZ5oSX8RWLJqQTwd4kqTfLV0uJKzdecuyG3KYGTqzZy
	69T/4mwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhwC-00000008nvR-3e52;
	Mon, 09 Dec 2024 17:52:52 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhpC-00000008m9V-3Wev
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:45:39 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2efb17478adso969455a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 09:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766338; x=1734371138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPxl3QSUuHKTV79x7MMAWoOiUWB66qwESu+TwnhAWUM=;
        b=ahaBmOaofPf8bpFE0As+JXwdxrrdQCt9BFEFmDJqVjAXTDWUWeDuQ/Be5+yyUFomLE
         Lm8DVXN1Tyq/tCw95yMs2ASTMAPOudqUYfV4J7f0LeEbTy5MleWjeL4c3w3RUtG72KrH
         TWn5imbS0dPUxxnwzZ8CFzfN3qNwiN6Eo6ZwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766338; x=1734371138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPxl3QSUuHKTV79x7MMAWoOiUWB66qwESu+TwnhAWUM=;
        b=A+SNXTC/E7bFc5CQCVdlGh0smshuQ2AJW+/gYZ2iB6s7ztHbSzdGvGXz6/mSDRBdEn
         JEQJVSmXfwd2LhXUXe73MOFVtfTwt/6iQcTVz0w+3fWeiexi8J6Id1cVkDue3+g8HvJV
         e4WcQD0wO6zXHEdVEEWEjXMY5DqfvTCBmznvhIW0+yr8GAGgDWjDChgcF+iro9jQvDTf
         VS1UMx/HlbVgUVzzlOUKyHpyJsvbUimjb5tqePOhtDtrtA85hmT7ZumYUHuq3WKxq7T5
         v9Vy6n/ci15qrEUW/BbSmB1OFNCKIXgz+aL2TYbV76QND5nLSISlDwi83+92ruAGg14L
         eZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCVaR3XWtszs3wawfrmVhtrbH4eBpdqyyo2iRNY4jT4rx5AsYSrIXJBCb7rnExFyB7b9l7dZ7u9tg5LVkjhe/IFK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3dvGnlwetGB+VFjhAYUY8mDye6zk2DIPO5ku9TcGadO+tetu3
	+GRZSamnF7aiynH3dgw/a1Cg9EYVL3aOKKzQPgeSNT3hhy8osZzS/qU4DgURbw==
X-Gm-Gg: ASbGncvAeYx2c7z9Y05LhHMYWVJLxV4s5tlgLPeGuF4EBWl4eXg3NEREFPnMRoh7QDT
	hOb/L6XszDsLDXJ2rYoXellZSy7C0vxYh3fPFAouwtyvgsRIGNgCToOo74eMbMUoBAjPKkHaCCu
	ihjBBFOw5SWxsK+pOcHAVGLsIwFeMYnriGmQeP7ke6bThC2eqHlOWeZRn2RaXHYGUKRChXekyyn
	82UFERrdqbvTOIAs4D7wPYa+ecv9fqQ3TcUhKeSoXFMwpQqU8ZxX9r1nbMqJ6E5m1a3Sg==
X-Google-Smtp-Source: AGHT+IEQ1TiQkcWM60OYrpKHzb5BVzSSsklo7u5kyWPZtuHxhJvmJhyRRo76EY6ccYMPTPOgDAZo6Q==
X-Received: by 2002:a17:90b:2783:b0:2ee:8430:b847 with SMTP id 98e67ed59e1d1-2efcf137ac6mr2051960a91.6.1733766337960;
        Mon, 09 Dec 2024 09:45:37 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:37 -0800 (PST)
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
Subject: [PATCH 6/6] arm64: errata: Add QCOM_KRYO_6XX_GOLD/PRIME to the spectre_bhb_k32_list
Date: Mon,  9 Dec 2024 09:43:16 -0800
Message-ID: <20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241209174430.2904353-1-dianders@chromium.org>
References: <20241209174430.2904353-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_094538_874402_C3E37E03 
X-CRM114-Status: GOOD (  12.67  )
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

Qualcomm Kryo 600-series Gold cores appear to have a derivative of an
ARM Cortex A78 / ARM Cortex X1 in them. Since these need Spectre
mitigation then the Kyro 600-series Gold/Prime cores also should need
Spectre mitigation.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Yes. I know. This patch DOESN'T COMPILE because
MIDR_QCOM_KRYO_6XX_GOLD and MIDR_QCOM_KRYO_6XX_PRIME are not
defined. Those value needs to come from Qualcomm or from testing on
hardware, which I don't have. Qualcomm needs to chime in to confirm
that this Spectre mitigation is correct anyway, though. I'm including
this patch so it's obvious that I think these cores also need the
mitigation.

 arch/arm64/kernel/proton-pack.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 212481726f04..67aa54017dea 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -860,6 +860,8 @@ u8 spectre_bhb_loop_affected(int scope)
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
+			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
+			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_PRIME),
 			{},
 		};
 		static const struct midr_range spectre_bhb_k24_list[] = {
-- 
2.47.0.338.g60cca15819-goog


