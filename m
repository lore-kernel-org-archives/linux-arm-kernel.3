Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F25C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 11:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SueYIwtN34aDecFmdVLLejPK7ADkRNRofT3ZajDoNZo=; b=W5Sx/LCDw5AM7SYujx9RgEFO8H
	4yo4Lrgn0qeb3mW2dv/PEDKGZppLqVNilPZ3VKcO9ZI5KB2WzpniJkPKeTClk7TQqhBl1x8yCmN3I
	NKUDzQer/fJWclBVSpyoX4eZ1aPyGAMdul5xklv5i3TABQVEG6607Ak7KLn46OXP1XFBYG/7p+szX
	d9FNFTtG3/UA68+3A5pJ+Em8W/FItGisYayw7xoz9wEnT1Eh57FIMVbumFVw0c65WEwdR2fXiZLcu
	/BVFw5nqVHVyu1pk2ghuqgXXpCeh3Z4ioexfrLmZmWJyiza0sN5iwohn7GAUwqUvW4XkoBX6nHOjI
	76kHHNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2rG-0000000DwmC-0Y5T;
	Fri, 14 Mar 2025 11:05:42 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2g4-0000000DuVJ-09hY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:54:09 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3965c995151so1073527f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 03:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741949646; x=1742554446; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SueYIwtN34aDecFmdVLLejPK7ADkRNRofT3ZajDoNZo=;
        b=cxnvfuIaaPP9/Amt4W18ndML4ocdD2y6lo+DCB7oIvHaCs/mOHiOcSTSrFfSl68C18
         tWpRlqUuUjyZzDYV7c5Dm2wDRMfaArDeF+Na71CrzUuo+8veYdGpWSl7/sAZmdpE5rUi
         zPBmPajgd1CemYPnhra2uBgK3zv4YdztvkPJkgXNIOOAAXQeJiZ3+sIBR01XURwSaRE9
         FRV3geusUVDgon4PPcD1PmAxCaz6cp851O034HwupNrbwma1MqZbXNDYiwKp8iq6yrxq
         4dML83ocsB6DnMNnEllEz8zz32/41qR7GlREQ8ftuQw1IGjTIPKPTcCZYy4xMcC0nus+
         PkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741949646; x=1742554446;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SueYIwtN34aDecFmdVLLejPK7ADkRNRofT3ZajDoNZo=;
        b=eCuudpcPSFJ7yr4g4DjVIK2poEXSi5xbEocczNICLKjvfupNo/YfIrb8lBJMKHT1vS
         YOWDwkihtOLUrI1aaHPm2wxmBBXBgRvpHhi9VWWvnIn2uMbBbViJ8rlTSfalLiwu1yJs
         H0aIEy6AOz/fm999OfQfjjLvsL6B55SzpTIiFk2/fmacMlr9AbcXeysXlHocCOdHReK4
         nJKT6zbdVRO15PHo8gvPk8R5iHTzkBAlqgEUfDYXGoY5gAp5d6/ytVi+ZB6GOAnc13On
         1uvyB1xyzihW5F/VG61UcjbeHwsrWZ1amBPlwD/lhBWRePBLCTJEdO3Q9KBkTI/RXZ24
         jdZw==
X-Gm-Message-State: AOJu0YwJ0f135RxMrkxndLNthRWPT/85k/yLbbymQigDGYjoZlKAZJfz
	YI3ZazDxNkrnmAuBfj1HE6Zdlm8hkubW/OIc3YgrlnQd3YVhHQTYgtins1bij1I=
X-Gm-Gg: ASbGncvtiE2182AApCH0bK9UKpBcrw+8RKeobo+YK3S/IruwTu+OQazj8vZuLSVExiq
	4r8JcLNc7K2weIOdzkhKO4lMasG48e4BcE6I5A7Jrt0+3C+A+5bLUcwHv7Ug6umik44DUWelbSn
	c2f/qt43Er28X3JXIIJzEC4YTqpQyOaVdCBClH8dlcfYFAO2TB5qTlJ6c3n7kyaGyy81D3G6I/H
	a+J3Feur9ZANp7C5m9p1hlWsNSJeY6uC+dGFK92jZIXth8gmqi6rbrmAqaHxjRly/uJCAEQwT9B
	eLSc1mWVmhiF5l+xCqZP8wk0QLjU7fE487n6ERdwr7yE30f/bA==
X-Google-Smtp-Source: AGHT+IEACPU91gBpeFuuxQpAkQpgEGbE5KgvAJiimxZO969gaBd9V+wUWXBVsmKmnFpnT8PzS+EZIw==
X-Received: by 2002:adf:9bc4:0:b0:391:4052:a232 with SMTP id ffacd0b85a97d-3971f7f9ac2mr2041595f8f.55.1741949646352;
        Fri, 14 Mar 2025 03:54:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d1fd6b2acsm14141035e9.0.2025.03.14.03.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:54:05 -0700 (PDT)
Date: Fri, 14 Mar 2025 13:54:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [bug report] arm64/mm: Clear PXX_TYPE_MASK and set PXD_TYPE_SECT in
 [pmd|pud]_mkhuge()
Message-ID: <d7902504-1ed4-452f-9b08-148f6b8b69fd@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_035408_076335_6FEE96A5 
X-CRM114-Status: UNSURE (   6.58  )
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

Hello Anshuman Khandual,

Commit 1601df9e366e ("arm64/mm: Clear PXX_TYPE_MASK and set
PXD_TYPE_SECT in [pmd|pud]_mkhuge()") from Feb 21, 2025 (linux-next),
leads to the following (unpublished) Smatch static checker warning:

arch/arm64/include/asm/pgtable.h:587 pmd_mkhuge() warn: odd binop '0x1 & 0xfffffffffffffffe'
arch/arm64/include/asm/pgtable.h:626 pud_mkhuge() warn: odd binop '0x1 & 0xfffffffffffffffe'

arch/arm64/include/asm/pgtable.h
    579 static inline pmd_t pmd_mkhuge(pmd_t pmd)
    580 {
    581         /*
    582          * It's possible that the pmd is present-invalid on entry
    583          * and in that case it needs to remain present-invalid on
    584          * exit. So ensure the VALID bit does not get modified.
    585          */
    586         pmdval_t mask = PMD_TYPE_MASK & ~PTE_VALID;
--> 587         pmdval_t val = PMD_TYPE_SECT & ~PTE_VALID;

This is "1 & ~1".  I see the comment, but I'm too stupid to know even
after reading he comment whether it's intentional or not.  :P

    588 
    589         return __pmd((pmd_val(pmd) & ~mask) | val);
    590 }

regards,
dan carpenter

