Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42528FD9E34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 03:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lm2AcOtnsuA4yjZovdWg5px8aIMhZ3rKhw+QF/SygYI=; b=3VCa5vJ0vUrDPQkVix+dFCF1kv
	wdYkg8hghu6MNeU3VQ4V/4WSXjJIyWGR85zrmX96lhczZkhWR//wpiU8z3xogOdy/WVClJgUWOEWm
	RDMVwTqBVGZycren7zHFZyTH+Pf8YwHvEmVmjj15q39IAGqnlcM5UNQ6mYJCBncKnlToG7daO8W4s
	1QCEavelBIfw+oTyvumEwLg7ecl5JmVV0bUqrPTJbql7L2bhHxieP45PWlQ5QqjU+GqypQx91lJcU
	5DSfhvbRyGiE89LesxpXEKOgr/YxAnkoO17WhgSHdWk6MLVVb5P8TWmG+D2Uyc9hFIMrOEjkOnpLq
	jEn1gbEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoUh-00000007bBo-46Hy;
	Fri, 27 Feb 2026 03:26:23 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoUe-00000007bBC-47BZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 03:26:22 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-358e16d7da4so963943a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 19:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772162779; x=1772767579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm2AcOtnsuA4yjZovdWg5px8aIMhZ3rKhw+QF/SygYI=;
        b=NzPyoSr62bRF2LyIQiyeMYtGEkM3s5UsOHYVmUMrxtavSyzX0Vpz8iNzlym8tOuWM+
         eA4BI7uZM/FXYBL1QqbIY6jvCdqj6+S9zEOZtY+t2t9xKjE0YsZCp50pf+V+Df6e2FD3
         XhRvTUYwAtlJmeQhvF0174rwrHotwz8h5p+oW/RyQ8hF09DammEv0uDebcQCbp5a2IBx
         /IPsIoSvjARE2jUR3LBcRM3JG/tqNyRW2bShiXFYPQkI57E5T55RCtPO2TGutVpMLi6K
         oab3+6m6bi9VenDSbOD815fx58f6DQ5CYZAH0vgKizp8iZMZ8oq8YE+MiFNTn4NDKAdj
         uhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772162779; x=1772767579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lm2AcOtnsuA4yjZovdWg5px8aIMhZ3rKhw+QF/SygYI=;
        b=BwmNkVd4X28b1MTDFCWwzbz+MfcAgxGl0GmR0HkYzYwsyrI+I1B/oZp1n2UBMBYHXN
         M8RWk6UI48HHVxsiqqBNBc8pob7UMw6EnCiSaY2FpV0ptsCP87snO9tega1Bk6eQ7JMU
         2Gl2hA6b7v29+sVFGgsv1cQmoRi+fJg+vkiqz/1jgJIdeHUPoErIRQ2Ug5pmJHhiB/JR
         6IOpOsCRd5VkgxYD5kePd0+NO7BwSnTSIKugHHwXAi70Bj8kSC+aTuVVZrA2ALMejTN5
         S8qpn1qqtTw2Exfm2zHkSDEpj3O76R5xKkPzPGfb/U1zKTJyORM4QeHHdV92ICeazNSw
         zS1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWt868bEq1wafcqDiIod6QkWnHuJQKb5uimLE7gSZBuLCvZQNQPV81bdt4fZKpf9YjrMmD05x5Ma0QjdxBT1uJr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7G2ajdzBVb62Hq8mO2HKLhQ6RSXnVX+79f8+RFTUV+1NgvgJM
	u8S300BdIuS4RZPpimc8de39kpq+SBKv+3Rydsy6kN8VeU0EO10g7oBV
X-Gm-Gg: ATEYQzx4B6YOiaAtCm4CUi6hRuu95AtC9K84CYXtoSDgCnHyQuXRL5WYgfGVkPx/9/n
	YVQWPMtEpV/ZX2+7WRMWSSyFEjWTxmzuQL/wBCbERjTPlOklEu9m9DreosyZtOPVsG03YlJ/Geo
	q9E2pYWfWT7fdJJ/fD+TmyQ2kc+xmKVDhgut8NyGphEAwJi3WmP/8MX+nnCOd1leYwv1J2prACH
	TzEz14p8s28O33yNAOAYctRSzXWzsUkKCxf0z6RLIS3PYgrQNMLP77tGEDaFL1VFDxq81opbajC
	VqZ+yP5XAeL0s7E9mI/ki8i3IlmrxQ6DE/QqMEACJyI0eYDXmseagr9tr7+Rusa8ywxBNyEqtno
	P0CqAP5/sJ0Sz4eVDK2DvAdB5updE9ekHECmn1gR7vWxacPVoXbnPfj5DsmSX8d8hUIgVzi/mPC
	DyueWw69vMMYB5feV4336kUM9GGsKhv5Fy2fqleQlho9K5wtXBtg==
X-Received: by 2002:a17:90b:1d4e:b0:354:999f:1b27 with SMTP id 98e67ed59e1d1-35965ce1427mr1089567a91.31.1772162779536;
        Thu, 26 Feb 2026 19:26:19 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fbc363sm4501887a91.2.2026.02.26.19.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 19:26:19 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.12.y 0/3] drm/exynos: vidi: fix various memory corruption bugs
Date: Fri, 27 Feb 2026 12:26:12 +0900
Message-Id: <20260227032615.108139-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_192621_021642_426570E2 
X-CRM114-Status: UNSURE (   9.03  )
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

This backport patch is for 6.12.y only and fixes a bug in the
Exynos VIDI driver.

https://lore.kernel.org/all/20260119082553.195181-1-aha310510@gmail.com/

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 64 insertions(+), 11 deletions(-)

