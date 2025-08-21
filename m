Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E141CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mEkJ8k90af9rk1xrJudZfUzbC4RekW3u8QNTq2Nc4tA=; b=EJ8WgxxXDmvVhF
	g6RRVx3IpaozEr+xnTgfXI82Aj0pJ228ch2wWk5gqKS2LJiNKGcLkM/x8g/rrJiNrvTdpBDrP9mi/
	3o8qUM1kwZRTgDatGpwdxokWnGXDKKo5UvaXEeOemOBJ7mr34DRpoYmraF2N1wLRp9ctYH5mZ0Nlc
	v/4HCMJ+owHrgF0OkVafhtBxXzeV4pBXQsmvz8oVQQCGTQ5cFqXWFWN8oPkvd7A+e0x44lCM0iO5s
	LkQYTOrGGRnO21LCxxWOYSgqay3XUXrp4WKS8HDay63tqX3eYIQ+j8wFD3zlvle0jAGchOHewQub2
	45S5zc6pAMeLCqPxgItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAup-00000000Iva-2z1V;
	Thu, 21 Aug 2025 19:25:39 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up6yV-0000000HJwn-0Mp8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1755789186;
	bh=qodkbxh+3qRl8JdkLf1RKw+tBZAn05xOsGyllQXNnGg=;
	h=From:Subject:Date:To:Cc:From;
	b=rMl2rQX8INuqKsgnuQBfCdmNBfgPoXTiAPULHv5yMpPUDWGF5M/p/4kePW701WDNb
	 akDC5b7bfvENcanirtjI/lZXR3RSsHlsAOf5rkezr5aG/KHgfuDqirXH2ZMVoCOuHw
	 KnSOpY52cEtlb6tLq35IBPRe97670ldMLXXpCgSQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/2] kselftest/arm64/gcs: Cleanups for basic-gcs.c
Date: Thu, 21 Aug 2025 17:13:01 +0200
Message-Id: <20250821-nolibc-gcs-fixes-v1-0-88519836c915@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH03p2gC/x3LQQqAIBBA0avIrBtQSZKuEi3SphoIDQciCO+et
 Hx8/gtChUlgVC8Uulk4pwbTKYjHknZCXpvBauu0twZTPjlE3KPgxg8JGhO3wXkXwtBD265Cf2j
 XNNf6AbBcKthiAAAA
X-Change-ID: 20250821-nolibc-gcs-fixes-11cf7585bb74
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755789186; l=531;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=qodkbxh+3qRl8JdkLf1RKw+tBZAn05xOsGyllQXNnGg=;
 b=JE6FOoDOazDnOVA+XQS69RfeWKq/hWoXA6Jd8c9cGQo5lFQSmvSmfnwzVENC5di3S9qg8Tlt4
 X8UnVcDnx/5Dhjc0y8ukmX67x/BfIsqNhqI+OMtXnbFIqJfQm1OniiM
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_081311_268692_0444AD3C 
X-CRM114-Status: UNSURE (   5.01  )
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

Two small cleanups.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (2):
      kselftest/arm64/gcs: Correctly check return value when disabling GCS
      kselftest/arm64/gcs: Use nolibc's getauxval()

 tools/testing/selftests/arm64/gcs/basic-gcs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250821-nolibc-gcs-fixes-11cf7585bb74

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


