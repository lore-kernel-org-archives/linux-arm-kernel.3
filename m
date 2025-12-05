Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A872D2F7EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 12:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+5ey1vEyaFeJo4owzrkg8DDhyLrlTjfQ2w0NshlQyYE=; b=A+xpc5fNeTz2Gg1SheXXnGjNHW
	i5sNY+0s91htci4bXTm8ngpF75YzpvfY8sQxQ0HDHUsm28OOuseJUt1vtPd0cBCamFifXM3z7F+hX
	b8ip0PQIPniMDFmOgAQ7Po4W/jM0o2IZYMIGqBSzwZcgDgMwzHG4XTZ+k9GTJ4qOIsqXg4tCeNqG5
	m5ZJB0V8hQnOBuMaz31TMPk8A7IA7ibzKCNWpuj43nDcpspb3ubPhdqiapJAxI8t8r+0GWz1/llai
	dY4Ey/GWQu5iJsVcDz/j9V1ZZ2dsOrLoRt9n9IkpjbizvaWKriDwSdANG4ZcI4SoUHHx5y77BCG9K
	n6SsFz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRV4n-00000009UCg-2iQM;
	Fri, 05 Dec 2025 12:38:21 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRV4l-00000009UCN-0GXQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 12:38:20 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5957db5bdedso2612505e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 04:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764938296; x=1765543096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5ey1vEyaFeJo4owzrkg8DDhyLrlTjfQ2w0NshlQyYE=;
        b=ckx1zH4ggyYVp5jDa7wPe5OHRBcSjIzfJbGBbQzkd4MdpEv0YcSwzR47Jih13RWF7F
         hwliMZmBzr1tUMJ4OBvH2DB5G1dK/5WSVOJ5pl+NC859nkbUKIsfmBt1HCLpiKTvR7PZ
         sVxzj7ABP4X+B1sl/zBvD5xocZYQfWTS52xvCSpQM6ingS2Z+vz2et/xbG9qfbaEeLN3
         EhSDUNE0mixkemSGm12tGPi8mRa6d/wjzPvDd5Detw+SsjBL56d3AkVk/APgxEYAMkUU
         uz3NP7vZ6kNAEfmhkVrDq9xs1CuVZw7QCNPh4+4fygQYboGCdmn8Fh8+Mla7R1NvN0pT
         Jv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764938296; x=1765543096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5ey1vEyaFeJo4owzrkg8DDhyLrlTjfQ2w0NshlQyYE=;
        b=FIJ7ZJexFrVPpnR09zmdUIQcAmMfap3v24EaO1oWb+P7DVQBA7Ajb8b4M+y3fq7iDo
         AWShV8tgLXysKmbyRE6Dd8z2HIbqPWtzw8JIIKFSDBglPetljNMC9uZikTHxtFAYCdF4
         f405XvMuA5p9JI3cPls6ChiCUWoFuKYnEl1p2Ps3Sy1bqmoEQTsV18l+PHnmPJXxYyFD
         Hb4KA65Y9kslgL5Ehz4D0dArw5zdlywfYBV2g52Q3xwyz6qxU0PA6pfoTtenEwHXQiBa
         idvKyCzO9l9eU4lfY+6XFNshtwLGR9EP8ZHnPLUuEXWCsLAcQOQ1ZLTsZxCayqc+cgA9
         fvFw==
X-Forwarded-Encrypted: i=1; AJvYcCUZx2x7PudN38JI2dw9qVvxv0TM8xGBGuwHf8ZHUZjWhqOor4cQdf/h7pxvLSq15Bi5Y/ZovgT1NF2q7eCXepMB@lists.infradead.org
X-Gm-Message-State: AOJu0YwJQ2Z7wZjhziQzl2mw0kk7s30v8xBugHwccWm6wv5kuQEQRuSo
	7whtRc8uyjbEiQGeNQJyVc9OqLdioCb9rW7A0/eyOQSbh5owCEg8pYWhIFyxry1X9qM=
X-Gm-Gg: ASbGncsYRB1hnXQQMwtQFvd3MbEOnAIZ9aKcG7mxQMrs2wseClMztPLHhDu/pIcqPKj
	1Cf/n7nsYwN0iRJQ+Pt/TSifFC3yEV/xgAp1Rj+rJ7rniwd0+qIOT14WXERKkswwBwzhzBmGOBz
	10iiIy7mbqYciPc7/PG6LkvfpL8ym4qQ8mzowyDCtn6NvA0Azokqte8CZqaAtKQhSko1l0OcxEP
	oTUkvu9zycEOtkH8v8ziFK2PTlaa6zMKuZX9QmfrJGPI/WhWbkp+/fX+0fZJKmyAuZGeN0Uq8CA
	gSIZ7MHWJLUyW/AsAFGhQJHGnXnNJY4rX7/Sf13QvWtf3avPlj2Gjt7RAmgXDHRfgtq55F2IKX7
	HtMn/mqQLZvC5m0iFixHbcr1dFKqK4pACzMq8h/OQYrtxeO26+u627bC9dglUxzkiAnTg6uZ/3I
	Y7DWA+x+MZcPGOY9ivdcEx6TMNRauxDUR9euw40B55ONP3OnkLthThE8o=
X-Google-Smtp-Source: AGHT+IGW2bb2aXb80GsQX+9Ems/GXyuy3a+l7wu6YocZqKOXTMs0CQftJf6gYMoE9NHuomun6mch5g==
X-Received: by 2002:a05:6512:1113:b0:594:2e8a:1663 with SMTP id 2adb3069b0e04-597d3f3e67dmr4010247e87.17.1764938296402;
        Fri, 05 Dec 2025 04:38:16 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a3d9sm1462351e87.4.2025.12.05.04.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 04:38:16 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Bill Mills <bill.mills@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/2] drm: xlnx: zynqmp_kms: 16 bpp fixes for Xorg startup on AMD KV260
Date: Fri,  5 Dec 2025 14:37:49 +0200
Message-ID: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_043819_109034_72AF8AD6 
X-CRM114-Status: UNSURE (   7.62  )
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

Currently on default yocto images Xorg fails to start on AMD KV260
because 24/32 color depth gets detected but does not actually work.

These two patches fix the issue and now 16 bpp gets detected
and Xorg starts and draws on external HDMI display using
kernel.org based linux-yocto kernel.

Anatoliy Klymenko (1):
  drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color

Mikko Rapeli (1):
  drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.34.1


