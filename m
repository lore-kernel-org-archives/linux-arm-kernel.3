Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA9DC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 01:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhTAK8kd+tCRfVOm3LmowAQ3BoIBHWxZmJ5DLNOQvkM=; b=OsrHGEDvILH4UHhUys/ZJbc+Nv
	V1omnnSMAhBq7vatgA6lzJ/ymCZO2uzp/qGt3SEyd6/JBzjuxS3I6Fz8wLGDUhnEUOxZqmUbD8Wfa
	Mu+fzEQWhpBCbt98M3i+YSeJdoV9WoypMUP++jwAI25YfbZwIJQo6f6ncS6ljs6GBDOl58xY3LZjU
	pKkunpQFSHD89ban92C+btPL4NCX3h/ZRELiWbq+wan0jXsZtUVsLiLWHu+uUxxoYeIRN01oPWoA+
	nBjfkQHxceydGOLBg3ElH5oZfd7c+pbc1cOAUYcxb36jTWaEfDXWehgRRlIDXQfYkbMwZtor6ZA7A
	kGY1CHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws99J-00000006vJd-31Yn;
	Fri, 07 Aug 2026 01:13:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws99H-00000006vJD-1UpF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 01:13:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so24899165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 18:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786065201; x=1786670001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JhTAK8kd+tCRfVOm3LmowAQ3BoIBHWxZmJ5DLNOQvkM=;
        b=Ia3rYmy9UmPa+FvXgL1nVmHktVhlr18c4KNrcdNvCcHyjMgQH6YqWGVFZgvmtIF92u
         uEM0kQmbvKL9S9VTXt0VE3i6fwjhQHBk8I/CnZnH2CoufqIdrxrb+ecemIlDY2dL9Iws
         1NftVxT2VAt3eHcTiE+MMcV/PGheCVqKypKxzVUloBvsuuttFli49mrmjDTtQ7jPa+kL
         AzJzR7sac2UWFrMVOYqFksw+iRSEZYeRcoQe5kXaoHtgoH0aVCM/sFD/Qbn64/wgwszx
         K/xWt+EaL+rqd/BP/8BacSzx7H1T80gm6Gawg5aqzBCqFrFdBdK9qGneSKicpEn3It/v
         MAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786065201; x=1786670001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhTAK8kd+tCRfVOm3LmowAQ3BoIBHWxZmJ5DLNOQvkM=;
        b=fVL4Vg7MpUvbUFKNGq1uqAFY9OihuEXKv1lWqa2wfa2B29zNLfm8gY5LeprYwxJ3B9
         TfTULC0tFl9NxCOEPAf2ZP0Nh7LL4TvMCYuTSbK1ZOP11gOefEmW0RyKojfbzeyxABhy
         hNDVLCNAa9G2Wiz9hbjKcInPgEpr5D7YJ55SXAUHRI/s7qEr1gF/6G3+ZZkJbkUI3waw
         YxTKf/85dwTac0rLayiK8UQ9tUOKmmfqmcDp+O9M6MYAN4263PYe4zk25ixulNto4LiO
         QVoCWEOPe3hCsVd5ge4dqKvU3xRY5R16YaP5BrESj1O3RHmnlIpoyhaeWib2Qg7e+vNW
         nI0A==
X-Forwarded-Encrypted: i=1; AHgh+RrJJALZlhsYV08kjdTjEX9UihlpHNXA3N1A4IcltFX0bzLHZJROFqYgYt3MwSDOLKbLthn4kL5jj5gxxC7HhVX9@lists.infradead.org
X-Gm-Message-State: AOJu0YxN9THo6c+ijJLiPHKNk9PjsuM3GH9H9MB0t0+NDMCYMjIXmDAv
	+MlViGCc+5E5InZzbtTVIZz8ASLV0xEyRyZppKFb/+CM4o0T4tRIwzEg
X-Gm-Gg: AR+sD12iva7MATRcrjBeMFdVVRPxBuHbBU0KTqn/vc3e8J5vUNTO/HNIV00rNM2VmMM
	w+u2qOrohpc4/VaxXDbVPzMNmbSY3Pn2pjvJLVW59NrwWA4n6vUFsEuYBsegCAhc4IgznlRrxr2
	OWV//pUOFnrHlFuu12BL1npgGLR9ok/FdHI9in+baN5Klc2XlwY9AkOLqteQIZbJIj2DEw8ytr8
	5yYigylFB5UqgqhfnyKWGtTn3ncWEzncPe69vQm0wjvfOnovRjNZ5JqkSQQ7qVSeReocoVhIDce
	zsnYeAhsNExm8/aj1bTC8uIUHoPJ6bcjToLQP0Zd1YOlmOFj4nOiVWbRUaKu69TChjGKWaTkq6n
	1KhUNPyZ959hG70DEM+MOg7/PV+dmWRMxRnDTKfCb+UMgJ4xs+/UqYip8K3XUyP1s4oi5eVg2jv
	iSW+jxGC1UMJEv3y/2zIXu2LrAR52vprTGb/Qn7D4DLUUdPkbM74ER3zBky/TJGBSngZ4qvBqV2
	EtmNJYjU3VBZ9gNVD2CTEeqYd1wGserpZ1kFRkVQrPkGe3CGCFaiYPrdOaKOSI33fV7yKabj/Ie
	1uLUrMMgGy5/+48cCEaoRoLKnxrnQennzzCsN1SHcmI/m8txEOgg2M+lG4YZHhAAGpHZQcPCrXs
	Ou6xjDU4=
X-Received: by 2002:a05:600c:1f96:b0:496:c249:dd9a with SMTP id 5b1f17b1804b1-4994e71364fmr228063365e9.3.1786065200908;
        Thu, 06 Aug 2026 18:13:20 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-adf9-2301-8c14-6be6-a9e6-a2d4.310.pool.telefonica.de. [2a02:3100:adf9:2301:8c14:6be6:a9e6:a2d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c8bcca6sm13771385e9.4.2026.08.06.18.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 18:13:20 -0700 (PDT)
Date: Fri, 7 Aug 2026 03:13:17 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, grayhat@foxmail.com
Subject: Re: [PATCH v3] KVM: arm64: nv: Keep the shadow S2 MMUs at fixed
 addresses
Message-ID: <anUt9gd8HIwaj9jf@gmail.com>
References: <20260806192451.10169-1-kmehltretter@gmail.com>
 <d5svhw3jkjnkucohx2ntwhphemgbtfcmjt2zoyyw6svz56zfrh@z2ziydov5ras>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5svhw3jkjnkucohx2ntwhphemgbtfcmjt2zoyyw6svz56zfrh@z2ziydov5ras>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_181323_409262_4D91E722 
X-CRM114-Status: GOOD (  12.92  )
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

On Thu, Aug 06, 2026 at 10:54:03PM +0100, Wei-Lin Chang wrote:
> 
> Hey sorry for nitpicking once more, I actually like v2 more, as this
> version splits the error handling to two places. Marc's implementation
> [1] is also good, but that requires a twist in kvm_arch_flush_shadow_all().
> So I'd personally go with v2 (+my suggestions for it :)), but also fine if
> others have other opinions.
> 
> I also think the comment in kvm_vcpu_init_nested() is worth adjusting
> slightly, too.
> 

No worries, thanks for taking another look.

I was following the guidance in include/linux/cleanup.h:

  the expectation is that usage of "goto" and cleanup helpers is never
  mixed in the same function.

But maybe keeping goto is better. I'll wait a bit for others
to comment.

For the comment, I propose replacing the current text with:

	/*
	 * If allocating an MMU object fails, keep the VNCR page alive so
	 * that userspace can retry vCPU initialisation without affecting
	 * the VM.
	 */

Is that the adjustment you had in mind?

Thanks,
Karl

