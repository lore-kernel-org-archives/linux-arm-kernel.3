Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465A5CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 22:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZiQSaURDYO17/6WGoNt/MVWZsEN5ahkC1vFIHK/U1A=; b=yRmGUrozvhOX2F0N2mME+kUP0O
	2EhhZzYVFdAxHcU6iqa0svJuQsSLRtrbHIBW3RyPBW9aEi9tbRL+SUdquBQgQq7LUBhPpmZ6Gl72y
	RBu8zL7gy1mMQzUIDXKcFZDhiDfH6r4QQ5HmCdhGHdBwzCZRm371DtCb0bCLLwFlJlF6Ceos1Yi4w
	AujxOPZDq1o+6GovI6K5HkOfiYkDrfF84D377qi7Ro1XgyM7jy+BPoGJrOj6nPl9pffBxqk/9OqMB
	S7aBwBrz+UD+qPsnZdYUYmhx5Cqi49chntvgP0J/WS9HmzRmD4gfR8J6TVOxiqPIEVK610iKYjkvd
	pdInVvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWVT-00000008Q0h-11PD;
	Wed, 24 Jun 2026 22:55:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWVS-00000008Q0b-05SQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 22:55:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4AA040615
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70781F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782341741;
	bh=rZiQSaURDYO17/6WGoNt/MVWZsEN5ahkC1vFIHK/U1A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TmkaP2JPQfksOxtmYTQbeS/nAngITe1/7m/+4k5iMJPGYM3eCSKbX2EoX8xm8hTHZ
	 vmMIPFr/mYv7e7Kh2B4lkJIMh8OGaCn28DKah5fnaM26hkZ0CfyLmqsq+uzRrrk1ir
	 0Aztjei+ZaT5X5YzpOiHI7aNcdGd2uExUVi2Ml8IXw6wlIW7MLx1St+m6BiMweNN4J
	 9tixfv9DW9lK5Kmpbs4LaXzIGotI13N5HXHjXHSVbThbmh8+1EmMhdmcMJcBTbyMPn
	 1f5g9f4/NObzpE/YAJ0Z2dsoVxTMwGVR25DeFZUHwsm3sfI4DVpfe/Li/DKWkN1nPa
	 b8JT9Hgtp1nLw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ad58f31846so1786655e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 15:55:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp2lU0W7JYarUxb88JfT/SZAyPgaFOp+twFQW7BH31a7N8Ff06EZWgEeHLzTevo3yg8DjPX2sy+0/K5hill/vCV@lists.infradead.org
X-Gm-Message-State: AOJu0YxpqCC1AiniYfqLA85rndyhr90SZCWnnRYQFJRH/7hVBbOmfCAi
	Qd8ILPHDanO2zChXwAv4OzDbfVrVyOc2Qen+tq6ipAbif5LbJClsdoBqITqbFuWObUIcMfZ7Sm8
	i0fgcBefF8kJqIH+KvCq9hWBZcRRyqEc=
X-Received: by 2002:a05:6512:8041:b0:5ad:5a14:4c1b with SMTP id
 2adb3069b0e04-5aea1f645b0mr6767e87.36.1782341740475; Wed, 24 Jun 2026
 15:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-i2c-fault-reporting-v1-0-6db1a8aabf18@mobileye.com> <20260623-i2c-fault-reporting-v1-6-6db1a8aabf18@mobileye.com>
In-Reply-To: <20260623-i2c-fault-reporting-v1-6-6db1a8aabf18@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 25 Jun 2026 00:55:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLm+dHRNqS3HNL3+p7NGB2_bxncFPMEQVAOG-ZRZqQH7hQ@mail.gmail.com>
X-Gm-Features: AVVi8Cerkddbq6mFwZBM5M7tjoj4rE4OxpQJFijXkFL3Z8iwOxVsKKaRtrxxd9E
Message-ID: <CAD++jLm+dHRNqS3HNL3+p7NGB2_bxncFPMEQVAOG-ZRZqQH7hQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] i2c: nomadik: add quirks max_len=2047 and no_zero_len_read
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Tue, Jun 23, 2026 at 6:32=E2=80=AFPM Dmitry Guzman
<Dmitry.Guzman@mobileye.com> wrote:

> In Nomadik I2c controller, register I2C_MCR has 11-bit wide LENGTH
> field. Its maximum value is 2047, so this is the maximum length of a
> single message. It is less than the common maximum I2C message length in
> I2C subsystem (8192), so define a quirk in order to report the
> unsupported message without any attempt to transfer it.
>
> Zero length reading doesn't work properly on this controller, so add
> `I2C_AQ_NO_ZERO_LEN_READ` quirk flag.
>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Excellent improvements, almost a Fixes: patch.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

