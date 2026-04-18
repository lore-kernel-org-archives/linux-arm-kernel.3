Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E42F99C63
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 02:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTpB3zFGMA4+49UPAPJnoMPYvm1cGwiY/ChissLecvk=; b=epDmP+qA7E0C3TQkwsLG1jr+5y
	DWKnVcTBNguvvGUC2gvusaafp/RRVOJXXFChWbY2W4IGvqxekdTB3So63D3XueFGRsoI1NoXClV+K
	2+TSnhGbQT0ir9jZQbfsDKc2cO9px1paL+cLIEm9mnhml8IPkz44J6ZPMVp8rJz+TCdUyLrYoiZHS
	tDyLVOlHUEZWEabTXE7h78DFrycdq7XMYSzOHars7dhmZ68rQKmTU4qZQQaxcOT3McJjH6rCmRXqn
	67LLpuRZjTpHDU7UBRMH7iKPa5ZrY8XyGCU1IQqbhImbZ5chqpBBxwu0sMPe3NtoXSs+LczohE+V0
	YqzCIDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDvlA-00000004gm5-1VCc;
	Sat, 18 Apr 2026 02:50:16 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDvl7-00000004glN-2diW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 02:50:14 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6841e6a5e51so737235eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 19:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776480612; cv=none;
        d=google.com; s=arc-20240605;
        b=RgG3+qEo2EIpyNPqHgSRot9NhtDFou0rXyOxee3XGuUYFQponl9+63OPpd22m5EUYf
         GLy3iZ5P/Rm3SxS9Mk8EhZa3RgaoC4/9jOLrvcHApjnxCDNw7CbjhKGhMceZxRfl6IRH
         5K/4qD7F2ebcBQqbUgAhvG5+sRYroY4wdZJAjHa2vNpKbcQZvSV1PeONbMH0Fkr3rim9
         CrOwFmZcOfv0Oeo2IiTN/ayFfGI1aHqHulP/2ps6nSFs1rIA7rx/UQN3xyQPGDlngXbz
         NS6zrbVg2EyNQW6borD8tYw1R6jCWySVwCG3w6MIrDhMtp3YIZOHUBZbNP9O6CxcaJ9I
         WyJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sTpB3zFGMA4+49UPAPJnoMPYvm1cGwiY/ChissLecvk=;
        fh=nKTFCjppX3krNj57EBQw6kKE79G+17s656o1mPfgSRM=;
        b=Vc9h1auxsUm0B+PA6hETJCptirOmwwb0rCc7FrGBohYCdai2il6Pn06SiH2gMTZgyh
         /Bp98ka/HGLz3rTzN24s1+yv67OS8W4+jWSR3vrECWPNmVO3wu3GG6PZaFLrWF2F8cpy
         GyHWiNm0km5fi2brRGGpwJJgh8S8BHICiH6dOlNVUxnwtIwE3VT0cvebKHyGLYzYAvXT
         +vn+WixP6NIw4z0fNDxKGuw7cnpGBSRMA2D+GUjeXzEJApgQBA/EEHEgPTdtolhjJWTr
         VEmX5NDZ084RDN9useikYzw216P73Ll9D1fEBmH7CsP+6iu2ZWOR2uTU71jdl1CTp3Ke
         l/AA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776480612; x=1777085412; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTpB3zFGMA4+49UPAPJnoMPYvm1cGwiY/ChissLecvk=;
        b=P7xouFs8W6yXnEEbU2r4HZ5hd1Sy5kolztxFpifyfqjcULdgi4Ey/nQJM/OXzYrOa+
         b8D9RF4Dz2S4BgKGgOHWj/QQcomj1DNi67ZB+wXpBcqC0q9tr7Ka+5GFtFp79MP6BFdd
         c/kCW+WyvABBEEycryp1ayJA3eUSlXcQjVI6Rk5OYPSr193ZJ1D4SxgSu98N/8PqMC0e
         15v0rcqc1RK6dDMy13vhIw/En/SefcvNlb0wOvGs+t7GqvQ3rkdnPJw10Bn0dzRte1g7
         EbE+E8OJCKrtBtDR/hphiVUfxEr+tENcEXIqNVoSqgD9jgv0HHMTsDPtvQREZC22ez0Q
         3ayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776480612; x=1777085412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTpB3zFGMA4+49UPAPJnoMPYvm1cGwiY/ChissLecvk=;
        b=Bg7YOV4frUZ44WLRBBUsbII4qkSbjxOCMaVkdo9HHpnOH9IUfiaSwBkWEfQlUKgC+E
         8tnx4EbfnE76N8zsbWUHdNF5e5VFNh8xLPP3Geb+U2RU0AfUMKUVPES0IwMug1Y0TTkU
         ljq0uUI6BMrY6j9O0G5du5g2ABngVKvGB4oJvong4rIIbRG20lyf2LBxndyLFaipbmjH
         bRYvPbHHJtNsav3aqt/8L3q32yiOLMvObZ9/1CShR7P1X2PvVsiz7Nztt9ndDpKSCZkj
         Gf0gZPzBZUOg9b5pUAuF5auU1drhFc083uUxTF9fzqobO+26T4CDMq3iRFajW/gCVCWR
         vQ/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8qOl+7vIhjllrkujBa0UixVbRl5DQq1ffyVhMXVKqi7Tx8/3em0BFQhXpDxoplG9TJFanwaPrTjGfnBByLIZjy@lists.infradead.org
X-Gm-Message-State: AOJu0YyLx6gb2LiWjyO2C7Un12CboSARQ82cGxpDjqxBAmIe5hZT4kfs
	UXVWP/kqoNHle2kPcdZ4dpwz7zTdSJEqDQksC0fU6yFSP/+uoEm28rlGaQIHwtFYOlT+IM2bJjn
	MWU7zoEFJwZDSnMGRsJqzBEUvG5YtBLk=
X-Gm-Gg: AeBDievhfWGt1q1PYUhSD5g1MnO1EwBiyR8iLNKOJL6NPAvnjMrP+KY5RMEJCG//498
	2iGGknmeS4fZ3QiaaNz24spNkwoMe1Z4pUbjLU6q/XCckNcoxsALhcnuK+xkrXJFU4z3xiboNCv
	itNM/Umb3fUikO4X8yncN5Xd4YvFWNxoAOpzCDGyBxl/KYTPNxIT6XROVlOgDVM/fHVUGrDb0t1
	Zr45ywr6GlWyESj/h5UmR4O0Wc5GOmowzPi8y+wXwRKfPbx57owAD2p4g1LH0Y6ik0+uTohGjVl
	e+F2jV3dYc/mwOw/Nkg=
X-Received: by 2002:a05:6820:604:b0:689:7cd7:259e with SMTP id
 006d021491bc7-69462f44c08mr3366697eaf.57.1776480611628; Fri, 17 Apr 2026
 19:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
 <20260417084335.2092188-1-joonwonkang@google.com>
In-Reply-To: <20260417084335.2092188-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 17 Apr 2026 21:50:00 -0500
X-Gm-Features: AQROBzBa_VS1wWtSKDMjmtBp02-qplt4Nx2TejF_JEV5fvEqT0eLpBXx6xGnZnk
Message-ID: <CABb+yY2yBZ+hgr-=Uh_sRk-TJZRfsk2AYtoS5rPtUN8kVsUScA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
To: Joonwon Kang <joonwonkang@google.com>
Cc: akpm@linux-foundation.org, angelogioacchino.delregno@collabora.com, 
	jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, matthias.bgg@gmail.com, stable@vger.kernel.org, 
	thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_195013_672930_798B3C16 
X-CRM114-Status: GOOD (  34.13  )
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

On Fri, Apr 17, 2026 at 3:43=E2=80=AFAM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> > On Fri, Apr 3, 2026 at 10:19=E2=80=AFAM Joonwon Kang <joonwonkang@googl=
e.com> wrote:
> > >
> > > > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@g=
oogle.com> wrote:
> > > > >
> > > > > When the mailbox controller failed transmitting message, the erro=
r code
> > > > > was only passed to the client's tx done handler and not to
> > > > > mbox_send_message(). For this reason, the function could return a=
 false
> > > > > success. This commit resolves the issue by introducing the tx sta=
tus and
> > > > > checking it before mbox_send_message() returns.
> > > > >
> > > > Can you please share the scenario when this becomes necessary? This
> > > > can potentially change the ground underneath some clients, so we ha=
ve
> > > > to be sure this is really useful.
> > >
> > > I would say the problem here is generic enough to apply to all the ca=
ses where
> > > the send result needs to be checked. Since the return value of the se=
nd API is
> > > not the real send result, any users who believe that this blocking se=
nd API
> > > will return the real send result could fall for that. For example, us=
ers may
> > > think the send was successful even though it was not actually. I beli=
eve it is
> > > uncommon that users have to register a callback solely to get the sen=
d result
> > > even though they are using the blocking send API already. Also, I gue=
ss there
> > > is no special reason why only the mailbox send API should work this w=
ay among
> > > other typical blocking send APIs. For these reasons, this patch makes=
 the send
> > > API return the real send result. This way, users will not need to reg=
ister the
> > > redundant callback and I think the return value will align with their=
 common
> > > expectation.
> > >
> > Clients submit a message into the Mailbox subsystem to be sent out to
> > the remote side which can happen immediately or later.
> > If submission fails, clients get immediately notified. If transmission
> > fails (which is now internal to the subsystem) it is reported to the
> > client by a callback.
> > If the API was called mbox_submit_message (which it actually is)
> > instead of mbox_send_message, there would be no confusion.
> > We can argue how good/bad the current implementation is, but the fact
> > is that it is here. And I am reluctant to cause churn without good
> > reason.
> > Again, as I said, any, _legal_, setup scenario will help me come over
> > my reluctance.
> >
> > Thanks
> > Jassi
>
> Hi Jassi, can we continue discussing this issue from where we left off la=
st
> time?
>
Long passionate essays are difficult to read, so I haven't yet. A
simple description of some setup that you think is not supported, will
keep the discussion focused.
If your platform is supported but you think the api is not clear,
updates to the documentation are welcome

Thanks,
Jassi

