Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D372CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkhVrgc9OmPuX9zRiI9eMYevNzdxLtYphs0y5uGuLPs=; b=tp/i3HGmHaILhXXIWke8ClMNx0
	GF++LllFd9fsLbh8rXaKDwYg7Bfk29FFim2ohNQhnhAHdE8BlxUB1fr6Uk6j/quzrqxgchhTIm9pY
	cvia+h0yN5si/5DVA+mp4B/W8g+IIz++c00IFpHAyPjSlTUzZV98uuxQUNDUDECVdIfoeiF99As78
	Gz0ygIr/w9n6zWARCDKG18PLP74VB18UCMfAbs13TwyUTIFJedeVyuuVYh96+vSC8iTsnDo3QP9nz
	P9lUDfOSsQJdhEmxYtKTzBHp4/nioXzcb/O/w/gBbDA8F7ntEnZNF2vsvFnoxiny9E4Y1aWNnb7O3
	K6T6zFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjUG-0000000E2xt-1jgv;
	Tue, 13 Oct 2026 20:52:40 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjUC-0000000E2xG-42wH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 20:52:38 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-9902a746546so119042241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791924755; cv=none;
        d=google.com; s=arc-20260327;
        b=CvrEpsXZs3NCLl2HjqhVyIuqNg02NzLJaSerQuCwWn7/xBBQHx9Y/QPDkfJm6elEwb
         KxHmn49C7HT3XK2ofNIoGOCU8Gve5IEJatd/7+JK5RPG8CDv26S21qrzm7X92xu+eVKf
         SsV/qqZImgfrEz41xOQIV3ow4uCkVL/EN7E8ef3y9Wam1DGMXgBnKYLtfeedETrDB5gK
         V6dZAOpa3cBgxIkiVRUPRgHLgARg30dHYSSPUp4aueoFcpIIkAimfSuK4jD7T2rHUtog
         gqvChRO/lZDqDDjj+rH747JGreeYbtH9dMHAiJ1TchjDwA3CO3Iz/8LGgzeAUSOZLFH2
         TRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rkhVrgc9OmPuX9zRiI9eMYevNzdxLtYphs0y5uGuLPs=;
        fh=oao/qvs0fQs+pQnYaHg3yWhVaiGn79S19EYUCeVCmlI=;
        b=QZGPi8qy8sKunXu0FaNaeudWir1g9uxcZorj7iX7FYuDeDSov+R1l9zkdn3xqJiXF9
         rOVYZzLNA3Z2IwqlrNtU55DrcI3pqMIoLYJyMsyzJyLUlPe6oGt6E3gQGtAnYgmdLyGk
         yo6wRyNHytd3fl3b/LOFjVBUcsXW/685U2kTYxO0GGZBWLO6M8ZMVal/B0Is3W6OUtr0
         +dfBoDu5ljtX3ndy2mI768vNJoHhf2LcM6vypj5zMbQjAh0g/HIjrUMPvOfeaAJthLr5
         unutO002aqr1aYOvXlq7kpQ4nV8Xcog3d0sk+zPD3AVUDoLrhFIx91O1N3ArJWJjpUZ2
         fvQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924755; x=1792529555; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rkhVrgc9OmPuX9zRiI9eMYevNzdxLtYphs0y5uGuLPs=;
        b=dAuuzP9k3N+HxCbnqtjUJNdPzVwQuGtEvgGPZk1dq/SjoYEvg81SmXFc0nsdqQopX1
         dl+masrmwVuA+dXgb4UD8UPmPB8lfTb8j1xKrQa++HtcuPUSpzk2Z+kIHcxr8VLTQlNO
         SmsXHoZ0YdVQ1Q7cT22SG8lyjUOVhm1tNigEusqVETEfP5MqKjzwStSdKT8gE36X0FV0
         5l28aUXs8v+ui/MwM6La3Ms3Wt2mVmTCh1rRwuLQbVLmJ+Dv7jXGJBbAgJF9q+RUKPul
         Jq61Tio+C8LE70+souX8mHNXbrwAAPFne96G2qFhfOPxUWAMwTKYCikGdpdDBxGJ6tLn
         qW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924755; x=1792529555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkhVrgc9OmPuX9zRiI9eMYevNzdxLtYphs0y5uGuLPs=;
        b=W3eQF/gIwWHycM3hD3wGnACYezvl+cLrbUcxoyJs/Qf3Bp79RIZcxrU0RhX5Fyt6qz
         hjTX2vVdvjRU+HQfoL4aLGoFgPViptmujdGPUf1E1QQ86EE2H8kAUeXIcAgQwfmzeSa+
         CFR/unVny1LPBBLeNiVxs2tIEMn2V2a0nh9XOGS7iSX82brLHa19QzpMug+/aTJpN5L1
         pAfnKG3k47ZYSitOASw7EUPlxFmSscCitGg/QHRnrfOi7zT3JQgoriK0/TjhLluASqgI
         yQEDI1KybyM423LjhX6mVtPKR0Tl+uHrRn4Ywl1ZPVn70F126Vvd7psHTvVKg7Z4bmNk
         cvpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxVS6zfkgTAwj3P5Ti4Y5NVIoCcEomfShR0e1MkDV/d6Qnbtm0cE47EJYcUFf+coEDfCYRpWdQBhGe949gZrmp@lists.infradead.org
X-Gm-Message-State: AFq9FYJsTQMjHcmMub8G612a5CJ3QdXagc25m6U94dAfasbH0VEg7446
	hoW4eQqaxaATPhKqyBJeUsmztR0cOx4ctbIwz+VixcDLkPDeBgZhBc5bDicWGGfKgzoQsSC7HIY
	IHpAyc9pkvLQ/UljIIIREn7ibrro/jfc=
X-Gm-Gg: AYBFou3YlfGo2m1+u0AIe1r51Hu9Hd2eHGjhUeBdCwTWG6A36vG9iec0A6GiuSTgz/o
	2Cign5e5w3emTwgcptSy8EqtvW/bNDRZN3nbbw3VxrheSc6xdON8lhe9yUYxpRWqXThyTCW//9L
	fe/kppbvE1diCzv+eRDxepnfoc3RwgwuuySXvfLcnJbxzzhvATnWmKit/L+d4mgn1Wl1ySDKKBS
	CNstv0zE/jqJk4zWzpxFvAuU58ZuuBaOazpLo9Z1Gx7RG8lm8H6C3c4Go6P3gnWT/rIWtjyUBDb
	5qDUwKgo0N/YC03opBn+H2/kA58INn3rYD0UntL3fNTzcobdjpTH0/VGzErrEb3iWZu+jc/1Dsi
	c86MVFcZaTfUENjsByrxcySHkeFuWOdJE1GHyAc5A15Hlv2EggliLv8r+gjA0/LqVNApsmt850r
	X6VcHgYhhOSPAsDNKVcd6z4ACO5+qO/E/onk0bU9Un5Gpi
X-Received: by 2002:a05:6102:b11:b0:7b5:8fd9:27e9 with SMTP id
 ada2fe7eead31-7cb42386482mr3026014137.2.1791924755421; Tue, 13 Oct 2026
 13:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20261013-submit-stmmac-xsk-tx-completion-v1-v1-1-f21b9d098e62@gmail.com>
 <179192400014.160550.9046457038671470723@kernel.org>
In-Reply-To: <179192400014.160550.9046457038671470723@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Oct 2026 14:52:22 -0600
X-Gm-Features: AclHuK-F24utQ7hdbiPLO7cynxwSmEL20qXjDzlC2RlDwy8M8X2Q-IY3WKxAQbk
Message-ID: <CADvTj4oKGOQ9rgqbqVxxyx=LzzzEwf4xpJas_r9omeU1yS3y_g@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: avoid duplicate XSK TX completions
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_135237_017111_054FD390 
X-CRM114-Status: GOOD (  22.57  )
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

On Tue, Oct 13, 2026 at 2:40=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This was flagged during Sashiko review of the larger stmmac recovery
series, then confirmed by inspecting the existing TX completion and
teardown paths. The bug exists independently of that series.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

The duplicate accounting was reproduced in a local KUnit test under
QEMU using the actual driver cleanup functions and AF_XDP completion
queue code. With three completed XSK descriptors, teardown published
another three completions on the unpatched code. With the fix, the
total remained three.

The practical trigger is bringing the interface down after AF_XDP
zero-copy transmission while leaving the socket bound. No allocation
failure or hardware fault is required.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

This change has not been tested on physical stmmac hardware. Validation
used the software regression tests above and ARM64/i386 compile checks.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

