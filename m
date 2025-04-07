Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4249DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 11:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lf8+vIzUcQqtKLZgTtvxYBmzYrBDNAglzFOwESNjG6Y=; b=LGeLCfqCB3tGR8hxjVYbfDeSTI
	UCLj4duRcqbHC/S7x7Xq61nZNdCyCm3Z+BUcpBdz33y/h9pYEZMCDdRqCgLnpKxFbrA963wQ+I0p7
	HzRPTbYOnbgB/LelAmNlcNMfO+1qoPOwDD5JDzxIiSviEekqAmYVcLz3JYxlTs8ctNcaN8PMP6zZk
	dKrb2RkvnHZVJN43g3p/j32U3B5+e9llJJ+xLN/Ryq0BsV0o4nzneMlztLAAcXoNLZnl4cldhtTNr
	see1LOzeMXeeuxl0wjS/2aXkPJ/Qmc45M0aPQ9c7GZy2vBLNkWlzdBtNo6JmuqwAHKNxViRUKejdA
	sSpZYIhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kif-000000000jV-1hEN;
	Mon, 07 Apr 2025 11:32:49 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kfd-0000000Haca-1jCo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 11:29:42 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-736a7e126c7so3685831b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 04:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744025380; x=1744630180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lf8+vIzUcQqtKLZgTtvxYBmzYrBDNAglzFOwESNjG6Y=;
        b=Hh9qBUC/Nv5ObUcz9mehOCuM+pxNuPu7SA9hcVRIgGJdAQT9isIWu2RxSMGKWI2kje
         PEA+gtez38ifRpu9YEB9N2kmBqqIImcEozPsIV3FJs1wllHMNIIgALLBACie2TCcU6lT
         9wImyiP1RuYo0Tb0TqVLHsTyDmHCdWZDB8Q6KMS1t3Gi/JP3MB3XW129oTl+6VRCkgUU
         5eM2H3fYIBw782J2i6BHETsDDoPjvA6cqXJVn/3nru7eWOr0P1yJDNzs12MdoEXAT16q
         pfTgNdpPVxTFnreDYyfTB6xZGk/PBucGCoqWGHKAM4zIpDiodc8Z8s0uWqpkiB9IpGKc
         +P2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025380; x=1744630180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lf8+vIzUcQqtKLZgTtvxYBmzYrBDNAglzFOwESNjG6Y=;
        b=EwBndITsdzzw9HWOBay4X9u5LVXN+cHJNHSKLG/tBcChY9pL/CadPrzgTXoQr+bIIH
         brPpuilhOHc6WUSA+lQ8bpw9p2Plu3WVCQQw4zIAkvwD0utZrDLqxJd/Inm+GtoyDvvR
         iy2p8h1qWXCs//Dkr+nSoxdBnAd2bymDplwKUSh9OrUbkEswS3Db+KX8VXWKQYfK5Kdf
         NXanT2qTbjo7/eJLWk74OHIIepKGGv1iZd98tmo5cyq6iKFiIrZ1b2sjxnldWTMGPELD
         GlghRKdCxbZ1t4PgjFp46jDpumIUBvBes7zwsiromLkMFaGCsV34u10DAlVeIzrOCv3X
         8Tww==
X-Forwarded-Encrypted: i=1; AJvYcCXY5sBTETWXJcTvzGjt4Jaa688i9Dmhyl7qAsxyBwWL4h+X7QupkKIKln80BiqpIs/XVOo6cLL4avRVYx09wRTi@lists.infradead.org
X-Gm-Message-State: AOJu0YwMAW5pG5Eh52qeOR08QLrJ0YZkoZuEiL+gMDRMnwn0878tOS1N
	TOjP8eNS5Ecs5HZBPwKynP2racbanIy2i1fat6QyjYTmTpH4N0nP
X-Gm-Gg: ASbGncuAxQtZQjeh1HICIVa+hYHnT6UuurwxSzWjGY3ZQfecIgPXIB8GQxu2UIaLocy
	y5GK0682oROcjZAhLmWXR+JD9tbn6j9rweSXfeKbDvGDht0rRSIU/MKxh8Iuhbt7bVdmnU1Rgj6
	mdeWTxvHZEF/YFor2+kt9WgpFsnyD9a+xgTSUN1Dn3E9qkMqsZ8cVLGdkHsuPjE0feQBRdJUHYj
	88dKXfcXWMAjoG0ciw1ae18CJYQoR8mAs/izneCuIqRPGpVqnmGPYn49PnH/WjUZ9HvPP5Jh4Cf
	etGA6TpHyqL0BplpIpgITDmV1xBn9EXmTwrdnZ5ihFUsJ2BpJ5T4jA==
X-Google-Smtp-Source: AGHT+IEslLNpb0YOIy1A/qjmVIdbvXfSixkGkpSL6RFXFfKsMNi/OQA55y6POTyk+LQwAlUKNy7sjQ==
X-Received: by 2002:a05:6a21:e8d:b0:1f5:8479:dfe2 with SMTP id adf61e73a8af0-20104591150mr18811048637.6.1744025380049;
        Mon, 07 Apr 2025 04:29:40 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([43.134.231.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b9608sm8258637b3a.154.2025.04.07.04.29.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 04:29:39 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: xavier_qy@163.com
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	catalin.marinas@arm.com,
	ioworker0@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	will@kernel.org
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
Date: Mon,  7 Apr 2025 19:29:22 +0800
Message-ID: <20250407112922.17766-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407092243.2207837-1-xavier_qy@163.com>
References: <20250407092243.2207837-1-xavier_qy@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_042941_446365_47A090C3 
X-CRM114-Status: UNSURE (   8.44  )
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

Thanks for the patch. Would the following change be better?

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 55107d27d3f8..64eb3b2fbf06 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -174,6 +174,9 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 
 		if (pte_young(pte))
 			orig_pte = pte_mkyoung(orig_pte);
+
+		if (pte_young(orig_pte) && pte_dirty(orig_pte))
+			break;
 	}
 
 	return orig_pte;
-- 

We can check the orig_pte flags directly instead of using extra boolean
variables, which gives us an early-exit when both dirty and young flags
are set.

Also, is this optimization really needed for the common case?

Thanks,
Lance

