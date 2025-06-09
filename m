Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91541C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r34Ixoh0Y2p9uK1qv1n6mFtZKDMudsIpNyQVCzURvrM=; b=tFt8vb/OSO/fzdVL6uFi8p+dMJ
	kXbW1zKVh9a5080IEoTtaagFep3hMrYNrtTGFb/JYVVhEaDJWGUemoVw2z/EZckHZUlAhk0neqvEL
	oeIvI1VfRZ8Y1B19rSIdh9VoSNUADZ27hXkLNY1cM6UEC1kxammLjDkDFBhiFgPANC1lsVBe5IQfF
	OdK5VsfLyiSU8sgK7F7wHC+ALARPH8B/knNPvgz/e7Amwv3HKAutAvN+LupZpYjeEHmUSZTNpFglW
	dfbi+MxrZ5o4dEIM+jg0KDM20sbxW1hKwHGzIO6wErYn42l1c98XDwpakbqXWieSlfMJD1pNUmJgr
	8gmivNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeRO-00000004Wck-2FRf;
	Mon, 09 Jun 2025 15:29:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdzu-00000004Rjq-3HUP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A999AA50F48;
	Mon,  9 Jun 2025 15:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332ABC4CEED;
	Mon,  9 Jun 2025 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749481273;
	bh=49cU8Ts94cgb4QkrriKDZFEwuDxhQXvYqP0FbuF4YZQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pUyftA65BFa7f/aOR3L+uaX+HTauesh20t2Rq7zturUKTtFX0ptHSDOMnDf/100Q+
	 QcTyTIQyuostNjRegk4soHMyzDRavWRNsYNaV6LrNvbTwAB41Yss5dLQgQC7nA0fGe
	 ZQxSFTQmuDg3M3Kmjwj3nD8O/pg9VfbqNhyqc+mVSfuiqjFmPFha940csLTM9mD0TM
	 r2EDzqVF4UgPMBsZ2msvMtuo4z382SszHx4EG9CdoyYDF+6sL+ksgeZ/o7+KLiYXGB
	 7ehe5kT5cEeFpr3HvthoR70OD2nSYeYR/NXollVQCI1GxYNLNSOc66ApvHfojq/zLM
	 OxnxR+j3tZBSA==
Date: Mon, 09 Jun 2025 10:01:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Sean Paul <sean@poorly.run>, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
Message-Id: <174948104999.2282575.3222487103979882730.robh@kernel.org>
Subject: Re: [PATCH 0/3] Support for Adreno X1-45 GPU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_080114_963475_8800F660 
X-CRM114-Status: GOOD (  16.43  )
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


On Sat, 07 Jun 2025 19:44:58 +0530, Akhil P Oommen wrote:
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
> 
> Tested Glmark & Vkmark on Debian Gnome desktop.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Akhil P Oommen (3):
>       arm64: defconfig: Enable X1P42100_GPUCC driver
>       drm/msm/adreno: Add Adreno X1-45 support
>       arm64: dts: qcom: Add GPU support to X1P42100 SoC
> 
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
>  arch/arm64/configs/defconfig              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
>  5 files changed, 170 insertions(+), 1 deletion(-)
> ---
> base-commit: b3bded85d838336326ce78e394e7818445e11f20
> change-id: 20250603-x1p-adreno-219da2fd4ca4
> 
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit b3bded85d838336326ce78e394e7818445e11f20

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: opp-table (operating-points-v2-adreno): 'opp-666000000-0', 'opp-666000000-1' do not match any of the regexes: '^opp-[0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#






