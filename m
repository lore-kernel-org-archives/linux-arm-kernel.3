Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12338C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBmsuUJbeLL0NXrNXi6pfMqYL0XBVnx5Sg0vt6dYzDQ=; b=BMeGApdqrMwTVGXXoTKAFbJCtp
	/4wTdzISliN57b5qyj4Stm4zsmGYKC+AEVyzKuvWdvxKjj7wmQi0TDTdo4cxJk7z6YyTIVnexQrtW
	J3qgGpJOGShblla+PeLP/zISKEogzwuh8CUvyxW4qR3XoxK+oGEXN9K9XT5jspI/VyLBmL6gL47K2
	iiYJJH0YXAAYinu2TMSilxlgijbIHYfC+HZYaK9hWwIIvPaJ7oe1leVhe0chk/lE/LXrmXxOxV+cR
	R4B3dYuBf0VkgwrXuoaW0W3/5UwTFTN6xQQu64rboazJ3oM0c/TGj/OKbhSoOlI7ogmyUw9pymqSY
	WlK/Epfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhliA-00000005JUj-38Rs;
	Fri, 01 Aug 2025 09:05:58 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlfa-00000005JDc-2g46
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 09:03:19 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b79ad7b8a5so1178313f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754038996; x=1754643796; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PBmsuUJbeLL0NXrNXi6pfMqYL0XBVnx5Sg0vt6dYzDQ=;
        b=o8Be4U/oel2E8RRcQRtykvED00rpi7lyIO+FsmPSmRZCBTCVmCc+WxxdRBGNx3VIVW
         1mgICu19C+hNqass7Gz+B8BMZPkaeUvlanjLImdJxiDYxx5qcqlfItFFk8KH8ghRp4WI
         93tB3fhQuvHKfXt98eYh5LuqdVvzF1qm8RcVhAuJU3d685DdgsfugNcyzbphmcfRxVcW
         O1RRCnIFTKBENsuDgGgntqIaQo2R7qwtn2ZjpwihKfJ1LQTtMhRVn7sWykZrDLcCezup
         I67kXgMIZ8VzmkZIiinbJyq4V/MffuHtXBSDYmIa80IYtk2zBoeQGf0G7Tipn/r8okmo
         CtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754038996; x=1754643796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBmsuUJbeLL0NXrNXi6pfMqYL0XBVnx5Sg0vt6dYzDQ=;
        b=Re2bT++rBbfPh7yjr2Lfi6HEUboVcerUEy9swmLPW/53N+amAXfiwL1RD2hFSro6wD
         7DbJjIGxNrsIhgoGIpS1LZo2jzuD2ShhWQxHyDtOQ6f17OA/azH1MUvMtpEdyv/KI6WU
         j8dXAZTAnMM9VFQL8ab3jOH1EQbJynP/RyP3qfjyu9ASdh/K+6xvGvBpgkxfbvglGasM
         tWyc2ZgecUGyaiszTWTW+j26BIT0BtkamEsfI7T6Cf4t8XVhv4AL3X2xjeef5R6FTyr+
         hGdHgPLV3OA3BH9xOWSKQZJDbR+LtXuvIh70tiwvqF8xVO/PZoOfUtg9y5q3xu8qkbRq
         ZDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMNdQFuF1XMUEi7UN828czFzr/EhnCLOPOP1XKvESM9ruc8jK37SqHl8a4qcWLAulyoUMgCpCNurpt5ewimpH0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu2nTsg090nCltKReUDOMrEoAII4/3mR99dGA0si88tU1wDXK+
	Zx1S1naIiYWZ90Gd72qQT6PdcsMEtKochHUYZu0ZSKsoPPiRVy6NHnLIhhYF88G/0PvFm1vfVBw
	YwBQGJ51+PMXVBN+qjg==
X-Google-Smtp-Source: AGHT+IHE6ul98uLxU8+rgJ4DluypxUwUeH4rzGBJSdDhyXEUwohSo0THQ+GTzCr9BnM77dXh9jBEpBbHuNaVFFU=
X-Received: from wrbeh10.prod.google.com ([2002:a05:6000:410a:b0:3b7:96ff:de4a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:24c6:b0:3b7:6828:5f78 with SMTP id ffacd0b85a97d-3b8d343afadmr1672233f8f.4.1754038996632;
 Fri, 01 Aug 2025 02:03:16 -0700 (PDT)
Date: Fri, 1 Aug 2025 09:03:15 +0000
In-Reply-To: <20250627123854.921704-1-jfalempe@redhat.com>
Mime-Version: 1.0
References: <20250627123854.921704-1-jfalempe@redhat.com>
Message-ID: <aIyC0_Wxm-s6Yo1E@google.com>
Subject: Re: [PATCH v2] drm/panic: Add a u64 divide by 10 for arm32
From: Alice Ryhl <aliceryhl@google.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_020318_676092_B18E01BB 
X-CRM114-Status: GOOD (  11.37  )
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

On Fri, Jun 27, 2025 at 02:38:19PM +0200, Jocelyn Falempe wrote:
> On 32bits ARM, u64 divided by a constant is not optimized to a
> multiply by inverse by the compiler [1].
> So do the multiply by inverse explicitly for this architecture.
> 
> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

