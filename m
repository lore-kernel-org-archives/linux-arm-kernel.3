Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6813510F6FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wx9uFPxK7aoYVYlvEoqTCO23k72vx9XaFJAGMTz8G/k=; b=JXXAspR8W9bMU99PTaFwMaR3uP
	coVLm4iV7/+LQbZcEDAuNkQB3vOOGMERMo2SoSIUUwGr1ZYH7G6Jz7CF5FR9gfEUJWS7l6ncAxtYY
	lqMvOD61KMSzJvDAa0U2ptCxdvC8tP03wEIf+R4TwReIcx4/fPp4+Nrq5KgSfVUSLD3fyLzF41bmO
	D/u7vMMzUVIDXdNF16dpk7oYBkqqgZGcUp2Ocnhv3K8EInGTTxkNRxAXJUj/7pHWMMgkmkn105ChL
	QWap7pAIjkEZ7DLLYvRODAH9bpt+Vbv3KZYRokpBMXpeakIyqCaPSK60AQ8rbU0Nj0bd34k8OdRD2
	dZd4XELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7x0R-0000000FXNp-0Ii5;
	Wed, 01 Apr 2026 14:57:19 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7x0O-0000000FXN2-2yPA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:57:18 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 881C3EC0268;
	Wed,  1 Apr 2026 10:57:13 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 01 Apr 2026 10:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775055433;
	 x=1775141833; bh=wx9uFPxK7aoYVYlvEoqTCO23k72vx9XaFJAGMTz8G/k=; b=
	EBdBmhy8ush2I8l5uv7vjLGXV75AY92vQWxjmCPyEYY8SJ83SQnF3L14Vicw51NQ
	FF7gvwNjihLBoZoPAPfH5I3LfsQ0KNJogIRzsAbTWdU+XGuKF751BZaLASMT/tAj
	hR4TXU5NmhLWaOyIcbiSQ7m9J3rFx/MuuZoY5pTi2MM6a6SZT3kgblN+gL+k8sym
	j1nf9P/WSt2jGzIfYHTJL1ngpouJ0DKSSsYSBYAQvmV6uNruDtGa/LH+fs7jo8Cm
	+6tQJtuy0aGgC7A6EA6QHZcXqrgzaJUmJJBuxN+CXI/lO9b2jXbXvFnaymzD9UE4
	digK44vT3m53pAZJAr7ukw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775055433; x=
	1775141833; bh=wx9uFPxK7aoYVYlvEoqTCO23k72vx9XaFJAGMTz8G/k=; b=N
	fWaPNdVuR1mCv/d2Wu5O8fNJtzKsmx6tfjmxEShfy+qyzQ7kTBBXp2hg1yGjVQoL
	IRIxSfEux4jgrb9kGa3ix5DTfQnIuohbJN9tvl4c7B/4TH/CoAprnh7wkK5hvpXu
	NalbROKZrhJkP+TM0HMNh4jkY3n27VoYFZkg5HpLfBKLeOE2ndyutLKepeeo9qtz
	49h9PsCzlfz1mXQouLensFZ4a83AMHVLvh0lnDzK38p42B7Ka1K8n/pgTTCNPJhv
	1kD3AM2BuD6wKS7mc9tJGAAZopAOssvGg0Lo59k118uYXuBEr1a7swGiSKjGH1w+
	EDr3p8a4QXq0j1uWSaVLQ==
X-ME-Sender: <xms:SDLNafoWFO00-QQIK3gpd96_o3xq4ItpLl-cGJxwCcpDOyoK17MZLw>
    <xme:SDLNaUc4OdTKOi__4sC0iCw1NVGbCfWje7trf88s1EVGpoQmCDsWMJFLkI4_wk31L
    KxmDBnHR9wYHgqh5VxwEiBmuOsalQvbRcXgIFGCFMjrY8aFr1jTyNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefgedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehsohhuvhhikhdrtghhrghkrhgrvhgrrhhthiesrghrmhdrtghomhdprh
    gtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehf
    lhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtoh
    epmhhorhhithiirdhfihhstghhvghrsegvthhtuhhsrdgtohhmpdhrtghpthhtohepmhgr
    thhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnuggvrhhssh
    honheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrghhlsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epkhhonhhrrgguhigstghioheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:SDLNaRsQoJjEHEh6BjlT9J7fg0cDlw67Z6gzAFTSrS7tQgpPXwwm1w>
    <xmx:SDLNaSMRCb2AGtL3ZwYrT-br7Fx6lQyFnd7p-gywCyVnBCDgQ2cCUg>
    <xmx:SDLNaTXk96uxoMM2wYMUw7wCd0aeCKnui6e1E129kqAWwmSbEexovg>
    <xmx:SDLNaSjKAkD7DqhFGGw036g2Y6NYQaDPd7Qzm4IkKkNtZHXSx_q8Sw>
    <xmx:STLNacH8t54amPEHZvYFE30Eb81SbY22TSlc7KrXA6P9Jw3Oq9jPahOH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BB713700065; Wed,  1 Apr 2026 10:57:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ALgIkaxq5xRN
Date: Wed, 01 Apr 2026 16:56:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>,
 "Sebastian Reichel" <sre@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Souvik Chakravarty" <Souvik.Chakravarty@arm.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "John Stultz" <john.stultz@linaro.org>,
 "Moritz Fischer" <moritz.fischer@ettus.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, "Srinivas Kandagatla" <srini@kernel.org>
Message-Id: <f6ed07b1-8bfc-49ea-951e-b590bf8b299a@app.fastmail.com>
In-Reply-To: <ac0trUGsRBLPS+ux@lpieralisi>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
 <93a78bc2-4fd1-41bd-bf4a-b433b06fc218@oss.qualcomm.com>
 <ac0trUGsRBLPS+ux@lpieralisi>
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_075717_081540_8BB625C9 
X-CRM114-Status: GOOD (  22.37  )
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

On Wed, Apr 1, 2026, at 16:37, Lorenzo Pieralisi wrote:
> On Tue, Mar 31, 2026 at 11:30:09PM +0530, Shivendra Pratap wrote:
>> 
>> > > +#include <linux/err.h>
>> > > +#include <linux/of.h>
>> > > +#include <linux/psci.h>
>> > > +#include <linux/reboot.h>
>> > > +#include <linux/reboot-mode.h>
>> > > +#include <linux/types.h>
>> > > +
>> > > +/*
>> > > + * Predefined reboot-modes are defined as per the values
>> > > + * of enum reboot_mode defined in the kernel: reboot.c.
>> > > + */
>> > > +static struct mode_info psci_resets[] = {
>> > > +	{ .mode = "warm", .magic = REBOOT_WARM},
>> > > +	{ .mode = "soft", .magic = REBOOT_SOFT},
>> > > +	{ .mode = "cold", .magic = REBOOT_COLD},
>
> These strings match the command userspace issue right ? I think that we
> should make them match the corresponding PSCI reset types, the list above
> maps command to reboot_mode values and those can belong to any reboot
> mode driver to be honest they don't make much sense in a PSCI reboot
> mode driver only.
>
> It is a question for everyone here: would it make sense to make these
> predefined resets a set of strings, eg:
>
> psci-system-reset
> psci-system-reset2-arch-warm-reset
>
> and then vendor resets:
>
> psci-system-reset2-vendor-reset
>
> at least we know what a string maps to ?
>
> We can export a function from the PSCI driver to detect whether PSCI
> SYSTEM_RESET2 is supported, an equivalent of psci_has_osi_support() for
> instance that we can call from this driver to detect its presence.

Sorry I've been out of the loop for this series for a while, but
can someone refresh me on why we got back to mixing in
the 'enum reboot_mode' from legacy i386 and arm32 into the new
interface?

I don't mind having whichever strings are defined for PSCI present
in the user interface, but this seems like a mistake to me.
If at all possible, lets define your own magic constants that
are not tied to "enum reboot_mode" or the legacy reboot= command
line argument.

       Arnd

