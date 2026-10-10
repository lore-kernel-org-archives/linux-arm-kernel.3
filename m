Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34C5CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 09:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7T5vK42CKAAeKGAbtMXBKyH6AjLD+rScPsMFR15QqdY=; b=JXtWqBSRtsPNYXO7f9MA4XSY35
	0KUR3ks+h0qDayhb7aq20P7yV4lxQzYi04reILEy8vyZTTdYsXJJBv+Cp29qNz0Ki+7XANXEVcPdK
	YeVzWhqehbodQbo/UcP4mCedA2i8+4bU3Q1mtVmI4j3B9sNAPzNSMHyWcd/Fan/loUR8Ltf7ACWjh
	scIaCGoUhrK1La5KOOCv/QCJN78+qIUU1SKu8WYAlZUQRvWYr0RWecqMgnVWtaN2M3BQXzw555ZLv
	mNEqOchBwf9aitdQxeiqq52DRLcDECu9jQDCLWihkLkn+7E02vO9+LF0i2Ktwo6xDsJxtN7wOs8Km
	ifuicsBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTCM-00000007jhq-2wz9;
	Sat, 10 Oct 2026 09:16:58 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTCJ-00000007jhQ-33P4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 09:16:56 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6b16824c0fcso561912a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 02:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791623813; x=1792228613; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7T5vK42CKAAeKGAbtMXBKyH6AjLD+rScPsMFR15QqdY=;
        b=Wkgw7pUCK/OTYBIVYx/6y23a7kGKNQ4jTd6eb2qhKp7WsUPLCwfwVaVe5rGE7HSMmy
         4F7zXuAr2f1fWVtyK45/fI8JLheoZIGC+a76kIpjLtTKn8ugNjWLw503v4g/lHzF7zpu
         9X2qrSqQTNwu7Kpi9p66Q0qVNBaQ89rfxcuZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791623813; x=1792228613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7T5vK42CKAAeKGAbtMXBKyH6AjLD+rScPsMFR15QqdY=;
        b=w2XEWcK/Ch9V9UeI5d+wgGtxcJfOK9CJt0qi9t9ejmlC/O4lxBPcX2IxciDG46WwAX
         bHcv98kULCLs9dr//wJUOYWAmMEroXk2iBp111R4zs69AV3baWkD0MWOstmDs+5N97+z
         lP/J2mDpLniUdRCOyqtLUam2c/b/8mCKdoL+Q7t/Ff31aitiWPiooYlffT0jX6U2Jxw8
         pCN9loS6iqQQSr/oqEaUP9Hw4DYui8hqvFJvjJKfOyLT2SQB6nXgzRKgwgWwFayXSSgO
         of89OeVrW/lNjBHvpD5qONr7TqNA3KTrBWidgc6EHu9JSYTROf9SyowGXrvAWRhkRev0
         CBbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSdih40yPhOLqkoPV6Z2i0HZCo64bMBrmBxAs3O2xGDtEIzRCQmPDpkOnAhmT5Bp1qlrAWOK7wNY0ulyUqrm6c@lists.infradead.org
X-Gm-Message-State: AFq9FYJIEEh3q3WhQVrCTsKGhsknIJQlcEL9fB4LYOc6/Sl0MUfpxcfS
	LUKZy26fvi3u1xTcfIK4VX3PDOSlXgGmkftVAjuEkRD6/GT7MOphdOXO1heyxREHHNBEe8ev9di
	terg=
X-Gm-Gg: AYBFou0HRc13N84gMyKG5r3oGYlQ0xuCWo4KyEBf+w1h4vGeMl+averli4ciQch2zNs
	wXz852cxfCikOe8bBiuhF9cKQrOi/E5CWkVjZE0g7heCHziNFmiX38ieXwFqn5KXjFTNJGhoFDc
	i9VVPmApfPylciquXdC51Hm/epM3M47pvvk7EXQd8Yfpyr/2F6YnaG/9sl9uHUGr41J6wMmebQy
	dECHGqReuJguiTFu+7Li94bwzjLIOpi8nyH42smXiLh3dMIJg2LhEcoF9WpIBriSxPLJdBpZVyK
	0/aB+u6G/vP9MdTRZjpZOop8NVTgdjGo7IvIWuvPI0Do+c4FTbfClNkqayjkzQouV1C/ZxosUSN
	aXkV3QYAI1q4Dt9InZKTQVG+7G2P7ixw2ZpxelsbOmadBngK5JH3xR/+zhNoJBFDdwkOJYShurJ
	w8Mec2ZNZg9ZycarXCVj7eViAtJeQVzI1NklPOcwGR77WCwPOJdO11sU5qyy2CpKY9rNpuN1ET1
	NziCI9zqYSCmEY8LJkvnQDTbMMn/UEgvcrZ4FXQu1X8Xi8duw==
X-Received: by 2002:a05:6402:27cc:b0:6ac:6a3f:c626 with SMTP id 4fb4d7f45d1cf-6b17c2389bemr3719440a12.8.1791623812653;
        Sat, 10 Oct 2026 02:16:52 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dc11fasm2474026a12.9.2026.10.10.02.16.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 02:16:51 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48af27fe287so420452f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 02:16:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxcR5wPz1hKSHRi8SExTfokNAzxlDxY8pDUQRF4h/XhyyW8hmjWTi4/zCIf0GcuhrRTAa/IUnSazBfzx00UwA/s@lists.infradead.org
X-Received: by 2002:a05:600c:19c8:b0:4a1:7bae:d80a with SMTP id
 5b1f17b1804b1-4a18e47ad49mr89287935e9.9.1791623808250; Sat, 10 Oct 2026
 02:16:48 -0700 (PDT)
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
 <CABb+yY0yaXZX7=0L8Tt5P4u-GTX=unmgBMePoNTVQ5BHKzLM3g@mail.gmail.com>
In-Reply-To: <CABb+yY0yaXZX7=0L8Tt5P4u-GTX=unmgBMePoNTVQ5BHKzLM3g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 10 Oct 2026 02:16:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUw70BjakAWsbtJ-qnGGXB7vo8x7G939_jeyGKagVWyg@mail.gmail.com>
X-Gm-Features: AclHuK_QaW90rrHDoR3w9K6oMhgGdn--oULAhnah8n8uC4OdTYJMsL3yEKTzFlM
Message-ID: <CAD=FV=WUw70BjakAWsbtJ-qnGGXB7vo8x7G939_jeyGKagVWyg@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>
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
X-CRM114-CacheID: sfid-20261010_021655_834373_941E15AF 
X-CRM114-Status: GOOD (  44.26  )
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

Hi,

On Fri, Oct 9, 2026 at 8:43=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> Hi Doug,
>
> On Fri, Oct 9, 2026 at 3:42=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> > > >
> > > >   for (i =3D 0; i < mbox->num_chans; i++) {
> > > >     if (!mbox->chans[i].cl)
> > > >       return &mbox->chans[i];
> > > >   }
> > > >
> > > >   return ERR_PTR(-EBUSY);
> > > > }
> > > > ```
> > > >
> > > > Then the client loops around and requests the same channel over and
> > > > over again until it gets -EBUSY? Like:
> > > >
> > > > ```C
> > > > for (i =3D 0; i < FIFO_MAX; i++) {
> > > >   client
> > > >   chan[i] =3D mbox_request_channel(client[i], TX_CHAN);
> > > >   if (IS_ERR(chan[i]) && PTR_ERR(chan[i]) =3D=3D -EBUSY)
> > > >     break;
> > > > }
> > > > fifo_depth =3D i;
> > > > ```
> > > >
> > > > I _guess_ that works, but it still feels like a bit of a hack to me=
.
> > > > You said you were worried about people abusing the "has_queue" API.
> > > > The above feels like it's abusing the "fw_xlate" API, turning it fr=
om
> > > > something that is normally a "lookup" into an allocator function.
> > > >
> > > > +Rob, Saravana, and devicetree@vger.kernel.org. DT folks: is the ab=
ove
> > > > something that looks right to you?
> > >
> > > There is no allocation in your xlate code above, so this is not that
> > > terrible as we talked on LPC.
> > >
> > > >
> > > >
> > > > I researched whether other upstream drivers use of_xlate() /
> > > > fw_xlate() as an "allocator" like this. I did find "exynos-mailbox,=
"
> > > > which appears to be doing something similar. However, upon deeper
> > > > digging it seems like "exynos-mailbox" isn't using this dynamic
> > > > allocation for any compelling reason. It looks like, really,
> > > > "exynos-mailbox" should just be returning one channel. The client
> > > > (exynos-acpm) could just use the same channel for everything since:
> > > > * It actually gets the _real_ channel ID out of the data.
> > > > * It doesn't care about txdone.
> > > > * All it does is ring a doorbell and there's no queueing.
> > > >
> > > >
> > > > In any case, if using fw_xlate() as an allocator is truly the only =
way
> > > > to proceed, I'll finish my prototype and send a v2, but I'm still
> > >
> > > Why fw_xlate() would be an allocator? Can you extend your code to sho=
w that?
> > >
> > > I think doing any allocation in xlate() is calls is fundamentally wro=
ng.
> > > These should not modify the state of the device, so no allocations, n=
o
> > > device_link_add() etc.
> >
> > It's not _calling_ an allocator, it _is_ an allocator. It is walking
> > through the array of channels and returning the first free one. Then
> > that free channel is "allocated" to the client.
> >
> You mean _assigned_.
> Allocation means when there are some resources reserved that must be
> released at some point later .... which is what the mailbox controller
> driver does in probe() and remove().
> In xlate() the platform just decides which channel to assign to the
> incoming request -- some platforms take the hint from device-tree,
> your platform has flexibility and can simply assign the first free
> found.

In this case, mbox_request_channel() plus the fw_xlate() seem to me to
act like an allocator. There is a pool of channels and each call
allocates one. mbox_release_channel() releases the channel. This is in
contrast to normal cases where fw_xlate() always returns the same
channel. Sure, I guess in that case it still "allocates" that one
slot, but that feels more like someone requesting/reserving a channel
rather than allocating the next free channel.

...but I guess the root of the problem is that it just seems
unexpected to me that fw_xlate() is taking the same input "fw_node"
and then is returning different mailboxes.

If this is what everyone wants then I agree that it can work. I just
want to confirm since it doesn't feel very clean to me.


> I will try to explain in detail your questions in your last post, but
> I am still not convinced you need to modify the api.

Sure, anything you can do to clarify is appreciated! I'd love to be
able to send a v2 and move forward, but I don't want to do so while
things are still unresolved.

-Doug

