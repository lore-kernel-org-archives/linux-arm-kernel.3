Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCDBE66887
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 21:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DB7nnWCKsMFWTerzpr6QJaMOAc7yCGcxm3dV8KoxbKY=; b=xmyLZDCgQGRRGLxNJkkC6bwaFR
	X1fl2egLcDSyqoFmcarL6SnkOwkIIzKz8tk062qQbKf2UAeyPe5jZ5ytLMYIbZ6lr4eK9silJ7Nhv
	kM3IO61hClifLcuG6v+JTOJsDp8fjsqz8PhyJRhNfwEM5FeKsapjc+h9M6uLheiC5TIE9GKzCRDT7
	5vrFsPzryfmtu+DC1u57Avhho1BtrYOJAhUKKf3g5hyAJ/Pw63Ddu16emVneN58hw25wYyLUz8rzG
	MtfRcWrTN7V9Wh+GwoEGzeHesE7BtPkqjQvu/zsnJuDVD+qtpj2P73RSE/WQmy7YBr/df5KyNzd4i
	PM3xETQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tExiE-00000004uWJ-3KXH;
	Sat, 23 Nov 2024 21:30:42 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tExhH-00000004uPU-28NT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 21:29:44 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-46686a258f7so1458061cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Nov 2024 13:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732397382; x=1733002182; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DB7nnWCKsMFWTerzpr6QJaMOAc7yCGcxm3dV8KoxbKY=;
        b=R+XlaxX8fG/ZNluyYjQ8cJej/hnyefXzMVA39mEYzq8Wm5Pdcc6q/5fwNyMkE0lK54
         Db9u3QibaO3nCU8oyMPeO35XfvgdLl6TmhGuBdAOp9mkcn+aLC/wJ8OtA2TcpTwH5Zq3
         r3bi+NewukUdICiILkSTE5x0OoOhcj3jj9/UTn7+c/dCWJ1pyc4pAutPJKNJeASIXvPJ
         A7NVyuYerIEb6Ot9ezgcSSBZYAE6UXvS/8YaAhQYfEC56dGd+Blt8CoC9ezH3J4qw5Wi
         SjGBXg0DG3J3naTYVAMAOvzxVmJEK7/JR5yDKfW10Uw5VP72OGUbjujFEFVObFem4Mu9
         9tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732397382; x=1733002182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DB7nnWCKsMFWTerzpr6QJaMOAc7yCGcxm3dV8KoxbKY=;
        b=Cqsg2PrTioKgcoAyevMqfYuM3Q+xUrZEy5zVo0ZZIjCCxUVyBbgJx7CEeQTLCvpLpi
         x/Kt8bLO9jAnwIWcmSWx97cSQTaxDUBxRF5EsoJI8hyMQho2EJ0NzWyMfcfChmrfxeCk
         QUpDiOZXth1IleOxAmwAlxw5XUX3JBJnkuokm1GgvIkeTjuVj3lrFM8Dc9vz1IjLpZKc
         doRvH082XdR9WtRxNeeSCe1LXQSsD1VuqGWde9JG415EEYjT2BxhGg5N8e63ljWdVA+0
         SW1mSeZwnKQqShW3xZUa4KCVkeqnmQ32IHKYGLfsquieKcN6qyFtPU5MdWP4gr2/W/NZ
         WZEw==
X-Forwarded-Encrypted: i=1; AJvYcCUa7FRVgRlSuIQ9u0hQdJfPWTDorJxKmeOgctyzEEAw7IjV4AeGyuguQIa3PVJX7QsKmHt+wQTFNiZNpbYVL40c@lists.infradead.org
X-Gm-Message-State: AOJu0YyYVjjKd26FqhDbD/QgugGN3WGgFdVQdph/Zn4fcw14RL/ESDTg
	GaBkP82QXIZEiuybXgQ9tgsGEH5heA54gC7b7tcoCVI94GzERwxE2tsuasJ2CmACYBKxI3OZf3R
	9FyKEkxldGyv6Zp5T+D4Cpy4+BpQ=
X-Gm-Gg: ASbGncu4dp2QbyUBNaQkVbpoADiXfVQRTgImRVi+3c3sxnLch3jZupYsm29gUpxVu/A
	Ue9yg1nVO6mWAPcG/75MVGl6JB1L59IaS
X-Google-Smtp-Source: AGHT+IEA76ZpKgi2eLgk5L/F49d3SvHcOZynSb8ygkt+A49styussht5Zo10bCs6LSkaAqL9D7Rs3qwYk9xShqT3i/A=
X-Received: by 2002:a05:622a:1817:b0:460:90aa:ba8e with SMTP id
 d75a77b69052e-4653d63ec53mr115824521cf.52.1732397382353; Sat, 23 Nov 2024
 13:29:42 -0800 (PST)
MIME-Version: 1.0
References: <20241122221348.3998-1-jiashengjiangcool@gmail.com> <a664ae24-26a7-42bd-98e2-f46d7e475b9a@kernel.org>
In-Reply-To: <a664ae24-26a7-42bd-98e2-f46d7e475b9a@kernel.org>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Sat, 23 Nov 2024 16:29:31 -0500
Message-ID: <CANeGvZX0rAv-iMU1fUTzBazXfMLN4AKF+YJTbXTRd6vxsKMnjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: camif-core: Add check for clk_enable()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sylvester.nawrocki@gmail.com, mchehab@kernel.org, dron0gus@gmail.com, 
	tomasz.figa@gmail.com, alim.akhtar@samsung.com, kyungmin.park@samsung.com, 
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_132943_579063_0D2D4113 
X-CRM114-Status: GOOD (  10.32  )
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

Hi Krzysztof,

On Sat, Nov 23, 2024 at 11:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 22/11/2024 23:13, Jiasheng Jiang wrote:
> > Add check for the return value of clk_enable() to gurantee the success.
> >
> > Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC s=
eries camera interface")
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> Please version your patches correctly, e.g. use b4 or git format-patch
> -vX, and add changelog in cover letter or under '---' of individual
> patches describing changes from previous version.

Thanks for your correction.
I have corrected the errors in the Changelog and resent the patch.

-Jiasheng

