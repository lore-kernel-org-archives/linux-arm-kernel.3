Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E99C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 21:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rf03yAgQQGBhErkrSSaEFDElj+fjBRlARFLOXQZblAk=; b=IddTKh6u1E9b8tvOmoPp/KikcV
	YZrMZK++Z91tDLBD7UshBevXUHp0Kau/FXPOu53Fx14AXSHmNBKCR6jWfC1DIVHb+xIlyRWs0t5kY
	6yGKy8XzQBYla35Yb+I8gw9Szj1TABxGws1Ti3vj6r3BFFrTmVuJCAyGBtR1Y8Ivhd1vVCiGexRNH
	AYkqqPZxGx4eoqCJJ5zq9UzDMePmCwlCErNpTvN5b7w4mpP/NsXFLtLdBI5ueeNOT8e4kClea1vQZ
	5h9Je3Bblq0lml9Z923wGUqFmAPfM15eh6JXnuCNt7HprQg1JccNbNqiR3OYLbYuKeMkok4Q0MoX/
	+rLPPF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1tD-0000000BbhW-1Gvc;
	Tue, 27 May 2025 21:31:15 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1l3-0000000BarY-2rWs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 21:22:50 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6045a3a2c5eso3976919a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 14:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748380967; x=1748985767; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rf03yAgQQGBhErkrSSaEFDElj+fjBRlARFLOXQZblAk=;
        b=SwoNy3W3DMQZ/w8VKG455TfBS1zakWlqegCvKvTfq2n8VhHUZaygVK0b2vmU72BOP3
         wTZcJpUsUo38aBMRZTVhcQP+NPSdxFr9kD40q+v2A58ly7v7A55urso/SLcsdB/WJZs8
         FZRiysseOze6DtDfUQYlXEKNQ0NJbdj6ViFFg8o+0Ahh0uUc7BO+ES6kYpbJoUiTqSC+
         MALIXSaBYkZplR/wa1xKYM75rPEhVwpMC1y1akZbOEpme9Wrb3QeS7phCQSzdcvvHgJo
         Lh1dBBCLeLXHADsVqqq8ghck6FuNETtQ+hvbec4TDBKO+k+g/QJMyDszkBZhqpLFqw/W
         lDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748380967; x=1748985767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rf03yAgQQGBhErkrSSaEFDElj+fjBRlARFLOXQZblAk=;
        b=r78rKH7sH7l/K4KrH4pAfIEMzT9jzVwnjzH9OB4MwrjJtcYGlC5qi+FRK/58KynoOK
         YcNcjgNXaGhoEYFd+xq6XchVG5ynRgx0RXrBZVzo5sF6dnVnmrDY1KGg7ml6kp3dB7yc
         14hfa325Pk7vy0TesoXcdAyO+s/YgAvBkLnxSUfAxWTk9LpZXYvUped0iPwxgK3tVhMg
         QtH9EDbV0ZARPCFHNnnP5owjfDofAwB8JkpQZoSeoR7DUZtpAKlBm46RNhFq1paOru57
         FmKOuIg29zlBlLeodgQdO/sO8lpQs6K+m5jb2VW78u11ZtumWCDV/qPEMehMjXUYLFDq
         91Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWz9nhwTi2jORjXptlqcLvU2zVqs+zF3TydDKfd88U6xtjpWED8vaLOOCcYJ4AzrMWheYhIUrv/gBnJmxEMutNS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrd0CvMNLfUrii1CsHkKNsYLKGWuc2G/ep8pMR4isQv2ssp++Q
	O4D37Iw9BE0E1qQJ4TSROmkgB/CiQ/shh8TIPDBmDc+TMeOe8ygRwkaQp1DxJOgPtEY=
X-Gm-Gg: ASbGncu/cbh0pWx5apzRQDb4DmDyJCqaSabZMUsCOI5v7ww+uxG0yabS3bwTn9YtzR1
	LCs8ETj6L8i3cgbdtcer5HY44K7d2n6+QkZah5/v9ldLSMD88UlaFY7bpHjrD2F+folUdB6kmvv
	u7Zleom3jBdzsUMGajMoad0T2aGS1ttOrQw5i9RF8WOT3HwD8LLgGPSnQTeQlzfrmWp8fk4AeeA
	+jX0WolTSIwEWDx4olZO/9jw9yLLSvRuOmOnz700bqPubF+og94CVYbzVDldZoAesy8C4ZInCSv
	3QpWjSyQREIAvk5qvJsgs8KRrj0SmQTlnlj94ZlYfDb85bL2/ra3PwGFaPonXsL0jQd8+79utKY
	6T0Q/O/28qik+WJMoIosy+MRZKjJ84Hsg
X-Google-Smtp-Source: AGHT+IFERg8h0M0q68ymhrrsY3ViILpvzLyzrWuNOWeP4SVGe1Wg+ZNpOzN/Rnmv7ShgttQHfLkmmw==
X-Received: by 2002:a05:6402:1d4b:b0:601:f185:fc2 with SMTP id 4fb4d7f45d1cf-602d8e5e352mr13569888a12.3.1748380967163;
        Tue, 27 May 2025 14:22:47 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60517a7f920sm128296a12.53.2025.05.27.14.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:22:46 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 27 May 2025 23:24:20 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
Message-ID: <aDYthG54Wz3khQ88@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
 <CAO50JKVF6x_=MUuzjhdK0QotcdUgHysMb9v1g0UvWjaJF2fjDA@mail.gmail.com>
 <48AFA657-5683-42A4-888E-3E98A515F3B1@broadcom.com>
 <aCIk40642nXZ3arz@apocalypse>
 <3899c82c-d6a7-4daf-889b-b4d7f3185909@suse.com>
 <6953caf0-0fef-4bd6-898c-4f86ee738f30@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6953caf0-0fef-4bd6-898c-4f86ee738f30@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_142249_723881_518429B4 
X-CRM114-Status: GOOD (  29.44  )
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

Hi Florian,

On 09:18 Tue 27 May     , Florian Fainelli wrote:
> On 5/26/25 07:06, Matthias Brugger wrote:
> > 
> > 
> > On 12/05/2025 18:42, Andrea della Porta wrote:
> > > Hi Florian,
> > > 
> > > On 15:02 Mon 12 May     , Florian Fainelli wrote:
> > > > On May 7, 2025 5:01:05 PM GMT+02:00, Andrea della Porta
> > > > <andrea.porta@suse.com> wrote:
> > > > > Hi Florian, to accept the patches, what would work best for you?
> > > > > 
> > > > > 1) Send only the relevant updated patches (maybe as an entirely new
> > > > > patchset with
> > > > >    only those specific patches)
> > > > 
> > > > Only the updated patches work for me. I don't think there is
> > > > that much coupling between the DT changes and the non-DT changes
> > > > (other than without DT entries nothing is activated)
> > > 
> > > It's a little bit more involved than that:
> > > 
> > > - Patch 7 (misc driver) depends on 6 (RP1 common dts) which in turn
> > >    depends on 1 (clock binding header). Should be taken by Greg.
> > 
> > Greg gave an Acked-by so I think Florian is good to take that patch.
> > Which leaves us to the clock patches (driver + dt-bindings).
> > 
> > > 
> > > - Patch 9 and 10 (board dts) depends on 6 (RP1 common dts) which again
> > >    depends on 1 (clock binding header). Should be taken by Florian.
> > > 
> > > - Patch 4 (clock driver) depends on 1 (clock binding header) and
> > >    should be taken by Stephen.
> > > 
> > 
> > Steven reviewed the patches (driver + dt-binding) so he is waiting for a
> > new version which addresses the review. He offered to either take them
> > and provide a branch that Florian can merge into his branch or provide a
> > Acked-by tag.
> > 
> > @Florian what would you prefer?
> 
> I am fine either way, it's definitively simpler if I can take all of the
> patches in the respective Broadcom ARM SoC branches, but pulling a branch
> from another maintainer's tree works just as well.
> 
> Andrea, sorry to ask you this, can you post a v10 and we aim to get that
> version applied?

No problem, just to avoid any confusion I'll summarize what-goes-where with
respect to branches in your repo broadcom/stblinux, so I can adapt each patch
to the relevant branch:

- dt-binding/DTS (patch 1,2,3,6,8,9,10) -> devicetree/next
- defconfig (patch 11,12) -> defconfig/next
- drivers (patch 4,5,7) -> drivers/next or soc/next?

Also, should I split any patches that have MAINTAINERS changes so you can apply
them to your maintainers/next branch? Those are patches 4,5,6,7.

Many thanks,
Andrea

> Thanks!
> -- 
> Florian

