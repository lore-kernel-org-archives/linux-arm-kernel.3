Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F2DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 17:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDEGzHO2uTa+4A7XuSvXUU2T6+UneNTPHWos30Bm+Wg=; b=qFdb6kpjYPABtMEtJyPee2msnT
	uI7IZSDRNR386oy+oZ6qR64TpOcP9G56bXjV4Eahrgtex/i+dBxXUildIzDnprvdumHeb7TnTr+NA
	CFDuMyRrgciI3HeAhOeUTzHUBSr/PbBjdVoaJk5+zwTCE2bqX2sdK8x70rYGYas4vQYcTzav/5VJ8
	HnaEeI8p5VO7JNV6LN0u/oJbS56F40Xm3ggKihhq0ka66VNrePkktIvWUhEKcphgqNIUC32eZUOYb
	RsZTfhRqlzkpjoiodf0hhNWFubZ7j36wh/cAb2wA56MMFOsvzCufChSnSy4Ag9NFMtxmFI9bTQdvH
	troK0Avw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5lT-00000008HTx-0KGK;
	Wed, 16 Jul 2025 17:17:55 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5iy-00000008HAw-2bvY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 17:15:21 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-615a4b504b2so13801eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 10:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752686119; x=1753290919; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDEGzHO2uTa+4A7XuSvXUU2T6+UneNTPHWos30Bm+Wg=;
        b=GPfqkgi0QMhhLBzH6UoxgZLVsgulDzAziMj4Z37DPY6OpfU0cMgGMru+loXywSXlMH
         TH/V0/k7KRKgVlNRuNB8WF1yLkJOASLvqNN10jJBvy5e+xcxAT0mNyO2dOABiVZ6EM0R
         tM7NQMkYos1JgtT19JwdGt0qIsWvD6uxgJSQvxWCCO2Zn+7P1th0TV8JL4g0wnd1lzIQ
         WAw5wu/L2Tc/IHDU/g11Sd/Of5pIPruUPIj8QqMbP6Juf6L4kNP1VUkHeMd+bB7EwAbD
         69SyaZIa2wTk9EC5kgBEx0ufa0Swkt/q0R9SVJf5acyIdDN/6rQDC5TEj/jHEN1Z8Tgf
         4GqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752686119; x=1753290919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDEGzHO2uTa+4A7XuSvXUU2T6+UneNTPHWos30Bm+Wg=;
        b=unZSplCfvm00HVLSZBCRM9HaFiS3aV447kx0eS0mHXghwUPcZMPi+9lnIMH2N8PB9o
         e7C9BFHB5bnc/I/4+3+E/Yc9ok5ZnZx9/sF8tSAOTMzQEPb6PJo/usnph7hIAcWBMOP+
         1vhWxuQ4tP5u9ZeRjHhBSdABK9PMHmtmjXPWiIY2Pb90rEhSvtGzpcfhZo4U4zbauLjA
         0brPpEAP2l5iatNQn+RjQh5471C9rm/8UWHK9Zq35wXI856/Os8ql5jTkS9PABhJAjQ+
         f+C8LxaCmYm6iiiDOKv/zh//Uja31NNlx754vW9NjXclK6z7vXDjgJvYLFN9xMomq7OW
         l6Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWycGhKht8xJsImoTgfyIkwjvBueljc+L0/ri1M3L+1r4KjePe7n/Tz7Ejsho3bMRBTLEkdgCU+PypMk6YxCR1m@lists.infradead.org
X-Gm-Message-State: AOJu0YwZhUrjNPNb7M0/oirMrS+Dqxcn2d2W+4AcYShgra2C4hoJmWVy
	T3XO2xEzKKhsl3kgJxbhNqN3M989AXgEHkplGYb88O8ALv+b+Hf/739a6HfjB3Ydz+YKReJHD/7
	/Z5ut6qpNIC/bOIGHcRokDhjOD571xmg=
X-Gm-Gg: ASbGnctTvIFp7Xhsd+DOIyW/GGMRstfmi5DR5fXSU+7uGpSR+IwS79AR8VCu4qT1O5a
	mGuxm2qS1kE18VdcgDJWEkCEzi5JG22ZjQh8wm17h1txJHANRRdHX/C+ylJTVMleXS8vUCkBF3f
	sewe6JI09ytFuVPYwr9S0aIGLlwA6NuY8uFdg/wNHcvIPc+3kt2b4DxYp2/gL7JZafHPyg26Bje
	Tf+u9q7
X-Google-Smtp-Source: AGHT+IGFgEK58YLiG0kPmm1bbGImj+QtPQs5YuS58v4emZ5JMn6SYKkhdJYSdY/e5NVbE6/6pbuhfky8w9ZGB9AZe5c=
X-Received: by 2002:a05:6808:6a93:b0:40b:9948:f26c with SMTP id
 5614622812f47-41d034ee59dmr2834410b6e.12.1752686119206; Wed, 16 Jul 2025
 10:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
 <20250609031627.1605851-6-peter.chen@cixtech.com> <CABb+yY17OOBx73655OhBp8At1b81w9M61zzGu4uhXcMTw4Q=Dw@mail.gmail.com>
 <aG0i75h32dWg/L2G@gchen> <CABb+yY2BmqiQ18hU+7C234UnY8n-8PH5VEoS7nH5Xq5O1krGhQ@mail.gmail.com>
 <6b5f38f7-0557-483b-9252-cfade7a24cf5@app.fastmail.com> <CABb+yY26R_DHQUhpg-xUR_Z7EnjdR_4LPai0M-vfFTAOZy=vvQ@mail.gmail.com>
 <aHcOaas459jctIB2@gchen> <8365b672-49d4-4ed3-a3e0-53a11c20fe7c@app.fastmail.com>
In-Reply-To: <8365b672-49d4-4ed3-a3e0-53a11c20fe7c@app.fastmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 16 Jul 2025 12:15:07 -0500
X-Gm-Features: Ac12FXxFNiSlXABx3V2hOYiielrGWIT6yYg3uZuxe8SRVb--0Hrn2S4CLmdo2tU
Message-ID: <CABb+yY3KBdA0KeExfzx6otJxOiXUYQC27gaw_+s5OpQxdUmp0Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250716_101520_665672_D75D8AC2 
X-CRM114-Status: GOOD (  32.16  )
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

On Wed, Jul 16, 2025 at 2:20=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Jul 16, 2025, at 04:28, Guomin chen wrote:
> > On Tue, Jul 15, 2025 at 05:11:01PM -0500, Jassi Brar wrote:
> >> On Mon, Jul 14, 2025 at 10:40=E2=80=AFAM Arnd Bergmann <arnd@arndb.de>=
 wrote:
> >> > My main worry here is that the types are all quite different: while
> >> > the doorbell and fast mailboxes are what a lot of other drivers have=
,
> >> > the FIFO mode does not seem to be a good fit for the mailbox subsyst=
em
> >> > but instead looks like a more generic firmware interface with variab=
le
> >> > length messages.
> >> >
> >> > For those, I think a higher-level driver with fixed data structures
> >> > passed through the hardware interface seems more appropriate.
> >> >
> >> Yes. But sometimes when the data structures of a protocol are not
> >> bigger than FIFO depth, the platform may choose to use the FIFO mode.
> >> I see it as platform dependent.
> >>
> >> > Are there any other mailbox drivers that just use the mailbox to
> >> > tunnel variable-length messages?
> >> >
> >> From a quick look, Armada 37xx and Hi6220 have fifo though they fill
> >> them up fully for each transfer.
> >>
> > Yes, both Armada 37xx and Hi6220 support FIFO functionality, and they
> > fill the FIFO with each transfer.
> >
> > Since the cix mailbox hardware supports messages with a maximum length
> > of 128 bytes, different clients transmit messages of varying lengths,
> > such as the cix DSP using 8 bytes, the cix sensorhub using 12 bytes, et=
c.
> >
> > Therefore, the cix mailbox driver has been modified to support variable=
-
> > length messages of up to 128 bytes. This allows for more compact and
> > flexible support of various clients.
>
> Thanks, this makes sense to me, and I have no other objections if
> this is an established way to use the subsystem. I wonder if there
> is a way to abstract it further though, since it would appear that
> the same thing should be possible on any device that has a FIFO
> to buffer more than a single fixed-length message.
>
> Jassi, are there any remaining issues on your side that need to
> be fixed before merging the initial driver? It would be nice if I
> could merge all nine patches through the soc tree for 6.17 if the
> current version, or a feature-reduced variant of the mailbox
> driver is ok.
>
I have pointed out some, and Guomin said there is a revision coming.
That should be good.

-j

