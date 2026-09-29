Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0C0CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=; b=bC1bL5oODX7zMPoAhif4I+TBZV
	vemcu+a27npsLDYqMpi+Q6VoTSO9/O+s6HDNXen89d89xMzfPYltOaG/Jg5R0pKSqM9IsZ13fJ/nm
	zQv4wJZrdeZf8t+Ya9igGkfhiXDz93npFHja5rUqHn1MFvMbzJiTw4ymtTe/urnd9OBdhC1Yw9rXD
	hvM9UdhAEk75AFPiNLvMnwr5yY0FnVtEw5oYNb0ORb3HFcVasbMsRxrCHJUSKlOrQrPtIdGiDQWXW
	bcd3ULvHIdq7tduI/6fYJGL3NRFpZ/7bRiPT+3nTEYfLQGTbppeb/hS9L+XE5hXaWW1MRJPcqnFCp
	DbqzzMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaDq-00000003zXy-1UTC;
	Tue, 29 Sep 2026 15:58:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaDo-00000003zXH-10Dg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 15:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=; b=XgCKIIE8p5VUyE4aOMC71ALpfG
	0ccG2Yn9sj7sugTUUAbK7BxPuuVFIhKEf9uLipOFEPk1tDK5wZSzymVXF8abs0kQCGxekIHiUClHy
	qHxJLdyTRZJQH783+/4YLRQiQkAOeSaOihW1NiftLF6bi9i0m3G/djYLs1CglpBm4/szdQ8ApTg/1
	jY6Hyh/kgThkqvKgZk+SCMGb9XgRwUOxvy1EOHmo6VNr5vKPYrx3Mm1O2ydn2VfvBgzeFaCQo/xHR
	hXk4tT8OxzYVzKREwZgSKNUsTsPCayWG0VPb5qp7DW4OjFyl8xFloxJvS08JuHUWfmN+eVj4xMkKO
	TZRAmehQ==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBaDl-00000002p7Z-2HCm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:58:23 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d3931so33268335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790697499; x=1791302299; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=WyeQ18zT+sX1yxCCH++cYyWkzgLUvgfmuzud5LGJphcQwfuhinMHRKtDEct/Z05aL9
         ntOur+cZBO1llGyKNY3Vkp/bUlGci1eOMfvxRDKkab8XcktrgMs+wtXiaxjrP3Fb6Q2q
         KxDGoU0NkFzBzLgXw61SQoFAHm9vvIkjgJl7pTvXxdQ13p7U6Af2K3jIcD0Asaciu797
         ajacg25qt9dAppg3r4X4dAomkLuHljwlml044yzzsgsWn2pVwcvvfgQkcSXfuVofUk+a
         2HJJkvd9T7IU5ZSB64rBvfa/1rJ3GVx+sBYjwaCZsGEappcsNiRq2aFSRt6DnRwoBR8M
         CoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697499; x=1791302299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=eyUi/UKqPNsPoHqK4NkFrq4HzwVxncC0XsI5pOCUWGzfRsrXy8loWTl9jJnS+oKoZl
         E2jVB0C0bUQ+W5MV6ceSozme3jLntTyZQ/1X0Oonbeh8HYJ2K6Heeb4mS4oLBwjTlkxC
         6A/HHiDeGHCO3CeczgEFtXPlGWKSfHLS0F/Htvx+JBsBAmd1DSHrAeZz35dfCsTCMdwV
         G37MnWd6CHroxoramsvRUdbTCgOIMsOJEnNMOtjh9IfS90IQKVLy/CEY4mwr/7XmHIn4
         HssSxcKH/SAyfo4ZNHcBh1ooLSm60Hrbo9+WCqLz+o4B//J+PSW4m0PS+4h4nyPj+ULe
         Yryw==
X-Forwarded-Encrypted: i=1; AKwUvByL6SkvZ2C1oCoE7Ht+6aGPRBn9w6KzKS56Jq5s+0Jr3qQH2RbOudaZaWw+7sYBYEx411t56e2hJYdmvG1RvRPJ@lists.infradead.org
X-Gm-Message-State: AFuF++m2Qyg1pfBWsey3sqdfBJWKk1MJgUbbs36jedhtFILkbtxaSkk3
	r4WF55sfncHfW2l8xBXtqjPzyZKHkyO1TCJ4ImuDHqKmLirnL6MyFMD3eaOEm+1nKlo=
X-Gm-Gg: AYBFou2j3+Q9JuL4Y9BB+bC5NFiAh0u9BeF+sd9hmH3R+dSXnf5UBDeo0qhJsUXN3dI
	EXLU9M/MktUM7zcFb9saVj4EbvdeYHY+Pq7EgonX4nyMWvUr1oXU9tc+svhppvSW2fE4S50G6qR
	SZx+37ldliuP4pwhXstWjUsh/RLIeWhl7Jm5feMLqooDGSFILnbWw8hAgj6ZrkVzPKv4NVGQUsi
	rpRqDAi1E2d3ernn6+GzmCyRxKWPzPFn2ii0mctzMUlYa3NmIiQtSkB+xyGkl6fxa/qjcjAlF83
	jN+ORf2FZqo8sQNQYNrGwGANtCH2/mN0ETXDozigslxjOenC9o3+3ptDSNqdFoIHtiXquWf2l7Y
	iXBLGv5ZXzrEwGw6YEDap8hGfAqk8djm1RDnmvA5FYEYB+l0c7YEi5c0pXG9upg8THAR/By7gN9
	DpePIhXYhrj6ybazmfVTrBXNOvYk+Wb+DEC5Pc+/l4RNZDKctkSv0XUbahRPcLAum4ssboa59dW
	d3J
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr284330975e9.3.1790697499193;
        Tue, 29 Sep 2026 08:58:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::5:5c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9dfdbsm127631095e9.1.2026.09.29.08.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:58:18 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:58:16 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 06/40] mm: make map_kernel_pages_[prepare,complete]
 internal and unexported
Message-ID: <arvf-dEnIzsXhzkL@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_165821_621165_F6F0D4B3 
X-CRM114-Status: GOOD (  13.53  )
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

On Thu, Sep 17, 2026 at 05:22:15PM +0100, Lorenzo Stoakes (ARM) wrote:
> There's no reason to export the symbols for these functions which are only
> called from internal mm logic, additionally there's no reason for them to
> be declared in mm.h.
> 
> This patch therefore removes the exports and moves the declarations to
> mm/internal.h.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>


