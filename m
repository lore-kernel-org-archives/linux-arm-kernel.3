Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9367C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQtOWDkW+w7ybqaZBfV9HKOca4eSda4cgJxTQC5fkhA=; b=cjbSIIau2PRB7zhEOmXuWFasNE
	xr8fH3K4o7AMxyxGr86lHHYvY09spzdMCVLpC0KWJrFjRga2BiSsrkcKCNowVL52vr4H8EGLYuz1q
	XKVUkiWycRdUJsB7TlVYzQaer4HcJ94ibX2ZL6L1BpgRDBxCLBLmFa8fYF0O8RjId5XKpHnONIQkG
	3EGA9RiDJYj1LB9iIn+bw5mlVgP3hg93YPPVTPmEbMtBdMyVZrOpfDC7VLDlOw947SkN5KVnKa/r4
	AMOA6v+2DN4rFVjDvHngbeqI7w+ML0YTzSojeSF1Dym7gAuOJUNA7zoRM4UMmu2H+y63bXTDKBMUo
	VlvsToaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11T4-00000009KrD-1mwp;
	Mon, 31 Aug 2026 12:50:30 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11T2-00000009KqY-38qI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:50:29 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c250f28f1cdso535663566b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 05:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788180627; cv=none;
        d=google.com; s=arc-20260327;
        b=S4VLtKAiFHqU1bZ636CR4lvX6AZbWMNVo4VR3YiXrP2jouqrjPcsvShEfFi/AlbcO4
         4NcP6GzsKSt3PpT0AFBndW0+hAEwZI4NvQLbF6DUFtrXI+7fWLLolVfo71uB2AVZ6Zvc
         ZyNS80th06ZFGQVZMuz4zNdU8JbFRaXh6+HIeldfcjcBXZBjbcuU9bNedWURziruCorj
         GICpW2oF7vv6S8+36FMmHGkMvJHh5lAY4tj8HgzrOXlMnJMNYcKwqX7Z2DehJgsvavFc
         n2Aq82670K2nKwlOlUJ6Wa4E3ty/y1SuJq6XCekN0iaRWuNFu41shFJsnvYKKniMPqp3
         VH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQtOWDkW+w7ybqaZBfV9HKOca4eSda4cgJxTQC5fkhA=;
        fh=t3w9f7TJvwY2sqsE+/MHF4l/XJzk2av+EqqmjnR+xK0=;
        b=ETvjMpjZyaToze6fhaAByeS03//AlvDoJScUpdE2Uhmnxs69AHWOTIx8gsiuulr41C
         /FJVMViKVuz/7WFU7SYCAjvioHnmEMOwDvR2bK2X2IS1A5h3ywB/YCohxGq46d7dIaZ2
         SsNubxLbWPN403PlK8sHmfqA1aBSCQL0UxEnTZxRppBIu2T4SE4Fv2F0pDONAoyB/l6g
         z2F0x6jqpbgo4FmkrC6B9vnD4g1X2/2wCd+nIxGrCrgwVnrTYtY69bvnhTCE+Fq2DHcS
         nTFa231CKHF4GHo9wOcOMuX7Kug7uaX5BHtb/iMQgho1ijKxZGRKcD3FHkT/OwTwecnv
         nwTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180627; x=1788785427; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQtOWDkW+w7ybqaZBfV9HKOca4eSda4cgJxTQC5fkhA=;
        b=dVhrj4bdObbnjGo9xhPFyJb56knMwv7k31+THzNYMxTdXia94jMyJj/8JB3Efb8Irb
         YOjvUPtO517OCmQD0A9RmJH7+5qbsY4Bqhn7LQdE1X8sk2H5ap21VY7b0xgkEMxvk1PY
         lYsS6C/DdzHt4z1i29YAvKsdV4xmph8kix4N4iekqSH4Qf0GbV2Fn29a6xQ4fiwLdvQv
         bxRX6TDeFw/pKqlEggJG+7GmZc8fVEqnYZijGUZzLuJf5co1Hym/icMGMhgPevMcBduA
         Qnm6bknuB/V8h7JOMClu5wWZnrhcNbHcaPDx/oLT4OlqMG1T4yaRidElG60ezbqOs2xs
         iXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180627; x=1788785427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQtOWDkW+w7ybqaZBfV9HKOca4eSda4cgJxTQC5fkhA=;
        b=sNbq91x/5SrsfohRiAzDKSKYmKMcpzKB4OZFrtcXv2/g7+HES/PToBy4J7vch56jEU
         +LQ0Oi8nyXH2x5G1T4pcq5pvcURQRSlcXigPqcfJTepmJMn8OhmfSiQfOcnpNvpBv7Fx
         4M1a7Jv8rSZHSgUq+y9wX8D2C4y0RMkQRZAVWJta/EiHD1CnzfUxeN6rXLyalHwWAJUL
         WBmoSIAw3dIkyg16QK5CHZJdXkEzIin2fS1jeGhLKwCamaXKywfSGGtRKbhs+qSOcZNz
         3jn3SZbvtiRXwrDpHs0ZQAfphyqLxkd96aPYSjsHdTCTt2mTUArgY1bssjT1hp3ob/vp
         GsQg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7pX/gJJsDPY4Uk7nMtxgBIPW8W5ibCko5zFSf32Y2sXn9ct8uc2tzMm9wEFNhCTkakuYcHojmniTM/49Mn7AZ@lists.infradead.org
X-Gm-Message-State: AFuF++krTSL2mpiIlr9FIyeDX44+Ld+nucXnht/pyjYvzRA8Vaslx6Xn
	01Vo0QlXbXRELQ3DuRTivMwBHY7ITycpW27BuB3rW5bnx1HjLm7Z3Q7aGxxHgp2oNVnZLVjsB/3
	mb0+Q1vv9HvPGRR5CSU7gfT6oBoZRkao=
X-Gm-Gg: AR+sD12cEqMluToWweYkccGifIdVIlS/XdFZsWngnQenRj0WETxN7S8HxHuDgx2nRRZ
	F99jLz8CgRbWFaJJotGzD8OfW+k4KnuTORMw4sDCS53DFVNNCZzBHsI6IbsF2TgKLgNB/DqcTsG
	YSZcw99lZjwY6YeMnibLpJbJhUKXxM+x2yEycdOmwKOOPXNsX5aQhyVhNWnJnfF8zq7WqzzuxrW
	sKlM/78dzMWg+CjfyiFJgz1VvHEXf+on62ki6WskDkb2CyID1on3C68GrEWA6Qwf8cD1ZcZ5hz+
	jtDEwDMrpEzbxdC87+Ruk4OJSRaGAEZwHrnhW88r7gDnhA==
X-Received: by 2002:a17:907:e917:b0:c15:f598:60c0 with SMTP id
 a640c23a62f3a-c2556c61b53mr1648394266b.4.1788180626731; Mon, 31 Aug 2026
 05:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch> <CAMFFDGgTnNouukst3V1rEg0NCNMW-BZ6tM6+fbQc0zeXaOb72w@mail.gmail.com>
 <daf98fe8-70f9-410e-8a2a-042a671086c2@lunn.ch>
In-Reply-To: <daf98fe8-70f9-410e-8a2a-042a671086c2@lunn.ch>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 31 Aug 2026 18:20:13 +0530
X-Gm-Features: AcwNN1X0boEpGKg5x_16jtNRieTR5nthk-taojlLL5pnPEzmWybbo4sOjQPV9Io
Message-ID: <CAMFFDGgaEXdCdoi3av+HSLfUCZx-_0p4j7c5bjwiq_F08et2AQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_055028_813594_DADEC867 
X-CRM114-Status: GOOD (  28.57  )
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

Hi Andrew,

Thanks. As I mentioned earlier, I had already found that the AST2600
has MAC-side RGMII delay configuration.

I will now check the actual delay register values on this board after
U-Boot has initialized the MAC, and compare them with the
corresponding U-Boot configuration. That should help determine how
much of the observed behavior is coming from the MAC-side delays left
configured by the bootloader.

Tan Siewert has also confirmed that the RGMII traces on the B650D4U do
not provide the delay, and pointed out the difference between the
SoC-specific delay handling in upstream U-Boot and openbmc/u-boot.

I will investigate that before preparing the next revision and will
remove the RX-only delay claim from the current patch.

Thanks,
Prasanth

On Mon, Aug 31, 2026 at 5:42=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 31, 2026 at 06:43:46AM +0530, Prasanth wrote:
> > Hi Andrew,
> >
> > I do not currently have the PCB layout or trace-length information, so =
I cannot
> > prove that the board provides the TX delay externally.
> >
> > What I have validated on hardware is:
> >
> > rgmii: fails, with RX CRC errors and no valid RX traffic
> > rgmii-rxid: passes, 5000/5000 packets, 0% loss, no RX CRC errors
> > rgmii-id: also passes with the same traffic test
> >
> > This shows that the RTL8211F RX internal delay is required, but it does=
 not
> > establish where the TX delay is provided.
> >
> > Given that I cannot provide PCB-level evidence for the TX delay, would =
you
> > prefer that I use rgmii-id for the next revision?
>
> There has been a number of threads about the Aspeed SoC. It typically
> has delays enabled in its MAC, by the bootloader. The Linux MAC driver
> does not disable this, nor does it mask the value passed to the
> PHY. So you see many Aspeed .dts files incorrectly using 'rgmii'. Over
> the last couple of years i have been pointing out this problem, but
> nobody has stepped up to fix the issue. Most DT developers just leave
> the Ethernet node out, in order to get something merged.
>
> You case is interesting, because you are not suggesting 'rgmii'. So it
> could be there is more going on.
>
> If you look in the email archives you should find the information
> about where to configure the delay in the hardware. You might want to
> read it out to understand how the bootloader has configured the
> hardware.
>
>     Andrew

