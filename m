Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B50ED609CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8faCLLaRKCp212YXxVAB96bNXkj4vipLCL+kTsCBs+U=; b=kGAzUa/5m5KeM5RHkdRJY3Pnem
	rOtpi0vq3vr65Z61q87y4QRJAE/NvfUz3toYvfmuI68p42hzVuRI9mPzNojlXBl4Z1kH1KGmCY6Vp
	E3zulFHn0geEZGFfIQawYyWh7/EcQOlimr7ADhkPylWYgpCP8Xo4BQAUQol2zB9s+fC9dgedF5+fD
	ddUkNo2cGRsmxI8NJpmeX6KbqElPYW/ymr37K9f8RFdnyW/ayV9BHvVT0G/SANX5u/K84ukGTmaBf
	9O8YEdlWrifpSw+hyhcVyYULgBTBA7T6eMoxyt/L3IJHzbC5DhBhzgr+9+Os9RXPV3iMuKHW+jYkw
	Ro1Ndi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYOr-00000005ZrX-2QTI;
	Tue, 16 Dec 2025 16:59:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYOq-00000005ZrF-2491
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Dec 2025 16:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8faCLLaRKCp212YXxVAB96bNXkj4vipLCL+kTsCBs+U=; b=eLrln9gsfM6W8CBF3s8dP9/crT
	88XwNlVERElS0leIQYSU+2QXgEfk5NeQhO5Ph/EM1HQOZ+kXKtfTI5vbsuzIhKy8EdKT44eGGdvu+
	mFmylSiAhWko4OJdiqnNvlxgN5MVLsXZ7GLd9OkMy9zmdaxddMVTw45Ou6VkmfLeS1EPyAnJCVwrq
	d8PzXE09wI2N6h1m9hDURqGlpMpUQlVnuEAPZ3YO9Zk24Yu6LvwpVcAyC6Ki38/oxvhaVd+00Rmhm
	A85Jv4tktITu5SOkl5HPvOHLWRUQM13yzO/4qYqseyWHb6I0cNuakgYdslaTwjgZ9sDaem9ojmEoK
	BVoxprQA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXXK-00000005D5S-1D0x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 16:04:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37150444E0;
	Tue, 16 Dec 2025 16:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD32C4CEFB;
	Tue, 16 Dec 2025 16:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765904384;
	bh=/ijnLDUb9CQME0qI2gWKSAPbBVhfRXPEwaX0lLnaaas=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RIBvJ3KnAH5vOwS453MxRhzr+wWJFwGuX+1tg/NpRqPq0qaLE4ksqd32E8JvyMT+Z
	 qJRJq6ZKtm4WJQ+DxpNBu5YW2Oiygn/4mtjYNnIaAEnsmCyiQlrgNUxYkSRxz0BTeL
	 eOA009AwfBJFGhQANqPsVQ2DTUsx13YhwiAXyfxbwBCL9cBVWS1HnEWJT753MhmCJO
	 ioD1R/o9Fjg0+OoUAIntOCuZ878WB8YriQUXAGoORgEhOMY6gjtvpN8nU9Ba6Rq7rA
	 2lnhkZDarRjmlZrabydQwzxoYaz/Iorj+Zh/Tk0tfCDO0uQs1Y+xv6k21Vli78T2K7
	 hKwECA0A5K02Q==
From: Vinod Koul <vkoul@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Sinan Kaya <okaya@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Abin Joseph <abin.joseph@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/6] dmaengine: at_xdmac: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-Id: <176590438034.430148.2613882199706918410.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 22:29:40 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_160430_652791_BFDA4D0F 
X-CRM114-Status: UNSURE (   5.45  )
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


On Mon, 27 Oct 2025 15:32:27 +0200, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> 

Applied, thanks!

[1/6] dmaengine: at_xdmac: Remove redundant pm_runtime_mark_last_busy() calls
      commit: bce33c132a2061c9a7958474c3e2d030c22664de
[2/6] dmaengine: pl330: Remove redundant pm_runtime_mark_last_busy() calls
      commit: 5f6f0cad6d2d599b765d572216a290e48bfdcb5f
[3/6] dmaengine: qcom: Remove redundant pm_runtime_mark_last_busy() calls
      (no commit info)
[4/6] dmaengine: ste_dma40: Remove redundant pm_runtime_mark_last_busy() calls
      commit: 01f2bcf06d7e0e3c4badd03c030cf634ca10a172
[5/6] dmaengine: ti: Remove redundant pm_runtime_mark_last_busy() calls
      commit: 35d522a9612f5ba83192416521725acede02c28f
[6/6] dmaengine: zynqmp_dma: Remove redundant pm_runtime_mark_last_busy() calls
      commit: 3b81235280026c551660c6374ede9599fc82f617

Best regards,
-- 
~Vinod



