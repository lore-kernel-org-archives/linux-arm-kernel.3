Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703E8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LaXXZf7VNdBf/2Zq+DhTKSGQQp1DT6ynEcUt9SkvZ48=; b=4exFQxfbaJLyk2bWbZCVOLFxen
	2kRijoKFY79Ysoc8dTRh9RXHu3KrxdVfJCjrw6PBgfmSPz9TuN0uavSEbR1NzBRqkdDGRgKkiu6iJ
	uWH9rghUvrV9ClyOrEWi9Hxk5Wjp1fCHLobSS8hRze2vg2qYUTj4GzrnRsCbDHAdlmMGTy62yXcDZ
	PR1vox4+zEIOZQZfUXgFNIMk4WVejNmSBpNeHnJ85drapBiDv3WY7SRO2EIl3r8wN9Nyf5rP3NlBO
	rv4iV0zQ9tddCn1BC0JHbwTb/TAdlfLACzbVVrIRMFMwRqViL3bnmwL+sj3iXKMgKnN9v5SvhlCSD
	NF8C0cDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3D-0000000EZxH-02to;
	Thu, 24 Apr 2025 16:03:47 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vAU-0000000Dvr9-27r7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 11:55:03 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-309d2e8c20cso1178141a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 04:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745495701; x=1746100501; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaXXZf7VNdBf/2Zq+DhTKSGQQp1DT6ynEcUt9SkvZ48=;
        b=cNSrMyhu4N3l51gyab7OA9eedBoklQmFpa88KqG0WPgv6NsxfWjKJF8mepS/GlEzbW
         p5MBaD3r1mMF87JrAl4rvvq4TvlkNhOnfv2MLu3DsLzI7TxRJJn8Cjs34nYxIa82xkWJ
         zwmuMePRWoQYqEmZJPIBw/MFVh92hPop0B11gFSPtAHhn8fSwjg51yoSBTmrgpqBDCdw
         HQ333BTBVjiX7ucbEDVf12YAfvfmZei0hMsdeNxls0r6qRG8m45+ZxUe3vYYwvv5Kyqr
         /7OiQTQ7Nz3jfXzmtQUrPx/9agcOHpb94sCmHKRUeVh2lVNOM302QpZ31dy+0T0kQlgG
         wMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495701; x=1746100501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaXXZf7VNdBf/2Zq+DhTKSGQQp1DT6ynEcUt9SkvZ48=;
        b=g4rSCNDjyCDx8NqTTUGaEh3yFvKY3/pp5RzpibmKEnDYx/5iJJxhmDDILKOXwPNjuo
         q2MtdhuyxjIPzmVB70JHM37W4qdCoyYIDAQm3BGdRE58ySlCkax5itxyGz5oA39Ct09N
         Bv0u2sN7C075Pfqshqw/DkUVKXaJ4vygOQ7vAerm1qmKLkr51vYqsY0Pmvejm2CVfVuV
         nKdU7gNqVP5WYyH9BBQOXaAW8zrrxd4RgrGYEE5U0J9Dm0CqH0DPAka6jtjekeEvtKHt
         MpKmNBxo4tbuec34yW/1fgLmL9qBhawlD21G8TkcdU2TnhRQQI1U1VSbBSez0qws3Yxs
         dMUA==
X-Forwarded-Encrypted: i=1; AJvYcCXl16XIOn8jSI279wj79Hjkk5/MBTXoHR8rfdNWcO19vpNuOLSALBSz4KLWY/nX4h6JIs4JZPCsYqi60yJY8UGo@lists.infradead.org
X-Gm-Message-State: AOJu0YzIo1kO5zYb9tGGl9EoNdo+QykNpMSJd2phkcxQSORf6LZIksF3
	+r4aJIZMkLRWMqOqeqBHAf+yWPhheTCQVsf1Cx3014CI1eTnaqdmHnJG0DXv7vGyawrdica8hDI
	T9ngtGkzszCkR9kgOEOtwPrXwHI0=
X-Gm-Gg: ASbGncuVAqYOsxz2QVImEJmSc+0PtwUKFP2sNU3BXEw5FvVCWxdXmspqrR7Zo55L2B6
	yITQIpqBa3sUPYqV2dX5b5569XiY9xec8djSQBA0090UdHlKDvhvFQhV9lhOjKdNTAJSuw2/vcg
	JM/TNjuGYi9ZNskIPr/g==
X-Google-Smtp-Source: AGHT+IEVr8RYTjT9I12iRuzsSclckx06FCkr+9NaSoiRz8ff4GmsoCxyYCjNxZ7KvxRfcH7PrtxX3ivBVdZoECzD15Q=
X-Received: by 2002:a17:90b:2d47:b0:2fe:a614:5cf7 with SMTP id
 98e67ed59e1d1-309ed24bbf4mr3357527a91.3.1745495701229; Thu, 24 Apr 2025
 04:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org> <20250424084800.105300-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084800.105300-2-krzysztof.kozlowski@linaro.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 24 Apr 2025 14:56:50 +0300
X-Gm-Features: ATxdqUG07gfeFyk0H8HmHqP2CBe9nsNXfIbkETttN_SCGPWAGkzvs9MFfBgSr_g
Message-ID: <CAEnQRZBQaYhPU+hzCLxKGQ+UmVpp6MEXDCU4QWVh+Od2mQ+z0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: nxp: Align wifi node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@dh-electronics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_045502_545236_C1105573 
X-CRM114-Status: UNSURE (   7.30  )
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

On Thu, Apr 24, 2025 at 11:54=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
>
>   imx7d-remarkable2.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '=
^wifi(@.*)?$'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

