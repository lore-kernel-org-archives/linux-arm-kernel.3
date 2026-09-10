Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241A9C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/8/TOOcn/OrLcEta3oRoXI4aSxCPcOxTej8Jv73n5yU=; b=zsTXDhVZlrUd3u
	KopDfaPabvynDidhZ8pmzjMG8qIpkR9VMp6Qrs9TIMAgzWEmxlJbzUymtEOcmYDggCldXW0onH79k
	kuIM+ZKFyrxvCZ2lxCVP7LGZvbkvqdO9mKFI44KSNBMLFB2RMOWmUdGGblNITQTkin0/iZ1R70QAP
	ZvTYlQBYhfAVbLUGIePsG7bn+L7KMX0KJDHUGGhTG7GK5h9pllAoO6jMGlPbGbYNJubgg+pxBHIfW
	yo2TpwKI1MmKQObIpSiJnm9Z5OS7t0XQKiYCx/B2w6OL/44i4Di0gC6+pDU73dVGIygg51nhfWz9W
	duVlkIJx+pGBXTD2b7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k2M-0000000FE8b-0u9W;
	Thu, 10 Sep 2026 19:02:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k2L-0000000FE8C-0AlA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 19:02:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A7A06025B;
	Thu, 10 Sep 2026 19:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CC81F000FF;
	Thu, 10 Sep 2026 19:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789066936;
	bh=/8/TOOcn/OrLcEta3oRoXI4aSxCPcOxTej8Jv73n5yU=;
	h=From:Subject:Date:To:Cc;
	b=Gfye9/aBnkbD876mdEkDiulxNHx6Daf7wS+hOjANOwxmj9WNFt4vu2XaSi2aojD54
	 PqYvKoKEEAGG9HExEA6L5i44t9IcRMF6kKXHJRdkZv5ZoN8ZAdtXwmjApcZCUjVmrL
	 KJeMo0/ca5o26XelTyNY2SJqs/aDynEsr6mla5xPXG1ryfMkrEaEh6EqbyX44wJ4J/
	 8RWaI0Ca9JaOCVOymi3aN3G1hJdeq10l+sBD4VV1SsU48Cn5QMl0rbMKsJtwzkvgzL
	 5KOMQYyg4URcfvEDlLU7GKIU95uJYhmdtNeH1uJDfqZSw7sEa0/x4Pf9nZPOuHysNt
	 L0IG4uYCatPsg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented
 by locking
Date: Thu, 10 Sep 2026 20:00:39 +0100
Message-Id: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFf+omoC/yXMyw6CQAxG4VchXdukTGSCvopxgfUHq3JJRwkJ4
 d0ddfktzlkpwQ2JjsVKjtmSjUNGuStIb83Qge2aTUFClEMp3Hgf99xp4ueoD8YE71miom5rVKE
 SyunkaG35bU/nv9P7coe+vi/atg92KQHfeAAAAA==
X-Change-ID: 20260910-arm64-gcs-lock-eperm-06ce8f8e5250
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Bill Roberts <bill.roberts@foss.arm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ye4CpVQ11ZTQlz6g8VpQaYG4yMytn/wtKX3AqtEfxjo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqov6yMpHf5qCjrBZaJV/TSwFp4pI3AAnv1URoK
 EDyXcA6oXGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqL+sgAKCRAk1otyXVSH
 0J38B/9LISVRgNhwK4yk5uSHglgVIVlJb7yqwb6LY5lAmHqoZpoLgx53ixpoqMom2NZNev+YLUD
 syBh9T3jd5rfZG5LpOPRz+FM3Nob4t7CHS3ISHIE3YiCTUP5TyN3Xr/TVNQuoaWaTkcE9jmhsap
 0HbjwwbGMYQMDo5c91U5FJW55bHbfS1pRu/YwjI3vrsRj3vMQsmI08xgL8SIHUEBKdclgkQBaG4
 TEtQERGAtS8MVrC82K4y7oKphROXxMIOUAiT8kAkqnKvWtVo39Zcj1FL/7/ObHaHuGAIrLDw3wt
 /PSpi6NYQM5TALh31uDQOUY0qwtUlmg/X2ndSY67CdHab1k8
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

When we refuse to change the GCS configuraiton due to locking we
currently return -EBUSY which is an odd choice.  The only userspace I
found that relies on this value at present is the kselftest and other
architectures are using the more obvious -EPERM here let's switch.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      arm64: gcs: Return -EPERM not -EBUSY for prctl() locking failures
      kselftest/arm64: Check for -EPERM not -EBUSY in the locking test

 arch/arm64/include/asm/gcs.h                    | 2 +-
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260910-arm64-gcs-lock-eperm-06ce8f8e5250

Best regards,
--  
Mark Brown <broonie@kernel.org>


