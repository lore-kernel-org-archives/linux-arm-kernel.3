Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ADCC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oo7Rc8SKHS0PuJvvqmpL4Zc8+WqVw/feh7QZkGSCJ6M=; b=ZivBHUSKvf+L4EfCdhzg6vKsxj
	IN8hFAOsStI4LHUVQG57/4EQ5sQfv7FAeNVk6ZhuvpySLa7PlYORbyf1KLJjaKFHhdzlrM6Ws0lz4
	Me27yhgu6703OsAa0SBzoBlLBfZ7HB0dzGa5s4o3Nyijmv5qzrWtK9CT7j2UdsWIi57ab+Uz/p2T+
	4TNyW5jVz1rcpP+rrQ/uuig8NNUFhiy9VDtXYdfJ7s80KvyAZuTpID6UQz2d4PS731UzmvBSnO/z2
	ESIwrpI9ctc7E/ZDKAwpLpfBOgCXG3ZqME0wqMe17RTZjWWfOyqKrL1FGjJXTQTHYJQ/Dx7kRs3bm
	rgHWchHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnPk-00000003Ktg-2nAQ;
	Tue, 11 Feb 2025 10:22:48 +0000
Received: from unicom145.biz-email.net ([210.51.26.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnO3-00000003KW0-3oYW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:21:05 +0000
Received: from unicom145.biz-email.net
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id JEG00053;
        Tue, 11 Feb 2025 18:20:53 +0800
Received: from locahost.localdomain (10.94.13.218) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server id
 15.1.2507.39; Tue, 11 Feb 2025 18:20:52 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <laurent.pinchart@ideasonboard.com>, <Markus.Elfring@web.de>,
	<tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <michal.simek@amd.com>, <vishal.sagar@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH V3] drm: xlnx: zynqmp_dpsub: Add NULL check in zynqmp_audio_init
Date: Tue, 11 Feb 2025 18:20:49 +0800
Message-ID: <20250211102049.6468-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.13.218]
tUid: 20252111820535fc6f945271858da8867862091790480
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_022104_237707_9F2628F0 
X-CRM114-Status: UNSURE (   7.40  )
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

Add NULL check in zynqmp_audio_init(), avoid referencing null
pointers in the subsequent code.

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


