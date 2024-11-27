Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E33BD66BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 01:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6yJthSITZz0JgeCwZB+IqdVfVUyc0ONXrqOpbvTgLw=; b=RL3tX4U9ykC+hwsyLh7uJTnUoc
	GXQ/lxnmGBV7q3YNKwy92UALla1zVhfqsQOLYwiH7KNwadUDQiH5iKP+WU0L95UVI3+J0rh1w+GxW
	MoIIcSM06za7GyOnG1rte23R/l/5z/6OQ2uue9DZ18yxUW6CVeRiZDPcKGwGZ4CS+DMr9rt3MDZy4
	Elwd311KmNCvLAEAbQSeitAY5PMToTZFjh/lTizDcv2exqak5zUKGeJfLjxXfzTNUZvGJZkzMh05i
	30P00B2W9YythhJ58vdbUJHOVYwwkFdBK9uWbmQWO4vI6m3Oaq5lIEIz5ERy1QZvvygjwoflibMF4
	3690Eusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG7EV-0000000C2OX-07y6;
	Wed, 27 Nov 2024 01:52:47 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG7DX-0000000C2Jb-1Mdi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 01:51:48 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2e3686088c3so4956958a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 17:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732672306; x=1733277106; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6yJthSITZz0JgeCwZB+IqdVfVUyc0ONXrqOpbvTgLw=;
        b=KPqDVNqXJAAFrx/t+QFeYFV1srbqFZkc4san8xjhkwcWkDuYLoqZIH7sMLp16mTQOx
         s9D5n/iDUVxF5i5T5nAHvTrXJcou8O3zbH3s5HItUx2QhkfyLWuNsqM+FsaKuq+OU5gv
         doZWCvWoQ/CxgkjbpDLL2aBVbVYibQDKCxq8knnNj7oAzwKGepngr3byb67ZMG0CGoYS
         sWgD2tRkLn++mgicGmp8gLXnYpvcVRTAKXi85afPDHXSu0F6VPj1wXrtwYOOmeVdDjJQ
         r4weOKDy/KeHeOpIcIElvZF6UhcLciT5cVQoGF0wb/Qw1yk001Zu3ZXkEFcA27DVFH1O
         PIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732672306; x=1733277106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6yJthSITZz0JgeCwZB+IqdVfVUyc0ONXrqOpbvTgLw=;
        b=HvIyWdeCIhs4TbCOF9I8s3Xj3Gi6OqqdnNGBBfDRrKO+PSJwQAFIINlPxwXmdXiusX
         FCxhgGOnqWDV85Exuku2358lGYNURiuhlTePjgey63byV5BpDWCzm/kNfYvXeZOhCel/
         FD6bx8EhJJGHRgW0/eKkaHFFZcgWCR6jZEGd8Qv3dank7StqpGkskVZ1Nz/PVjViRQoC
         hNynaZDF0wrZninm66TVyFbFsp+mKWc90bNl60Hvo67vLZkj3tsHqywfOp5Q7sP9p0O5
         od6c+avhC9SOcez3MXnRKr/0EjAeN2UPYSJ8iG7bVlCeDl4ZXqpxv+qzUi6N3WpxNR+N
         W6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/LzhMDAQ4Ei4CS1vXBS6NzMoQhk/qydG9YUq1oXdF9Q7N2ssJ1laqQ6xKSjDA7ZZJHdl4fI35KnQvQj2OdfSy@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy3gU2U7be1o9nKNGsN7WJHFon8EIxbXXBSbJiCMfSn0vFqHec
	VJWcm49rgA/lhjPaA/HmwueyXM/tJzc4fT+k9YV+SF7VrqH3QPfikkLsVQ==
X-Gm-Gg: ASbGncv/+jfCt4pIaQ+G720x8llUGP7XmnbyJ4z7eVtZUZTgu/d7+ytGyltWLP20RUa
	K0QhZ2mEkNnrUswV3EpKxXpQoUnB9PjoRE565RfpLa1ci2hIYV/T43W8XNg0A7WNcG2rcnFO4zL
	94IiSUlHgLLsakgzdt2B4aORSWpBv4Hl0f8h7MFCfT8jOe+h4u/JU3I8plsiS7/a1klIGJn38zR
	YWBlTBOWN+V6ZgurZorOcLBuhTDOSjfTE237in6k+ruDQuTh0U=
X-Google-Smtp-Source: AGHT+IGWUC26ECFB/XST5h32zsfNM+cTFebDB426koYcgqVJ4sR4f37BBk7oSc1604wiVBTnh/A1ng==
X-Received: by 2002:a17:90b:1d81:b0:2ea:7d8f:6f17 with SMTP id 98e67ed59e1d1-2ee08eb5cecmr2142866a91.10.1732672306240;
        Tue, 26 Nov 2024 17:51:46 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee0fa6134fsm248728a91.18.2024.11.26.17.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 17:51:45 -0800 (PST)
Date: Tue, 26 Nov 2024 17:51:42 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] Driver for Apple Z2 touchscreens.
Message-ID: <Z0Z7Lrv3rBfzac_e@google.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_175147_383953_9992BA55 
X-CRM114-Status: GOOD (  16.93  )
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

Hi Sasha,

On Tue, Nov 26, 2024 at 09:47:58PM +0100, Sasha Finkelstein via B4 Relay wrote:
> Hi.
> 
> This series adds support for Apple touchscreens using the Z2 protocol.
> Those are used as the primary touchscreen on mobile Apple devices, and for the
> touchbar on laptops using the M-series chips. (T1/T2 laptops have a coprocessor
> in charge of speaking Z2 to the touchbar).
> 
> Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com/
> The changes since then mostly address the review feedback, but also
> add another machine that has this specific controller.
> 
> The extra gpio needed to be toggled turned out to be a quirk of the
> j293, normal CS is unusable on it, and a gpio has to be used instead.
> (j493 does not have this quirk)

I believe this needs to be done at the SPI controller level. See
"cs-gpiods" property in
Documentation/devicetree/bindings/spi/spi-controller.yaml that, as far
as I understand, allows overriding controller's native CS handling with
a GPIO when needed.

Cc-ing Mark Brown.

Thanks.

-- 
Dmitry

