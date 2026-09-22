Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBA0C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AJoHTp8J0uzmIlfrfln9mMPGZu9ifn6RaYx8B2B0mpM=; b=azK5N32+aftaKbKZObG6Hy+DOf
	9OwP4DryvsvzL9qctHsGO1mKev6ZluT+l93C9aaj6t87IXPH0e+nWWVe0n70e5wW9Z4OLZUpubrr5
	o2TSx91TaBHdWl4JQurUbNo7G+8fWL5wVgzA4IANDEtXbKxHTgK3SSGZSL7ShySaKKPDbjZyL9G+7
	hbJXOdGARyEBKYp9o/DfTw3xyxuGKjpaiqGqrb5s2jKL7SJcm9IUFSwNhZ+QbLibwSs14zTMTZpmr
	SDzcVFr5aKmBxjTyvbyUqM9IxthrNt2SLchcdnZuqKQAkAlAU/ONjEdr9XvKr1CUFD0rWZaj51VFG
	RQPJCvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r3F-000000043VA-2fXR;
	Tue, 22 Sep 2026 03:20:13 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r3C-000000043UV-3RFQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:20:11 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2db710396ffso4493185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 20:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047210; x=1790652010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJoHTp8J0uzmIlfrfln9mMPGZu9ifn6RaYx8B2B0mpM=;
        b=E8dbu+MsOVegkXmNEJO40u+8uPnYx1w+iWk4CHQdkogBLFgM12DL2mSwfgH1+7cCyZ
         x6UYiX9Y6msOBBXoc0Xzih7ll7CT1RYxqfboonVXu6ASB9KqBWZAzzfRhbel8lc6quu2
         Ie6aO/ygMEVSmgfWOpjjzbaUz34UK/ATwAZ57JOGhPTJBporwWK5KKdbei/1n6T0nBJ5
         PZvEEHu1fKHgcvAfNBE4HSuKMP72riZek/8i9EEZ9tXyuiX8USEikaC+8v3Dp/AZS/Xk
         hK3vQAYZNgo2MvPubrI48Synb6o1xAukheBtgXyAKtwhuf4KshSUOhiyEOQ6KIK1Lhmo
         wF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047210; x=1790652010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJoHTp8J0uzmIlfrfln9mMPGZu9ifn6RaYx8B2B0mpM=;
        b=f1r2Al9EK0GEJFqM2kPICLnOXT+z9e0sSF68cSThr31Y51LSRe2xFrkY3ul5tEkm4o
         J0YuZNTtnOzmQ5skMC6XWi0eemTHufObpbx9F7MNr1LlMqhhjeTQUlIy4FUHwXLe0FI5
         x0m5effFEYk4RSAV+iUKXA4bkkKu1W7qwFJKyGFoT6cXBq7f4wlEIKO3+hpLbNtT9kzb
         gxTlwyW5p0KWwjYB4bRd2QuCpCfUg4mwM0Oqnbnt67/hrx7yxms+7yaZCElqrCa09VOq
         FYbH+Hw29tYPw1iQ98UBedz24T1pfiB2LPCTBj6iA+hIwcbM20vyiCmb7x+/LeZDbDQk
         7PbQ==
X-Forwarded-Encrypted: i=1; AKwUvByj6IBekPti+vNA8FY4XZ6tN/RAzjyyv0nC+HYDl8lS6SZAbsyb+rcabL/Y0J/gzvEZoKz2qUsHWFOQ5aKdVtpb@lists.infradead.org
X-Gm-Message-State: AFuF++mikIdmWi8iPoNWd1w4atyGgHj9gIeNke92rJEupv0G8TSlFRMm
	dj15l1QJAqMhd9Rxa23UA93mAqb9VgaGUv06mbt/W4ECA+EjVzl15xih
X-Gm-Gg: AYBFou3e7zz8G3/hN5I1jEQ0bv+rREoGjW3u+G9BQ/09MxCQApl/HepUieBUUSmy32I
	JaBZEg+rL6gaYVMs0drYf42Ssq7Z3hZQQ3sgAvFBT1bLP7NIiclflGXTXCnrRWQEMEHe1cHdoie
	ol6hPDzrKHeIs4BAr/9XxnkvLAM3KX9sX0hTXWvULN5bj3s3iKxJ0Yh7QkEV0Rn8FlqDLxY1SsL
	1RVXgqqkbaXwrvBEv6dGc20NKbobdHKHNk64KeI5OhGBK/hxVRRi6F1qFibSzdL07a8svLCQ2+7
	mj3byUvS565lLHTQoyZ2IcugD35RNysQVB12X2YQoeuO0cIYoWxbgtjy1ZsTw7z29RBGUqFABd0
	mU7QK1sN97zvySV3ng2baUGr0RE2D1wbu4jB7YWaSa5HFlAHH0loXRxz5zIjUTer2tAwren7Uzv
	3AuglmQ/IpuculMABO2fpfwKD69PfqXzMb6p6qi3GTL45EeNMl6TZsWUK/cEjxvMMzguKhOmJhb
	siAnQwYNfr1kpK+3KWUOnIY/1iKqH2VHHQElzhXe9ehp9lAqCt2SytfpaZn8ROOI3jw6wokdpFM
	dwwx6xu4Ylx5qGRkBSj+LDPH
X-Received: by 2002:a17:903:4b2f:b0:2df:34c0:7303 with SMTP id d9443c01a7336-2df59ad92afmr12464055ad.40.1790047209771;
        Mon, 21 Sep 2026 20:20:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5cf83512sm1940355ad.5.2026.09.21.20.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:20:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] crypto: Use pm_runtime_resume_and_get()
Date: Tue, 22 Sep 2026 10:19:51 +0700
Message-ID: <20260922031954.320895-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_202010_888299_5353928F 
X-CRM114-Status: UNSURE (   8.02  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series replaces open-coded pm_runtime_get_sync() and
pm_runtime_put_noidle() error handling with
pm_runtime_resume_and_get() in several crypto drivers.

No functional change intended.

Best regards,
Phuc

bui duc phuc (3):
  crypto: sun8i-ss - Use pm_runtime_resume_and_get()
  crypto: ccree - Use pm_runtime_resume_and_get()
  crypto: sl3516 - Use pm_runtime_resume_and_get()

 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 3 +--
 drivers/crypto/ccree/cc_pm.c                      | 8 +-------
 drivers/crypto/gemini/sl3516-ce-cipher.c          | 3 +--
 drivers/crypto/gemini/sl3516-ce-rng.c             | 6 ++----
 4 files changed, 5 insertions(+), 15 deletions(-)

-- 
2.43.0


