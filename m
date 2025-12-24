Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0772E776F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAlvebUUG2bzxrDciua9nbFHHFRu5loYHuWIcI/vSNo=; b=awAve3JQcteNgKcAf1l/WRoR1H
	IyM3ugHblpi3wRtNFWFYj2M8yqnJHXIsbKYSQ6tOTkEykhYfmdX5IIuJZFmYIZ62pwr6PZ6DtjwhS
	zUXLuEFgBhvr+5BJGN9TQ+IngDku7l1uYr14SeAxhTh2kCAEPtu9WfHHj20S33yo2w2uXRRYt3/xj
	HXy5l/j+LueaPODFDI4AfMVL9NXOkYVVl6alYid3JZceLLzulqLRCBpQq3dKWbwzWmFiYyIJd4gRd
	Pkkr/MDp7oBPtJvUTKo6BsLIGAcI8TOWloDwRuLa8alnhmUuHSgQwFkgcM3bVN6ZacR6SmGYvdPk2
	ETELv+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYS5x-0000000HFhX-3x9b;
	Wed, 24 Dec 2025 16:52:18 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYS5q-0000000HFgo-3J1j;
	Wed, 24 Dec 2025 16:52:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id A395C418A6;
	Wed, 24 Dec 2025 17:52:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1766595126; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FAlvebUUG2bzxrDciua9nbFHHFRu5loYHuWIcI/vSNo=;
	b=dEvno/hnZfKDLt2EyPrnqbHoMqCokv0GPc7Jm8I91GfJpoPGEwhch2O7dQfp1s8hW836sI
	wFaAFNDJyNtyLf9maDbvEEg4urvKf8jzsX7gYppR0zWFIxgU16vEWkapdEErOcNSKjqWUo
	1IZWg0Pf/ZVelylRiuqZjULdC3AC972jpo1xLp2wtZ5jGWxCU5qm5oH6SmnvFhim8dFzFz
	waqBqGmYY4mYo1Umz0pLBa6VuOg1Pg7agGkPEa74d8I0HK7z0YyKIVWQOIVhv32ZF6h+Oj
	esDxaolb8W5uxwBz8WqrhgwpFgNzjG6nWBJfhceZLRuAWROpPcL6U27JXTVOiQ==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <CANAwSgS6UeR4PJnWDxxcQbdH8u_4uNiQxCTugQS35LcPvpiwMQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <cover.1763415705.git.geraldogabriel@gmail.com>
 <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com>
 <CANAwSgQ726J_vnDKEKd94Kq62kx8ToZzUGysz4r3tNAXvfAbGA@mail.gmail.com>
 <CAEsQvctSY7-RQEQF2TmJU2qKPZOe9TC5g-7Jat0LQKRHYz_6dQ@mail.gmail.com>
 <CANAwSgQPQUBi6VVb+hZNraMt71vnRpki+YK_at=Luo4aPVtOPg@mail.gmail.com> <0afea20b-be22-2404-5a8e-c798ed45f2fd@manjaro.org> <CANAwSgS6UeR4PJnWDxxcQbdH8u_4uNiQxCTugQS35LcPvpiwMQ@mail.gmail.com>
Date: Wed, 24 Dec 2025 17:52:03 +0100
Cc: "Geraldo Nascimento" <geraldogabriel@gmail.com>, "Shawn Lin" <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Johan Jonker" <jbx6244@gmail.com>, linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: "Anand Moon" <linux.amoon@gmail.com>
MIME-Version: 1.0
Message-ID: <648aa5c0-9e58-2404-4250-e83b8a748601@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/4] =?utf-8?q?PCI=3A?==?utf-8?q?_rockchip=3A?= 
 limit RK3399 to =?utf-8?q?2=2E5?= GT/s to prevent damage
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_085211_629040_A01DD9AB 
X-CRM114-Status: GOOD (  21.10  )
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

On Wednesday, December 24, 2025 17:11 CET, Anand Moon <linux.amoon@gmai=
l.com> wrote:
> On Wed, 24 Dec 2025 at 18:25, Dragan Simic <dsimic@manjaro.org> wrote=
:
> > On Wednesday, December 24, 2025 09:04 CET, Anand Moon <linux.amoon@=
gmail.com> wrote:
> > > On Wed, 24 Dec 2025 at 11:08, Geraldo Nascimento
> > > <geraldogabriel@gmail.com> wrote:
> > > > On Wed, Dec 24, 2025 at 2:18=E2=80=AFAM Anand Moon <linux.amoon=
@gmail.com> wrote:
> > > > > On Tue, 18 Nov 2025 at 03:17, Geraldo Nascimento
> > > > > <geraldogabriel@gmail.com> wrote:
> > > > > > Shawn Lin from Rockchip has reiterated that there may be da=
nger in using
> > > > > > their PCIe with 5.0 GT/s speeds. Warn the user if they make=
 a DT change
> > > > > > from the default and drive at 2.5 GT/s only, even if the DT
> > > > > > max-link-speed property is invalid or inexistent.
> > > > > >
> > > > > > This change is corroborated by RK3399 official datasheet [1=
], which
> > > > > > says maximum link speed for this platform is 2.5 GT/s.
> > > > > >
> > > > > > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip=5F=
RK3399=5FDatasheet=5FV2.1-20200323.pdf
> > > > > >
> > > > > To accurately determine the operating speed, we can leverage =
the
> > > > > PCIE=5FCLIENT=5FBASIC=5FSTATUS0/1 fields.
> > > > > This provides a dynamic mechanism to resolve the issue.
> > > > >
> > > > > [1] https://github.com/torvalds/linux/blob/master/drivers/pci=
/controller/pcie-rockchip-ep.c#L533-L595
> > > >
> > > > not to put you down but I think your approach adds unnecessary =
complexity.
> > > >
> > > > All I care really is that the Kernel Project isn't blamed in th=
e
> > > > future if someone happens to lose their data.
> > > >
> > > Allow the hardware to negotiate the link speed based on the
> > > available number of lanes.
> > > I don=E2=80=99t anticipate any data loss, since PCIe will automat=
ically
> > > configure the device speed with link training..
> >
> > Please, note that this isn't about performing auto negotiation
> > and following its results, but about "artificially" limiting the
> > PCIe link speed to 2.5 GT/s on RK3399, because it's well known
> > by Rockchip that 5 GT/s on RK3399's PCIe interface may cause
> > issues and data corruption in certain corner cases.
> >
> It=E2=80=99s possible the link speed wasn=E2=80=99t properly tuned. O=
n my older
> development board,
> which supports this configuration, I haven=E2=80=99t observed any dat=
a loss.
>=20
> sudo lspci -vvv | grep Speed
>                 LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L1, Exit
> Latency L1 <8us
>                 LnkSta: Speed 5GT/s, Width x1
>                 LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- S=
peedDis-
>                 LnkCap: Port #1, Speed 5GT/s, Width x1, ASPM L0s L1,
> Exit Latency L0s unlimited, L1 <2us
>                 LnkSta: Speed 5GT/s, Width x1
>                 LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- S=
peedDis-

Let me clarify, please...  This limitation to 2.5 GT/s came straight fr=
om
Rockchip a few years ago, described back then as an undisclosed errata.
Recently, we got some more details from Rockchip that confirmed 5 GT/s
as having issues in certain corner cases that cannot be validated by
performing some field tests or by observing the PCIe behavior under loa=
d.
Those corner cases with 5 GT/s, as described by Rockchip, are quite har=
d
to reach, but the possibility is still real.

To sum it up, yes, multiple people have reported 5 GT/s as "working for=
 me"
on their RK3399-based boards and devices, but that unfortunately means
nothing in this case, due to the specific nature of the underlying issu=
e.


