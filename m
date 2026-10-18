Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2116BCCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 18:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mdbBwBWo2/ZQakn2PE2+HqsoPZdP41mPHeDVrW/vk0=; b=XcQM+0VI/1qgNX/UMlcnMPu4SU
	A6MyARNu/ae5PcpiUpgGRbQE8/4Puy3aDy437qIExqvYzwqO9Npp7lXj/KVL6fGXYDGDIGr9BwGxK
	SSERQexDOP6Dx7+8ZJn5B4wfOSjttfAptH2pA4BDI7UvUIAt7ep6kX1j2FNucIQESn7JowWt47S6P
	BxsckYRuhi1AlLivJPrraPMCCGS6EAb6zdRgPt7VzZvOZzFQWC3zzEawKDGmpr8Df+QZecDoTeZOL
	urGMv//VVMH1NbEKRef5uc/jz2pWNqB+q6n6GEm8l3z77989tEU3iVWTGDCmwhxLW0UTvF4t3S3P1
	jxCHHsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIVFI-000000068I4-02n8;
	Sun, 18 Oct 2026 18:04:32 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIVFF-000000068Hg-0vCk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 18:04:30 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-451a49abd8aso2079852fac.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 11:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792346667; cv=none;
        d=google.com; s=arc-20260327;
        b=NnYeKi0YpFLyCeTylgvI/6dgPa6zqZhNnhRoj45G9X4N8lLMzcuXMEyzdWjyviWfVW
         0Ba6zrmDC8L+P2fqN+zmBD8ll7oSAL3I5lduw0zO32Nd80Sd6xOyJ8/2wO3vebfu5vWk
         h9j04EITh2jQ4SateEpZxNQryWSIvLa1gXr1xj4Q1jpfLsAQJfOfK2BfSbGTC8/ch86R
         1yr4Ck9XtksdghUpx25Ih+3B5jKVpT//MdVB/PrPpqArmbiZyB5Kg2VbdTUTqMX47aHj
         4vCqScVwaL9T/TfBYTT8YPGc/kFkRyQim0XqSEQM+zUOUwsGAgDN4VI/SmmPZwY/nMyl
         0N+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1mdbBwBWo2/ZQakn2PE2+HqsoPZdP41mPHeDVrW/vk0=;
        fh=iXdPwAYqVG+8lulSC+1+AEBPE332e+ecDNS6RN01Efg=;
        b=Z8pBtw6RNWIou33fudlRn+hUWl09OlIURVtz+qNOtj/2WVBI4PcXBOKD4dh0tO0vpV
         4aHzNFby+5y40/0bJM/NR9KjFR9IOwgyCISCqW0sDTS46dm/cELcncX98nMIOT9Pzqn6
         Htfj2X4mrUOuVBWa8g5Pw+iTsChKYgbMw2/o1gKbSBgG/AjVPYGywhPQMxVu7Yfl3smQ
         am9cCnXepb1+FnS85oPfjCDF3bDeTnvC6wyDf0/pFoLMzV5TRR74Hod1JuvVb2r1eobQ
         eweF1zt92eC5uteKvrJvZUlE4p9iW2sPRjRj/e0iIk4bGQisa29s9oUjFz2aFpWA5t/x
         Myow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792346667; x=1792951467; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1mdbBwBWo2/ZQakn2PE2+HqsoPZdP41mPHeDVrW/vk0=;
        b=XXwmgSdaJqyZ+kBeD5xVQNTR8YVfvb184gnKJhdaPG1LLFLoOkojhfh0Ms8a1qQ0NR
         tLOkBa57r0pY0gWV4JQQ7lbzt8nNYkEQOxdMI3kRzyaTLPLY9HhImDHUf/Usw/b5Mh1A
         obY+dvJ37RKBSZMRhFdp1a4P/0pabBAEs41yxMKf/Ph1Dq6xa3xjZSl4u1QwGOxv6JrE
         oxxVEbjkr6iaDfTHTX5u4APvFbG4YqfTbw2Cha032UdNdx7wLB6zNIDnKRYpflvqkDmX
         f5k3c+NMZye7KQ7L4tC8Ys/9PZKRfZ2r5JTmNiHvKbTzLSV0MsF0rzRBk5EOE32Nu91Y
         izsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792346667; x=1792951467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mdbBwBWo2/ZQakn2PE2+HqsoPZdP41mPHeDVrW/vk0=;
        b=CbO0dJQKEG0NYVRySv0wva/f6ssb5cWl5t2HwiEfM90cJQQWbpPcEvDNrl0RtYeitH
         thgl+a3SwnN3s2YwwVlMKw37shgunKPiMtLf3mRiSmWItkZfiCPB9oBy8FyfIIORsQdn
         Z/VRzaRSC8OFnzKULsHWjUXgt1A+V7+V245O9thf28XL2sItsAFg5RDaWj9lzoDaYDep
         a58NPabNb8P4Bzuhc9Q6N6/vVEMMfMbhQekVyf4QOLyoajx4dQmU93xj0V5hj9wdcZxf
         i522IoTsnSEaCtEShsM4KkNATF8j+0zqd7dYflwQRmXzfLeJJPTjYjX5ehGecIJHaKZ8
         RBfw==
X-Forwarded-Encrypted: i=1; AKwUvByBPddUGzxIyj3Ruh16xh/3GP8MbSSVZ2aDhFfZOqEzM34PSDAlkEFcdLLyw43s+uE5nyZUrIMv6ISetgBMXVDu@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+8jZc7iD6ScZhD288MdLelcX90o9XD334U07tJXFQbZ36vbdp
	IdSI7DK8CY1AQ8RZ5n4Shv5UxL3vNYgvgxp612FycZvDWdAmmkr5t17R0dLA7IoA35RysQGQK0O
	fybxgV6IM3eqm4yUM83QQWnv5Pve8LsQ=
X-Gm-Gg: AYBFou3LGMnbni05bIaZToQEZFiajs5dpDwclE2nI84vC8EtGJ162lzSVXFahd8iMtY
	JXxzoGQVtc7DMMwcb93wU4vRpXLLlCh13iqC69KKSwf6kwL8UfpyXFxfUn8HH9Wo+QGuWhXgAFy
	SvYdQopi6jsa75mhLCR4LK+06Tf7d9OsPCYVkSIqE329dXUChIf4Ju5PQxyLSQw7qgCO2PMqsT5
	NMiacREt5Z1aCoy50cxdv6SkXCdT0Rf7O5E7wGjX4Ye4ln7p9m18iY1JudUSRVDHg4vM7w152Zo
	GJIe7nmLM2y1XN5WUiY+nV/no8HxP5lD9qnteKJ64fulPCfsFk3lweE=
X-Received: by 2002:a05:6808:c16a:b0:4e8:f158:504 with SMTP id
 5614622812f47-53ccfcb3732mr4440447b6e.44.1792346666667; Sun, 18 Oct 2026
 11:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
 <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
 <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
 <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
 <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com> <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
In-Reply-To: <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Oct 2026 13:04:14 -0500
X-Gm-Features: AclHuK9jkljhKuhIJglKVeLMSVOb6YPON2UjWK6R6JPfulmpbIc-vcVZcLxOoks
Message-ID: <CABb+yY2FHBxNMnvVkJ=tmeRF--Y4t_L5A=FvXks8SCzwwARvyw@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_110429_392378_517FE89F 
X-CRM114-Status: GOOD (  21.84  )
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

On Mon, Sep 28, 2026 at 4:41=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:

> > It is not the diff stat but about inserting a flag in the api to
> > introduce special case behavior. It is like adding one person to the
> > party introduces N-1 handshakes - the has_queue flag doesn't play well
> > with other configurations and may allow future platforms to abuse
> > has_queue to implement hacks.
>
> Can you elaborate more on this?
>
> 1. How does "has_queue" not play well with other configurations?
> Everything should behave the same if "has_queue" isn't set, right? Are
> you saying that it will make the code too hard to understand, or
> something?
>
has_queue doesn't fit with all tx-done-by poll/ack/irq in
blocking/non-blocking modes. And we can't say that flag is for only
one specific setup.  I can imagine people (poor LLMs) concocting weird
designs because that's what fits their first implementation attempt...
just because that flag is available.  And then people vehemently
defend their first implementation.


> 2. How does this allow future programs to abuse "has_queue"? Won't
> they need to submit mailbox controllers to the mailbox subsystem,
> meaning they'll have to go through you? If someone is using
> "has_queue" to do a hack, can't you just NAK them?
>
It is difficult to fight platform specific changes because people
can/do say "their special platform doesn't work that way". It is much
better to reduce the abuse surface area.

> ...but I guess the root of the problem is that it just seems
> unexpected to me that fw_xlate() is taking the same input "fw_node"
> and then is returning different mailboxes.

Why is that unexpected? xlate() doesn't have to consume any hint if
all channels are identical. Another obvious example is a controller
with just one channel.
I think you should go ahead with the v2.

Regards,
Jassi

