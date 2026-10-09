Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06D0CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30V3aYAGacnfDe5Uw314wkUS1h4m5vyY1WpctMWa5as=; b=JQbtP5JZ3UOtyWoRcqo5Hgxz/k
	AMjZt5/Y+gvZoYPOgOip4A+QkS+WmBI+PqSa5XpYsF7lbXi/KX/cUYjs4jgSfiFy726S+JsZbn4ar
	rf9qdp0c6gNYzxepUzV0DUhnUCRmG/XgvaOa74n3s+XTcDMiD+y/lePRmuNcw5eisJE4YUTGvsCOa
	hKc+1CP41ZqXTht/qykDVNcCEgYJt5A85Fl/4MTUgkdXh3n7rMQBMpMR06Tn7kCzdpMtHskLsbFqU
	w9Ea0ownabsRUkkfAAm6hJPcmZVFOhnOY7MjkugwPJBiHO9oYsLK8dxEv5o75UhRyrY2N2rL1Sf2k
	V1ByNi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFCkz-00000006Yfy-2hEt;
	Fri, 09 Oct 2026 15:43:37 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFCkw-00000006YfM-298B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 15:43:35 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-81ae6aefdceso5718129a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 08:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791560612; cv=none;
        d=google.com; s=arc-20260327;
        b=K7QZAJfbpdAGrn4KAq3IZJv7z6NXOAC2iOh8itTXTBzBTnlwTCuLJFD8P9oVb1KjZo
         Ue2vC6YSs3FJG6PD4Rc46f4meJNCehU3RnvKG5TUK6Xf2JPvjaQVM5cHHA9aTMkrezOE
         +rNrgbRFXDfNGudA+sifRaVRdaRLYnAlv00+BcWd8k0XdhX/x+4cl6Zocftwn8CCMBmG
         v75urhi4ba9Dw0n0IsmTw/PVp2PsBGzWE8P3aNvHChIMZy4T/2UAtVrpdKs+npajya4i
         wWIwLE5NWidgOmCCdXrPhgm5txI21DyaZGdL7E0o33IfZUIjHKrzRKx3FSlviOs+/VQS
         eJgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=30V3aYAGacnfDe5Uw314wkUS1h4m5vyY1WpctMWa5as=;
        fh=PX85ZjgBrV7twhP88BULw3ioAgiycy2y/8lsXgH4rJA=;
        b=opUx6Kb8LNOLg/Q8DAOskYgGU6ITNSbC9cxuUv2MiC701ScnytH7YPtAyC7mJHQ0Av
         chLIYLITag/5Bn2syQ1HgWjdLpjfRRtySQGBw3/RgV3ig7ZCpT3wnPbLpVYzkwWOwnBW
         XY/x/kyE7741ImbXH5tqASauH7FSxUPAqbT5pQxeFJ5TzSjEBmoaRX9O9RowcPw1neNu
         L0gqzZFEnP/hQSthhikHzAP0KTdLkw94wQLw30F+QNqD+pw5razR0NvM/IBMzUNYX1Fq
         HOuIdCHyfYQN0tRfLfVydqjaIi8FqsUE92oXomHisb7RSicg7/R/3EGIqemisto4VhLr
         h5dA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560612; x=1792165412; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=30V3aYAGacnfDe5Uw314wkUS1h4m5vyY1WpctMWa5as=;
        b=swU6LBA0HLwBvb4rB/rnpxL3Dy4Tt/hIoXvdK55ojz1iAuK0qWCkvuQ/5dz3j3Fi1b
         zBmkt5W3BORxck5i/bxNlooCEuzYSqfhSMp3UuuBBDW8S5/uW9aDDl7qE8sGd2R4K6Px
         x25nnEP2wb6G/NBHudLI1UwbsLjB1tWelTkzdld6ccy9+c4qrX4rptOWba50VxHC6xT5
         mCaOqENvlugvW9fn1p0kTMAibQakOaGtU2nUg8j1xAFozNm5eKlztbYGB5OOVPdJRIXI
         gMMAWtIMkvk8eu++aDYZ0aIuSBEm12+vVZ4MjnHp8hMVMKCSFZ/nJUQXOHb880DLMIPg
         hCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560612; x=1792165412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30V3aYAGacnfDe5Uw314wkUS1h4m5vyY1WpctMWa5as=;
        b=ohSnhNKEiO3/eLMZkUwQl/CjbJNQzftzirThSqogWAoQUK2jO7Kw926bOxitZat4pO
         fUP4juqXEvDT860iyS+hQOofSak2kpNVr3VhqTBJSos1Pm/5dF11xEBgb8hzMePAPwbG
         XDY7wb+zgCy0up894MZtb+NljaG3hRXzIAgMfL4yxNG0Rm4nolqxlPiUrfCJAIdINXu1
         EGXaP1cL7uGSDynvnrb9Cvg4S/1LJH1zZwWvhQ6azmzWvnqcV5GGKVU2ZuhoxqHuaXN6
         YmwqEupWx+Jt5/SJKS/JNqFUNWXFc4MbKUuEtTjYiMjF1U1x8+hj4fR935r4tfqiHxa3
         B/lA==
X-Forwarded-Encrypted: i=1; AKwUvBwmNsz+t1e54YIZIpsaeZ6Qz/+aEXNBja2ldVIRymlXHmTPY8PYjBYYxu2SQhb/hgBHqNjVqJO+mnk91LgG14PB@lists.infradead.org
X-Gm-Message-State: AFuF++l+DeLv5EiCIlbvoM1gYLGMxDBDBP3S/p6XO/aaBX9bInRTrxfG
	QPidi/n82mhkja4bTT2Ge24Ipej71J55q8GEUVtsvnWprtMUlSrbzSGwMknQkoL+liV65y0ho8J
	xfMOOUXLnszYu5mOL5DEKjCJWcjdjdxA=
X-Gm-Gg: AYBFou1omLWKPmmCv0unPkE0URl2wX2V0//eZ9xhZl3yT/TdJJa+P5EvAlh9Lapyymn
	p7AIE0T5UgAdXc0uZvcMmRrLeqbwwEryKuvdg1dbBhPcWa2MNV6PcuVW6wbuTyQqu8hoyG2ydDj
	iX6RNLBf1HuAb96jukA37BZahLNNMWZcmklNWufRxnLkaI6nLBIMuY245pd+PFveQYImL6crIhN
	kBw1Kjnpocwii9168OmMlAWE7Nb66xjsVlqTUcKiWm+e24FxjsH8ENnWY7eAaf1N+1T+2OvB+tp
	6jlbWFOQmPKFBTB4jdnVqgrNYgQyex7iU0JlPROTSUZzr/I5vxthEU0=
X-Received: by 2002:a05:6820:1992:b0:6e0:84b2:edb8 with SMTP id
 006d021491bc7-6ef08c7c614mr1702776eaf.1.1791560612403; Fri, 09 Oct 2026
 08:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
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
 <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
 <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
 <b1f088eb-7c77-4079-9b05-20729fcfd612@kernel.org> <CAD=FV=VSSEZykDpu48XVwDzNWKAhZjsPm3PNweTqeHv_DxiykQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VSSEZykDpu48XVwDzNWKAhZjsPm3PNweTqeHv_DxiykQ@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 9 Oct 2026 10:43:20 -0500
X-Gm-Features: AclHuK_n4jA48VU427LdptzIuvcXkvRmkA34iUq3fGa6NHmP0M26irsb0xZMW1I
Message-ID: <CABb+yY0yaXZX7=0L8Tt5P4u-GTX=unmgBMePoNTVQ5BHKzLM3g@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Joonwon Kang <joonwonkang@google.com>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Lucas Wei <lucaswei@google.com>, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_084334_584119_20221F63 
X-CRM114-Status: GOOD (  34.63  )
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

Hi Doug,

On Fri, Oct 9, 2026 at 3:42=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
> > >
> > >   for (i =3D 0; i < mbox->num_chans; i++) {
> > >     if (!mbox->chans[i].cl)
> > >       return &mbox->chans[i];
> > >   }
> > >
> > >   return ERR_PTR(-EBUSY);
> > > }
> > > ```
> > >
> > > Then the client loops around and requests the same channel over and
> > > over again until it gets -EBUSY? Like:
> > >
> > > ```C
> > > for (i =3D 0; i < FIFO_MAX; i++) {
> > >   client
> > >   chan[i] =3D mbox_request_channel(client[i], TX_CHAN);
> > >   if (IS_ERR(chan[i]) && PTR_ERR(chan[i]) =3D=3D -EBUSY)
> > >     break;
> > > }
> > > fifo_depth =3D i;
> > > ```
> > >
> > > I _guess_ that works, but it still feels like a bit of a hack to me.
> > > You said you were worried about people abusing the "has_queue" API.
> > > The above feels like it's abusing the "fw_xlate" API, turning it from
> > > something that is normally a "lookup" into an allocator function.
> > >
> > > +Rob, Saravana, and devicetree@vger.kernel.org. DT folks: is the abov=
e
> > > something that looks right to you?
> >
> > There is no allocation in your xlate code above, so this is not that
> > terrible as we talked on LPC.
> >
> > >
> > >
> > > I researched whether other upstream drivers use of_xlate() /
> > > fw_xlate() as an "allocator" like this. I did find "exynos-mailbox,"
> > > which appears to be doing something similar. However, upon deeper
> > > digging it seems like "exynos-mailbox" isn't using this dynamic
> > > allocation for any compelling reason. It looks like, really,
> > > "exynos-mailbox" should just be returning one channel. The client
> > > (exynos-acpm) could just use the same channel for everything since:
> > > * It actually gets the _real_ channel ID out of the data.
> > > * It doesn't care about txdone.
> > > * All it does is ring a doorbell and there's no queueing.
> > >
> > >
> > > In any case, if using fw_xlate() as an allocator is truly the only wa=
y
> > > to proceed, I'll finish my prototype and send a v2, but I'm still
> >
> > Why fw_xlate() would be an allocator? Can you extend your code to show =
that?
> >
> > I think doing any allocation in xlate() is calls is fundamentally wrong=
.
> > These should not modify the state of the device, so no allocations, no
> > device_link_add() etc.
>
> It's not _calling_ an allocator, it _is_ an allocator. It is walking
> through the array of channels and returning the first free one. Then
> that free channel is "allocated" to the client.
>
You mean _assigned_.
Allocation means when there are some resources reserved that must be
released at some point later .... which is what the mailbox controller
driver does in probe() and remove().
In xlate() the platform just decides which channel to assign to the
incoming request -- some platforms take the hint from device-tree,
your platform has flexibility and can simply assign the first free
found.

I will try to explain in detail your questions in your last post, but
I am still not convinced you need to modify the api.

Regards,
Jassi

