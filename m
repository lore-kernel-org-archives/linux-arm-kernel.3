Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA0CCD5BC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 05:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88Npyed2q+zi0Zs6GqF23CrwfxW6+LlJKTbPEDjtJhc=; b=1n/U47h68wmT03+sNe1HwiC+wd
	4SlxTaA2el5Kp6OiS+FKzSykyHSaQ6PuVdSDUzKZ7hm4y3kq3rcPCewpG4kVqhZTY2XcDCANTh5qn
	a89s/kvILTMjjDWm9sj4HRKFhXD9CYygFrCm6fV2uHf/APJPhw+85GSKO4S5SmviaXBTZD6hBTr7m
	lni+KL1Ukxjyxh/YenLf6uwBDHS2h+F4H7GwBPXbZglpnQvEjpIVxD/EI0N2UEb0KELnQpk0439hk
	tBjPZ7hRShMgWi4jt5C+Z6mM9vpUrj/C0c3hQCIz3gjJ5rPQN65/OV257M6OR/CYLWOidjmPoCfeK
	KLg22fbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRO7A-0000000GLtj-0FH0;
	Mon, 25 May 2026 05:44:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRO78-0000000GLtM-1mHW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 05:44:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 94EAB40683;
	Mon, 25 May 2026 05:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27821F000E9;
	Mon, 25 May 2026 05:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779687873;
	bh=88Npyed2q+zi0Zs6GqF23CrwfxW6+LlJKTbPEDjtJhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ewB6xBhTAHFPcHoYmoNAQKnR38BLOJinqd0yySKslCcdGz8CNS/0yi9YFnr6LBycA
	 UJCe9t1ePg8o3PI0+7pQ/XdYCKuXkmQTA5vaF8WtaYkrY69fvjgKULReJRxyLA3HY+
	 l54MOdYF0vbWVNe+kFHrV5OlYzdWRttUVPNOeniZqobLm42DToswtoTd+owx3SKwU7
	 cLXp50FkiUvsOLmkKPlE0+KyHWcRxB8852V0wuytVAYB9bp8gxKLpcFaa57JuasXSy
	 ONir9L5BYNlzEz0gFW4Yu1LTb7OmtR5RH8rpVJHS1PovMAUIDHo+PYGER/DHmjNQ7U
	 olQ3h7Er8szZg==
Date: Mon, 25 May 2026 11:14:20 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@codeaurora.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v18 00/14] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Message-ID: <saciwzun44yw2ijprcg6s6hz76gj2lm4m66usurtksuv4si2cl@xncnyfrqvigf>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
 <20260524204921.GC110177@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260524204921.GC110177@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_224434_482653_87EED2BA 
X-CRM114-Status: GOOD (  10.68  )
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

On Sun, May 24, 2026 at 03:49:21PM -0500, Eric Biggers wrote:
> On Fri, May 22, 2026 at 03:39:53PM +0200, Bartosz Golaszewski wrote:
> > Currently the QCE crypto driver accesses the crypto engine registers
> > directly via CPU. Trust Zone may perform crypto operations simultaneously
> > resulting in a race condition.
> 
> So this driver is just critically broken currently?  Yet it's still not
> marked as BROKEN?
> 

It is currently broken on a subset of platforms supporting multi-EE, not all.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

