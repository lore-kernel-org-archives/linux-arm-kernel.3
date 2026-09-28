Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B7DCA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjyoOz0KsWQkFno9NOBUUr/sWby/N/75GVMSb1/DBSc=; b=ZGZDijbHf0CLysph71SnkkPJPY
	qyvks+woYOzbmDz1fbEP+cqLDdIu3cGgAGhQxNeH4AxCWzHmhftUOBMpsitgo/ggOlnXY6BeYyU52
	anUYWAvlGbircEtRRwe2uIGLLiNIkCRFkyVUs4XfHwXPscODOpTQeikveNjsgljTMWPxT81zVHFrT
	z6DI9lJna78rPysYrGcC95B++IPMklit+uA/fQL9FG33MnGk9QYs1rX0J2S/56xkjCG50qIOx6+1V
	Y3A8mxIst/tKtvaMAr3ybMwNybPYA+J8A4zAl9zXxdrF6p2lGHVXpjQjsO+RMGr7e8QHETgzXGyro
	ePYzGrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGv9-00000001Q8Z-2Wt4;
	Mon, 28 Sep 2026 19:21:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGv8-00000001Q8K-020B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:21:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 696F440AF9;
	Mon, 28 Sep 2026 19:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41AA1F000FF;
	Mon, 28 Sep 2026 19:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790623309;
	bh=OjyoOz0KsWQkFno9NOBUUr/sWby/N/75GVMSb1/DBSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MILeeDzRp99qBDIzkPGCbW2f53JAegthHipxBvkmjnNWzxzQ83S5u3cp9d/PkCCmc
	 UCCxnOZ5Cx+mKajzqzKDzFlCF4GYYjCakrowKRwuAp9o8dJds6utDmIR1hp8aPD26D
	 ZKZmEgLILYgMYp9emjLag8T3z3/XU8i0h98p+qZ9DSui+HMfabiubv1ap+hcBWtTLx
	 pqEPtgBBjvL+/3oNu13qkaUpsfGDW+H44+tKLsnkuLpghkIC6Rzb/w46HE8WdI5no6
	 EBIWbNMCdLarai8ktEfB5VItQnjYozThknmBZ0XgI01donUiERXuUsfMKhY5rZge7U
	 j/657lUFBgNiA==
Date: Mon, 28 Sep 2026 22:21:45 +0300
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
Subject: Re: [PATCH v7 02/10] net/mlx5: Move HW constant groups from
 device.h/cq.h to mlx5_ifc.h
Message-ID: <20260928192145.GE563127@unreal>
References: <0-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
 <2-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
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

On Mon, Sep 21, 2026 at 07:35:42PM -0300, Jason Gunthorpe wrote:
> Generally the IFC file should contain enums for the fields it
> defines. Move the ones in device.h that are relevant to the VFIO
> selftests over to the IFC file:
> 
>   wqe_ctrl_seg_bits.opcode: all MLX5_OPCODE_* WQE opcodes
>   wqe_ctrl_seg_bits.ce: new MLX5_WQE_CE_* completion/event modes
>   cqe64_bits.opcode: all MLX5_CQE_* CQE opcode values
>   eqe_bits.event_type: enum mlx5_event (all event types)
>   cmd_out_bits.status: all MLX5_CMD_STAT_* status codes
>   query_hca_cap_in_bits.op_mod: enum mlx5_cap_mode
> 
> Tidy MLX5_PCI_CMD_XPORT which is an alias of
> MLX5_CMD_QUEUE_ENTRY_TYPE_PCIE_CMD_IF_TRANSPORT.
> 
> No functional change. All existing users of device.h and cq.h
> continue to see these constants through the include chain.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  include/linux/mlx5/cq.h       |  10 ---
>  include/linux/mlx5/device.h   | 114 +------------------------------
>  include/linux/mlx5/mlx5_ifc.h | 123 ++++++++++++++++++++++++++++++++++
>  3 files changed, 124 insertions(+), 123 deletions(-)
> 

Thanks,
Acked-by: Leon Romanovsky <leonro@nvidia.com>

