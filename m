Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BA2C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 19:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAMHT2wWkahUBzUJa6rU6nxefkvh71WH2CfBhS9jm8Y=; b=N+RbEeuh7OiMr5NrA1YZWWMg0W
	1ea8ZG8oCQSJ88Dg35aDvSTZ/6vgKqkBCSxPI2seZV2PFDFDbPD8JqnLgbsHp0EN/og9JD8Nyn2Hp
	XdcQfd1gnSe+ad5Qgrg1iPUH1Fy1qur9s2JVoMaKtdf1klnqrZansicT3bQ4hOdTSA115hiRx+RkD
	NdRQRCoTPnsdV19/kcz1I82w8/RgP0oZFrdmZ6sDGm7eu0zQyDuybyMimYFKc7GRwYEWCnjhNIo5B
	2T+enfmbDoRmnSiI7aDtqtgLWrmZmuwvHne1kmV4pf9FlwnUZW7r/VwWBpKDc7+QhNSDn4gFU529k
	EQqykHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k2P-0000000FE9r-2t2Z;
	Thu, 10 Sep 2026 19:02:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k2N-0000000FE92-0RWI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 19:02:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 871346025B;
	Thu, 10 Sep 2026 19:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9441F1F00893;
	Thu, 10 Sep 2026 19:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789066938;
	bh=HAMHT2wWkahUBzUJa6rU6nxefkvh71WH2CfBhS9jm8Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZcwoTfL4RMRjTGO7KA6R28gf0K1P+d/yc56bHe6U/rEzpBo0nqgj72Y/U3rnuBH/q
	 bczcN08K3g0bEu1jpYc7TgP3WmGanSODZncfvZafiugwZtVCoSZ4yQ8M6OG6WDIjra
	 5ZiMu7HoA3ef4UJwx3hs5+AmC3MF3XVS6V1pMOMLvtJC880STJPSNLAjUu0BF4IXlU
	 RkiM7gFsrLWij4d+EQLAhS6pG6KcbnXmpn7YaLMrFeEPu+ZOi3Vbcemp0BjOosrdwQ
	 oLfxvr6xPVrc6RAo4vQ77zHIiYtbcQ1ei3GY9GP4aBGfiQjNggW+gO2EUUOj1CRlcd
	 poOrrjWKgHM3w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 10 Sep 2026 20:00:40 +0100
Subject: [PATCH 1/2] arm64: gcs: Return -EPERM not -EBUSY for prctl()
 locking failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-arm64-gcs-lock-eperm-v1-1-d88e51855c9f@kernel.org>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
In-Reply-To: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Bill Roberts <bill.roberts@foss.arm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vU9yWrJuoA+cpifhPhPxnwazMEUMYCWdCoBAlgROTGM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqov6z4s5CpPxwkjCGNsVndUvdbbURiX0+IaXam
 eyAPjZ0U06JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqL+swAKCRAk1otyXVSH
 0EroB/91yMMzQ0TMon3Pl732xM3Ub/Jjv8bnNG6TIpxZ3EjkSAIt52YZPoks3gxbhX6tATUJpga
 WqPl6o3ZqAlrTV91dfU5nqHvhac+Rm8/+c/KCiN1pe0rfPjqeSJyhmwZw9IOfZMlL3dyVJWniYk
 dBWXzkFkd5ywOPXA/bAHOg46dXPBD1yYmwXs/VLRY6sTbKWpMlFt8OmmTdGzoqE1KapXISGICT1
 ldGnOU3vd/eISwbdgdxsP7gO06CfoIKSLvRU3CYcPKBDiXTN58Bo21K03J+bUmfomE3Vdv2Ydyz
 NNekdVwinLO4LpCgyl14Y5MxzOl2KZK3woM6wTb/JR6RTl4R
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

When we refuse to perform a GCS configuration change due to locking we
currently return -EBUSY which is an odd error code to return.  While the
selftest does currently check for this it is unlikely that we have any
practical users relying on the behaviour at this point so let's change
to return the more descriptive -EPERM instead like other architectures.

Reported-by: Bill Roberts <bill.roberts@foss.arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index 8fa0707069e8..bbc22e382cfe 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -76,7 +76,7 @@ static inline int gcs_check_locked(struct task_struct *task,
 	new_val &= task->thread.gcs_el0_locked;
 
 	if (cur_val != new_val)
-		return -EBUSY;
+		return -EPERM;
 
 	return 0;
 }

-- 
2.47.3


