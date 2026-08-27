Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B5BC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 09:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5A5U1mywmc0grhiTqrdHhJFn841cGWgqTfm0zuSxEDs=; b=H3z1Dce7kGbeNz5fzRiL2UwW/Z
	5b+nE/cOHNfYf0zsJgjGlsFG9JSWsYDghbQMIhcmzIds3ou62y8GKwAEecNf7l9MZZwpa/x8otoie
	pGKqcil34ceavnqqV3xKLN6OcSoZidmeEHfjNPYAW1j/yBrWD9JMVSMVpAUiv9Bj6JPeVgNSSPGY7
	A1xARRhAaHFadaKYAnkcg9sj0D//RhzQCJ0fi/9IgDduxWlq+qGOQ0Yd/NNrI49lsg5ZbU1BWeEXw
	W6KM8jpqe/I/5PTXE+YtQWqrhQ1XtAz21OBeiZ650KaI7G4zWT80e2BiUcCiEgRAFtf/QrolwEHNV
	WWbpTOEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzW9A-00000003i9b-0vNQ;
	Thu, 27 Aug 2026 09:11:44 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzW97-00000003i8t-2cZ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 09:11:42 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-936c02e58dfso113914185a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 02:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787821900; cv=none;
        d=google.com; s=arc-20260327;
        b=cLFfH92F87uQb2GEAx7sBsQUHsvt+4PkA1PPhMsJtAUOK+eOTyxFUZjpNexcQG1Tb7
         yvLpqtjAmlRYtJc/e56tO30pCAjJdNccUacRm4YXukHWLVizkNoXtao81UM7X8C1tk2w
         xmLeFe59rYQtjV9DqMw33RJ/e3HpeT23V2KEAk1+yLp/GIH8OSUKMAdHN/0xZrew6JDk
         SnROx8PnN2GO0kJEH3vrTN5UvFxdKg3VdE53XGXIyFsEADfUtBdYFu1XRERI2TdL6jVX
         c6P3ZPalyOiwqcV1WKU643frNm8rx9pPSq+7fhhab4A05rWNdcg9atrbuAoVim/riczp
         9hkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5A5U1mywmc0grhiTqrdHhJFn841cGWgqTfm0zuSxEDs=;
        fh=2nYMsIVFqpgdGjcRXRELmHHh1DjqhQkGCHuc1Ek0hbM=;
        b=pKEzAQoIosxCVOOg0aZQmi96KO9yWwv9iKSIX+J9BRxD0CnKz9DrMLrCAorITbX0QS
         7uZCYVwh6FH0HS7MjhXnqUPwiYuAQxf6lxDJEXAxhN/5TUji9ylUOJYApxs3MtkumGlp
         ij78xsYM8g3mvJ65QuNp2oHlvLPZRha2EiJb3B2DbTFskT0y0wJtAi3bO8gMh2ZpHzNI
         KdQ110AZctvlyFxePARUvbDHB1N6aFieZxVTBNuBkIzXtA4/p/FAu5YssWEWVd6t5cAC
         1ZZI30Zu9gi6p1ksJlcoXpXFQPFkPl9TTNeY2q0fw7lhTxHny9wqa/34hxcvexF1fr0i
         USwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821900; x=1788426700; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5A5U1mywmc0grhiTqrdHhJFn841cGWgqTfm0zuSxEDs=;
        b=dcVIYyn7+EySUaaIREZzvvCimENjz5d5UMyogyatfGfl9u7T3+SerM7QX1rbDgha2T
         IpO04j8BEJuiydlTLW6Izk7KZ6YUeLdTUFPk4LoP6XjUGQwYZty099QNNM/Ir3c1hK/L
         O95/byv9k/ImNJdGIdWQ6PH+dNVivLhn5tSexW5CJuVcc27gDx3VF8WLLJDSYGS7Daid
         p+C0QDdetho2XcObsJwTUW15hZsCDaBSQysbPauC1NhgUas9qp85JMnwUFgq5czuq1sg
         quL9WmWWyiniIjczYFPKIQnrNnMqDl/uULbrOvVdCJ0Gy8VHm2m6yrsz8htuUV0vFFn1
         xseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821900; x=1788426700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5A5U1mywmc0grhiTqrdHhJFn841cGWgqTfm0zuSxEDs=;
        b=slCLlNMdFsizMvF6qEDBbKiU/Dqj/M5Y5oBgEk/cpsiVaLC9Pcv8zR5Ak/MGsOKdA+
         Zhe7tKX/kbthy8S0MjqgC7U6BT1QLuVlig/5fPpRlkg4gHo3n40Qx+1yd0MA+wcHbLlz
         8VgtxbDJKQqEDeAVrw5iB67MA3H7x+DN0tX7pQLKjUJDciKLqgxvG8gJM7ztrdEQ3lx5
         y3HebWqoLjh5r3oKAKzC+iiro6vYJ5NCJdtzkUCLWH/XWkKn2JU/X/53kuDNWzjniw4J
         Xt7WEbuCEnT/WdjHBq0CQIyPyfyLJXJeePi95h4i1c0HPUG7RU2VGVAotY/SypbA3+W8
         ehyw==
X-Forwarded-Encrypted: i=1; AHgh+Rqa0JTwEbi0k7T6K/es/pXSMNFXlEiST07z0Xx/A77lZgiVcFYqYoc4s8VAZquAhOWfdSzwikn5WdKK9Xp8Wlwv@lists.infradead.org
X-Gm-Message-State: AFuF++kJSVa+eBtQ+kETjrqwguEKKSb/bkYQitp1l3b5kz5ayfcRwW5m
	+C1mDVXaJUlE+DCjH3EznT8YHY6n6rsa4lxunIf4yMaO/Mtpo2qgmFByJmKN2lG7oT8Lz6LTMzD
	S80WmVfalHs/saQEl/Z+7CSjijlnVxLA=
X-Gm-Gg: AR+sD12cGnvwKJpQrDuvGH2wGWTR4sXbfiD5C6yIb9rM0FWQCMoqm5Qe8JHRzTtNWMY
	ztMn4JvsAOXh/yEnG7JWMRiTP/qyrT1GLVz3J3w1eyvheBOYSNe5TDFbjUq3avQWtITN+08d+CV
	eca4HHz86XTjc4w6CArmW5ZwKqwGva82Tdrfjs5cyySEczQpwWZmuvWKaEX0nlXkqNEyfQwEUTw
	GSLcTY5FUGj3XsjoLZXuey+m7n2PgywqpMTaTokF/Sh8sArnb8aNfLSwtj9EUk6Wtbb9tbahAT0
	4EtSPKz68bP7atcP2vfs7lUsFgU2z3Yh5Dt3axwbBmM/oc9kCdbL9A1P
X-Received: by 2002:a05:622a:5a19:b0:51c:2022:cef5 with SMTP id
 d75a77b69052e-52e42344bd3mr160664931cf.26.1787821899586; Thu, 27 Aug 2026
 02:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260811072830.10028-1-seanwang1@lenovo.com> <anrzT-ez3b7uYaCt@arm.com>
 <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>
 <anxSsfvpZHHsVnp_@arm.com> <aoX_jiuhv3dyMS-g@arm.com> <CAB8ipk_4Zbhb=azTDGQEQ1S=n2Zhzvqs7pYr6ZfOOWL8meE_4Q@mail.gmail.com>
 <ao_9EiKz9Cmx_YHh@arm.com>
In-Reply-To: <ao_9EiKz9Cmx_YHh@arm.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Thu, 27 Aug 2026 17:11:28 +0800
X-Gm-Features: AcwNN1WMellCGNam0VYOTagPOg-9X9_IhSGS0spY85eL_CK-6sC-A-EA_adMUno
Message-ID: <CAB8ipk9KknqBFeQrDYXAqRxGbM_bjtU0w7Jid95XucnzkgUdkg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3] arm64: topology: add source check in arch_cpu_idle_enter()
To: Beata Michalska <beata.michalska@arm.com>
Cc: Sean Wang1 <seanwang1@lenovo.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "rafael@kernel.org" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lifeng Zheng <zhenglifeng1@huawei.com>, 
	Xuewen Yan <xuewen.yan@unisoc.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sumit Gupta <sumitg@nvidia.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_021141_681890_89F78D0A 
X-CRM114-Status: GOOD (  27.49  )
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

On Thu, Aug 27, 2026 at 5:02=E2=80=AFPM Beata Michalska <beata.michalska@ar=
m.com> wrote:
>
> On Mon, Aug 24, 2026 at 05:21:03PM +0800, Xuewen Yan wrote:
> > On Thu, Aug 20, 2026 at 3:11=E2=80=AFAM Beata Michalska <beata.michalsk=
a@arm.com> wrote:
> > >
> > Should we distinguish between events?
> We could although for this particular issue clearing the source is the on=
e that
> needs attention. But I do not see why we could not have both.
> This was just sharing the idea, not a final patch.
> >
> > > ---
> > >
> > > This is just a rough idea, and needs ironing out the wrinkles, which =
are there,
> > > but that allows leaving the idle enter as is. I also believe this is =
the right
> > > approach for the interface itself, although I also see some drawbacks=
 and
> > > potential issues (in its current state), especially that the function=
ality is
> > > being exposed to modules.
> > > Nevertheless, those are my two cents, untested, just sketched.
> >
> > As an aside, could we verify the functionality of the AMU's
> > SYS_AMEVCNTR0_CONST_EL0 in the current CPU before enabling amu_file?
> > To my knowledge, many chips currently have inaccurate errata in this co=
unter.
> > Alternatively, could we introduce a command line that allows users to
> > dynamically disable this feature?
> >
> > Thanks!
> Do you have any particular issue in mind ?
> So far, from what I have been able to track, the issues reported are eith=
er
> handled by existing erratum or by the latest change that reads the counte=
rs in
> 'one go'. Can you share the details of the issue you are facing ?
> That would be helpful in potentially finding the right solution.

For example:
There is an A725 errata:
[A725]The CNT_CYCLES event can have a significant increment error due to WF=
E/WFI
Status
Fault type: Programmer Category B
Fault status: Present in r0p0, r0p1, and r0p2. Open.
......
Workaround
There is no workaround.

Thanks!
>
> ---
> BR
> Beata
>

