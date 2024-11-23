Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E77E6ADDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 16:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYl9ghIS1FhFqB81Ll0TklCcrue4I0tAWBMqDk5wj3M=; b=YhLyomo4YEsNkwdVXy01qdjht+
	rvdHzdPdtgj6G64tvxQiQVFeS3DF0+rqrSXMgstjry4J5S6rKtSwaQfYRXwDIjNQYeKQCYud9EXvD
	1HDN616cZJoxMSRtxsYVgBwdIn1V9PTmfsn7rQy5tR7Dgi3sjIH31wLPgufdUBVxiGHrnjfBaqLk+
	UYFAAyrutBM3JqMUoXX5j/aji1Q6DufzAxNX//37kN3u4ZSjnnt3l7wAhWjbyUA3le7nORs6XfIjc
	IIQwcjB9CoyBrlLB98sk72ZGXSlIEihRV6gInk1fovLhSpfekKVgWiYMUk9eMLoBiUx8mE9y7lTg9
	fpQO51/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEsnG-00000004ZvG-0nTx;
	Sat, 23 Nov 2024 16:15:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEsmI-00000004Zo7-37qP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 16:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 708175C5583;
	Sat, 23 Nov 2024 16:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9FDC4CECD;
	Sat, 23 Nov 2024 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732378472;
	bh=E02GaD6C2zW4KVX9ewnciYeUTWpwJEUwwnHlZ+OyWAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCgDdIaHZ/hdTwWsN6WgLvT5q0urJF4+Z5E/Sa8AebGnhIzjcjzdtMv6lQT0jgxWH
	 9Q7kcXz2wXkEUfRPjU/pr/3HijAkVNFBs3IbCVREQlCA0kzZTm2OMGUqMa9nrIvTCG
	 hI3w87j2uxmb/Ma4j2q79eV7AM1WYYzS09T+EEyci8RdtdOa9nExvQx4FwY5XA6eUw
	 8uN9zRfIfcMu21Qbz5sBoLo0PgV+eFT0i4FhwAO1Pcyp/og3VKhJ2EegX/qVntPKbt
	 yRoU4YqT7JkZL15r1sGVOapWJckzUEXe7c7UeTIlWOGJl3ol2qXdLF4+CY4EOYaRoM
	 t31g5QM/vq8sA==
Date: Sat, 23 Nov 2024 17:14:29 +0100
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
Subject: Re: [PATCH v3 0/9] Add display support for QCS615 platform
Message-ID: <2ihy463xjiguluacmd3qhlskjtrpotk4mmflqdtgm3qhjzcrif@x2ckw5h6xqyj>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_081434_838064_3BC74416 
X-CRM114-Status: GOOD (  10.77  )
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

On Fri, Nov 22, 2024 at 05:56:43PM +0800, Fange Zhang wrote:
> This series aims to enable display on the QCS615 platform
> 
> 1.Add MDSS & DPU support for QCS615
> 2.Add DSI support for QCS615     
> 
> QCS615 platform supports DisplayPort, and this feature will be added in a future patch
> 
> This patch series depends on below patch series:
> - rpmhcc
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-2-3d716ad0d987@quicinc.com/
> - gcc
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com/
> - base
> https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
> - Apps SMMU
> https://lore.kernel.org/all/20241105032107.9552-4-quic_qqzhou@quicinc.com/
> - I2C
> https://lore.kernel.org/all/20241111084331.2564643-1-quic_vdadhani@quicinc.com/
> - dispcc
> https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com/
> - dispcc dts
> https://lore.kernel.org/lkml/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com/

Which makes it unmergeable and untestable. I suggest decouple
dependencies.

Best regards,
Krzysztof


