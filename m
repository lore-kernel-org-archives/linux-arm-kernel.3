Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A63C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYexzvxuekgqLHatZlFwTRRdX07yMrz0UyQigczwDJc=; b=DutbGPNUI3P/E9gHeP9mN6s1lx
	UxGGrNR5zcpLXUnCW062OpuD2TPIZGism7P1pnvu69/AFMDow67jV1vYyMiLbX0/S/GWkFlR0r86y
	2h6EomqZhXS4PmQV4Hs4vvES8xpPjn6NTe1+i4N22fMJTMNL462lisMeCwJUzxSuGW3F2imXgvBvS
	+4UjVLyNJPG0IA/8ZqPyzd9xqBHASendgE6SOBNjo1notQQgJ5Opy4cR1SnY/IqmR4+W8jtmToNoz
	mbRF+IqPcLDDlWHaLWPkN6A8Wep7Ow8od2frToWPu8Pq8e4TiLQwBCCJ+lk+17PY7FnEhIRzaUJfr
	GNnF+icw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRvL-0000000556j-1ksP;
	Tue, 18 Mar 2025 08:03:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRog-000000053U2-156R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 07:56:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DDAE8A48D26;
	Tue, 18 Mar 2025 07:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D20C4CEDD;
	Tue, 18 Mar 2025 07:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742284609;
	bh=PYexzvxuekgqLHatZlFwTRRdX07yMrz0UyQigczwDJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyTu0yHpjLaLbKHHy1oBYw211KKL360J3Zo8yI7ETyJaJBKbn+Vs1enJVqm2EYwMh
	 NbRu3/jX1Neqtgl+/2MSX/yl/jcqAPI6bXks684f9G2NCQJKW3gyQYi02deDaLuNcE
	 N6dzclk1qoT0eo0efN1Qeo+MqlmCGGPQZpQpHI/ujmfBwF3IKWGLKZf/n70JiCAXzd
	 DmgEiR22g6ai2EC4hjqxudQR+SrcMyzQhxdZXJO4CGLuqkhyRpZJH0IxanUVe3P1rA
	 NSmerndGOAvd2/KJVD+SDW2e0VGHcVLn9nFPSf4NuOm5WyDncQKkaPCT90toW4pjQ7
	 06FIxy+InJqVw==
Date: Tue, 18 Mar 2025 08:56:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>, 
	Andy Gross <agross@codeaurora.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
	Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/9] dt-bindings: soc: qcom: add Smart Peripheral System
 Interrupt Controller
Message-ID: <20250318-dandelion-aardwolf-of-radiance-695fd9@krzk-bin>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-3-655c52e2ad97@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317-fix-nexus-4-v1-3-655c52e2ad97@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_005650_357993_BBFE427D 
X-CRM114-Status: UNSURE (   8.29  )
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

On Mon, Mar 17, 2025 at 07:44:38PM +0200, Dmitry Baryshkov wrote:
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,sps-sic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Smart Peripheral System Interrupt Controller

Interrupt controller should have interrupt-cells. Or this is not
interrupt controller...

Anyway same comments as for previous patch.

Best regards,
Krzysztof


