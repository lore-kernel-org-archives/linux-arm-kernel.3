Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A795CE85367
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsueJAB8iWMZmH12hTqYKPYVxfUoBPtsPuD5qctzJns=; b=ggYPQTQyJGBFyTWg3kUkeIglwZ
	ZQ2ELcAPCy/YR1ZuJZMR6FnCa/h5JyP3bU7iC4DpvIrSnXEWiV51Xbavx/DqeyiZefKkVjYPvymAJ
	WV+TRZfpOZZ+7OIgbxGjOSgSFvGOwUO0AO+4PT4qOCOY2L6neSb/ejl/tiWTiJBk5TH4az7XcFtkB
	kKw1Ck2c5cq1+Oct9G8jH/0soiTqSKh6OktoWBIZBY+yl0GBDWc/wLz6l8ioCHjD+vYXKAYcP6kkC
	LJvNfvo4nqD0+zm9LfTw2prmiWNASEzacFD8dsn/hBHFUBxuGT8WEsimwepwgQiOuwhffaQA907bo
	MhZOWW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fro-00000002Aif-0zqE;
	Fri, 03 Apr 2026 14:51:24 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8frm-00000002Ai2-39Lm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:51:23 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b0b0aae381so20722035ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775227881; x=1775832681; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UsueJAB8iWMZmH12hTqYKPYVxfUoBPtsPuD5qctzJns=;
        b=HJCrItKAvttm+Jv6Kb5ktB8DwJU0518nYXHijn/Rz7LB+Zrt015lBFVNioNkPHNhXp
         +HrsMhJcQMozx3dFgmuIwpgqfzE74g1nfZXvLhKbtOGPapdZL7zYt9IDx5dplB0wM2g8
         v19hectQerDEsjajayKYcKHp0dpte9Lbk2eGOzov+Q9QrOl14NQk7NBI2CZEOYgKQ4kC
         M8N6a/HXXU8ffRQYVMIvF6trxcPSYumlKJnB/Nc8w0o3WOeudFVO+6reCQyKKTLfzBYK
         8wxrfix7/oucCOR2S0kNBmiosS6qxC08i5lNR0bmaVDRmCo0ILTDUqri8RlE5E4OzjY0
         bQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227881; x=1775832681;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UsueJAB8iWMZmH12hTqYKPYVxfUoBPtsPuD5qctzJns=;
        b=SQZheuJzKsnmzy5cPwBfkYuUP9TXbzJPR98gnqqRZT9iELaKgrYlC3W13lf1rEUml6
         6y8X03B/3JJWVnXjgHrLHReOaUfYsBU85YKxk1hqrWVmArajoGAKyW48ZeSfSVVvA02s
         1XMbrNz4W8zXv2La739J6xPleTStHd7mFz6iWT8tk1aLfTxlKT2dA1J/aTYmz+cyl3mR
         f+YiH7mePTWJzKSi1qD7aFtEeV3rWWvjmi5AWXOSq5Ab/EmKSF2yHZiwWl9CQ36IflJL
         4xyR10Q+b6hroEauRvAYaMypY7MNCK4EQ0+/okEUE8NPiDC/b+X8wYRM435MrJ1eVdZ3
         gu9g==
X-Forwarded-Encrypted: i=1; AJvYcCWUt0Wg4bpx/3Qev+lWslMa2qorL/KWlBor5aSOAxFbY9nneglMG5REW/90vU5jH0rrCWqbS/UiGUqVMS9K3nSM@lists.infradead.org
X-Gm-Message-State: AOJu0YybNrIolSJ4timGCwbyS8CwVZFdqi+SVnxerQyHzligpj+bwtUT
	JD9GbAq6c6A/w/o3hzx06jGfsoizwnFST9Vya02CmKKIUQIX1dNMvHV9kImACtlPlYxExqhY+Bv
	FsTWoTa4XRMB12gE07GLUk4Dwmg==
X-Received: from plblw8.prod.google.com ([2002:a17:903:2ac8:b0:2b0:af9b:aa3c])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2ac5:b0:2b2:42da:25cc with SMTP id d9443c01a7336-2b28163ad55mr35530115ad.1.1775227881118;
 Fri, 03 Apr 2026 07:51:21 -0700 (PDT)
Date: Fri,  3 Apr 2026 14:51:18 +0000
In-Reply-To: <CABb+yY0ub51k-eFpPfgARXtwYjWzRSjbPDLtoMD77YQR8JH+=Q@mail.gmail.com>
Mime-Version: 1.0
References: <CABb+yY0ub51k-eFpPfgARXtwYjWzRSjbPDLtoMD77YQR8JH+=Q@mail.gmail.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403145119.2581034-1-joonwonkang@google.com>
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
X-CRM114-CacheID: sfid-20260403_075122_799036_4CEAFF66 
X-CRM114-Status: GOOD (  20.35  )
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

> On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@google.=
com> wrote:
> >
> > Previously, a sender thread in mbox_send_message() could be woken up at
> > a wrong time in blocking mode. It is because there was only a single
> > completion for a channel whereas messages from multiple threads could b=
e
> > sent in any order; since the shared completion could be signalled in an=
y
> > order, it could wake up a wrong sender thread.
> >
> > This commit resolves the false wake-up issue with the following changes=
:
> > - Completions are created just as many as the number of concurrent send=
er
> >   threads
> > - A completion is created on a sender thread's stack
> > - Each slot of the message queue, i.e. `msg_data`, contains a pointer t=
o
> >   its target completion
> > - tx_tick() signals the completion of the currently active slot of the
> >   message queue
> >
> I think I reviewed it already or is this happening on
> one-channel-one-client usage? Because mailbox api does not support
> channels shared among multiple clients.

Yes, this patch is handling the one-channel-one-client usage but when that
single channel is shared between multiple threads. From my understanding, t=
he
discussion back then ended with how to circumvent the issue rather than whe=
ther
we will eventually solve this in the mailbox framework or not, and if yes, =
how
we will, and if not, why. I think it should still be resolved in the framew=
ork
for the reasons in the cover letter. Could you help to give a second review
with regards to those aspects?

Thanks,
Joonwon Kang

