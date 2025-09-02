Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DBDCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Bf4MIGFcO7L2Ms6soL9Wdgx2dozgt6w1dCR79tGsfg=; b=LVc5bCm+ZsWtQ8xFrfE7v7aA6j
	XlrtC5AJiEDqXmHd1ctos4xDO5i/1NsEVUQJ7ORmDjre226yFp/ytz/P/Pqx3FIcNnS3Dp0PHZEbu
	h693EhVOFY9MyA3k165uZWLS+Wh4R6TeksgIv4P0pBAX/8jsQnFBP3v11knDj3k8E2/y2v76oQrYG
	qyt4LqQS64pn7CTEDYyE0X+YZw5oAJdXo9S5rb/+f/es83tZ0QY/HV0CLWVlibaEfXNY9iGvCKvI2
	RHTnHMGYBJt7pGvhx3dW4Nd1/hP5zNvXKvAqi3HsPuct1I8eilQZh1HjKavBOgsIK5MF4PlEchGs5
	nQokruUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQBd-0000000HJyt-0aDn;
	Tue, 02 Sep 2025 12:32:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utOFK-0000000Gg3o-3nov
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 10:28:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5571526BE;
	Tue,  2 Sep 2025 03:27:56 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F08263F6A8;
	Tue,  2 Sep 2025 03:28:02 -0700 (PDT)
Date: Tue, 2 Sep 2025 11:28:00 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Pawel Moll <pawel.moll@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] mfd: vexpress: convert the driver to using the new
 generic GPIO chip API
Message-ID: <20250902-kind-gorgeous-armadillo-166b84@sudeepholla>
References: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
 <CAMRc=Md+2_3w5kdaUF9-nGdHv9C+tGRfN9TTu6E4+hSdFbwGBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md+2_3w5kdaUF9-nGdHv9C+tGRfN9TTu6E4+hSdFbwGBQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_032814_984547_746D6F5D 
X-CRM114-Status: GOOD (  22.79  )
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

On Tue, Sep 02, 2025 at 11:28:49AM +0200, Bartosz Golaszewski wrote:
> On Mon, Aug 11, 2025 at 3:36 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > This converts the vexpress-sysreg MFD driver to using the new generic
> > GPIO interface but first fixes an issue with an unchecked return value
> > of devm_gpiochio_add_data().
> >
> > Lee: Please, create an immutable branch containing these commits after
> > you pick them up, as I'd like to merge it into the GPIO tree and remove
> > the legacy interface in this cycle.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Bartosz Golaszewski (2):
> >       mfd: vexpress-sysreg: check the return value of devm_gpiochip_add_data()
> >       mfd: vexpress-sysreg: use new generic GPIO chip API
> >
> >  drivers/mfd/vexpress-sysreg.c | 25 ++++++++++++++++++++-----
> >  1 file changed, 20 insertions(+), 5 deletions(-)
> > ---
> > base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> > change-id: 20250728-gpio-mmio-mfd-conv-d27c2cfbccfe
> >
> > Best regards,
> > --
> > Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> 
> It's been almost a month, so gentle ping.
> 

Sorry for that, LGTM. FWIW:

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

