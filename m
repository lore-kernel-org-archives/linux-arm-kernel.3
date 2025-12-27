Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C7FE8FDD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkTJBdGWaaGFXpk4ABan/EOXP8frmcAGWpzfe9DTQsY=; b=R2fG9/LCG1QnpvUyZYoOIolIxZ
	oDbFK7vUS0JaNxVo3LirISw0lyl28/hYcHSW8bPYk40y+EXqpJGWiIojLDMcb4PBd1pyE4misk30U
	T0KFpabJbyeII75Ap/XksTOOOd4KO7BYhIybdEmZLSroUHUhjZNYuok//KWKrAe3iJUFZ+jvnRwFq
	tUR7mJvWhAgA/uukwTSLMK34h+bxJiTJIaofbpmQXyUyuozPdBzG9ipHiomea0GrGrmBQFbbCJVIi
	6plLpecStHc8fDqMKj28dni+SUhX4vApuiV9LyJrXYEe0VgEbYVPBcjleXAt+R52VLPvIL14/iYXK
	SHWGtP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSIW-00000001swB-2H4j;
	Sat, 27 Dec 2025 11:17:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSIV-00000001sw5-0DF2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 11:17:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AB3A60007;
	Sat, 27 Dec 2025 11:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9FCC4CEF1;
	Sat, 27 Dec 2025 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766834241;
	bh=mkTJBdGWaaGFXpk4ABan/EOXP8frmcAGWpzfe9DTQsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mp7Vf87QB6NclKUBLSZgG25HwjCXi0w1BFQg/Xi32LC2n/3/VELl6cCodVL+Uaohv
	 knt2f4OAFECmBI2yR6QaJKc4Fu3a0RgdjeQelMCbEngpVtwWKTYTsHw2W1Iz+bxEWv
	 0zWs04mKwiyvgUvPwIasj1QjjKsDJq89hdt7OjelzvGxzL+3ihvEu5fdHBabQtgXr8
	 DllSXXTp5/+fVCOegZ18LBeyKqUAgJDvKyYQhRds9kFnFYu05Qmf5FSqSpvj2eGiJS
	 UXpqSihw//fBPaMJNj+nca6ZTcB88RkYwMxJpkTmCUhvWbKSEP90A++xF9C0FO43Cv
	 F68a/aRlgpAVQ==
Date: Sat, 27 Dec 2025 12:17:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
Message-ID: <20251227-splendid-striped-starfish-ece074@quoll>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr>
 <20251224-berserk-mackerel-of-snow-4cae54@quoll>
 <CA+HBbNGym6Q9b166n-P=h_JssOHm0yfyL73JZ+G9P81muK=g4A@mail.gmail.com>
 <78bf252c-fd5e-4a36-b1a3-ca8ed26fde7a@kernel.org>
 <CA+HBbNG+ZVD6grGDp32Ninx7H1AyEbGvP0nwc0zUv94tOV8hYg@mail.gmail.com>
 <d210552f-c8bf-4084-9317-b743075d9946@kernel.org>
 <2025122516245554f59e2e@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2025122516245554f59e2e@mail.local>
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

On Thu, Dec 25, 2025 at 05:24:55PM +0100, Alexandre Belloni wrote:
> On 25/12/2025 09:47:34+0100, Krzysztof Kozlowski wrote:
> > On 24/12/2025 15:01, Robert Marko wrote:
> > > On Wed, Dec 24, 2025 at 2:05=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > >>
> > >> On 24/12/2025 11:30, Robert Marko wrote:
> > >>> On Wed, Dec 24, 2025 at 11:21=E2=80=AFAM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> > >>>>
> > >>>> On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> > >>>>> Add the required LAN969x clock bindings.
> > >>>>
> > >>>> I do not see clock bindings actually here. Where is the actual bin=
ding?
> > >>>> Commit msg does not help me at all to understand why you are doing=
 this
> > >>>> without actual required bindings.
> > >>>
> > >>> I guess it is a bit confusing, there is no schema here, these are t=
he
> > >>> clock indexes that
> > >>> reside in dt-bindings and are used by the SoC DTSI.
> > >>
> > >> I understand as not used by drivers? Then no ABI and there is no poi=
nt
> > >> in putting them into bindings.
> > >=20
> > > It is not included by the driver directly, but it requires these exact
> > > indexes to be passed
> > > so its effectively ABI.
> >=20
> > How it requires the exact index? In what way? I do not see anything in
> > the gck driver using/relying on these values. Nothing. Please point me
> > to the line which directly uses these values.... or how many times I
> > will need to write this is not ABI?
> >=20
>=20
> The index here is the exact id that needs to be set in the PMC_PCR
> register and so it is dictated by the hardware.

So not a binding between Linux and DTS.

Best regards,
Krzysztof


