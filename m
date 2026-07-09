Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AE4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsxSqKUeBewE1QvpReBm89h1NUFp0Jx+VpOolwkxbc8=; b=3NycQjNnhMhpHh0ljeoMdCmnOT
	PR4cpQfw6sLeUvulB2zTqHs+DFC9ySLQZagUQMyGgceYHsO/WFkiOAZ6qykQUkTTqu84ClB3IaNOX
	6lvJ3xKuXrACbIE4KEb8AAo5KL3cr6aMX3aW2xIDVavDoJLLKPRKuW7+YyUB1qnZ8lFrHhYMRpFpA
	yuOLKy3KKTBil9cvQJv26RQfppVajm2BbEIDtTpD03rVe99Kge+XoZ9ddGOqmI54IzxUDl5yFMMzQ
	0Tn8CUYcXfKgZ77tbBupSf/m5Qdd9gYfEgaWETBkZHFVx5B+sR91Munp6IJPNhsWyp7n+cEgEMZj3
	XYqEidtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjfb-00000001Mvx-356H;
	Thu, 09 Jul 2026 07:59:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjfa-00000001MvM-3E9W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:59:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E7305600C3;
	Thu,  9 Jul 2026 07:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E361F000E9;
	Thu,  9 Jul 2026 07:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783583981;
	bh=DsxSqKUeBewE1QvpReBm89h1NUFp0Jx+VpOolwkxbc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oS+mytNwoGWa3dxIGDz4lglwz5Sl6tSYwBF2Q71P2TwFT4q7e1wyPlzl1r4jXlXOD
	 EBK75EQsPwsm8nh9By4vrx6wkrq6w63EQKHnT1XyJU0nJPiKjLPvEUkBzLb+JObSVS
	 aLcAlUF5QGRHlwxkt0IrknOYtLutxYJpmbZp+tUS/PReIoSlv5GTJbZtyzkwWHPoTF
	 aez7uI5WXU7BMH++Cu7578UdbAerPv+EwK+qivXPepP66FXri5+xhC8HhkAHwLZvse
	 sZ298ZrepPpJgkE7Uy5XDm01qQF9rGCXGOSjuwPwmxPNCLVkv8s71IIO1VNCcTzDcW
	 FrwH2SiAacyRQ==
Date: Thu, 9 Jul 2026 09:59:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop
 arm,primecell to bind on platform bus
Message-ID: <20260709-versed-marvellous-pigeon-22e2ba@quoll>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
 <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
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

On Tue, Jul 07, 2026 at 05:08:49PM +0800, Jie Gan wrote:
> The TNOC compatible previously required the two-string AMBA form
> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
> AMBA bus.
> 
> Change the compatible to a single "qcom,coresight-tnoc" string with no
> "arm,primecell" entry, so the device is created on the platform bus and
> bound by the platform driver through its compatible string.

I asked already: this is not a valid reason. References to Linux
structures are not correct here. If this is your reason, then answer is:
fix drivers, by renaming or doing whatever is necessary to platform bus
to behave like amba bus.
> 
> Drop the custom select block as well. It was only needed to avoid
> matching the "arm,primecell" string on unrelated nodes; with the single
> "qcom,coresight-tnoc" compatible the schema's auto-generated select
> already matches the right nodes.

Why are you describing the diff? It's obvious.


> 
> Update the example node to use the standalone compatible form.

And here.

You got comments at v4, nothing improveed. Your commit msg tells useless
things like what you did or you want different Linux behavior.

Best regards,
Krzysztof


