Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1C3C43211
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Content-Type
	:Date:Content-Transfer-Encoding:Mime-Version:Cc:Message-Id:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bjAzTl7d+Kl4TVionb8E/T68k19GosyQDohWsclNhM0=; b=TZP3BnFJu0RNkBU0gTNjnhDesd
	cCo567DoozaQlT29TEX/i1DN3+6FH57qNL5UeLyKjojMMbLwIH1jWMehNhKoSbO3o3H5+U7kwJOee
	5mZ5RPnFBUmkFodeFwTRRVj/gDINrwXG3lToJRTdSB+OMknhsPZtnAZjcfECltNuPawxscE865C5M
	lWHsIzPaaWhlNmUbllPRqsXGqsLTfp+i182SwuYzN4/dymiojqaeP6+zAer52W3KDfy1S8MJD/oqL
	s1G/q3bNJWesQeHldUbUyhmCdaNMF4Vr7bfS+Odg7G3bIOtIfhezZpH4dEO8VtyQYL5Zmmim9MuYR
	kAspHuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6AA-0000000BLQX-3A88;
	Fri, 26 Jun 2026 13:00:06 +0000
Received: from va-2-114.ptr.blmpb.com ([209.127.231.114])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6A6-0000000BLOY-3wU3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 13:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1782478794; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=bjAzTl7d+Kl4TVionb8E/T68k19GosyQDohWsclNhM0=;
 b=olHFBq+U7L0i8Q72NXXM/afF1eDWA5TGUApsQAOTRDRb2PVSsl3k5OAFqIeaiWkc+CNTkW
 44JSDrLgn+uO1+3XMSsR2kTJ5RpUrvisyLHKLBGFM5k2CprrUDhi+AvraYgFyL8iPlwcfD
 bs172XOOgwQh3GHerBzAx4/4+jouLWF6O9t5HvHc+WcWGx8712L71Ijx8L3EnytirKH2nL
 PIprGuUol3iwa4DmXm8nUIsUHdgkWkVxtbl40jZxoyR530pFRCOed7f16mqfe2s6VPsch4
 7hOvYWxQnCzOaj/tCYzHdkMyPhSdWecwvaB0xxhSnbCSYkzy4wX/cSGyaDE3xA==
Message-Id: <20260626-b4-arm64-515-preview-clean-v1-1-ad19e286e322@bytedance.com>
X-Original-From: Yijia Wang <wangyijia.yeah@bytedance.com>
Cc: <shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <will@kernel.org>, 
	<catalin.marinas@arm.com>, <broonie@kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, 
	<linux-kselftest@vger.kernel.org>, <cristian.marussi@arm.com>, 
	"Yijia Wang" <wangyijia.yeah@bytedance.com>
Mime-Version: 1.0
X-Mailer: b4 0.13.0
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26a3e77c8+37214c+lists.infradead.org+wangyijia.yeah@bytedance.com>
Date: Fri, 26 Jun 2026 20:59:41 +0800
X-B4-Tracking: v=1; b=H4sIALx3PmoC/x2MQQ6DIBAAv2L23DWAQGq/YnpAWNtNKhpIrMb4d 9HjZDKzQ6bElOFV7ZBo4cxTLCAfFfivix9CDoVBCWWFVRZ7jS6NVqORBucroT/6H7mIrRZP34Q +NEpAGRQ78HrPOzC1NPUG7+M4AcOZvIZ0AAAA
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH 5.15.y] selftests: arm64: signal: skip SVE VL change test with single VL
From: "Yijia Wang" <wangyijia.yeah@bytedance.com>
To: <sashal@kernel.org>, <stable@vger.kernel.org>, 
	<gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_060003_051593_3CBAA001 
X-CRM114-Status: GOOD (  10.23  )
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

[ Upstream commit 78c09c0f4df89fabdcfb3e5e53d3196cf67f64ef ]

The fake_sigreturn_sve_change_vl test needs at least two SVE vector
lengths so it can attempt to modify the VL in a signal frame.  On systems
that support SVE but expose only one VL, the test initialization returns
false and the signal test harness reports the case as a failure.

Mark the testcase result as KSFT_SKIP before returning false when fewer
than two VLs are available.  This preserves the old bool init callback
contract while reporting the unsupported configuration correctly.

This is a minimal backport of the behavior used by newer selftests, where
the same single-VL configuration is reported as SKIP instead of FAIL.  The
5.15.y selftest still uses a bool init callback here, so keep returning
false after setting td->result to KSFT_SKIP.

Signed-off-by: Yijia Wang <wangyijia.yeah@bytedance.com>
---
 .../selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
index bb50b5adb..915821375 100644
--- a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
+++ b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
@@ -6,6 +6,7 @@
  * supported and is expected to segfault.
  */
 
+#include <kselftest.h>
 #include <signal.h>
 #include <ucontext.h>
 #include <sys/prctl.h>
@@ -40,6 +41,7 @@ static bool sve_get_vls(struct tdescr *td)
 	/* We need at least two VLs */
 	if (nvls < 2) {
 		fprintf(stderr, "Only %d VL supported\n", nvls);
+		td->result = KSFT_SKIP;
 		return false;
 	}
 

---
base-commit: eceeec79dbc646d6dace49ed1ba2f656683d5537
change-id: 20260626-b4-arm64-515-preview-clean-9408c3dbd320

Best regards,
-- 
Yijia Wang <wangyijia.yeah@bytedance.com>

