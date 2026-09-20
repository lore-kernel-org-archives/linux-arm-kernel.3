Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1764C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 22:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3SexezWYsSk736W38SFqu2ziBc1JJcqhx3pO3GqO7o=; b=M0gIuHOSSyIHPJ2TImyInVmRtO
	38QzozEqZ/QVLWEQPGyjWVDrGdK+3IxPXgi9qfVs3CVUMqdwbIe7W3Brz0aPaFFU2ddRbHgSmpcTu
	WV84O4aIi0T1WeoMcMM4KL7xfkkxqvqFkOnGQKHV492uFYfNX5w+bK4qd+0vroPyYNdMfQ6jig8OZ
	v0ZhST5WYls61s8jLw2/U0yBJr35pYZcVFm3f8cxpjKryhH/OdZ5aXDFTIiOIV9nkoswltkLh8qA7
	4h3/ZkTaOCS2+7/0jvANPvlsCSTIsivpaUdg85+unHS258WIdZeA9ca7pmPdBvgaH59gfqHvyJMYw
	ooErmbvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8PlU-00000000VIs-2ui3;
	Sun, 20 Sep 2026 22:12:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8PlT-00000000VIk-07oM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 22:12:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2071B43D1B
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 22:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C9A1F008A2
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 22:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789942321;
	bh=m3SexezWYsSk736W38SFqu2ziBc1JJcqhx3pO3GqO7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Va0mnB4vLEyC7LJ2ZpPkd0pwrqVfYBJ9sNmipn+W9tqa6FO+hGjy0ZC281X0iHmmi
	 xBAUUrCicU+YmUk3C0ZLj97QAFbpogDQ72J5vuE76Fdsf56mr9BBmLba0wh8PGRLZN
	 tfbFZeFZzAQY7MvZ6IJCC514QoqDtCUqs3khMY9/jqnarpokdxEnHY919U4Bnt6bV+
	 2Y9as+qCvkfiOjLvdun+cZ5JAQZ/TLqzJThMWI+Zzh51oawtNtnmN+G+yJfhLq0Idv
	 NnijKuSWnKcC+3d8gDWY5MODpDsCTBKOlyyDDNxXa3DCrOBzwqr1pEH2ve9yz1kueI
	 agBgHuknu2AqA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c5231570so1931640e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:12:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0xAIaj3kK0n4ENIp2YEC0kDnFi+MR5aqPO1DLEFaQQUJVGKaZWZHmzbq0wGNEYYI4yAnsjuqBMkWeY0PCLuzy@lists.infradead.org
X-Gm-Message-State: AFuF++kEeK7JESqvjx7AwNDLD7nGG4ZyavuuTq0ySJgksejhStTSaUwO
	5pWAki/tVUaFWewwq/x5vU+fcqAHJzqX/US/mjN8EjLgbEu37e4Ip9DXqhKnXJkbTebGbq1WYaQ
	knyj6dIBycdwSi//ZGNGjQ0Nsy37XKJ0=
X-Received: by 2002:a05:6512:15a2:b0:5b6:1a7c:59d1 with SMTP id
 2adb3069b0e04-5b8c183fd80mr2413485e87.43.1789942320496; Sun, 20 Sep 2026
 15:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260912195552.76673-1-kmehltretter@gmail.com>
In-Reply-To: <20260912195552.76673-1-kmehltretter@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:11:47 +0200
X-Gmail-Original-Message-ID: <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com>
X-Gm-Features: AcwNN1UEg-rAjFzamwNmqUNbJToIegygFu5WJqv4Wp0FbND3-H0NPmWS64QMjAA
Message-ID: <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: allocate the cacheinfo early to fix the
 PREEMPT_RT boot warning
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Pierre Gondois <pierre.gondois@arm.com>, 
	Radu Rendec <rrendec@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Sat, Sep 12, 2026 at 9:56=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:

> The series applies unchanged to 7.2.6-rc1 and v6.18.

OK please rebase on v7.3-rc1 because that's what we're working
on now.

After posting that I think you can put this into Russell's
patch tracker.
https://www.arm.linux.org.uk/developer/patches/

Yours,
Linus Walleij

