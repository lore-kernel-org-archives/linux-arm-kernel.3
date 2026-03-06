Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E35F0181D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXJtXGAg8MQu4pZ5J5155MH86kt73kFXQ9QMVXqvwB8=; b=H58mWLlPPP1KjKDUsL8AYYVz+p
	xXiOLyXdqB8iZtCAwsgOgTWU90lxhXf4H7UlympF65TUxRYmIUsrggWCpF3tK9DMZ/hKu0iD4aEva
	GgGP140DzNQmhD7FA7riOKr4g/kaD1zLPNhZ+Si5q8AaRs+IsqWvCgUIwc+C5qOFnEvWNVUYHWBM1
	eTvxtJ55OYh/q3flkOWDNmygi+e1Lw7l3i8xmRhcrHzgyKRX+PG2taKISeZMMNgbbtPKkG64qdRTw
	TJUtKBPEfJVaf54olZbDM2c0jW+0mU2QcVevmBRESQPZyyEN0gggU3KCHh6MUL4tugRlwT+x0nWmA
	E8z1iDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS4r-00000003PSb-2M9v;
	Fri, 06 Mar 2026 10:06:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS4q-00000003PSS-2dOB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:06:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDC4460132
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 10:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7435BC19422
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772791595;
	bh=JXJtXGAg8MQu4pZ5J5155MH86kt73kFXQ9QMVXqvwB8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LmLGr3BFzZV6cHl9KV+Er9WtMB1su6CfFtyzAwwTJ3R7AoDdLqwtoTQdWHV/vuI1v
	 p8I7df4t1pv6AIE4pjS3oeIo+dOXliEeL2j7hhQFq81A7r0WyTEJZdi3PZXdnl6krc
	 9MlRN5zDQTvJOJZp7gyW92v1SifHX3hMAMG7wttSOLz7A6kpaGmjaALlGBC92w2X5/
	 W1/dEfm/GEgUSKIOYNLfjrbIJ8sxOPPohi+8tfVeZiK4g+VqqSWCYL3UiOi2+0K5PB
	 qZJWth92lSYa+5h8NuRBaUN2N1kGXUPeCKbS/05nhWMInz+JuwuhiHguc9Q8+cz37D
	 ChpKlpkRSlp3w==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ad8435f46so8667413d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:06:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4wrEVi0ZFE8A/SsLfp5GouCOT/ct3DDQjiONM+pupIGCbFvqI4YTsoGZ5y2T0WRFCptKHzd7nh44VqAWPG4Jo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2qngc3r9JLKm7G7dkVNlxt3lYu96Wez+749vAq+LF3+pIde4x
	UDNrTn/zfz1i4LXp1i4RnMQN5tFvS8Bht8/MtZtc7pPfkfD2YsfWKLoHylUddSRyGwrJd4ddFHg
	7KI0+ibMH6FwkXF0kbnuXqTWPmPhkMVM=
X-Received: by 2002:a05:690e:d4b:b0:64a:fe95:2ba7 with SMTP id
 956f58d0204a3-64d14164dcfmr1294749d50.31.1772791594697; Fri, 06 Mar 2026
 02:06:34 -0800 (PST)
MIME-Version: 1.0
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com> <20260306093238.2715269-2-zichar.zhang@cixtech.com>
In-Reply-To: <20260306093238.2715269-2-zichar.zhang@cixtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Mar 2026 11:06:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLm0h+WinA=tsvGreVkuaE-0F3RudPi07fRebpPkfNagQQ@mail.gmail.com>
X-Gm-Features: AaiRm50PL3_GXocU-Voy_O-rzkbVxmBVcCKnixsge0SkxuJu20BGIlgsEq7p28U
Message-ID: <CAD++jLm0h+WinA=tsvGreVkuaE-0F3RudPi07fRebpPkfNagQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for sky1
To: Zichar Zhang <zichar.zhang@cixtech.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.chen@cixtech.com, fugang.duan@cixtech.com, jank@cadence.com, 
	cix-kernel-upstream@cixtech.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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

On Fri, Mar 6, 2026 at 10:32=E2=80=AFAM Zichar Zhang <zichar.zhang@cixtech.=
com> wrote:

> From: "Zichar.Zhang" <zichar.zhang@cixtech.com>
>
> Add Cadence GPIO controller nodes for Sky1 FCH(S0) and S5 domains in
> sky1.dtsi, and enable those controllers on sky1-orion-o6.
>
> Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

