Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D911D0BB61
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Mime-Version:Message-Id:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=55/hvgYNWdvBpZX8vS6a0ZNEj9vu+ZIZIEdADHyK4mM=; b=NgsNvmAU87b5c5itL9a3BILTWT
	dR/zdYs17RH4bSRlVIt73ZxJepocsHhMDZuzQR5SeWAgIsEmwILLpvB//74wHcKwfh4ru4wvhXeqE
	TOHU3gK8z4ur1VLsU1gWSLr42DBvgWxbJuom1C6+jgJmASREcBFuYk6mJes8ZwYXTA6IdpHdPNUBh
	vbVXf0UQQ3WLuNtgJBiCF6fdooOkEumVrqBWfHdxDBGhI9nT/ZlBGQPA/74EMTz0hcq/V3brmDD9I
	5NJfW3mR3w1DQ83kDKW4cFoVrNmka/bUC1bvsfOtJH2y9FUIj72JBwQSY10Gkpbj7D+uSyrQL3V+R
	+TuGAQvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r88-0000000GstC-1bRT;
	Thu, 24 Oct 2024 06:15:32 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r6X-0000000GsPy-1vHq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:13:55 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e31d9c8efcso10583117b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 23:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750431; x=1730355231; darn=lists.infradead.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=55/hvgYNWdvBpZX8vS6a0ZNEj9vu+ZIZIEdADHyK4mM=;
        b=JyIGXFWLIIpMxi/683kNseP2042jk+74Yz8RRNOJ1MYsg+LXg/gcWY5DL8d7UW4ttT
         vRMjKEtU2cuBlXNksv3tJJqzLrU37tGLYma15m1PNDs8amLdIHMW7TpmvyV0qOkfE9V2
         hM80Y8ZdETXsx2T1yTngdjAVTVfoVnbEs6wy9UdZzbpLlNWobxPAu0mhVnooKikjWGli
         t60+0Px7AdBaRulPTnlZlqCZ10AA5sTVbBKhyNBEGL+JsUZpa5/dpiHQrc+I+Ebgi+5w
         ocbm11V3HWvluqDmyAiI7SNljkeooy2ukuVM5Vw8VzsaQD/eJ3SBavljU8LfO6k+eRjM
         IqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750431; x=1730355231;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55/hvgYNWdvBpZX8vS6a0ZNEj9vu+ZIZIEdADHyK4mM=;
        b=Zz4lf7xobVv8EEK8Ukk+QJ4YXzduCe8BQCbYR2Pr3wl2o6gC/VpGSnVHmUUeMz8SOZ
         9IuWrW4G3+DWqrqQxEdpBDjYJ/XRPETYs/O6Zm6FopB0qoKlmRiDMOC662qq3jPZWoKw
         CWdKZUeTxjq6BX6MXJUyip5tKgsjI3hgIkojYDLFZaIEAhojk31djh+06zWFDzZHZhhG
         dCaq2w//I4RlnG+vL904JXDvJxJVT34ZVUVMUr1FDGgyhtWWF213NaCud2RuZqTZEIw+
         FpW5XzWBb6Re2HGClxTUaRZDXHKANTAMyTwjELafQoVBvOt94JYXJyyoHFnY/VSXaAPQ
         NUVg==
X-Forwarded-Encrypted: i=1; AJvYcCVejlKy4gnAFzYoo/wpZgsNUudLXCK/KwJUW/YG6dbs87M6wtMJrk7uPUdFqh8pAebXbf9CKCs3HncJrdNSCCA8@lists.infradead.org
X-Gm-Message-State: AOJu0YxIy/V/seKlxkAMYcax8j8FuYWIO5ybP8NELPVYosaXwDd8Qegz
	K/4V02K3pf+bnmMHEp72hpj8HLdZ/eqqp+pzPR7lvOBZGnPARIXNhUXbLBIeWLXVlm80XgpRihi
	PBRHh9r9Gt1c6SA==
X-Google-Smtp-Source: AGHT+IEjm5xZ8oWEf7u6//TA4Kt5HjH6iFnxvFJipXmVy8asdr1VaVjmTPVebbvVpJLKuPZgRMsL7ilkx4vd+j0=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:7082:b0:6e7:e493:2db6 with SMTP
 id 00721157ae682-6e86632ee4bmr196737b3.3.1729750431239; Wed, 23 Oct 2024
 23:13:51 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:41 -0700
Message-Id: <20241024061347.1771063-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 0/3] A few minor fw_devlink fixes
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
	"=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=" <nfraprado@collabora.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_231353_538664_4DA36318 
X-CRM114-Status: GOOD (  11.35  )
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

Probably easiest for Greg to pull in these changes?

PSA: Do not pull any of these patches into stable kernels. fw_devlink
had a lot of changes that landed in the last year. It's hard to ensure
cherry-picks have picked up all the dependencies correctly. If any of
these really need to get cherry-picked into stable kernels, cc me and
wait for my explicit Ack.

Thanks,
Saravana

Saravana Kannan (3):
  drm: display: Set fwnode for aux bus devices
  phy: tegra: xusb: Set fwnode for xusb port devices
  drivers: core: fw_devlink: Make the error message a bit more useful

 drivers/base/core.c                      | 4 ++--
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 drivers/phy/tegra/xusb.c                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.47.0.105.g07ac214952-goog


