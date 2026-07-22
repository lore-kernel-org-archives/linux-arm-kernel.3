Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B576C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTe5FAQJLLQHDH6vlAa82uTTEPb2slflxpV33H1nb6w=; b=W0oLGGbuV68j6XYL7Zxo3zG6iy
	jGPeFO9uzu53oUYV4TVWo6JmeAlMOtLd89PeqGoQvG5wOZZGbD+4NHCdJWdoo3IH2rKOl8Bk6uE14
	DMxx0nQ3KUOTsfMDQPzL7KAewjZXbFGqqrffpYU8iwJC+UK/afyuSRmSEVfJu8xUA2WyJ9L15DiDB
	TMb0ABS7yVjOrh6+7yVS0IQ4WLL0sanbWeMbb+f+/XJASa5mpchn8mdLWsrRGNRySsqSSlIoxAV9p
	3SFHRXaigO1MuSjgbXE+RL6zi7ZjLSqIeCFBUpRHxyxSfyHbUPQFoL9LX0DSbAcGh3czA8t8rX2bg
	Ly38ugHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVrU-0000000Bj1z-471Z;
	Wed, 22 Jul 2026 12:15:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVrS-0000000Bj0K-2HSB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:15:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so91049165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784722540; x=1785327340; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uTe5FAQJLLQHDH6vlAa82uTTEPb2slflxpV33H1nb6w=;
        b=BVQXIc5Z24KkAUBHNT2+JXGayCTCasMGQEV737Q63z2sCQo7+zVdB2hFDCW7l5op7v
         aKe+YVBBatJ67w7H2bbA5MaWCtcJKCbeP5C4Z5IE2cQVcOsnA4gVysfpMap/0Yth191I
         KFtLSH5rOCVxc9Lp38aWI4FwFWurLMANsZSkZ9gWrwUQFVR70PJrv9k3XWaxBNiREcXi
         XRGTIcNw4P5mqnjGrVU35z+5WS6/rZExS/gpCcZ0viLjhlS1KV5iHyL4zFllOMuBpZer
         TEs4HTrUFsuY0BScHiG7l7HrN7n2ouWBHuAOofX5ipZ1G3Id7F6ns5uaRSE4MkAXEx3e
         Ujqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722540; x=1785327340;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTe5FAQJLLQHDH6vlAa82uTTEPb2slflxpV33H1nb6w=;
        b=bTIVTNjiRwZx5L/FUREiOkCLTNnykE48/H3eitXBRKBD8kk8GBuVGikJ62Sn2k87V8
         EG28Y5q98/lKIFt/zIaKhx/jW6CiS5BrmnMAF2TCVRA8xv5kjxsdSOThonxs9rhA36V1
         Ia5vOEKVpDwtdlaLPWF3s/GDS50kynB8aoeiMnn2JxkhftKyh1djcgzSJkF8be0Jmikr
         hPUAK8G5NURfBnPuE2QInu9h3Z9nYl7umePLFn9FVP3L9h1XnTJMWOq++I6nPq9dD5Kt
         3PBtPvHPCCzbG+AKoYNQVMDtuwHnBj3uyuHFw0QPvivoGIvFQlcSG+Of8ytnkjvdUpQL
         ta7A==
X-Forwarded-Encrypted: i=1; AHgh+Rq3ZBKxtGiyWbursj784c8p3Sl6KtEagR4rIzO07kV8dy8agRSDgz5Saynzunx8m53rYS/v1SQgX64kdi/FUbSf@lists.infradead.org
X-Gm-Message-State: AOJu0YzVh09A4/QNLmjJkmpJ8ViDbqoWmKX5SLTN01nUaSCq8oT0VAxX
	CUGMEbYxmmVUxyvmOGRR9E7vYorNc9yyvUynG6d96SuDbZtCEPcTA5bLYBSR3VjWnN4=
X-Gm-Gg: AR+sD11yRJibc5fhKYP825zYmut7oD1VyVUrP2nrYslZ8yYe4+jUsxavhnHfiF57XOP
	bC4wMysbeQ95xT4mjQyENYjus3QLVmKz9+pgJMUfhaOWl2GqTaHClg1qXvz+kU0il7H5s168QLU
	g9Lq5pvtaqSscF6YyOtvaMSz/DIG9PlpgEKxfKRdL2kvcpclYHUJYbxKLDshkpaBaezEFtQ33yC
	T0sMTmYqvFvpTrNIR4HolNS7Zx7zk0Vr94wzXD1Pj5ceap+CxzTZ8Qoroh3HoRKyTaFvZQxal+O
	s6BeZvtHikYtb2zQXAGkd6FVawOh+vhgsedF/eN2O86nMldsA6veeFIy4Nfzi3qWv8eE0ltoZ1d
	IRX+UM7exCFqbVTs0wTcNqNwfNi2Gem5+oLltCuJ7Sy8gIqgjdTCgqvSMcisuA74bwa5cS2RUg6
	0/T41QA/e9VYa0ws4xo60jOaM=
X-Received: by 2002:a05:600c:524c:b0:495:4e12:6ae5 with SMTP id 5b1f17b1804b1-4954e126afamr259062795e9.26.1784722540451;
        Wed, 22 Jul 2026 05:15:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f8635c8d7sm4379093f8f.21.2026.07.22.05.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:15:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Albert Esteve <aesteve@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] drm: fix missing header include for drm_panel_put()
Date: Wed, 22 Jul 2026 14:15:15 +0200
Message-Id: <178472247765.1745070.9105161637266531122.b4-ty@b4>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722-panel-fix-kms-panel-put-v1-1-ebde56446ee5@linaro.org>
References: <20260722-panel-fix-kms-panel-put-v1-1-ebde56446ee5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_051542_600829_15096D62 
X-CRM114-Status: UNSURE (   8.17  )
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

Hi,

On Wed, 22 Jul 2026 12:07:30 +0200, Neil Armstrong wrote:
> Some DRM drivers lacked the drm_panel.h include to use drm_panel_put()
> after the commit b71a623598d3 ("drm/panel: of_drm_find_panel() return a counted reference").

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm: fix missing header include for drm_panel_put()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/057fad48d7f9f1caa90bd32295a03228254cf1e3

-- 
Neil

