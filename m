Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC2606D802
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UaeW2VwD;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=uyhcxzty
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=frMHu3ArlvkBOnWP/keZoceUz9LRRAU7jpoSl2mvnaY=; b=UaeW2VwDM/ei5O
	gOatAIOqrFOnDr2pEPJblWq4beL5gXOxeQXmHU2TDhlYi9BnXT3Cp1VRTJxpz+WJG+JpIBVtQPV37
	E1NGNNa+iitriZCbEZUizXoBKKUOAMKWH9fF2YGN2VRTBQe75CflWOKM3J1DkcTRrkMqsUnLAaG8p
	atjpGE4P4A7H3RZyRGFoUgGmJcVU4xaMXMBAnbrHRe/xk5AF00UWnkWIOtzjo5QZtYpZxfbqnBssg
	2Fhy8JIh4L1biMG3XEv0fSS+yynJ3irXZG2HvmPNuNr3lzB85m9Jmzjc2ONwD6l/GMYYjk+8kly8O
	pRtAYuPKdTrM6Ptuy5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98z-00000001MRs-1dvo;
	Tue, 03 Nov 2026 07:41:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98q-00000001MBs-1yvk;
	Tue, 03 Nov 2026 07:41:15 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32DD7B2D;
	Tue,  3 Nov 2026 08:38:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691531;
	bh=2iD2OpFFxVgyeniQYanpyS5ujA1TBGPZtPUEu8qYJlk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uyhcxztyCOqtev49qyfmS+zxtgG8LC+w1bGCxNwDBgvV37iDXwvEpL9BClKKWQWf5
	 9JoZiqmk+yuEy5OChiJJZrXFVS6GrtyK/aXKVKg2mgwoTDv78kx7fVgE7HKJZSaadA
	 RL9T5VYoee3mXTYWnq9qiU4oL31Y1xp3BaIneFVM=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:37 +0000
Subject: [PATCH 01/16] media: videobuf2: Set start_streaming_called after
 it's called
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-1-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=2iD2OpFFxVgyeniQYanpyS5ujA1TBGPZtPUEu8qYJlk=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAOqeOuK8zS6V3SewhBjDn2A5tdxBAowBqhw
 ZTTb0SYn7uJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQDgAKCRDISVd6bEV1
 Ms4UD/43vAH9nzPwZLX/ijN6oVIEIckGROVUrtaYS945uE6wswPQAVGtVX0viRtIxa5mpy3sqDK
 0BF9M4qrO7MHjvGVZXr6ckltne0F+qhCm06/uyVRWZLKe4ftg0YWbWUfX1wKUepakVIAzFP1LWi
 M9ZoSuu61fD97Y8Fpb5241j2yL8v+VDKJjCW8ZgZVn8hGU6YSiUxbhKMVVPJ2Usdugwx52/P/2k
 +5OsgcbNpkzWOZ/Dm1pcUZQneynvtpzY6wEXBzg/F6kW2WO6UCas/4PQuzlnoYaUWiKey9ZPZtt
 LxEH/a6UHNX8rPN5S0KZ0lHknYuB/tmgbJYHCNuAT0pzjosLfcVJqtLmNrssjjjuo7qlv2SNk4E
 2SPrMCCRKOiFc+HiJREX+LgNxthgYXKpsTRDp1CursKRo+FJdNsS8xoznumF73y7fksGtb2iLOU
 ivlqNru/MhV0l+/07LeMWxu1gpy953ukxELRlJmh82jUK61BIPJ8Q+yH+EYPWe/NF/6zV3Qo7yz
 OoG0Q3jiabix+m7d/FLbjUwWCpLPhxS/JhVg0XPUUT6bI7suQQXELtvm7gaUT4dXr//9cylFIiZ
 Hym0AZEilzBFgxyXuAEBMlrMxbm/UTG2vbR8NxyR13EM4PM6uAfUpW4IpnPndtKKVgCdL6/mWpX
 wuW7vM39SHREB7A==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234112_664899_4A135E78 
X-CRM114-Status: GOOD (  13.99  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently videobuf2 sets start_streaming_called immediately before it
actually calls that operation in the queue's driver. We want to be
able to check in a runtime_resume callback whether a queue is already
streaming or not, but most .start_streaming() operations will call
pm_runtime_resume() themselves to guarantee that the hardware is
active. Setting start_streaming_called before it is actually called
therefore means we can't use vb2_start_streaming_called() to make
that check.

Instead, set start_streaming_called = 1 after actually calling the
operation, and only if it's successful.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b0a6084f175733ddd0d8d399538f949266c8966d..cb4b5e818553a8007d000147843778e72d3753e7 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1779,11 +1779,12 @@ static int vb2_start_streaming(struct vb2_queue *q)
 		__enqueue_in_driver(vb);
 
 	/* Tell the driver to start streaming */
-	q->start_streaming_called = 1;
 	ret = call_qop(q, start_streaming, q,
 		       atomic_read(&q->owned_by_drv_count));
-	if (!ret)
+	if (!ret) {
+		q->start_streaming_called = 1;
 		return 0;
+	}
 
 	q->start_streaming_called = 0;
 

-- 
2.43.0


