Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14472C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZDebBuIwhQGKIA5zH7FXUsKlBBCwxUk5Cqi9xBTjTY=; b=TyBMCNsiB4tOKx
	ctwtlI2BFAFJL44qzlO5ZaBrWCx1pY7S3IXWtLD8L8HHH4C9SujgzaVv3oGd79HMZ87K6umZDbw8T
	PA1A5nghY/5twYzGEjS/xXMnrGMoL8dw/U0GrXLN0/oJNnTQ/v7Fx02nZGTutjAPZ3fpYqP8xql2g
	t3qdKn/y5z2H0N51j4mNXAwfMP8fWltgZBkK5M9gocle1ZDY8wiwNEjsLGw2AmszBH4yJ0Wur60fC
	EiD9vNmCRTikznVU4i6SnRZPw6k6lZHQeEBGXyilGf/IRYf6nNcPHGuwquBjn6SWoUq8wpRhjs0ZM
	lJVdlIU5p5ccErxykn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGhAE-00000007Iwm-2wmV;
	Sun, 18 May 2025 16:47:02 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGh5E-00000007IMD-30Sk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 16:41:53 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2dab7a32fb7so1005041fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586510; x=1748191310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZDebBuIwhQGKIA5zH7FXUsKlBBCwxUk5Cqi9xBTjTY=;
        b=gdph+nyYRfO+q/fycPJ7Hl2a+E5tMf6f9P8ZzfML7SOUxa6IrGffMsga7QeAQC5t8K
         MIacfLd+MjV06FhR+tl1sn5pzsOHz8CD1/lLeOm6i5LJMbehmNfomDzYVGRHuOSTk9Hq
         Q+h7cclD/aszSGk/6S/RG32BrjT/jO4Xxee7kyT0xdIMLGJVoKTa/h7UeSk9xHGNPO29
         wFQ624tS5fhB7rSzpJlKzIq0kQRFtAX5TaK8P5Sr8QtF8ucVtfTBbUT/32I/VYCemR30
         +PKyVjZzJOAPIqR1LSp6Y2XmKvEJQlwi4/7MI8l3C+U30Ayf588ff75zC5AJeWSL+wFz
         J7dg==
X-Forwarded-Encrypted: i=1; AJvYcCUt0kWTrQeZuMHWG2VgnHrXUc6GNhZBKqQxzOVZfhvrmXBjQb9gA/NIlBcQe/vYApDGJOA7lrFFc7eHPdlSie2b@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+mAabPySJAy5hMoRU67tVaUlo+FG05mXTIbjMnzhG6YSx9Etc
	Ok7LndTOeg5nzZyQa1JmWTcFf+92Y5GwxMB0TYi9clBaOPAtzaf2IFyanPbzMpcbavI=
X-Gm-Gg: ASbGncvhgLWtWr21mRv67Setm4LCsc6dOFU0oDdy8uLb2EMmowQoyYS7d3zWVlRd/Eb
	I9NXY7OfUQ5684nsTmOh8LvcZKiHuZtsT5Fej+w70LsiTHk0HVZzbkwYyjeH59FcAH/5jtxVrR+
	Ey09iMYnsB1l+GaCjrr8AVhHZ2j5faTl2Hpq0X/j0CstO/YyfboKa85yChdDqtrY2npd9EXyYah
	5OWL/k+OQrnxXEfs849xqs1A7InVTjpvBubxjXUoMRVKz+168+csrN5R1tLhw/Z58/Jffk11O7n
	3E7MykFDm2Gl36oz6SxbO4aPhmu5X8Y90+vsx6fW3Ou9m9ot2TFPHFNgLoA9TpqqHCdORgqsXxC
	le8a8bQkj0D03Dn0=
X-Google-Smtp-Source: AGHT+IGBI04YclcUGmwVLl7yxOb/dSr0Rcm3jxiZLFu4IiDC3NlCjbiHRTGpeF73na7JFotardoapQ==
X-Received: by 2002:a05:6e02:1a6c:b0:3db:74b3:3851 with SMTP id e9e14a558f8ab-3db843238afmr110509385ab.16.1747586499272;
        Sun, 18 May 2025 09:41:39 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db8444917csm15895035ab.64.2025.05.18.09.41.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:41:39 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-86135d11760so311781539f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:41:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPdfhMSm74niIYVToX8iHkN2xCJvRGKJygJykYFCpbA8tx0w46ojAVHXj5ag/k4mThg9QXXquo9OgE+HPCetBR@lists.infradead.org
X-Received: by 2002:a05:6602:6cce:b0:86a:93c:f5fb with SMTP id
 ca18e2360f4ac-86a231901efmr1346917139f.1.1747586498864; Sun, 18 May 2025
 09:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-4-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-4-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:41:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nwNrL1bJjqeLaUKxntPbbL=amao=3fLQnVwKt6bFyFw@mail.gmail.com>
X-Gm-Features: AX0GCFvPNTkEIdX7vf-6v-hZnL1kJZY7vaEnvAF5rZAuePObHWHQncZKVmFJnYo
Message-ID: <CAGb2v66nwNrL1bJjqeLaUKxntPbbL=amao=3fLQnVwKt6bFyFw@mail.gmail.com>
Subject: Re: [PATCH v11 3/8] drm: sun4i: de2/de3: add generic blender register
 reference function
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_094152_754822_9E96CE5A 
X-CRM114-Status: GOOD (  12.27  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group.
>
> Prepare for this by adding a function to look the blender reference up,
> with a subsequent patch to add a conditional based on the DE type.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

