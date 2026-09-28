Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DB5CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxaPe3RXYWfDysMbj1dNL8wCloA5fdLhj22QTkhmqgI=; b=jsLLY6Iwuv+oSOntMRdPwFqRgr
	U/LiQiMFg54XpkTIy4Ts1hWgOkFvPKbmhcpP6C0D+FYGUXNw2w2/JaluEic/aBEC37Psy1lzJaHfl
	JGr+ff6XHZumQoSX08Dwsjb5JE92DKxfLGAke7JVAQXzibSg4d8MmSb8Nb1TMktV23xdks+6f4fso
	Bx0j7w2lPz7ImBh5LVgGnXJIG+AuIbzZXeXgiA8rsYjj1nUjM1qSDztmCtSOtz6TsVfVOm3sQHVZs
	nDpgHTTM77W7N8biIfqkObk44HKijQ2z85E95ubqaTydrHvHrK2U15s5BqtUY2b4FMQlfnnsBWlTT
	m9GoW3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGyD-00000001QYa-1tsg;
	Mon, 28 Sep 2026 19:25:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGyC-00000001QYD-3U7f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:25:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D20E60120;
	Mon, 28 Sep 2026 19:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385251F000FF;
	Mon, 28 Sep 2026 19:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790623499;
	bh=zxaPe3RXYWfDysMbj1dNL8wCloA5fdLhj22QTkhmqgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XYEG3iWArZn3su6Y0OK3+bWiRF575+VJU1q1+F+6KpJ02oYyJ9WXJX1dWH78AywBP
	 epGowUkfpKZONyTD2QyDEuS1h9FCT7IPC/xC640Ys19a4cm6rXRr9XfCDxlaWB3BGc
	 vu0xEdw9c3VLSmR9Xp1FViIj9iMn3+H3sIXFEnPiNhir4UQT8zqSjGsTlI6kFekF3D
	 4yGgHlvB9v/q+Gn0fWxY8KIWzT+xBilBwVCfRbnttO7X7GOnTVUsKSGpOTro/mclzi
	 ElIbrwOtezft7+rOlwl1tCtyLl2ApnJaqnbVvGJEBD94682YxcSIZy1b9sCPEAPyWY
	 2ihxu6ypJckhA==
Date: Mon, 28 Sep 2026 22:24:56 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
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
Subject: Re: [PATCH v7 04/10] net/mlx5: Add ONCE and MMIO accessor variants
 to mlx5_ifc_macros.h
Message-ID: <20260928192456.GG563127@unreal>
References: <0-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
 <4-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
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

On Mon, Sep 21, 2026 at 07:35:44PM -0300, Jason Gunthorpe wrote:
> Add MLX5_GET_ONCE / MLX5_SET_ONCE which include READ_ONCE/WRITE_ONCE
> semantics for touching ownership bits that hardware may read or write
> at any time. The kernel driver doesn't use the IFC struct for these
> ownership bits, but the VFIO driver will and needs these helpers.
> 
> Add MLX5_GET_MMIO / MLX5_SET_MMIO for accessing the init seg using
> the IFC offsets. They embed a readl/writel using the IFC struct to
> generate the addressing.
> 
> Add MLX5_ARRAY_GET64(), the missing counterpart to
> MLX5_ARRAY_SET64().
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  include/linux/mlx5/mlx5_ifc_macros.h | 52 ++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)

You should have updated the copyright in this commit or the preceding one.
However, this is not important, so there is no need to respin the series
just for this.

Thanks,
Acked-by: Leon Romanovsky <leonro@nvidia.com>

