Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EF8EC1438
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 12:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luDZBHiUhkBAz+mUksD4Qwqf81/zGcNtk0iuKrPZxiw=; b=BSqgQNpfJsaX9AfDK5Wu61VK5h
	Hb4ee+Wwzmn/GBJ8G3Igo9zmidpMci0mmt6brQqf0ZHkkT2kuzEqftUPHY2+MVDidXV31RNa4LoIR
	LLXgtfWEzhef/0ALQr/4B2MAm4nl96AeflxWjr3jc5Zu+RViQUwk0s7UDGr1mATLlKOzoSjRofcEr
	4+/hObtttD/Ft+nmcyuMlRFcxG++y4a+Ye1zpM3mJ8LQB2vcrxrHau2AyQzZM43St5eW6Zny6TUsm
	cDoSBY9ijj4/8VeapBW4kBm7MceRMNTKZiqAyXOga020zcHBGcjOrjTEPaElYEcPVgzIamxsJwcCf
	H2SSoaew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxP6k-0000000FAVi-3BZy;
	Tue, 03 Mar 2026 12:44:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxP6j-0000000FAVY-3KKo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 12:44:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DCFB460127;
	Tue,  3 Mar 2026 12:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C386C116C6;
	Tue,  3 Mar 2026 12:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772541852;
	bh=iuHQZypN1F8oLq3wK8SXVV26gJ3eiQfBBD/nb3c0/Xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GqJa55LG1GFSjzlxVfvDZ4AMc1PqFrnVBbQiMR8Oxv/bSAQSNdsEw1rpByjm7gCE9
	 EbaKQlgWhPqIqpu7gLP/wC5/FS9yTLxuYMJqPPtQjS+o+aZhOwQ7N3fmRXMhX9FVAY
	 /vY2m4307N67zkxQy9NBseMSMa8YtmLvpRSk+zEeFc4uHPThToNohb0dS+qhnBD1uM
	 NVr9K4jEV15ZNfOKm8+emBOouNZ6y/naCeDM3bF+7Hwj3qoXfQsauC9J91ck7zTrwr
	 BrZFS+f1yCpxNwEGJO/479AjfHBjLzGHjERVl6zsEvbBIwHbQ3l9QZ9AcJc3QgkLLc
	 D1A9JImGuZ2ug==
Date: Tue, 3 Mar 2026 18:13:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH RFC v11 00/12] crypto/dmaengine: qce: introduce BAM
 locking and use DMA for register I/O
Message-ID: <scr5qvxa7f7k22pms4c6k5gwiky7lhssrw6qryfngexlek44g2@rayinnnwqgbt>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
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

On Mon, Mar 02, 2026 at 04:57:13PM +0100, Bartosz Golaszewski wrote:
> NOTE: Please note that even though this is version 11, I changed the
> prefix to RFC as this is an entirely new approach resulting from
> discussions under v9. I AM AWARE of the existing memory leaks in the
> last patch of this series - I'm sending it because I want to first
> discuss the approach and get a green light from Vinod as well as Mani
> and Bjorn. Especially when it comes to communicating the address for the
> dummy rights from the client to the BAM driver.
> /NOTE
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
> dmaengine_slave_config().
> 

Thanks for moving the LOCK/UNLOCK bits out of client to the BAM driver. It looks
neat now. I understand the limitation that for LOCK/UNLOCK, BAM needs to perform
a dummy write to an address in the client register space. So in this case, you
can also use the previous metadata approach to pass the scratchpad register to
the BAM driver from clients. The BAM driver can use this register to perform
LOCK/UNLOCK.

It may sound like I'm suggesting a part of your previous design, but it fits the
design more cleanly IMO. The BAM performs LOCK/UNLOCK on its own, but it gets
the scratchpad register address from the clients through the metadata once.

It is very unfortunate that the IP doesn't accept '0' address for LOCK/UNLOCK or
some of them cannot append LOCK/UNLOCK to the actual CMD descriptors passed from
the clients. These would've made the code/design even more cleaner.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

