Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A28C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 08:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ogcucGj4+xLz0iuPEObfFGOPyaKNQT2B81j0/zmlzco=; b=LtkcYQDHHoebsjMS0b+wUHg0x6
	ZujqbCQmTuZ+Xp56xdytWy5D/j2n5vj9jL8ye91z5BLBet2O4cQSdpfhWpE/Yh4xMMjH/uHykiHKa
	6qpcsDiEozNBwacKGXjKtWdWNNHanjY6lemeaYYu6CWNhnLTQVnyxUQQpX5sSXJoPI1R0CtsY3k2b
	GNnwVkfNNkojO6HDt929vQH/yQFhsHSbGMO/+5G1YZIzj8fZkgJ2HZbQysCw7BvBRR8H9dXUzAEuS
	KZF4P7SDpEGeunBSuO/2ILfN/nBS9dEY36w8TmQ8adN3GyiIhRLbJcKziE0ouqSdy0yLNci+wH5Ni
	by7hST4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th2bJ-0000000ELB6-307D;
	Sun, 09 Feb 2025 08:23:37 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th2Zs-0000000EKzP-38n7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 08:22:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739089320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ogcucGj4+xLz0iuPEObfFGOPyaKNQT2B81j0/zmlzco=;
	b=VdP0/OpvSoMQcqoxFxlCvMZcKA+0vb64sl5KUtvrLE9J9xkd4aUz1Ih1X3rGlvceBKd+3I
	43EUaSkQhjK97UHxoBzCyAKlxrOZC4v9zoD23OV1Wauc+dM09tU2va47n3ldeF2tFxd/BJ
	Lg9h30ncJeMSZ/RbTAUOx2k5uhIFYnQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Russell King <linux@armlinux.org.uk>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ARM: vfp: Improve data types in vfp_estimate_div128to64()
Date: Sun,  9 Feb 2025 09:21:01 +0100
Message-ID: <20250209082101.3255-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_002208_925051_8828B168 
X-CRM114-Status: UNSURE (   8.95  )
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

The divisors mh and ml can both be u32 instead of u64.

Since do_div() implicitly casts the divisors from u64 to u32, changing
their data types to u32 also removes the following Coccinelle warnings
reported by do_div.cocci:

  arch/arm/vfp/vfp.h:121:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
  arch/arm/vfp/vfp.h:135:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Use upper_32_bits() to compare 32-bit numbers instead of 64-bit numbers
and to prevent the warning:

  left shift count >= width of type [-Wshift-count-overflow]

Compile-tested only.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm/vfp/vfp.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/vfp/vfp.h b/arch/arm/vfp/vfp.h
index e43a630f8a16..29073d89ef00 100644
--- a/arch/arm/vfp/vfp.h
+++ b/arch/arm/vfp/vfp.h
@@ -109,12 +109,13 @@ static inline u64 vfp_hi64multiply64(u64 n, u64 m)
 
 static inline u64 vfp_estimate_div128to64(u64 nh, u64 nl, u64 m)
 {
-	u64 mh, ml, remh, reml, termh, terml, z;
+	u64 remh, reml, termh, terml, z;
+	u32 mh, ml;
 
 	if (nh >= m)
 		return ~0ULL;
 	mh = m >> 32;
-	if (mh << 32 <= nh) {
+	if (mh <= upper_32_bits(nh)) {
 		z = 0xffffffff00000000ULL;
 	} else {
 		z = nh;
@@ -129,7 +130,7 @@ static inline u64 vfp_estimate_div128to64(u64 nh, u64 nl, u64 m)
 		add128(&remh, &reml, remh, reml, mh, ml);
 	}
 	remh = (remh << 32) | (reml >> 32);
-	if (mh << 32 <= remh) {
+	if (mh <= upper_32_bits(remh)) {
 		z |= 0xffffffff;
 	} else {
 		do_div(remh, mh);
-- 
2.48.1


