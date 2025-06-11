Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F960C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+DE3o0pdGXz06zgVZBeZ9E239WvHiM6KwDb9z0VBeM=; b=YwN93WY5MwqoVaG7DD1yRlYE1+
	Qw5sONa+RYKM5KiMWvSQ8QT8csIzMdyo4/EwVxOL43l35oH03wALqrqEcdEPRnqOpLmHwu0CtJvBX
	F8/CkRQ5DwhNQZz/8ju7qtDoiIf9LmlTKzwZsPwOcApl3lyroQkDdK7AXKYTqg0NTSddGJLUmWmZB
	WH16HXJHhjc4kHXAWTn8K2z404Jxmb/0OurkOZkQTuYh0PyGCcYplKCWCiHQII6x/ahIUL1ba67dN
	OWFlGm0N1+KyoI067UJ1M1F0b7KT+ZAqBWla1d9QkQ0+lna1tXXuAspENXi0Ul57GH+uAbwhSYvzZ
	t8Yh/tYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYr-0000000B4x9-17LV;
	Wed, 11 Jun 2025 19:56:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOSI-0000000AdOJ-01M0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 16:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g+DE3o0pdGXz06zgVZBeZ9E239WvHiM6KwDb9z0VBeM=; b=pleIKmuEV7jXx4Nn2p6jSW2bXQ
	sXxtkeYgM0JVJpsEd37mg8A5vIfxVr8r7FRrioRjtoRMNrKmUQXcjIn4PBJHYYtOP1expwzJ7/dkk
	ylgL1xAZvcGgWZBVdRCyanoSkAiz5azws4PXQ7V40omLKlOQkcE6lka/eu5ex77Wvp3is4VCGT8qR
	fqI+wVertvZVPocVRYiw2+/RzL636ArAt0aT6egE9mnBmXbvchSD3/3RQSKu4v28uT9jr5rNfVE2p
	3RTFjQWV7xi4XC008KLLA2xG/8kcARhWLjyWPx4PPTvKEpxS8cpyIGNMmsIfFHKdg8pPIYSjVV4Ly
	+bBmcazA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOSG-00000002RnP-0BZB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 16:37:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B5D95C336A;
	Wed, 11 Jun 2025 16:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA57FC4CEE3;
	Wed, 11 Jun 2025 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749659850;
	bh=8f17JNCbmwhQzy5mD6f+45j2FzwIQnJv0xmMlafqAEg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=E93oMAjLUPLSwW/zg0PztdZ7pXCSfwsLe9jNH0prZN9k4mHzriJxiuTnLEoUSUJ9Y
	 ycRzveSJshLaFIP+pC5gjH6ibNnVfyl9DoNz/n/rGl5EHmO8aY/tgzRHD0Afhb/Pkc
	 pZyRMPmOrK1o73d3S7vW9xPzekTYYAzR+E9YuTAEBe0rCmqXVDssRvJn0R1sE3rxSG
	 AF6X0370JwFK8uGCzzYJfMjev3Y7rAnaDD3rIcnbH1re9Z71jy1Nb7Kx70QTOeu40U
	 YQfEY8hqzDIRh6hKqYujacFnrn5Sx835DZL2FASOyPk7HhA/gk2j8+muKZKMed4Pd5
	 7Xx3A6Qjhwvtw==
Date: Wed, 11 Jun 2025 17:37:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andy Shevchenko <andy@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, Gatien Chevallier
 <gatien.chevallier@foss.st.com>, "Lee Jones" <lee@kernel.org>,
 <linux-iio@vger.kernel.org>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH 4/5] iio: trigger: stm32-lptimer: Fix build warnings
 about export.h
Message-ID: <20250611173722.1f78b841@jic23-huawei>
In-Reply-To: <ccde5e45-9541-499f-b248-08cd6fad9a19@foss.st.com>
References: <20250610124855.269158-1-antonio.borneo@foss.st.com>
	<20250610124855.269158-5-antonio.borneo@foss.st.com>
	<ccde5e45-9541-499f-b248-08cd6fad9a19@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_173736_263960_14A6A922 
X-CRM114-Status: GOOD (  16.68  )
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

On Tue, 10 Jun 2025 15:05:50 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 6/10/25 14:48, Antonio Borneo wrote:
> > After commit a934a57a42f6 ("scripts/misc-check: check missing #include
> > <linux/export.h> when W=1") and commit 7d95680d64ac ("scripts/misc-check:
> > check unnecessary #include <linux/export.h> when W=1") we get the build
> > warning with W=1:
> > 
> > drivers/iio/trigger/stm32-lptimer-trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> > 
> > Fix it.
> > 
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>  
> 
> Hi Antonio,
> 
> You can add my:
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 
Applied.

> Thanks,
> Fabrice
> 
> > ---
> >  drivers/iio/trigger/stm32-lptimer-trigger.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
> > index 2505ace440b46..c7bab18221c70 100644
> > --- a/drivers/iio/trigger/stm32-lptimer-trigger.c
> > +++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
> > @@ -9,6 +9,7 @@
> >   * Inspired by Benjamin Gaignard's stm32-timer-trigger driver
> >   */
> >  
> > +#include <linux/export.h>
> >  #include <linux/iio/timer/stm32-lptim-trigger.h>
> >  #include <linux/mfd/stm32-lptimer.h>
> >  #include <linux/mod_devicetable.h>  


