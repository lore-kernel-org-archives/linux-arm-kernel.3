Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBAEE78491
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 21:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpPhIVPLcl7AlcgaNncZR2f2MLRrtlVGy3ymmkGrT98=; b=MKjsDieUZkUHPUzDQURboOgC5V
	oO3MfQlA+y2rA77DArcVMRSgHzfIlkdcRakeXKaqFhAJ2x0jrERZ7NC3Baj7jbir7SdjJMhfo9/Uo
	8qPCjd0JRNPrhWxXciErPMnNJCRA8nnRtkHkW+pY/qsv+aKRkxr4EG7pkIw2mnoPvwy3DBLHWSw/6
	CA98LUb/pAQLi5w9yo+LeRxG4xUz2a/8+G2Yb/0aIVYhlEMjU70BVY/Tm74cFF7YN3WcDAXQ9cAgD
	eBAdlBeVEEajKai8SXOz6UOxUEhgKlp4cvjhX3VBxI5O8BXf4QxbfFPRZXTTYacArF8c8EA4Fb3Ge
	n81ML2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYWrs-0000000HRD0-1OeU;
	Wed, 24 Dec 2025 21:58:06 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYWrp-0000000HRCH-1yUQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 21:58:03 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-37a34702a20so41291501fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 13:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766613479; x=1767218279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpPhIVPLcl7AlcgaNncZR2f2MLRrtlVGy3ymmkGrT98=;
        b=bnNr/19xsCMqGpPS63PcwQ8AUJKo1whtB45nX3IqTQfX5GHY1AZCIXWtW0dHzAiYXW
         B75Fc/pfM+8IUby/Mx4X7yb6zWvGL6YI12Ooc1RPseekGCujWLatGTGFu5e0qDEKrVVy
         5O0shFrvujq4G2+mitU4wMIPtQ3fF7PSAbSBJthvq88mmCzu1qwzGlWbzuCd8CBb4dMJ
         Wyot2BjmYp7ywCFq3Xm5RSwdLFodn37pfvD+L8zW1+ga1EbnnIjAK9AJb5DmENTKkGLJ
         7rVxf9i6XPgcr/f1FvXBDGcQ4ZC7lLyFuCQ3FfqED18Vq25rXZgd7vhmTJdeGdWoGk24
         dd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766613479; x=1767218279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BpPhIVPLcl7AlcgaNncZR2f2MLRrtlVGy3ymmkGrT98=;
        b=dxMK1J21kwF/1qgs5K3gYdB76WS4y3/0/M8gBbZchLDcektnxmDnWbh7XGhebFcwmp
         V4tnyCVRHjF9ukaYCcQFEexdu0FrE4px3nc3Q4lsl5RKHmHFCuNUEQCyMHIRR76dN2yR
         35E1RIqPNEDJb1q0EbmWyhR/K7GlpFjDpL26tFHu3x1qFHuXFNFTNEoI5cA4agz/uYGq
         uUm+cOUIg5RErwjj3j9dgU26NjfFvsyYYahvdyogsptc9zP2pL/dKD7g6Q/kMgsk5A2O
         uka5G9pQ/IIqEGlK+RsCRiA1gDbWTsabuyz4e+fga20pGKVS6FZiyhGY62nXz626H4HB
         wytQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYoHD4mhoXdk66iPeS+dEpHpczm4rX+3wG4EkptNht0Ntpg1NjSFqL4Hv5rxbryKQeEYXeq/z2M8b+cMgpALxB@lists.infradead.org
X-Gm-Message-State: AOJu0YyAT19kwPRZshZmbRlYiiMhg6VnQ23LHEz70ZYza7lQsbB/mUOd
	4c9cGFpSPvN8I45RRUn1c7Uhnk3+qK2o7RY2C+/1qagbFEK8hZK0I8D6CyZFDbYMUI+INgfqztP
	TOqzwDI+ZtcuoiHikecTwRtEKwOt7qUc=
X-Gm-Gg: AY/fxX4CvvflgR1s5OrK+x3w48+fRAa2CWZAG+BAHFdzxXcGSXntXdpnXIczfszhytf
	hSZkq5MpYKuXWNG1bgUpcGof3pD1XpRD6gdOcovExzeYE+lGqanxi7Wyxz2uifY3M6Gf1GPu4gg
	0QnB8uOqLia0ro1ympH4heUY+4wCXpnaM6mgB01nRG8q7YhAyTzIQMUYzVo+iBQu/Q+TGlAmNTX
	yuh7W0AGItkX8Ys17x8qz1ObU1CUDU2nOZ4TLEVTYMC2wZwSJ6Rd3RuEeAXSJvEp3UgkGkbUWvI
	DI5eDe4=
X-Google-Smtp-Source: AGHT+IEkZq/SghbcemDD4gpQJkxuW1kec85kuxDcNZRjtvTDrMQzCzdvYYwzT+2kprBLyKYZnyXIlIOYdRbjndvcfbo=
X-Received: by 2002:a05:651c:549:b0:37b:8f05:13bb with SMTP id
 38308e7fff4ca-38121635cbbmr65292381fa.27.1766613478895; Wed, 24 Dec 2025
 13:57:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763415705.git.geraldogabriel@gmail.com>
 <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com>
 <CANAwSgQ726J_vnDKEKd94Kq62kx8ToZzUGysz4r3tNAXvfAbGA@mail.gmail.com>
 <CAEsQvctSY7-RQEQF2TmJU2qKPZOe9TC5g-7Jat0LQKRHYz_6dQ@mail.gmail.com>
 <CANAwSgQPQUBi6VVb+hZNraMt71vnRpki+YK_at=Luo4aPVtOPg@mail.gmail.com>
 <0afea20b-be22-2404-5a8e-c798ed45f2fd@manjaro.org> <CANAwSgS6UeR4PJnWDxxcQbdH8u_4uNiQxCTugQS35LcPvpiwMQ@mail.gmail.com>
 <648aa5c0-9e58-2404-4250-e83b8a748601@manjaro.org>
In-Reply-To: <648aa5c0-9e58-2404-4250-e83b8a748601@manjaro.org>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Wed, 24 Dec 2025 18:57:46 -0300
X-Gm-Features: AQt7F2qLlj1sHGE5kS7xlOSGgQLXJ9ioNCl22i1s4n8IwdgKKh2cem-68BhAFek
Message-ID: <CAEsQvct-AyhdOU9xhP0HnN8be+ut=tDBgUt0n3D4TT9ZMXnTbA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PCI: rockchip: limit RK3399 to 2.5 GT/s to prevent damage
To: Dragan Simic <dsimic@manjaro.org>
Cc: Anand Moon <linux.amoon@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Jonker <jbx6244@gmail.com>, linux-rockchip@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_135801_534281_F7156D38 
X-CRM114-Status: GOOD (  28.23  )
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

On Wed, Dec 24, 2025 at 1:52=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> On Wednesday, December 24, 2025 17:11 CET, Anand Moon <linux.amoon@gmail.=
com> wrote:
> > On Wed, 24 Dec 2025 at 18:25, Dragan Simic <dsimic@manjaro.org> wrote:
> > > On Wednesday, December 24, 2025 09:04 CET, Anand Moon <linux.amoon@gm=
ail.com> wrote:
> > > > On Wed, 24 Dec 2025 at 11:08, Geraldo Nascimento
> > > > <geraldogabriel@gmail.com> wrote:
> > > > > On Wed, Dec 24, 2025 at 2:18=E2=80=AFAM Anand Moon <linux.amoon@g=
mail.com> wrote:
> > > > > > On Tue, 18 Nov 2025 at 03:17, Geraldo Nascimento
> > > > > > <geraldogabriel@gmail.com> wrote:
> > > > > > > Shawn Lin from Rockchip has reiterated that there may be dang=
er in using
> > > > > > > their PCIe with 5.0 GT/s speeds. Warn the user if they make a=
 DT change
> > > > > > > from the default and drive at 2.5 GT/s only, even if the DT
> > > > > > > max-link-speed property is invalid or inexistent.
> > > > > > >
> > > > > > > This change is corroborated by RK3399 official datasheet [1],=
 which
> > > > > > > says maximum link speed for this platform is 2.5 GT/s.
> > > > > > >
> > > > > > > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK=
3399_Datasheet_V2.1-20200323.pdf
> > > > > > >
> > > > > > To accurately determine the operating speed, we can leverage th=
e
> > > > > > PCIE_CLIENT_BASIC_STATUS0/1 fields.
> > > > > > This provides a dynamic mechanism to resolve the issue.
> > > > > >
> > > > > > [1] https://github.com/torvalds/linux/blob/master/drivers/pci/c=
ontroller/pcie-rockchip-ep.c#L533-L595
> > > > >
> > > > > not to put you down but I think your approach adds unnecessary co=
mplexity.
> > > > >
> > > > > All I care really is that the Kernel Project isn't blamed in the
> > > > > future if someone happens to lose their data.
> > > > >
> > > > Allow the hardware to negotiate the link speed based on the
> > > > available number of lanes.
> > > > I don=E2=80=99t anticipate any data loss, since PCIe will automatic=
ally
> > > > configure the device speed with link training..
> > >
> > > Please, note that this isn't about performing auto negotiation
> > > and following its results, but about "artificially" limiting the
> > > PCIe link speed to 2.5 GT/s on RK3399, because it's well known
> > > by Rockchip that 5 GT/s on RK3399's PCIe interface may cause
> > > issues and data corruption in certain corner cases.
> > >
> > It=E2=80=99s possible the link speed wasn=E2=80=99t properly tuned. On =
my older
> > development board,
> > which supports this configuration, I haven=E2=80=99t observed any data =
loss.
> >
> > sudo lspci -vvv | grep Speed
> >                 LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L1, Exit
> > Latency L1 <8us
> >                 LnkSta: Speed 5GT/s, Width x1
> >                 LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- Spe=
edDis-
> >                 LnkCap: Port #1, Speed 5GT/s, Width x1, ASPM L0s L1,
> > Exit Latency L0s unlimited, L1 <2us
> >                 LnkSta: Speed 5GT/s, Width x1
> >                 LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- Spe=
edDis-
>
> Let me clarify, please...  This limitation to 2.5 GT/s came straight from
> Rockchip a few years ago, described back then as an undisclosed errata.
> Recently, we got some more details from Rockchip that confirmed 5 GT/s
> as having issues in certain corner cases that cannot be validated by
> performing some field tests or by observing the PCIe behavior under load.
> Those corner cases with 5 GT/s, as described by Rockchip, are quite hard
> to reach, but the possibility is still real.
>
> To sum it up, yes, multiple people have reported 5 GT/s as "working for m=
e"
> on their RK3399-based boards and devices, but that unfortunately means
> nothing in this case, due to the specific nature of the underlying issue.
>

Not only that but the bandwidth actually earned is very small due to the
inherent limited interrupt processing capability of a single core, meaning
the 5 GT/s bandwidth / transfer speed is never fully utilized.

It's better than to force a slightly lower actual transfer speed than to ri=
sk
the liability of someone losing their data, period.

Regards,
Geraldo Nascimento

