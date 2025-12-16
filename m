Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668A9D609CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trwNn2q0LmsLZnp8usUhP+LDuoG5iRjF/cMOcjsQki4=; b=HC0l7GiqthySx91HrZ0ZEeXDRC
	eWTWmY/6Qif+1wB5mVLXObSN1FxJe4LG2dklOlcI/sTBv9H0sOzx+bksS9Wz36dShaDwfRKGPK1+0
	mhHEtkn/jMD81p7Uyjvp7NoulKEQs6k3/9QawSCFJJalyl+UCblvdeRQUB4aYHc6xF/TI4CCwUT2f
	UHiJnAdE9n6J7K1ieg1EjLFM+1xJHvIQIxztGasu8jMrR5hmyjaiyHr8I1yq6+7NakRZJWrhuKJiB
	xk333D103OpuqF68AOnGwOScnZszw/rjKzVB12TJIWgAmKufElxxWoKS3wyFJmbE5qBEsf6c25UMy
	FSCeIsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYIf-00000005YuK-0noU;
	Tue, 16 Dec 2025 16:53:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYId-00000005Ytv-0o9a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 16:53:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 240194073C;
	Tue, 16 Dec 2025 16:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C33C4CEF1;
	Tue, 16 Dec 2025 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765904002;
	bh=hB3tjWs2Z2dfiaOVswwyTb3KNiZkv7M5DzbEiPD8jLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxonYLcQly7R2o9RURtXVVJNxLDCvcatHnKFucPtmVluBQJEuPacvwBVnSIPNQ5y8
	 fVMQz7Bg2hyTTQrLKjvfi1tR7eX+/rQON2uzzWuLv677iywbnnurBPbkGLQ+x9kimK
	 FCcPFzJLnAgnEhXZbWxsiIqmq7JvnDyBWAmSn8G5AybfMI6iNzv5WnIHulGur+AH5r
	 DlRMKtWLmkwoGx6OoDzVlKuR/Ozq7ObBXFioUzMMAOYGfpA1Ra4kIl5aTyT1MsYzrO
	 3jndKljRcJBb/Fk7Puh//mMGmsjs+rYKoYUNkbqCTyLZJDKpwpFesFs0H45NqzNr52
	 qnMAn8vzAemqA==
Date: Tue, 16 Dec 2025 22:23:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Sinan Kaya <okaya@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Abin Joseph <abin.joseph@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/6] dmaengine: qcom: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <aUGOfs7gI__Q-bua@vaman>
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
 <20251027133232.392898-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027133232.392898-3-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085323_267348_B61C8DEA 
X-CRM114-Status: UNSURE (   7.15  )
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

On 27-10-25, 15:32, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().

This one fails for me. I have picked the rest. Can you please rebase
this one

-- 
~Vinod

