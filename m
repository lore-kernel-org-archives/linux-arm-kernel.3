Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B66C109E543
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 03:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZjPI2+9t2kwbpanAd9yQjrpbUTVEMjIeXvX9owJVnw=; b=nVaM/Rp4uZFhxpYmDEuvoA3i4R
	sLOerWpHvZ0NfAc6vAR+eT93Zfl04lPpUysSJVfDmGFGYm06k/1ci9Gg79yw8Jit7c5XhzfJIHYKO
	pKBbCrmbYmCflBU0iOJmWQ+zYexEXoHA3YWIqVC3ac+t3Cc7zSpJBuTvVRkajxcZ+fPkD641bLwC4
	MOz1a+17DmMxMdjkL3binN9HJnsrfh4btLc5cS2KiBJzTvzjnsjReYnMjdMLWYYCzp3u203an49Ts
	3P4IZVVn4Wv6TT4jpKxl4+PuzDpQFvJQxi86UG1v3Yo/vHa367/suhaGfSJFxRKtJjSWzegAMmxM2
	rqOtPrlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5bG5-00000004cuC-1HRE;
	Thu, 26 Mar 2026 03:19:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5bG2-00000004ctj-1q38;
	Thu, 26 Mar 2026 03:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56EE94095F;
	Thu, 26 Mar 2026 03:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B85C2BC9E;
	Thu, 26 Mar 2026 03:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495180;
	bh=64GvIUh5BK+CA6321kY9KFkS39Cla/4+STtvnAwRWeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DoNJjbvsdO9M8I355YakZTdyuT3xoRXpGtMM2wojdApb9Q7ajDoGdWHuW7T+qyJs8
	 JLJtoasNll/fzCTKgF2pot1ARQr8/WJz18ymv6QdXj8Tag8zYprMsTUMGMVBz07VAn
	 5/ol1dU6SqblhURvBbAUXWOT7ww/gO3Zmxb6zeoa1vKQWvC6Bi4QosLSw70nx8ljqL
	 mxsSn9BJvJy2ba4neAZFnE1z8Z2JJhzsTZs5kI0u1/lgpSiGsj2hWBD4svpQ3mlUIl
	 XLzSUDEneP1HMa3cDTXdRO7iUfFokDI5VOrhaCtSvbUNOFApAwpcyH/ryPfTXW5PdJ
	 42LGsCrP7+iHQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Marc Zyngier <maz@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
Date: Wed, 25 Mar 2026 22:19:21 -0500
Message-ID: <177449516624.60308.16445349174496027428.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
References: <cover.1772643434.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_201942_522457_48129D7D 
X-CRM114-Status: UNSURE (   8.93  )
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


On Wed, 04 Mar 2026 18:10:57 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.
> 
> This has been compile-tested only.  But note that all such masks were
> removed before from Renesas SoCs in commit 8b6a006c914aac17 ("arm64:
> dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3
> systems")).
> 
> [...]

Applied, thanks!

[7/7] arm64: dts: qcom: Drop CPU masks from GICv3 PPI interrupts
      commit: 99bb0693df91db9338fa69d496de4601c9582058

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

