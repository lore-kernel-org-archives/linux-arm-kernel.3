Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C790CE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiwHnId7iQeGUr8OsM8sKryugiv1jIm1WvtUfh1wJ+Y=; b=gvYWSiYcTuZEnEKrXvAVxhLHJW
	cDueYgrhyq+qLq8LOB9xB0IfLsNIT6FKtHhfJY08+P5Zy9JaQQQbtzzXKM5paZFo7GKQLX6Hbsj23
	cSPef/D/Dh7vVlfxS/IzIWd4ToFKQxqUVBk4O71DJpkvYwOjJH1Ioi3DsvDE5iebnaIrv19X26R1D
	bRvLwJOBDmAPIfKf1OUih6uBA4qEuJQ5b+GXnpTYG/LV5wpmDiA16q5FPayvvYRoIdy24ze3C3xCN
	n/3w+55FCBIFfviaHak+tCYgDugJCNSaGxZZtWZt2RlhZ79EDpaMlafvcDl9oWGrne2pBD70T6cu6
	W50gv6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbzj-0000000ETFS-0hyj;
	Tue, 17 Dec 2024 18:08:31 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbsf-0000000ERl8-1Seq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 18:01:14 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-29f7b5fbc9aso1346641fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 10:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734458471; x=1735063271; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiwHnId7iQeGUr8OsM8sKryugiv1jIm1WvtUfh1wJ+Y=;
        b=YpbYdyfPDLHkIYLCd4XHgL9I+rz9kkJc1VE4Xf8TXUNuIVp8tXGNlKnViU4OSs/Gwf
         gIZTstzsDdKP1ifmKgJJ9+WrywUCAAg8jQcpoPz+rCULhLHe3h81AJvPuJ6u6QkrJWZ1
         4020rYIBvWlLa4aSADDa7MB4GFctlEfrvi1yxc8RQXwVxqNcshn3nhZIM3ebGzVC43zc
         1tjFlOC/2uZIMbN1zI+f0E2QhNeXcCEezz3BPaWJlCIuSOgSa05dr6f5cC/GQIK2W5Dl
         B0SQ2f7F3TpFDDOE4E6quDfUUEwWjVy/Zn0AJac1EapZFrIpj2ot8pno9DZewTt/VTMp
         A3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734458471; x=1735063271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiwHnId7iQeGUr8OsM8sKryugiv1jIm1WvtUfh1wJ+Y=;
        b=FfOyh2c4vNOtCgpGLgi/dPCG2QhXAvdciXkFvmW4a1whXClWGdeH/OzivWhVPidM1g
         AIxp8W9lR6shDr+928Y8SQB9gZnGhR4S8D+4a0MY/Fp0jL5s2OSYVGHY1phyaWgv2RrH
         4Rc+6eVzZ/gBCRPsbtv+zy6mhv0P8JiUl1ur+IBnY/EbRINb301b0E6sZV9CUhQZ5zoj
         /XQmL766uFTH+GlWSAJPEUeFCZgU6BjuIiH3RdygSqCQ7UYp3hBmBoirTpuDbMgfy0Ph
         46jM4mnrQ6tmBGFaW4jOxa2vOM4eFIDMvu5CE8hfrccb50REiliDYm5m9oA6QBUkeX79
         DjeA==
X-Forwarded-Encrypted: i=1; AJvYcCX5RvpUlIAfyZ6lkMGpsIFcU2sU2IWB33RWIrAb6L9k6xP4MJTupSe9U8IxzxPJ8qu3XrG4BOwXKe/2sjOJ46YB@lists.infradead.org
X-Gm-Message-State: AOJu0YzATzUpgukmRsNmyQpUCZqa7Tqhtx+IQCTeKwSxfzFwOx0D9lBy
	Zujp3YS6//cgiwVcXQ5rC1HPLr+k9pQyzzBIZm/GcnNiHaYWHl1vQL71nztUCj2gg22elib3aho
	dk3YLIgeBi0bj02FiBiyRF55pr2E=
X-Gm-Gg: ASbGncujGFNO6AvZR+sE7b66hA4N2z7e9weOnr3lwiR/xeDfgoDZkQnYFJ6Ok62t7u5
	TP0LjlLa/PPaeevRi/YOx9KatJ4lTBqZo+c15pZ7aUPODFpwkm8HbJ0hPKgaZ6BCaNzji3dGs
X-Google-Smtp-Source: AGHT+IHd+3ZVfpm2NDJm9bWCoeeRHqvP9fk+8IUJThjwea2MK0kqPI6ZhSam/HTj+u/wwVy83PXt4Sd7guaeIDXPgdg=
X-Received: by 2002:a05:6871:823:b0:29e:2422:49e2 with SMTP id
 586e51a60fabf-2a3ac8e1087mr10260963fac.31.1734458471419; Tue, 17 Dec 2024
 10:01:11 -0800 (PST)
MIME-Version: 1.0
References: <20241215053639.738890-1-anarsoul@gmail.com> <20241215053639.738890-2-anarsoul@gmail.com>
 <qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
In-Reply-To: <qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 17 Dec 2024 10:00:45 -0800
Message-ID: <CA+E=qVeQ8uHBCeFtw6_2cY3252-YXc6eWrf5_YdeVgbp5LJo5g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_100113_385032_A803D704 
X-CRM114-Status: GOOD (  16.67  )
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

On Mon, Dec 16, 2024 at 11:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sat, Dec 14, 2024 at 09:34:57PM -0800, Vasily Khoruzhick wrote:
> > These will be used to explicitly select TCON0 clock parent in dts
> >
> > Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON=
0 mux")
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
> >  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 +

Hi Krzysztof,

> You cannot combine these changes.

The patch basically moves defines out from ccu-sun50i-a64.h to
sun50i-a64-ccu.h. How do I split the change without introducing
compilation failure?

> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.

Yeah, it is not clear what do you want me to do, assuming the previous
similar change to sun50i-a64-ccu.h did essentially the same, see
71b597ef5d46a326fb0d5cbfc1c6ff1d73cdc7f9

Regards,
Vasily

> Best regards,
> Krzysztof
>

