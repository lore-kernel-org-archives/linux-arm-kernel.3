Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B932C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALz//0HBxbKUArJZkDOqSeIZBZtLkafDV6jT13WvafU=; b=ZyBfvLzI6tU+MyGiT6tEY3hcuU
	xFrfkcHv+WwJkHXQQDq4nF9gxVsmmKhzo5zgIspHIxgu6bvUYwL18LcrKmc0LhDUbQwHVhAHZpgQF
	dsMt0O8ZHE7q38Wg9tZTSYZ9P9l9V5TcagiUW4hJC/9qnlaZ6n5jyka6pHUOPewKnEridvqgCy9bU
	dT/+bOXdy9BlnmHlaDHKJBXh3sbvvGt9L4CqwcPLoDryUTbYGQqpRLQ7EPSbrUjTkQB5MS+uTB0fv
	FpIXPLcHXSutVGGHgSXuq6c3Ond/Cg6r9+1LZuCm2FekplKkg0aBMvDgvP/gnkNocygqyExBc54Zm
	zU58GZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlsqB-00000008PPr-1sLH;
	Sat, 22 Feb 2025 16:58:59 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlsoi-00000008PFf-2h7c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 16:57:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 25EEE61120;
	Sat, 22 Feb 2025 16:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74FEAC4CEE6;
	Sat, 22 Feb 2025 16:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740243447;
	bh=ikludOBLGJcDCnJlNymHnygt+Sj54F2yzuxmtj0+M9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t8afU9t54Yj9QLzkL6figMynucP3g7eJ/UCCqimCNK1afn4Y48AFxmYVm6YxwWzqn
	 mDqXeUpAA/liAz5pnQmOcYN6jNmgoNVNvXioxrKOFgVKSF6H6jZrcm9pCU+dkMYIgO
	 YpJJOn/KAi4CBW5S/UVrRNydHWvhXzwlaM6NEQ+AMK2VAbYg3OrHmsvbYjhk8p3vOT
	 2EjCNURx/kjes30fD/d7oF5seVA1IsaQxB+PHQeUkMh18kMEEjdGg8O+0gBtva6IDQ
	 f8f3TGjGPTEvdmbCJJ1lb31dkq65SLAwakWgkmEOuBMAfr67CJo6v5WM5PEcf/DRUn
	 x6vmneEIgV1vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3BAC021B5;
	Sat, 22 Feb 2025 16:57:27 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 16:56:46 +0000
Subject: [PATCH 1/4] soc: apple: rtkit: Add APPLE_RTKIT_PWR_STATE_INIT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-apple-soc-misc-v1-1-1a3af494a48a@svenpeter.dev>
References: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
In-Reply-To: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, 
 Sven Peter <sven@svenpeter.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=Bzvx04lIOmxyPohnaPEhCN5D4RKIiEvPi9Robq/Ze9c=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/ouxo/rVmyVvXBlx/HL/Axro6/Jf2Ssqfr/+Ipx6jHuu
 KDniVYSHaUsDGIcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJCGxhZHh0ra7t9n/1E1ll
 755zRtot3xw8K+ajqgR70srn+008qgUZ/tcXvJuyb+fM1yfjOO95aXLUX8/v25pepLcgoOz4/13
 vnRgB
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Janne Grunau <j@jannau.net>

This state is needed to wake the dcp IOP after m1n1 shut it down.

Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/soc/apple/rtkit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 2f5f878bf899..be0d08861168 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -12,6 +12,7 @@ enum {
 	APPLE_RTKIT_PWR_STATE_IDLE = 0x201, /* sleeping, retain state */
 	APPLE_RTKIT_PWR_STATE_QUIESCED = 0x10, /* running but no communication */
 	APPLE_RTKIT_PWR_STATE_ON = 0x20, /* normal operating state */
+	APPLE_RTKIT_PWR_STATE_INIT = 0x220, /* init after starting the coproc */
 };
 
 enum {
@@ -898,7 +899,7 @@ int apple_rtkit_wake(struct apple_rtkit *rtk)
 	 * Use open-coded apple_rtkit_set_iop_power_state since apple_rtkit_boot
 	 * will wait for the completion anyway.
 	 */
-	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_STATE_ON);
+	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_STATE_INIT);
 	ret = apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP_PWR_STATE,
 					  msg);
 	if (ret)

-- 
2.34.1



