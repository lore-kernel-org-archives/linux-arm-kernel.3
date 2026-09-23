Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BC9C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNon7FG4gNvQZ8cTIn7dGZggjcYoEo+V3D2k9W/8Sxo=; b=V+ETkk+rWbAeue1WkPNUgbo4EU
	1y6LB09kp2HOTN0YulXmC4uIlZrNg6O08jfW99liUKh6heCMmru2P5nnSDVSJ/I7zSbQauiMIPfxl
	YmRr3DpTXxPMBQuEvObPwLmLkbTPapRW/aDE2D8WA8Mqt2TjrsPCiLKOD/ZIF07fTaNr3pi6U5izI
	Q+XbBfh5DevKMvhzvLuTaY+0aMj8jqDJFVV4VayyHUXfCneMNaUFh7Rp6cq0hG4sFgGRcNOfuHmMH
	utdw8bBcUfLv4kYUS7Y6d9WWWwnVLBLvp3tO6DJ8mOfxHQyPimPeoHZ79OPfl2/gkt81mDm9L+8jG
	s1v2ObOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rfg-00000009BT6-01Sx;
	Wed, 23 Sep 2026 18:26:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rfe-00000009BSX-32Kk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 18:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LNon7FG4gNvQZ8cTIn7dGZggjcYoEo+V3D2k9W/8Sxo=; b=LQYwuuLn28NectpBBjT71+k5TF
	gLn0nd235miznlyBANzyEa1Hkvk5hT+QhY43LWH+PEf0rUcF75oXVqEE7XIct/HSW4HKAGA7ExVwQ
	9avhN6dq+uIrvYDLgFil3zH3BAel3A933coDYuaMZFCoTmLSRZe5IZWaO0SjD5jWDimn67+BBI6C4
	/ifZ9jacvoZuCOMfgxzUC12b33TDBQ2Vg4D8r59MDGn0/SwsJcm5MR4k80M3FsArAQImvSvJwKadw
	37e2INnOZrA/fKTeKMaHkPR0OIOh2n5YYIITBYOD8Aqni2BgNUxKSrsS9qOdtyZz5mfrJpfwn+atR
	kYx+zLYw==;
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Rfc-0000000F9L1-0Cqr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:26:17 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f0135fso8717915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790187972; x=1790792772; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LNon7FG4gNvQZ8cTIn7dGZggjcYoEo+V3D2k9W/8Sxo=;
        b=KeKiaONoBVCorFwu3BZWoIouB9E6Y28hs4Nx30k0qeprNL2oOBjzFrBwrSTF9znCSA
         ZPG6VFRU1uGwZFAh6Zn7I7GHaGGnh58Rn+NSex2T2oX7LYB9U0Iai4gKYC3XwhixT38k
         1sXQwHyj+3d9Ry7DbYSetrcBbNXyy2LHc1E7KiQoxS6SeIrop1O8hVU8DKOvJ/hWGbw+
         pQ0rxYWE4oTIhmz/KHXbrNJQduxcWK9fqcD+B5iV6/YW7Z3xnRVQETSF1kiU5mHqaUb5
         tZON6u5aso5pkhtZ420LDiQFp1HKcEFmu96b3mbMh7mHLisS6iFfw5KWyKsQ+TQiYJd3
         2i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790187972; x=1790792772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNon7FG4gNvQZ8cTIn7dGZggjcYoEo+V3D2k9W/8Sxo=;
        b=KcujQ1NAT+ACkGh2yxh6ZAtUm/TAYEE3ocUfvyVG03OK9pmEGnvf3E1H9MqolEIpzV
         iYFOJXEtn6c1vtjrN+OUggdYKe6Jell6sQwxTNy3zxLqr88mPHobRAkqMRx26P+tGKxR
         Awk2tnIWi6tE/Clr3KmEYT83HxeCxw+eyepNJmeqna7tQ2dv4p7KEPsQJ7bL6psoLk61
         JKCPI4bQIZCfMjSRRrFKTccxZAevNTHZfnZhmtjnRY/7u5Qn25beaL3C5Nhtbu8gY9C0
         Vq/YDKHP44nwzJlUK5sqlPvzIFF7zYbf/WyvejKqpwAirEYCTMK2ZbbSl4bJEeA2xVkE
         c+CA==
X-Forwarded-Encrypted: i=1; AKwUvBzaZFUMiwjRuf1LGpGcCmozBNiij262U5ufJ+7WiU5AKFeQh2w8iqyKY9j+/d0pm0Unb9jw5LEcjvntQL04/vXT@lists.infradead.org
X-Gm-Message-State: AFuF++kIm5m3OKtdprJsmUtWqVXU5odJwIXeSfskQHnFpW6IUam8+7J8
	KBJh6BdKCEfqiRtERdtCPsAGYWpeENcyQRhKigDU8GJAr5n3FC4h10D7PzMtetKLPQ==
X-Gm-Gg: AYBFou0xQd8aGwygoap473fwtFUCAubrayIJ9JD/LGFxb+JVrKuJJDhBDSQvEekJjNM
	harLqBzJfHcBuhhwA9O8vJ0suxiPNmJCO2aFn0qGpywtX0XDzc2fSjx0tgEP4+SJbwFu7tLQgQC
	WFvul1R3zr6r469lNEVXVMkyFrR5XW8NWt9aPuppwC+iP05ToOvy8JS87zaSUydG6gl68rHQq9c
	dBe4+OroeqJQCN4aBLDy+GvIFgTY+gTOE+ZgB6FkpKCDWTvn4jF5y+jpvEGDlYXsRNe6On7hqC6
	WapEItkkyBrwtH5FH3Udv1nsvSXh871ds9DdDSHKe1UUhLH2WmVr+V8UlT/9t8KrZj8wAd+7yB4
	rF+2uPZipEc02QSnfoux+KgqUSwhIZEZ4E6o4yQj+lS4y7CPHmOyeuF0A5iRXKCoqxccwW9aQ+6
	Vu9okx1R25jgp39owPb7EFpaQ42B/91n0ZGrauxucPArNc/RGNVW3OEB/UcZYQZtM5rIihiECzf
	1bx3v1TiwqRw3N9YZvWl5+uYKsESDAP+1LfR1CcLnuR02zl+/o=
X-Received: by 2002:a17:902:ef52:b0:2df:3b09:664 with SMTP id d9443c01a7336-2df69dcdbf3mr30657015ad.32.1790187971787;
        Wed, 23 Sep 2026 11:26:11 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm15475075ad.64.2026.09.23.11.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:26:10 -0700 (PDT)
Date: Wed, 23 Sep 2026 18:26:06 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Sean Christopherson <seanjc@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>, Shuah Khan <shuah@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tariq Toukan <tariqt@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 06/10] vfio: selftests: Allow drivers to specify
 required region size
Message-ID: <arQZvkNtgq-NlUkh@google.com>
References: <0-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
 <6-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_192616_198585_B1000336 
X-CRM114-Status: UNSURE (   9.91  )
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

On 2026-09-21 07:35 PM, Jason Gunthorpe wrote:
> Add a region_size field to struct vfio_pci_driver_ops so drivers can
> declare how much DMA-mapped region they need. The mlx5 driver will need
> ~18MB for firmware pages. Existing drivers pass in the sizeof their state
> struct. Since drivers all use only their declared state we can use the
> value directly and remove the SZ_2M hard coding.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: David Matlack <dmatlack@google.com>

