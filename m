Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72DBEE645A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 21:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4TEUeoaO3Y52Zdb0sC48zPiMP7vx44cLf9beQ8lFUk=; b=d6xLAH+tIz1ou3BJ3YpqZ2pZjZ
	NLvL32W3URAeCy8ubZD51Lw+LJUrlXw3A5Y1sD1uSv12rEbJOiabN3Q6xrlWRyEbnevDYg96OykEb
	utvRImsdzCIarN4/josYQjl2zL4Ch/GVmHhifY4/uNJb6q7miKUkBZhoLmSCVzml2AbhBBCi6a7RQ
	V2PW3Zyr0xxUCMyhAteuHbstEjVeh55/QGTAczINzys/qbSMpDkT8aYm2tf3YumkeT1RAaWTzoXxm
	yGea+IAe0qLSiVRT3G3T8eGHPWwO0NXkbxg1a4EVX+M6hbWxrlZ6LQ7D0RvU3jl5ochbNdmZxxKAr
	KYwwiTNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb3Wi-00000006LD1-1i3G;
	Wed, 31 Dec 2025 21:14:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb3Wg-00000006LCr-0mpf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 21:14:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A07960017
	for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 21:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B73C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 21:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767215676;
	bh=K4TEUeoaO3Y52Zdb0sC48zPiMP7vx44cLf9beQ8lFUk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZCwwiqEswXEGKKvL3rK1c1iUUeTe07ylJCi004T03JiGsfm1sehSD0qKxxoIN5YBL
	 SpWukX28dXmdBqxntofdEUrkIfLbfbAPpwAHY9ma+WCCqBlHsfZmiOHOkKGv+uPLsW
	 pRJP6i4rEgNfgG5DJmwCJP5bunV7/geTsuIJYEmk+Lulb/QRDK7EOCGzpESkxTfuT8
	 Wdt1ls8sFU+8L1T0gvhBQ++FBhxDqTwNGZrNiEn37M6IuZRB3YhySIozl8IJuYCHGt
	 HmzOd9kpqTm4KKwiKV0SJPXQKnD+6SRtvLU0KJKCoRskRBT0iQvB7/VgS2b5nn/aKn
	 PxCbWpbMiWhgQ==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6466d8fd383so8588165d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 13:14:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUI7sVkE6C4TA2u7og4gWYRjoBe5MPnHBiQsH6KrxM1ZiVUcUm549NsjJ/Bbko8QPQdV/Pzf/qMNxVHhG9zhTSH@lists.infradead.org
X-Gm-Message-State: AOJu0YxxyFthoC5Xz3WRbh4lfqDciG/3kgj8ooq2D9relCRFXucCRhg3
	quSGOT6EPY4JXSSAqQJ41sHgiDbl3+MEYbpO8YITlTh+wJN6FloAP8LTyQePWKG5nqU6O95Ol0R
	LUGElCPbrSwZNlwYZ3csAvNHYfCNCibI=
X-Google-Smtp-Source: AGHT+IFJoU7C4Ss7IKWO6XLKJPZbPbx+H9CysI/sBI5pxN+Kri8LOHqU0WdhmLCYk5T2fpBiV3yt6in3C99aq1OMW8Q=
X-Received: by 2002:a05:690e:13cb:b0:63f:abf6:1c9 with SMTP id
 956f58d0204a3-6466a898fa5mr28072326d50.25.1767215676220; Wed, 31 Dec 2025
 13:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com> <20251224112239.83735-6-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224112239.83735-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 22:14:25 +0100
X-Gmail-Original-Message-ID: <CAD++jL=cnukn6K26AcpZuH9qz0SrSEK0UFOZ4Cam9fy3sOavnQ@mail.gmail.com>
X-Gm-Features: AQt7F2oPWkcnbzjWCUFrnvPI8TjcTBVugqqVg9uhszVX238b4PDh7WzA8kho9U4
Message-ID: <CAD++jL=cnukn6K26AcpZuH9qz0SrSEK0UFOZ4Cam9fy3sOavnQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: versatile: impd1: Simplify with scoped for each
 OF child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Dec 24, 2025 at 12:22=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

That's neat.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

