Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E9EE6ADDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 16:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Fri3MDrTeM7wYILUHtZlorscc+2zp7g5opjd1aKlNM=; b=sHH7vaGMn46sNNcuPF+/APVauE
	aq0IEXvQA/Z6Vs3ZFrIeqnHK/ft2hi+SlUebiG+iS4Tk7HbfPeyTzmejncZ710SLqD5pLl9PB/AAG
	mm0lp6A1hPgcZjq4DBztRn+U4PxnKA6As5ysBHhPJjoXs63MP2vEqtGSbB8Mj1PaadFmmt+CaAr0y
	mccOZepBuW5raiEzP4/+6narndVTas1FWORWbP9iqKRfV0/lX4oVF2Nb870e2p/B+FPzw7fJ84ahh
	/xwfOTVMOmDVbav4YWMlXJXasyUZWGg3ytBXueKoDUAarIbyK0P0ghgakzegXXMb/SGT+UYiD0WTj
	ha8HBNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEsoH-00000004a4Y-3SAK;
	Sat, 23 Nov 2024 16:16:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEsnD-00000004Zuj-3CnD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 16:15:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8216D5C0740;
	Sat, 23 Nov 2024 16:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34638C4CECD;
	Sat, 23 Nov 2024 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732378530;
	bh=aFqOexa4IuS4Qk6HkPBylQSk76DY92gyVsr7yse+4R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WlL8wfQIQ175OPh+ZQsI3Mbu5COm0FMjfoeeoe8OIAXddyOGZ9DNI7H+Sv2NqnmO4
	 AWw7VHKrl1r1e134LWh6sixEKc+SO/74Ef2Om2bBmqKHN67VJR8ShdoZ73hKYJooWY
	 j4FbxdNFTvcAJcV/0YLjJ4bJwg0m+rlRqMlqbGzfURFhaEC/jz+xjcRqJJc1A+c9vj
	 0MZPozl9ujeR3Mi68h5iSTbMFgcBfKOj6u7996nTYOBXGi9CS5ZlZf9PbUHqrgd5wP
	 QzdUMDD8qRQoX1zvywnF6MXRwiw68cEPPYvAf2MYejUnfFKquR6lbfKRk8oGqvBJB5
	 vdeaoEqkN7B0Q==
Date: Sat, 23 Nov 2024 17:15:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/9] dt-bindings: display/msm: Add SM6150 MDSS & DPU
Message-ID: <2nqtuatl63ajcahsmhvg3bmfipfhppfkygwh6as7zzwgxzipoo@hcvuv57sqpqu>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-3-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-3-35252e3a51fe@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_081531_924182_F71F6A78 
X-CRM114-Status: UNSURE (   8.01  )
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

On Fri, Nov 22, 2024 at 05:56:46PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Document the MDSS and DPU hardware found on the Qualcomm SM6150 platform.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---

This has a build failure, but nothing here explains dependency.

This cannot be merged and due to build failure cannot be tested by
automation.

Sorry, no review from me, please wait till dependencies come in or
decouple series. Anyway otherwise this *CANNOT* be applied by
maintainers...

Best regards,
Krzysztof


