Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6894C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AxOASbJNctMhSYA5GtnhgOb9hrNORKE9UeLES6b/op8=; b=ckczzi7qYjOC5mR/G97Lsq+MH7
	wRie6QMkptomIJbqY7tNSSTcnHySXdvuGOEqdRO8QtO9nuxs3eX3hEE0WxAA8vkOMWq2Bv9aGCrcl
	4HL0QLDCShhQAgiW/B36DVGXyuW765NyrAhzvSwnEJhZfu/JcxFr52Euvu6T97JsF5HToQxt91yEb
	R5VzItFx2mnGIph5D0v/2oAF7sH53rBZPLGv6QKr6boy+j8nSeuw/HmqogpKNE7sC5Ntr0XodMBlw
	d6KVSl0bhv8OK9tXtUTuGK+TX1GnGID/c2Fyk2O2KgdD1XODOr0YFJPMY2LUwnEXRVdiJI8FWviuc
	Lcsi/OtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2T5b-000000022Xh-0umu;
	Fri, 04 Sep 2026 12:32:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2T5Z-000000022X3-1Lzd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:32:14 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2d8fd3b729dso8065525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525132; x=1789129932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxOASbJNctMhSYA5GtnhgOb9hrNORKE9UeLES6b/op8=;
        b=dG7fEa3Zw4NCq53L+MpkXd9KjEbDXdeUu4HOZMh9HcsUdzRoKkOJcUvfvZO8b2n52S
         njs6kbBTTGP0Stm3znQ2YTzlLCxc6tGO5YzzYv4sEcuNKQhr9fyunAIVs4KMh0VUZMzJ
         3iq6Z/0LKSoJxL9A1LDyvt3+ZmCpddJKoiTOqqWB5bJwtqnlPSIITxSooN4OGTLzNZa8
         TvY3Qyj1i+uGY446dayCZJur4hyLKWZMrFQA2jiQFQVMCXPyOcbODET12OnVCIs/Cdd2
         u0kpfOsRS3vMp7DQVc4r+EB9Te+s/ypeJBNndvyKxK83RpWe2cbiu3FYe9IntVxQW7jK
         jbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525132; x=1789129932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxOASbJNctMhSYA5GtnhgOb9hrNORKE9UeLES6b/op8=;
        b=kxdBeLX4xdlAhyoq76d4Cv8zFVE+APOfpzzPTyvd96ReWCaDHLCACWU//ExQE5f8fc
         N4z3yQwWJuMCOUNpWgUVwuR7zvNXCcXXpcQFnmuQ7g1CaBjlCH2P6Cug+obmGHQ3nqpo
         Zjb6spD5uB/UchW2Rt3kF1rqU2JQ0IW3BX5E3D34FmrJH0bS8KAcnsOBHVnZgRm8b3BB
         LMbxgRrNiGRJnpcmqD/1gqDuyKZ8Bwz4rS8j17nnAbwAKsb24CTxBxFox49iVa72/8uV
         tF33GaZSvKyjCW3zqzRkhVIZQgOXybeRMFSkfS+nPN5nWEoBtuSEvquVnOdOZocteEvf
         6exg==
X-Forwarded-Encrypted: i=1; AKwUvBynD7fU7pJnAc/RhfpmJrSzN755rIEuJzfS/RTMtTe8XBSBBtUz5g7kn4OCMqRI5A3ouUVYNlzMaOfTtcsbmVAH@lists.infradead.org
X-Gm-Message-State: AFuF++nGzUcPfmPXLk2m/zDVMSFhROef1IMyqG9niYIVxurKqqjLmr5+
	/1IwA0zQF2cuEFIB8xbkpiBJJV0sjsXIQ+3tmy2AhufPB1qvMqRh/WsuHVkxLp83T2M=
X-Gm-Gg: AYBFou3wKXKBJVJMV/I5mRMP2gIWmcd7D8Ih/mvTOndF7br+VAVV5jPe2T01lJ83BQt
	AVCNuazZ3XHWeMI/doZWgZHpm/3veleRFgp99M7pMLgOiB5qLEIY6qi3NKAF5dv1XcdCJ5+YiWU
	v1bTVtOz6foapdLaC3DhPCZNvlx4HLYDFWGJavsM4UK8gmwnDHHiDzqyRq9N6ljq2v1YLsbzAxT
	EPNhNZ73TCLBx2UgbgzUWAIataqGyyn+aAqRGG2Q6c81mcQMKiVQSZik4YJ/lrmyC/m/dTv4LtO
	DSbPUkM+I1iRce1uxOydaUx23t/poaGfMyu1aaBCS75zO1v8V3mYqHWkYMciLbqJuknPJRYdRQz
	ykPgWLxGBn47o/fKStYOXOOG4bjGYKdL6mRGMVjL6usvVkLjQQhuZcbN0rCNzYWTDZMb/Zeiy37
	9P8CTp2AqvknzXHc+AxYTj+tnO1AWTrmFnJqTM3oXvbbrs4P1wyXNa+u6UcYrXw1pUIk5oCl4b8
	QGTpiYXY0lwj5k=
X-Received: by 2002:a17:90b:5705:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39b2617ed3bmr10115258a91.8.1788525132084;
        Fri, 04 Sep 2026 05:32:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm6262420c88.0.2026.09.04.05.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:32:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev
Subject: [PATCH] mfd: fix typo "interupts" in comment
Date: Fri,  4 Sep 2026 18:02:06 +0530
Message-ID: <20260904123207.36203-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_053213_366121_B8FFD3A5 
X-CRM114-Status: GOOD (  12.78  )
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

Correct "interupts" to "interrupts", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mfd/ab8500-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 86fa99022cb3..ceea1ae34dd8 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -125,7 +125,7 @@ static u8 turn_on_stat_set;
 
 /*
  * Map interrupt numbers to the LATCH and MASK register offsets, Interrupt
- * numbers are indexed into this array with (num / 8). The interupts are
+ * numbers are indexed into this array with (num / 8). The interrupts are
  * defined in linux/mfd/ab8500.h
  *
  * This is one off from the register names, i.e. AB8500_IT_MASK1_REG is at
-- 
2.48.1


