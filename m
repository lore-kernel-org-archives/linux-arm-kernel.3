Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94689CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1e269Lu4xtW2duTVHt20I/6VEWYe79hxf4w6LtBB3g=; b=dV6MLFfxRSMdrGuVJzBpfRsqam
	v43IQyGwbadhs4313N36reEK1K+NSfBwzRkZ2/27rDg19jceDVCWejn34Qxva5c3iF+7dyEuCbsB7
	MeQ/FpaXt1HGNU8/2hrc6UhLU6rWB7eTU0YlO+mUqOLoZ0ZScM4g3KjPw7LlSjtW6S+CKkd+bHTCm
	4VZHRwHj0trDgrAW1eIuGTXyGej+dfHS3UxdGLbpvifM4u/JmmBRtY2tX2QqMJa21V8E6jc4/Gpqe
	zhrO3s5xSJ3dGf3JnJAYwULbDGrffWnUx5Am3AfVSV5c/RjXSHNoQidUXPP9+CoXWCV01V0ZF6cL0
	y4bv+rqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChK6-0000000CDTK-2A4B;
	Fri, 02 Oct 2026 17:45:30 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChK3-0000000CDSa-0m8l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:45:28 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af0707d41so72087f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 10:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790963125; x=1791567925; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N1e269Lu4xtW2duTVHt20I/6VEWYe79hxf4w6LtBB3g=;
        b=sidlCia7H8JwWkkHbcaUV+26dRmdmDJUR18Lagb1LdnbglInZdxj0qQDjMyaWhF879
         ooxz8fPNcfldjKJuBFE84GChaxdOcOtpao9hsrlI2BP1EzG568UpZMMBASGWDTDCvBib
         0i28QYaY2kJGVXSbzMRd4FEZ/ywdwSYX8xJ/Wqpi4WLfvbqxFX3s0CDuOxDXdOcIEjlV
         OXCn1IKAM5Bb6HU6/brJeOrrE00m5kTnS2rb8Fr2o8v7FMP83MMfO2gbmuayml+h3vAr
         JLvf37VSDBxZg6Lxs1k4I51pqo5xH1AV8p8johWIaRsSntFOMRVK70GGTTGSCL5Wajg2
         f06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963125; x=1791567925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1e269Lu4xtW2duTVHt20I/6VEWYe79hxf4w6LtBB3g=;
        b=LdG+ypvilQD6hwXSakXbujpGBQpxADCy9C63emmjzDvfcdp6WR2BDGNSrJahTzQ4Uc
         ppDXdzFlWx7H0aAAaNnZO2i1+ZhFmEmjYTKPgAsge6zZdhSOk6zdh7EUBcM7P7Z8ofRk
         0vtD+bGTUbUPN7Y7h2zOFrjUuBVbzPQrHi5NrpTr4+rGXwYgurgUmip0JWXAobnLuRyL
         M7ozz8vzyLbX2E100XgUbfSvEZZmkoZwIJWG+EibWixu9gSaJbDmhEahsnhHI0jEvQeX
         ZA54/y52bGfGIcY2VFskwGlJI+aXQIoOV4qgEqKLcKL6XJ6H27jgW32bGvEPMV1ejAWB
         u0yA==
X-Forwarded-Encrypted: i=1; AKwUvBwJIOHAftK0IlY5D4r/IgIvwlY2ZjxL7V8EBpHVomAc5NVUI2pbc10v5NU8vAQEzGWgPuMJLDTxq1Zu5yhpE9K1@lists.infradead.org
X-Gm-Message-State: AFq9FYKwfcnIxfyPieJny9zaXsLQUqjzG2fgPoP4dmpuw+VpJQqKz3kI
	lfMaz45GV8gn1U+Hf/JE4enCs//SoCktxlqPKAPoaZcv3XROoUswfqt0
X-Gm-Gg: AYBFou12bj7sLVwppbqM1/3FCdmOVFh0o9koCr9ZsWmfYUmdvCrRfZT/TodmeCnvV+y
	1dgDLsXMZg4yjdD+YoPw4YD3VG/e1S9XZlekfiovSKAJJZOPmswAhysemvWu9230EK8+uSw0u9e
	OGRbLH8LrBJN6K9EDl1Aq/KK5R+CxwrqSzwlOft8Gd9ImsclDauzgwSlQshCAcaL8eRUsaSnROT
	ibzwmQqu0QoRAQdIwdwbt6AWWQEYvOSVDr+mW2R/2frLg0GrKh4W7yhpdLLYHhcxNZVC8HizGwl
	gvqXeQYNY1ars9Xnlv2JwlS2+QtUs02Ghr5s0ukJYwYJe2Q0Bac2tAGydYWQdN5ohiO0YY8VQFx
	pdE/Y+k/Vnb3MYQNWTQeFsdZQa7OBsWNeJ1PpVOWFCmxyhApLmvxmqijOa1mzaCMjpErUprjbTj
	KHZqM1A17z/Qy9JGiRVrxlx78AqfX9cPtLj6NxuTmuzQLbprPf56kIe6cWAcBJO/JLwlPG7LcS/
	QpBDPZh6NDFsQ1Q7ffh/7+nDtrGc/nq3GbP8Lw3tHk1ZpEsA5CRpyN6nArgixDXlEdrRl9+DJmy
	/zRP8rUQhqccp6XKhQfcKE8YkDaixQwq3s78mEq6kaFMVRBYpq7RNgx1+XxFsZ2HOH4utZSSbv+
	0FhQ2qQ==
X-Received: by 2002:a05:6000:260e:b0:48b:226:839 with SMTP id ffacd0b85a97d-48b1273bfcdmr6851497f8f.14.1790963124443;
        Fri, 02 Oct 2026 10:45:24 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-af35-1901-81da-eee8-c2d0-ee3b.310.pool.telefonica.de. [2a02:3100:af35:1901:81da:eee8:c2d0:ee3b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0661sm6839400f8f.14.2026.10.02.10.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:45:23 -0700 (PDT)
Date: Fri, 2 Oct 2026 19:45:21 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Eric Auger <eric.auger@redhat.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 0/4] KVM: arm64: fix VGICv3 redistributor rollback
Message-ID: <ar_tdaYQO-t1K2F_@gmail.com>
References: <20260831081005.41346-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831081005.41346-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104527_242098_7AB9CA7D 
X-CRM114-Status: GOOD (  12.20  )
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

On Mon, Aug 31, 2026 at 10:10:00AM +0100, Karl Mehltretter wrote:
> Changes since v3:
> - Dropped the REDIST/REDIST_REGION serialization and VGIC init/destroy
>   rework, keeping the fix close to v2. (Marc)
> - Limited rollback to assignments from the new region so an older-region
>   assignment cannot be missed during concurrent vCPU creation.
> - Added Fuad's Reviewed-by tags to patches 1, 3 and 4. These are otherwise
>   unchanged from v3 (formerly patches 1, 4 and 5).
> 
> Previous version:
> v3: https://lore.kernel.org/r/20260822095346.53882-1-kmehltretter@gmail.com
> 
> Karl Mehltretter (4):
>   KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
>   KVM: arm64: vgic-v3: Roll back assignments from the new region
>   KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
>   KVM: arm64: selftests: Test VGICv3 redistributor region retry
> 
>  arch/arm64/kvm/vgic/vgic-mmio-v3.c            |  54 ++++++--
>  tools/testing/selftests/kvm/arm64/vgic_init.c | 116 ++++++++++++++++--
>  2 files changed, 151 insertions(+), 19 deletions(-)

A friendly ping on v4. Patches 1, 3, and 4 have Fuad's Reviewed-by;
patch 2 was revised following Marc's feedback.

Thanks,
Karl

