Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B150E103E2E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 21:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCIcYatwwvdMko6DXYA2nYNdNaZYTHkKxWp11My65SQ=; b=OktRkmp0p5dEQ9aO3wwqggP1lV
	zaFeMA/xEad+efWW+hcjJh+b4TCy07zYnDtttOL/WtZQ8xer1q7c1JlXPIQJlX7DlgS06GuVvOOMd
	3B2W9plk+XbRyBSXS4ge9Th5JkggF0sSVxL7Lj5Qwx8/1HvX7mCiEVgfYoqpUYLS+gdaBUOiUTGcj
	W7cayNYgJnNIkyoGgoc4FmnXVDzuMIVPvlub7qlid8XvDb26lLjcwWs8YCb8EOucMbqLhehntglh5
	3aJY7SNJjcZGgP3EgKZSaZTuVC5XKMud/QgS23Fzt2lQCT4Rx4VSi7vvhHkmGrNqOB1c+ub2TL+JR
	Tu9F+y3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RR2-0000000CZMJ-349G;
	Wed, 11 Mar 2026 21:49:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RR1-0000000CZLp-17xa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 21:49:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4480F60141
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E171CC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773265781;
	bh=OLD9utuIZfl6KHTmJ4+yFvh9pZE/I88gRyn+8KAQ/TY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mLhK848CEH1wsXE8pCiqsu+3uW271C0Jlcnt43am103q0yXt1jPqxter2Qzk4NT1A
	 zr2ceq88NA2b+2a7kE41dNLQqDTDxZDD6tEwtBECtPITkl1kvCNBJFBgCqyBLkyiro
	 t9t7mKh5vuvVStNBOjYE9rMs4O3HnRE3XYo3Fau2LevYzCL2S1mkxe3dTqoMzuZRuG
	 zHz4sEQnEcRZ+Par1qnsJ8XzTEuJNGAxEf02zkrNg0WQrgEbCfknKQfYwFL2R4j0Li
	 Ve4jDnbSISBfx8I6fkjGYLl2BtKHTy03gsnRxcgUhSodZI6pcVGIZSNSeiz7hayN1S
	 +ukple3GdP9nQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79801df3e42so6434707b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 14:49:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9MkAIl93xsLP2yGrxfpp4aYCBBfaTz72MY/Bda4FWBQYgj3MhqV+/WEwFbLtg22fA1HY5TVKYqlToZdbzz2a0@lists.infradead.org
X-Gm-Message-State: AOJu0Yztcd2E14kPztrZxrImjr4wwkM4GChLJmNb/AC/Lo1v5bB7N5gS
	Nb+Bra4MNcJmET8SX2odyFinj/IcVBNkNtMvdIvsrP4GzL8PbrwC4uTaXz6PUix8pmvTcE/r8F/
	sfVpzjozzwGfQbTTDf8mmcFYOumdwIZs=
X-Received: by 2002:a05:690c:ec4:b0:796:335a:895 with SMTP id
 00721157ae682-79940fc005dmr13930717b3.6.1773265781277; Wed, 11 Mar 2026
 14:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <b24c7b023c84ec14cfa7e49352e834262e3fefb5.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <b24c7b023c84ec14cfa7e49352e834262e3fefb5.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:49:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLkajNc=t6JmJkMK=YCMeumEQc8RO9OViKHGYPA9wVGt8w@mail.gmail.com>
X-Gm-Features: AaiRm50k-R75GYtAcf7sWc65ZG8Nbggj8JAild9FrvXMa8aJm0e1W2tTM8TiKCE
Message-ID: <CAD++jLkajNc=t6JmJkMK=YCMeumEQc8RO9OViKHGYPA9wVGt8w@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

On Wed, Mar 11, 2026 at 8:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The PIN_CONFIG_PERSIST_STATE setting ensures that the pin state persists
> across a sleep or controller reset.  The SCMI spec does not have an
> equivalent command to this so just ignore it.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

The SCMI implementation by definition lives in some always-on
universe I think? It never sleeps or resets. Nevertheless:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

