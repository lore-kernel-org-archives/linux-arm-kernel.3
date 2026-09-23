Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A88C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 22:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4ROB5gmPay6sdQJPjpG61DXTR2zRREmvWIvdqy7Ui4=; b=SNzEHg3Xqbwh55StPBx+zjuqYt
	HsLst67KZ551vzotN2yqcOFJJCqzycCtpphs74NTinjB4H5Bwdyxvtqc20eUNV+5oSP/G71Fr65Vs
	avNKdgMnBaA1d2X6yV46Cu7bbwbyDfa3wu0VEeyXwTIIIYg3M6PVg6qkMGsG6rCj2OXKI2I3lMUb8
	PwZA+TNa3LTRAiNQNlsGjYboBcwx8bPVElO4hRJgTUkOr6KbFRapUX28m4WTI4d3qO70JeWMjQqGZ
	d144k03MfEL12JcQAXcKLpZzug8ZJpkeHypppaVGgfJTAVPoTMeK/XzWNyJZp+iIplzU4l+RyUw9H
	qRoTfI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Vg0-00000009fJg-2jux;
	Wed, 23 Sep 2026 22:42:56 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Vfy-00000009fIk-0B6D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 22:42:55 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1128981a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 15:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790203372; x=1790808172; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4ROB5gmPay6sdQJPjpG61DXTR2zRREmvWIvdqy7Ui4=;
        b=CjBDk4WwixJGHIA8e8eGF5F4jrrGdwcjN2w2pz2eihWJc2ttoAfT2cpNVXLbuBEOb6
         4TRBontRIYKq2EjKnVrtUFm9Kb7lJo8dM6Lu+YRVa8o7CWBXZ25Lahnl3x82KZpCjUGk
         1Bi2LSFCA86J3lwifU4Z2wIpNFXGQNVVHlvhM3ZxZRk2RPdLbppw4BzMoeoxbtjGtZRw
         3BLlUG5UXb3Ys9/RqV3ath3oPdRxnVZFjXgJgoFRmZu5YpuI59Fh8XichPGZjJPwhnAj
         s/DkKDdBQEXWdCbEsrz4z1ak5zJ2/Oqp/Y1kzsIHx1vkhYLXFxFKY2F6bGJSzQ8ckLUd
         BuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203372; x=1790808172;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4ROB5gmPay6sdQJPjpG61DXTR2zRREmvWIvdqy7Ui4=;
        b=GHVrtJ4xzfmfivKczPCkvhp7XTrfj8lq6hcFk86FQ21dFj3SDCXnTdV6TZB3/0KWTk
         axMoThoWw/uQJQN3QNi0jzYqDmqqEM4OmMaAqH+8691hSt34UQmreSSa+iWoDM3SV/Je
         mCmi4vBgzwB7IJD7TzjHKvsnzwPH8PEKV6jdzholK8n00goYAXbSV7obQEQq2XDOZlix
         0eFg/1pzt+dtn5wtM8vSyz+KpC5W5ZXOzrHr70eIzKYj6XjA625gPIyVSt19WosZ9Eh6
         YcH8VvzSJVsNX7DTfGdbE23Wsa7l7yIHV3KhtSrFizZM4roZH0MMaDHDh2dJqDzaNvVs
         WMzg==
X-Forwarded-Encrypted: i=1; AKwUvBxJdOldUbgJSpfoF8tJ/GgRjdSFg42ZQ+Ixi4hjNV1mfYuBYf1E151xDORm1ovl+k9rt6K+CM9g1O4ZEFsLQGqt@lists.infradead.org
X-Gm-Message-State: AFuF++n4RKXQjM4DWk/50ubxdCIp5mfsy4TuXK5fuwu1/DGDHw3mvW6s
	6B72+S6W6aeAIAkh2HuHA+1bFzblx+CW4y9Zd9V2H6WnP1FRLOv58O4EykHVdp0UW4KqbELQrJ9
	EjG0svg==
X-Received: from pjbbh7.prod.google.com ([2002:a17:90b:487:b0:3a0:8315:fa7b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f87:b0:398:a486:81ec
 with SMTP id 98e67ed59e1d1-3a0985b8f01mr435176a91.11.1790203372353; Wed, 23
 Sep 2026 15:42:52 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:42:51 -0700
In-Reply-To: <6-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
Mime-Version: 1.0
References: <0-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com> <6-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
Message-ID: <arRV6y-d1rkRV2Fa@google.com>
Subject: Re: [PATCH v7 06/10] vfio: selftests: Allow drivers to specify
 required region size
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Leon Romanovsky <leon@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	netdev@vger.kernel.org, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_154254_091182_3700429A 
X-CRM114-Status: GOOD (  10.39  )
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

On Mon, Sep 21, 2026, Jason Gunthorpe wrote:
> Add a region_size field to struct vfio_pci_driver_ops so drivers can
> declare how much DMA-mapped region they need. The mlx5 driver will need
> ~18MB for firmware pages. Existing drivers pass in the sizeof their state
> struct. Since drivers all use only their declared state we can use the
> value directly and remove the SZ_2M hard coding.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

The KVM test still runs, and in David I trust:

Acked-by: Sean Christopherson <seanjc@google.com>

