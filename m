Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BFDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 19:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzcZFZvibxl8tZy8Y9S8f5ixP/SP4wD9SfcUeZfBzRQ=; b=Eizd6ZV5rn7dQs3bX883TyWfIx
	2AXSPxlYL/bB0V9DFrMGEwj9fZ7qFlo5NmNGopkw9hKr13UYfswB+lT8cuAj0f/L0/qi5z5n/B+K8
	F2qrSBSb7er/2VejRhbHFmGF0gdpxDKNQXvcHnd4lwocHRYd84T0ilpEJf0c8eF6wGpR9ORIMJoOX
	pmjKLLn9wilcOV1wiPp1iyjO0QnhJkss/Cj3Mkt092wLOts8WBdtz5X3+dwbU0xMVYIYPFlQ7OLRS
	EAWB7vYkVnBMyPd46w2IxU5HSPTE2VHefDpYugDbhkhfz/FqlqE25m+xx9vApP5YPXY+1qzTcawUt
	EF3TqrMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiiL-00000005wxv-0x8S;
	Fri, 20 Dec 2024 19:31:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiaw-00000005vJV-0BER
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 19:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 341FE5C66E5;
	Fri, 20 Dec 2024 19:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25C5C4CECD;
	Fri, 20 Dec 2024 19:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734722608;
	bh=8MxBm/f/RHRQ3Gf57kt1o4LmZnVEmLGOSZcQVADCAN0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=djOfBf0+CwiRSXzRXh+w8lKqe3/DU+eQhTOIe0cGk6wkQTcpqHTvU1TSs9S7Bzx3E
	 +HnsJKzzQ25RD9xjhgHXyWJzyVedM7Ic9gxUmlWzffxj9UEUguIMq5LB6KbUWJKS0B
	 FWK21rN7nNx1/D11q1enDMD2180jDVum3lxYNAKkDWUv3QMXJCEzcoBB75/ud0TZDq
	 SGvxMPzdlLsNI0ehKXwtubqZPbxBR56FpXTty+XDavwLi1ATLO0+hQjifU5ckT+fft
	 sRFgiDAWHt1uP/vnsfjia8wzsc1qTDn+ETwEhNfsx07R+O/KvOy4bAqbokry5hKMMK
	 6E1wi8mMwZabg==
Date: Fri, 20 Dec 2024 19:23:17 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>, <wbg@kernel.org>,
 <ukleinek@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v2 3/9] iio: trigger: stm32-timer: add support for
 stm32mp25
Message-ID: <20241220192317.1266a34e@jic23-huawei>
In-Reply-To: <20241220095927.1122782-4-fabrice.gasnier@foss.st.com>
References: <20241220095927.1122782-1-fabrice.gasnier@foss.st.com>
	<20241220095927.1122782-4-fabrice.gasnier@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_112330_133392_B4560AE2 
X-CRM114-Status: GOOD (  10.61  )
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

On Fri, 20 Dec 2024 10:59:21 +0100
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
> this new HW variant. Add TIM20 trigger definitions that can be used by
> the stm32 analog-to-digital converter. Use compatible data to identify
> it.
> As the counter framework is now superseding the deprecated IIO counter
> interface (IIO_COUNT), don't support it. Only register IIO trigger
> devices for ADC usage. So, make the valids_table a cfg option.
> 
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
I'm not seeing any compile time dependencies, so I've picked this one up.
Applied to the togreg branch of iio.git and pushed out initially as testing
to let 0-day see if I missed anything.

Thanks,

Jonathan

