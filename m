Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E1FC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8oryUDvqGtQsqz51BYnQBJc1k4wLZ1+2yLF7stESiM=; b=kWCovibPk9MgBO8h9UY2B4i/fR
	xBfpQufM4tGTIpTW+ibPNVuJSw7qFVoJQP+wLWuGXlu+COghXnvu6xrJEby/tRY9TyuBhnTqYpjdO
	lYcFHTNt/LOjNa3SM2nIYTTU2KTSRtJOd+uFCc/VkQj9uWhXSPyTkLQpi3+MY9ZEzg7DQ7H4Wcmc5
	BGKW6fmKmlfU+wnIQUciHJScKHZIzEQL9Fs9gqnTOSQsPOyXytLG7RkGjjKSyx10hR+Y7vJvxfhsR
	Y2QyNhwwOebQbCgqQgNxuW9NE39+2lRWoRKypTRRcnkflf/i14slDh4pGW+7+b7BqRiOKF0J4TkYc
	7bvdVRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5VQ-00000008HMo-2ydm;
	Wed, 29 Jul 2026 14:43:36 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5VJ-00000008HLS-3Iv8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:43:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4728c12ba97so710220f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785336208; x=1785941008; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d8oryUDvqGtQsqz51BYnQBJc1k4wLZ1+2yLF7stESiM=;
        b=TwyEZhaZ1qTvZ55DEiNKaIu70wXnRilK0g/BLVZJuUryAaBWS1Vce/iEHoXrVQjLMO
         mwp1iL49Du1twSmGKBjIGaaZdZkqjIhlBnlq0fwXG+2SfZw5fEglUB/4lff1WTcqKVWY
         8Y3KocAtreKCEsEM6nc76r3ySEiAG95f9Q3oQ6IG4QdaDy8pJ1xNlcMekbsOoTFu9pbS
         JszV/NXMP26Q++LGuxgcdEzyEN52Yk+MmhXdryZKC1x5JCMbnhk43b4fRRQ0QbQPK/RU
         YaOJTUsIGuvhGawx4Ix9uZ630RILyNjTNrZSp6kObCbxOHq5hMJV3r3J/RcTZfzra8CD
         9fLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785336208; x=1785941008;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8oryUDvqGtQsqz51BYnQBJc1k4wLZ1+2yLF7stESiM=;
        b=PhY5VyUv9WfSsxgSVbO2UvrPCzgjuvmbWg7x9Tb0QTFN7rLuKozXAOG+rB9PjXOe+J
         TFkXggJPwo/OhSwCB5ExxlrEB0SGyi5zFQleRqktAYKQPUyFYTYvJo0wxFexlp4G5um5
         O8XWaDt6uJU095f40bDY0mw+U/7ILDII1KwopeYwDDnk/GeY18KjRgIk6VzpZvMQeBHV
         04HqA6etIm0IRhCLfb3rNr8mxu08ymI/eTV303+ThpPVPVounHdXoGU36iKfEle9gpay
         C5xMv8B9l+GNIl7qM/Z8CueJHpvF029mXLGgSCSrc3+zH5CvrSYFZA7cc21LO65BqPzd
         3T2w==
X-Forwarded-Encrypted: i=1; AHgh+RrjI0yvi/TQkJ4S7KXGQdfICMLPK53112t14OINoUJt5L8onqp17aAltUdYlMpjpKyewcjXJwNBzNmK03OIt0Uh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo/bta+bPJzZLPfu7kn2PLjaODVc0IOJVrHeDEi+fx2vnbXk8o
	FdQT1VWNvpcGbRQNt9FeirYsD9ZGOKksl/CDgX+TSmIyrBRGgoZO7jcJ
X-Gm-Gg: AR+sD11culdxLmf1YuCsXsR2hJAIKma51+Dvm99ZqVl6wEi3Lrn4WcdFyWhqFEhmBfR
	gapLW93SLIf7EElhKw97mmfhgrrR55ZW40KKGahRxtDNPfK+6ioJoFSUbcGyQ6ImzFyIlzh484b
	gNORgGKjXuF8XmPLVeH23igsOUbnGXmXEzstePBUJYz4FDlMTG1ztaOoapkIQ+hu3NjcmLDn38l
	da61PaPiOwg3Pxr9qoW84T3rjkMYybEqFfSKuX9x7IhXlfoeGZBJvnI3DXGsTL88eTFWiLzuXoX
	zsmG1aggVW4MdU8u31Y/19i5YNSTRJ7PLm5M1fpOQ/DD5hcELZSQSbz7t7xYOWW6ulpfIm3Og79
	2rJoADAQ+aM5CgS9rau+/+JIluvu51y+xP0iiivyOtADR9Ed2mZW/NYNGBGj3ifExrxHhFR6qIf
	GnS/HMinZW7QVAcPRB21SRilZlNVHuvnixJdBcgBqq6Z05QgaYUdSV4030NhbiLYp2D/MhMaOxs
	sw5qRwC0vyie9CHhjYiwTTQ1tI7SvZXr2YYOCITUXfYSIo25OZ17K6+E3tT0R9LO1M1dB2LYuGU
	oAvrSxHd2A97hcB/uenbwEcKTNZHP7TK4byPW+NS7bJBhIjwsD/oUY8p/YMRfsmda7WVi06vGBv
	v4tX5e+sJs+Po+SFLToZJEWXrBy3xK4lLro2YaQcaDG5yMQvlQm9hak4+QH8KvxlRPd5+0pU=
X-Received: by 2002:a05:6000:220f:b0:47f:4e42:669 with SMTP id ffacd0b85a97d-47fb1ed964cmr8993565f8f.22.1785336207932;
        Wed, 29 Jul 2026 07:43:27 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb647a8d4sm8618890f8f.0.2026.07.29.07.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:43:27 -0700 (PDT)
Date: Wed, 29 Jul 2026 16:43:26 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v3 1/6] iio: adc: xilinx-xadc: Modernize driver code
Message-ID: <20260729164326.00005c44@gmail.com>
In-Reply-To: <20260729125455.95893-2-DileepKumar.Nagavarapu@amd.com>
References: <20260729125455.95893-1-DileepKumar.Nagavarapu@amd.com>
	<20260729125455.95893-2-DileepKumar.Nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_074329_877028_019DF2AF 
X-CRM114-Status: GOOD (  21.21  )
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

On Wed, 29 Jul 2026 18:24:50 +0530
Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com> wrote:

> Modernize the XADC driver by updating the code to follow current
> kernel development practices.
> 
> The changes include:
> - Switching to kernel integer types (u16, u32)
> - Replacing open-coded bit manipulation with GENMASK(),
>   and FIELD_GET() helpers
> - Using cleanup and guard helpers where appropriate
> - Addressing coding style issues reported by checkpatch.pl
> - Removing legacy coding patterns and simplifying the code
> - Added MAINTAINERS entry for the Xilinx XADC driver
> 
> These updates improve readability, maintainability, and consistency
> with modern kernel APIs without changing functionality.
> 
> No functional change intended.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>
> ---

I thought I was reading a cover letter and then I realized that these
are all changes in one patch only. Please separate this into multiple
patches, I count 6 separate patches.

>  MAINTAINERS                          |   7 +
>  drivers/iio/adc/xilinx-xadc-core.c   | 351 ++++++++++++---------------
>  drivers/iio/adc/xilinx-xadc-events.c |  53 ++--
>  drivers/iio/adc/xilinx-xadc.h        |  78 +++---
>  4 files changed, 222 insertions(+), 267 deletions(-)
> 

...

> diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
> index cab66bb8cc1c..b468179736f7 100644
> --- a/drivers/iio/adc/xilinx-xadc-core.c
> +++ b/drivers/iio/adc/xilinx-xadc-core.c
> @@ -11,6 +11,9 @@
>   *  - AXI XADC interface: Xilinx PG019
>   */
>  
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>

Since you're moving the driver to kernel types, include <linux/types.h>
as well.

Maybe you could do an additional patch that removes the catch-all kernel.h
header and adds used/removes unused headers in accordance with the IWYU
principle?

-- 
Kind regards,
Joshua Crofts

