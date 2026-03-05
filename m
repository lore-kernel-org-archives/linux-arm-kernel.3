Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AD4F47CB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 18:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E8X4J3YnGtFMlKI1flQlOPu7lYUst5o9wwkZ0vaHFP0=; b=2PVDpaPX/fZEVFa35vXaBjDxzs
	pqHfxKyH2P4FCr2lMV5HEb0vPV35ImFh5HOl7v6BvL4dUEuH85iUN369tk0cb4UH3IVTdzvFRqpiL
	aP7juW/Pist7zL3zMYEBBoJBzjkNAURYzgwH8SQsP4EIMLjya4PojG0DbsTifFwP09KUbELpePmyu
	n4gZtZD5rpYY1DgouOEmQr+498MrbSXVjDIAfLW+4hb7JtywG+DlsHaFRagcSP4ByhZvpNWv+t7ts
	iFrN4L2lAoDayH2fXR/thnGb+f7Mfkcq1F0WJF7WCFIE3afdXzPZjbcYte9JAgaCQ0K84PsmqhQWV
	9JPWxfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDV3-00000002O8k-48pA;
	Thu, 05 Mar 2026 18:32:42 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDV0-00000002O86-4Bv4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 18:32:40 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8299c75f730so124278b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 10:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772735557; x=1773340357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E8X4J3YnGtFMlKI1flQlOPu7lYUst5o9wwkZ0vaHFP0=;
        b=gJY9ee0lymZ5ucXwMjVaVkhgPK5J1CBFUN6+1TD4eXzyt29HUz6AHvyjbiSSVwJWle
         5I/YgwEtdI41gDPgTyh0YOLllSlh9I3FYGSmCwVu2ZIH6Vtq0+IhTbL1sheiaFBWHdvP
         Hw+8nYN08KQjf2iyRwW25CtIkaERBgIhQrmd2F7xJD0IMTGCFncW4sWxM5RutZwZablw
         HZxJmABL2z8CFO7tiqyfNv5cg1GjGdhXCFFdpQNhIa5BSbP84a8e8un4P1jJzjV44MNE
         1geXciFiZ3W6vv4AlvV0JX4ecqZS/ZGw2G+UDGjs1NgIWonzD0WqVh17zlCxG6ZZybQi
         /ayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772735557; x=1773340357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8X4J3YnGtFMlKI1flQlOPu7lYUst5o9wwkZ0vaHFP0=;
        b=e8cy6Y5k5o6UCbnG5unEZt4BuqvWGZr9OxpwhEbo6942/3d1p9+D2yf2+fs2C4EOdg
         aN8ytiYjlNqNfyLIbFuLzksQ6DfClicmV2g+jBHINUgtRH/w3D1+1ge0uSwx5IW+9XJA
         9SvEjqrj9OzfyN1qhoTmMsglzmiw8mobA0Gp62snKu52KpQg1YHZK5Wx59hjqy+rVwwW
         7LVUkBTxe9/ADfW5iy0zdcv4PENMux66Bu56R2LhS6unwFDaLdjqS7dQbvgTLXTO0sOQ
         /OlfkzfcqcmNr018hzgT1/Vo5TlJDMRtcy8IEXxxv89EADyAhSK7mK8WrdqGj6ec6V4m
         mdSg==
X-Forwarded-Encrypted: i=1; AJvYcCW8IgeERtND5+3H35ip10uqaUES6QDUugm34NCcjlh8+fWx+/OBoExrHagkqmRlIILIlRFmv8H8DPPvZMn7xCZ+@lists.infradead.org
X-Gm-Message-State: AOJu0YyUYFpSgLEnf9bjlzd30RgZrO+twpQSMPSARXODE57naoG5mTHv
	4toJPeoXtNwEYvJfX/AZYC4OktQKGo1IUiIJH91PPq7UgGMzyjWgWeeV
X-Gm-Gg: ATEYQzxYeBZBue11Gm2U9Jh2ipLYJiRtebJ2pUjz/WzfCfEnsVDeMdj+X4/0G4y5Sn3
	X3gXhtZXxKa84YREtc1DcHtot+EJHpZ36U/q9sy1WG8r2/gdPVyUj8ZS6t7Gum95t1x+ENMxPPW
	B+Vucl2KwQ8JNL1qjPG0d7C5RSwJXBmAAJoUk1b2Ek9Ica+eppICU2vlG9sVQwWtWNd58wDvmKv
	j/HVpZcAwAdfnS2YF1f//JIaKjr4Bd5nDd4rfkkw9ohvci/s0qro//BaQkkx7My3oHqYaO/V7hU
	c6DnQPyEj/qbab6s5RRVI+V7qMbGT2W6Kwe074kBhlXkUPFnibQ9Sh9MGhKYWLrvUIBj+hSpq2I
	duHGwoL1UPvzLXizEwoNWzSphMVX4g5DycIXaLy30hdC5czVoM9c9ea3T04uiIOyFyfddICrRPx
	EHCtfPv1TUilhI/uvJaM6fynx/caBk7A==
X-Received: by 2002:a05:6a00:1c96:b0:81c:717b:9d31 with SMTP id d2e1a72fcca58-829855ddd18mr2791886b3a.2.1772735557298;
        Thu, 05 Mar 2026 10:32:37 -0800 (PST)
Received: from arm-server.. ([2001:288:7001:2724:1a31:bfff:fe58:b622])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829898e1417sm2554420b3a.62.2026.03.05.10.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:32:36 -0800 (PST)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	yphbchou0911@gmail.com
Subject: [PATCH 0/1] crypto: arm64/aes-neonbs - Move key expansion off the stack
Date: Fri,  6 Mar 2026 02:32:23 +0800
Message-ID: <20260305183229.150599-1-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_103239_055367_1832F4E0 
X-CRM114-Status: UNSURE (   7.20  )
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

aesbs_setkey() and aesbs_cbc_ctr_setkey() trigger -Wframe-larger-than=
warnings because struct crypto_aes_ctx is allocated on the stack,
pushing the frame size to ~1040 bytes and exceeding the 1024-byte limit.

arch/arm64/crypto/aes-neonbs-glue.c: In function ‘aesbs_setkey’:
arch/arm64/crypto/aes-neonbs-glue.c:92:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
   92 | }
      | ^
arch/arm64/crypto/aes-neonbs-glue.c: In function ‘aesbs_cbc_ctr_setkey’:
arch/arm64/crypto/aes-neonbs-glue.c:152:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
  152 | }
      | ^

Tested on arm64. Confirmed the -Wframe-larger-than= warning is resolved.

Thanks,
Cheng-Yang

---

Cheng-Yang Chou (1):
  crypto: arm64/aes-neonbs - Move key expansion off the stack

 arch/arm64/crypto/aes-neonbs-glue.c | 39 ++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 14 deletions(-)

-- 
2.48.1


