Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0656CA6CBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Mzkzhmf17O9Xkx0hZ6VF5j9tJzlhe6IqtMNY1iqJLQ=; b=LgkIoNUnb7Ax2n7ZbN86riX82c
	flSZxxIqxtwp93M7f0cP0hazLWm/WKNkCJMI4b06k8J8G9I2HD1cdjrlIn7cYpSf+E5Of/mXosFFz
	t6C/gwx0+YRmGnIgZIXbFD8oz+fV5/me1hxwBqBfEqfZULjpW4JiHK9caPOulFO2unuVb1VsnnAxE
	/4Se05XSCwEwOAYhwzP1PhbRs56pSQFIbWJuoJY99apZkZZ4unRe+seHx1ZXGEXz0yPK0pqciCsz8
	uVYl23ncQLtz0tlkEdHfRIQ9KxikfGQ3vMx6q/Uyy+MyV/DCbP2B5nYb5ay/863YHQSZh9rw5P3ya
	VT8s0yFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfHJ-0000000DvXj-46pB;
	Tue, 27 Jan 2026 09:22:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfHI-0000000DvXd-47tC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AF5160097
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D23C19425
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505748;
	bh=1Mzkzhmf17O9Xkx0hZ6VF5j9tJzlhe6IqtMNY1iqJLQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O6ueMY72cyAl/I2bdA2DIP8HfzWCj68lloHCg/doi4W47Fx+TJnJNp+VZN2E9tbZ8
	 1C8moFGl/Rrqi1jNm8rmMPDHzVzEgBq/RY4m1N1TNfg2sArtn41PdyjKzB2XN5zm5A
	 uTZu67OijsJ/U4qap+5HF0EbxEYLQqlkQcsNJoFhztHO729P3kL9nLOhuEdFzDyErT
	 /hXQ352S7HqZwWvxpbeFDr20L8l9a1yfRKkNWY41SWCCDsSA/q9qVayL3Jkxe8AFR/
	 Tw8DyHCMyA6Ficx4UsuquFgtYsLhXo6zcMj35g3XiAI47xBHEXEGO6fFLE/kf0Ib/T
	 UStg9G3GLJgCA==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6496804204cso2507141d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:22:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWU98+DJT1m6r+cVMWTjTZDQQ/415bbEOpxxOkzqH2r3SZ34ClFepSF8ccAvKC+GkOcYwPb6+jMPTzxrMilhPDs@lists.infradead.org
X-Gm-Message-State: AOJu0YxD2QtL3l64fMBHd0/WfKU3K/ujZi8gmArFRKoPkEYTKd46Ztm4
	NG7C3zE1rKYTIv2tU07KTU+BAlGYJuo3FZeG7jdP47JXHOPlbr52Favj0ZIi8Krs0t9Iza5Nx+8
	H6A3AXWYVCbCcLeroNApzjAp9ykoAxr4=
X-Received: by 2002:a05:690e:241b:b0:645:443d:10a2 with SMTP id
 956f58d0204a3-6498fbebe0emr414264d50.26.1769505747439; Tue, 27 Jan 2026
 01:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com> <20260123-debug_bus-v5-2-90b670844241@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-2-90b670844241@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:22:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLmr-O-Mb_MEK6LWdhY75=uteLsN9MLrtOvFaeCj2B_Jgw@mail.gmail.com>
X-Gm-Features: AZwV_Qj2UaMXe95o5XuL0t4M8bbZMFmvBg1jJ_pK4foc_hf70_XCTYpnwMAEQeE
Message-ID: <CAD++jLmr-O-Mb_MEK6LWdhY75=uteLsN9MLrtOvFaeCj2B_Jgw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] dt-bindings: pinctrl: document
 access-controllers property for stm32 HDP
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	jens.wiklander@linaro.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
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

On Fri, Jan 23, 2026 at 11:40=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> HDP being functional depends on the debug configuration on the platform
> that can be checked using the access-controllers property, document it.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

