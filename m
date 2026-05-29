Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BE2CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvUGZhhWdI+4JN0vML4xtpmVBnKMBa3Y2aF9he498+U=; b=OXrqM+ZimsZgG0P6pZgceUn1/f
	f0GmrSCeDJ/UK306JW8a4GSMeFwnJfIBsENTRZ5ESJ1BHMcWYhjqHjWO+ul9B2WLmTMNiHNcyDIXJ
	zCoiV2d+/E7LoMRqub3TxDbOgjQt/z9xu9WG0xhhjIevDOCfqcepQnP5ow+LAT+AdscCAFiZiRUpY
	V+vBeq6lldgz5zColqIF+xaD1hZ3lpRHMs+729yI3+SzJjrn2KEMWdBMVawIyXQ+E6fahVJkFnzHD
	EYdL2Uu3uMT5K8w1q4HvT51Y8e2ZhbAbZ23+xHOdwERHVsmqGhIidirvbtLPXhVocDKcYLisY8j9r
	9WLabuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT00Q-00000007sK6-0yw4;
	Fri, 29 May 2026 16:24:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT00M-00000007sJa-30xy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:24:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DDB304004B;
	Fri, 29 May 2026 16:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA2B1F00893;
	Fri, 29 May 2026 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780071853;
	bh=QvUGZhhWdI+4JN0vML4xtpmVBnKMBa3Y2aF9he498+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U5Ct7LDg3r/25r1GdbbJlkmPHtzKRndw/gD9Jkl5aY99pDkbzK4nU5LVrs0Ir8g3F
	 ZN6+dLjKvM3YSAzLBvooLfwRaAW8bX+wtV0uEmuLgXPf5LaRt/o6Wrk2lebv0tOoox
	 w2lNrSfxRkO0P7rIe1z3iZpfi2uFYQhHQZ38nppKvN59sMap+rtAqa0/VYsOqeYOxs
	 0q/ObsxbpdTYUCUSavkXxGOEUWcg5ZKLVah5dUAm9Lu9SMY3dthOlMGxAyM/V10Yhh
	 9qC+zEbHObxVZQR1WjvejjcGlnHvcRRZzErMC1kGDeXtriV/ONyme2JqHncB4n31y1
	 1n6SisMLbKIFA==
Date: Fri, 29 May 2026 09:22:51 -0700
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
Subject: Re: [PATCH v19 00/14] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Message-ID: <20260529162251.GB2706@sol>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_092414_794826_F138FEE4 
X-CRM114-Status: GOOD (  28.95  )
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

On Tue, May 26, 2026 at 03:10:48PM +0200, Bartosz Golaszewski wrote:
> I feel like I fell into the trap of trying to address pre-existing
> issues reported by sashiko and in the process provoking more reports so
> let this be the last iteration where I do this. Vinod can we get this
> queued for v7.2 now and iron out any previously existing problems in
> tree?
> 
> Merging strategy: there are build-time dependencies between the crypto
> and DMA patches so the best approach is for Vinod to create an immutable
> branch with the DMA part pulled in by the crypto tree.
> 
> This iteration continues to build on top of v12 but uses the BAM's NWD
> bit on data descriptors as suggested by Stephan. To that end, there are
> some more changes like reversing the order of command and data
> descriptors queuedy by the QCE driver.
> 
> Currently the QCE crypto driver accesses the crypto engine registers
> directly via CPU. Trust Zone may perform crypto operations simultaneously
> resulting in a race condition. To remedy that, let's introduce support
> for BAM locking/unlocking to the driver. The BAM driver will now wrap
> any existing issued descriptor chains with additional descriptors
> performing the locking when the client starts the transaction
> (dmaengine_issue_pending()). The client wanting to profit from locking
> needs to switch to performing register I/O over DMA and communicate the
> address to which to perform the dummy writes via a call to
> dmaengine_desc_attach_metadata().
> 
> In the specific case of the BAM DMA this translates to sending command
> descriptors performing dummy writes with the relevant flags set. The BAM
> will then lock all other pipes not related to the current pipe group, and
> keep handling the current pipe only until it sees the the unlock bit.
> 
> In order for the locking to work correctly, we also need to switch to
> using DMA for all register I/O.
> 
> On top of this, the series contains some additional tweaks and
> refactoring.
> 
> The goal of this is not to improve the performance but to prepare the
> driver for supporting decryption into secure buffers in the future.
> 
> Tested with tcrypt.ko, kcapi and cryptsetup.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

None of these fixes are Cc'ed to stable, so stable kernels will remain
vulnerable to these race conditions.

Shouldn't this be preceded by a patch, Cc'ed to stable, that marks the
driver as BROKEN?  As discussed in the other thread
(https://lore.kernel.org/linux-crypto/20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com/T/#u),
none of the current functionality of this driver is actually useful in
Linux.  It's just been causing problems.

- Eric

