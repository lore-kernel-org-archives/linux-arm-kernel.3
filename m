Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808F1C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDAFJuDlghFFa//FTOTLPnlGuO3PdxiOtfn+DAJGPPw=; b=id7vMZ+L0HD0euOXcX5K5vVU/X
	S4WeEQhKYP+yCOZmG9ClWeTkRyrVl7z06yehUtGFYEH1MvGOsrOJ2yobaJl1/JyTxLGhzBmVo3NS7
	g+swltnQBwPO+iWO0NB+NlWcOSsvMILTVrlW/A50bOhCSgEU6VGZI+1uGeIANNbhgHywBRecyDPRp
	b7kDxaLnPvJ0SPSpJzwogKMdoUCVjMOB1ki8DYOyXsLnUJU+1SODaTxxSXK9xq9burKUBkuFo3p2X
	cNwAX0u/IuFXW2McF3/gqTekZ5QWEFiHikpljIh3XNQvDwcJAf6+0lyd4KVm+/05qZ+FmdIRJHP7l
	/MvW75iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GZW-0000000BahR-3wao;
	Wed, 09 Sep 2026 11:34:35 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GZL-0000000Bacb-2wcZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:34:25 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d1ddd5d0aso897705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788953662; x=1789558462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDAFJuDlghFFa//FTOTLPnlGuO3PdxiOtfn+DAJGPPw=;
        b=KeHBwie7MNX8OE9rcQPE2F3ExuQi+nkJousQuIH6QxT9tHBAVURGxkyqZi05ZsUd2L
         9uBtL8I4MXwcKXWyHTN4NwO5iZii64IxGYtjMA42vloHlaO/CRZJalS+2dt4RzpSsx0S
         G+aZDBkc4UBnAuR3f2RrKE8FRCi5KxNp7xWyM9r0VudaUNmwgDsMnrRFBA4aSN47Hmdt
         8fqnr/HNDy0UZ5IlFkcPeHc4riZrtAIGpuFejSExdfp/hGF2QN/dFRcIMu1TDrOzO9Rj
         n2NOueBxe8gue7fzA9nuip/P26hKRK/gIQ5cDWb07g9OC1Sz0ZfqSlOyHrAcAW3Ubw27
         rojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953662; x=1789558462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BDAFJuDlghFFa//FTOTLPnlGuO3PdxiOtfn+DAJGPPw=;
        b=kBtJs6by2mIJeiYPxbxbc9GVAJsHdwDSbgOW0ygxbcbdImnXg7ZK/KjQIYBllLgRa9
         A2YNKwEAvDYlmUdsJm732dTWRRTxnkS4EFEfX9wMEeK1rwSxQ1HukgG2gvjYXAS4yNtE
         BB9lVyfrhSQr20ty2aYW2G5zpyU1QDW50uCcuUF25ACKuQ6lenjA4Fgt5OcUynYXDeME
         0CawYTzEkFlxhVvkdaGaKpcJD2jtOATFgu5VWbDTjbHtOlWvYUAJnAQ47qHBe21d/dYV
         RVCFdABwAvSV1JNm66c+QiwskD8RvLRjgU+Cu5MnxRHXDyRkRr+rAvXIANCgu2rBpAVm
         EMdg==
X-Forwarded-Encrypted: i=1; AKwUvBzHPw95Hg4tMtwwlPnEHxwBzhCeHOZl8w0Rd4JXKTaycRXK07HvOFh7vkMgJKGDPy0BIkJS4fN2p4I2Nh12Tsyz@lists.infradead.org
X-Gm-Message-State: AFuF++nrFVhCwnq9Jr/4RKELYle/Nj2h80QEG4KR905G0GAvkZLChsYZ
	rSCAmpFMlfueOIXFMLSrMSEF7hrJNxG1kcBkDttIhjGf1LqNPGoGuL9+
X-Gm-Gg: AYBFou2djBxIyD3j1jEE2k1LKyWI+07Hm3RqYYU+iQlmH9enxF7L9/1+JUm0zg+b8rJ
	PWTe5furGCgc8z+V+fTtvUiaZV+mpk18sA81nPu/XEwqMyll/Uv3NqswDAhWIJ6EQ7gUz8wg/C1
	SysFi6fdZh5ycVa0gvdJkTOeqDhFhkuHiEvCgsxxInVZbxkaEp81NOP5nntGdj8JuL+Mdgk4Od3
	lSPq70MU47tDZJdOITw5wFhRINtt7VYuf/s7ekKd3P5EY1k3HHHKNls1JXATmIsrO8G6XzeEE7l
	uxzdkAoUE7TEO9klg2J4kn3huMvollXsoIUoKvxHdWerzB6akKK/uoZttPxfEMkmLfy38lcszKW
	7uj4sqTsXZMM95z4HAikUYxrxE/fCJ8mhmLuSmnDzQcVurW3GcZyN0WvDwQbzT2IqGd6/4OrD1k
	wx5LNPNAs/zFdwxdINmjotkKx9C/PnQNcTTA7bH3mfROzvLbAyfPNzF4nN2/do0uCsVZz6ujHJS
	7z16KzpE+pw3FiOiP0JmM4vxj/WvrJJ4gLwkHP9Zfs/HVSklcIYKElLbSFEMLfj1O1+8B+MIOEi
	PH4aRW+jmkLRTg==
X-Received: by 2002:a05:600c:8485:b0:499:5b0f:72b with SMTP id 5b1f17b1804b1-49d01dcc32cmr238211625e9.1.1788953661666;
        Wed, 09 Sep 2026 04:34:21 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B836900E58FC5516AABB3E4.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:e58f:c551:6aab:b3e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm364624455e9.8.2026.09.09.04.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:34:21 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: vop2: add COLOR_ENCODING and COLOR_RANGE plane properties
Date: Wed,  9 Sep 2026 13:33:59 +0200
Message-ID: <20260909113400.8295-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260716113024.15357-1-royalnet026@gmail.com>
References: <20260716113024.15357-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_043423_790906_86609DF7 
X-CRM114-Status: GOOD (  12.83  )
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

Gentle ping on this one - it has had no review since July.

I re-checked it against the tree today rather than assuming it still
stands. On drm-misc-next (8ce26b09f652) all five hunks still apply at
their original line numbers, with no offset and no fuzz, and nothing
merged since exposes these properties. So the gap the patch describes is
unchanged: every YUV plane is still converted with the BT.709 limited
range matrix, which is wrong for BT.601 (SD) and BT.2020 content.

One thing worth flagging, since it decides the merge order rather than
the content. Cristian's "drm/rockchip: vop2: Switch to enum
vop_csc_format" (10/14 of the VOP2 series) touches the same two lines of
vop2_setup_csc_mode() that this patch touches. The two changes are
complementary rather than conflicting: that patch tightens the type of
csc_mode and replaces the "csc_mode = false" assignment, while this one
replaces where the value comes from - the hardcoded input_csc is dropped
in favour of the plane's COLOR_ENCODING and COLOR_RANGE. Whichever lands
second needs a small rebase.

I am happy to do that rebase in either direction. If you would rather
have this on top of the VOP2 series, say so and I will send a v2 once it
lands, with vop2_convert_color_encoding() returning enum vop_csc_format
so the two fit together properly.

Thanks,
Igor

