Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53453CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3j1GsvDFG4oGBkWvUsNYUZ4jWPGCGdM9fhJMq32ExyQ=; b=DqSc+RD50EpDp7K/ZVlJlhtgAC
	p9k+F69+MpHRfEGDV821/lF0WFn3U7RmLdUvrwT/fV2jf8TssPcVRzRKr1ZmUzjByQh4OYpFcMpZe
	Fxbbsg0QgJ4U3XugwmlHc3VvynEbMSHUdZr7ZRv5j6gMmI+Y0iRumUyrTK3Vq3oY4xlnMOyd/9mr+
	25Dpo8NjuWd7DG4RqpSB0Y4v77+yxiFIlifiAna5xKHCACM9s4IjheCfICLrYyKuDObyaA2Krb5Wz
	CXIh6T69B/PVvVL1GLK+40QBioLOKUOwK0Hlfn8J6W8T3IxaKIHw8b4Gcp819DW+uHNfOezblVbXc
	INnhsrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaEm-00000003zk6-4BtJ;
	Tue, 29 Sep 2026 15:59:25 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaEk-00000003ziR-0bPu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:59:24 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48884b0219bso2217815f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790697560; x=1791302360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3j1GsvDFG4oGBkWvUsNYUZ4jWPGCGdM9fhJMq32ExyQ=;
        b=a9AyBOA0qUBKFP8kaZRahYjiDQ4/UVNoPCZRXEb3X4MjeSbcYDjFt684jY8f83tklr
         Zv/FXBquOQ0VadIf3F0LuDpASywXJmKMfH4E2nCxxsU1kiGmAGlaaccq6bd/GKO/Hsj9
         FUgvlSFpP5NNi8MJ8Uvtsu7IhiSNiRO5UyoBNJXfYa4MJn1RZ2el9UXgw8t2RLHMJLrm
         LqAh7aH8/qErXZFH9/5Z4MWdn1HPRvl1kQyX0zZ64ZHyBzkeiem4LbmpmGgAlqyPfl9n
         G/g+rjsQT1/Bheud2UmMnT9+ie5hckEEOCZMvq00zj21kPquDPkUFOlrTGFYrSDUr88b
         NpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697560; x=1791302360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3j1GsvDFG4oGBkWvUsNYUZ4jWPGCGdM9fhJMq32ExyQ=;
        b=aKXtMVY1tO100xJ1rburkwxuSUD1VUa3GyJBD+Lt6Il3ylPTdn1al4tUuHpvhzZ/lf
         FPQeLXGtYhpOAqeuaOVgDYjEe38Ox/EhqWQu+CfALpp5//8/C6/IApR5gaZ+B/G9pfzR
         fRjMVr8W7QpHUMa6KLTpJ8sjctkublblQObJO8OUUHYm3CipL+9lK9qI2itt4aO3RK/p
         30rXHHO2E2jvPVEMCMHKaHc4JFOkUIhlNm4aSTjZRLMFcTAN9tv/KJsnZC3TJvIknUtZ
         UOdIWH1UFqWHKBoAs6/dEnVxsDPp2kv8O9FcZe/vJaLboH5KVQbjdNgd67PFgI4CNbI/
         yhzg==
X-Forwarded-Encrypted: i=1; AKwUvBxaQVIHzREB9b4TpZjsUfGUFL9d/Z0cDohtUu4q/1evTuExfFbL+SEDW7wmcFqkaZkJ0F7h2dUiovoMyNXkbRlS@lists.infradead.org
X-Gm-Message-State: AFuF++nNaX4vWjQnBPWDWc33rTwt15gqykyCKWwED8cFPHr0VSl/j9RD
	t3y+pL3tNOjLca0/eA1gzEFIN0JWl9sAxdFHyz4/mtChOYAAf3n/9rryVfWTAU38e+c=
X-Gm-Gg: AYBFou0meaf7Ybm4MJjO4CcIlWzRJSrmKjjDMHXXTUMPdxMZ4eaTCwKtMLP61PKSUA4
	zESN2fw+bJVB2cHD2kYvnCl56eJLJPRMHcJ7MUooEr/Qjs+nFdEDBLCbI2Pu2P1Z5G+H0NYGOpp
	wb04ey7jmMpvmyUmd8jFY9aevNUgpBe5ksgM1Yp7zlTWtUYF5fBMFnLtHUkNAkCmqzBoSa8JFCO
	X6g+jaZ9jQjZqQmhuLcS3w0G3AqVmZGtLDjC5R0sdVk1LTjwjgkgnafv5WviMqqJm1sflaMpV5Z
	6FClrUuWCiVjFw6Pizv7mOia8Cqhcqowfh62wXDr9qvdLOq62MIZe4dX+kKcRLZxHM8TVx22r/N
	LhYpVFzhkjOe6DNqa87tD7TGe0qjC6Ry9zkwYTJ5X0vuQtU+3yjWwNnN4IbPgb/EaAFy7A2CJTl
	0xqkaZjymvf4ZgIzxMY1V+fExnAE+c8t6eQDded65aDmzbujd+JpCbLz0P9sJdfY9Imw==
X-Received: by 2002:a05:600c:46d4:b0:49f:ec98:f030 with SMTP id 5b1f17b1804b1-49ff06f839dmr227620145e9.33.1790697559827;
        Tue, 29 Sep 2026 08:59:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::5:5c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013c6f295sm7062155e9.0.2026.09.29.08.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:59:19 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:59:17 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 07/40] mm/vma: tidy up map kernel pages enum values
Message-ID: <arvgNTUgcO0nPh-V@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_085922_193521_DC593951 
X-CRM114-Status: GOOD (  10.53  )
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

On Thu, Sep 17, 2026 at 05:22:16PM +0100, Lorenzo Stoakes (ARM) wrote:
> MMAP_MAP_KERNEL_PAGES is a mouthful, discard the MAP_ as that's implied by
> MMAP.
> 
> Also while we're here delete useless comments for mmap actions whose names
> clearly indicate what they are for.
> 
> Also update the userland VMA tests to reflect this change.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

