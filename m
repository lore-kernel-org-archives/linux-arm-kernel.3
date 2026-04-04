Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3B0E88D9B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 12:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1l0x4W+UvoXzUmEv9e5e/HxO0/QK/ip62Tt8sY3EdQ=; b=lyAD//CSkXIqJUxGj2e/vbwnMb
	uEJpcfFyF1UjCtcanQYUWExcY78WlBimvA313U4xMA8e3R9HqmbkKnjcDpv2H5toRud07/3ddR/Zb
	Z6uyMMlSSkBR2iJu3zC1P5e8+qQY9TX5aaMX/S94Y4uYfFxUKQodxwpUpcf9+8aqsv4TypSV3mNKX
	KTq78TyVtBZ/uu1MkPwgf+AcxLBV5hVMlKw9ulwPwuWhMvgtOXg3z4TUJFBOK8G3WqJDJX5E597pX
	HIyvB8b4gzgb11asHrJS1UurHDbrOJSTyx/iQzCbTWrnnGvBF9Mfc3H6MK0ufsJYJKkYxfxanEmHD
	KVO40EEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w90Mc-00000003T1C-1Vg5;
	Sat, 04 Apr 2026 12:44:34 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w90Ma-00000003T0O-1ZQE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 12:44:33 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b2523e0299so71929285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775306671; x=1775911471; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1l0x4W+UvoXzUmEv9e5e/HxO0/QK/ip62Tt8sY3EdQ=;
        b=TwEMInUe8aIZJ6HVJRm+fVBXwSaeTtdtoF5rlMQm5+7mrt/DrMbJ1tG/RedcWoo6s5
         BbVWB6x7j8v6zA/fFlRbXD6IYzcIhoGZhT9P0TWYJUrqirFzLyF50GE/mCeZoLmbwqqi
         VArRvv4QJCixrX/fRYD8NGg7e1ZrWi4irOm+zRXGjp9/RUqADQ/BQXWZnMvjdBeRDfMw
         Xfffty/BMp3sEUrfc7aNl36Rn46Rs1LWGkwgN+B/BGFwiocUOoQ2g0s9VwcCrl7/QUPy
         Jb6bjoSywUPF9f9ed6hzb17JwqJI3fIJuM/vbuORH672XAMoyFkxVADzxp6/Q3C0y4Rm
         Yh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775306671; x=1775911471;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q1l0x4W+UvoXzUmEv9e5e/HxO0/QK/ip62Tt8sY3EdQ=;
        b=RR5+oVJiVcVHLdw440j3VJWoeSY7nbbrNgeEoJ9wUE3mMop91Ju5BEdby0hk5ELhxT
         n5kbxVwd7eZyFv62k9xmh5grW1CX5snix6xmJAJLNGYxYS9kkHKnwu6/bblrBzZIMRP/
         m1cZRoBEndFgMqf1LwBFWbrArpPBClBMNsPnNFZjACeatlRDfwOaSdr+N5SK96efPN+q
         m/Z1zuGegVqxCbXviv8+Qg3XS2sejOnodoBBHtc1kh2opsbp3kNESzyAVIyqjcA9Yakq
         fgXKvGiNlb8olJ7hsVrP2VJa3Kz89T/4j4MdsOCmTbm79zcJP9u9n7Ev/nnFYKVi4YP/
         JoOw==
X-Forwarded-Encrypted: i=1; AJvYcCUItybMkWgsbCYk9CrckAfJgiL5cKyPGRUS85jQkl5Dxb24XTdsKWcNUuBRCh67A7QS1NS04312vXUx49G2soUB@lists.infradead.org
X-Gm-Message-State: AOJu0YwImPZ3kgF//ReWjyDmgF4GdTJycCSsEBIeLj8RLRnliK5bZbOO
	kxYQHwA1f6nnhM0d8s/WO0NbAc7ARI4KzB6bEotOOPw2VLMZDpMc6dP/nbeunlS3dW/N641jFii
	9w/n8Q5Rt8+KXu1YVJg57KyC6lw==
X-Received: from plwg14.prod.google.com ([2002:a17:902:f74e:b0:2b0:5b0d:f4db])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e748:b0:2b2:50bd:83b3 with SMTP id d9443c01a7336-2b281706f12mr64261875ad.10.1775306670477;
 Sat, 04 Apr 2026 05:44:30 -0700 (PDT)
Date: Sat,  4 Apr 2026 12:44:27 +0000
In-Reply-To: <CABb+yY0uDQh-3cadPQONV=NJKjMtc4mJekgjmHYVaHnfHXvGZQ@mail.gmail.com>
Mime-Version: 1.0
References: <CABb+yY0uDQh-3cadPQONV=NJKjMtc4mJekgjmHYVaHnfHXvGZQ@mail.gmail.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260404124428.3077670-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: angelogioacchino.delregno@collabora.com, jonathanh@nvidia.com, 
	joonwonkang@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, matthias.bgg@gmail.com, stable@vger.kernel.org, 
	thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_054432_408412_FDCA4BEF 
X-CRM114-Status: GOOD (  33.49  )
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

> On Fri, Apr 3, 2026 at 9:51=E2=80=AFAM Joonwon Kang <joonwonkang@google.c=
om> wrote:
> >
> > > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@goo=
gle.com> wrote:
> > > >
> > > > Previously, a sender thread in mbox_send_message() could be woken u=
p at
> > > > a wrong time in blocking mode. It is because there was only a singl=
e
> > > > completion for a channel whereas messages from multiple threads cou=
ld be
> > > > sent in any order; since the shared completion could be signalled i=
n any
> > > > order, it could wake up a wrong sender thread.
> > > >
> > > > This commit resolves the false wake-up issue with the following cha=
nges:
> > > > - Completions are created just as many as the number of concurrent =
sender
> > > >   threads
> > > > - A completion is created on a sender thread's stack
> > > > - Each slot of the message queue, i.e. `msg_data`, contains a point=
er to
> > > >   its target completion
> > > > - tx_tick() signals the completion of the currently active slot of =
the
> > > >   message queue
> > > >
> > > I think I reviewed it already or is this happening on
> > > one-channel-one-client usage? Because mailbox api does not support
> > > channels shared among multiple clients.
> >
> > Yes, this patch is handling the one-channel-one-client usage but when t=
hat
> > single channel is shared between multiple threads.
>=20
> hmm.... how is this not single-channel-multiple-clients ?
> A channel is returned as an opaque token to the clients, if that
> client shares that with other threads - they will race.

They will race because of the current blocking mode implementation. With th=
is
patch, they should not race as it handles the known racing point. So, I thi=
nk
it will be important to decide whether to support multi-threads in blocking
mode or not.

> It is the job of the original client to serialize its threads' access
> to the channel.

I can see the disparity with the non-blocking mode here. Currently, the cli=
ent
does not need to serialize its threads' access to the channel in non-blocki=
ng
mode whereas it needs to in blocking mode. It would be nice if the client d=
oes
not need to in both modes, but it may also depend on the necessity as you s=
aid.

> > From my understanding, the
> > discussion back then ended with how to circumvent the issue rather than=
 whether
> > we will eventually solve this in the mailbox framework or not, and if y=
es, how
> > we will, and if not, why.
>=20
> It will be interesting to see how many current clients actually need
> to share channels. If there are enough, it makes sense to implement
> some helper api
> on top of existing code, instead of changing its nature totally.

I agree that we may need research on the current uses of channels and the
necessity of shared channels. However, it may require non-trivial amount of
time since it requires thorough understanding of the context of every clien=
t
driver. At this point, I think we at least need a clear documentation in te=
rms
of multi-threads support as we have none now. Since it is obvious that
multi-threads is not supported for now, I can create another patch to add t=
his
to the API doc to be clear. How do you think?

Thanks,
Joonwon Kang

