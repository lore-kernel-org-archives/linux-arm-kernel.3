Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D871CEA852F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 23:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ogl/vl9PjmP/B6O4skM0f2R9nFZg4jKqI105COcxmEM=; b=XE6OsN6Gl+V8B0pJRRdJlKAYhy
	1LDCkFkHygCJ3xwuG94lJLVyUnv+rT9pXRgpXdljMR2ZAlsPneorXM8TCuYRQwvNM4UVIEGsoXruf
	19JbpoLyKsxXRBRZxuCWiHYfhi5iptk5675n6pPvJ2fd0ElqhbSkcJnEOgv9Cri8YbMBvKLJ59haj
	INMFnLf0y9j66lEBq4I/jK1R1r2WV0xpCJXSLcAJ10YGUxjwTOU0O+uEYvGgtFOuVXv3KXW1x32ae
	ihCWldevCZqYZjSFBoaSe036oW5ZZBVYhADFQqlwifUVBHtFZ2D1EaYjWOq+FUhl0Jl7Pt+WiJxCy
	Db5eae9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzNwN-00000006SPY-2DqN;
	Sun, 08 Mar 2026 23:53:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzNwL-00000006SPD-1n8O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 23:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B58BC407F3
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Mar 2026 23:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2F3C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Mar 2026 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773014020;
	bh=Ogl/vl9PjmP/B6O4skM0f2R9nFZg4jKqI105COcxmEM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tol1uGt1FtohAtm0fG3WnKtin7WiLRi8UO2FymUAPWPVxi0BcjKEO6afZ4NcbFTR1
	 2B9CxmA4ViiX8L5/sUtpSHkCi/ShtnJrTm++l3DfZjjKWKov69XnhDA3/xBq//7ufn
	 u2GJGRWza8CMqAeXY5k2s20CP7gmmJvA6IGYk0gnHKCaqMXL4fsuJVVV/NC/XMNCh5
	 Z0SWsExCwiY/d5DomxtBAS0a/lXyV0WPjve8rW1+WW/SBQJN//gkNNRQVbSS+thbK/
	 XMgMDbpaCcK6/9uZjIDpZiuApDgrD94YC1SUUOf/cFpvBixEbXovhNaHwXYSDkJb9t
	 n1cHugG9ahl7A==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-798578e2918so100644697b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 16:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtgp0f0ZG0u6Hf7S+nPKKhuf7juIVB+UoCWUSuBnxNqkmcZ44tBYBVRlwpD1d0QeJKNbRtK37fDPqcIWnDZG6R@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs7yUf50uWWgwoobmZFQewHUj6Vaf+8XKU3jwigXEZ24tKITnR
	tviC1i0pkyTLjM5bTorL90EaPpMq8Y9lsNpQ0lCpY3rs2NWM6wVaqRALrXaxYUpc06E4oaCbDwQ
	d6JcORe4yb6b/0QqiExfo8ND5Grqkf6k=
X-Received: by 2002:a05:690c:f15:b0:797:a2c2:6fc9 with SMTP id
 00721157ae682-798dd796211mr90659537b3.44.1773014019875; Sun, 08 Mar 2026
 16:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260306041444epcas5p49a7e0fa0dc2f2eca16a083c848b0c8fb@epcas5p4.samsung.com>
 <20260306041432.1026421-1-maninder1.s@samsung.com>
In-Reply-To: <20260306041432.1026421-1-maninder1.s@samsung.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Mar 2026 00:53:28 +0100
X-Gmail-Original-Message-ID: <CAD++jL==3ikS+FKbHvn_6ZuEWH7HdPBottNQFm4Cy1A9oE-aKw@mail.gmail.com>
X-Gm-Features: AaiRm520ENgkhwtZoLDuoXk82P1gerB1MyNGLJ7fHIAuTwFsNui0RWkxUDrjrIc
Message-ID: <CAD++jL==3ikS+FKbHvn_6ZuEWH7HdPBottNQFm4Cy1A9oE-aKw@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm: add try_get_task_stack() for __get_wchan
To: Maninder Singh <maninder1.s@samsung.com>
Cc: linux@armlinux.org.uk, mark.rutland@arm.com, luto@kernel.org, 
	geert@linux-m68k.org, schuster.simon@siemens-energy.com, andreas@gaisler.com, 
	brauner@kernel.org, keithpac@amazon.com, ardb@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_165341_506558_C1830A31 
X-CRM114-Status: UNSURE (   9.65  )
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

On Fri, Mar 6, 2026 at 5:14=E2=80=AFAM Maninder Singh <maninder1.s@samsung.=
com> wrote:

> As per help menu of "THREAD_INFO_IN_TASK", try_get_task_stack()
> is needed for get_wchan.
> For ARM it was missed while enabling THREAD_INFO_IN_TASK.
> Adding try_get_task_stack() for ARM as well.
>
> Fixes: 18ed1c01a7dd ("ARM: smp: Enable THREAD_INFO_IN_TASK")
> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

