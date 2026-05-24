Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AC0CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 20:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvFC+azNSDIKH1JXxHAf/KqgxPmhn9ag8hvuKL1foNs=; b=A+uFdivDgAhEwve5njNoiWgsWP
	ikD8/d3ZT6SvNV6DEDuc2Z4lYBF2D7mGBHYTKSCs7fuXzL6QccqRCA0PtuWiVZ+OT7FcPf8xQPjQc
	1buiiJqp0IVWMb0YIQA6cA9mRMR8ManEg2MpayggQyBCZ4TyIgHYMqx5Hv6CKuEjZHPmMH6wj2g6P
	c8pPoefBUXAaF0PWJN3Gq9FnF/C22qK+m7LFPJfF0hvkHmybmJaj5THoZ5Ynh0CecN9V+Vzwh0o6M
	zp/3XxejTH6SaLpybQUWmH8h2LCw1MbbBOqB5U4V+sDP2yDjnIbc5iW/DMu0+bLU0nDb3g7CuRXoM
	Ia492ftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFlH-0000000FcVx-2J1b;
	Sun, 24 May 2026 20:49:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFlG-0000000FcVl-1QZt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 20:49:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B28B601E3;
	Sun, 24 May 2026 20:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE921F000E9;
	Sun, 24 May 2026 20:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779655765;
	bh=SvFC+azNSDIKH1JXxHAf/KqgxPmhn9ag8hvuKL1foNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P1TUsjwIBYKCMnwkSwDiyEF5pn3BuYlptPZEjNPwbze+umSA1x7/1EpW/DxDNxdxN
	 hWN3I4mEaRTvJwdDA89F077EbnmLYC4ffFITQZqT56xYldvGs1QuqpB/TeJ8IbhKJb
	 TsfkBslAS6whFYIRgXMrIYCGaVbwcq2RHndOqmLP0r7Eu5jcaG6pMPP3sM6iAmfxCL
	 G6ORx4yMPBU5jAesSFupJmILzCBZMyt0G42wJ6Hp5AQDED4c98frirIZahAsiKjT+Z
	 YXkR7WIsVKO5I9sztPCBXTUOkpbi/qV66DKHN6gnXNC5bOqR0dcz5nEjJZjFaxlU57
	 GM7Z4bf2Bl1sg==
Date: Sun, 24 May 2026 15:49:21 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v18 00/14] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Message-ID: <20260524204921.GC110177@quark>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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

On Fri, May 22, 2026 at 03:39:53PM +0200, Bartosz Golaszewski wrote:
> Currently the QCE crypto driver accesses the crypto engine registers
> directly via CPU. Trust Zone may perform crypto operations simultaneously
> resulting in a race condition.

So this driver is just critically broken currently?  Yet it's still not
marked as BROKEN?

What are we even doing?

- Eric

