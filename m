Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98032C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 02:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2GvXwQWRwkoDen5sXM7X35E1yNC3dDKhWs6bZgg54A=; b=XCzYXG+Wita0xBF0InVUuJQX8x
	+xrIO2smpWpXDylmu4+R6K8BkWp3EoxJQOuM9AfXQ2Wthzl7HOEcoPcP9ceHGB9uDl6rBEs+vc8+A
	sGt6LP7xUjN/urd1PUKrvgGjOCnDZJ0WAG5LJG2tPQVdM27NLPiMGy5J/2IVALHIcjEiB7gs2PuLk
	ZBaUPvBTxoFUfzkHFReLnFQIH/EKsaCSmxQKOKqxHIiusvHI+yQtx+YFB4u3E6XTqQFegvUTnne9O
	oWol5C0O6ckURSD5PWY7gBWeX+VVD1Pbxd8eboe9wsqBBQjePN0/PBi+MvGgJTaFbkiQL7gZ9uZLQ
	jzDMBlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHCZ2-0000000BJyT-2ulq;
	Tue, 20 May 2025 02:18:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHCVi-0000000BJIR-2GC0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 02:15:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92E84A4AB02;
	Tue, 20 May 2025 02:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B255C4CEE4;
	Tue, 20 May 2025 02:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707317;
	bh=g6jZXMWAASQQayHaZW8MlORaAe0WEAlxX9oX2O9V4OA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VIwcS3Eo6vPobAzbGYGcOhFDUgd92VyIv4WqcIC/GPKDzzMTemxehtleoQuxsuOYr
	 o+ILHkKeRw8zA3AJQrUcDZMHwMr68nWv57e1E33NdXS3Ze+MsNYT6GZZbWqIzOBjCu
	 ebgkVsCoaVa/hyRkhCkTOO6C+J5owDQXLPFjExW3gj1YyB0cuqNvnYEAHWqFrn3vX8
	 zYzxzHfHYTwD++bxnFgdUhv1FvSmCcTHpBhTemN4C44jwwc7pTBsFj+vmOu6WzuIrP
	 w5qaWskxqwb7dB7jQ9bkzXGrW2YBD8WE8lUylyHgHAv3lgllSbEG3EoArp4NeV3wUE
	 sp6FBNUwcBrpw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 00/10] drm/msm: add support for SAR2130P
Date: Mon, 19 May 2025 21:14:45 -0500
Message-ID: <174770727711.36693.10469297206946224831.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_191518_651681_5F7D24D0 
X-CRM114-Status: UNSURE (   9.66  )
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


On Sat, 08 Mar 2025 03:42:18 +0200, Dmitry Baryshkov wrote:
> Add support for the Mobile Display SubSystem (MDSS) device present on
> the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
> features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
> controller.
> 
> Note, due to the technical limitations DP controller wasn't completely
> evaluated.
> 
> [...]

Applied, thanks!

[10/10] arm64: dts: qcom: sar2130p: add display nodes
        commit: 541d0b2f4dcd9514265b3a3f7f797525caabc1db

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

