Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B319CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqdq9WmXPaR8Gsjoe2b8oxuoY7eohXxoBpzukdwSAp0=; b=CmRJPQcgAnQLmmyB8oDe/MxJ9Y
	m8EP9iC/T5JYAm+54E1s3chEnMQORnIu0KgBl8L427djqRAPxij87gfebiYMhoLMyuAMopmZ67hl1
	0bSig8VL0E1UszH+hCtXQvjrFdWDylgVY2R+JqB+tV/n1IcKOL2Lsgm93KNDGKZXgqVB0pyvcWPyf
	XT1qzkXMFDx/4FDOimutThblfQPXzLWmgewi8PWfqx+XdgYgHNOHHA2uZ3Ydjq60cNIngH6xZ+J8x
	UuftUeAJwffrzBrPPs9tLz4SFnzc0QZNWXcRQj6Hkf7tq/143Kxw+BjdFEMOqjBy9rJ4y4fNqu15t
	CIb9D3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqgk-0000000DvaE-47r7;
	Mon, 20 Oct 2025 14:16:42 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqgj-0000000DvZV-1utH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:16:42 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso3033629a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760969800; x=1761574600; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqdq9WmXPaR8Gsjoe2b8oxuoY7eohXxoBpzukdwSAp0=;
        b=UhJ5zgKQz7GtUCP9FAaYfCjKWQeN+RCN0W4MhUzH7lN6P+Q8TpaQVKmsMsnzlbXG9i
         A13vG89A3gWoQjixME1Zo6k1ra3hwFOM420v97uzoRhjDnLMxIVmcsmNxnDKmkqgJY8+
         DrxAvMf8h60eDKJLOK0nUXJzlXSgjZZWvWFE+HfVzMPiOALuxjHDSOuVUUDG8vpo9+U4
         azDAS7oHKsResEBPoDYug60rgO8/Slio6PeTPq9j9CBy/MK1bboYQKwr9rXPHkDxPv2e
         CYqU/liBqsvwzkLWNqZzKD3u22XDaUttySfYa4MP1IZCriTg0IEcaUN/JNs08HSLCOOp
         pU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969800; x=1761574600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqdq9WmXPaR8Gsjoe2b8oxuoY7eohXxoBpzukdwSAp0=;
        b=MMVch9T7SL5WQZIHDYVYZNh9g92SOcv8CFcDWVd1+AOOAWTm1+J2VkH6CE9lRr0GjV
         zStqTOK77a9NJqFdLGFTei2S6WqKUm53p7FCO9MDVms/w4p5G7GrlJ3T8RZFaXBLNr+H
         6ckUgNUsv2XJ1jS6omweWsIbR4ZqP5ZDceTba7V7TWMkVYtgtSF1o7j2Ezj0FeaVCjDC
         k6bnKQgXV6/m5FshocFtbj6lBS8VJCQHlerjIx+yBF4KRsbQnqbonB4Bmnvgko1labxi
         gQfodon93hk4/hrw/XYA0a5PbYoGNBMxBZS4xEHj2bS9VXVcuLXZgHGvAUGoF8y1ELbP
         ttPA==
X-Forwarded-Encrypted: i=1; AJvYcCW/aIVPgrKbcpN2KFvBt9VKgn2XAjoKQyCSXj2/CPMf/q4rwfSHs9WhlRkBzyPquC+RZtf7NZ9EF0kcS7Wute2V@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl01WVMLkvI4P6Nw4XuoSzjLCCKZ+CehxIp1Wl57t6EG9twwXs
	2LwiQEQJiebirH2W/0U/hPAEsq8VrzrypJpxx+w/j2sqCpMMoAmdmUKkAdvC/sJZtUTAbaz4aTj
	+mrzRMHyjBcXvib0NGGF+nwKgahuDoM4=
X-Gm-Gg: ASbGncs0fg0GyV6tml9FnDIt8GoLvUUR3AFEA3mWPxRBphAfRjndl4teeWbO19LCEAu
	fbv1WUoU+KsLI160rNhI4X9R393GWTC4iDOGBPldoA19GVHGbBM6SAlTwTtv+0x5OCq4vucyu+P
	pkwNN7wnCe4IHt8cfNq56tfd+f2T3rjvAgXckoO8FqxdCf82xvjFRYwAf+vg1lew9Qmw75M2tor
	3iu/ck2JhJat8y4mhRuV8cIBqMlwb93gm/kyLzu8Eq16WLiRhsh8lRYSdbcY2122icaLvZ++2w4
	IpRILIEKk35NdKmevkBB5Pja
X-Google-Smtp-Source: AGHT+IF71shr5BTQv0oq5eLWvgxmXcOQ1nEZ8rFk3kgzINgGyypUZnjlZnnQfErZnclV+r8kM1yF7mXz80sc3mNjFCg=
X-Received: by 2002:a17:903:11ce:b0:290:9da8:f88c with SMTP id
 d9443c01a7336-290c9ca6b61mr160740585ad.17.1760969800070; Mon, 20 Oct 2025
 07:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-7-laurentiumihalcea111@gmail.com> <aPJZCv+iG6cuxsj4@lizhi-Precision-Tower-5810>
In-Reply-To: <aPJZCv+iG6cuxsj4@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Oct 2025 17:18:59 +0300
X-Gm-Features: AS18NWBTX8pCKgoouBoSyxGFd8xpmwwpvcDYztextRp06KZCPCFp7jOkfhl48Co
Message-ID: <CAEnQRZBd1nadLPE0NSWOJLRNwFEnRhOTENv_vestHCLxe41Rbg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] reset: imx8mp-audiomix: Extend the driver usage
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_071641_518561_D3EBF429 
X-CRM114-Status: GOOD (  19.20  )
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

On Fri, Oct 17, 2025 at 5:57=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Oct 17, 2025 at 04:20:23AM -0700, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > Some NXP SoCs integrate one or more, per-subsystem, block control IPs,
> > which allow users to control the assertion and de-assertion of the
> > reset lines tied to some peripherals present in said subsystems. Some
> > examples of such SoCs include i.MX8MP with AUDIOMIX block control and
> > i.MX8ULP with SIM LPAV.
> >
> > Some of the aformentioned block control IPs exhibit a common pattern wi=
th
> > respect to the assertion and de-assertion of the reset lines. Namely, t=
he
> > user is able to control the state of the reset line by toggling a bit f=
rom
> > one of the IP's registers.
> >
> > Linux can take advantage of this pattern and, instead of having one dri=
ver
> > for each block control IP, a single, more generic driver could be used.
> >
> > To allow this to happen, the previous approach, in which a single reset
> > map is used, is replaced by a per-driver approach, in which each auxili=
ary
> > device driver holds a reference to a certain reset map.
>
> Can you shorter your commit message?, basically, you just add
> imx8mp_reset_info for difference auxiliary_device_id.

It is always preferred to have commit messages trying to explain the contex=
t.
I have never heard anyone complaining that the commit message is too long :=
D.

Daniel.

