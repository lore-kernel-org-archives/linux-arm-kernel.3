Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4358BCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NgLCYfpgrKXyb0uNcHRkHZoucWvjEkXvo5QPwaDt/k0=; b=CUOXec4S8yMykbkKVTJVA3NCRL
	oDCHZsrBmGv0B7onQEM5UD8AzOclFvWX0wGKmIDJhEUD5RnBf+Kx/VcQmL3YsnKW3Vxd12UQa4KUq
	SV0N6nDVgq3q6HbyuDHSoQWKc0zz6IRy36tfbWPqISTqfCdmKERESlqU49AR5Pu2HGsJjzV5F7Dn4
	DPCpeKngRZF2AJeZkDE0qBkTW9BuDGuoyXT4bt5KhYfp9oR39SyabqcB4xz6dwxqAfHTQvEjjJZWr
	H6jZBK9usNQb9mBiZmJI/SFyMxHUEBsqQlH/6U+XDg1/rKEFvUgKhSn4jDgnQ8iutOU544MogC54a
	yr2DGS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmgh-00000005xag-2GPx;
	Fri, 31 Oct 2025 10:48:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmge-00000005xYE-29dy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:48:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4711b95226dso26243035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761907730; x=1762512530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgLCYfpgrKXyb0uNcHRkHZoucWvjEkXvo5QPwaDt/k0=;
        b=SI8B0czy+yAbKvi0PKzV+ugS2MKOFsD2sWhjfHI0fuBQKkJRDu5qMF2CZxAtUPoJ53
         9nrivpkwuPqfZ26MU7mA6VjCbNBAgP9mpRiWvAxxGUdp78AWZuJG8EPc+6+mvILfA3sZ
         jy1T23BTv91vPJNxkUX4KOm/pP+podpQhLEzUNxFzQ4lVoLUAgdHgfv9wXfYEBLkYLFI
         gTzl8Xau0iYkZJsivjuRy4bendG40a4gljrECZZ8udYRfG9mrNBHIpv0K9LLtpfBjSah
         dZ39GOXHURtd+DoF2ZvrC86PYag12iu9C8aUSpUS3pcsyZiSHkwkDbXGK2m4NydBMok5
         vhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907730; x=1762512530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgLCYfpgrKXyb0uNcHRkHZoucWvjEkXvo5QPwaDt/k0=;
        b=mfasrNRVapwnEykit/WlKrWn84JCT07KG9kpkqvGJuU8xuLWDv98G8pTbt7ps8cJg+
         Rfc3ZeEPJ+/WnorukCQ5Sb1YGAyQrZNmmWFqdWGNwBq5VxIFMB+dWulQlhPc7Uid7VyX
         l6OF9PJkVpwSX7CquabRyRYCAbeLbGoJrM1Ja8l9gnDZC7A5GOYT6SwW0lcel4k4Hreb
         u7WYl4qCW0eDE1yYI1Jgl57l7a6KzNSIqUz8Exiyl8lkKwlwt2KW2pqhMwEiMM4k32uJ
         dijiN0b3tbj99dZWF8fPIoRsI1Xd3ss4cShdTSMAhxo388RlywJCgv1Gx5JuZcb/y2iM
         qPnw==
X-Forwarded-Encrypted: i=1; AJvYcCVz04UnGz8NTGhc16QnHNe/rLAs2a5lVRuXkxowirupOEDiI6EgZY91sYkEkb6I3K0//1ek6+06oV9R4ttms9eF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz35Sd1gzp49LYJkpk1NCfHvSGUMlgk6i0n1VtsOzoSMwfpoCCh
	E725SyP6Jn4GrSvut6ItLlf7yh+uKOL3VyP5rF+YoVVYRjVqfojysMQ+NRjj8VJBjitOo4pc9DN
	VQjc2
X-Gm-Gg: ASbGncuR8wifQ6pm7EjLODL1oq28JFxk1lxRRfWhujDTLnXnoLYoTnCm1guIzsOtrnC
	EL4m1fRSNYe3SX4yt9Icy4bo/o3Dcc8ddjyw6zp17IquHjaTp8r9LQDa+tt5wcs2K+E6vafPeRR
	Mf1f+QRob8rOZfqBprRd8nd6LXCWlEEfxf7qmKaN//lvUzB/C0Jf0qx5CIJNRSybilsz9EOVmy7
	vLu2Qfj3+RCwjr68cDZY8b1/QskTs+vupUhx9ctZmJonHVAmdZC1EOErdGVHdgcv3ZVIxCpr2dB
	EGdK5yDWGdMnlNgyLBNkEZmwLslV2EiFiDhFHvCIYQxLtPotKVFAZr2G2yrkN/JWlxr3FaarOJA
	ivbNrp6iu+SM4GXc2GM/EK8Nkd3aRLVnBMXkg5+m9Iou86ra4pKrok4jee4Ta5eRtTGWbTCRGhX
	H//g4zkaz9Y3kilQbpw/CxRPKZ/HdtQQXPiJo=
X-Google-Smtp-Source: AGHT+IFP987BsDATwy71oQrVgMqL+tPUdk6zXS4vwh+ZuiP9GnPeneDUsTtppOuOWWpaBC8dvT1MnQ==
X-Received: by 2002:a05:600c:3e06:b0:475:dc58:39e5 with SMTP id 5b1f17b1804b1-4773089b541mr26933225e9.27.1761907729944;
        Fri, 31 Oct 2025 03:48:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c102dfd2sm2961635f8f.0.2025.10.31.03.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 03:48:49 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] rename system_wq and system_unbound_wq
Date: Fri, 31 Oct 2025 11:48:44 +0100
Message-ID: <20251031104846.119503-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034852_613147_076937AC 
X-CRM114-Status: GOOD (  15.33  )
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

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an
isolated CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

=== Recent changes to the WQ API ===

The following, address the recent changes in the Workqueue API:

- commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
- commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The old workqueues will be removed in a future release cycle.

=== Introduced Changes by this series ===

1) [P 1-2]  Replace uses of system_wq and system_unbound_wq

    system_wq is a per-CPU workqueue, but his name is not clear.
    system_unbound_wq is to be used when locality is not required.

    Because of that, system_wq has been replaced with system_percpu_wq, and
    system_unbound_wq has been replaced with system_dfl_wq.

	The new wq(s) keep the same old behavior.


Thanks!


Marco Crivellari (2):
  drm/rockchip: replace use of system_unbound_wq with system_dfl_wq
  drm/rockchip: replace use of system_wq with system_percpu_wq

 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.51.0


