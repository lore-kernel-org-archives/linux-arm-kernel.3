Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCDAD44164
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDYLpaBTjYbFNPHg2kQ1gn8B+rdgjHgQZqIXDZficXs=; b=Vf4pvHfqiEVYIk62eYcYBewgfR
	V3UR9c7dczf18T9mTKvT9Wcs+Fo1RrjYMUftz1kM8fc1eMx5kzQgdpeMJ+RKBdSEtr/0yhLZNLzip
	rYGFFi0aECYp+1mB2AjByLHEm+i3HRG91R5X6w4sam97XDE9IuW6ZitznDbNy5Iw8tmd4UJDX5j1Y
	g5aZW0JLzYhWgFgf6S1ZDvVAXZzJfKgho7Q1tc0OIRGwvw0epQGLh5s2xmhG8EAgyy7axnmfEWU+g
	7g9W6d39U7PTzZAKTmKbV/xvv/wcZBM4rCzfK0N3l2nhSu+RWZYb6Z8rktAmT+FXipM2kTSbnDZdN
	AuVCE/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU0J5-00000000QX3-03Q8;
	Fri, 12 Dec 2025 10:23:27 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU0J1-00000000QVt-1jFk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 10:23:24 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-64165cd689eso1676952a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 02:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765535001; x=1766139801; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CDYLpaBTjYbFNPHg2kQ1gn8B+rdgjHgQZqIXDZficXs=;
        b=fdMVzzAPaQJyDMrF/Rq0z//j11xwmtEPdHDidhxMud1+kJQ4y04VvVce9SY656v/LR
         HfSXG/mde/j4iUuRTKQ0tylvQD3hC8Pg+Qe+/DMktLcc2ONh+NgA1h3M/eqJcQfoFS+l
         oQ/hfou8MMkwL6tWVLFyS6NVmwgmpH+Z+tefiEdmLvdGhJnvTCG4x1GCIdBUVVZ99Ed5
         z0XySpiPjqoDYVHpV13DO5LAj3NiZLykcczA2o2DwT+GnsL48fMVG9/frdc2KR4+IFeW
         xjtZdfPNosR6g692WhdBxFuSy//HvhUFPuILakiZOIYVoWVHafdLNpWGz7tREY8Zqw3b
         ckCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765535001; x=1766139801;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDYLpaBTjYbFNPHg2kQ1gn8B+rdgjHgQZqIXDZficXs=;
        b=qsIJPLR+//bBlc7VusL0jwFfZhtKXk9ZKC7hfC3pwxSKJmjE26XYWvXD0ygmQA++cV
         /98fyu27x5YUs3bfjo1Mh1gcnWDO1IH0uyowX/OJ5LQDZvmOf8T9CDc/wwtPIbybO3ng
         ZVSxUmFhvjGCF/4h+1fljBu/BeFRbs5NSGavVO6NDo3hq2lvmjWL/kaAqD5RBFTLz4TY
         zruZmIryaDxmkOzZPnspzT5yWgENnVgHMQE5dyZhuTtU8FVvUtxbQIZZEywCycY9fp2y
         /21h8auBZwar/PvH2Ne2nR0NPhJD97CnTB0XiI3HS7h3xDvswo0EdkN/glyFc/zw9ypr
         7K1w==
X-Forwarded-Encrypted: i=1; AJvYcCVoA66k0h18vbLHcUccVBykKLv1CE6arbd+nRqIEG3/eg5zPooMcD59Srx5aJUCFj67YhwJtG/D1+InCs2WzYBX@lists.infradead.org
X-Gm-Message-State: AOJu0YyW0UnhPtq8vo1y2W2KOCC9W3U70OAuW+HaLfZYNn4vnL5X/hhB
	VRcbjzK+l1Ts/y6xMJlWV/FVXrRq/DimcEaV1Qqy82MxqVTogaHXNarlOCybSpIpH4E=
X-Gm-Gg: AY/fxX47qtL/a8yJ97Vs0uVWtU/fDszO9wVMFdtboEvLrKUS8RsBYg1EB/CJPjNij7k
	yHZ94nvR/MXBLsye9yj/W2b/0G0HY23tDBeGSdVozcczEkIT/dGJ/Ivn06yKnXhG9ZtkINgjSTI
	x+10WERu2bKKVd8w+GY1ku2AXNoH9IPRdqdCh6CBgl4BFpankc7jExaWTr6B6zoJVR4DbqgdxJu
	Niuus0LCfqIEBT+bSWlbNI46f+fuGDUcgU+LyNU3GXXd90OXiP79WQQw6Sj0/5t0309f/ejBaii
	mnUvUJTggzsf2eYv/e8gdCVri1kV6kqa8ABD1iODPMOSd6PAndDMgCCmcpO8hsTkWvHI2dJMX/Z
	HL4m/2chLPIQozxTKY8F4np7domH0ukoT+LyjBaPbKTvsF0JwYtrEVY7aRs+ewPhCHuZtJdN/pk
	vEc4pcGSgl407nC57nMjayv+LmlKnaLhzOi2XSGI6e3rZLko32CJv0nw==
X-Google-Smtp-Source: AGHT+IFSA/IDTOqKcf0h+pfynm/B0vl4/MfsuLtrfDiYru5ejvh12sPIowwmXp4itfh3zExKyyL5aw==
X-Received: by 2002:a17:907:9406:b0:b73:2d9c:9581 with SMTP id a640c23a62f3a-b7d21897355mr184502066b.28.1765535000836;
        Fri, 12 Dec 2025 02:23:20 -0800 (PST)
Received: from localhost (host-87-6-211-245.retail.telecomitalia.it. [87.6.211.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5d258dsm532332466b.71.2025.12.12.02.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 02:23:20 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 12 Dec 2025 11:25:51 +0100
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0
 alias
Message-ID: <aTvtr5v4DjuqctdY@apocalypse>
References: <20251102111443.18206-1-laurent.pinchart@ideasonboard.com>
 <CAL_JsqJg4aYGyd49UAAPBw+FGpmGxV5JkdkXp2FK_7Gt+7DLZA@mail.gmail.com>
 <20251212023749.GF28411@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251212023749.GF28411@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_022323_471397_67526CAF 
X-CRM114-Status: GOOD (  35.29  )
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

Hi Laurent, Rob,

On 11:37 Fri 12 Dec     , Laurent Pinchart wrote:
> Hi Rob,
> 
> On Thu, Dec 11, 2025 at 12:42:40PM -0600, Rob Herring wrote:
> > On Sun, Nov 2, 2025 at 5:15 AM Laurent Pinchart wrote:
> > >
> > > The RP1 ethernet controller DT node contains a local-mac-address
> > > property to pass the MAC address from the boot loader to the kernel. The
> > > boot loader does not fill the MAC address as the ethernet0 alias is
> > > missing. Add it.
> > 
> > My change here[1] is going to effectively revert this.
> 
> :-(
> 
> > The RP1 stuff
> > needs to either be an overlay or not. We don't need both ways.
> > /aliases don't work for overlays. I suppose that could be added as a
> > fixup when applying. The kernel also assumes aliases are not dynamic
> > and uses indexes which aren't present, so even if it did work there
> > would still be problems. OTOH, if the bootloader might use the
> > ethernet controller, then why would this ever be an overlay in the
> > first place?
> > 
> > Turns out digging into RP1 stuff, it is a mess and needs reworking[2].

I'm currently working on it.

> 
> I don't have a strong opinion personally. As far as I understand from
> https://lore.kernel.org/all/cover.1748526284.git.andrea.porta@suse.com/,
> non-overlay support was added for compatibility with downstream. I don't
> know why the overlay option was considered better for upstream. Andrea,
> could you comment on this ?

The overlay support was initially conceived for three main reasons:

- it was mildly asked for the driver to work also on ACPI based system. It was
  not clear if the ACPI tables would also include entries for the RP1 so I
  assumeed they did not (which would be most probably the case). I'm not aware
  of any hw which complies with these scenario.

- there was a non zero (even though close to zero) chance that RP1 could be used
  on other appliances (i.e. some PCI cards), which makes teh overlay approach 
  appealing. Again, I'm not aware of any real existing hw, if ever.

- paving the way already opened by Bootlin's LAN driver seemed IMHO a good thing
  to pursue (I would say that drivers for FPGA peripherals could benefit the most
  from this approach but there could be others), so why not kicking it off with
  this driver.

Unfortunately, the overlay support is not fully working for all but the simplest
peripherals that requires referencing their nodes from the main DTB, for reasons
debated starting from this thread [1].

This is why the full DT has been provided as the default. Now that I see that the
overlay support is causing a lot of pain and concerns, I'm planning to evict it
in favor of the full DT only, overlay is not used anyway and will not be functional
until we solve all those issues which could be in a very long time, if ever feasible.

> 
> > Right now, I just want the warning gone so I don't get further complaints[3].

I'm also on this. Please provide a priority between fixing this warning (I need to
do a round of tests) and fixing the RP1 DT hierarchy (there will be changes in
both DT and driver code).

Many thanks,
Andrea

[1] - https://lore.kernel.org/all/CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com/

> > 
> > Rob
> > 
> > [1] https://lore.kernel.org/all/20251117211503.728354-2-robh@kernel.org/
> > [2] https://lore.kernel.org/all/CAL_JsqJUzB71QdMcxJtNZ7raoPcK+SfTh7EVzGmk=syo8xLKQw@mail.gmail.com/
> > [3] https://lore.kernel.org/all/CAHk-=wi+ge-gtCg+iLd6dgjisGchjtsKY8AXG9tXGOxqVv8Fkw@mail.gmail.com/
> 
> -- 
> Regards,
> 
> Laurent Pinchart

