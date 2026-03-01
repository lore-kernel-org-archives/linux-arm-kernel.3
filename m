Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EFAFD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 00:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kGZfZhTxe9Q6TRYWbROKnqed3Z0iAUkdOsKvCa9c/o=; b=ajaGV5DerWrCsX9i+WXYA8AyCh
	foHTV1VbcdcIYIFnPl0IIK5BALneG2AiNbXgJvr+ftg1T1lSjb9vGXqydsW63V1hKvu0PlqkZW5Gc
	py0vLYpOEFWdW66HvDpuQayi5YG0zOx6Uxftr7YmFUAmiXI081H0q58JuZpnX3YerttKHfspXWTtB
	HHgIofzd9URsfWFQ9OcNi5ASVXj0+fiXPuEvEQPi/zisyLjgw6w745ugcY/AAu3sv8RIAskU1hE/a
	A/zwOCKXlrqWcMDMD5toTah1Dc8AQgsG6DUE6ehpYivlome8k0VMZOLF6iRUhNFgRp2k1rYoKAcSt
	OTDzWjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUlJ-0000000APi0-1HTn;
	Sun, 01 Mar 2026 00:34:21 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUl9-0000000APeh-3t7E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 00:34:12 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-899ee491af3so3692456d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 16:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772325250; x=1772930050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kGZfZhTxe9Q6TRYWbROKnqed3Z0iAUkdOsKvCa9c/o=;
        b=hFWxjjVhjg/g4UIEO0mSPZQXrQCKKhmdqHTN1vcOmoMeQI0NPVoXk/SgTbRPSKp2A8
         W2CUJ9+wh3foGOTm8pANnn1Ung2zurXId/k7TfnH+NIAU9UtPpS9mWAXZUexK0Uku/Ey
         2IBvgavqUqqJSVaDm8DGbv37EuBwmlvWrlICxErTvo/mdb85JU+XgD8KX51stuEuO/88
         bulktfhZlefL6LQHLMSH4BlY8P2cG2vcYXvPzBvB0Kh8MxAxbIQs90cJ7gVCnEkpPEM/
         db33dNA1PFYh8hLzIyg7vCoqABDKwpRCAhdIE+K+2ELuBQRbnDsDEpWB3wqJPTQhWcYh
         MDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772325250; x=1772930050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1kGZfZhTxe9Q6TRYWbROKnqed3Z0iAUkdOsKvCa9c/o=;
        b=fMZ4e/VIhEN+RnIgMr6As8x3r/Ar8eCX3+OxfpzPpbMrzKMa66fSbxVXmm3jSmhtUN
         FszGRwqSnyQySSrtQjW/hLaZgjoB5PkYbgugOrvvw5OcpWvEOSy31pKWZA6KylJzvgmf
         IHIuUdIIMAuMxpvjEfIsn1kLQ4pCjoxXHvEK7s6FUUKADzRSjuv5Zu0hsdsG9fo3Bnox
         b0V/WM7D0D99PB23KvWnlHbcjcvbc2AhxP2uGIPUwknd4FxhPRsRDMoHW40K4nPeDOcK
         E1TQo33JNRXTFsHO5LYH33yh1/GJAzi1H3JZ8g8SmqzECe9VbtadJ2gLxx0z7UkYiNGN
         krsg==
X-Gm-Message-State: AOJu0Yy9ojNe2OLMhvXXkCsNgFQnp2LtwO1pkAd6/iQR3+nUaaWv0jPl
	lo9/PNIOTl5s3HZoMUEKvGZElHXwKyOu8QurFpUdkTEpxzE7cFx6dvtaFAykWm36Aek=
X-Gm-Gg: ATEYQzwyRYv/j3FJ/p6yF5bd/DB1h2H30XVSRS6TczaCy6bYf0o9pY8KECKhmvuZjah
	mzcR8vfHE7grVAmkFgI6vCqHI+l1foE8plYVzigiFpf7gaZtisLcnUOF6AIqglbC5fvDAYZdKi4
	/vEpCjjc/GsA6niqcj2yloIsgETjURtUci91Lea09oZKVEacyA8gt3ASXB09lOVjm38JIuVIBsd
	gWFNn22ofIWNp6Blk+JXc3ydb8CLDuoKPUbwXSZD0dqrSIa1HFJHqnD3eEu+g7uQJR4JxkYrqQ0
	OFniYmjAt+IbghRXqKRB38foD2/xpZ5JcpVYWzEXj0Ku4i3MH8XnkxNmpOIRLjA2jkNJQTMNKAG
	PY9CfvD60cgwgnskRw8m4DzYHIkYgyMQsoWXcc/Brk87osQrXISTTIpPKffyhtDBcFMyik5Lc6f
	17l8+lOuJBKZnTXsXWlJtXareqZIy0UkDW9R1x0QBzVY+Xhl+N/9PcZC3tUzCs/auXDWHv2+lJT
	De8
X-Received: by 2002:ac8:7e85:0:b0:502:9e4c:266b with SMTP id d75a77b69052e-50752999d75mr98491231cf.42.1772325250518;
        Sat, 28 Feb 2026 16:34:10 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630a0sm73258381cf.6.2026.02.28.16.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:34:09 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 3/4] arm64: kernel: Move const after static in get_kaslr_seed
Date: Sun,  1 Mar 2026 00:34:06 +0000
Message-ID: <20260301003407.2493781-3-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301003407.2493781-1-objecting@objecting.org>
References: <20260301003407.2493781-1-objecting@objecting.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_163411_965329_26D3566E 
X-CRM114-Status: GOOD (  11.49  )
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

Signed-off-by: Josh Law <objecting@objecting.org>
---
 arch/arm64/kernel/pi/kaslr_early.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/pi/kaslr_early.c b/arch/arm64/kernel/pi/kaslr_early.c
index e0e018046a46..b1fb950f1564 100644
--- a/arch/arm64/kernel/pi/kaslr_early.c
+++ b/arch/arm64/kernel/pi/kaslr_early.c
@@ -20,7 +20,7 @@
 
 static u64 __init get_kaslr_seed(void *fdt, int node)
 {
-	static char const seed_str[] __initconst = "kaslr-seed";
+	static const char seed_str[] __initconst = "kaslr-seed";
 	fdt64_t *prop;
 	u64 ret;
 	int len;
-- 
2.43.0


