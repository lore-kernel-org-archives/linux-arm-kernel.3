Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96167C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K96TP7RufWR0A5oYw5jAf7HfaOkuZ/rMipxLAIxdi/A=; b=HZoQuS2S2ZTn8QBVhNgk0oOsdr
	fjTSOkJ9iVEjkdy+E6r+b1fihHRWWJ2LniD2fU8cqvogq4m3ph3bz3VjOM+x6aZPvdejfOLeQLwIX
	KZzQstB744EnmUqvFZnRwYv4t52Z6UyNUHkP+Z/zSXiJ21i1TAO68FXhUkuKQ0bewXQX3s+n6KIF5
	7D5RLwHoeAujgxz6uFldQs+9fVpmrUUI6ak2E+VhAAvG9Zmn/qfwlJtOnA96Tmy+/EjLE+3lLJPV3
	Pq+drwTONzsSze8nP5CPoWCQxOIO20IApQl7Xgl3ZrtaCYWAAQr1QuEru4SFnjvf5tjYlwbtObyYq
	NaIt1BWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnfa-00000001a23-10Ar;
	Fri, 02 May 2025 10:31:02 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnCj-00000001SpD-37b9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:01:15 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac339f53df9so391408766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 03:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180072; x=1746784872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K96TP7RufWR0A5oYw5jAf7HfaOkuZ/rMipxLAIxdi/A=;
        b=A+ZcRHjwTmbIZtzxFZYnJmyVekAaOZG5B15Vo5lprEaOZlqx6jyp2jTXXJDr9ZWrmg
         Nv7ISN9BIhi+cWf6Pw5J1AGZ5RcYYmANlDDp2pEEEZ7cQ0SWvGmlifJB2GR+hnuhJojR
         XMjnBc5+ZspoGHgbGhLCNF/0il1ssGsVGqFudV88YHeXU4p1OafQgGBNBJ/saXcUNhXF
         daku5aabicYtGgU05lYEOiU+ERr4IBIVsd5GJCHWcIT/FGWALw92sHWOGkxtKVlqBG2Z
         H06e3zFJSR2+iUbDvoirsdSGuM9DteRJ1qkdMVEj+0ZnaZ8EXHVJnwtBqJfVlG3kwxxX
         jxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180072; x=1746784872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K96TP7RufWR0A5oYw5jAf7HfaOkuZ/rMipxLAIxdi/A=;
        b=gxhaEql+aJaI1Sj1OrisVtNC7tj6ZKheP4j6RAbb1ZrMpN9P+hQoophLo0KGErUWe8
         IR8zOngPwLOoRuLy8dU+DPuChkTN+WJM30bVA80nD6xNnaqNgPvc2mjQAtl1VeSg9xGE
         tYY3O+qBfr0YJWJ5eWoQf2/gAO1iVuoi1SUKmHADLfdQaF8349JYYR9a5DF/C/glVRAX
         M4pSvSv2XZqoTUvoYZ4PBLjQC3FYs+vf0qlTpnO9U0pyUUhKAEOvqD2/N9P/ebr+ABMF
         YkNgddp5TX2+CbCxG6hEuj1bwRwsY91SAhXJkINc+Ghvavu43yBudi3TcTzSodcvPhVi
         0LsA==
X-Forwarded-Encrypted: i=1; AJvYcCUsCaA7hrWF53OhHdiVg/SjZc9Jj9ymrmt5Tg0NpG8kRdv75LxyzctWoobDZ7WxP2alLMH7woDZguEvoeQFxlnY@lists.infradead.org
X-Gm-Message-State: AOJu0YzO3UjSDCAOtsRsnAMNpXekrIiJirUA6owww1PpFBJW4bc5tEYe
	l9fE0xqIMsAgSL3b97gDVhoc2JeIaGmSL7avFklO4IUVl9t+p6Pj6Rbu7JmNV14=
X-Gm-Gg: ASbGncsuCyNgiv58njf9txasJNUVF1UiK+B7Y2+4IeXdMTYYl1akAdXptODZN4Jbx4j
	TuV5PW3VTjFFJN1tw8YoAwXXyZQbZYrQ7f2NvcI6bDvQKj5+OrKxmSYC17OXkkye6XU2ezKUI1o
	2XnqLrBF25c2O0ld0N+m3VgjGTVg1FfIy3OCz3d5uIzLG2eE/rvaTia5ERWt0eCkmefaNjotUR0
	YWuV7HxekL5CdfQ3515UKO9LIm0N52zu4kIKCm7Nj7ydWVhcCV3i7CeECO3IOBAGqJsfOIz3eVm
	UP5QgrgGQyXuAk0fWp/IkGZSO2YaUa8ADN8qG+isLannBWk9o11AhTdQeCKTtXLR3wmqovn30hA
	8HumF0xgPkhTrPa6FEuiitF3Zcx/2
X-Google-Smtp-Source: AGHT+IEw/QFZ4Q15wjtCZMc2Ys2EDGftsTen4aFJcOHmrUkANvg/HjzdHRZE7b55C3GGic4/3YhYzw==
X-Received: by 2002:a17:907:74a:b0:acf:15d:2387 with SMTP id a640c23a62f3a-ad17ada7132mr232347066b.19.1746180071962;
        Fri, 02 May 2025 03:01:11 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:11 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev
Subject: [PATCH v8 10/14] dma-contiguous: export dma_contiguous_default_area
Date: Fri,  2 May 2025 11:59:24 +0200
Message-ID: <20250502100049.1746335-11-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_030113_781316_1FC392BB 
X-CRM114-Status: UNSURE (   9.04  )
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

Export the global variable dma_contiguous_default_area so
dev_get_cma_area() can be called a module.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 kernel/dma/contiguous.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 8df0dfaaca18..eb361794a9c5 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -53,6 +53,7 @@
 #endif
 
 struct cma *dma_contiguous_default_area;
+EXPORT_SYMBOL(dma_contiguous_default_area);
 
 /*
  * Default global CMA area size can be defined in kernel's .config.
-- 
2.43.0


