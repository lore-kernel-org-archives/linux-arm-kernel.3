Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE728CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=18MxIR0tdVmzmTTCjfqveL+dgh6nwJgg/2YQDWJQQr8=; b=xUlyyzyVSf+4I9TOfrYf6hRBXM
	4BdrKS1IMDZup2j/i8kXn1qzfYH41lZp/GcF+R9A//h13ermppXoglkTO6gbkaQwkh/AcwnOBl6Wq
	6EbtlEYu6FmgMYkNpccTXk6B36tO6uMk7nzOKxkM9R1MZe4lQfeWQqslSjF4oiVkc7ObZHVLUTF4y
	2BAgixuvhVwLbuwkobldqD1o904Lyfao+SaNkLa7/L/WAfzHqwS64k1Gkm52MAYnGJlEhoCjD96la
	VPU1y6aSAsfqwdrJUgLfsixN1xE361QmpX/b2bzyFeJLxSO+CgZzn9mO6cawA+8IHwf5/blqXsSzF
	/SWWlfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBM3-0000000FElq-3TWE;
	Sun, 24 May 2026 16:07:07 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBM1-0000000FEl0-2M96
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 16:07:07 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso5799606a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779638824; x=1780243624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18MxIR0tdVmzmTTCjfqveL+dgh6nwJgg/2YQDWJQQr8=;
        b=E0l02kE4YWmGVN0gnQzKus+mkVmFKqFGOmcT360YAbsWP/I7qQl36/LL2pj7jfUbEP
         Jv6SpuQms/FQBcn8L9srhcRoR9Bpdzb0lwhstFqNFWX5kZbbg3xT2WlbLwezJY+S9vIr
         L6mrYogK0+lDtNtFy60p2nkZeNWLt7nENS4OG0A6MYijlMGq35xfvmRHJC6utsljfzor
         XKi4RFOWGYVbX6OGUXhrZAWv7jtmbxyUuwWTnE1qJPHkYuFPZYqJ4oD+rmVrQZLqwI1q
         UZKPMFVOrYZSrLHSZMQePrUuIksphRxNOijyM9O19EueY8e7dI1Kt8YDv3WAu5DW+A41
         txDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779638824; x=1780243624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18MxIR0tdVmzmTTCjfqveL+dgh6nwJgg/2YQDWJQQr8=;
        b=Jj/ajtedR/F3cIi6M9afP47V4i7/M+4EhtNSIZoTTH94NTcZpHVexVy/f0ujqYcz2H
         23rzhQfK4zyHGt1SwiKGOduOPSWV5UYC8PNJZuU5VNzWeKNgZOw9N9Rp8nEP4FoWPPtF
         crqGndjOFcxdMds3T5bUdhHMi8HWExZlV0CGfz4zEeTbMiscqKjyhiiYEvC1Yqw37Bfv
         RRIozrcBgTQQhx/1DmJhn8tbR6+xHO2mfmCfVvL5qN2B6qNJGyFePirML7jxgqIzd1Xo
         NfPY+MamUCxwjdkID2IYewKXMgj81hn4HYMPZG/J4Sl5d56ukmLO4wj4JgcHLGDDzHjj
         ad+g==
X-Forwarded-Encrypted: i=1; AFNElJ8J+olWT9EUwWBu8zScukx1n/mwmoQItUmd9yPj5tqRpScFNTwbhhY+3RFcowR20M9ZqCYUF3aeHrB3nI0t8fpZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwnoViREp6vdTHG2TUdWDYJBx9DOjvw9z0DspRQ+TihYB/DgS9D
	0jeoNXv1DET8J4wcTSgTrYnrpy7Mz8UE/9IObHVR3mZGxYzJjArGj6I=
X-Gm-Gg: Acq92OG194f8uiZtB5BwCci6fsFWEzpLBbdN7q56o50wBv4VgqCQf5BJksiY830W5lz
	OedrDlazIoY5tn9Ohr5hXJze19DqgplfiuBi+M4jtOUSIfPT07c53cMF+7D2ehjQZCc0/V/jbK9
	JGHiF95q6b3GmXGQkM9c0u23NV0YmKjz03dpjJq2yzFPAiCq7H2acFZmSXE2QAGE6vIkuGq0icO
	/l+eXVnJCpigWnacSkihYXEkDQzoMzg+PB5pDQ0XOTg+sInJz5kE1KMePc9xasZpSbeZOXIRm/Z
	g/XYZG1XryqbHZItl2vVX/6fBDDdzKqFKRSx89QYPs7C2w/1ujMOF7Ti0WFSIMlw3OhUVaZDpWY
	5sfdtpXqhhSqrq7qe1Poh5hjRa30XEPgO7SUZlZ8AyBvWMhGDpxjr1ZAOQNZiI+3QMIVXDWredG
	22ygmnJr3ICUFu4CsbVRWvXr2tvIVcnTLcdmGgEFO/gY9GOidJgDeLnHhjOShGEvvrozuzdhs=
X-Received: by 2002:a17:90b:2585:b0:366:3ac:f730 with SMTP id 98e67ed59e1d1-36a6788e0abmr10212406a91.25.1779638824285;
        Sun, 24 May 2026 09:07:04 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36aa73da32dsm2082541a91.4.2026.05.24.09.07.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 24 May 2026 09:07:03 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/meson: clean up KMS polling on register failure
Date: Mon, 25 May 2026 01:01:39 +0900
Message-ID: <20260524160657.17802-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_090705_595891_65E2F6A1 
X-CRM114-Status: GOOD (  11.99  )
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

meson_drv_bind_master() starts the KMS polling helper before registering
the DRM device. If drm_dev_register() fails, probe unwinds the IRQ and
DRM device without stopping the polling helper.

Call drm_kms_helper_poll_fini() on that failure path before freeing the
IRQ.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16..e49de5df73 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -352,12 +352,14 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)
-		goto uninstall_irq;
+		goto uninstall_poll;
 
 	drm_client_setup(drm, NULL);
 
 	return 0;
 
+uninstall_poll:
+	drm_kms_helper_poll_fini(drm);
 uninstall_irq:
 	free_irq(priv->vsync_irq, drm);
 exit_afbcd:
-- 
2.47.1


