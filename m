Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DF2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 06:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ParnwBExfgSuCvGNbbNh3YhRq5Zw4wfCqZvmdKMow3E=; b=x1KewP4/ITIcvY3oNhm1LLydLr
	41QGzF6SnU6a9OsrFFHA1NM432uK7kvtdJA/IcdKir6c+YS8++vKsRXRHgfOiOir6Sm6eaZoEt26+
	Mkm/eAoXJOYpDDTjnlsQizTdUqJKBm+bqHWcUEjUzYtI3obZf800CfBkGhB9CW6yfhLr5cUDvvjxN
	YKkv6EGaiYcl19rIrl6GHueCQ2yAIu/6VvKvRl6Czi8z3XmoInRF/4IOBTDbOAEUaP11mqBS5kcxl
	QNP6/yCRO1vgtpC0byvEApPnBk59BjTLaMRrpqjBfv5TY2nSV0fvsZHXG7VPiHF+SYg/G6p1fpsYw
	to3Dntew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMgq-0000000CD4j-0uE8;
	Sat, 27 Jun 2026 06:38:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMgo-0000000CD4J-07Ad
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 06:38:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49258ac7294so11911025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 23:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782542332; x=1783147132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ParnwBExfgSuCvGNbbNh3YhRq5Zw4wfCqZvmdKMow3E=;
        b=GYDzlcPamse4k1Gj5qo/1+3jgAqDnAx5RaXNOjaiP7dk2+Wmih+ZMw5ebDhKcw2Kqu
         ZOj+GVkgGrNoFvRek6o++sPXnVJ4gJ417SLyPHPFEWDUjhQwD9yWEXg0cBPEOJRAbc3U
         tQDGKcZot3EG+QkQijbjVwwARpwkpyUrljn8+fWYJyakuNvoMCfmil8/AbyLVQpEfklD
         TqJMdq75pThSmlgZIN8fbxH+m1b09kpOGxbwASKnhE7A48c+YUPCo2tyJuMupWkssz4w
         xMJkMKgdOBFMhR0P/EIh7FC8LB7n9wnLWUcVwV0JVfL4zxWIGUZNot4o8Q28mhDpT0VY
         XUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542332; x=1783147132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ParnwBExfgSuCvGNbbNh3YhRq5Zw4wfCqZvmdKMow3E=;
        b=olP+nUzYx6oGWbrDKVogJmXRRXjvUABa84SeVKK3DDV58H4VeQCBzvkB8g7UdMySt1
         fr5hvGgSfIAAqVN4X9T1zGmZ11raRtR+KlUFjuiWiDdC6U8e6F42IycHMilPcdajvgk1
         efJeMw03uGKsfPmnbkujxAjmC7bLjx2IuW+G+gEoUZF9+Q/T8t01kONZq6a/zRDs+ITt
         5VHP8Aop3tP/jC40pCLf0JFO5ZaaX/9q7ueRYeXWn5iknkyWaSM+cdfm5NR8EjL9d4qu
         oAr1yRMSXXq0Sn8XG0OoM5yKSksfeV3youzCHymKwbb/ddVucYHtuOFQxa8vvLPIoT5y
         ajmQ==
X-Forwarded-Encrypted: i=1; AFNElJ836phtwkCp42EY3KbfQvxNppqyYl7RkVc2aKPfdgAsfCUncTH6KeYigsgfv5tZGlra6YJIT3SSBFO3zgU/LuMg@lists.infradead.org
X-Gm-Message-State: AOJu0YyiGBNX/4ODdaPVihsmhqjuRzHKeXmOIU700Y3GrueRzijFDxZv
	JWFSVYPTdzUkeGrPS8S5wJRqPU5eJss8Hff/TP2O8ZqsKm2JpWmUgYAH
X-Gm-Gg: AfdE7cm6VL/sQa0utuGLTfVBQdF/sWwb83OTB9MvMn29ayNEIQQO0lV/ocvhi5VC/wD
	H2zhaUKVyD1w/Bn0IVQWzOPNcZZTClFSD2MDlA4AF2RfKdwTTs1caAQFjRXSntSpOOwGjTQbeWy
	3j/tBnBpfUD/mjDXhxERUN2/s5vFYfmhafyohr1PNG9u8xQIEvmHoym437opWfZpjuQ3dpbzKCV
	dkIFLC+KAO8ohHoeJ6z2Zdt9uNVMdV8yIUZE6PISMU7abovvBvDlYk701MU00J+xXXCDdOQxxb6
	MtLiGbzuZBvHcPl9e00Mf7zrvAx+b8g1LfENo8NtTH0ZhQf/+ZDHrvC+9FPjAaWx5ghhVHlptis
	M1Lk6iTw+FoLgIOW440gEjlT/JXStHWujZeAL7ABIzeBoUELrM1ypWwnfUtwyiENPN+aOlORvFf
	BjOpD7aPqWLJmu/3/bIQufF1nsRIeH3CFCa/ZLrZq8fHBNNWxGoYBR8za6quk1WFM8NQ==
X-Received: by 2002:a05:600d:8499:10b0:490:e196:6574 with SMTP id 5b1f17b1804b1-49266864b4cmr108469495e9.13.1782542331948;
        Fri, 26 Jun 2026 23:38:51 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm67964385e9.4.2026.06.26.23.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:38:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Dawei Feng <dawei.feng@seu.edu.cn>
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org,
 wens@kernel.org, samuel@sholland.org, hverkuil@kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, zilin@seu.edu.cn,
 Dawei Feng <dawei.feng@seu.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: fix memory leak in cedrus_init_ctrls()
Date: Sat, 27 Jun 2026 08:38:49 +0200
Message-ID: <3HodGaD_QKy_OLZfdyJ49A@gmail.com>
In-Reply-To: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
References: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_233854_082498_822E8D14 
X-CRM114-Status: GOOD (  12.57  )
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

Dne sreda, 24. junij 2026 ob 10:59:20 Srednjeevropski poletni =C4=8Das je D=
awei Feng napisal(a):
> In cedrus_init_ctrls(), the V4L2 control handler is initialized before
> allocating memory for ctx->ctrls. If this allocation fails, the function
> returns -ENOMEM without freeing the previously allocated handler
> resources, leading to a memory leak.
>=20
> Fix this by calling v4l2_ctrl_handler_free() on the ctx->ctrls allocation
> failure path.
>=20
> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing
> v6.13-rc1. The tool is still under development and is not yet publicly
> available. Manual inspection confirms that the bug is still
> present in v7.1.1.
>=20
> An x86_64 allyesconfig build showed no new warnings. As we do not have an
> Allwinner SoC or board with a Cedrus VPU available to test with, no
> runtime testing was able to be performed.
>=20
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



