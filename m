Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A804CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 21:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QptTM5Ixuo5m5wnXL/4qGQKCVgxSmjKUYr1TvFp0E1o=; b=ejCi1Dy4vN0lsLtUnX4OvfowEE
	RP7E/WsalIR5xsUTOdUCFtXhjtiG4e/agKkaCGf0Iwyi2uGRGMo0ZP8Ev3X4angf6AJkTBAZ12Ikm
	a/4lo8bGYPGXLLPo5U8tIuEy32qYnQAOVH5soOtti4klpER7bzikay7n0CWVECcP5B5P4UGpc75xO
	tu+AuM9ecfU630c1gLQ0HMzUCLQ1+koEaphw8n/zXGPFgYCEtUPdiDyYZONDmm8kivSYzv+WeehfR
	vE4/ynWiEI5WnUbpULnBhuzZsnSC1wpcm+NEYhBuHpeQNgFG+Nt2q+d6UrIzbPHdjhZKGXLxlXWH5
	lSCEeHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIZK8-000000069jv-14ZY;
	Mon, 10 Nov 2025 21:21:16 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIZK2-000000069iB-1yqW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 21:21:14 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b32a5494dso922818f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 13:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762809669; x=1763414469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QptTM5Ixuo5m5wnXL/4qGQKCVgxSmjKUYr1TvFp0E1o=;
        b=E9nJ3a60MbM287iQz7dlXdk7GEEthnUxXGE3FgvQXT+OSUOekC9Gmy0lShpG4o2o0x
         LgA0U2GekQMQHwME3uIxk2yf5eT9S94sIpgx1k9jfR7V/iq6GNec95bw6CfbbLJqTvwz
         4K8xsbED2vQT56iRsxxx4SdBsXta3jM6rrybnVlwrPmr6Q0EJSrN6WypkqliUJwp9m8i
         GiH+V7/vrSKvCFxjizWS+ettlzoH2SUg6YiEfycjfXnfSoENHhRI3I95+4BQVrVdYWr0
         DL3sF3JV0izlkOOx6J2WZqaTIyJ/mpgyAICj0Pntwv4EdUR0YbO9IZfZctUDDAUvoO9C
         JAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762809669; x=1763414469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QptTM5Ixuo5m5wnXL/4qGQKCVgxSmjKUYr1TvFp0E1o=;
        b=eWCbiHPqDuGwRpcrGMvn3hSWIX/s+G5C7fEmEg4zJA1MDSAutdYvavHmz05I84pu2i
         XVBcFZZDGUr4sKqWvZ0eZN4HpydTsdu1LBHNYdjtEd0P8XBN8X6ZIYjD+BYQpCfzmOPE
         yaRyAo+zY3cf2/AewrAZ15MOY0zoE7vbT+ZE3v1ILIMCBX9Fpeu+rFYD4J5vv4gFIbBn
         JHxcmv9A/U5xEa1Yr9OyTZlMrX03Uto+6dp9/edmAVy5wokYqdS1gTtUr4iajpNtV7Mb
         QIgofsL4RFBaEAmd8f0QRmAQ2emDZB5JnLhvuPmfhgmRK8SWlXFkekWEgr5L1QHr3nDi
         43KA==
X-Gm-Message-State: AOJu0YyXo83L2QEzYpKDDLQqogLvVDcG4k4J8eJ8y7XrNrjWXJFmfP70
	NCNQ8XwcP25LcXAEMiO1fThUQdPuFDITRokWEBs7rpK7t4hxPsdXuYvj
X-Gm-Gg: ASbGncs1e/MmLwI4udlDR5zQMLOYxeIzflMzxqXswJSm+6RQ2LQSYHZwgEmVh3GDCtv
	bYFLnLXAT2fd8tw4GH1oM3pHh5Zo/UGb31VXeWRHTqR/ocQbKtg0JFRZazA4bIEvXqOoJGyWiGH
	YBv/Af4vSpLR5g4+2FmmgHDA+XVrZfgfbxdA58giHYWRbKYkyvU9kvHZl0sqfzG0+JKWhBuaa6I
	8LYvf8KTwg6PEfLQFzqbhPn12xImA0fjehqVhSgm+Z793lYHEudxZvlt7+WInqYr8JuZ3BB9AQr
	kYxXhGLF6tkI5FiCKuQH8xeMqVPBmQO5/PCTrBS3pta1bTdZkXR6Xz4VnIcddGroRGOjHozJn16
	mPH87eWtNrtSYt8EQCOjrNNl7mi5/h4rxTJSm/K9pcrdTmXDdtW2GF4fkBY42ktq3tLIDtgUlH5
	wnriUvLvQaQ++RrAk=
X-Google-Smtp-Source: AGHT+IGyWFKuRgH1C0L9Vdpx7fIlC3uIo42IVd5RZdnUG4U++HXEcz6WAKkrk1gx23ETrpUiaFhneQ==
X-Received: by 2002:a5d:5f85:0:b0:42b:3aca:5a85 with SMTP id ffacd0b85a97d-42b3aca6f93mr4447781f8f.63.1762809668525;
        Mon, 10 Nov 2025 13:21:08 -0800 (PST)
Received: from osama.. ([156.223.120.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63ba87sm25073483f8f.14.2025.11.10.13.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 13:21:08 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	ruanjinjie@huawei.com,
	suzuki.poulose@arm.com,
	ryan.roberts@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] arm64: acpi: add newline to deferred APEI warning
Date: Mon, 10 Nov 2025 23:21:01 +0200
Message-ID: <20251110212102.816724-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_132110_513584_8C895E03 
X-CRM114-Status: GOOD (  11.27  )
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

missing newline in pr_warn_ratelimited in apei_claim_sea

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/arm64/kernel/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 7aca29e1d30b..aab07d179787 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -439,7 +439,7 @@ int apei_claim_sea(struct pt_regs *regs)
 			irq_work_run();
 			__irq_exit();
 		} else {
-			pr_warn_ratelimited("APEI work queued but not completed");
+			pr_warn_ratelimited("APEI work queued but not completed\n");
 			err = -EINPROGRESS;
 		}
 	}
-- 
2.43.0


