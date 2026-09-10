Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D1CC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdfNZLHoTwaSRGbzkk1xRxTbtBIxs9oY1WLjA5lMVdw=; b=LXa88dc+XbhyBFRNiKnF9YAKrn
	s52OpgwEYAPgvNtc1UmfBgH+PlJpd3p+jUjAaVaIJkp4wfNsi7IKZJAG/1I3xpfZv2MkLPnnxMzNc
	XPcvY7mMljvWpnN2M4bMD406R+ZWw6FENLbEDsp1AfQDgUc1S0TezhSp9HXwff4rfwrqOgNfWLBtV
	0z8YFSjwsLJOjr+NJ+WtGMHoaQZe8lNLR79JiFxAZbol6mkHap+EOraPScsqmEoxoNyWz4hhFOMPM
	lONqwYAdNnb3VDhULciPf/YKj7HS3MfWLzAqaLKwKM49r0d7p+ASBug27BFuce4H/jLr45RdMttJe
	gYlWLspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ex2-0000000EVRF-2CYN;
	Thu, 10 Sep 2026 13:36:28 +0000
Received: from mail-wm2-f12.google.com ([74.125.225.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewz-0000000EVMk-3lPr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:36:27 +0000
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b93204449so4250895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 06:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789047384; x=1789652184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdfNZLHoTwaSRGbzkk1xRxTbtBIxs9oY1WLjA5lMVdw=;
        b=oNmRPG3MnXHCeOxYDpwGahoEw96XJwRqKec2cCl4567ZEg6PQ44t5/CYltyXktQZF2
         jG1WV9Uc589yA4bQ63Po2jSR6RJS72b5FCF+qJox7tUO8f/JW9cx12WF64S/5V6pfHTe
         iyMItgEJEG04LhSTWQbw6HbJs5sxOidnKGU5JiToHPcroi3JvUHvYYf+KeGOR8KYT0jO
         F/TNbUaKb7EalleUWz1JG1+5+NOxAufBR5m7rCPLtWzqZ0iNs/GT7Ug/rsJz7YKloQUS
         M+AM/u0VnAb4rWvyRiwLNhsFcfnJLfS9yqlyFhbMHFD6Y7NOtQYbUg0fbXT4TyJTHvHg
         Euew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047384; x=1789652184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdfNZLHoTwaSRGbzkk1xRxTbtBIxs9oY1WLjA5lMVdw=;
        b=VAUjZ8X37Gdf7jMGP71lpcZuntirQTvlfOSiEyeFgzzKo5MAoUx/80MiJTrViojiw5
         t7BR+V07qW/GNLzOyojB4v4mqyalLZLMXa3vD9AtTi8m+ra1Ocz+41oW0sbB0y9tLNuZ
         6myoH27bB2ocnFO9D7izvx77IVGC8cWSAMYt34hOgOIu8o2PakDvOXKSH9WZlI56TLTM
         MvqCj0XuLM1tfFTFhraLxIfA2Emrcr4btqViVcGsHsgb34wPgcqRCEi7TsFfku8raeJX
         KDyhZ2zDe0YtD3wvkwH+dRp5uAgiC+OBkIPiLYyrlY37s1vudgb+Ns7ICiJ81Mjjd/Zp
         59lg==
X-Forwarded-Encrypted: i=1; AKwUvBx6mJWs4hOV1WUrFbXj62Mni+KUZ64j9gHQJtk6hbBZp1yQ7CVAH7+ictkK0D+nznf7zaoOIR5OrxF+Z+2CFNMr@lists.infradead.org
X-Gm-Message-State: AFuF++k2vvNr3UTd7gY1XIBfDfN9zxZf/iqXO6OXbs78r5Dd6BeFSy2N
	BTxTKw/z02DYqJqIHquuP/Ke6B2Gd6RY4MEdm0jcmPIKYqGTGvtlqxZy
X-Gm-Gg: AYBFou1UuJG3D1eKj9GphLzcS9cB9hXap682ieP2YJDW6bTK+17rYgyRFUImzxNfVlN
	fQBrm4qv/ei08c6TYbl/hZZZ12pBvAA3OdpzhNdpirp7D3GIEBGUTMX423k+PJbOoeQgF3Qkhym
	qmMq8kXQo9aBay7NIbU56UAINKWfd0tXJDAu3LZeoQjEYHkJG3aHGu2w5LLDLZZXkQFXcc8rbBG
	pkiz7S+9uWo80KJHRnEiDVoDhpT++SDi+ypB7UDO0rjrwBC4LogFwH+ufn/wYg0HIumninyN5n6
	lke+mBbCknGz9b4kgC16JxMSWBg0GEBf6LkJjak60E7r1wmFSyMSWu1RHZGlHivVwzKIPym+Fd7
	Dk7i5w+4V6hT3Eu6012hwiFLB4eK4Gos8GAyA3bWcZxSkqYmlOjJcpv5igYBDrLA+AYHDZt+vTI
	N2Al/MZhEb4rkQIVzLNa0UPAodUJ+skfRPEG2R/Zr3bihHaCn9nCwaMkRTP28UPjAorGty+j24L
	RlAnpBuyrOakSUme6E934fouNi6dZMEZlp8kav9dmDrzZr3dGkddvGIpboX59Mw58FTVO0J+pKL
	hIh7S9+8P68uM1I=
X-Received: by 2002:a05:600c:530d:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49d01dce86fmr310949945e9.1.1789047383351;
        Thu, 10 Sep 2026 06:36:23 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B914600506D8644FC6130D5.dsl.pool.telekom.hu. [2001:4c4e:1b91:4600:506d:8644:fc61:30d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm77721735e9.1.2026.09.10.06.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:36:22 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Owen <support@armdesigner.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/rockchip: vop2: Scale the AXI clock to the bandwidth the mode needs
Date: Thu, 10 Sep 2026 15:36:02 +0200
Message-ID: <20260910133603.8993-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910132156.07D6B1F000FF@smtp.kernel.org>
References: <20260910132156.07D6B1F000FF@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_063625_961989_CE6DD23B 
X-CRM114-Status: GOOD (  12.39  )
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

On 9/10/26 15:21, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does calling drm_crtc_commit_wait() here cause a kernel warning or potential
> deadlock?
>
> According to the DRM Subsystem Details, drm_atomic_helper_commit_tail()
> and its variants execute in atomic context where sleeping is forbidden.

Both findings rest on that premise, and it does not hold.  The commit
tail runs in process context: drm_atomic_helper_commit() calls
commit_tail() on the caller's stack for a blocking commit and queues it
on a workqueue for a nonblocking one.  commit_tail() then calls
drm_atomic_helper_wait_for_fences() and
drm_atomic_helper_wait_for_dependencies() - three loops of
drm_crtc_commit_wait(), the very function flagged here - immediately
before the ->atomic_commit_tail hook.  The default hooks block in
drm_atomic_helper_wait_for_vblanks(), and the CRTC atomic_enable and
atomic_disable helpers run inside them.

The wait itself is what the core asks for.  From the drm_private_obj
documentation in drm_atomic.h: "Drivers should store (and get a
reference to) the &drm_crtc_commit structure in our private state in
&drm_mode_config_helper_funcs.atomic_commit_setup, and then wait for
that commit to complete as the first step of
&drm_mode_config_helper_funcs.atomic_commit_tail, similar to
drm_atomic_helper_wait_for_dependencies()."  vc4_atomic_commit_tail()
does exactly that, followed by clk_set_min_rate(), which takes the same
clk prepare_lock as clk_set_rate().  The wait is on the previous
commits' drm_crtc_commit, never on the current one, so it cannot wait
on itself.

The pre-existing note answers itself: vop2_crtc_atomic_disable() is
called from that same commit tail, and the @atomic_commit_tail
documentation says "When disabling a CRTC this hook _must_ stall for
the commit to complete."  It also calls clk_set_parent() and
clk_disable_unprepare() there, unchanged.

I suspect the two senses of "atomic" got conflated: an atomic commit is
an all-or-nothing modeset update, not in_atomic() context.  There is no
might_sleep() or context restriction on this path.

Thanks,
Igor

