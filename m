Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3FC606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2fONG4fm;
	dkim=pass (2048-bit key, unprotected) header.d=medichon.fr header.i=@medichon.fr header.a=rsa-sha256 header.s=ovhmo3801317-selector1 header.b=DR4MDDXn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xir/Ekev5N4mjzLj0xcz0Rsjkx36hw6Go6Z6J+0jWHo=; b=2fONG4fmn2R2aqzJUvlUV/dAQM
	btpzuacYXgAFAbAAprOdsbYs2mPfuUE2/i54kY+NYwt+XClpbCFv3PA+wmv3ZpaaVJvf4SsoBpEaE
	VclHXvVEswIZ2OzTv/0uSJlFlfAxDeFAHWFQQdIjh8rmXlRwz+OUYwLZgi6uub7eAqlUUh7BRnkCd
	Q5gbBzRbHPFu2oKKsTZG+/835oa7CbntuKt9BHIq8IBuXmg+I6GrisAE2uul+HKE3I11N9w/aQsqR
	plsIXhufLAVlfBFxecitV/CCWNQD1I05Hqxb7L626Cqgp6svuhec83xudss3dY7zqjfn6bofqpn8q
	pYc0RYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXfr-0000000C9G7-3zSh;
	Wed, 21 Oct 2026 14:52:15 +0000
Received: from 15.mo583.mail-out.ovh.net ([178.33.107.29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXfm-0000000C9El-3jwQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:52:14 +0000
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.43.45])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4j8sgl4mB7z5xMX
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:52:03 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-gl4x5 (unknown [10.108.42.75])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 786C6C0106;
	Wed, 21 Oct 2026 14:52:02 +0000 (UTC)
Received: from medichon.fr ([37.59.142.98])
	by ghost-submission-7ccd8bbbb6-gl4x5 with ESMTPSA
	id 8cfNEZLR2GrcIAwAWDeZ3g
	(envelope-from <abo@medichon.fr>); Wed, 21 Oct 2026 14:52:02 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R002b4da53ac-d7f1-47df-9405-bc8493e0641b,
                    05BFDA4BFEC350FDF8004146BCFDBCA9DF17BA8C) smtp.auth=abo@medichon.fr
X-OVh-ClientIp: 88.190.90.129
From: Arnaud Bonnet <abo@medichon.fr>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	jkoolstra@xs4all.nl,
	skhan@linuxfoundation.org,
	Arnaud Bonnet <abo@medichon.fr>
Subject: [PATCH] Bluetooth: btmtk: remove redundant memory barrier with helper
Date: Wed, 21 Oct 2026 16:51:12 +0200
Message-ID: <20261021145112.64213-1-abo@medichon.fr>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 15101413975834975838
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTF9qtoi3tSx1+QKyIGt9BUWZHYs30HfsfJ2N49k4rfwYUqUlZ2ZgIzqSeydFiP4LSuTwqmOg9zF5YWJqS/oVWKN7RLL2AF8sFyMIQrrbxqeZj7yvACIYYYqjObN2xIS1wCyz52VyMYQNVsllMnPoDQb0DqTihkGkKfb59TBse/3+OWKaY1dMjcHNxqHFn24rMkjMIW5up31Bicg+rYyswoQsz7Q23WuDGippsnh5+kyR1H7HvzYgXx3rHEKI2dQ9NvpT36r1GqsvgV2JRixe7YG9tqI2yk9fUR1koSWYrOyfdl68h1QrvunaVV+/oWfkXcgomWU+mvKvTrc9zA0e+TkjycJo6X6Wjbr9/HgWm14Yxk3q8r1gALSoGkvy0BpGfCJBzGN3RgNd1VGI3SfK7ze0aQy53ngjfX9/QdkeuyLJNaSrm6j8LwFUp9R4v9OfO/8lQJ14/HcGQ76DwxhdZEJG76ILSZW01VC1lVN4mpdmAkGrH5nemQ7T3ezPYZTcVmGlb0Pbsw/DOfuTKe8pGzh7hWWTvTknbvasHMyA2+/BiU3xpJDW46I+q0AvZc31Rbqea2dztl0yA8Bwj89g4PKKQOSjV4rlYMS1zse1tRl7oU+paLl8zPHZ6Cd9yZSM7VNBjspnHSHym4afqfvYylh7Rb5c6Thfsu49ZEMBtEp8A
DKIM-Signature: a=rsa-sha256; bh=xir/Ekev5N4mjzLj0xcz0Rsjkx36hw6Go6Z6J+0jWHo=;
 c=relaxed/relaxed; d=medichon.fr; h=From; s=ovhmo3801317-selector1;
 t=1792594323; v=1;
 b=DR4MDDXn1q6Ibrz+eXo8ZjhVyasqFfbWAStu16K5UneoeqPiFqKBZF4SCghcmA+rUw1noZXu
 sZapgzGN58C/Xz3b/Zz65ympBiQlZRLsErq80QF/qSQXtWnUtHD73tqV0gPcLJBuy9VtfYpwpx8
 WtSw4suDL656bpjaOq6oy3k6fvwfbYHYHjc+33CTMU+l9mQGc7+l8Opi9DgaEDffrd+hjH7fsHy
 GcwaPrzxkTgiX3PrYG/Tbpiozh+ZLRHm9CWWpX+blsfFP4Dc2deifjYL/cNf5EMHrqdAEr1n/Ra
 lGwYiTmtZTvTs0SqUHRxczSOcwoi9wkmeKC9DTm4E2WaQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_075212_043747_92F7404E 
X-CRM114-Status: GOOD (  10.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The test_and_clear_bit() call works as a full memory barrier, thus it is
not required to emit a barrier using smp_mb__after_atomic() before
wake_up_bit().

Replace the whole sequence with test_and_clear_wake_up_bit(), which was
introduced later in commit 52d633def56c ("sched: Add
test_and_clear_wake_up_bit() and atomic_dec_and_wake_up()") as a wrapper
for the correct sequence.

Signed-off-by: Arnaud Bonnet <abo@medichon.fr>
---
Tested by building and manually checking generated assembly on x86, arm64
and riscv64.

 drivers/bluetooth/btmtk.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 75483d8230e1..a620e24b6c17 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -607,13 +607,7 @@ static void btmtk_usb_wmt_recv(struct urb *urb)
 			return;
 		}
 
-		if (test_and_clear_bit(BTMTK_TX_WAIT_VND_EVT,
-				       &data->flags)) {
-			/* Barrier to sync with other CPUs */
-			smp_mb__after_atomic();
-			wake_up_bit(&data->flags,
-				    BTMTK_TX_WAIT_VND_EVT);
-		}
+		test_and_clear_wake_up_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags);
 		kfree(urb->setup_packet);
 		return;
 	} else if (urb->status == -ENOENT) {
-- 
2.53.0


