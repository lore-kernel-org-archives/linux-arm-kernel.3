Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C1BCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KEHtQnTwcqBwAA81cL/SHk38+vQn3+hQZ8tB0SijH6o=; b=mGTe+ePHEQdbsmzhkXiSZ4CuoA
	YRDVOyq42GENUJOMIfLSCNimF5ZSitqsAXCKux6NAJywqw9HWOIiNWEF2QAVcp+LCwKb5kNNYiAt7
	CtMCEUeAj9pu7+j3rkoTD4JHk1qRsK4gN6nCVa2l6AUtTL+/9qwnAJpN/5N6khMHAMrS3gUflUQN9
	9yBAvLA3US2s0+FA4s1bpj6E4/R07BTnhK0OVG77CcytwD9QPrac7hLsDP06xBG4T5AFFW3bbrQ5t
	Au2ze/wGDdJpS3xxNLI1vMPFObEnVr7lA8UzidvB+wYRO64+TZUwfG2FLRuRqdFNu3Vg9bQG2TQ0I
	uTXuEHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo08k-00000007dGL-2u5p;
	Mon, 18 Aug 2025 13:43:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unz1d-00000007L1P-2iuc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 12:31:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEC0145A18;
	Mon, 18 Aug 2025 12:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83DB5C4CEEB;
	Mon, 18 Aug 2025 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755520304;
	bh=9xto1WGjpE7C25ii2gC6fdKuCEsKYv14TdNP1gsfLeA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sic9ij+ChZgwPgrM4kF7yOqIFX1ILzVm8emfabxekhi61BRonHlxhP7bVRju6if/C
	 mOxFmD+Et6kUwCxDaU2M4odiXi59m6NPTtwo0oIWEqPsm+DSp8ZCot2GlqKhiGG4/Y
	 rHJSOCidV9FoHsBlZ1E5Ehilw0dYPg+mWf2n0I7rt6eXSWpw5+D2hTfVcxM+JUq536
	 9/O5MHtE9IJBhQ7MT5e8onMR0MH5++RJty+ZqXYi4Nwh8rvTLJN0os57RwbK070Cge
	 4L4BjP+cg12SjPIypzqrEdOCkSMf1mVUqcYDBcDUtCmIo1jzjtrRK8j7Y+qxovhWD3
	 Oj1tk0YQe0zQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2FFCA0EE4;
	Mon, 18 Aug 2025 12:31:44 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 18 Aug 2025 14:31:43 +0200
Subject: [PATCH] media: nxp: imx8-isi: Check whether pad is non-NULL before
 access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com>
X-B4-Tracking: v=1; b=H4sIAC4do2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0ML3czcCot4oDJdS1MTC0sLMyOLpCQzJaDygqLUtMwKsFHRsbW1ADT
 i1PdaAAAA
X-Change-ID: 20250818-imx8_isi-954898628bb6
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755520303; l=1552;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=AcOnQUcEtLtKRIGyS551I2XQVk8kQXwsf7E/+Yff8TA=;
 b=LxPyeY5OtSuWC0dqmLOomQR+CNhDogbAv7Ktm7eAvNyw3RLKGvRZnoWkjAVyF9zkpodT26fDt
 BSNSf84OWnoCe6aD49C3B4Ijd31VQ5j0Tg6aujoKeWnTgkb3HIY05zI
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_053145_730292_0E88B054 
X-CRM114-Status: GOOD (  11.41  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

media_pad_remote_pad_first() can return NULL if no valid link is found.
Check for this possibility before dereferencing it in the next line.

Reported/investigated in [1]:

Link: https://lore.kernel.org/all/1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com/ [1]
Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
I'm not sure if this should be a dev_dbg(), just following the pattern
around it for now, also not sure if EPIPE is the correct error.
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index ede6cc74c0234049fa225ad82aaddaad64aa53d7..1ed8b031178b7d934b04a8752747f556bd1fc5a9 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -160,6 +160,13 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
 	}
 
 	pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
+
+	if (pad == NULL) {
+		dev_dbg(xbar->isi->dev, "no valid link found to pad %u\n",
+			sink_pad);
+		return ERR_PTR(-EPIPE);
+	}
+
 	sd = media_entity_to_v4l2_subdev(pad->entity);
 	if (!sd) {
 		dev_dbg(xbar->isi->dev,

---
base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
change-id: 20250818-imx8_isi-954898628bb6

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



