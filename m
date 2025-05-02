Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE781C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1anNv4Z25lfJ6IEDtR0M/iXAZvESKw8M2gLCl/3GqgY=; b=E0qfEJRxJa9bxPSHMwnbBgeU6G
	AF6pT81WHMkNIV7kmD/MVEUGION5pSFw5L8YI6FYfikxXPU79X1QU/sHIxoP1zJ/Tc/3nEidhYkcD
	6oCGTTyyeW/M2CkQf9kMYpV3MkDPmkGgDQNPl14naPamf1ZAhlvos5z4TTOjwCO+ttIrC7Lfz6q+B
	0nyw8iU4CKmEWXQaUKFQ4Cbq3iLpiBRDQuV/Ztib/AAtwGfpd97cePYJjsvIyrm4s6AAO3IiMz5YD
	LJunRBY2q0sDTha5wLH4eQLkt36jyAWMxPI6MyHm3v1seCjPiknLB6OaL9vP8HXqlBYA37Pkekm7J
	T+OSk7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnfZ-00000001a1U-2pgT;
	Fri, 02 May 2025 10:31:01 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnCi-00000001So6-0HK5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:01:13 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so327452166b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 03:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180070; x=1746784870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1anNv4Z25lfJ6IEDtR0M/iXAZvESKw8M2gLCl/3GqgY=;
        b=Ws51kZ07GMx6ZRKAZ678iTTGrt8xOiFmxrkaOj0qc34TdJGzevoL18DT8eGaSbr84g
         8kdsKBa/1ruF0tbp01IoAAArI7xtoQXXGWZ3WrHhxMacG1TkRk4R/bB7v/UEbNAjiGQV
         4MXXlGBDCimBH+5lQSu5FKFWR0CvA3IC39ahu4Rrf8n4CpW/NW8dcn1ygE8cRR2sQhsX
         mLfiBM1ulxRm779EH8c47ElW444yYHEzZ0on89kythQz2Iirx/zGKLBhRKATMxu3Wp69
         7+yAtFTsFH1BV5eb0gmUDUQHcVgwq0ei9LjmQMLb/iMYc4tCfKevWic8pSzUhm1wApVU
         C8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180070; x=1746784870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1anNv4Z25lfJ6IEDtR0M/iXAZvESKw8M2gLCl/3GqgY=;
        b=PiGW6BiXeNnUzmqapim7W1PyK+Kxrxooy/+UYHQQPCz/4cWeHslHzSRcS1mHFfXrM9
         9rqtr45MMn+hO4v1JsNX/z/y/rvUDSjTfX2b4tsPBwuxZTu9Sj3msh8v6s00LV7hz3wR
         3Sv3D3Zj50ZrwX+nNFXdn2bBwSDl9fZagWdyfDF6NFfnsa7QBuwFDaRE9ZtQOa6zfHgx
         qHdBYAqOUOBpQq4YDc74Hrc0oFP0Fcfl2GIzNz74wYQWir+V5CQSzJO9NiahRKNNmSJ6
         xVsqlRTqa9D0jIOfnBLaaJS8b7GKXX+yhvbYeCufbiwe4+1f9EOUWAX3iLmYXb0jGyfM
         B9NQ==
X-Forwarded-Encrypted: i=1; AJvYcCX46LcuW5Krvjmasryp4pCsLWoZ4sGxkmg7UdpOitBx0NQdJPcx26I1hheROKHJD7uas89nU/onsL//0rvjPmeL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3f4I9RC3fRkdmSthZ7YSg0P97/7Im0ZOBE1xyXEnltDhCTz1f
	W357TfHCrg56FSlRE5S1VjVYNmmkZ6du4KB5EPPuIfE+BMcXJvsXEc1+cDKvxT8=
X-Gm-Gg: ASbGncukk3gjfgHKf9zFfiWGuj5cprJBG3gowuBDthnZ6rMVuwXQBwD1ZSX+dhlmIRk
	iDRIrzmnc+zuh0EuW2oVRzzPNVI89nC2GT78XlIrk5X13/SopAJARbJuWtWF7nrj1B03fE0kg2k
	Zcaj51fyGHvX7+QRnKu/ZFwhNxl9exycm+x0Q0rK5koIn5N8iP1VQYMvmncBbSluVxYCDA3ZgBg
	leR1hDXtdTN1GbRu/cyIz6nJfINbl7ynQqtXGUgPjZxfhy9noXg6s/WxUvVq+S1IjicPsCjzfO+
	PYSjHJ+ngqf2wLDcEXkxewa11T8TDiWxwxsgn+wfzEmUQCqyz27kp56reXynxUvkY3tkAhJDStK
	5aqWuULIDzee75xT2Ng==
X-Google-Smtp-Source: AGHT+IGbNYwwYka0rS/o95u834QMshNlm6ZE08gyDe8QEBQfbOvJaJeikFzKXGrLN54PFU3NRdyFmg==
X-Received: by 2002:a17:907:7255:b0:ace:f2c2:5a4 with SMTP id a640c23a62f3a-ad17ad5d279mr201865366b.13.1746180070053;
        Fri, 02 May 2025 03:01:10 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:09 -0700 (PDT)
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
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v8 09/14] cma: export cma_alloc() and cma_release()
Date: Fri,  2 May 2025 11:59:23 +0200
Message-ID: <20250502100049.1746335-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_030112_143624_BC1A0FBE 
X-CRM114-Status: GOOD (  10.46  )
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

Export the two functions cma_alloc() and cma_release().

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 mm/cma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/cma.c b/mm/cma.c
index 15632939f20a..c60901e73a26 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -915,6 +915,7 @@ struct page *cma_alloc(struct cma *cma, unsigned long count,
 {
 	return __cma_alloc(cma, count, align, GFP_KERNEL | (no_warn ? __GFP_NOWARN : 0));
 }
+EXPORT_SYMBOL(cma_alloc);
 
 struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp)
 {
@@ -1002,6 +1003,7 @@ bool cma_release(struct cma *cma, const struct page *pages,
 
 	return true;
 }
+EXPORT_SYMBOL(cma_release);
 
 bool cma_free_folio(struct cma *cma, const struct folio *folio)
 {
-- 
2.43.0


