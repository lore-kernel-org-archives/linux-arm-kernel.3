Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F329C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cixrKiaGYKoE51uWaNmYqYzgYbXZIR4e3E/JR6pSpcI=; b=mC4zvbUE1vHhvx5SfQeYV4idQV
	rTGDgpsbN9Wi7J4DGZ06FIRtyr7qj9Xsy0++Q5iwroKMz3GtxJZn/HeYm+fvqiaKLJbkgVJxWVXkK
	45OC342WOrT0kHT47LpTKkU7E0NQ9V0UEc6ApnkQpM8kKre8W/ViX7Vv6vPOPWjtjX+8BblDo8yzh
	MPlF0d2WvoJHe3gvITGFIcbLQxu99eWzjwenMPOZszC0VznRhSIQQcKGg1GU2PLVdkagBH0lnjk/N
	YJQ62VlRoS2qdA2V0CDr8Ws0TYC6BP52Rtk3HkNHSz0SdHcVdgMhIz5uqyAp99kRW06do1cEgHWB0
	UdVfalNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUlL-0000000CdTk-1hkH;
	Mon, 10 Aug 2026 18:30:15 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUlI-0000000CdTM-2lXx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:30:14 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so1708687a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786386611; x=1786991411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cixrKiaGYKoE51uWaNmYqYzgYbXZIR4e3E/JR6pSpcI=;
        b=fyark2NqpzUCyZMJ1j8Xd5SWGYn+R3/Ys6HLTk/nPAAbmi5HvTJGPxtUTzH3QJBbjH
         CVbmvbHyesuSVhBgjH12sP9JArMNNyrQeRhcja3IVHRsWnUFVwyfcgyY2bPCNifadh2q
         PHgrkrOcwbEHvTsT4XifMIKvWon+xVzD9AWsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786386611; x=1786991411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cixrKiaGYKoE51uWaNmYqYzgYbXZIR4e3E/JR6pSpcI=;
        b=TjBMz8ZutNzgGrVKjqEcZGGQO4Orh/arBWURn87QaUXgkgYjDbxhRcNHIMeOLrg1eg
         Nmu4kX2+uvxlCDiyyQQ1XIfp+S8+xVhZxgWzNaHHALI4G8i5cWDEHmm30XVGPfYoLTly
         t98Y7vAsB2f6ILW0UkG3WGdu0cKQQ/rPtH2DHP/Eq+FsZsZPcGaHkm02WNizSilbk3am
         uPFIHs4k5HOEEKlUktblZPaLOevRZzsHBqsKRs76lJcCnmWM4dvvT+SROyKjkTJnjwS+
         HwQCuaaTrc2XTbQQ4qmNw7r3byoBorc7t3woAkxzaBzTFxAFzic1UhDX+wxltCtUJ3Tu
         /0FQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZ0a6O25RKgIeQs02nw5ljh+a7EUkgfeOAdmNHXZTEohZJkDp9+9YbaXHcLo3AgtFJGgFM8AHtvlkWK/3cuKxY@lists.infradead.org
X-Gm-Message-State: AOJu0YyMVmrcW4zSQCErci19wLh2hqd6MURb3GKsJC+wkjhexTZLOwnc
	kSZ8fkh3YBhsuWNw6yml4H/8EcLCfnK90avasmYJJSJU2fz4Zl6gNPOXpkmuJ67N8w==
X-Gm-Gg: AR+sD10vLPQ10u5iI57SY68FL60BXDIuNDSAV1phYC/WtEN/LMXNpEyWxncEMxJU3+M
	EJV2OKpNPmJaEspUSa4c0THDnM4ykapSeTUPFwF9TyiD32TVOaq/Hjkpd8fGds4KTGsglXDVkBE
	rIo6dLVlDF6Nk/AqWjQY+N0CTZTfhyhVmRX28oXwpOWE3XUSYQ1zYXRffsNhYMvkt79jPxC2j+p
	y/+HwTKFvFWuuEdfhq/Ad9ZjklIBtdgJFhrsNjsS8dlEPp7WLGcaJ4WEH/+wSMrUTykT1Cz8LLX
	214orChslhtozEFWphiknxCKzHoeNWrO4bUYAV3PxR2CxxCVRn1jw9eWHjzg7/TuzbT/zcdMPvD
	Dj6Iyfo1ouSYdZW+kaTCC2UCc+FmonG6OaWzefJcKPbv4V6644EzyUcbIc+WHv7RdUDGjTcWqEv
	PQxglTTIVomifZvjMX4WeeXGJAkRvF8QEvU0D/se4RpTBONzyIt3cvSD+RVWhHGMMfgSqTo7L1W
	c3qpASHp10lMFT/Id2CoZhkxvw=
X-Received: by 2002:a05:6a21:6e92:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cb85df2778mr59898448637.14.1786386611035;
        Mon, 10 Aug 2026 11:30:11 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5c18:61df:6569:108b])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-14101b7ad29sm36583642c88.13.2026.08.10.11.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 11:30:10 -0700 (PDT)
Date: Mon, 10 Aug 2026 11:30:07 -0700
From: Brian Norris <briannorris@chromium.org>
To: George Valkov <gvalkov@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, sashiko-bot@kernel.org,
	andrew@lunn.ch, chunfan.chen@gmail.com, francesco@dolcini.it,
	kees@kernel.org, miriam.rachel.korenblit@intel.com,
	wenst@chromium.org, rafael.beims@toradex.com,
	avraham.stern@intel.com, peddolla.reddy@oss.qualcomm.com,
	error27@gmail.com, s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] wifi: mwifiex: ignore ROM regulatory hint on
 WRT3200ACM/WRT32x
Message-ID: <anoYr9H4KojJv-aZ@google.com>
References: <anWWr80yAcOQaVVS@nxpwireless-Inspiron-14-Plus-7440>
 <20260807182124.41572-1-gvalkov@gmail.com>
 <9cf8e6ee9c4c655e685708bc5660429074b18326.camel@sipsolutions.net>
 <CADOrJmbhdWhqRj_TSKYEgb_TrbJUpkQeYTGDb_93WSDdeaJPpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADOrJmbhdWhqRj_TSKYEgb_TrbJUpkQeYTGDb_93WSDdeaJPpQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_113012_739799_AD545A92 
X-CRM114-Status: GOOD (  39.94  )
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

On Fri, Aug 07, 2026 at 10:49:40PM +0300, George Valkov wrote:
> Hello Johannes, and thank you for your quick reply!
> 
> > You're supposed to always update bindings first, no?
> To me the logical order is to implement the feature in the driver and
> then enable it in each board which needs it. For Linux just WRT3200ACM.
> A separate patch for WRT32x should be sent to OpenWrt.
> 
> Please let me know if I should reverse the order.

Johannes is asking about the binding documentation (.txt or .yaml), not
the .c (driver) or .dts/.dtsi files. You haven't included
"marvell,ignore-regulatory-hint" in any valid binding document, so it's
not a valid property to use in this driver.

See Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
for the correct binding file relevant to this driver.

> Hello Sashiko AI,
> Yes, I intentionally implemented the flag as a root node.
> This way the new device-tree property can be reused for the
> other radios, which use mwlwifi, and also require this fix.
> 
> It would be inefficient and impractical to define a separate
> device-tree property for each radio, where it is actually the
> board that is affected, so it should be a per-board setting.

I'm not sure what you're saying here. Device Tree Blobs are inherently a
per-board object. The question here is simply where within the Device
Tree we want to add a property.

I believe that you're describing problems with the radio, and so you
should add DT properties to the node for the radio(s) in question, not
the root node.

> Also my attempts to use per device nodes or the parent always
> return false so they are not usable.

That seems like something you need to figure out. Just because you found
it difficult doesn't mean we should accept the wrong approach.

IIUC, you're using a PCIe-based WiFi card, and that's enabled in
arch/arm/boot/dts/marvell/armada-385-linksys.dtsi:

&pcie1 {
        /* Marvell 88W8864, 5GHz-only */
        status = "okay";
};

&pcie2 {
        /* Marvell 88W8864, 2GHz-only */
        status = "okay";
};

I think those are the "port" nodes, and there currently is no node that
actually represents the PCIe endpoint device (i.e., your wifi cards).
You need to add those as children, like:

&pcie1 {
...
	wifi@0 {
		compatible = "pciXXXX,YYYY"; /* figure out the appropriate IDs here */
		marvell,ignore-regulatory-hint;
		...
	};
};
...

> I do not understand the part about dependence on CONFIG_OF.
> of_property_read_bool() returns false when the flag is not
> defined. This preserves the original behaviour as if it is
> set to false, so the feature is disabled.
> External radios which do not implement support for this flag
> are not affected.

I think if you stop using 'of_root', you'll dodge this problem. And you
should not be looking at of_root.

> v2 of this PR used of_machine_is_compatible, but there was an
> objection that this adds platform code to the driver.
> 
> How can I add binding documentation and where?

Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml. See
the other hints above too.

Side question: did you consider Jeff's suggestion from v2, to try the
'reg_alpha2' module param? It might already do what you need, and it
only requires you configure your OpenWrt builds properly, I think.

Brian

> On Fri, 7 Aug 2026 at 21:39, Johannes Berg <johannes@sipsolutions.net> wrote:
> >
> > On Fri, 2026-08-07 at 21:21 +0300, Georgi Valkov wrote:
> > >
> > > +                             /* Allow platforms to ignore an incorrect
> > > +                              * regulatory hint from ROM, so userspace
> > > +                              * can set the correct regulatory domain.
> > > +                              */
> > >                               if (country_code &&
> > > +                                 !of_property_read_bool(of_root,
> > > +                                                        "marvell,ignore-regulatory-hint") &&
> > >                                   regulatory_hint(wiphy, country_code))
> >
> > You're supposed to always update bindings first, no?
> >
> > johannes

