Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB61CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+vEPXI04svoj/TPQoMDMvMjQE07Pe85gfjZdNXuHCs=; b=VGaIWbyUW8WzciWicQ8d/qacEH
	bhcYnoJR+PldQZM06hNl2bPRAq5O84YLMuyXatshARg6u85LUko+vnOXE7WY7kw5wB+Q6MPqIErF1
	ncn1M431QV9pO37DfBbnSOfbBt3cXoFMEqiHDFmLyWWVa9GXKAS9Lj9fbMjlwvzlMRbklYG8fmmCQ
	p4zB6yzfpNfxgPtMOQtpx01G8FeGjpVsSUCjYG9KKnpm14Bc0luWLBP5NhVYV0gt92+bvVxkPK/+D
	qDG69wH06KTUOqDrOsZyRz3i1Rh5zmo5C72yT4ZVttx6wLwHjzcCWMVCixz7v44fI+rALklJdWJgS
	ZR72sPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMo4-0000000GLuv-3Pri;
	Fri, 05 Sep 2025 03:08:08 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMdT-0000000GIMO-02QE;
	Fri, 05 Sep 2025 02:57:12 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-327f87275d4so1834083a91.1;
        Thu, 04 Sep 2025 19:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757041030; x=1757645830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+vEPXI04svoj/TPQoMDMvMjQE07Pe85gfjZdNXuHCs=;
        b=B6AiVYRRZloNikZ9pa819FW4GQp10C/mNcV9QMpEAOOfupg66lxemx+s6lqBx+/a1h
         hs2pS34hVi7o4uydzjjsX+FKBXwZ5ffe/xn/jYyB6ASYW1k7zYd8ISwUAzZ/6HMwJOGz
         A7OCn/CmHu2cHBBtuM7YAES7DkJEijfrH4h/dv3t0FyYBPlXsGPl0zzYl9TPF2FDXd2O
         uGqovaUYP/DsRAzIiL98e/gprfzaRZUB+jYvEq3Fcv5CSBaHuzck4+I8FJ1KQ4DGu8fn
         KUgxYXWDeF0UIRnWPLt4PML/ntxbLw7L0HOgBj8IcX5PhUdyT32+4582ZwU/X5gDARUZ
         kKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757041030; x=1757645830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+vEPXI04svoj/TPQoMDMvMjQE07Pe85gfjZdNXuHCs=;
        b=wb39SP7ilHOiQ4MdQDvOe6/MbJtKm7bMXsq2zT7oHVe5DahqRIQcI+lBW0BZ5dT3Zm
         jdwTiKpSCYr4MFcqCgp1uejqB182uKOPL2gh3+ujiXuF1QDGNu9dKo5O8KTFXLODpnul
         o2pRTONMOjk7tajBeQRKaHPCcX/hLzvxUNdUolj5QMBrXz8W9A4OW8WuMUNes2ndif/6
         dB97tpTDeyvCJq3cd55gYoeALHYdz6uNcfAe3ZsjNYJ9EObKKWqdTjwWv/Bj9QuojgpO
         vgckxDv/Wti7B5+/B9Z5YiYk/Z/ryCzDHDcr8xYzmBxz7tF5yU1ScQlj0vfVSc/GmwkA
         NvsA==
X-Forwarded-Encrypted: i=1; AJvYcCWz+tLmMYDnvM3CwuYsLlp63HRCpfNdDasD2et01Ljr5LzLXUNjf19riSiX4baxHoKWgoaJ9JoZ5UWUbR3BI5oS@lists.infradead.org, AJvYcCXNMX2EVHxUtmxnowDlTQWmOIcrCQ3MtF/5Zm+X0GOTqZR9cm25muxgeZJnbJK+qMEeVNjtAO3jv28E49ui5aM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu8BklnleMwNS/Hnff9UxOlqPn6Wy2JRWmiHW8S0O3PDcy6PF0
	krXi3KIJKC/4buku7FD0AE+xQJSjAXxNvtK+SstC5iuC6ifykU9zljzjpBIV7s09wnkLy7lT
X-Gm-Gg: ASbGnctRtVmkWKC/YE3Kvo0/O/9pUqBLF+2yyrMDqTFGNpxNBysLzTPJxD6iL24etgp
	sw/RNO9WMafA2/ChAOk4E10TSfr08a9cAhIEvoQBNFq8Uks+tNzQytFK9S3AnEmauLRFaTeknaO
	6nMhCZWmHY0xYW6HpD0Egk0kanRSQhFe4mbC7yw8i64zqCwLsjpRm6pS4FI6QadT7I9Jh1vlLRj
	CHzZCuO+OnsUMkw/Bl0bkq+cBUxzpwIs/48BNAR/oD1SiyQ7jrZzgZPQnsCtZsmGFfhjBn99mYh
	WQK2LFh3KiGoPDE8Cfy3PGekLxWLyFJlTHN0XaAuKqD9gKnpy+z1GEio4G99ik5tZMdwtEFzhgm
	HKedUxd4JvMKVd8cTgPA8RQ==
X-Google-Smtp-Source: AGHT+IFkmAyWcJVzJ2B7y3qrndQMgDDJvZm3A1yDr1lqvIEQmgIrw1QL0xkk2uepzv9vjXk3lvsWHQ==
X-Received: by 2002:a17:90b:5190:b0:321:6e1a:1b70 with SMTP id 98e67ed59e1d1-3281531fb79mr27225069a91.0.1757041030189;
        Thu, 04 Sep 2025 19:57:10 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e1c8e07bsm9428588a91.4.2025.09.04.19.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:57:09 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v2 3/8] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
Date: Fri,  5 Sep 2025 10:56:27 +0800
Message-Id: <20250905025632.222422-4-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250905025632.222422-1-cn.liweihao@gmail.com>
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_195711_045607_26F19097 
X-CRM114-Status: UNSURE (   8.30  )
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

Add a clock id for mipi dsi reference clock, mipi dsi node used it.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 include/dt-bindings/clock/rk3368-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindings/clock/rk3368-cru.h
index ebae3cbf8..b951e2906 100644
--- a/include/dt-bindings/clock/rk3368-cru.h
+++ b/include/dt-bindings/clock/rk3368-cru.h
@@ -72,6 +72,7 @@
 #define SCLK_SFC		126
 #define SCLK_MAC		127
 #define SCLK_MACREF_OUT		128
+#define SCLK_MIPIDSI_24M	129
 #define SCLK_TIMER10		133
 #define SCLK_TIMER11		134
 #define SCLK_TIMER12		135
-- 
2.39.5


