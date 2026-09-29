Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D660CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtuAW/uCusBop05pz2Ynxz6ol/dqeDSGu/06fEAwLlc=; b=Kz0YPNHTWQjzQJUqYGWWHzaGIh
	6sb+dKDx+qauTP5NQurrP5N8mR/Ndiz5/Elqn3U99U33qjEtyamspzpu+Y5OuxAbdrcJ2JHDC2NXk
	HLXV2NHxoCm2TFOVjug9iNlpwjGvNvAhWbDh9rhx0+2nxA+mpeyRVH1quJf84eJLPih9GNrpi0i97
	VXl3GBuv14Bl+5HovUVjUFPd1DUhp8vwWflhS6V8hj+TCHn5THHqDZWhov90X1lxmI7BSdbMGzIqL
	po2GnATGt+dU2PlElekuB5aFBvJ7IfTkaVKgdSW6BtAxX5DqgTdzxpr8yZ9QlDb7RWtcNXfJCcXNE
	mFOYGnnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBb9d-0000000472k-0KiO;
	Tue, 29 Sep 2026 16:58:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBb9U-000000046zy-2S6s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:58:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8203F1655;
	Tue, 29 Sep 2026 09:57:55 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3DF13F85F;
	Tue, 29 Sep 2026 09:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790701078; bh=8/ii0boc+Wr1gECVAD56hkDwx+W3ALDJGSxhMWjK4Q4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vq4hh4QoKMd0y40A7V+vz0nffbqxaJXXDHv36hFvqL4DOjOgDDKaGEWRfJQLONAYZ
	 n2AmEQBNS2Sz8x133ZHEJFQ2F7EEMuG6Q6M6E85oy7PbD+7CeDWbK6oXO9/mm2xZ2c
	 6815C+lK20rkJPgPkGpuqTmngJCD1DWUzYeC9QT0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 29 Sep 2026 17:57:48 +0100
Subject: [PATCH v2 2/3] arm64: rsi: Add realm hash algorithm defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-arm_cca_mr-v2-2-1d98bba187fd@arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
In-Reply-To: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 thuth@redhat.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=FfOXThD9R4wtVSi683fbHgUMp6vZ0Nc8qMZ6sGLDiq4=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqu+4R60ni2U/2k1o+iyk21hhFcXyv4ei7V1ZJl
 FqJOjtCwYeJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarvuEQAKCRBt1cPRWsUx
 M/geC/4in3WY/gH409hn0NxDEtK0g4vqFASVS7OaKtLeKNBVR4rDytf0wLfx2aJb6tfC0jWXTZr
 fLCI484nqBDA8eUNYg/8V9xkyCGDu+w+iRazMUggi1BffUPeulIt6PxJjPx/QEDRJIS1iU7Xvtq
 6tD28nUWQWpU4CdzG2WNfpWPSXy9EO635dAjRGvfiySuzAH8a+ME7qxTs7VrB+E0m7dxr59tCEb
 wk0Ut2GXmX0Rlg4cNoq1BoG232fhmeYnq3NbJ44JINKWXJsTIKmZu70liHVTqXIjlQoiCODuM5A
 IokxxZ13MlDRrxDvac7CwKGEgB3DV4M96cXsP/X6YvBvQ5cCFDzoUFrIRBdzHjwjN6SOggUYlxb
 BFsbb4He6FIfX93lXAWgyHWjBd921f6K6Nh9DRzjo7NN8J8zxabHkG2Xs9hpbh9phM0wB7Ku9yh
 tur8xc91wMwSwiec5a9nXd8PoKhXHkRIoybKmiwwZ4bCmOw+YrMY/oPz7o9nEV/RyQpts=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_095800_677306_673E5180 
X-CRM114-Status: GOOD (  10.77  )
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

From: Sami Mujawar <sami.mujawar@arm.com>

Add macro definitions for the hash algorithm identifiers, as
specified in the Realm Management Monitor (RMM) specification.

Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
---
 include/linux/arm-smccc-rsi.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
index fddb77986f70..a83df2655808 100644
--- a/include/linux/arm-smccc-rsi.h
+++ b/include/linux/arm-smccc-rsi.h
@@ -144,6 +144,13 @@ struct realm_config {
 
 #endif /* __ASSEMBLER__ */
 
+/*
+ * The RSI definition of the Hash Algorithm (as specified by the Secure
+ * Hash Standard) returned in the realm_config data structure.
+ */
+#define RSI_HASH_SHA_256	0
+#define RSI_HASH_SHA_512	1
+
 /*
  * Read configuration for the current Realm.
  *

-- 
2.43.0


