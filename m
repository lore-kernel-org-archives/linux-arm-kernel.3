Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBC7CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 00:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2F/AKOPPTrThK6tDV9k5jGK57yQHRX8v9mM1yN644e0=; b=rx/1FPkUBEsllxBBErKUmczphC
	cmyRjLQPUH59wf5AIdSK1c2U5EnoAPTKE2xeDnqaizatKyBDXwRSDFl/Gl7iZwV/51Fl7P6HKnYLB
	tETCE0kZzqjMJDA2IQykVIQMg+atUZAPpgGsWmGhoxZPMoAj2HR/tpWzj9uF0QAt/vlB0jphw/35S
	HHRUXvWeH0rf85ZNLoxtxajrnPLBpsdhv1s+1AmTWU8ctzekZMvNw9swSNmmKYyLQXAReMTPpu1oG
	6KZEKqFtHrEczphQmB3QH1jrjvMzlRP9y0KGTVSmFlr7KW1z0zwChzgqnUqBGlQbt6qCMgpLJvBkE
	WusY2RmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLJs-00000001w6m-2l8n;
	Tue, 29 Sep 2026 00:03:40 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLJr-00000001w5r-0WRC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 00:03:40 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d8facae850so18635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 17:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790640218; x=1791245018; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2F/AKOPPTrThK6tDV9k5jGK57yQHRX8v9mM1yN644e0=;
        b=LVNEUs2W3C0vSlXPbYrlHXVFpEhzLXXNnZZfe6payk1LOkfM3WEfsk3mv5rR3AIYMp
         0SD3bTALDs95tba8NkhqCZqEvV57xkEr0cHVD7MO7nLybxMhDodJ0EdQE+tkyTVAQlRy
         4wAOFq0NrCGD+s8AZ+UTzxXgX+CJvuZNaIcOOSMff+CVbjuXmXKNBk16LO4KrootQF/i
         Ga80L9DBjxoWNZLg8oYquENuLr9sOehuDuIgrG+GV7y2itBXfVz3SqTlvTy734163P2Y
         0KE4PMlYfQYEllHZbbstilhc8Qz0D4IVe7boNTvBIcrqPSKxie8FQ8EnB8sIw00MuCQ2
         GbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640218; x=1791245018;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2F/AKOPPTrThK6tDV9k5jGK57yQHRX8v9mM1yN644e0=;
        b=qDyOEoy5liUtIWNCiLAJG7EE2Tw9mapSE4bAYaFKcta3+IJPF5a7fUQUdLfS/p4h7v
         zwlYQ1hrFr5S1/9UnQ2bE2vtda+LjgMX1G5WHq7JUfTjP9YbizyqfEVcKQ+/nJn3k/k6
         xXphdyT3OaoqyjHqbrLHeeemq9mDEn3R0yQ4ScUcfgQ7/0xFjtPGOnvgXyVTMQAp2FJJ
         PO//fT7APt8OT8OxC1KPWCv9Y4zi1zvClsz48oVZSMvzE2UMni5kPUOCsCiaX3E5LLqY
         z5RzLziQ7sSW+8DWeQE/PuoMQjdGyP4UAfuuPPdSdBomZ/Djbwsi3ny33lUShd0M95yH
         9HcA==
X-Forwarded-Encrypted: i=1; AKwUvByBJmAm11X3JD4Msld1ZFGtx1mro7ENOTvwIcF6PmtsPBhAGgn7hCkp1ceRG9ReekFPXS+fpMF6yGZtyF44WWBy@lists.infradead.org
X-Gm-Message-State: AFq9FYLJmsNhBe8NB0jxH/CPiwaITyXJTHL+ykCzo9K89KoOJGtPfAwS
	8hyB2AkmgX8mZJ6i9YsoSdyRVrjssPh9TZ6AoXNH/6CCOpzb6OIJahLx7JPCFvWL1A==
X-Gm-Gg: AYBFou3nqIazHl0QRNPpORD8xz02jKcRP242hBgH7lpAceqJatdGH3j5HMKBDOtuuTG
	thhH6Nzr4JGO1bjDA0TKAw2YyUzP+x35yONF1szStYWyI4mfisiKWNx1P2xPQ/Pa4jpgG+z2mpH
	4couys/5TUw+eO/dIpJh+GhyUgIM4HkBb/uY2DjyaF6mAXctioFgL8D/TgLpb3mY0cU5Iy//JKq
	ECmGFpUsatXOS4HpHI9AtKD0auwA1JVM44JeS36uFrDtazKqXO4k2rQVw5S0LgbgsZWFRijGHtP
	F42UIObuJ3m8q6510K8i99nHxjwteYQRgSnI3uAFVCJyf7FrWOyuZQATp6iDUV4wZztw7x9P8NM
	tKaLdqO4CpAM5jvsSE9mYz4H18cFCRzKdfs3YzrPIxTCj6gkw5Am3k0s+qTc3D7bi1+tShDgEVO
	UwRIYtqleA/0kJuNVhcxk6mWKcUtUoZ/wqr3XU5fp9bBLPf4j/6VHJAfpgm5wqgrSb82MSncYqf
	I+CN+zDU/GRKD9pubQeyxYvn7BA0IYt+y2c0w==
X-Received: by 2002:a17:902:cf43:b0:2d5:db38:800f with SMTP id d9443c01a7336-2e2c7aa9597mr866985ad.14.1790640217487;
        Mon, 28 Sep 2026 17:03:37 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90c03890sm48006485ad.0.2026.09.28.17.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:03:36 -0700 (PDT)
Date: Tue, 29 Sep 2026 00:03:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 5/5] iommu/arm-smmu-v3-test: Fix UBSAN error
Message-ID: <arsAU9l5vOlaINNE@google.com>
References: <20260924085616.300650-1-smostafa@google.com>
 <20260924085616.300650-6-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924085616.300650-6-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_170339_164949_40AA650F 
X-CRM114-Status: GOOD (  12.60  )
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

On Thu, Sep 24, 2026 at 08:56:16AM +0000, Mostafa Saleh wrote:
> struct arm_smmu_invs marks its flexible array member inv[] with the
> __counted_by(max_invs).
> 
> arm_smmu_v3_invs_test() uses invs1 to invs5 which has num_invs = 3
> but omit max_invs.
> 
> This causes the following UBSAN error:
> [    2.333240] UBSAN: array-index-out-of-bounds in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1116:21
> [    2.333604]     # arm_smmu_v3_invs_test: lib/ubsan.c:228: array-index-out-of-bounds in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> [    2.334129] index 1 is out of range for type 'struct arm_smmu_inv[] __counted_by(max_invs)' (aka 'struct arm_smmu_inv[]')
> [    2.335375] CPU: 6 UID: 0 PID: 155 Comm: kunit_try_catch Tainted: G                 N  7.2.0-g8dcb331fbb72 #2 PREEMPT
> [    2.335759] Tainted: [N]=TEST
> [    2.335791] Hardware name: linux,dummy-virt (DT)
> [    2.336254] Call trace:
> [    2.336932]  show_stack+0x18/0x24 (C)
> [    2.338443]  __dump_stack+0x28/0x38
> [    2.338494]  dump_stack_lvl+0x54/0x6c
> [    2.338518]  dump_stack+0x18/0x24
> [    2.338541]  ubsan_epilogue+0x10/0x44
> [    2.338565]  __ubsan_handle_out_of_bounds+0xb8/0xbc
> [    2.338834]  arm_smmu_invs_merge+0x688/0x8ac
> [    2.338862]  arm_smmu_v3_invs_test+0xd4/0x598
> [    2.338890]  kunit_try_run_case+0x64/0x160
> [    2.338914]  kunit_generic_run_threadfn_adapter+0x28/0x4c
> [    2.338955]  kthread+0x10c/0x12c
> [    2.338984]  ret_from_fork+0x10/0x20
> [    2.339433] ---[ end trace ]---
> 
> Explicitly set max_invs = 3 on the test arrays to match the number of
> elements.
> 
> Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

