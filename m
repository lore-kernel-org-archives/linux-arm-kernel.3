Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61712C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 03:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d2thYm1kQu8gb9N7oTpInRvsLPtlILYPUV1QJnkW47g=; b=uw4VdV1I8ujFDutyGznF8tAK5e
	ruJC6WRbAI4uW4tqxbU33rTv78FJwn6M9jyfVgj+imwTVlGPsZCGnHJgNWTwNxAmekWCYIsa5oBPX
	Qo15AopyQDjgy7bZgmt+2qrYeQ5YRru3F3z+GiSx8EhVrdtCgF08GLWiMqlQXnmD9hysEBHaqKATF
	/FBaHYS8LyD8GRCDsDy/Ok45SIYxmEnkywoDcIp/DB/IVjKjRCiZV5iGa2Zw7zrdutlvBu11g1IiA
	bkvMc4fkEd75g9T5NLTyh6QZ2sYKb+IFAy32t8sBvQKXePCA1ydbsFY1Ncxaf+aQWTeRTc4UYVOo8
	lddFAohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thgzf-00000002P4y-0pTD;
	Tue, 11 Feb 2025 03:31:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thgxY-00000002OhB-0ykD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 03:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=d2thYm1kQu8gb9N7oTpInRvsLPtlILYPUV1QJnkW47g=; b=lZbXzx82hST2erB9goZKVgWH18
	me6JQ6TZt+CJAolB/PAVeY85MXtJMKaUkDl/ATqcddo2o8TP8gtYkJ0VgqzZ8/ki2smDLby5GYi7O
	niXOe6nDgg/EGE51bB9faDxn64S15CB1NKWUFs75+X8BWW9GhSespwtSBsEMQ+Rzea2Ms5x1FAXM9
	4HfXbBVll8s6ySLT+fb7ee0XrLT+G7bAHtAYcMAHTRpVnbqvpWEocaBh2DFIhm+BqiPsltuytmPBF
	3G1mOmEF+CE36MFqffa2nkX0hN0Ify1Dug3fIFN0hcT1PorPvUaI1LgaT/fyLZvrsjNYI+ns8dda+
	UCEdAiYQ==;
Received: from unicom145.biz-email.net ([210.51.26.145])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thgxO-00000000TEZ-1dPk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 03:29:12 +0000
Received: from unicom145.biz-email.net
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id IVN00135;
        Tue, 11 Feb 2025 11:28:35 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Feb 2025 11:28:34 +0800
Received: from locahost.localdomain (10.94.14.107) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Feb 2025 11:28:33 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <laurent.pinchart@ideasonboard.com>, <Markus.Elfring@web.de>,
	<tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <michal.simek@amd.com>, <vishal.sagar@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [v2] drm: xlnx: zynqmp_dpsub: Add NULL check in zynqmp_audio_init
Date: Tue, 11 Feb 2025 11:28:29 +0800
Message-ID: <20250211032830.2400-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.14.107]
X-ClientProxiedBy: Jtjnmail201614.home.langchao.com (10.100.2.14) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 20252111128356074588d4dd940152aa283627d077bd3
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_032909_356536_37C52DD3 
X-CRM114-Status: UNSURE (   7.45  )
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

devm_kasprintf() calls can return null pointers on failure.
But some return values were not checked in zynqmp_audio_init().
Add NULL check in zynqmp_audio_init(), to handle kernel NULL
pointer dereference error.

Fixes: 3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
index fa5f0ace6084..f07ff4eb3a6d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
@@ -323,12 +323,16 @@ int zynqmp_audio_init(struct zynqmp_dpsub *dpsub)
 
 	audio->dai_name = devm_kasprintf(dev, GFP_KERNEL,
 					 "%s-dai", dev_name(dev));
+	if (!audio->dai_name)
+		return -ENOMEM;
 
 	for (unsigned int i = 0; i < ZYNQMP_NUM_PCMS; ++i) {
 		audio->link_names[i] = devm_kasprintf(dev, GFP_KERNEL,
 						      "%s-dp-%u", dev_name(dev), i);
 		audio->pcm_names[i] = devm_kasprintf(dev, GFP_KERNEL,
 						     "%s-pcm-%u", dev_name(dev), i);
+		if (!audio->link_names[i] || !audio->pcm_names[i])
+			return -ENOMEM;
 	}
 
 	audio->base = devm_platform_ioremap_resource_byname(pdev, "aud");
-- 
2.43.0


