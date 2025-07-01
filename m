Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C055C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwP1GAWiDk39SfGOihsNEaC+24qtW3947zs4uYy6dh4=; b=pw5BzFW8BVFSGY7EbdPcA3l26i
	P05A9SvssltymBHNcgk5jKACZvkFCSwQUwlVMEClllMFlK2a3cit9TBz6DwnZ0+Ef9UQkzzzpjpjG
	ggHbqx/8L0gnVT+4iUrm8QWigtkuMEX1jCfCcWHGKyvSpp+4DlYmqJxmoshYhMg3nLQ6kHoXXfdx+
	ljgns9SrOTLrJf72a4174QV061d/ggJjewA1sutayoIhLI2mVhKeI+sFaUwqXSeevFNTIwpekC4Dg
	zDU/Ko5jcJ9gZMEb4r3ZczPDl8NRMyQ9YOulSMxsDg6D5RTv7vzYmC7wDFEfZ5jZimzsbfAgJ/AfQ
	rsU6AVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWflJ-00000006Kkw-2llJ;
	Tue, 01 Jul 2025 18:31:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcyj-00000005tsu-0Wt3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 15:33:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so41227185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751383979; x=1751988779; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwP1GAWiDk39SfGOihsNEaC+24qtW3947zs4uYy6dh4=;
        b=Hu8fEVYaMORXxyqO0wLFeeYIRhyjaMu7PaAQcVh3vl/+E52GGvws4LuAlWKklC3t9N
         L9op3jns0x8+eb9sHoekqhIn2zX89jHdsa92pukWaWoQHDEVEUJXrW6pvIFUjt5OSD1Y
         4ROTXG1kL1lGiOoRz7ArBZzjJZ/eZR3h27kMbT4JKsktQYK6lYZTatnhw5YsV2M87xwM
         v8gBz09eoLjbWHfGLWOcvLthHIeKgizngYqO8Sl4uHVCggBcZeSzigkKmCs9W11NURzz
         g6XWE3PQ1lxjBJ8o0EAY9dXF/bNyaN+TJGAmvjWDQPMHTan+bICC1ZbO8tlzetuc9bGq
         diAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383979; x=1751988779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwP1GAWiDk39SfGOihsNEaC+24qtW3947zs4uYy6dh4=;
        b=LiPOV3yGWGrpUeAV6RMpOzrdK+LeCu1Kr1jvciKYHWMWqcL3aOlC3f2s4TTtxJfuSe
         tTqEvO9ieZkH0SJ9nF8ZwkdApMqo3woiqAi5T+ovmxLZQW8Ovzf7dIEWldYJDEBR7ngh
         7KUc0gyPZhaFw0yrY8PixZGV0jEtQm27hArlr1bu1bytneMm0ZnisjIVx+JUdkdNDYew
         6vbfVE/3ImmPurmGhR4HOvcjrMJ+mHRLZe14cpHnWXCA5+uCDHmDV4S192vDI4iwp4P3
         8mPb+xu6KxR+1g79zbx0VH8a4srL+GW9VpIqCxGbymB751wau4IfXuL5+3fcTuHWPPz+
         3kmQ==
X-Gm-Message-State: AOJu0YxDlLkN+KXLnbCCTkyt2p+s5KF9oZoBXNcvUCxEjpC+kev17V8o
	KE78KGKRqoJAmVGDl44hYWZEEQoM9oG24OyQbHgqO/r4weMu586L3/xPZKtOgejQXgU=
X-Gm-Gg: ASbGnctziMhjDp0zTLmoG6LdQaFqdwaCSV5PNnkX2ykcDUhfJVPsSRAR1ziDeqeBcmv
	vRo0DDCQXn0oNRqdP2wbVAS61BhhEZ2V0mqu4CoXKUso2kGSaJ5sK5JgngViscE+vz6tU0MyNNj
	v5GTZKUrTwdZv2Q968GTlcAdwp4tcAqSEp8KdKg6QS2fUdzvorqQkPEYHvpu7F+51J7R7i+nfQp
	3t6gPRqqWrQtKVD/OVXaWfhuNEHkZOoqEaTCSP7Zoy6OAaTV0CeYO8O/wqLgJ3oaB9ful3CXGHb
	iYlHu/7TDvhFXcm6Y8aFVrLgYbLg495gbAsHx62+oJmjwsuj0QaC6ZadPSzCXyZifgffNCI=
X-Google-Smtp-Source: AGHT+IHBcNPypFwgfB92PgKhi+9On3myyxGnEdMTs6aSK6qgav8gtvbdSNFdxrarSqsinHbJfbzW6A==
X-Received: by 2002:a05:600c:4f02:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-45422f35f0fmr28544995e9.5.1751383979349;
        Tue, 01 Jul 2025 08:32:59 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b5a3sm13435002f8f.40.2025.07.01.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:32:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 01 Jul 2025 16:31:57 +0100
Subject: [PATCH 1/3] perf: arm_spe: Add barrier before enabling profiling
 buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
In-Reply-To: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Alexandru Elisei <Alexandru.Elisei@arm.com>, 
 Anshuman Khandual <Anshuman.Khandual@arm.com>, 
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
 Robin Murphy <Robin.Murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_083301_170586_03912BF1 
X-CRM114-Status: GOOD (  11.09  )
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

DEN0154 states that PMBPTR_EL1 must not be modified while the profiling
buffer is enabled. Ensure that enabling the buffer comes after setting
PMBPTR_EL1 by inserting an isb().

This only applies to guests for now, but in future versions of the
architecture the PE will be allowed to behave in the same way.

Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3efed8839a4e..6235ca7ecd48 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -537,6 +537,7 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
 	limit += (u64)buf->base;
 	base = (u64)buf->base + PERF_IDX2OFF(handle->head, buf);
 	write_sysreg_s(base, SYS_PMBPTR_EL1);
+	isb();
 
 out_write_limit:
 	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);

-- 
2.34.1


