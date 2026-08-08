Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C96C5AD2C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2wqvcWoakAHAOfbnCvk5W2K5QMWwrKblDk8o5LDji4A=; b=bGe1huMhBXkYR/i5ypzjl3Bpsg
	IliABoiTO92vG2GqezjlcjHKfPreZHaPAl59p8CQzTHIn4iU41dekTLFc/+wuWYMD5ZdYWSpXFTLZ
	ZUAmwo2uLALiELbI9WzqMia15JHCP6ff4xd3OTzX9xpgs8pHpPpX/Nwtxv9hOGLwG1Xdpag31WSxF
	+yYk5lAIOqVZOjxwE0xb63yA/LvtKC2BRmRPULE2UzOYHAH0etaEI9tIgguwLLoLSj020VGpmpS+f
	FDgVub4QAUSkgCTsLpJMhjI3p/HCmj0VE+rD0WLNa0HVRZ1c1uTp7IYu3zb4POxBXGd3LFvLZZkSH
	mG8npLkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsd03-00000009CRV-3pFk;
	Sat, 08 Aug 2026 09:05:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsd01-00000009CQi-0ttp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:05:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cc73e322dbso3475855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179948; x=1786784748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wqvcWoakAHAOfbnCvk5W2K5QMWwrKblDk8o5LDji4A=;
        b=d4eESKJRBrQcSlwHUP5gzIfKhcZsx6K497XtaurzXiYv7q2IeDtWh22wtbpbiofK+0
         LgbQDj21+HIVRHqi2oaDFsSH4c7ko0I8OZLiLHJv8nLPjUagWsSi2Sn57/pWOmlv4bVY
         WMJ2YhRwUOI5obi4RXO7wAOj0SrWR7hSyZcOiurHgq768qPQTPjuYp8YWbnPH4tFKamx
         OAyln6G3HJxICOiOy4Co0FlBBmYEOB6sFTjvAvZO4PVot31QcMhO7WybLe8ilYg6mjU5
         PVGuvSF1jEqQ+0IkGc7C6I0bYxi5hm4axIsWueyZtfieG3ytjXOwXc2NWURT1w6lHSf1
         4C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179948; x=1786784748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wqvcWoakAHAOfbnCvk5W2K5QMWwrKblDk8o5LDji4A=;
        b=VOT8GiPorQG9dIfSDDiFpf5zBIq3hANEUGz21exowZ8tQj1rhUewp0YwPFoGdW325J
         chpgSe7WnPAjwA4hFYaalW52h6J+amMHIMbMqlLOoS/SlDuKOpZIkVF7ROb9/clbdidU
         eQlbznPtHeIfg6rRJWMatjbpel1QP+UFsaaOb/UDKdy0NX5CPaW/8gDGspRqbP+nUkjy
         qmSsZHRwNelWZVYZ7MbxxdExyBj3MJmFQIIwyJmLCJEcpq8KevVKyxdcEj0Td86ZIahc
         vSxWWeZAxZwDROBzE9w+vUCcl7KdqcG/T90qLC9MhopSNYCMIYGSFgav4GTtFLyal2VW
         Xijw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8DfIQN42G5xri0yPMaa/+2Nr69IMTQgrM9TyskpTOSlerW4RB12vkHjZh1ygZUXIMUB3h9W1Ozv5E7W8K7fAF@lists.infradead.org
X-Gm-Message-State: AOJu0YzqsXzJGs3gjnWSia0mMfdMOIYKP3+bTWnwXK29xXIXTW1HLEYg
	/ptBpW+lmk/+5EuI2YIqF6FNKy/a12h19jQKmlCvO/mziXJlfF5tFi7s
X-Gm-Gg: AR+sD12D/5ZT15zRzKkskb3ZHbvbOo5Hm5TJLuerucFAPnJ5J2eL4Ea7IYvAJzSNjXk
	mtK3xEcrQGGxrRK87NNgb8FWkr+AM56h1Z2pignOLVqEAZD7G5RVl62vHuA1hzF3UXMfX8nTsEO
	QLOxzbTiMWx61KVpcN3/+xKc29ldsQ7hIjeYeGkt2E1nYXmbS3t5c8Qe06ngdWxrztNGu8navEF
	nxFlkJQSI77m6Sl6hjCV5pahbhk2WRnorUB4JCPsiceVdlmZBC7uZ2J+vvpD5HCY668+cm/niZg
	vz0R8ktUavvW0BacGSd+0M2sstrt9I4RpzcUpYgD46AmkwVbHTVUprPmaUIMWCj7BMEs71FYrgI
	kXyDyEjNoLWvVM0J3N2E1cZxeM9P9U5Qe0dOvoAP31y9b6MfyTKuWiwUlu36uGrhstrGChdbFd3
	NYVKiEkN/L1p6Wgx/qWSlnmmnxIm7e7N0aOe7y2FGQ+LMBG8BMGzUkxtFU7/riwXx9ALBdY2WBd
	vqmkA==
X-Received: by 2002:a05:6a20:43a9:b0:3c3:8651:b302 with SMTP id adf61e73a8af0-3cb85f60443mr34767349637.28.1786179948335;
        Sat, 08 Aug 2026 02:05:48 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm17054754eec.4.2026.08.08.02.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:05:47 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: stm32-dcmi: fix async notifier leak on probe error path
Date: Sat,  8 Aug 2026 16:05:41 +0700
Message-Id: <20260808090541.2674255-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_020549_252099_892C818C 
X-CRM114-Status: GOOD (  11.22  )
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

dcmi_graph_init() registers the V4L2 async notifier with
v4l2_async_nf_register(). The probe error label err_cleanup is reached
after dcmi_graph_init() has already succeeded (e.g. when the subsequent
reset_control_assert()/deassert() fails), but it calls only
v4l2_async_nf_cleanup() and never v4l2_async_nf_unregister().

The notifier therefore remains chained in the global notifier_list while
the enclosing struct stm32_dcmi is freed, leading to list corruption and
a use-after-free when the list is next walked.

Unregister the notifier before cleaning it up on the error path, matching
the teardown already done in dcmi_remove().

Fixes: d079f94c9046 ("media: platform: Switch to v4l2_async_notifier_add_subdev")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index e5663fbe6422..eeb0199864dd 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2195,6 +2195,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup:
+	v4l2_async_nf_unregister(&dcmi->notifier);
 	v4l2_async_nf_cleanup(&dcmi->notifier);
 err_media_entity_cleanup:
 	media_entity_cleanup(&dcmi->vdev->entity);
-- 
2.25.1


