Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B2FCEACE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 23:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mWX8nC+37T8o/o9eBw0iWWeRw7fTn1ANfKhrAv+Gm0=; b=FuHr4yWm4Agm5ms1rKpeZf+0iW
	FKaNC1OD0TlwnOrCFCxO9sCoiCGlG1tzhi8/4QKE7gfCkTfrGtgzf/fpYa/FD+QfWHhChEqR+tSJn
	wQF8me9IUHM/zL9ZzsGY0f3dT4xNpP3e4V6/kqUDgOppK1xbjXd6tCd+Se9IxN1cyfnM3GzDTn98Z
	byDeX3aKLKqgGdiIKBtG9Std8UBh8zckRfLCaH6De+lqrM2XHULhLLDdIQRZAStH3YY5giAjX9iqv
	bXtHl3V6+eGVjAPDEbSt2nWI+TZ3ug/5Fs4P+1j4w36LcGgjEFzVRZxRbSQVtT15wUrH5nC0tuPuj
	kwXrqfOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK2qK-0000000DBkp-0b6n;
	Fri, 14 Nov 2025 23:04:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK2qG-0000000DBjj-2Ozv;
	Fri, 14 Nov 2025 23:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4mWX8nC+37T8o/o9eBw0iWWeRw7fTn1ANfKhrAv+Gm0=; b=MYGhofmkfT/U809Ya9KFWAbHa8
	ge18PeJ0KuqiWYOflhpoSTsy3BU3Y6rIL37dd5p0qHjXMGuiGOKuOLq/zz9QUXsKTYe6zd5xOerbv
	5Vd4+uer1CimtHVE3CX7WB2c9/eAaxtTH+s6DP6u22oqVdjHhEhlrgRPsbwHe/i2U+QXrC0MkhaDn
	nBcjGDY4mjw84+9a3FcOJQBSSNRjdOIZQqX2mPhJc9uFrWR/FJo7bzwuhA0k45lN1PZHfoMnF7iLL
	jb2jvbHrbmv4WieYVnYDa51UT85x0ctm1Jx2HLUo9IUj4saOmwj2oYMFQBxZ8IY1DnHaiiyGLjOp8
	Gy3ZhGwQ==;
Received: from i53875ae8.versanet.de ([83.135.90.232] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vK2pw-0008IQ-D5; Sat, 15 Nov 2025 00:04:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/rockchip: analogix_dp: Use dev_err_probe() instead of DRM_DEV_ERROR() during probing
Date: Sat, 15 Nov 2025 00:04:07 +0100
Message-ID: <176316144241.624283.9273184537372082996.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251110075817.1159857-1-damon.ding@rock-chips.com>
References: <20251110075817.1159857-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_150432_612602_B3B5F079 
X-CRM114-Status: UNSURE (   9.07  )
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


On Mon, 10 Nov 2025 15:58:17 +0800, Damon Ding wrote:
> The DRM_DEV_ERROR() has been deprecated, and use dev_err_probe()
> can be better. The other reason is that dev_err_probe() help avoid
> unexpected repeated err logs during defered probing.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: analogix_dp: Use dev_err_probe() instead of DRM_DEV_ERROR() during probing
      commit: 836b5e9c6dbd5e5ab82d0a153483048e355a79c1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

