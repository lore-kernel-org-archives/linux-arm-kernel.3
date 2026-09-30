Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575D9CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3BNd3t5QI0iZuIsQagNY7Y2xxs7h9n+zoA/0fsn5lI=; b=UXHhyLnHxxv0Q5jPvvwR+BaNT0
	3YA6r+7HDCQgCAp4h9CYZEpJXZqbG1KT5d3Fhyk5kmMpRwv383OV+Mfrv7hwlbCbnqj6BUl02gu7R
	pkmwCbgwq/C9SDVUfJdSZTlz3IdmOzEudzpNX3C3OAyLkNXptEDqZ3MPpOh6P8fQ18VKFnSP7t/6n
	PWi2TbqpEFiucOxhRpeolvMxehZ20skqMtdK8hDVPfDNAt5y4YrgDr/3wJmUW7ML20XaFyGbsc0BF
	6EDJVRKhUUcn/CICXjZJpiBqJlgcGS4m1PsW4kHgGLY11HHzvwK7c+iIe5V2W6XaL4IB7EPLreSnj
	Sr4SFqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrpO-00000005myk-2EsS;
	Wed, 30 Sep 2026 10:46:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrpM-00000005myX-2CH7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:46:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1FF143D24
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B7E1F0089A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790765179;
	bh=z3BNd3t5QI0iZuIsQagNY7Y2xxs7h9n+zoA/0fsn5lI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IBgP2REIcEx+w+IJM3M7B78p8wLDKNpqHBl3GWaVQWbmSSQgxcx8xWJscOl1vl3Qb
	 KFPzKiBSFaQ9I3s/Yy/jDXHsFVk77iaj7MpA0KK1CiNm5nFZggYhs4KsfWPvw3sp2I
	 uRPFhvrkSziUf3ydJujWOlTDggp/D769/ZQ0EWefwgEUk1oDn41HcsgJI53rhhQT0N
	 W5xk4jYpBjtTtIr3LvhXyi3NVxwXWvCMkjt+gaXcfLW+7ggkwZEaAoNmNxaatb126n
	 nc9OLCdYSYHRYSQ2ufeXychtAuNisu5sWRgWZopwixyjEzkszw+vy+ig6HzOot8lmH
	 JpR8Ujoo92GHA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba34653aefso1363179e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 03:46:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy923llSbXP9mQ4OzGFwytK9WE8o5/a/LFsCqrsjYWrdNofkmQjzt47rFtpd+illwVnQ13PZoTAi65hR63vGZ1y@lists.infradead.org
X-Gm-Message-State: AFq9FYLldPZ19BL79YvxzUWLD+aPDeZxE6xzTt39d2ccEmarMQZZ4GHR
	RlQqaUnqXNWUrbhja7AX2SzgK9x5Ug839BVWtxwIo8gN5WTd/L1YpgZcu0K8UsmeNLZrsjxFdCc
	Qoq+3yEo/LO3jhTLiShbe6mWzyBeKus4=
X-Received: by 2002:ac2:5962:0:b0:5b6:1a7c:fd8a with SMTP id
 2adb3069b0e04-5ba40609bbfmr334357e87.48.1790765178551; Wed, 30 Sep 2026
 03:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-hibernate-tlb-flush-v1-1-a0143c144c19@amlogic.com>
In-Reply-To: <20260930-hibernate-tlb-flush-v1-1-a0143c144c19@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 12:46:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkB9KE_XEcHDHj576oUzXUyAN3KX2DxjENDwzSNpu1ohQ@mail.gmail.com>
X-Gm-Features: AclHuK-mQu3SqsQZujhGStlMhedJD3jinzee-CBwOj6U-mdqpZr3J1pXDQy3c2o
Message-ID: <CAD++jLkB9KE_XEcHDHj576oUzXUyAN3KX2DxjENDwzSNpu1ohQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: hibernate: flush TLB after switching to idmap
To: Chongchong Ding <chongchong.ding@amlogic.com>
Cc: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Florian Fainelli <f.fainelli@gmail.com>
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

On Wed, Sep 30, 2026 at 8:14=E2=80=AFAM Chongchong Ding
<chongchong.ding@amlogic.com> wrote:

> On 32-bit ARM, hibernate switches to the identity mapping to copy pages.
> The idmap keeps an early RW snapshot of kernel mappings, so
> STRICT_KERNEL_RWX text/rodata can be written during restore.
>
> cpu_switch_mm() does not drop the global TLB entries from swapper.
> copy_page() can therefore still hit the old RO translations and fail to
> restore kernel RO sections.
>
> Flush the local BTB and TLB after installing the idmap, matching
> setup_mm_for_reboot() and the cpu_suspend() resume path.
>
> Signed-off-by: Chongchong Ding <chongchong.ding@amlogic.com>

Ooops yes this does look like a real bug, albeit rarely exercised.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put this into Russell's patch tracker:
https://www.arm.linux.org.uk/developer/patches/

Yours,
Linus Walleij

