Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2138C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 04:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEZ4b1yk+7//NJD/5Ey6DCb9lbE3xQCEBPrP3KzowyI=; b=cBXHzfQzRN9UhWJ1Hg5HCCOiQO
	G3zc6MoOcpxukJC1VCVWjyw3KrbNjV+AEULLLWg2KlMIqY1N9AqQ6CneuQ+8FyOmO/koBjcu70IjK
	1K53yv6bizd2EFeZGeXcAzJGuJH5xfQpAw0dTH6FmbR7LTrO2/DO1pbkx5bqzxvqumg7YuVvqbzmo
	/yYgIbN7lnvJoL71Db6wGVmgkQiqO5HadavUzw5BxNyzz9/KKI7grdPHriXcXZQX3lohgdvMFotQm
	U91UL959jSD6T0SJ7mvZq3J7VprYZ8l4xIpaH9O+i+oaCZqhmo+qXIfPA4wits08CLBIP5EAnOcOS
	0eva2UqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueROj-000000040XH-3XdZ;
	Wed, 23 Jul 2025 04:48:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRMG-000000040L3-3Lpp;
	Wed, 23 Jul 2025 04:45:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A37C43639;
	Wed, 23 Jul 2025 04:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AF1C4CEE7;
	Wed, 23 Jul 2025 04:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753245936;
	bh=BKZAmLwgvxaSIoSf5Jl7qz1ZZWhSXwuKKwePOfDXBws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tOUnKlrkZNQ30wvJmNd91NZsyelRJzyrBXpucF0GkpPNv2/hc+ynZF8gb4NJfMYte
	 16HxU0tdOTDEXEAoNx3m7k8yQGfvbxDg7pfgexxilMUv6wdGjzWdcJJ6F75VRlHlv1
	 mYEXS+DcNrI6MjpSD6K9kd+9FyscX+akEu9YC+yQf70//QiZ3yp9MubsEnQs8F/to9
	 ErCotnPuTpVdwFlcUrAlZuICDe1BSvv9CCFBQwIxXErv1J2zfFmLaolLwFHIkS7GUl
	 MFL6d5prxc+CvXLAd1ISFv4u42Rj5QdOzglqsVl/MAv356fD1Uf5R0YJDHQ4qj7YF7
	 GRgBpOVmVJ40Q==
Date: Tue, 22 Jul 2025 23:45:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Macpaul Lin <macpaul@gmail.com>, Peter Wang <peter.wang@mediatek.com>,
	linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Pablo Sun <pablo.sun@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>, Ramax Lo <ramax.lo@mediatek.com>,
	stable@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, Bear Wang <bear.wang@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	linux-kernel@vger.kernel.org,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: ufs: mediatek,ufs: add
 ufs-disable-mcq flag for UFS host
Message-ID: <175324593457.1217884.7283187331572765587.robh@kernel.org>
References: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
 <20250722085721.2062657-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722085721.2062657-2-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_214536_857088_64D229A2 
X-CRM114-Status: GOOD (  14.11  )
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


On Tue, 22 Jul 2025 16:57:18 +0800, Macpaul Lin wrote:
> Add the 'mediatek,ufs-disable-mcq' property to the UFS device-tree
> bindings. This flag corresponds to the UFS_MTK_CAP_DISABLE_MCQ host
> capability recently introduced in the UFS host driver, allowing it
> to disable the Multiple Circular Queue (MCQ) feature when present.
> The binding schema has also been updated to resolve DTBS check errors.
> 
> Cc: stable@vger.kernel.org
> Fixes: 46bd3e31d74b ("scsi: ufs: mediatek: Add UFS_MTK_CAP_DISABLE_MCQ")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> Changes for v2:
>  - Split new property from the origin patch.
>  - Add dependency description. Since the code in ufs-mediatek.c
>    has been backport to stable tree. The dt-bindings should be backport
>    to the same stable tree as well.
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


