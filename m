Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4177EDA698
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 17:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlBdi6EAVEtO25NMwMX/W9R62nC12Yqbu1jwDW8XMHE=; b=oa6FgFYB9wtXwe8tCfe9YSNyQC
	LXNrIBv9Kkt6N+X+5EkYgsVJOlKXBSp62EITN2+RHyOH1ZyR4aBla0LaLZo3pRBn7miWW8Vxu7lxx
	PGS5v+Qfe8o+b3TNpFmyRPRYYJhpFGsVm4M2Rqkf5oEyPemQbmeaHvd7O3Xf+R2kh9HBMOyVJTmaE
	QsdwJuuEWQgxV+SAfpaPsF0Oi0guvn0JJ7x8MaPKvqrfiXD3JA6lXuQZThV0NW0TrAPl3xR68CPdC
	vx5zztpKHmK+ARKz17gc3ONQDPcWJ/bgFHnEIHRnG3cVFBzds1Y0h76MWjE4RUjsM3jFa20z2r89R
	sBWvSppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTFl-0000000Fcgi-1lEU;
	Tue, 03 Mar 2026 17:09:49 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTFi-0000000FcgN-220n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 17:09:48 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3878de20527so91424841fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 09:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772557784; cv=none;
        d=google.com; s=arc-20240605;
        b=W53mcErAK3Hg8URyckfor5j7l7FrS3+Iw+Fk/IBM17UxOL+4HGG1wGoPUictAcqdef
         inEYopEXTAUjIEcdZsMrpFC924+jlJjaRjzql7Ub1TvCYrD2/gfOIepcbs1UFlFi2szK
         wDeg9dqaVpwY/oGP11NJ+ovT5uKqiYk7AuQbUikdGmss+CfJC0rhsC+Gih/sQcM4OLNW
         PbzUX5XFWGa0z884/uXDxparsKwVjUhoCEjznhODdQfjsCTzTNSmCnBg41V5+pQDTV17
         +PObFdmPT5R6A0JgGsOwLVYtjyILRtEugttHmL5tD/PlUcQN3n1mEdRbeW6W09OLCAli
         QnLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rlBdi6EAVEtO25NMwMX/W9R62nC12Yqbu1jwDW8XMHE=;
        fh=HT7vQV/WKCjjA9GtE/G9360JjznaBICUOa2SRXC038c=;
        b=WRn5y6FhRqKRjBqTyYfwxKOLz7voYZWuCbWkb1PiYT2yi8qKSXJhsIwtanARdONtbV
         8siabrP6FnlzqLs2E+40ff//cVtHdJfCK69ZU9z3NUSmN1hU50toVQN+1DGa41s4DTmI
         g+PNTNbPC70ILHoiqat/YTGtfIos0SNxiZ8HTK/PV+Gj6xgFOAMwUZzt1o7c34mzdGpY
         bGQO1XTw1BKtVxOB050ZKExc0xUq0TUbss8oZylnwzLIlof0jI+vA18ccWDRTijGMgXK
         Z5pEZq74/jQ8OpyrR/BUu/KRSoaCn1U7oFQ8FZFOmlyDRzPWfWqTU2b+PvbuaPmSI54P
         VLhg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772557784; x=1773162584; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rlBdi6EAVEtO25NMwMX/W9R62nC12Yqbu1jwDW8XMHE=;
        b=gOevWppIE6EiJ+zbMGru8FE5bZGlGybWZtchmHMOONRdRQaAlnMVDom6V0U9RpmLfK
         S5PVcB7WMGnk+zbaZzimE08X5AeQnWNLqYSw0IfUZyWOwY6f/mBhCC7cF2kFML9tkNZm
         ph3ijhZzMnAi+mfgNqZ9ppBldDEB+d0IILrw6uIh0nVS4UzB4RUYs61wBnWPUsSwWYr5
         yNqHsRL4pmTHPoxDxmM7JysbXHogjjM4DzmASyUwZaPyBL6Hl7we7mQhRl09tSKfan2u
         CVo/J/jFB4sGTgNHzN2Cmi0B82MLptzsAK+uRG7Ixbna+zJA361GHwtDqTztipVDlvP9
         G9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772557784; x=1773162584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlBdi6EAVEtO25NMwMX/W9R62nC12Yqbu1jwDW8XMHE=;
        b=JUiWJueFf6V+4lihmicGvL9AB4VrnZpkFXwby2GbsT9GoHFzyy7wh+jV0tTaOa/0Pf
         yPXIYvBsGo0TUGxa+jfvBG82T4QX2L4yTJIbeAbnzheLoMDmH9I7MXWf+5wkcvxHmJEs
         +AZQgGROZKxk5l7Fr73eXFC/BXf+Eg5x5U3xGWyENLcflJTnJ2ANN/fxsW90QsH/Dgnz
         5h/nbtAGgh3Sp982B/da3ZdpuVCtzDYpICFIGcG4Z4JhW2vu8/TccWrdy81UG5FOAZlp
         KjVNDf6WNEy8sSfJHDXGQ+eECopv0XE26uK5/r9T0DfVMHmxlJSzBmeqS+qROfLWhhol
         DE5w==
X-Forwarded-Encrypted: i=1; AJvYcCVYUmXUISUlW8Ox17wtndMw7NM0MolFnD7WC2J2JaQapEvOiCnBQzqRJP9yaAAQIsskklDB9CF5pb6MObSq5M1L@lists.infradead.org
X-Gm-Message-State: AOJu0YxbuWiMEMQGFB6BZ+rry4qyrT/Y/fspFC7Qf+nC/QGvqcNjQ9ty
	R9iGlRnwS1CgtKk0D+GkUv9rfq/EJIv20kwLhjwDrHQGecH17lcNfJrLK9iJcR09gcDlmdWxVYr
	N/Rg0N1K9lXWAnkq+w/DJPZ/4SWEaxmxlkgzeB/0mCg==
X-Gm-Gg: ATEYQzwxfcVVuFI0gQcjU+g2ZZuXLJ7nAwSdg7GTN2a1WXQTk8w3VmELQ6nCHxUW6Cy
	jYw5znq9AZj0SaJqfq76yyTWPmMO3eonT/WA36DGOehcXKh+XLsUFmR+TXgi4mslMq259NFaS9T
	l7aQTzO+w+L+T02pargRT1mZlYDfWqMPIcxdzTLAub7gt2o98mzeCbwjJV1GSlPJrdQ+qkBmv0d
	dM83VhlXjRbM+bjCsUTQ7wqHoU0FDil6OKpM//5l3crTwbVU6X8T8DUx1IpouFPGV0JbgO4kXfa
	9BMSkY8n
X-Received: by 2002:a05:651c:1c7:b0:389:fa42:b266 with SMTP id
 38308e7fff4ca-389ff1305bemr121187391fa.11.1772557783810; Tue, 03 Mar 2026
 09:09:43 -0800 (PST)
MIME-Version: 1.0
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
 <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
 <20260127151735.GA1699112-robh@kernel.org> <7hjywtzaiy.fsf@baylibre.com>
 <CAMuHMdURxN=kBQHJKnsTVEQPeuB41r5kZy4sgFNqg=U2ynuZMw@mail.gmail.com> <7hv7flrb36.fsf@baylibre.com>
In-Reply-To: <7hv7flrb36.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Mar 2026 18:09:07 +0100
X-Gm-Features: AaiRm50WKBsQhrWQrTeBP6GpkV839u459YirvJ0kBggs5SGvcv-i6i3nAHRwfPc
Message-ID: <CAPDyKFq0JAKc693d+RrPEBCAH--r+gobf822dQ5Ao6f2gnjRrw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via power-domain-map
To: Kevin Hilman <khilman@baylibre.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_090946_606429_3A1AEF86 
X-CRM114-Status: GOOD (  43.18  )
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

On Wed, 25 Feb 2026 at 00:11, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
> > Hi Kevin,
> >
> > Thanks for your series! I became aware of it only recently, and read
> > it and its history with great interest...
> >
> > On Wed, 4 Feb 2026 at 00:13, Kevin Hilman <khilman@baylibre.com> wrote:
> >> Rob Herring <robh@kernel.org> writes:
> >> > On Thu, Jan 22, 2026 at 05:14:00PM -0800, Kevin Hilman (TI) wrote:
> >> >> Add of_genpd_[add|remove]_subdomain_map() helper functions to support
> >> >> hierarchical PM domains defined by using power-domains-map
> >> >
> >> > power-domain-map. No 's'.
> >> >
> >> >> property (c.f. nexus node maps in DT spec, section 2.5.1).
> >> >>
> >> >> This enables PM domain providers with #power-domain-cells > 0 to
> >> >> establish subdomain relationships via the power-domain-map property,
> >> >> which was not previously possible.
> >> >>
> >> >> These new helper functions:
> >> >> - uses an OF helper to iterate to over entries in power-domain-map
> >> >> - For each mapped entry: extracts child specifier, resolves parent phandle,
> >> >>   extracts parent specifier args, and establishes subdomain relationship
> >> >> - Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection
> >> >>
> >> >> Example from k3-am62l.dtsi:
> >> >>
> >> >>   scmi_pds: protocol@11 {
> >> >>       #power-domain-cells = <1>;
> >> >>       power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
> >> >>                          <19 &WKUP_PD>;  /* WKUP_TIMER0 */
> >> >>   };
> >> >>
> >> >>   MAIN_PD: power-controller-main {
> >> >>       #power-domain-cells = <0>;
> >> >>   };
> >> >>
> >> >>   WKUP_PD: power-controller-main {
> >> >>       #power-domain-cells = <0>;
> >> >>   };
> >> >>
> >> >> This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
> >> >> domain 19 to become a subdomain of WKUP_PD.
> >> >
> >> > One concern I have here is generally *-map is transparent meaning when
> >> > you lookup <&scmi_pds 15>, &MAIN_PD is returned as the provider. It's
> >> > also possible to have a map point to another map until you get to the
> >> > final provider. The only way we have to support both behaviors is the
> >> > consumer has to specify (i.e. with of_parse_phandle_with_args_map() vs.
> >> > of_parse_phandle_with_args()), but the consumer shouldn't really know
> >> > this detail.
> >
> > This is also the first thing I was worried about, when I noticed you are
> > not doing transparent mapping, but add an explicit hierarchy instead,
> > based on the map.
>
> Yeah, the map wasn't my original idea, and TBH, I had never really even
> heard of nexus node maps before it was suggested by Rob[1] that I could
> use it to describe hierarchy.
>
> But... I'm gathering from Rob's and your recent feedback that my current
> approach to using a map is an abuse/misuse of the map because it's just
> being used to describe hierarchy, and because it's not transparent.
>
> I'm still waiting to hear from Rob to see if I understood that right,
> but your feedback is making me think that's the case.
>
> If so, I'm honestly not sure where to go next.
>
> >> > Maybe a transparent map of power-domains would never make sense. IDK. If
> >> > so, then there's not really any issue since the pmdomain core handles
> >> > everyone the same way.
> >
> > AFAIUI, SCMI is not limited to the SoC, but may be used for the whole
> > hardware platform, so it could control power to external devices, too.
> > Once we need to map a power domain through a connector, we need
> > support for transparent mapping through a nexus node.
> >
> >> I don't really know enough about potential usage of maps to know if
> >> there's ever a usecase for transparent maps.  However, the problem I'm
> >> trying to solve is less about transparent maps, and more about
> >> describing hierarchy in a situation where "leaf" domains of the same
> >> type (e.g. SCMI) can have different parent domains.
> >
> > Hierarchy is indeed something that cannot be described with the current
> > SCMI power domain management protocol.  This includes external hierarchy
> > (your use case), and internal hierarchy: AFAIK, Linux cannot be made
> > aware of the hierarchical relationship among the different power
> > domains controlled through SCMI either.
>
> Yes, the limitations of SCMI (both the protocol, and the Linux
> implementation) are the root cause here.  In case you didn't see it,
> before I posted the original version of this series, I started a thread
> on the arm-scmi list to discuss implementation options[2]
>
> So since this is primarily and SCMI limitation, maybe I should just go
> back to the original proposal of using power-domains-child-ids[3]?
>
> I'm definitely open to suggestions here as I'm a bit out of my depth
> here.

FWIW, I favor re-trying the "power-domains-child-ids" [3] approach.

The main reason is that we already have the "power-domains" property,
which allows us to describe parents using a list of phandles.

To me, it seems more sensible to extend this with a new
"power-domains-child-ids" property, which can be used when needed,
rather than inventing an entirely new property, that would replace the
existing one.

Kind regards
Uffe

>
> [1] https://lore.kernel.org/r/20250528203532.GA704342-robh@kernel.org
> [2] https://lore.kernel.org/arm-scmi/7hecy3h7ky.fsf@baylibre.com/
> [3] https://lore.kernel.org/all/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com/

