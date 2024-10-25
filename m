Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCECFD0C612
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1gLMI3dKOlmqF1qB+HHbZ1f9ezl7JyC71NvrPbCDrw=; b=abMXAA2D5Nl8KfdEeWism0cjlp
	lebDQBxy2s3ZYGX42QSAJpKC/TtTH07y6V19M84Hm49UBKl5dJxaXkTfb1t1laSF7iolyFZe93/cZ
	/bhgx6JyiJtbPumixdfk2eyZ++LvKhzYH2OaOcRFD2TAvnXV/4yZKhp4zEDkMaVEAds0wEF62FEWm
	aOu5nmPcyQSK/xLf5PHo7B77Ty5jmC8Owufo6SQEtOOOP0GMZxrhvoxLFXuzawI1uVuMef7DpWink
	67lQaA3bz1Xcd+K3wCRY48b04t5+Ls6u0CunQSw7p9K9MEqO3+S9YCrhCxM2yEFOgRdk9rwpRcANK
	HyUWgDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kti-00000003vBg-1gfS;
	Fri, 25 Oct 2024 14:02:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KkJ-00000003sxU-29v4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E50D0A42F7E;
	Fri, 25 Oct 2024 13:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB083C4CEC3;
	Fri, 25 Oct 2024 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729864374;
	bh=Wv3aCtUjrX3Tkk0PNmsoXwKN+ujtjrsASQlTPopqlFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rsBfQdx0CYpVQgYnKJ3fw+cPRsfW+IWq+2HTElyCPEZ0uy5y5Rt4DQ47La0XYGBcq
	 s8CK0gl0+Kmdpc8QSGbLAFxC5KRbaC27w+8KDKfwp/N1+KbGvaFFwSLknMvaG0gWNn
	 S2QG08s0uacuO0RbKXAEb1dKDvU2t59iGWnN42Heyv5yoPHq2/o50aVadRqexTOZTx
	 WZoEAB3u1yJnSU8fkylIyYJ7JSkH+hKvTnaHvqVrqMx1mTie/W6kb4VhkF48CQ2zNT
	 UX2Ls9un9yf8xoMKgCbz6ww7aTgekpEWuzz9WtHwlxe+LXHprg1yjP/plywoQL5/1P
	 uicHUBGyoTXvA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t4KkZ-000000005ph-1vTz;
	Fri, 25 Oct 2024 15:53:12 +0200
Date: Fri, 25 Oct 2024 15:53:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, ulf.hansson@linaro.org,
	jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH V4 3/4] pmdomain: core: Fix debugfs node creation failure
Message-ID: <ZxuixxBzQZUdIW1c@hovoldconsulting.com>
References: <20241023102148.1698910-1-quic_sibis@quicinc.com>
 <20241023102148.1698910-4-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023102148.1698910-4-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_065255_639641_9C7C997B 
X-CRM114-Status: UNSURE (   9.41  )
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

On Wed, Oct 23, 2024 at 03:51:47PM +0530, Sibi Sankar wrote:
> The domain attributes returned by the perf protocol can end up
> reporting identical names across domains, resulting in debugfs
> node creation failure. Fix this failure by ensuring that pm domains
> get a unique name using ida in pm_genpd_init.
> 
> Logs: [X1E reports 'NCC' for all its scmi perf domains]
> debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
> debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
> 
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Closes: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> Fixes: 718072ceb211 ("PM: domains: create debugfs nodes when adding power domains")
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> v3:
> * Update device names only when a name collision occurs [Dmitry/Ulf]
> * Drop Johan's T-b from "fix debugfs node creation failure"

Also seems to do the trick:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

But perhaps you could consider starting enumerating the duplicate
domains from 2 (or 1) instead of 0?:

NCC_1                           on                              0
NCC_0                           on                              0
NCC                             on                              0

Johan

