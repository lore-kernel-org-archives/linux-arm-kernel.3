Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C90CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtQtx4AiOoxIUWF52v492teIG0M7J+4dI2QJwDWLz0I=; b=iYvPxB3QuQdf6BkcrFCUKEVgd4
	sQdPF+BfTVgcRLfGxE6oEvTmomyc2/aZUcVBzdokEa/XlcHcE4epmyWkZA2FCrZzFiq42kUKpAze4
	DMTzsVLJfkevUwD0jfzmj3SLbtYU0YwsMbaZfrFiUFygkyStBX2posP09xzYoLJwnMBeyLMNrxrfC
	cF/fhrmJ1F0H0yWiIPZIRt/jtBAvQJlPb32kp+IsH+iQkbZDQtwGYYOnUwhFoqq5LKMkrnYRYYnwR
	iX+OnIrxt26jQbi7B75fEYRTghXSPdJfLE83JTrMdT3sVh/uEswNRsYVE5jbX3Byb0ygKJk+RWTN+
	1m1//EUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGvy-00000001QHk-3cF6;
	Mon, 28 Sep 2026 19:22:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGvx-00000001QHQ-2m1Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:22:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CF4060120;
	Mon, 28 Sep 2026 19:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C361F000FF;
	Mon, 28 Sep 2026 19:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790623360;
	bh=BtQtx4AiOoxIUWF52v492teIG0M7J+4dI2QJwDWLz0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PbWcEIwaUcODHGEWBMbiqHhtpku8qEZ8fQhiKRaNWnk16t11t8skaxOev2PtGa0fU
	 12Xb/igtIUBYB+dLAbDmyJMHBy4H57dPnbrKr3Jh0c718ZSQDgRDYXrmpqPnicFZBG
	 SjE+Ug5FK9OVyGYh8gyFjJ/gy+cUzo9MqXOUBwhBFUNgpfEt3cqqQwTeXbxTqEI3BK
	 GDJuEvvYsA3rwpwXNq7pYOlbBvXNbPTEQSVZUnPO9GLdV5HaqCPPuAUrtPyZXyAESY
	 KaTPDy7yvIPdvqAhdOgbBtU8lxMCCAl+OKIItBJ8X+g0ooydylrHmdCtqMAxsTpmBQ
	 tZjwOXvrOw/PA==
Date: Mon, 28 Sep 2026 22:22:36 +0300
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
Subject: Re: [PATCH v7 03/10] net/mlx5: Extract MLX5_SET/GET macros into
 mlx5_ifc_macros.h
Message-ID: <20260928192236.GF563127@unreal>
References: <0-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
 <3-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
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

On Mon, Sep 21, 2026 at 07:35:43PM -0300, Jason Gunthorpe wrote:
> Extract the entire MLX5_SET/GET macro family and their internal
> helpers from device.h into a new lightweight header
> (include/linux/mlx5/mlx5_ifc_macros.h).  device.h cannot be
> included by the VFIO selftest because it pulls in rdma/ib_verbs.h;
> the macros themselves depend only on endian helpers, BUILD_BUG_ON,
> and basic C types.
> 
> The moved macros include the internal helpers (__mlx5_nullp through
> __mlx5_st_sz_bits), all size/address macros (MLX5_ST_SZ_BYTES,
> MLX5_BYTE_OFF, MLX5_ADDR_OF, etc.), the 32-bit accessors (MLX5_SET,
> MLX5_GET, MLX5_SET_TO_ONES, MLX5_ARRAY_SET, MLX5_GET_PR), the
> 64-bit accessors (MLX5_SET64, MLX5_GET64, MLX5_ARRAY_SET64,
> MLX5_GET64_PR), the 16-bit accessors (MLX5_GET16, MLX5_SET16), and
> the big-endian getters (MLX5_GET64_BE, MLX5_GET_BE).
> 
> device.h includes the new header so existing kernel code is
> unchanged.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  include/linux/mlx5/device.h          | 117 +----------------------
>  include/linux/mlx5/mlx5_ifc_macros.h | 133 +++++++++++++++++++++++++++
>  2 files changed, 134 insertions(+), 116 deletions(-)
>  create mode 100644 include/linux/mlx5/mlx5_ifc_macros.h
> 

Thanks,
Acked-by: Leon Romanovsky <leonro@nvidia.com>

