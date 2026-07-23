Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E085C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6hmrvX6/zADRHHfcMX+3cn85LWUnEyDle0EN1gIv1U=; b=yhYaPCq1TE53jNmyoTj36wR83P
	WFiae+gFP7Nu5T5CTuXizhmlMM2980jF+RRUVAvz96yFATeQ46WaVQH6rIghZH9YlBWA6Wx4tQ+Zv
	n7wXo4sVTdZdg8LYD6cfJ3W0kvMX/Yb3kZLsehkftSQNquw13Tu6iutSQStU8Iu4B+1ZTtk2nRQan
	4SRNudjd9qDMEoz6jHNNiUdn11ZcwM67IuIwAddy8qIHP7QrfIYSWhvjOymhr6R/6XRO5xyo5KnuM
	PifvrNyHi7x0tTX5tEGAt1JpUs34dwVYMV3fp0Jbs4ZTyesMl8Vy/fCXB9BOE19FxCiTqWfLWGMLc
	0JDXINlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxCn-0000000Eoy2-08Kg;
	Thu, 23 Jul 2026 17:27:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxCl-0000000Eoxn-0Z3p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:27:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F1EF438B1;
	Thu, 23 Jul 2026 17:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C631F000E9;
	Thu, 23 Jul 2026 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784827650;
	bh=y6hmrvX6/zADRHHfcMX+3cn85LWUnEyDle0EN1gIv1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gac3z5KbG41u/i25YuRaqpwAtHTcf5k/ZvCq1DY0njO4UCRju3KkpQGAATBL4LxWg
	 UZ+8QSxHYCjqs0cu0KekgrzuOmuM1qlPeXxwNx4U9TB0Z8BWyPK0XnCRIAs4b6AGw+
	 doJaBXXN19Dlj6fQdPHQLmyRUpRP5oXtVZ+kL8j1s6Kw4JtMjyjBYbvAlrQXBTltz4
	 dCBsXfhYdeTNSEDvCN7cgxe1mK4tXcmJFdm838K+SyboKhXKQGwLt4jrJACPCa3k7Z
	 EhlI2kTGQRMlY/kM/44oD9Glha91fJ5DWx1ZAiv6FYcaOG1l6uqQSBPRGHyF+NvQ61
	 BqpcXlQkglhyA==
Date: Thu, 23 Jul 2026 10:27:28 -0700
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
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v24 00/14] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Message-ID: <20260723172728.GA93534@quark>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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

On Thu, Jul 23, 2026 at 07:09:06PM +0200, Bartosz Golaszewski wrote:
> Currently the QCE crypto driver accesses the crypto engine registers
> directly via CPU. Trust Zone may perform crypto operations simultaneously
> resulting in a race condition.

You've claimed elsewhere that this isn't actually a problem currently
(since the problem will be introduced by a future TrustZone software
update).  If true, shouldn't the cover letter and commit messages be
corrected accordingly?

However, what if someone runs a LTS kernel on a system that has this
TrustZone update?  None of these patches have Cc stable, so LTS kernels
won't get them.

Also, won't these changes further exacerbate the performance issues with
this driver?  This series adds a lot of additional overhead, for example
by replacing fast MMIO writes with DMA transactions using highly
fragmented scatterlists (see qce_write()).  There are also new dynamic
memory allocations, which can fail.  In addition, there can now be an
additional delay to wait for TrustZone to stop using the hardware.

> Tested with tcrypt.ko, kcapi and cryptsetup.

Did this include testing that this patch series solves the problem it
claims to -- synchronizing between Linux and TrustZone?

- Eric

