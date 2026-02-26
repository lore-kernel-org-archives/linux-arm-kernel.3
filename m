Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AEDFD8FD7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 16:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VQsc8cJztTF76PG4R+gL+xvTB4Nt8EQAhsB9W1n8IoE=; b=MqLEyFc/NP8DFkXlJSy3gp2N++
	L1+BwOBnOblG/AhQ1QkmLDzJVveTWkzCZKHSMXedRr5pRonZq2lMRgybVsVdqHjUFfm+AE1iN3sog
	QEg71fYWoVXIvkiivj5o9XEX+tQP63UTWByBRE/JKHLC/V/GbOQ4tFCUdgbT1xQJccZXcXSZpQf/d
	ZsJcNqp5d0A0XOY64B0GEDUPl/MBOt03pnQVO4QD+/OiqHzqY3JLh0Gwm53rj+rsXCnZFyRqwAwbr
	IVbDjoC6s4ygINrweavPTp9G+9kcpPHHoKs3OIxUck/ht94VqK9N9xSMvEFSnB4nVZVe/b1auAmDD
	zRdOIPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vveOB-00000006kvC-2ofJ;
	Thu, 26 Feb 2026 16:38:59 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vveO9-00000006kuW-0Drk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 16:38:58 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-798374d0f44so31554637b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 08:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772123935; x=1772728735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQsc8cJztTF76PG4R+gL+xvTB4Nt8EQAhsB9W1n8IoE=;
        b=bjO723KE2j1hZqrME1k/VmKKRsR+RNtFoSiwfFp/C1TPc58TriL0HC1pk+NDhIgSle
         pFM6C0iprcT8aAfGzP7oMlTZWsZx7B87taAo1fRxyWDBc6K+yt6zvMQ+xgEZ+mgzcBTT
         zD95mmWHiUJoOolobCwrGFz2V+Y3mj1Pr4r1puHDuxOuWjYrMZkXMdB8lyk6Um2AIOxG
         l0qs93+UDhWNnfKYFc8orzUSGcoMO8Iqeb0zCuEZUdxPFFNtc31F8nJmf2Qq7LFlkKNK
         a4/V+vU5nxLLPD0uOJWM8L6oFrU9ByTdZQdCnrlYW992Safs192+9P+3G4mhK5nBTEYx
         VCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772123935; x=1772728735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQsc8cJztTF76PG4R+gL+xvTB4Nt8EQAhsB9W1n8IoE=;
        b=OjY3X8glv/eFkn6QwaTtrZAgDsyLKscEA2Ml+ZXDX/S/qYuwyI5iwGIhL+08CaEg7S
         HpiuFGh7QWl9uipUEw+JLVmqwk3vO4p5KpvlzX0kdVSjmn8o7L8IipMNCS0LQYUz6ysd
         PQJxNqUSJkhS1XmYBZMyk3njneJqPKS7n0yfmd25eMo7b8fRn9VnkraeZz+53aCqSzwm
         F2yrlVotryU7Vrzk4SZ+nUhV83Cmelv/krSIlATqZji+lpyewkQLYvZgdBJR9ikU7URZ
         RPUyn+QrRMyARiyZhB5kTrtSIHGQGJxdPZ5f0BPWcalLzw7FNo58O+0Cwq75CKf4hY67
         baXg==
X-Forwarded-Encrypted: i=1; AJvYcCXAZeuHoRj/jXbM/ysBmrnWbrFa43v+AJxykrkwqK8g2/nL4CA2PxV4QFn78MDCZXxwkSmODfrebDXuKvPNbsxu@lists.infradead.org
X-Gm-Message-State: AOJu0YyBSOWPRfRForvqazJcnLZXqK55/tpG+ZuSl3DwBOfCKNykOyJ3
	Math4MeCSXt1VfTXgOBN5aWmmk/NltAQ+X+hop3ElPc8Ev4nzoMZzGeQAP3i2HKPFww=
X-Gm-Gg: ATEYQzxUSN9/8giZNzrSrAZuYBTTmrbyaFMNrqxY/r7qp6Wc0uqTM/vSJVz2OKr2ASu
	jJnC3oagdwszKkIpT+DnJ1RdgKW94oPDR7QEQf3tvR9KB1/VdLE0kUHV1l7vF6YXaci204rFUPB
	jqaEA569d2LWswty/ep3MPhZMPRBrgpXhJ6CXkK+9YLoAx2+IrtJsUFlTLZlDKJcTx5F9EYKs9x
	ooyyOIpRXyZo5dRgR44X+KVhghCMS5mkfOIRgV8tKUeFOV3XgLuS4BxKN518+3QZc4QYRiAmqlw
	wSvzL/39OZ8dHiDzzIQJ2osv0+SV/qREd5JeyJGoh7kcnySdWb1k8Few932D+5gDZU0wUCHJaWL
	RbDoBTTXbjfMKGTEK6Uh/nDAfRPwNbWZm5TNHaZdlJalxL5S2WYQqohtdLnn+ZQFUBo3N661qfc
	b0GazKQYpTre/X91HapMPRmIAPYV0v5KyqmfNMGYEWBKBNvfpNy5dQ/CNu6X1YQorAkp0yi42mK
	25RU2AuIu6AxIdajSl2bdC9
X-Received: by 2002:a05:690e:4492:b0:63f:96d7:a369 with SMTP id 956f58d0204a3-64cb6f19ad3mr2308595d50.28.1772123935319;
        Thu, 26 Feb 2026 08:38:55 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb74b985asm1150803d50.0.2026.02.26.08.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:38:55 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: wens@kernel.org,
	mripard@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] drm/sun4i: Fix resource leaks
Date: Thu, 26 Feb 2026 10:38:36 -0600
Message-ID: <20260226163836.10335-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_083857_094390_672475A7 
X-CRM114-Status: GOOD (  11.24  )
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

Three clocks are not being released in devm_regmap_init_mmio() error
path.

Add proper goto and set ret to the error code.

Fixes: 8270249fbeaf0 ("drm/sun4i: backend: Create regmap after access is possible")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 6391bdc94a5c..e989f75c09b7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -881,7 +881,8 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 						     &sun4i_backend_regmap_config);
 	if (IS_ERR(backend->engine.regs)) {
 		dev_err(dev, "Couldn't create the backend regmap\n");
-		return PTR_ERR(backend->engine.regs);
+		ret = PTR_ERR(backend->engine.regs);
+		goto err_disable_ram_clk;
 	}
 
 	list_add_tail(&backend->engine.list, &drv->engine_list);
-- 
2.53.0


