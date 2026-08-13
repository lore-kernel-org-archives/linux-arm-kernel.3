Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B806C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 05:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7PeLXe+ue8rItbBi6+JlGfhsV/36WDiPAKPGI7m+do=; b=3ZPV9N6+orUQcmq0SroIunubIq
	CcCgSCjpKpwsgEiGA5q3/ro+a1AHWRm4lqyv9UTvPDnWG4a+vWQzzxvFOf23w/+tZJkxMijfWCSEZ
	QnhuWTWqAcmGF5LoB1NSrxk3W+dZLYZK5NexGArcN9A3cgfBbDNjkb0dwehanuSeChrRhD1Y+QMVK
	S2rVtwdJBa5EFwSqVDBJf0MXFa3rD7OWneLVatq/FrJU57Jj8ND9n9Q7FlO4Pks1QZSlQK8cyFCrn
	2AzwJv0LwY2Ohb1GzKzLwKqTT4A0X2kNxU004JaMThRCiNxrbAXIjZBC1JTRdzJVYZmOl+7LoP709
	k5LL7WZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuORv-0000000HS8I-1z4o;
	Thu, 13 Aug 2026 05:57:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuORs-0000000HS7w-3hxG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 05:57:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so2598395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 22:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786600671; x=1787205471; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+7PeLXe+ue8rItbBi6+JlGfhsV/36WDiPAKPGI7m+do=;
        b=UZ537i4ZntiAO2eNWzgEwIOrD3+WnuquYPcAb7TwQ5ymRmbatfCcXWIbKgc8wmS5qD
         NVoFgYCd0OST5ZSkn+hioIBJLnXHKqg4PsnTOj+vZQYn36zUItK2LP/mohcvDvGyCQNS
         5AZZCY+oy8HpXslpxnp7hVuCskcsf6zrxmckxi+oovVvaagcZcpaad8PugaxM4u6cLg9
         HV+2m4YEYZCgvE41joedINmlJwRKjoo2aLXz/C4+c6/qs8sRtr4EwwKPXIgnHKe7Sm9u
         sXXv8IyGvhSR5V+ww6lxvde94+6AthivlRlm14OuTMgQvAtkq8J0ECQwET+g5PoMSwVE
         cUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786600671; x=1787205471;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+7PeLXe+ue8rItbBi6+JlGfhsV/36WDiPAKPGI7m+do=;
        b=ALs7kpekvlEFwY/KE4vNyZZSg6bLagSA+Fn5kYWihc5A1XLaJVYDI7N8QnyJavAsJG
         erBMJeD8XbsB58nTncGz6EhwxkRX2zm4R40nemCXKojSbnHhIRhqhj1GdeQhMTB0v2zj
         0gTU3EZkWQpYh18vdkhfePgD72k/vXXMma5jAqGDHuszTtxdWK95iFnCFzbkWlC05EjS
         zFl+l6BocNbS2Ja7kq3DapQV1JiF/3a2M43oeB9qTa1VIAsKhs65qJKR73lbDD+V+rzB
         yjOEXyawYGiSgD1505g0uVKnDYC5Bf+qSWkbJgQXifWbY/4AMfkkDEasAP0HZJmW6jer
         pGrA==
X-Forwarded-Encrypted: i=1; AHgh+RqReuwRyoeruNjqRLsIoivTscPVHXYpCJmD7ztaJumDk5N/DRUkbrpcTAwjuJpOZpAwvV5xUkalzjMfPwQHMWq1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4tVl2ie46tfWt3klC5Rcza46/wy1qCkOwTCJ+SjBra/iR+UTv
	xzxFF0CXbyAh7LwBXzZUStMrhc6zCNP05Bjo2CGvjVvjUT+XnA396ohJ9XALNoce
X-Gm-Gg: AR+sD100iqX6BoxVIhiJzxE+/VqthQGIzFqG2S5afTadco12s/sFw8VuutRknxsOUgd
	dC/48D8+b3uW6HEJsFbLK2lctlsFUexNu3Pok3/lOJpecMZBBhykwp1hH0IXR2TYLTiFLk+Upn3
	ULEJGsXUXfp+r5LkG7OovJAbF77K+7+2FCRy2cIy7sL+mlsDoaSKmxTYvLtIr7VkS08neHRPsQk
	tev5xjvj3/IGIrpldILPvnvICNlWjjbMnIy7Zo0QK/XOj+NHLeD983yEmrg4l2PFsKiRkY4/D52
	bbnEGdSjKJtbR5/ltqdEkThC3ZmRYn0+ibDayjSX3W2PJqpfi/eMOwXqztoV2OSeS3ySFz9Jf9A
	OBEmt/WoKJtxRDt3x4MoBNLpVNUG+Qxdioa+wOi0HXo1z0hP8Qoe46WdDuzFw/yLW6JNZYqqJ/n
	jgOyezRXbRmqgr7FVxDmSFdhv0/SXWKDfbpwwr+853OjZ9KM+TikJpTcYpTZ10gojmB+hLwnAQL
	QAIDYdrD9mmZ7AAmGRKqBujwylZAzR+oBuVTEx9Ga0nDX+pW4DqTBVAtXVCNTj9wdk9522yIOM/
	Rb2RHe1k52MS3tVgrXgIAHROCiDV8RIvGhUyjlK0dlhQaW/OjYtuJ7O/UIhSp7z/6kY=
X-Received: by 2002:a05:600c:190f:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-4998218e63dmr29591735e9.14.1786600670592;
        Wed, 12 Aug 2026 22:57:50 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-9c79-1f01-1565-573d-10dc-99f9.310.pool.telefonica.de. [2a02:3100:9c79:1f01:1565:573d:10dc:99f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998216cf70sm28991305e9.12.2026.08.12.22.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:57:49 -0700 (PDT)
Date: Thu, 13 Aug 2026 07:57:48 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Eric Auger <eric.auger@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] KVM: arm64: vgic-v3: Roll back failed
 redistributor region setup
Message-ID: <an1cYl928Fue-z3s@gmail.com>
References: <cover.1786344511.git.kmehltretter@gmail.com>
 <4e00fc25aa61ec52e6ef033a53588ce3f5550982.1786344511.git.kmehltretter@gmail.com>
 <86tsp2139b.wl-maz@kernel.org>
 <anotFcOP0kcQJwrA@gmail.com>
 <86jypv1lxo.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86jypv1lxo.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_225752_962518_280DA100 
X-CRM114-Status: GOOD (  16.52  )
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

On Wed, Aug 12, 2026 at 02:57:07PM +0100, Marc Zyngier wrote:
> On Mon, 10 Aug 2026 22:22:37 +0100,
> Karl Mehltretter <kmehltretter@gmail.com> wrote:
> > Is this closer to what you had in mind?
> 
> No. I want *all* RDs to be gone on failure, and the next successful
> registration to result in all possible RDs to be matched against a
> vcpu if there are enough of them. Effectively an atomic behaviour from
> the PoV of userspace.
> 
> See the patch below for what I came up with.
> 

Understood. I believe your sketch needs two small adjustments:

free_index must be incremented before kvm_io_bus_register_dev().
If registration fails, the current vCPU already has an RD assignment, but
there is otherwise no increment for the teardown path to undo.

The garbage collection in vgic_v3_free_redist_region() should remain.
VM teardown frees the regions before unregistering the RD iodevs, so
removing it would leave rdreg pointers referring to freed regions.

Does that look OK to you? If so, I could include both in v2.
I'll also split the selftest change and have it check only the
final state after the retry.

Thanks,
Karl

