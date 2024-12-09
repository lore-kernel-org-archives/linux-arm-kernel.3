Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE8DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEHuQ+kXoeUymHTN8eFGc9cWNeb9aYeLC76//Gda7iY=; b=3w8E3020Jbsw2gEAFA00zXuU10
	rI3X3m0+syuwOahnNyNw/bNV5olO16IwyM8Fy45usvhN0LKYRDOLVCl9BoMaccIRRUF+kqVEN844z
	8lj5UKB1vT7E3xUOB1CvDkQqE46D/n7+t4Xlp/5IrIgl1RDTxPsglU3jrKjUPA69jOPqzRgbP4CYl
	0GZLyZEDZs8R/xkpujW6XzzLWk7T/oq1oEfPwswcsTIdOvnDZjlOihpdxJFN8pHldxPicVtlQr4XP
	3VYFb4SKqOavqgCVc16v15PkXNOSCktFfzN+JxQ8yfvrq/BU8tTnFy+j53O64IiqlOkiLgbVF6e5Z
	Ju3mWx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhr8-00000008mfu-2hnm;
	Mon, 09 Dec 2024 17:47:38 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhp1-00000008m3h-3oSQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:45:28 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-725ed193c9eso1101477b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 09:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766327; x=1734371127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEHuQ+kXoeUymHTN8eFGc9cWNeb9aYeLC76//Gda7iY=;
        b=esUkF+sDZJ7vTxlM1+BNOPdEfOzMi0nVuDZpHdrvVHyWBtGSW9l9cCQLH0Z4Za1yew
         6kUZpykMJAVSt9rUiIvdPhJO02SORmovMDJQDdw71fY/sXwBAwXjPiADMxkD9036gql1
         azJ3Oj+pLQ1NmW7XBHK0vRS2fy0amkBL2I7vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766327; x=1734371127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEHuQ+kXoeUymHTN8eFGc9cWNeb9aYeLC76//Gda7iY=;
        b=YaIktBf1g4Jvpeohd+UX99frwKLOpb5B2YENDkyj5cZHLk0lJY5wRX7//4vr0BINUW
         l35btHmqjs/45ehZa/euKqZw0hHj7HQ4eAF77dycdwm0NtuSXp5Go3F55ezdfNTWFj1Y
         AUW3pm+WG0+gfwhahUtLGo+y7rGdgF1XeSnNdXeMyeVDbVuQEGJImCAYqnvSXAkH9hte
         tJbZs3Iv9OGdYaZQxClctQNKVH2mBU1WoiCU5yF0EpIHjg7L3RZMCefT8iCsM98xShQl
         2/C8iiTzUehYuKNetwmTSR3tsQwgznmE+rYwDh14xXpMse9eaH9xyI7qO1pwaCqLVv9n
         ibxw==
X-Forwarded-Encrypted: i=1; AJvYcCWNtEb8S/R7/LwNDMmDZ2xlJfRFGu8c3Ao508cEO1gvaeAI8A4a3bpO71PHHRgIisRrvO0wefnN8nzXOU38nwzi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/FzMXc7oj4kCJ1/8EzfT3g/tK+VLYOFAu4M5jtoiY9XVzCPL1
	Z0uNHli6MeGEIZhxQ7+t5EFzgvoV11kx/mPPdYIY3zFewFqHKKhf4hbnYpJ28w==
X-Gm-Gg: ASbGnctAY8JRHJJWyRiH1+jPvDXOlJmgsyjsT6bhijCnZJ+pZf5YKgyKJA6TpNX6TbY
	PiPvtCeN2hI5Nuueuo7Te9LcGGY4ixhbjVcED87ZXn8fA2fYcdzT5fu3gP4C4dsndRndGCEE+bV
	VDBumDSh5S180F0L/lRbP9uxn4rbxMeGI3hlUTgD3jW9hoEpvkzenxVvl6UppsXy34p4Q7Iu3lD
	jg4qD1ros0enB+1zzYJ4/b7gXiWqfajddFDskPwsXHI4h/p/Qstqm8CrByCMEQYFY4Cj3rGZg==
X-Google-Smtp-Source: AGHT+IFjr+LTfoeQGGEOWgSsIBHfiAjG9a3g370Vtf8TA8xvJXw9gKEbo9AZcL4ypGc2Hiq/SZ2LKg==
X-Received: by 2002:a05:6a21:9999:b0:1e1:a48f:1215 with SMTP id adf61e73a8af0-1e1b1b519b3mr2234419637.35.1733766327345;
        Mon, 09 Dec 2024 09:45:27 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:26 -0800 (PST)
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
Subject: [PATCH 1/6] arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
Date: Mon,  9 Dec 2024 09:43:11 -0800
Message-ID: <20241209094310.1.Ie4ef54abe02e7eb0eee50f830575719bf23bda48@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241209174430.2904353-1-dianders@chromium.org>
References: <20241209174430.2904353-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_094527_945894_14AE5B0A 
X-CRM114-Status: GOOD (  10.65  )
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

Qualcomm Kryo 400-series Gold cores appear to have a derivative of an
ARM Cortex A76 in them. Since A76 needs Spectre mitigation then the
Kyro 400-series Gold cores also should need Spectre mitigation.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
The "k" value here really should come from analysis by Qualcomm, but
until we can get that analysis let's choose the same value as A76: 24.

Ideally someone from Qualcomm can confirm that this mitigation is
needed and confirm / provide the proper "k" value.

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index da53722f95d4..e149efadff20 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -866,6 +866,7 @@ u8 spectre_bhb_loop_affected(int scope)
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
+			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
 			{},
 		};
 		static const struct midr_range spectre_bhb_k11_list[] = {
-- 
2.47.0.338.g60cca15819-goog


