Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A1AE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 21:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=; b=oJjvXhiLsG0sJaZqlSDRJBrI+f
	edU3qRAudRht6XHgAATT2kfDJsca8zh/W7M8CrjvrOnipYj8/W4HXMDsys+6lZFgH37ZV25o1m/Nh
	yuTuzeR91Cus0EVgxx4Mgyp4x6hgY1+EhzTrBX0ZvnLNSJdqCMZt8F3EezS4K/kGAXK/zCQZfGeqV
	XxI/4zLJm+emFCtF6MHEWLUnge4Z2NQvRrOr1edWxOUDHt1AvPdCcGkjn3oxw8UfPm2Bg2hrsi/pz
	3rbplHfXn9ZAHB+fQwJ89yz35Ax0oeS4ELKfI3fqEPl+IYjxLjZmoo8jGhJ/oYR7/15AnB/rKuKj+
	qA4qbzgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRKI-0000000Cnbi-0E1t;
	Sun, 21 Dec 2025 21:50:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRKF-0000000CnaJ-0TdF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 21:50:52 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a09757004cso42452585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 13:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766353850; x=1766958650; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=IqPg5dTJXdxX+0OWQ4CZajN6/vgRxMxYfdNOGXa+bg0xZy7lgk9ppZ8dCtmYN+QM/M
         U6dhlYLdx4i5Q9iHyKkq+6UN5GI14sWyyEdPe5xeQJDlMHuRLapZS1RdeqrjXkvMC0bc
         lYT6SvVOmTjB6tBJGEVixqm2eOuyNrHfA7aQDvnA4C1W2WKc6ciZqVMAclm7FXXjq5OV
         nYK0egMN7o0MSqbnCdrf+N75aodoerBwQLrnsn4vk3XnqiN3eWZSBVwYl7oE4oeugThE
         17YxN0t876GItH8U2eovQkkR+y3t3Gt4p4TP/Fxh/Iz7uDcweKm6tBGoF1JgMXiL6+H8
         QnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353850; x=1766958650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=Gtt8wKcQ+TIpBD0Yjv0RRAshzmmTtaiXd9MooSp7mXPWCCOVLaaZfCtxgfKNg3h5ml
         LwIfltiMw+4wWlPl89o3FN0mxPwcbQ98gak4qpclZL94zxWPCg49+F8PCwSzxV5Hm5Nr
         EA5QQ7h/1cTJveIWBBTz046XnOBSO11idbPykVn3i+BuTW6/WrpPGpl3DIf71u4DtMrA
         M7k3Rim0HHnJD/oDxvD583brr30ELjjPHwL1IEEKs+91CvpUamCQnm8D3XIZXTqWbw4k
         ezdCpqS/C35AZA0EMesUIzdNBlqP3cUVO/Yb59plqltVUqY15WOagQjV/EHrK4DEPhpJ
         LvlA==
X-Forwarded-Encrypted: i=1; AJvYcCU4oVTjNTmShZlN3o3OOWKQyUUSXGAVlkMrMw+Vm20KbGt8B3DpbIAhLh2V1nqdMVD9tiChzbc6s/lI9FccvMOx@lists.infradead.org
X-Gm-Message-State: AOJu0YwNMZH1EjTUJ3T325qj5kwdU5pKMsLDD6qFQ5upVyFFrszFn498
	8hR01zY3VeWbr25F68LR2WZarxkYKm1QcR9ABMKHqIOvUoBshoR/J44bHX8fV9rM2KhwlR4z/Gz
	VgxKtbuAAedi0UsTQ9qMEiD1E1XHzKSM=
X-Gm-Gg: AY/fxX77wLrOb3TKI1PCbGECtGPq0I80bxA7YLD09eqQkU6W2YSkNDWo2x75eTnDFNx
	+EQ5wJUmAiqICCiQeXfm/PKqPsgxTUsnGyDwT2j0elleS7FFEXO6BK+a6bdmI7NiX8U+c1sR3Hw
	libS0iC0A5tRfGk/SW5xbuUYF8ko5tXtvGN1hDFARI91ACG2H6vYOWx5MVg6G4ugVmc5gde0qCq
	OAE+kbJY6i8bv+QYgbvDUSUAIBAIhPI84GjMtCRuV15ZpfXLRHu2e+nIHuTUPlD8Mh91rkG4wMu
	zinTAoxPLygkPaBS5qYmOzPa28dr
X-Google-Smtp-Source: AGHT+IFmGLO1ppe7sd+ZWkCXr5M/lVGVTY4CkYOHQyHuMOoqYtObXJlv15dAaXOXobOy5zBtPFDXPUKZsDC8LF455xI=
X-Received: by 2002:a17:902:d2d2:b0:294:f310:5218 with SMTP id
 d9443c01a7336-2a2f1f904a0mr102182675ad.0.1766353850211; Sun, 21 Dec 2025
 13:50:50 -0800 (PST)
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:50:39 +0100
X-Gm-Features: AQt7F2oD-fq9YbJ8bBaEtNQvS-l_6JEvIhNv2LhoefMzto1ImTx3Z1Dec3fhOSc
Message-ID: <CAFBinCArG=-pNRHZTdZX1CDDPrs02zpRJ29GSEUA6TcUckQvww@mail.gmail.com>
Subject: Re: [PATCH v3 11/22] drm/meson: encoder_dsi: get/put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_135051_150368_5E9501A1 
X-CRM114-Status: UNSURE (   8.93  )
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

On Tue, Dec 16, 2025 at 7:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

