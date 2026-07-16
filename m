Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7875DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3kc+neWyehlIpkf7WYpZ3XjGhqaMPOicmWK3YOMAk0=; b=uSmBMa5LdeRQnmz2j6kPL2CcVk
	JjY5AnPddi7Q7nr5IPFxxg0vvb1oEUSq9KdDSoJnXxybRuGTIWuBJLIGpjOhaGUqXrHiViEHxUj/a
	a7Wv2/oHocOuED7l4HRcZBkS8SwXMRoZaMQ0t1Tnml4a9l0qXElxRnC5sS5uHxw++Rqx18Sycuift
	iOxxWFdGdJBlZlNdMlcGZAJKpLaxb19cV9v2R90fRtjDBgmEK62FgLZDmljU8pvRA4R3BVC74XYUX
	DdbL21lRIY2P5f2rx5sLe5oxoZAzgpuoaBiPeQN4Q6elURWg7hZ92aiPtPcQE8jIrIjgGszhXDj5d
	qRWP/PVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIcb-0000000Guq7-3PqK;
	Thu, 16 Jul 2026 09:43:13 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIcZ-0000000Gup0-145M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:43:12 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so73561095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 02:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784194990; x=1784799790; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3kc+neWyehlIpkf7WYpZ3XjGhqaMPOicmWK3YOMAk0=;
        b=mYos07SOXlkof6cxHm1FHg1rAN95zzmLU0VpRhS7gTQeC7p9IaZKV6gnFHu9nh8CNR
         nj3Qc18TKfSLJYYyyd+cdLkuSUwHRxVXcKBL4FPjZnep3K+hmj1tfdwEjamHsJlhP0yW
         wDkk9iMjRm0UTwMbCBMwlYUG8HZ3XJ1s6HQ976P4jM35mroBwumVy3gNjoxYmgKIwQkE
         xhgGU7gFAZV8YXQCA3xHEEy4/ae3Fq/+8UbjKQoUkkagcBdOY9tHTk8Gp6EpmP0Qu8Mn
         RPeue/lrlK1D88GhQ/MJqNGKniwAv108lt44OdxQSULftatfDN9uPnRQjW/jTIhyWdLt
         yUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194990; x=1784799790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H3kc+neWyehlIpkf7WYpZ3XjGhqaMPOicmWK3YOMAk0=;
        b=hrnJ3GR6FDeCOQbdv7qgH2HrFpRtUXwY02pDg+a7EJxpRtlg0yDdBbCs61xqXgnfcA
         fJRgVy7W3AVCSEJQL0f32iBpNFexPayRi2zc3fEPyuR5ay1X6KtUGQdFETGxbN2et5d5
         8Wx1DWpm0c3OECdgJMCZ7Wbnhcm430ulkHwH2yXGRp4oYorYPlQAiyw8WcbRFDyGEjZX
         Zj04PDXPuEw80RCc/W8VCvVpt3VjibuQS95h0NnT4eBzrlmpZkEe8EkBtrAs0JR/7NlD
         N77xO/vxBKg+IsgfQ6iEGB96JL4ur+EH4tPG6P7bXpWITfPeWA0LS3wjISJ4A22O1M97
         Iipg==
X-Forwarded-Encrypted: i=1; AHgh+RqCn0usfpn/OsM19ghj2yhdZBLEGVP/2PZOgkfXCWakwG6IBoOYR4sAOe+51gx4zPGBb+8PPKysNLYTHUJ08xwP@lists.infradead.org
X-Gm-Message-State: AOJu0YxEviPAQtFNEOw4tcXRIkKOrhchG64HrXE+VNbQ4g/rJd/wM5Ne
	wHso58Dg9GuPOYPUmHZ1qQ1/ZiTsBipJSpXFYe2AYyWLXQNUpeLBjZko
X-Gm-Gg: AfdE7clvr7hgjNB1dCNS+jluOonT4HnmulCs05CHVGX/MNMuixxsUVaypyEQNsQq/5P
	ZHy3+BRt8vJZ1PmI6HtPmqOWhfG0GcM40p+NBlF0AsxDxsMEoenZLspNN0BPLIOqK0MsJbnwSox
	C1sVgiJMRnOVjsugkoPW/lUxgDkdMRWIbfZtqGnUJ1ewbvsQcDXSdTq9MsoUmaqXHB7eBsujJ3o
	Zu1VFPHx/KCxsGPAOT2SAXGiaD/dQMazZExO7/VTkLudLfpMUYwtmKrtixGuIOI6LbzxwYW1iOj
	pBr5fEu9W2SrjZlf0XEUyHUsCXdBd1fXBIh4d7WtST/QBZfzCq9n/fRB7DH6OhZPn5c6YNCYJl2
	P8QdCvfU5d92X4NOCQpzqmSsUReFFviTvVNrlEaQ+BqeUUUAU70r+wLX2hjc1jqo4TQbBerarb+
	Fc1pRu1WvSgyHORZP4BPureDcky3DyMyc=
X-Received: by 2002:a17:903:1b48:b0:2cc:777f:d67d with SMTP id d9443c01a7336-2cf03cef842mr61110295ad.30.1784194989404;
        Thu, 16 Jul 2026 02:43:09 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055b1fcsm17449255ad.54.2026.07.16.02.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:43:08 -0700 (PDT)
Date: Thu, 16 Jul 2026 15:13:03 +0530
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: rockchip-efuse: add
 rockchip,efuse-write-enable property
Message-ID: <6gn64vxmeksjtrp7q7y5jwniszeqrmdurbp4l466tli63aixnz@i6nlxwdjhewh>
References: <20260715110107.409204-1-hrushirajg23@gmail.com>
 <20260715110107.409204-2-hrushirajg23@gmail.com>
 <2363663.KTMopqUuYO@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2363663.KTMopqUuYO@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_024311_302368_6E2E14E3 
X-CRM114-Status: GOOD (  27.44  )
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

On Wed, Jul 15, 2026 at 01:42:56PM +0200, Heiko Stübner wrote:
> Am Mittwoch, 15. Juli 2026, 13:01:06 Mitteleuropäische Sommerzeit schrieb Hrushiraj Gandhi:
> > Add an optional boolean property to explicitly opt in to write (OTP
> > programming) support. eFuse bits are one-time-programmable and
> > permanently set once written; write support must therefore not be
> > enabled by default on arbitrary boards.
> > 
> > Boards that intend to use software-initiated eFuse programming (e.g.
> > factory key provisioning) must declare this property and must ensure
> > the required VQPS programming supply (1.8V to 1.98V per RK3399 TRM)
> > is present and correctly sequenced during writes.
> > 
> > Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> > ---
> >  .../devicetree/bindings/nvmem/rockchip-efuse.yaml     | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> > index b80fd8d1ae5b..8a7195245c84 100644
> > --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> > @@ -46,6 +46,17 @@ properties:
> >        this property is defined.
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >  
> > +  rockchip,efuse-write-enable:
> > +    type: boolean
> > +    description:
> > +      Enable write (programming) support for this eFuse block. eFuse bits
> > +      are one-time-programmable; setting a bit is permanent and cannot be
> > +      undone. This property must only be set on boards where irreversible
> > +      OTP programming from software is an intended use case (e.g. factory
> > +      provisioning), and where the required VQPS programming voltage
> > +      (1.8V to 1.98V per RK3399 TRM) is guaranteed to be present and
> > +      correctly sequenced by the board's power design during writes.
> 
> Devicetree is not a configuration space, and I think this really does count
> as configuration - as the efuse will be writeable on every board.
> 
> You mention the VQPS voltage. If I'm reading schematics and application
> notes correctly, this is a separate input used solely for writing efuses
> and _needs_ to be 0V (off?) during reads.
> 
> You mention "needs to be present and correctly sequenced", who is supposed
> to turn on/off that regulator?
> 
> So you very likely need to define that regulator and can even use its
> absence as an indicator to disable writes.
> 
> 
> Heiko
> 
> 
You're right, the boolean property was the wrong approach - agreed
that it's policy, not hardware description. I'll drop it.

I was planning to model VQPS as a proper optional supply in the
binding:

  vqps-supply:
    description:
      Supply for the eFuse programming voltage (VQPS), required only
      on boards where software-initiated OTP programming is intended.
      Per RK3399 TRM section 21.6.1, table 21-3, VQPS must be 0V
      during reads and 1.8V~1.98V during A_PGM mode writes. If this
      supply is absent, the driver leaves the nvmem device read-only.

and in the driver, gate reg_write on whether
devm_regulator_get_optional() actually finds it:

  efuse->vqps = devm_regulator_get_optional(dev, "vqps");
  if (!IS_ERR(efuse->vqps))
      econfig.reg_write = soc_data->reg_write;

The driver would own sequencing entirely inside
rockchip_rk3399_efuse_write(): regulator_enable() immediately before
the A_PGM STROBE loop, regulator_disable() right after - mirroring
how efuse->clk is already handled around the same window. reg_read
never touches the regulator, so VQPS stays at 0V for the entire read
path.

Does this approach look reasonable to you, or do you see a problem
with it?

Hrushiraj

