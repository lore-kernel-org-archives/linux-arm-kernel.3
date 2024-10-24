Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E33CE8E92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KR+B5L4cIU9DDdYRJ/PwALZk56liTvqbQa9wbDbtP2w=; b=fw3z4LhSrsE7enWYzabnb3iB/x
	bkT4Hru+NJ8BGtfdXWNHhYQETOL/OvZBj0pjN2CA0Y1xqvgFloyByVMn1t7odJzeo4C5f1M6bR6wd
	edIK8SH6A5dgv4yoxaBUARzNaLdhhhOrfCmeos3TQCeS//biAudXslKhviHjKnsWhRisqCkJZsPNr
	9N3D9uzl1cFVUd2AY0jKwZrHoZXpk6UtCmTgPBMuDNWiuAU/5458Stlehp1FDRTOKC1vAlnMY9Jg+
	qBPlAcAJ8kQPCLs9+bRPEh+OICybpHC1HWMpPnrrdlO3evpEq4EixLs+wdpzGYuRz8OZt8xCAQQcg
	UJpUXz6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40iO-0000000160n-0sEz;
	Thu, 24 Oct 2024 16:29:36 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40eO-0000000156q-1fuT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:25:29 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4315b7b0c16so9057475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 09:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729787126; x=1730391926; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KR+B5L4cIU9DDdYRJ/PwALZk56liTvqbQa9wbDbtP2w=;
        b=Avowq76DpXADC+3BLScAnpGvNgV5xx25OBZxy4KoTEglyqMq2dp35xOqrUkn94b96t
         /Al/DGSpICfWu9Q6bjNmTKgQ7cx+x7Eztobe/a7fv1P5h3Af6MIINr+p19DOLyyzdz/K
         IyvGHGwRuoaV2XYuo8AhnZ+m0WuKtGTdxwdI0yTQpGYwOBGpLWyFgcgBtVw0dkF1U77E
         j6tGGp5HPSHCRRzFjZemC0QJDGOemP6djoPIMTZoAr1jqJ+OFal4NB2u6XgUIVbuG9oE
         M6OaK2iOj2M8JhwRRQgstvdyK4DWIFUmt8T7K8deTfJrsGkQJi+Eob56WFbTuy+3biPu
         3r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729787126; x=1730391926;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KR+B5L4cIU9DDdYRJ/PwALZk56liTvqbQa9wbDbtP2w=;
        b=PSLBz2GXsTMXe6d3VMmK4fZJNCG4c2sy8qIlNSf9rRM5nE+LWSRShSa2yPFhL4rM34
         l0IcmwCfppVXXOONuieaAOEx1szd7Tq4p1mSbEWWqGvogRt/9Z3JaFU7H+PU4hTJMdVQ
         eo7sjx8iW07iqO575MD8ZuY4QrygKVy7vyDJkj/tb5DpFKJGNXMvCGPXRJAizrLsANr0
         7OqYRcJ5ng5NbtTWOx4GSMT7Gby71Dpa4JpTBLDosNpOugH/uMPjSdsOYzna1X0jB3wA
         xRVHWz5EPl1Q+wjtsMByyhQVzm68SG/s2ufGKyHgKxYjE+Djv8AYS2uOH9PZs1wD7QRw
         F/Og==
X-Forwarded-Encrypted: i=1; AJvYcCVuJwnHv+c9RIPkValFmLHweeYcbUtgry6avBKTuoA7HPJZZsZ519fYVibnbI9R+Bh9oFsAmU5ZSbJLAuPx0rsM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3PByTOoHkRVrZBdk+XMmZrdxZ2d7IMelfQxva3iL+h421BHiZ
	CFQwrP6i5ibH9Sdge4ox9Svvkhv1C12fp6aUUq7vLKQECGIB6LzTpaQ/M4JNG9Px8CPWlbzwNxz
	akzRhAmAsjQ==
X-Google-Smtp-Source: AGHT+IEa0fdCs9TdeI1S154h4FVCg2RPzpPawn874ObbhYWCTqLcJW9Fp8UBsiTi8lK8mBxACgZ6DDCkYsBLxQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:4483:b0:42c:ac8c:9725 with SMTP
 id 5b1f17b1804b1-4318c76565bmr59885e9.8.1729787125428; Thu, 24 Oct 2024
 09:25:25 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:25:14 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241024162516.2005652-1-smostafa@google.com>
Subject: [PATCH 0/2] iommu/io-pgtable-arm: Fix for stage-2 map/unmap
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_092528_462823_DD898DBE 
X-CRM114-Status: GOOD (  10.62  )
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

The first patch is a bug fix for stage-2 handling of concatenated pgds
that can break map/unmap for some cases.

The second patch is adding these cases to selfs tests.

While looking at that, I also noticed that the concated page tables support
is minimal and not supported for many cases (level = 0, 2, 3), I wrote some
code to support that so I can test further, I can send it later in another
patch.

Mostafa Saleh (2):
  iommu/io-pgtable-arm: Fix stage-2 map/umap for concatenated tables
  iommu/io-pgtable-arm: Add self test for the last page in the IAS

 drivers/iommu/io-pgtable-arm.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

-- 
2.47.0.105.g07ac214952-goog


