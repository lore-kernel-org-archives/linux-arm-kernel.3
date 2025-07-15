Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D711C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 22:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbI9ihowVv8CtjBa6m/5OA0ET/gDNLTT+t5LJJNLHDI=; b=uj5VjASeIlgOsHNe59B5C0MpjY
	ShgZCEhI6HJpyt9XdxszNpkyVuhLZmDRhCDM0YIvzroXnSB0mY+ODVBB/dUveDTthfmdC5xc37j0s
	aMqMIi4ZmjzYI6+dZNgQmGY8fEIojrXnmWpbWnFY0c+QifyAxGrmSra73lj61ZaEoozeIAMKu3VdH
	OG6x/kPf4yU7QHv6FMNATXZVRr9qduUHNkG0nV7BY5jgRxpBKz34KMHt6gXVF0lSbjFarNw2YnH9S
	YsgAeDkndqvvCCi9M/3Gdzm8o7bquk3DIOcy8fKliJY/vYOs3p0TqsUCc0U1Th5qji71oGRhMAzGI
	k5s+22sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnuC-00000006JGe-2KrE;
	Tue, 15 Jul 2025 22:13:44 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnrm-00000006J9m-1lwc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 22:11:15 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-41b4ebb157dso1102534b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 15:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752617473; x=1753222273; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbI9ihowVv8CtjBa6m/5OA0ET/gDNLTT+t5LJJNLHDI=;
        b=Br+W6AkglD95DqwkEZSka5hcjhUqZBbb/SucLt4USskbRtm+L8R3NuIgZA2cPClHK7
         4AmyM1pSGfMaeuFg6yQLZYlYuTw63xe5iy81mPY65EDeMfztwHSvC+qKKvgnznI3oMQa
         uoz2NRwcDntWemswhbn/g8A498agcn/cAuBYL4wERXkB5uI6NPbHQZhSP/PYbaoRSpM+
         VdVFmqbjjgEmsOn+KES38DgyhlnnllwWVfEZdtmIi9bKhUnpJB7P7j7+BqT+45uxEOyj
         vir+cLr6Qbh0GFojAPj1kyRHfZ01R1wBTb35ganlrf4ffVpGG/nQ8HP5Bowi4EmA3z6i
         PoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752617473; x=1753222273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbI9ihowVv8CtjBa6m/5OA0ET/gDNLTT+t5LJJNLHDI=;
        b=tsUT7SnhzY5xgO2EIFYclGN4TIJQShAfI46Z7+35YXJ7F0O0vVuE+cZM69RZkFK5kL
         DeM6ij1DTjgHHyY7uP6ut1wElXMspgF9Ee6JITe1A3/ldwN9b2Zk4TufIrO48P3v1okc
         78HDORK3exwrn6XC+aGv8NpvD0DqCN+WiDAQfyy5MFIqc7m1qlCDJ58EKy6vRjivpXdV
         jxaZlU+Df/YqjPEnvf5z8LIpgsaISdvwje0cOMgXOoGjVa0wLTJO1MP5moEr664oiQE3
         NFdNzuPYGd79CkyKXCso2pZ15kYJQibTa6XKxZpEOqktNmcUZoj5sP7cVLcd3j21NBiH
         SDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr2xZOATi8O643cyAvwdoBplRRqGyQr5Iosd9Rk0PbJnj3Vq7P7iAfaAANJ8p8nQgNL660w8+isqQVoTVmmWAF@lists.infradead.org
X-Gm-Message-State: AOJu0YzCTqchYPx3sXtdWQwgbIX+JJ1WL3nA1W9Yv14dZe2A/QAv7lct
	hZiRY7YB4Gtb83k4L0PcEOZVWNONhP4jAvPVbM01x/oi7RvKqq3Ww3k5GdWZ0CatRELaEz1fX+s
	XVOvzeUlwz+ljRuR5m+Ar7O+Cyt17trU=
X-Gm-Gg: ASbGnctghxPEAElp3nv2GbyOcg4o2RGnMxaqDsp078WrTTI/AA4rP74tXScVTZ89WeM
	lMuiTieYAvLAIY1KIkWdLJpM04h0fP8xQN7ov1LplgKzHN/ezswLT7HtEPx5hsTenDRCcMc3gKr
	LWm/rI4YiCOMXEXmSC3D/qkatpM6b3K7U7EQv4f1iPEVaEcz1Yxet9Xr1pJp5DGIIWSt03RZDa+
	vMWsy7X
X-Google-Smtp-Source: AGHT+IGoHhMbBQXjyBcxgr9jpiV5+fAtALUG//n+FivI3N/qkbXgWlenBt0IKpzxq5ZVRyBBUhDp5LDbSwsZfe/UeKQ=
X-Received: by 2002:a05:6808:190b:b0:41c:8e9f:3853 with SMTP id
 5614622812f47-41d038e1b01mr367005b6e.13.1752617472967; Tue, 15 Jul 2025
 15:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
 <20250609031627.1605851-6-peter.chen@cixtech.com> <CABb+yY17OOBx73655OhBp8At1b81w9M61zzGu4uhXcMTw4Q=Dw@mail.gmail.com>
 <aG0i75h32dWg/L2G@gchen> <CABb+yY2BmqiQ18hU+7C234UnY8n-8PH5VEoS7nH5Xq5O1krGhQ@mail.gmail.com>
 <6b5f38f7-0557-483b-9252-cfade7a24cf5@app.fastmail.com>
In-Reply-To: <6b5f38f7-0557-483b-9252-cfade7a24cf5@app.fastmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 15 Jul 2025 17:11:01 -0500
X-Gm-Features: Ac12FXx1y9xaaVn7eKkY0Gzou_yfDgjczblmTIjxslc2qDlMZ6VVtwwaRLEk8wk
Message-ID: <CABb+yY26R_DHQUhpg-xUR_Z7EnjdR_4LPai0M-vfFTAOZy=vvQ@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] mailbox: add CIX mailbox driver
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guomin Chen <guomin.chen@cixtech.com>, Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Chen <peter.chen@cixtech.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
	Marc Zyngier <maz@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Kajetan Puchalski <kajetan.puchalski@arm.com>, Enric Balletbo <eballetb@redhat.com>, 
	Gary Yang <gary.yang@cixtech.com>, Lihua Liu <Lihua.Liu@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_151114_464048_BB3388B5 
X-CRM114-Status: GOOD (  22.96  )
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

On Mon, Jul 14, 2025 at 10:40=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Sun, Jul 13, 2025, at 19:00, Jassi Brar wrote:
> > On Tue, Jul 8, 2025 at 8:54=E2=80=AFAM Guomin chen <guomin.chen@cixtech=
.com> wrote:
> > ....
> >> > > +/* [0~7] Fast channel
> >> > > + * [8] doorbell base channel
> >> > > + * [9]fifo base channel
> >> > > + * [10] register base channel
> >> > > + */
> >> > > +#define MBOX_FAST_IDX          7
> >> > > +#define MBOX_DB_IDX            8
> >> > > +#define MBOX_FIFO_IDX          9
> >> > > +#define MBOX_REG_IDX           10
> >> > > +#define CIX_MBOX_CHANS         11
> >> > > +
> >> > if it is not really a single controller owning different channels,
> >> > maybe implement only what you currently use.
> >> >
> >> As mentioned in the previous email, a single controller can support
> >> multiple different channels.
> >>
> > OK. I am not too worried about having all variants in one driver esp
> > when it is manageable and share the code.
> > Unless I am overlooking something. Arnd?
>
> My main worry here is that the types are all quite different: while
> the doorbell and fast mailboxes are what a lot of other drivers have,
> the FIFO mode does not seem to be a good fit for the mailbox subsystem
> but instead looks like a more generic firmware interface with variable
> length messages.
>
> For those, I think a higher-level driver with fixed data structures
> passed through the hardware interface seems more appropriate.
>
Yes. But sometimes when the data structures of a protocol are not
bigger than FIFO depth, the platform may choose to use the FIFO mode.
I see it as platform dependent.

> Are there any other mailbox drivers that just use the mailbox to
> tunnel variable-length messages?
>
From a quick look, Armada 37xx and Hi6220 have fifo though they fill
them up fully for each transfer.

Thanks

