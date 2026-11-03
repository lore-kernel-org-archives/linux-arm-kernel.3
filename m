Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB403606D807
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ky7Kb2Jl;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=gzbB9OU5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cegzHKtXxs0Lc4YpDLjQwTWbzjWCMJ7XMQTBaeyNQVc=; b=ky7Kb2Jl3bOWh8
	Wi4n8k55fBGgQtcNkZWPaQYEctcnByFt1gtuRlnRjuxkjuaDiywlGSo5O/wFCDfg1ptMmaCYS4CON
	mscJtZbEWE+ja71ShyFvoP1jFaVWC2AeysKUh2KCGU3bIBiToOrA05L7n2gb5K/f707mPRPpeLEvI
	I4A7h6fyhe4eAEpMcFzt99jdBEBCQE9CI0OEYifu25ktCmrojB64xX+dIBJBi5akB4sSIO7xmqL7S
	o5Lt4IYBUQ4Cw7cO7umSlTA99OGVp5qCMGA9VBeZjrr4JYot/83RR3Papbs/JZETW69I8FdpoWiOY
	YG4feOoXZEYhKl0FrjMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO991-00000001MV5-2C9s;
	Tue, 03 Nov 2026 07:41:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98q-00000001MC2-2bSG;
	Tue, 03 Nov 2026 07:41:16 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9EA282A;
	Tue,  3 Nov 2026 08:38:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691532;
	bh=ASCHccvtgsXkln1Yc03LRzPTWgj56l6pbfoHKx4UZOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gzbB9OU5LGs6TjIKOl17ybSw4RBdKJ6gBt8JsTHwRlMVJuccJdM3/Oi3MjjxKSQh0
	 pSTvJhHxGeB2R/X95PaHaFqqz+PEE78g4KGVNKgppfNc1JlGORNymeP9xXCXHZoK2I
	 /C+m/CNuatDfza610Syo7urvrhwoseRamQW6RUDE=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:38 +0000
Subject: [PATCH 02/16] media: v4l2-device: Add struct v4l2_device.flags
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1551;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=ASCHccvtgsXkln1Yc03LRzPTWgj56l6pbfoHKx4UZOg=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAOw8FK5g9ikKA75MS74AXpLkpKZkL1+Blp8
 2ZyoWiVkTOJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQDgAKCRDISVd6bEV1
 MrugD/9dgKiam8MxBAQ48D6wxNyynXau50NHQ98yL+nEuKLLdX30g6gMOerkZPDTW+cT39PHM2z
 bTjDo0WCq92kkiBjhOrHqnfFxXbEJJFL0+j9Ha6APKkRHC9Jc0h19HmPQ42G5LY5qI/fJK02MVS
 av5qBRAddkoLQKTXl7cy8rZzDdc7cHqV0nn2/KY3FIo+Wz8dD3XfUvB8wgumntqFqixmuELcpOv
 0pNBgiI5HbgioU/77hvdiAyahW/YyhHwNumcC8Xtg+VarFqcrdLsiTj+5V7BAy6PL6r2qO2UaJ+
 etgWVqKGWhn4VAsdeLxtynhFDFffwbl/6comEQPDkn2yrimg05Xj4Tq6Es6324xT2vcsUehNzjk
 VQS8gKNdsmBoDcWj4g6Z6c6PIox8dOouzk+KWFkE/NjG0WeBRpGpX6AuH0mhrA/ZTzo0iS41/BY
 Y7W3Lr2+d6xD0J8rUMvgK9JaGxOj00xaBc2Gjx5hahgiTgqxkZ4Ou5AkELDMUfq7uRL/XUskDI/
 A2TGLo0y7SB8nEge1LU6D5ioT4FhXw43KG5F99xSZs++rnxcZkLHMbDVVDlod52sw8YY0WNiseD
 J3S2GQh1T+4cgdnHsQc9voZutz9guCggg+lBr1sEE7Jei94LMHTj83YaNtr2WQtECZI1iJwFF/b
 kPL6MgQZUaxuNyw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234112_822934_45DCCE02 
X-CRM114-Status: GOOD (  11.63  )
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

Add a flags field to struct v4l2_device, along with a single flag
value that is designed to tell v4l2-async in which direction data
flows for this v4l2 device so that it knows how to set up device
links between subdevices connected using the async APIs.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 include/media/v4l2-device.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index 25f69b1b8db03d077f7570471d5c6910fcafe110..9b17916d63641ba637cf8c37aa925749bd4e2134 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -15,6 +15,9 @@
 
 struct v4l2_ctrl_handler;
 
+/* Set this flag if this V4L2 device is an "output" rather than an "input". */
+#define V4L2_DEVICE_FL_IS_OUTPUT			BIT(0)
+
 /**
  * struct v4l2_device - main struct to for V4L2 device drivers
  *
@@ -30,6 +33,9 @@ struct v4l2_ctrl_handler;
  * @ref: Keep track of the references to this struct.
  * @release: Release function that is called when the ref count
  *	goes to 0.
+ * @flags: device flags. Can be:
+ *   %V4L2_DEVICE_FL_IS_OUTPUT - Set this flag if this V4L2 device is an
+ *   "output" rather than an "input"
  *
  * Each instance of a V4L2 device should create the v4l2_device struct,
  * either stand-alone or embedded in a larger struct.
@@ -54,6 +60,7 @@ struct v4l2_device {
 	struct v4l2_prio_state prio;
 	struct kref ref;
 	void (*release)(struct v4l2_device *v4l2_dev);
+	u32 flags;
 };
 
 /**

-- 
2.43.0


