Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C87E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 23:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdxjQ8T5t1v8Mpe6REWFrX5FYAivMDOKnemInUskqsE=; b=aXU8YAKbsjdDScGv0bAYe1AIoF
	c+QY1EG5PTvUZbDac30hkEBt+U70mAfy3AJOfxgs2XJq/x7FDzadxvGQUxe83ASnUGQ3fZmrznVUM
	DG7UDZLnkJvQ4GrgooTloDTKZENvyI+D0TMOy2q70NqWu2DtXBc0wJIfTunRpYzayBfolwQDxp+hJ
	km5lD2chcx7EeGFialB8DvmnEaHHs2I0lYghx8utc8ceHNdpxmwr0EGiLZuoNXhK+t6Ur04stpjHr
	Pj1WRnGbciyko4P5qJmN+OkO8IWowXFjqC37TpVwqTsClUAYPgRNJNU2kfaMFNHAqe4IaLbHgVR3f
	7HNvUDnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQxXM-0000000GfGS-35lF;
	Thu, 26 Dec 2024 23:45:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQxVj-0000000Gf2q-3yoH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 23:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47B7CA40EDE;
	Thu, 26 Dec 2024 23:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380BEC4CED1;
	Thu, 26 Dec 2024 23:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735256602;
	bh=d1r/cZx7URICkdrXL6Iza4ELRVrvNkHRrHDOleFVbyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RgiRlcHr8qh8suwOozeCJQ+yvM/bbMpiXladFlTxtu66OtLWo8hvwrsCEbczI+Qlv
	 /mfKvTAure4YX65jm4E9DwHA+bOHezOOxqEnua0mlUya+WZL6blpN6J6zH9/9A+kmQ
	 iFi+4ZpnYEuVmS+lzTMMymoW8+/fzUDVE5QbzwWN2qO4a42cvddM2ppUxtZB0u+018
	 sPNrKVDUVq8ycNVxOMQX2mct5Ngu5zUCKCj72iGND9ZgS1kA+6RQ0rDEdviaT2q0+A
	 8w8PiB9BreWL5ACDYdcai0e5jt89bPqE4e0sja06NrLMmW8D8XFxPAFciZ4h8pIjoe
	 gteUVjICMJOIw==
Date: Fri, 27 Dec 2024 00:43:18 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 3/3] i2c: davinci: use generic device property accessors
Message-ID: <d2jtkkymp2t5lszkykuniymcxlklamhadpq46rkymlg2b5gluz@cp7esf7xldg3>
References: <20241211102337.37956-1-brgl@bgdev.pl>
 <20241211102337.37956-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211102337.37956-3-brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_154324_063446_2392F8D9 
X-CRM114-Status: UNSURE (   6.87  )
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

Hi Bartosz,

On Wed, Dec 11, 2024 at 11:23:37AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Don't use generic OF APIs if the generic device-level ones will do.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

