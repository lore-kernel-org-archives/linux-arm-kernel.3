Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B14C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHQnBwBJbkwimUtYndf1g3bAYV0/uHZCDGGQQ3eb7y4=; b=TeHGJGJoLhEB3ZdOxiXIEDzj9y
	ODZvL2aALo9D8XoYwzIF1B3K1TR1yDV+XSpVppdssq0PCgZ4G0KoHi6ZOiT0NacTB+YcDAJgwNva0
	Z36C4birt9sZVYZVgO0oMszQZBXt9z82phopZ68zc1wm8XnqViwBSJMSXIaqwubDnRVRUBqZcJ/EB
	OVZLx/lWSHJJBuuHggSR+OTjAw8lteiiTETNRlLJkADoscLsug+doieo8N4azL3rD6/7d67MwwWr2
	9UtNwfqzGbFZSZO91SRaWfQ0uwvMqgorm1KC8UDgH1HqAaSyE+X8jXW6Y7WszFJAlM05qQX9MVrkW
	0zYOtAdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3iM-0000000C23P-1j3B;
	Wed, 15 Jan 2025 13:45:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3fu-0000000C1Rp-47CK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:43:16 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385e27c75f4so4750395f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 05:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948593; x=1737553393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHQnBwBJbkwimUtYndf1g3bAYV0/uHZCDGGQQ3eb7y4=;
        b=yMeB5byGLbgamPVVXe44loT9BcHXAgAR2utKfpMvZ1UqrMqzGDzPd4A5Z50KZ9sbfp
         Zs/g0I17eoYXE1mn1A1r+7spj1VI2sMfHb5bRiBrchQCwhDUKrYZD+6cLg2N4XkGohqZ
         X67UqSZSfCOrZB4A+JGlQUGPb0n8IwvdMdl5EKYRoPqhGbBK+zhTqvD+Jh2ysffmI8IO
         4MRg5ddTfP/L/zTbFavzYPsC4iqA2x6/9wlv74iwBTOFrKnWg9RcoNJ3LU1e9Q0Uo+IP
         +xtHJBxkoEiu2J0vupWuun9E0p4cySofQJWhFqrcs0oF1J2uASwifqRZXDSG1929KX6n
         oTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948593; x=1737553393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHQnBwBJbkwimUtYndf1g3bAYV0/uHZCDGGQQ3eb7y4=;
        b=WkNwj5IW+EQJj+0hzSp0fuNGAwj7Y5oa9d1FPF+0X5y3etGtbh8bNXxxVX6qAijIN4
         +BxqUs6IQbIe8yDuQVqXVAEZO8Kks1N95rHaVJazx2fLF9iNRu3rtTOJMqStUMbI9obl
         JGSZ4+bK+Q3Ufgpdl40ZvU5hekIPEJZ8HHb8n3D3jBBB84GVQOlEkal8zFVIyUSPEUJL
         uI7SrurER8CDe00gdH0f9cHcjlPisM0prOhvgPeJWrrxDR1ofsN6JlpuYhnyFz7E06ZM
         9p90gMXzH8yA9SHfov+4aNV2i4Q2I36OMANLmPx+lQNfRuJxvnmeo5Uwl7Hm8G9q5tnM
         w4wA==
X-Gm-Message-State: AOJu0YwgxTT4RZ45GbV+O2fzVvxywdyp7xiJ4HRpPN9poTAwwf1frn3u
	zlXbM49oj9zPCByqA9BXVe3xkg76ePLCdq9cbQJ+Q3F4RtqdvKptdxG4cc6Wg566dwvibgK2zBO
	Y
X-Gm-Gg: ASbGncsMIYAJ5Rwl/if40qxs9vdOupeyrWnRZUEUdl9XKdlmw85MSQD1eB49JVSWlqd
	zH/cSiu/zSeNXZSijMzf2O8d9UBJKuaRDhQRkvoTfM/Oe/LScTeQV0mSBIsLMbymBnElcAyxVVH
	sKQOBA0/WrGa6DQrB8Fk/QTyscGnDpNLMSfC/eMaIUNTxvEApeQ1+sDbiwPJv01WFTva/tlBAse
	KsUvv6uU3zlu9bCNwdDgnsfyl+lGIKoUp5PriDwQeMJlnXIkAZE6MU=
X-Google-Smtp-Source: AGHT+IELvQH8xI6YLUV7io4Hx/5pun+Pkd0bitKEs7bHOJMbBEzA59oSrCH6zM8lJ7499KYqlBj85Q==
X-Received: by 2002:a05:6000:18a7:b0:38b:669d:4dcf with SMTP id ffacd0b85a97d-38b669d5245mr12304137f8f.27.1736948593352;
        Wed, 15 Jan 2025 05:43:13 -0800 (PST)
Received: from pop-os.. ([145.224.90.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499bbasm24853825e9.3.2025.01.15.05.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:43:13 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	broonie@kernel.org,
	maz@kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] arm64/sysreg: Fix unbalanced closing block
Date: Wed, 15 Jan 2025 13:42:53 +0000
Message-Id: <20250115134259.1864060-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115134259.1864060-1-james.clark@linaro.org>
References: <20250115134259.1864060-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_054315_014370_CC7BE5EB 
X-CRM114-Status: GOOD (  12.48  )
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

This is a sysreg block so close it with one. This doesn't make a
difference to the output because the script only matches on the
beginning of the word to close blocks which is correct by coincidence
here.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 762ee084b37c..bbe7df69da9c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2074,7 +2074,7 @@ EndEnum
 Res0	4:2
 Field	1	ExTRE
 Field	0	E0TRE
-EndSysregFields
+EndSysreg
 
 Sysreg	SMPRI_EL1	3	0	1	2	4
 Res0	63:4
-- 
2.34.1


