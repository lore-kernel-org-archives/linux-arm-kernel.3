Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069D1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVH3mXWR+NE3Ci3wEZjPa2qoxNuA5tsUKMUk1a/4Mig=; b=iglhuResTSgWMIsip7G6zUff2V
	bWUaf9FtCmJPUz5ttJnE54abvLNkCOkCtpx4TnjFQ+i8OpU8gkXW2CsQDN2tj+SWyT+BtpMK3SJD5
	tsWXtXXCu7QDABoOZFgJnR6gNWppeYbDRr1ZKEfmb+dmmBrxrmn5Az1u+MzxUZmJzULHlufG5FdkA
	Ppps+Rb1B2RGgWSgkL5B+oKIIi8Q7bc2p/HSqpd9adV8FLaot/RUksvA2pRD9NAfomgpP3Q25WEAM
	d5OfXNnftSbPIDpaAS7WK8zAkvPa6tKFArQ1Xt4I12QzHwx7QHKu0xlYJYfrbYiBL1gyF78U+u7EJ
	PDDzEhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgOO8-00000009Puo-2Ipj;
	Sun, 05 Jul 2026 15:04:08 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgOO5-00000009PuG-38VJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 15:04:06 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6a31c05e092so549739eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783263844; x=1783868644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVH3mXWR+NE3Ci3wEZjPa2qoxNuA5tsUKMUk1a/4Mig=;
        b=NmZaR1K3zRTau1wtQwkPyFxwgewLxBmgGHSNNhPEoBfBlIBOZuVqLX3IYtmWLObkao
         5IqoZTDA9kev/miX0sj2+0Yvw/b+EAj5mCmj3itwIZk6NyoTfJnBeeWBXKgYzS8lbevR
         u8TD2yBdl9nt9YGTishlCyiU4OcVWCOo8yupG6L6WsNyCXDEx6E5o21VY7LWszVGVRsH
         CUfrrgJEKl06tj/qFA1WYT/prhbamEiTf+SPZhmcLt6BSUj6+aGZPs+6b0AC8lJx/iYp
         Epy2P7wChF35/VoT6c1nadZBo/rlvG3sAPqfjPeSbKDBgiPru3+tWrgSWawT8BgxxwBo
         uWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783263844; x=1783868644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVH3mXWR+NE3Ci3wEZjPa2qoxNuA5tsUKMUk1a/4Mig=;
        b=TiVxWYqd+miOa5NqUKz9lF7KmQ8W1hmCNJcGIaFmJpx5yiVrYJQnSkuh5a81sfE0tM
         6AnmVnk4XFItbsisFsdL3zbavQHO9Geeh2E0qiQrWXpXQ9U9JSRr01NRptRtoOqNHWP0
         VWyu5b42RbP84lcD3ZUQNfl4aD8dZPO0Q2vVIwbKsetnZiqPCD1PLgL9ZBmFZBCF9Nv4
         prD09aCjFdvkc8xlZ8P21eUb41xLEBK8A3RqDW7T6IFcPKIQiHbzf28EJ2xkxzohw3uo
         XnJ8ChfB5B4MN9YpDb8Cjc8YQNDRzwEbYd4tsC0UhzKmK51/mdoPHNJueFMjA7wuDK5S
         i5kw==
X-Forwarded-Encrypted: i=1; AFNElJ/C16qdHEHI9mYzJpK/hD81ud5nTVDI4rPR7IwDOWHao4A20uB+uQnm7NT7JlrQfUXeX6uuA0m43R8ZA67DqjuV@lists.infradead.org
X-Gm-Message-State: AOJu0YwsLkQoQBAKaPQn7txd1ceWYCy2qKdb/GVp9TMxPuDUWk3wABws
	lFd+pe22OLy9FHq93ffqvYbr+6UofHmOZm6jkIOQXri42CdNeXbw2Jj1
X-Gm-Gg: AfdE7cmaXlkmHdnl62vg68iLn7Y2voOiSBFQ+1Y5/4ld0JFS+SeAC6EQATF7Xqkl7dC
	iOARvkQxAIHpODYs27PDD8aFXbEKF4C8u3iAP2N0JQ2OR9cSGLJw0P7z1qDNk2zgO9x9+v85dLw
	4OGUOU46I5/Gd4+Q8RKQ7bkYQO4Ss0U+5dRrHc8UdlvWI/vkUOk1dF90iPu8a0RhqBP18NE7rlt
	M7aJb5krxNLeXwyaQsC/FBw2LlFw0yGyhN9smFbeOsD7y70edgVOKFSg/g0WsU+UPQ1o4XDOMOI
	Sp7SSuumluAiTztarVQKiGNayOxS6Xv8dm3BVEVskvKNWhuMxbuCPCrutuMDaF3cW9k0W6plRgZ
	qjmdbe8bR7y7HuyK2MKOxuXcefPlVYlqwpgT/GU4SHWY1/J/dd+qJK0DaGT5lZDm1GpH/umRjP2
	HGiAM9qYCAdHXzT0L9V59gtx1k+/M7MfPCvKotHbRO/g==
X-Received: by 2002:a05:6820:3096:b0:6a1:7cce:a3a6 with SMTP id 006d021491bc7-6a32f5a9c42mr3716595eaf.54.1783263843948;
        Sun, 05 Jul 2026 08:04:03 -0700 (PDT)
Received: from linuxescape (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a310375f67sm7263111eaf.9.2026.07.05.08.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 08:04:03 -0700 (PDT)
Date: Sun, 5 Jul 2026 10:04:00 -0500
From: Maxwell Doose <m32285159@gmail.com>
To: Avermoal <avermoal@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal
 Simek <michal.simek@amd.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: convert Xilinx XADC bindings to
 YAML
Message-ID: <20260705100400.402a91a2@linuxescape>
In-Reply-To: <20260705085308.8819-2-avermoal@gmail.com>
References: <20260705085308.8819-2-avermoal@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_080405_834883_2B39B746 
X-CRM114-Status: GOOD (  19.60  )
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

Hi there,

Firstly, please wait around 24hrs before sending a new version and
additionally mark it with [PATCH vX] (where X is the version of the
patch you're sending, which in this case appears to be 2).

On Sun,  5 Jul 2026 14:53:08 +0600
Avermoal <avermoal@gmail.com> wrote:

> Convert the Xilinx XADC binding documentation from .txt to YAML format.
> This conversion is part of the ongoing effort to migrate all DT bindings
> to a machine-verifiable schema.
> 
> The new xilinx-xadc.yaml file was created from the original .txt and
> includes all necessary properties, descriptions, and examples. The
> conversion also fixes a minor typo in the 'xlnx,channels' property name.
> 
> Signed-off-by: Avermoal <avermoal@gmail.com>

Sign off with your real name (or a known identity) to comply with the
DCO.

> ---
>  .../bindings/iio/adc/xilinx-xadc.txt          | 141 -------------
>  .../bindings/iio/adc/xilinx-xadc.yaml         | 186 ++++++++++++++++++
>  2 files changed, 186 insertions(+), 141 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml
> 
[snip]
> -- 
>
> Changes in v2:
> - Fix conditional requirement for xlnx,external-mux-channel (add
> if/required block)
> - Correct reg type in child nodes (use maxItems: 1 instead of items)
> - Make #address-cells and #size-cells required under xlnx,channels

Also put this at the top under the ---, it's very difficult to scroll
all the way down here to read it.

-- 
best regards,
max

