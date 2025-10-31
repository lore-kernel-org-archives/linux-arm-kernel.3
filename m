Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89C9CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBWYxLlmhmMlhJEcwlD766MutyyLNrX1V09UkWZeUf4=; b=aFqcrHgODPOcSSmmNLRzWBm0Mt
	TP39QD9pcOYKkjVEPuzS5AOYKJSvq5W3F3uPpp+DTa5K1USTRO7m6XRxOTpdLAD8mK4iUOXfpX0u0
	KWew8V9zhBkIaQ3+Ra4AN6dwIKiwdPWmAHJiJkpd+4xzwSKHMl6+HgNj3rdC4vwfqEbLAm4lujYxq
	1h8oitRnufL4GugZhY37MWzdfxJIzQhgal3OMXdxNF12/EzQF4dxx+h8etNK1+auGKjrLalFFgWU8
	X6uqV7CTEDeM4aG3jiGrsAqkNgazzSd9UfQS5ITDVCr1D93a/dHsedTXubdmWDtj4PtIZllBx/LuC
	AA8uBYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmgo-00000005xdz-2GVb;
	Fri, 31 Oct 2025 10:49:02 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmge-00000005xYT-3ZsY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:48:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-429b72691b4so1874626f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761907731; x=1762512531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBWYxLlmhmMlhJEcwlD766MutyyLNrX1V09UkWZeUf4=;
        b=KYfUBXCiRAAKkU4pWFR7z6d2AKkDMd3BxrIdOh24gFDlz5E9iTHNyuDE72o4FU2XbU
         evzoX3pp7zQPMDKvQ1mnGPJGFij/grvhziV/eRg1MODGjyLBd2xaqHkuF9ZRUnN+dlKM
         mi9Y46GOgUl3hveLaIqg5qAQcJyBaHxoYwnOqMx9xQOhH7q3sI0SEf4Z0v5Z//Q20hYn
         0xrGuqHD7uFjE5CO4SUmXt7Kv7FyGaOsbImU2I5oPO1d9PVaEyU5Fe1Vf5ewdc3Cz5Yp
         MtqT0QauU9PMOtA44Iq2/jlm19MsKwjVG5+WgvTZw1gvQX50u6c7b4qI3NocovwNqVrm
         w1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907731; x=1762512531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBWYxLlmhmMlhJEcwlD766MutyyLNrX1V09UkWZeUf4=;
        b=TCCIiBGW/ZUgy+VYuBtMtPKqxWCrGMH5IGc9/dUeLA0mU19ULxZNIuz4v1OjkEkXli
         yIt+9mw8qVtXuzsRd80S2CjAwIKCY2fGhA2DHUEN39r2hsHLx4fpq0+uyKIN2EyF2Nap
         zVvlEiqvhkgVA0rk9bY+mr3eEAj73wbCJ98P6yyPmwtncXRA4YDuABKY6ocPoeu4wJFx
         NPE9eLZfcY+WhZDRJdrIgiLr+Og7mu1bWPhV1XFOOJTazeHJUqAPSdbzUCEZbftRLCKC
         oUjYG+K8BRgmoqizSAoyZ1EAq3WEhMRBDaupRLcaorn6d516UTOTIAmluS/mlaVCmzS4
         qTRA==
X-Forwarded-Encrypted: i=1; AJvYcCUWsNltsBBxq1kkWxdwdYpxKlo3RpKGwup5Fq4paVclGLDGRj7xiPFqNO+6y5jXuLBG6C7BnUx0puaEijv+JNpT@lists.infradead.org
X-Gm-Message-State: AOJu0YzH9P8hpzCEMI8Cid9tw9RLeBVDWRChCqvFqJ038pm+oPaLGYn/
	YsBsx5PJvfZBtx0KgOJiJEaK40Grsrh/XZr5C3Kc/xUJ0bwbkGK4uXfBtjnAefDzX58=
X-Gm-Gg: ASbGnctcsSN489d7l8yphBQrgfr8/DQINZEuXfa+WckN6qURUra3rwTiMmj5Fati0d0
	c49/uXadMhpYQYam2N6Xb31MGFVjZXvNfAIID1s9I1ncw3EBXGD/0HHNqcuP1aeBAAZm0n17nmO
	G97XJqHgkPE3sT9HLHXH3drRKqdsRlu2G7mS0TkergEJb6gEvk6ga4mwBq5a3kMlUKBstX38ixM
	qNGEHLMmPvd14wL/BnPqCWodvklDfA5T/1Mvv1J1hPTVeH1WawgIUtbJQX05KVtMZVRMoXfwtES
	jsaoPYq5qTGledKB4sANCTFrKo6wMwxtTIO2OPQJ1+rqCcMggjtHA7v/1fXfkHAstLrLImcglLe
	jrei8ju/oMtNkWOl2xW8qktj21veMgTu/MKcPNa2xZxNSTx7rQOzkyC0vteLs01xew5BGxgNiCd
	PQJEpaqg/dnHgSGp3UvxHvnytI/nWzvb26f5M=
X-Google-Smtp-Source: AGHT+IFXAzHg/iq6w+vdzj/m/7FqAE/8oRdJB9oVXLVeXcIgN+TApftuVAX0hFowdEb6GbjwPbphjQ==
X-Received: by 2002:a05:6000:2407:b0:428:3f7c:bcf3 with SMTP id ffacd0b85a97d-429bd6bf68emr2653726f8f.49.1761907731032;
        Fri, 31 Oct 2025 03:48:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c102dfd2sm2961635f8f.0.2025.10.31.03.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 03:48:50 -0700 (PDT)
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
Subject: [PATCH 1/2] drm/rockchip: replace use of system_unbound_wq with system_dfl_wq
Date: Fri, 31 Oct 2025 11:48:45 +0100
Message-ID: <20251031104846.119503-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031104846.119503-1-marco.crivellari@suse.com>
References: <20251031104846.119503-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034852_927681_3D6C3807 
X-CRM114-Status: GOOD (  15.06  )
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index ba6b0528d1e5..18393c8671eb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1770,7 +1770,7 @@ static void vop_handle_vblank(struct vop *vop)
 	spin_unlock(&drm->event_lock);
 
 	if (test_and_clear_bit(VOP_PENDING_FB_UNREF, &vop->pending))
-		drm_flip_work_commit(&vop->fb_unref_work, system_unbound_wq);
+		drm_flip_work_commit(&vop->fb_unref_work, system_dfl_wq);
 }
 
 static irqreturn_t vop_isr(int irq, void *data)
-- 
2.51.0


