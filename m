Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C727C98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uapzxMEthDJO/bmR1HA0Vq28uQP+GCz1/k3zL0gE+FU=; b=oMrtphVwajA+RIj5MmN8ziRb4d
	w6DJMia9ucUy4Piyy2kU0bzIzSp89/9t9uD86SZB/ZInV69jf+Rb+7IIc579qcIeI68ee5KebYteu
	WxOwknTS7aWDEZewHJUIVqSoGBkaIT9kw1p3WzIhRnmGIvWVAQbHBMTC4z1xsLQM+89r9r8yc1fkm
	S0KuiQrwA2kDP9gwsHEq0hGGVRl6jdPTppW56vaYl98TUAA8G+wGwsrpZQHMwzhRVG13HkFGEMf7D
	xOW+FH6AIdrWWt8vFNN/aeuH5DsHPLwwvMHzJwM5+OpACyeGRtUOxRcUglyv6QEdKx5GHnRaaE+Qk
	apu4Zwsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9csP-0000000A9Wy-2e3e;
	Thu, 24 Sep 2026 06:24:13 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9crg-0000000A9K3-1fZO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:23:30 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so681081f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 23:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790231006; x=1790835806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uapzxMEthDJO/bmR1HA0Vq28uQP+GCz1/k3zL0gE+FU=;
        b=j9AAjHR2nH4m4pNtjRpchKSNE/DUKaaKBKmVOGqtMTvzFOQsSdVNYUrNQb6pwRaeZm
         SCCS/N+KGln1qTcqRqBGOniwkMevrYgh4hNBfd7Z9KkC3woM1f3hV7WUMQEsKY2Q62m3
         GztVAC5YA79et51UPDFb3WHLVYutgJqgSmOXjMCL54suz/VmVTBHA+xgZOazJ41BlmTO
         I6txVpJUn7Uk9CFKiFQ8iUtW9yczr4gk6sfsaPY4hGLte2gQPN/tDfQcL8BqnS1U+FgS
         P9VkZwu64dSnHy/NINCvr7519gBcXoUnP2D3FSvkdFUAeN6+mZ0MMveXGikFRcXCh8ua
         TNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790231006; x=1790835806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uapzxMEthDJO/bmR1HA0Vq28uQP+GCz1/k3zL0gE+FU=;
        b=1JXpJESpnGgHqdW7kerGTby4FfWQQ5dUvVxKwDlb7sE6XBtR3XmaBRejN7ga0wNgxy
         78Id3w9WFgG9ng3vfhGMsGrUYEbLDhMFjt1eyA6bJnkZ8UDRsqmEM0YgTwzpkViKXUND
         7DTyGYeX7TJ/wjeB2qm4oU27dHBf422kNkKyIHh/0jGs5vWFtI9gPSAB27uS3RH/6hzl
         hZoWlwL7A4ois21x75BAuYwOu9Ya3I3SdGypwxkQOhicUTQCxjK0pbx8unXG03CqvfiA
         DnMhWgH7SZoU3RsbS429M/jPyUYb2ggu2FlmvziI2l1J2lY59DmCEMLViwzbVT8LjCp9
         2iMg==
X-Gm-Message-State: AFuF++mQ8Q7qQtO6dQPF0yWVBgHPF0+cBEHhpIlK7M+JPN5GzLx8UM9D
	R6tKDmJWbETzPMKJJsZqMHvs0PhngfXD69Ok8stIlEoY7IEvUg9G1V+x+l20oj48
X-Gm-Gg: AYBFou0+i3WM0kVtsgFCGe5AMgpYKZ5K0tijShkHD7x6TrFxXy1gsDCp909gRkt4Q2K
	HMDrCw3LR9EuKVaG+nV1MVDG/LlPokkRzdJqVtw0E40jQsPBLXWE6e9ovEGj7qknizeFdCPp51G
	r8PGklLnXm7+TqZ8iyk+DGgUJfl8uoJZRbNeYzRvnv4qcRKzDIAuuJbPisy2nG+dYfRp1/GKtZR
	962cOQ+8AaeBfN7GjkP4ZMgHwdxxm9y0sEmP9p2z6uIkEVRNtUA2C0Xwzwdzhoys8fDHi1hhEvW
	zOTuAgZK8FWuTzaOPJ4gD03Yq30IzYYgscAyZBjj59WxAPgNqc9k0TLWilKWKPvy5OpP/UjOlN6
	GmMyca1RxgTX0esS/oWV9NH7ijLFeaEfpg/ZRyiDrAhHEV+pOPXBgMU+HYfr8CWZ+dM18DkLfX0
	SEfPNN1MsCeikf7IoVJkaG7y97VLFRZYwhLoTnHOunl8PFf69AhQBod7uWOOO9HWVh2EDJ46fzU
	9Lzo7dAYOM7eY2UpC7JbL5An+MjnWlFmBq8kZzP45+rxdtHbd2Np+oAcHZczi1NpwolZF1Wq4iA
	4WMvVFl/gJB9ASh2gyx6lejyaHSB7P8DkYdFA35Xj4y0TguH2Kc5b7BvJC2SGiUKjFvnk8HPBQC
	8oeyigVy2V8jU6pdjejcJ99Y=
X-Received: by 2002:a5d:5e03:0:b0:488:63f2:8779 with SMTP id ffacd0b85a97d-488716d236emr2306396f8f.21.1790231006325;
        Wed, 23 Sep 2026 23:23:26 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-adbf-6901-6c54-85ea-c6d5-a48d.310.pool.telefonica.de. [2a02:3100:adbf:6901:6c54:85ea:c6d5:a48d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm9713823f8f.33.2026.09.23.23.23.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 23:23:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: mm: align hugetlb mappings to the huge page size
Date: Thu, 24 Sep 2026 08:23:23 +0200
Message-Id: <20260924062323.55651-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260901085740.66283-1-kmehltretter@gmail.com>
References: <20260901085740.66283-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_232328_449310_1079A354 
X-CRM114-Status: UNSURE (   8.76  )
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

Hi,

A friendly ping on this patch. I came across the ARM32 alignment
issue again while testing Ackerley's HugeTLB subpool series [1]
on v7.3-rc3 in QEMU (Cortex-A15, LPAE).

I've now retested with this alignment fix applied on top of the
full series, keeping the kernel configuration and test image
unchanged. All six ordinary HugeTLB mapping and cleanup tests
pass with both one and four virtual CPUs, without the previously
observed panic.

Would someone have a chance to take a look? Happy to provide the
configuration and logs if useful.

[1] https://lore.kernel.org/r/20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com/

Thanks,
Karl

