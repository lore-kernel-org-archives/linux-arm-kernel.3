Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE14BC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1F6X9EV1C5vmDv+kWUIO7P6gLsw5zSPMtfSPMJ/1GQ=; b=GG3B1oScUKI2mN4cOdtezTJ2/X
	TTBgYudohzmNh2kpcuh0olQHJbR1dIr9PsJFQLU99anbi/DQRbDxel7nRaQVAwFjVaqKYMzq7D8DZ
	/88Z4GK6LZjJH2alS+2rL1IZWqE9HJayP0JNCXfzhfNW4DERTDddEXxxVdXzvRL6kvIBvlCklrD4I
	AtMJbT/l6mIUJOBZVs9SIcwkORkqmN2clCSVfRoKyGV2StDg3l7ixgDduhQfNiHDqXY9EjBrSOUBJ
	1nZuyxiJYng+0J1y4mjbxL89LwSN6fGXFttwNY7Q2PE8bB4r7FyV3LkSbk6PErhGnlx4v44MZPv6l
	sg8srDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPr4-0000000DXpV-3VzQ;
	Tue, 20 May 2025 16:30:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP6M-0000000DNtr-3VKQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:42:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3429B5C56C3;
	Tue, 20 May 2025 15:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28519C4CEE9;
	Tue, 20 May 2025 15:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747755717;
	bh=iM0kAw4/nWyGDWNAeRKHD+BaGigBrgJDfwS7US+j1/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t27D2+viqHtztdjdMHjpCAUF8Lu+Bh7vLVPgZNSS1odAFu1XXczgWH7kHbfpaBEGr
	 HEgBUnBfyhAlQkRsvW0C1tYawmvIA2hhoWpcy/PRroqBUwvn/C+VhepxJ5F3DgVnk7
	 1ZgMlfNhmBf5urqytVfLAomqHfodvYUYiRraCDn+hSn2x4zPupzSmDhaAXxKomruqa
	 bI/OVbbtIx/+vBz5qyGqCRXiZmCcGflHovDOa/EhQt+4pZ1p8jYO/qh2UHJe8qMBk7
	 mIG95JCsWo4nvdkFHHIHx9aLAvsD2D+vH5hbprSknGWT0DJ1oCdco1SCgGuSqjDRbz
	 kdqVr+fGe9V7w==
From: Will Deacon <will@kernel.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Christopher Snowhill <chris@kode54.net>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	iommu@lists.linux.dev,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Jun Nie <jun.nie@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 00/40] drm/msm: sparse / "VM_BIND" support
Date: Tue, 20 May 2025 16:41:47 +0100
Message-Id: <174774086363.2165484.11245120942986308301.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_084158_954105_C6B8A058 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

On Mon, 19 May 2025 10:51:23 -0700, Rob Clark wrote:
> Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
> Memory[2] in the form of:
> 
> 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
>    MAP_NULL/UNMAP commands
> 
> 2. A new VM_BIND ioctl to allow submitting batches of one or more
>    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> 
> [...]

Applied io-pgtable change to iommu (arm/smmu/updates), thanks!

[05/40] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
        https://git.kernel.org/iommu/c/3318f7b5cefb

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

