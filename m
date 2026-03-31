Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1BCFF60F4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0yhE4GnVbJG4hKHIdWBFQgvJX3G1vXsn2yBdUvHrzU=; b=bla1oDmOPHYBkVKPi7Sdf08F+Q
	0LUWCtojp44lJpkG2sQa+GGrX9fqAG1I90jI3bF4pwmg6bHsH7Nv/DfVmHK41Yvof10sY09zndnOW
	vHdk41O25Txj3eVq8MYmzvVESKLUdG83eawemdtGLPpx8+KME50+MobwddSws8J5d4eblveoms71u
	y80pi0iUgAx7/lCUr+DH8QK/hiwmdDBiJqAWohJ+iY5rCRsGgYlBrqOGQEmaQoLE3HBhve0D855da
	SOpyZrdtlucKAuUd9HX2ZqTqWybSftW0bs6Otf168OfaO3opGKDRQik4iQC/9TOub5vwW7zmst0Bz
	viKY8mTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cwd-0000000DLf9-1N6H;
	Tue, 31 Mar 2026 17:32:03 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cwa-0000000DLdq-2yIk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 17:32:02 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-64e87a81639so9311767d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774978319; cv=none;
        d=google.com; s=arc-20240605;
        b=IqyitD5NMYRw/KytnUgHFdcxVCdbtkRv0vGEBCP3aIdljudmVPWfJnx+YXKxs1Czd8
         92gI8dP13UWeIEiOjr7I4dyAOU+CnOj5EJ6sTvoIgQEdsM3EEXJtg0M1Q1OO0xLgUur/
         lp9rjnH+6aWAIWtvvOdeJvgbPxs91az10SUYDcevDJbZCyR/VB3s3ZPS1pi0eG2hU0pi
         Tn2BLiptJe0vBVB9mJ9t2zsE75EtY4G8XUkvXTJZa8SYbd2CJzmZaw8QDXXRR6UQVo9+
         2LroxNg7LavT3MG+W03IeLIzjffXt5W3jvaeUnEQsPrdKHNrf8QOfAnENCXlOSXra8l2
         Tqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E0yhE4GnVbJG4hKHIdWBFQgvJX3G1vXsn2yBdUvHrzU=;
        fh=tPPuC9irMRpa6SjXSuwjGcI4BxzhP1bnxcK7rmcFD6c=;
        b=hJTWuTb82J5bDty51a06jFJzxaZhep+ejclcQKcLHkA3Ac1dLI5WnUlJBdfPDEfUk8
         DcI2MhkyNS/11zl5C1y5FE2bH2dAYNKjVvW2VncTc639K9PFjnnPbCynTnK5D0yQOAI+
         OeIg7oXeEWgo5r4ZBZ0XPxjAK8Ob0yLgIVeym6oyiWygyQlHA7PiutnnGkGUFvr56FeS
         xdL+o9TEIT6EfiT04Bh2kx+wQq3O4HcFo+zKaN9JRMy+ubjwvi06L9NC0o1EVOaB7xZ/
         u3f8czPDCPlvBHi+gYr8W7eOTJ81IcUr4SNAv+yLC0KkCYlwMoRJaCBCULITM4xyizCt
         80yw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774978319; x=1775583119; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0yhE4GnVbJG4hKHIdWBFQgvJX3G1vXsn2yBdUvHrzU=;
        b=RViFhMP7nNqoYaObc+XricEFXts52XmHEOlpSG1L83M3B1tRynZKUAg4PLkZSUt/sN
         QDG9PxWyj/zrjyy/lijvbkhp4F4z8me4Ah091mtSkU+ajxqQmnxCN4qDr/uJyuUKqEfZ
         ZBZwRbBXXpTrU6uqpt6komAAzxa0wAbEXqyntKcxVDwBXxJdzBgUd+eFQSbvDzKXzK44
         psT1wQuFwc/KVhYfUTGBsUnu5jJoEZRvxqTnv+9bAwSY+SgK31Ry8O8ideSq7Mw1Wh6f
         QGotWqaiY5Yk7zLz9K+aFbMCw8moL9HtJ7Yffysowj1kkM6gEt2lW2bva8TmkZXy5OQh
         0rPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774978319; x=1775583119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0yhE4GnVbJG4hKHIdWBFQgvJX3G1vXsn2yBdUvHrzU=;
        b=DG/vQpMfoFh7QOoWBBhvI2+ARPn7B9ruw8ZYxBE1zkh7upfuwyqGSqcjARxJhmzXsX
         LUJnqXZ3v7+dmi/6iktu5p71ato9Px7Mr9ABgH8PYo0IC1C5jkGTRWBZgjlrOXheJ8tD
         cenV+2D0aSA1rh6M7bEM/RAtYMr4iujgC3o4m3O9fyNNqWArb7guL5dXjTSL4ipwvKdj
         P0nY2ZiCdPZaC/f4yzfSYuLNtcCDnveZm5xp+DTPXm7l6+jFwpoLPMfRbV6sjGvcTImX
         5dEVVveMZh5M08zoKSQVCJTsNENsWB3ZPAqQlDul5JL4blPIreinoVaIajdUpKkN8Jgw
         8LJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNnVVJFuXfMvnL6gb90N5IM4CDMCEqKkwV4tgLdCGH+aULhOHYGs/gyZQ7Amkl6QLRv1dpLnT1t5Fjkq9v8BOP@lists.infradead.org
X-Gm-Message-State: AOJu0YzIxfbxAq/R4GS1g1VAi1ji2czdrdyHAlNYgDAqytBfV4m+gffV
	B1duDLHSDq8nTOV3wxrtwjGQ62uAV3ysGYkEW8CaRhkzIaVmWJ7+UdI9a4f0E0+kwGI/YJu1Zh/
	wLE467ofOMVIK7j3Kky3YOI0gajoucjk=
X-Gm-Gg: ATEYQzzXJTpGkKemDKZH3nv47juTPOXRMf1PgSQ5gYZl/FgwYDPxU07W3tkdwDaxPIH
	APuqt+pWfqRTr+JplDYk+vqmuqApFDL5iDDl/tustauNMZA+5TZztjnkFadHooIauonH/RUz9T4
	JwSJa9ma6j9ZWrbG1v9WTvz6WwzUWuA/PbZSEAPBODOoTNzm3MuTija1brild7iW8F1gGUODVxY
	foxxM1ZVOs9m+yn5LBzOiF0gV8sWfdOgQPERCxiCVcoCz9lENtwpdumCvnaQT6SEnGZYoLPMmXN
	srWYuQotiLUFWKktAUEAlNU44R8TSxMRyVpae+EnpJmzx1RWXYlNPltBsjzQmPNK0XKr9w==
X-Received: by 2002:a53:d103:0:b0:649:97d9:cf1f with SMTP id
 956f58d0204a3-6502fe40abcmr71151d50.44.1774978316344; Tue, 31 Mar 2026
 10:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260331171043.F1C481EA006B@mailuser.phl.internal>
In-Reply-To: <20260331171043.F1C481EA006B@mailuser.phl.internal>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 31 Mar 2026 13:31:45 -0400
X-Gm-Features: AQROBzDtH2rQqqFQDzX0DAENqJJXYBOysXiWpgWuMs-qnB_6ztR_ntWKoAltnrI
Message-ID: <CABBYNZ+mr1_rf0shA8xiWweq2tydLhFXBrhjpry-tnY2u4X8qw@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Bluetooth: Add MediaTek MT7927 (MT6639) support
To: Javier Tia <floss@jetm.me>
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ryan Gilbert <xelnaga@gmail.com>, 
	Jose Tiburcio Ribeiro Netto <jnetto@mineiro.io>, Llewellyn Curran <melinko2003@gmail.com>, 
	Chapuis Dario <chapuisdario4@gmail.com>, Evgeny Kapusta <3193631@gmail.com>, 
	Nitin Gurram <nitin.reddy88@gmail.com>, Thibaut FRANCOIS <tibo@humeurlibre.fr>, 
	Ivan Lubnin <lubnin.ivan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_103200_755438_DFCEC44F 
X-CRM114-Status: GOOD (  17.24  )
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

Hi Javier,

On Tue, Mar 31, 2026 at 1:10=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> Hi Luiz,
>
> On Tue, 31 Mar 2026 Luiz Augusto von Dentz wrote:
> > Ok, but on 8/8 it seem to suggest the problem still exists which
> > trigger the following review:
> >
> > https://sashiko.dev/#/patchset/20260330-mt7927-bt-support-v4-0-cecc025e=
7062%40jetm.me
> >
> > Perhaps we should ajust the commit description if the 19 seconds
> > doesn't really occurs when 2/8 is applied.
>
> Good catch. The ~19 second delay is indeed fixed by patch 2/8, so the
> note in 8/8 was misleading as written.
>
> I've updated the commit message in 8/8 to clarify:
>
>   Note: boards with this USB ID expose only one ISO alternate setting
>   (alt 0). Without the fix in patch 2/8 ("btmtk: fix ISO interface
>   setup for single alt setting"), this caused ~19 second initialization
>   delays. With the fix applied, initialization completes in ~2.6
>   seconds.
>
> This is addressed in v5:
> https://lore.kernel.org/linux-bluetooth/20260331-mt7927-bt-support-v5-0-6=
f31b4342daa@jetm.me/

I've already pushed v4 with the 19 seconds comments removed.

> Best,
> Javier



--=20
Luiz Augusto von Dentz

