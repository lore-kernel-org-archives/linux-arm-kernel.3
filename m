Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549E1CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 19:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmazQOFb88cZY29BLbashgs+FNWCLfkAyMKJs7RtEhE=; b=INQVQa9TM0w0XSroWzmLQ3zgSh
	sP3+MsUlJ7aSj7iBL2ESPqgfkmpehvTWhC6KukfAVulPtNk12MMsFYZs7Pv5gsGYRIo7/jfcvtASt
	u4Bn+XfOXdtw2IHS/sdGWSD7CLddOcvvQSbscXwZXmbWlE4bpv8wx5OnAidWhlavZfFD5WKP8GvE0
	vvGorfCP83C/g92nh/N5COayC13UKBNyZCJNN9KkTB9YvAWbfLWn5BspZrXRvagx5Y8UCz5ltWf37
	KK1/ePva2jxD+1UpWi1PyBHkar8mP8eMbC3YRNu8Ysd8Ok3Eh5jm6ti2dCRjxqK17XCeoUmaciSzb
	HgSNMwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEXMu-000000032Mf-0f06;
	Wed, 07 Oct 2026 19:32:00 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEXMq-000000032MI-2UbO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 19:31:58 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-5dd8bbb2175so1830213e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 12:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791401515; cv=none;
        d=google.com; s=arc-20260327;
        b=N0ZwlE+/zYsmJpO0Jr4VHOrOuUeaD2+N5B53u4nptISgstjIFqZuPsKnxnIyU1A+VU
         caRx+j93TRISThMZPByeidp4UunytfcFDsvJ8OliWXhfZ9H1ATgKNv8DGmpF6R3lOou5
         oHvDR51jWviB83LhNpUvT+GcyMkAwGVWpqtcSBYGKEihmcCrRw38TOEQyJIdDG027eY3
         yJrlBWvSyPznJLQA8uzsga190kMfc/ospbjUErpySIal8m67OV7OnogNwzqWUWlx8MF4
         EYqBTHuZVaboGrK410A5oiiHk4+wpPQZ2DUfo2s5nHJArZDWyD1vyg+btvb/x2JbFb/8
         OydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UmazQOFb88cZY29BLbashgs+FNWCLfkAyMKJs7RtEhE=;
        fh=zo0rgedYxuGDKSHmKLlUgD7lO0N5Vaaj7NMnue5F91M=;
        b=ffuL4/DGPwGbZ4A1xkARxsbhU28xEMwWeA9QKyLJWXcETiHBv/FR7qmVEvMKxL4MR4
         QV2HuoSI/1zcnR6+4NDtm/iwFFAnY221c90Cy97fMGUi6y7QfCewvnPHrg7Umw0u+ZRe
         eyDw7n3mneB6yM5FT85sPuVZtXsjdNjSLLYdBG1EGHEaD0z2yEvawXq99xHaXegUQvm5
         sV0uJUXTRLuOdd6RskbiY9TUY2e5byF3iIvew9+v6Gfw4s6yjXso6fP1LdAwNr/c82Zy
         gbi4b1vyQVODPb37RBTgoaFx22hCMPvV0zRV/mZa0bfzOKIuSCTZJjNQXPXOBC7zYtqV
         EzBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791401515; x=1792006315; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UmazQOFb88cZY29BLbashgs+FNWCLfkAyMKJs7RtEhE=;
        b=LYLhuqVCpxSFl0Vvn6DJKJWto4Cz+1poCm3cNT9dkExndv42jLkgMUH1eTODlmfAzI
         VTFU8qxEr8aDWPbZFODZzkVwer3hLvvI0fJ7BcRqxmEl8RzgjVYQG652UJn1JVD0ZMzn
         Gc22toCfDxH2nPRK2lr+M51GKRh2/rKCjS1Dn8UeCzj41bt0djJtY8WrYowzVZPoifSF
         EPCFBn2EMd8DfZ/ILKV33bmNdIF4L787sEufPaoG1yaaS+uwAiq2eAchzJ/PCRX34w4V
         sP7z2191d9H/o6SHRVWlBd2ydzZiw07rIwirVhLWc4nwh1XQ+dJfkJkGzXXo69IK3G9Y
         KVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791401515; x=1792006315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmazQOFb88cZY29BLbashgs+FNWCLfkAyMKJs7RtEhE=;
        b=VbAveBxAdV52zeM8eHHYyf4J/55D33ETcE1hHTxkpKFs/vJMF1OpvdohtVaDjxvvBB
         YIepev5GUNmR3uvQKyTBBMjr5Fq0iK0ebI1bX1zrRQe6u19Yb6R1NETJBx9GsfY1nsiT
         6eEiZ8iSS+/XeeWurYgNWkHnpZAUTq7eX6/klSoAZteeprVn4qSDP0/raGi6pxYLDalq
         +VzXTOWH0djSUtRhl+p/xpNDFLSIQS1YYF9jlobWVE7kaEm2mogwjrOT3GNum3OX92//
         mfi7SxqzdJhBXd6P5IGw9FFP6i6Z2kmTettiAY+thodU/wJuwUEYyL8YMxC8bkNs4HkX
         j3HA==
X-Forwarded-Encrypted: i=1; AKwUvBxSF2ZHOU2l+yxp6Hd7fDRlCfxU/+6lcKbPTlsN1xLStccsacyXOl2Up9KxXsmp/cVG0/Yy7ggoFZqyZkZsBqiu@lists.infradead.org
X-Gm-Message-State: AFq9FYI3816LCe1PEqcy2C40VWTqAK2ElcnIbpS8IUNfAsRFGyfceAVT
	HJcvCeCTX+k1RF84m5GqiPx32be0DQS1KmTPAi50pcuNz3Ib1JMKdzl0SzKww15KVzbpcqWwk3h
	AFF6mEgGv+fp0vsCNbFVCYHRF5AYWu2k=
X-Gm-Gg: AYBFou3jX95SkRt1FZjAdfQpKL/UzOvK8bJI1V7tr+oNTy7u0Jr4SZMItXdh4bq4Fh7
	r9KzPI6+R9cJHZMhJ88XCeIUNSzrKpmrgQ8R/DRts+46E9l7fh4NClNS1ehWJU1MQoigRmavDOw
	lhoXEQ5VmOrF7W7Pavf6tr/ahYewjXAxVXrWPV1fSsl7P2sOJtHOebqSjfFB1vJf4lCgPpO6Cwh
	wauGEB/HfE26ClLt+7JSWP1PvMUKoShRYwDxx48pf0siXVk4KsZxUhwdsKJbEgvO1S9fmEVDab6
	c7viv+C4cxjlCTukRML7tp6YZxu2kajBOVv7XWnksCaO43HTBwg94LZ272wsRdkpDbkHxCwMzLA
	5FZMuEQy+A2F1yv9JTttK3DuFhVzp0XL/xVxyIUUQaZ3/JWssgB2qVq55te4SM8G4cxqhYxZw7D
	pK5JBL8QNJYCKkLbQIsNkWGdzUjDI6nBw8t8Mc0ww6H1ib
X-Received: by 2002:a05:6102:a4c:b0:7c8:3b8c:82b8 with SMTP id
 ada2fe7eead31-7ca38b6e963mr1119834137.17.1791401515148; Wed, 07 Oct 2026
 12:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
 <179127056620.2231598.8882282421523696709@kernel.org> <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
 <20261006155214.63c5cb5b@kernel.org> <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
 <e7fea95d-1ce2-4c5a-891d-5e5899931329@lunn.ch> <CADvTj4pm8fbgGDiyXVHubnM93qOey7o18O+MDU68MSisXVvHtw@mail.gmail.com>
 <f304ee6d-bbc2-4f76-964a-998c3febb8dc@lunn.ch> <CADvTj4pniuLUzsHP_kv03rFUkUD87PD9yVZ=HnW0CsZX78OxLQ@mail.gmail.com>
 <98a7f952-37cd-4886-acb2-e87743e51fba@lunn.ch>
In-Reply-To: <98a7f952-37cd-4886-acb2-e87743e51fba@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 7 Oct 2026 13:31:43 -0600
X-Gm-Features: AclHuK-r6Ggh8hcrYXS3hhyuBupmyUJCn-QYPzqWblWY-KLgPSt5UCA_gEavD14
Message-ID: <CADvTj4ozfxA3E13g5sV2tPogDk=S+VOyf_PAXZVQyaozoe3O0w@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Nicolai Buchwitz <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_123157_039746_9AFD3845 
X-CRM114-Status: GOOD (  27.51  )
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

On Wed, Oct 7, 2026 at 12:33=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Oct 07, 2026 at 11:00:50AM -0600, James Hilliard wrote:
> > On Wed, Oct 7, 2026 at 6:46=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > On Tue, Oct 06, 2026 at 07:27:05PM -0600, James Hilliard wrote:
> > > > On Tue, Oct 6, 2026 at 6:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch>=
 wrote:
> > > > >
> > > > > On Tue, Oct 06, 2026 at 05:17:20PM -0600, James Hilliard wrote:
> > > > > > On Tue, Oct 6, 2026 at 4:52=E2=80=AFPM Jakub Kicinski <kuba@ker=
nel.org> wrote:
> > > > > > >
> > > > > > > On Tue, 6 Oct 2026 01:14:52 -0600 James Hilliard wrote:
> > > > > > > > > Please do not repost the series just to address the above=
. Instead,
> > > > > > > > > reply to this email with the missing information, so that=
 reviewers
> > > > > > > > > can take it into account. If the series needs another rev=
ision for
> > > > > > > > > other reasons, please include the information in the comm=
it messages
> > > > > > > > > then.
> > > > > > >
> > > > > > > Please make sure you read this paragraph, to the end.
> > > > > >
> > > > > > How much detail should I be including?
> > > > >
> > > > > We want to decide should the patch go to net, because it is a rea=
l
> > > > > problem which bothers somebody. Or is it a theoretical problem wh=
ich
> > > > > will never happen, so we might want net-next, or maybe /dev/null.
> > > >
> > > > I mean, it's in an error handling pathway that could be hit if ther=
e's
> > > > an -ENOMEM error on an IRQ-action allocation.
> > >
> > > ENOMEM does not happen for small allocations.
> > >
> > > https://lwn.net/Articles/627419/
> > >
> > > So at first glance, this seems totally theoretical, it will never
> > > happen. So net-next, no need for a Fixes tag, etc.
> >
> > It looks like there might be a few other ways to hit this cleanup pathw=
ay,
> > not sure how plausible this is in practice however.
>
> So lets go for net-next. If anybody hits this for real, we can
> backport the change to stable.

Should I re-spin this on net-next with the fixes tag dropped? Or does
this apply as-is on net-next?

>
>          Andrew

