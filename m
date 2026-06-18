Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0B2CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 03:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJeVd6wgp5NlfXuahK3rlSnNBONy3R4PRTFly3AX62g=; b=SaCgC53AGZphyHHygMKdemGqb1
	JFKBRYo1S79RL5812ksTr0AP07rkzG2f7/Lop776hQyqgV3MYs+adWKnsxO6nWYj/TaEFd1OXPWfh
	n1mq7AwUbTrMbbR84Hd4oIxU1leWmSt8GDcpkK126DkJvFcnO6bBKC2I1z6M8BGRV2vtH5GdzUhV4
	4Fo3AubXzNpX1NwkSEyeEhN2Pg1Fu1TrBrip3LEf2lDTfEBRnRFrkG1VIpcM1nNHYZ5EXUWusA4Ov
	cOiTI6pJhrSO5DPhPzfh3gBGOrmuoag9QGnwpciljwrZl7CEmJWkB//GDnLyY96D7wOzxXAy7GyX+
	sPc26WaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3FB-00000000Yll-0dC0;
	Thu, 18 Jun 2026 03:16:41 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3F7-00000000Ykw-14jK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 03:16:39 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-37cbcf49deaso176558a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 20:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781752596; cv=none;
        d=google.com; s=arc-20240605;
        b=LfY8UB9a94waT0vJH276Piyl1EZ9vup3yvqvWcmGeMXU7VpxGOWl3X+JsNfP+32pNc
         8/96qumtyDsq1LPn/CsIUYmIcSRkbZIvUW77/sjS37YnJstoMusVveczJbnD3gznzoZS
         hQKJuRJt2ojfr+ZQrZAHbviW1W+4N2eFQay4B/YYYAi78vR1ZCc0pTQFKehw2avzbsh6
         VlSXt+XCSzzR7R8A7Brta2A3qxLlKqTJAbLyd0TTpJMiqvw/HhcVKYhzhtm9A0NVZI8S
         R/jf7tStir23rKV6cv23ZXTaLT/KheLO6pesOwMsLaLy+DVRkU/KDh+f7KrjPyadCQcM
         UhWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WJeVd6wgp5NlfXuahK3rlSnNBONy3R4PRTFly3AX62g=;
        fh=bqvAZScKbetYVilfhPXPRMRs1bTG5RqIL+Wypc99LYg=;
        b=ENlUReUcJhzPI0giIAybzkviqq/39RxYkyKmRqgD5JXwzuMIlT2YIwhtbXqhQvBuT/
         iehrygVbv8Z5dSOHjmy5Nkz9PS4Ob/AzHLbNY+USTIbkr+q7vDtX32T39W2jJ2Vb6x5R
         D5njMyLt1kWS/kxw6gyCI5+YT49a52cEvl6sLdRHdQOviimgwvpCbaz/fKw3Zw6QyXLx
         kykOoTqoSq6f+c4Ug2A6om+mf5OYpGydrDBaNXriN7tBp4l8i/GYcxgviHjKYcAXJMUZ
         iLRzxxP9MkWSQkySbV60MqbOHqeFsUBUTDlFmRRXau+ivDbVHlw0TjI9EDyNu/JTxgqf
         C69A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752596; x=1782357396; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WJeVd6wgp5NlfXuahK3rlSnNBONy3R4PRTFly3AX62g=;
        b=JoNqWAoKxZlOfURDKYuSwgvXjeGcrVWNKOax0U9fBOAFPgjl3Spn3hDeiuIBGlQzgO
         QO8um4ayRD0iBD77MprauAhEyOhRoK6qRu5jpA8hwsmO4xACV/LmMuY2LtyAUYHwmFQU
         mGZYDnVTXNMTZNWhfSBkg24EtfVuBdD09OLze5KWH0yUian1UeIs9JUiNqhh7i4V1X1N
         GI4Xmva4ZpteFvr7jenHMH+FYniwZ3YrYHCoTcoDF+VeJwK8x5neyj4lmQfy/oyCvQ4B
         kXeX1xfcWahoIu0waoZQC+qQmHREUBc3uc6dxG3VZJzx2RXrGxafQwBVPq1ot6RjkcaA
         ZijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752596; x=1782357396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJeVd6wgp5NlfXuahK3rlSnNBONy3R4PRTFly3AX62g=;
        b=ZeUgv2A5n4dsqHU2cBvVVycU4PqSgeVh+xH+BaQUxNRaQ5KbOpuz0T0ECB1U0Yaaai
         +6QvsKWxMLDS7tUOFfShuFnpqjyhN6MQPgtYhu8HvAKYxH4MS7cNEbHwDKdhlUTcbJwU
         +U0nRMDwcW867KRXoUNA28nLJ3RjEl2HOOfslbtOalycTC3IWrlHQ2K7NwZrLTIBSGxy
         hrtqJ6eMrmmLm4q5RoFujJFz8n9cf35p9QdWu1gkc8YVgilZ/RgKjD0+b/popdKd+M5y
         Z0in9+wTuu5u6ZuutG/88hy0mIkXNkvYbfN7EZzHLzr0yzmN6x7eiFmCsDjTCQo4TTqF
         3LXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HV/JqlDDbZHOVJnQCxcrAS24o0wyWTwQLnWl6XFzsyceYNEjQRvA0lWWbRu60Z/s1vVwaYUuy0K9h2h7z0WPS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgc2jjW0B1CT6gFEroolLzJ1lT5wV0vbqzvAbpW37AdH42fMHt
	DIXEuwyBlgf3XYF/1vu0ASUVLZB9z5nekG2IC2kgs2EmcK7hcZuYVdFm/gJX1NhKC5cKi03/P6g
	n1V4xJOagjIn4XqmWAQR1OQY6dYCnzRBymTEx
X-Gm-Gg: AfdE7cn3ohCCWbQB1yWCZdeu5W2VjS6UR4bep9ESU0W+8mN4yAHNrgGf5soZVswbrPr
	aHmKRiy+fNnJq7AgCDngE37AjofaufottLxBks5dSydgIGj9weXcttpAX7WcJxwhvrR3feGdUHK
	77zR+/Fd1/G7HZjhiWcJwAwiS5MWCblInA+F2XWvgaFGYJIAvu1X5P/udKdP9YHogR7MJGhlf1B
	y4gvS13GpSPUgA4BCJ+m9yMgedcjWKc/wykRowk2MI6X25/pzDugU7A6Eocb/0bmBrS0u9Igebu
	169WabEL9d8Ck3elH/FPgsUWivo=
X-Received: by 2002:a17:90a:fc4e:b0:36d:b680:3036 with SMTP id
 98e67ed59e1d1-37ce44ea15bmr1577620a91.4.1781752595950; Wed, 17 Jun 2026
 20:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260604033554.96996-1-phucduc.bui@gmail.com> <178120760640.484538.12942087225448845771.b4-ty@b4>
 <mPIrpl-QRw6_Q9DZcTQ5xA@collabora.com>
In-Reply-To: <mPIrpl-QRw6_Q9DZcTQ5xA@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 18 Jun 2026 10:16:24 +0700
X-Gm-Features: AVVi8Cfk3b_69bjEt4plPGyHkaTjXjkUe-hN2B8CF9dwTyCWWDnjf2lpRFKMcdk
Message-ID: <CAABR9nGEHmy4YSqFSyh+gqXVwNgpaGOjqBeUZyHBmMibHwvMxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_201637_293141_84B867D1 
X-CRM114-Status: GOOD (  23.25  )
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

Hi Nicolas,

Thanks for the feedback.

> FWIW, the SAI patch wasn't sent to the proper maintainer e-mail
> for it which is why I didn't notice this series at all until now,
> and the whole thing is pointless churn that wasn't even tested.
>
> From a cursory glance, whatever LLM was pointed at this and decided
> to make the output my problem also didn't do a good job, the scoped
> indentation of rockchip_sai_runtime_suspend seems pointless because
> it could've been replaced by a pm guard followed by a spinlock guard,
> without an additional level of indentation, and `if (ret == 0) {` is
> not kernel style.
>
> It's not worth the revert but it sucks that I have to now set up a
> new lei search for all the drivers I am supposed to receive mail for
> because vibecoders can't be bothered to run get_maintainers as they
> pad their CV with nonsense like this.
>
> >
> > [1/3] ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
> >       https://git.kernel.org/broonie/sound/c/4bda5af16920
> > [2/3] ASoC: rockchip: i2s-tdm: Use guard() for spin locks
> >       https://git.kernel.org/broonie/sound/c/ec22437fc41a
> > [3/3] ASoC: rockchip: rockchip_sai: Use guard() for spin locks
> >       https://git.kernel.org/broonie/sound/c/f7fe9f707360
> >

Regarding the claim that the Rockchip SAI patch was not sent to the proper
maintainer, I believe there may be a misunderstanding.
Before sending the series, I ran get_maintainer.pl on the patch set and
included all recipients reported by the script, including:

Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

along with the relevant mailing lists.

------------------------------------------
phuc@phuc-desktop:~/work/linux$ ls ../patch/sound/rockchip/clean/
0000-cover-letter.patch
v2-0000-cover-letter.patch
0001-ASoC-rockchip-rockchip_i2s-Use-guard-for-spin-locks.patch
v2-0001-ASoC-rockchip-rockchip_i2s-Use-guard-for-spin-loc.patch
0002-ASoC-rockchip-i2s-tdm-Use-guard-for-spin-locks.patch
v2-0002-ASoC-rockchip-i2s-tdm-Use-guard-for-spin-locks.patch
0003-ASoC-rockchip-rockchip_sai-Use-guard-for-spin-locks.patch
v2-0003-ASoC-rockchip-rockchip_sai-Use-guard-for-spin-loc.patch
phuc@phuc-desktop:~/work/linux$
phuc@phuc-desktop:~/work/linux$
phuc@phuc-desktop:~/work/linux$
phuc@phuc-desktop:~/work/linux$ ./scripts/get_maintainer.pl
../patch/sound/rockchip/clean/000*.patch
./scripts/get_maintainer.pl: file
'../patch/sound/rockchip/clean/0000-cover-letter.patch' doesn't appear
to be a patch.  Add -f to options?
Liam Girdwood <lgirdwood@gmail.com> (maintainer:SOUND - SOC LAYER /
DYNAMIC AUDIO POWER MANAGEM...)
Mark Brown <broonie@kernel.org> (maintainer:SOUND - SOC LAYER /
DYNAMIC AUDIO POWER MANAGEM...)
Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
Heiko Stuebner <heiko@sntech.de> (maintainer:ARM/Rockchip SoC support)
Nicolas Frattaroli <frattaroli.nicolas@gmail.com> (maintainer:ROCKCHIP
I2S TDM DRIVER)
linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC
AUDIO POWER MANAGEM...)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support)
linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
linux-kernel@vger.kernel.org (open list)
SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC) status: Supported
phuc@phuc-desktop:~/work/linux$
phuc@phuc-desktop:~/work/linux$
---------------------------------------------

If there are additional maintainers or mailing lists that should receive these
patches but are not currently reported by get_maintainer.pl, please let me know
so I can include them in future submissions.
I would also appreciate avoiding assumptions that the series was generated
by an LLM. The patches were prepared manually and submitted as part of
my ongoing effort to convert lock/unlock patterns to guard()/scoped_guard()
helpers where appropriate.
The series was build-tested before submission, so I do not believe it
is accurate
to describe it as "wasn't even tested".
Whether a particular conversion is worthwhile is certainly open to
technical discussion,
but I do not think it is reasonable to conclude that a patch was AI-generated
simply based on disagreements about the implementation details.
I understand maintainers have different preferences regarding how aggressively
such conversions should be applied, and I am happy to adjust the approach
based on review feedback.

Best regards,
Phuc

