Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6446CCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpL9JdRnQWjZohyDj5gd2hk16XdjjZ4+ynUw0iwS7Uk=; b=oRDgzug7yzwO8uB/PNxgjQ1Qqo
	13T5aEeRZMIccgmQJ/9dIaIFZ7K9q8bnjKdPUCihTltQ5XlzyDHm+tP45Cj+kcENZBTF00riZyF4f
	X98abXas8Ps4ER+cTg83m0e1ZJPcfrX6TpgdDN6SRn4iSBmca3Pfo/CDgXwEt2twzR5+BXzUBtSyR
	TO8xUKeOCK1KQmvjx0UUdAXN/lGn2SkpqyC3y3NsLpI0s4+jmeBnR7F202U6Y2a526AQmxyutX3ux
	6M8ts5Vdy/eEdy15OY7+Qz7a5eOrngNnqr8VUiQaI89LinfYNBSD1Oq8OJWSLNwNbJpURjfly4jPG
	ePA1PhrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6BD-00000005qD9-2e8M;
	Fri, 09 Oct 2026 08:42:15 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6BB-00000005qCI-229J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 08:42:14 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso615732866b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791535331; x=1792140131; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TpL9JdRnQWjZohyDj5gd2hk16XdjjZ4+ynUw0iwS7Uk=;
        b=CAtxvIYSPd7yghcF6+9WZz++tJM0Q08oyq1EGP3pykYZYFlRLlsmGtZ5Eaog4QNX4S
         FLG7UNL0rFewavQGU2+Rj1KORNIq5o1hN19mMN3His0ON45tSwdXjnUQcFOAl1abJWI8
         pVo1B8VsSv2/0h/xtGlaqVBljvGyX8GLps3R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535331; x=1792140131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpL9JdRnQWjZohyDj5gd2hk16XdjjZ4+ynUw0iwS7Uk=;
        b=msITv3JoPyg2Rexo0MYEIRNS5wlSPLYck71Ap+4wZp2IZrygy6mkCLpcBtzH1q+mM4
         HREUeAsZ4sHQ29FaaWz6CI1fgg2kIt50zj21lDTU35XfDp8FmrGlIlFkCj97RlcaDhgS
         wJRtpKG1FNDlmIKfpl7RMquN49OdqfF3hSLL12yeei2Hx0WzWU0KHat6YrNdppcFJ1mV
         inQc8+PGoQ18bnC2XEP3I1Izweo6t4OpXiGrnGpjpb+OL9GWiv3rexHlz3TEwytuz7O4
         tUzTcObW8YNxu5C1TSMhZESLk+eBcLUFZQmsZB2XGXQ34/aCsR3vzHrkZDj8P1XYqQoe
         5UYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu760skmlkL7Tf+Ij1d3fNv+FEt9RZZSa9XBFikjtXW5oZ94Eo2WnGD4q7zDUbLLeKjOiRYMhw4igebXw6fl8l@lists.infradead.org
X-Gm-Message-State: AFq9FYLUcVPOp8EdpwoZAplxIjUflK9sqbVxqAVam5Iu9XocL9SS9yI3
	ur6D7S+IbSI/+5GboiFeNgp78D50H4mAwwFoP303r7mKPJrFYEHbBpr3tYVOdBAb40B3qmIEOen
	/jzmtJA==
X-Gm-Gg: AYBFou3W3WJMTbdr4J2rlADS6+meGs4oxBzFa9GMcIfo2y6KQNF1GCXHodsaT3uV+x7
	5FccukRmfbSe6LCnRl7ppadzA5F+eZ1MvUhSpJC1hfl97btqaEBkID9WAEZLwsG3WB83kSot0+7
	YdO0ikfyX1aWALIuTgskGY2WriMGdPwuL2YQn+C3NFGrMgjU8eD+i0Y18+6OdgVPd5Mj00KwY+b
	oeQB8L+IVviqT+057vIj12sLaE89k5zjf/cAAaX3MbAjvjFJqmZDaEQvu9bGBgAiWeppa4WUC8E
	Tvh7mba3ZEanZYFi5SqiOvn8I0ZvWsnAemyD5GBauCJRsCXFcHFaUIXu1GF2wT35rfobzT2bM8I
	7veDnL294bHMY1XIlEXsBrX8ZgeCg4om05EU+7aMmMtHHzz4iGJQJFn/GQpIFwU0JqU6emdm5/4
	siSveQi++y5VuZ1uuKh9azGeDlo/lTzq3vFuaWlBL9sn5YAQBtjC22lG4pp/SCm524g5tb1aEvR
	HR6mrmDdZUZ2P1vIOQiKgGdl6kgFiaz4QxcmQ==
X-Received: by 2002:a17:907:3d8c:b0:c2a:ad68:c70e with SMTP id a640c23a62f3a-c31a9ff4c2dmr123392966b.11.1791535331181;
        Fri, 09 Oct 2026 01:42:11 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa1302sm62627466b.51.2026.10.09.01.42.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:42:09 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so5262687f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 01:42:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz/VP0nwKwwZ9IH493go2BD1Pfd3FzqWI3OMsQBIUOx/2Y2lPaBKsEmROvQNuNT8T5Iz5zYtlt95CHShGhV/J4D@lists.infradead.org
X-Received: by 2002:a05:600c:4ecb:b0:4a1:6916:798 with SMTP id
 5b1f17b1804b1-4a18e4a3f69mr19100085e9.14.1791535327953; Fri, 09 Oct 2026
 01:42:07 -0700 (PDT)
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
 <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com> <b1f088eb-7c77-4079-9b05-20729fcfd612@kernel.org>
In-Reply-To: <b1f088eb-7c77-4079-9b05-20729fcfd612@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 Oct 2026 01:41:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSSEZykDpu48XVwDzNWKAhZjsPm3PNweTqeHv_DxiykQ@mail.gmail.com>
X-Gm-Features: AclHuK_I9OeBRY02WEee3vuFJa_eA7foPBEu58USBohXW5y9EM2eolVWe-MVbbg
Message-ID: <CAD=FV=VSSEZykDpu48XVwDzNWKAhZjsPm3PNweTqeHv_DxiykQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
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
X-CRM114-CacheID: sfid-20261009_014213_594130_2CD96145 
X-CRM114-Status: GOOD (  35.44  )
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

On Thu, Oct 8, 2026 at 11:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/09/2026 23:34, Doug Anderson wrote:
> >
> > ```C
> > static struct mbox_chan *goog_mba_fw_xlate(struct mbox_controller *mbox=
,
> >                                       const struct fwnode_reference_arg=
s *sp)
> > {
> >   int i;
> >
> >   if (sp->nargs)
> >     return ERR_PTR(-EINVAL);
> >
> >   for (i =3D 0; i < mbox->num_chans; i++) {
> >     if (!mbox->chans[i].cl)
> >       return &mbox->chans[i];
> >   }
> >
> >   return ERR_PTR(-EBUSY);
> > }
> > ```
> >
> > Then the client loops around and requests the same channel over and
> > over again until it gets -EBUSY? Like:
> >
> > ```C
> > for (i =3D 0; i < FIFO_MAX; i++) {
> >   client
> >   chan[i] =3D mbox_request_channel(client[i], TX_CHAN);
> >   if (IS_ERR(chan[i]) && PTR_ERR(chan[i]) =3D=3D -EBUSY)
> >     break;
> > }
> > fifo_depth =3D i;
> > ```
> >
> > I _guess_ that works, but it still feels like a bit of a hack to me.
> > You said you were worried about people abusing the "has_queue" API.
> > The above feels like it's abusing the "fw_xlate" API, turning it from
> > something that is normally a "lookup" into an allocator function.
> >
> > +Rob, Saravana, and devicetree@vger.kernel.org. DT folks: is the above
> > something that looks right to you?
>
> There is no allocation in your xlate code above, so this is not that
> terrible as we talked on LPC.
>
> >
> >
> > I researched whether other upstream drivers use of_xlate() /
> > fw_xlate() as an "allocator" like this. I did find "exynos-mailbox,"
> > which appears to be doing something similar. However, upon deeper
> > digging it seems like "exynos-mailbox" isn't using this dynamic
> > allocation for any compelling reason. It looks like, really,
> > "exynos-mailbox" should just be returning one channel. The client
> > (exynos-acpm) could just use the same channel for everything since:
> > * It actually gets the _real_ channel ID out of the data.
> > * It doesn't care about txdone.
> > * All it does is ring a doorbell and there's no queueing.
> >
> >
> > In any case, if using fw_xlate() as an allocator is truly the only way
> > to proceed, I'll finish my prototype and send a v2, but I'm still
>
> Why fw_xlate() would be an allocator? Can you extend your code to show th=
at?
>
> I think doing any allocation in xlate() is calls is fundamentally wrong.
> These should not modify the state of the device, so no allocations, no
> device_link_add() etc.

It's not _calling_ an allocator, it _is_ an allocator. It is walking
through the array of channels and returning the first free one. Then
that free channel is "allocated" to the client.


> Why? There is simply no corresponding xlate_destroy() call. It's also
> confusing, because the meaning is to translate from one domain resource
> to another, not perform actual resource allocation.

In this case, there is no leak because it's relying on knowledge of
how the mailbox core will be using fw_xlate() to finish the allocation
and then relying on the knowledge of the mailbox core to free. It
works like this (simplfied, see mbox_request_channel() for full code):

```
scoped_guard(mutex, &con_mutex) {
  list_for_each_entry(mbox, &mbox_cons, node) {
    if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
      // The below "allocates" the first free channel associated w/ the nod=
e.
      chan =3D mbox->fw_xlate(mbox, &fwspec);
      if (!IS_ERR(chan))
        break;
    }
  }
  if (!IS_ERR(chan))
    // This finishes the allocation.
    chan->cl =3D client;
}
```

Said more simply, in the mailbox driver, there is an array of channels
associated with a given "fw_node". These are "allocated" like this:
1. mbox_request_channel() grabs its global lock.
2. The mailbox driver's fw_xlate() is called to find the first "free"
channel associated with the fw_node (a channel with no "client").
3. mbox_request_channel() sets the "client" field in the channel to
finish allocation.
4. mbox_request_channel() drops its global lock.

Does that make sense?

Is that a design that looks good to you? If DT folks have no
objections to that, I'll send a new patch that works like that.

-Doug

