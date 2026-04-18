Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60848F99C73
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+ETtzwm86y2ubyHKvTZyBSdg3SjvxcOgxe973ohm5w=; b=YWou6RAcldOVCRua5QUJxWreaJ
	JdIK2ELTkMJrdIPfQYgCrLYAerHYasgeYb0aZbkkeXHrFh7JOsrph2Sm9DOusyMOKXknUSW6619GU
	bTZ5umrdcRbMnDH3LYX4tbz1nltdRZjth1hkkwbhzRCqXO5P5qbMHmFqM5j2YOkOIZQC7C1409+EA
	/t58Rgm3a1Lvm9dpJ56JL/Qhxd9FHCTqJkISCvCghVsJaTJQuTPBcGecZZaIdloBkcoBlOBKABzRk
	ChimTI2JiPWS8ifOoaX4Mm7Cagd45iFZhuDImnD4hH0WHIrjSvHQ2SnVhNXRzwx+efFEEyOAgdUkp
	W6s6zsnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDwWS-00000004i6W-2NSV;
	Sat, 18 Apr 2026 03:39:08 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDwWO-00000004i5f-3pUS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 03:39:06 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so750373a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 20:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776483543; x=1777088343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+ETtzwm86y2ubyHKvTZyBSdg3SjvxcOgxe973ohm5w=;
        b=sHwSnBuUdOE6NYJlTrmyIQVgahl3OAL2p6r5aIWY4c98UKT+++YwChzTaa9HBMwSuF
         IPsvCYc1WfqEiUO/czTm01lo0j87feT1ePP1JX7Nv5vYNtltBy+2Rko3gp05jo4VsnhA
         JA13RPyIJwWVyB3iGk1Rdr9++ZftgurOzfuXurkbyIrG6KYi0IaHz1gksWGWBd9jTkxT
         Imrasvba/MQ/8rzYU4iY4NCw00Ok2rIw8g5OEqmnjW91YOWy8Iqje2c8+6uDZOEzztk9
         fht347KLDEeALh8BbRPtWnbS0sZGololOguuRYjmGXttTaMph+3eF9HgzZi3tIrD2klD
         lNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776483543; x=1777088343;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G+ETtzwm86y2ubyHKvTZyBSdg3SjvxcOgxe973ohm5w=;
        b=q7PlLSbJKPKohJ0mD9GR3+n64seaAmPh89YWGVW8nstsA+5rxSRyXnrD1uUZ5wpZ56
         g1ehRMK+km9EpgWRFJ11vmU2O5DAbxQOxucChlUkyIUHAd4/++RvVlf86kcXT6N19tKy
         RRXnrapVI+fzZ33B7R3kaQwwJmVpm5H7UfcO2bWTs+bbMYgpeItBTDQf3J/+So9eDfIO
         5ITc3zQCP/XijK/tWLDZa0lniC9f/vnFspsKahDpIWimVgkZQwdEkPQP62rc336nysfI
         tlWLGQwjPR05lun+KyiBmzgX6WTQkYUrxosq7AgJoiyXIin6IAR/Dww9ADEsO81wDTI1
         MYqg==
X-Forwarded-Encrypted: i=1; AFNElJ93PmFoIrBp7dBNvfbvmhpqbDxpTJzFIDInwUE9STBCyLtwb6ElI+p4WH/F22nOlQk3uVzOxPlZdsQC715NDG7w@lists.infradead.org
X-Gm-Message-State: AOJu0YyWkR28aai1/MsgRkfwfAJAfYATSjuAdNyLEqYaHGRKR3tn9J3R
	89DWQRQVUWPceHQq/3Jn2o14jJZYB7U2GdCNrXyz/qvM0n/z2L2ybVvUTrNVj+UrPKIArw5nic4
	3HkCw6Q0DxG6EoYJ8iOC5kP1Q1A==
X-Received: from pgbfp6.prod.google.com ([2002:a05:6a02:2ce6:b0:c76:a6b1:ed23])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:8088:b0:39f:216:f400 with SMTP id adf61e73a8af0-3a08d708cc3mr4939472637.14.1776483542721;
 Fri, 17 Apr 2026 20:39:02 -0700 (PDT)
Date: Sat, 18 Apr 2026 03:38:59 +0000
In-Reply-To: <CABb+yY2yBZ+hgr-=Uh_sRk-TJZRfsk2AYtoS5rPtUN8kVsUScA@mail.gmail.com>
Mime-Version: 1.0
References: <CABb+yY2yBZ+hgr-=Uh_sRk-TJZRfsk2AYtoS5rPtUN8kVsUScA@mail.gmail.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260418033900.3652042-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: akpm@linux-foundation.org, angelogioacchino.delregno@collabora.com, 
	jonathanh@nvidia.com, joonwonkang@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_203905_094757_52F250DB 
X-CRM114-Status: GOOD (  38.85  )
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

> On Fri, Apr 17, 2026 at 3:43=E2=80=AFAM Joonwon Kang <joonwonkang@google.=
com> wrote:
> >
> > > On Fri, Apr 3, 2026 at 10:19=E2=80=AFAM Joonwon Kang <joonwonkang@goo=
gle.com> wrote:
> > > >
> > > > > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang=
@google.com> wrote:
> > > > > >
> > > > > > When the mailbox controller failed transmitting message, the er=
ror code
> > > > > > was only passed to the client's tx done handler and not to
> > > > > > mbox_send_message(). For this reason, the function could return=
 a false
> > > > > > success. This commit resolves the issue by introducing the tx s=
tatus and
> > > > > > checking it before mbox_send_message() returns.
> > > > > >
> > > > > Can you please share the scenario when this becomes necessary? Th=
is
> > > > > can potentially change the ground underneath some clients, so we =
have
> > > > > to be sure this is really useful.
> > > >
> > > > I would say the problem here is generic enough to apply to all the =
cases where
> > > > the send result needs to be checked. Since the return value of the =
send API is
> > > > not the real send result, any users who believe that this blocking =
send API
> > > > will return the real send result could fall for that. For example, =
users may
> > > > think the send was successful even though it was not actually. I be=
lieve it is
> > > > uncommon that users have to register a callback solely to get the s=
end result
> > > > even though they are using the blocking send API already. Also, I g=
uess there
> > > > is no special reason why only the mailbox send API should work this=
 way among
> > > > other typical blocking send APIs. For these reasons, this patch mak=
es the send
> > > > API return the real send result. This way, users will not need to r=
egister the
> > > > redundant callback and I think the return value will align with the=
ir common
> > > > expectation.
> > > >
> > > Clients submit a message into the Mailbox subsystem to be sent out to
> > > the remote side which can happen immediately or later.
> > > If submission fails, clients get immediately notified. If transmissio=
n
> > > fails (which is now internal to the subsystem) it is reported to the
> > > client by a callback.
> > > If the API was called mbox_submit_message (which it actually is)
> > > instead of mbox_send_message, there would be no confusion.
> > > We can argue how good/bad the current implementation is, but the fact
> > > is that it is here. And I am reluctant to cause churn without good
> > > reason.
> > > Again, as I said, any, _legal_, setup scenario will help me come over
> > > my reluctance.
> > >
> > > Thanks
> > > Jassi
> >
> > Hi Jassi, can we continue discussing this issue from where we left off =
last
> > time?
> >
> Long passionate essays are difficult to read, so I haven't yet. A
> simple description of some setup that you think is not supported, will
> keep the discussion focused.
> If your platform is supported but you think the api is not clear,
> updates to the documentation are welcome

Sorry that it was hard for you to read. The long form was to explain what i=
s
misaligned and problematic with data and examples for better understanding
because your previous long essays did not make much sense to me. Please go
through it and let me know if anything is unclear to you. In the mean time,=
 I
will prepare a new version of patch with some update to the API doc.

Thanks,
Joonwon Kang

