Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D14CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWfeQceWTl+4wt/0jQZdDAsBX7hMCg9EEy37zg40zTs=; b=iFso96BBy+MSSvdViddEZQAeLO
	BtJi0MgPagp2YQEvUeisnNLAFiLL24bCM1NDGfsNSsRTlTTZDopXslKEJzkYrV7T5Tjnlvjbxbtjd
	oI817yw5lEr5FhWDdvVD/2Vk5aCsMp0dwhcTu9SyRR9vjoszxglcrV2BCES07CunKQ5biipwiFg0G
	OPMmj0d2Ic8MZjU2sqhR557HEGtVMFl1O4AbrN08p74V2fhl4d7tRYJCkxA7p1beGg5hyPUXMMduF
	tYASxawOcQFU1IwOhP36X9lJNRa1gEPOJ2AlihdyiVIRpy79/dXVqlxy8Rk0pvDeFSom7jD+k7B1I
	OW7CDVeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGum-00000001Q5R-23Qw;
	Mon, 28 Sep 2026 19:21:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGul-00000001Q5K-0nIx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:21:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45487600D1;
	Mon, 28 Sep 2026 19:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566761F000FF;
	Mon, 28 Sep 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790623286;
	bh=HWfeQceWTl+4wt/0jQZdDAsBX7hMCg9EEy37zg40zTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fEQ3jYA1LaaDKgA+/UrOu34F1HhqHXpi15LglY9DxnOWjKuUxoV3dTft11dnkB90y
	 sIz45jB/ip+pC9gztN4KLxmyTfyi4rVIcjaek0DpBn8NYP4/dj8L/S/JEc2zo0SMqJ
	 +8YDHxCzBDy1MaFFt383pMYzU4abMuCpalZ2ajVXPYaqdwNq2LqHjb3agczO1H8SjL
	 K3bsCuFjlP5lNKsU3RoJ5q9JDTAnMiXToMJy+GSCqv86ly8SiSBJEyC+yXWNm+Yw9g
	 7oOXgRPAaPPXj3qg7kiLnjkfmNCl9eEzNxgD3Ut2tQrsmY4cciRreoyea0uL5NP3xb
	 WLDPqoRMeNGYQ==
Date: Mon, 28 Sep 2026 22:21:21 +0300
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
Subject: Re: [PATCH v7 01/10] net/mlx5: Add IFC structures for CQE and WQE
Message-ID: <20260928192121.GD563127@unreal>
References: <0-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
 <1-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
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

On Mon, Sep 21, 2026 at 07:35:41PM -0300, Jason Gunthorpe wrote:
> Building the WQE and CQE using the IFC system is easier than with a
> C layout struct. Add definitions for their layout. Structs for:
> 
>   - wqe_ctrl_seg_bits (16B): WQE control segment
>   - wqe_raddr_seg_bits (16B): RDMA remote address segment
>   - wqe_data_seg_bits (16B): data segment
>   - cqe64_bits (64B): 64-byte CQE with error syndrome union
> 
> The VFIO mlx5 selftest will use these.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  include/linux/mlx5/mlx5_ifc.h | 55 +++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 

Thanks,
Acked-by: Leon Romanovsky <leonro@nvidia.com>

