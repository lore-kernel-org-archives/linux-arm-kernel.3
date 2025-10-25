Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A0FCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cxuvcw+5BokTf5KtZwOgkWEs4upe9ufMvZQ/niv/DKU=; b=hs2Q2mpVjr9SAz8OTQz3acPaKf
	RFSiVmYcWbhPMMO1H7iFEGXKkh6i/Ur8CGGBRA9EwDMt3YRz7pchVewuZGQmWEXBuqNTV0F8qURv2
	5PpLJgo6KlxVEpZ8kmicDEpiB2/lO+ZVDP88SxbB1EXsP4yf71HNS73/YplvPwJDMJy+VsNbT/UsL
	MlO8Nms2iXpcoMh+9ggQGC0XyOJW8EJGNtx2BFBXeD9WmMm9i6loCj10put/9xteT8MKWg+DrgBg+
	acGAjCG/GuN9+Df1kdPafObmXu/8sl343pY73nHFgNB/v7JpqjcIxhm0d/929puNxZS6lAPUDssaJ
	X6M37wBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChDM-0000000BXPO-1qwh;
	Sat, 25 Oct 2025 16:34:00 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChD1-0000000BX3m-2xV6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:46 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-87c217f4aaaso37648196d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410018; x=1762014818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cxuvcw+5BokTf5KtZwOgkWEs4upe9ufMvZQ/niv/DKU=;
        b=jvc6Eo+YQiTODTq6e6KgmFIPep3gxq4v2gvBAM1UwEtPhlM3g4sVvsFAvgVQjYmDVw
         o8VMx1MoBHD6acBqNAQwV6vKmTpLcqiddPvZjPVQNpSJnxTCwS8A0IYkqJOdrmwf+PVy
         IRjROYwXb1trAuIKMvmCixCgzHDCHbJw/w17v6QnU37IwySBzC0BJPLwWDCx8ZnV1AgK
         VUTquNHWr6P/CtFV+Vv9GENMEm3rKMY/IEnU84kcQiCcs47ZPY0RD2rRqlcq0hZbOc2f
         O5OCGQ+Iel7rJLmmuICb2JMePPo3lLNb0Y6h9EXF82Sb65A4xjhpTrugGmLttCGq4wiL
         6Unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410018; x=1762014818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cxuvcw+5BokTf5KtZwOgkWEs4upe9ufMvZQ/niv/DKU=;
        b=vUV+m4np5D+iZiFDMTziOPOx3Ngr704DnLR1hP6PEAf8XkJHzi4QGDjzygCi9pfQ2l
         GhPnr9ij+IziBt0xWew4kzscfB4k6W9Re7FWW2qfo9DXIcPYXqosG37KeSPAQVKU/zsp
         LvbvbB8iCZ3jzEe9pCbJfl9Vnc8bv/lDqJcd/tul24rgPlCS/M6tsgvqaqwF/3efyxNj
         ZRDM4HvAvMTjN4cCs/ejxBqp8zf50kZd9oP6B+KmiX0YYbrwbcxl8Zp9i/gk+5uumVGd
         zrsVN7bOgfkJW5jNHD34kgYCoObj2l/4K6htieOKg/UfZQNlWRZ9VnR1/fEAGBgUAAn2
         4rPA==
X-Forwarded-Encrypted: i=1; AJvYcCUb+n+45j+jRrlb/EPg9vJ6Y/TWehvAQ77Ag/vetDLUwt+rhmflQ3yEw5Ff+YsjekRxDRmalLvzbQd41TyPDyxO@lists.infradead.org
X-Gm-Message-State: AOJu0YwRW5jMikeBCuGNs+XC7a3XMPL5PUHb2NIhCK58L7bngSoguR/h
	j+/prpFoB7WL6mDqk0GLpFUR2/16+r4tu0lWgJwVpCJEIjFysAxoyJGM
X-Gm-Gg: ASbGncvnN1LrCWeAIIIoqZY2blVvBDDvh7xO/T9nqHHtLbgtu+Efo9WAbmdWQGM4qkV
	pzIiTV5SP3cFNMq3bj1CCfe45SKcEMM0k7pTlQ8ArqLcAhGll+Ubfbd2sV6MCHru7wzANyYRwWR
	acGA/C1JinAAV3EG0f3n1/REn6XnGXf+F7QkER74rnY0xpBJPTb9fmS/kiZHTbA25LOhWQlmndm
	+aL3PYyr/bE+GvkmdcyxgfYRWkeO4rjOgXZgKyp/gmY2j6etv3EjBTbu1PE/jK0IY2QFbxWA2aI
	fQKVzKOuGv/g5hDCjncNFwuwaEwipEJiL216DtB7FkiexzJO2yUSW5tvKNA51fii91dBpfN8b12
	uj2r1dOjOUSp3mv0b3rP5xRLZr2Tg44uqf4hnhNejDfR8+XB5J4skwDjNQww0ABmqdnIE4CsiqB
	OQ8Mapyb4=
X-Google-Smtp-Source: AGHT+IHWOynP91XK0eWWEmP39+HpO2WIYG1FD6QWp9GErpLHI7PIM/nM4hfHX/dVKVXslC7yeirnSA==
X-Received: by 2002:a05:6214:508f:b0:87c:27c2:2c0e with SMTP id 6a1803df08f44-87c27c22f10mr333708616d6.59.1761410018091;
        Sat, 25 Oct 2025 09:33:38 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48a8a1bsm16461146d6.8.2025.10.25.09.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:37 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 20/21] fortify-string: don't use GENMASK()
Date: Sat, 25 Oct 2025 12:33:02 -0400
Message-ID: <20251025163305.306787-13-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093339_839562_09DAE60D 
X-CRM114-Status: GOOD (  10.91  )
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

GENMASK(high, low) notation is confusing. BITS(low, high) is more
appropriate.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 include/linux/fortify-string.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index b3b53f8c1b28..0c95cdcca736 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -11,9 +11,9 @@
 #define __RENAME(x) __asm__(#x)
 
 #define FORTIFY_REASON_DIR(r)		FIELD_GET(BIT(0), r)
-#define FORTIFY_REASON_FUNC(r)		FIELD_GET(GENMASK(7, 1), r)
+#define FORTIFY_REASON_FUNC(r)		FIELD_GET(BITS(1, 7), r)
 #define FORTIFY_REASON(func, write)	(FIELD_PREP(BIT(0), write) | \
-					 FIELD_PREP(GENMASK(7, 1), func))
+					 FIELD_PREP(BITS(1, 7), func))
 
 /* Overridden by KUnit tests. */
 #ifndef fortify_panic
-- 
2.43.0


