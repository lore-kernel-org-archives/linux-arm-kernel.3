Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDE6C7113E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 20:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpvQih8tMJUPnoS+0lHOgNjam/wL5Ni1Nop7KyDY858=; b=M7z7Z2kyly7wnl565c4BPcH6dn
	FV/9YXS6kNzJNahy+sUwhRmwyBbadNTcsRkMJdf3+nD7MIrAfkAMJQRg7lq84aSk4Iry+gH5cR6++
	ViJcCXyeDWXehRv5wMQCoMXxRUrQBdvd83j6e9cdM+rGLtTQAIY7goRfh8MKFWMIIXF2VTapMWn9I
	x0Kt8Q0wqwbwsG3fo7OgW9pXPxYMtCsTtUYQDeH7OrHvttsI3LebzWym9cX3PeXsCt8iSJlhCv+9J
	9hsETWcUJnMiUwQ+NEEGCVZXEpUlIU00nwulay+Y3GSANg+4oxA7Z3F4Vc1GYlDmdklPRbMcsCegr
	EmTsFd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPS67-0000000BAZz-0S4B;
	Wed, 11 Jun 2025 20:30:59 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPYy-0000000Akb9-45fw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 17:48:38 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e73e9e18556so115756276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749664115; x=1750268915; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PpvQih8tMJUPnoS+0lHOgNjam/wL5Ni1Nop7KyDY858=;
        b=NshQOWwnyY6wTQLOqq85K2k99rVm9KPAYpdPSsm9CvEbxmcej6dsH77i8tXjSYeSyk
         AAGhVVAALoGTzo1cSzhnVcR1Bq8RImrzyylir2Dlr+/+ORWE1IygMqP5OViLD7T1SOfy
         VTyomln7ufzN+FnkbaSISb0/ijv5Bqg8lj2qy5jV6NsDGv//wnz+k1DHGRBvbSxbg6+O
         9OBK2kEZ9Z4QSZrLsmoshzapTPgINR3aHl1ETy+1+Geluxi3S91NhWN6X9vXZ6Qfw6zr
         c7n4LY8cRfV3unpgpBLxWEI14wNBV8GyRHBvOs6pbbOPELIGLY1NDqr8OLqvoeOZFPuo
         DEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749664115; x=1750268915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpvQih8tMJUPnoS+0lHOgNjam/wL5Ni1Nop7KyDY858=;
        b=UekzvdtYZD2qTcpgjmnvH637WpUNuzSW/mvLPGzUjvVdebGg56xPu0e+ZSUITxlmHz
         nYAzML07QdgtbfyfTjvd/3QjDHW/xhv75346dIuNfPsBfp+XcyRGpOxgh3/nCJ0sV95z
         HIIVQVTZZgcEBCE9l79QYNsm6dFX+NSH9LxwP+K9DFKlHSLlJOwE+1dLyaRX4rxuKsy0
         UR36kh8coABYgC94YME/26ikqBbdudcYoSN0n9C0Qz679SgrBn2xlZB9ET661ehCLZr0
         BblPiuPjfpG5PfxWTuuQS/PHeqebBxMmrO5AdJ6941OxrsRs/tXkwcXsegjNPSX/Uqns
         IvFw==
X-Forwarded-Encrypted: i=1; AJvYcCXzTx4VvH3O5xWgSoIVbobejWSdQqLrvIm9QLvvUnmAyr8x4QN3vkcojGyQeq0yCeedDt33shSwadWwrngHXJGo@lists.infradead.org
X-Gm-Message-State: AOJu0YzP8+5q8S+9uCUrzaczfw2gQLTqGhVQerp/PFKnwFhjefoaQhPj
	hj3FlRBn6Moikzhwa4X681SukhUYhIPY0nqtFzAWG+gx2WvBzNPKhlFy0hH64yoviJbrrINWs7S
	wacO2BHDgDhcKJ2KXLC2pjbrXyw8oiaI=
X-Gm-Gg: ASbGncusoLZt387CX0fiNPXMVZekE7z8giV6jgLZxfcJpULzjT3rNRhWNJdD600njXt
	RUrgPhelND9GC6dhN4lCQjs0Q6FS9+hB/jcdjE+RJ3p+S+edQqxvLQK6Q480kXjKLaLNNpLgtvj
	mL4VyaikfyQUUr43V3Wi7MNJlBbA5erw3qOrN/qOdebK2Z
X-Google-Smtp-Source: AGHT+IH9DABL4wlDn/GdD9XoHB+8QanMkWBj0pjVvFYJ/W1MuhG7BWxLo4YCnNzNiDDh2Shj91H32KBlXFkEPsp6D3I=
X-Received: by 2002:a05:6902:2501:b0:e81:7e20:d737 with SMTP id
 3f1490d57ef6-e820baf7827mr480844276.18.1749664115677; Wed, 11 Jun 2025
 10:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com> <aEm_7NECSykMX5cs@blossom>
In-Reply-To: <aEm_7NECSykMX5cs@blossom>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 11 Jun 2025 19:48:24 +0200
X-Gm-Features: AX0GCFsfxtx0nWUUwofAcCujP5Iz-6oqoAbr15qgAOq6KTl9zDhKhhwtvESKTto
Message-ID: <CAMT+MTQ=oxfdq+tqjxLXqDUPEAHzLtJe1qy1vDBf_SA6wQ+tkA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Bindings and DTS for Apple SoC GPUs
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_104837_012445_68683FE0 
X-CRM114-Status: UNSURE (   9.96  )
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

On Wed, 11 Jun 2025 at 19:42, Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
>
> It would be good to include links to the kernel + m1n1 branches that
> support this binding, since it's not what downstream ships.

Right, will add to cover message on v2.
Kernel: https://github.com/WhatAmISupposedToPutHere/linux/tree/starlight
m1n1 (the bootloader):
https://github.com/WhatAmISupposedToPutHere/m1n1/tree/bootloader-cal-blobs

