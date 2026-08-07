Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2335FC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 19:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxyKUAmrI0LwYfrXT8fRXwyn/HyoaEU+MOGavpvLNWE=; b=A6JgO0v3c/auy4iJ05nYqBpea9
	VCgLWYmXsPzHXj+FNHxt7FS3J3NI5RS1k3Jby4Du3Q1ucCU/wLlp3jVGmhlnl+kYk2pO7IZQ9Wyrk
	DnPQtqWkq1Aq/DaHdxz0MpuanXQGJIkEdP3bjRF+lXvO7+bLILI2Amt/SaoOUT6kUREyBUapzbOrV
	rL8KSC791OAxRQcMlVvAGg/E+QSbZjbDFr1Ka0VgE1dWiVlalGpHbL2pDQk/FNx0KwDp/olZisWIG
	74pO2IiOMeDcpVx0JHnBUyMJzZBOfHyhKIslKFkrdrphZAFr6saIN0ziZybX2EDWCEXTx7kRp7gUt
	5JqqaXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQZp-00000008gcr-2cQx;
	Fri, 07 Aug 2026 19:49:57 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQZn-00000008gcI-0OkV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 19:49:56 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so2803456e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 12:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786132192; cv=none;
        d=google.com; s=arc-20260327;
        b=ajss4xRC8Mrb4aB2LHHmrwVxxOy9OKIQmP+22+mJufWCf3Uil4ZiZECA2PYJ1uHo0u
         /DnJm8Nopv26FO7CiRtsPHmdjX23UJKAjU4rgWfiYNWrOStnyfoRzUcR1JiC6kKTxiuT
         X6OB+9Mje0lsHQYYgVC3wzGYKAG9cX7C7Lm01f78P/JUWAYD0FWB1VU3dMtA+Sev1zr0
         5GDGsxXwf86Vp+Pod1cvie0BK4UVEmrARiANolfvOPHvJT9alFtsAZ86tMXFL5E24RnW
         Jyrim6/Q+OQYgYNsgHz78nObc3EpfI8JQqGP+t4F4+6LR2hQ4LhrcIvPXBeBoWmOgOqK
         T5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SxyKUAmrI0LwYfrXT8fRXwyn/HyoaEU+MOGavpvLNWE=;
        fh=Qq1QEUyOz181R/f1Kuisf+FgQ5nADU0yDb7JGmjCJGM=;
        b=WLuwrNffzrC0RPxvwqfbBVtl4BhHEuDuc95zCPDj3+2VGre7hMwqG/NpqYD3MPpjj/
         n6a4LvBVqNpkUWUqEhlV53lwDugOpFdME4coMkqbCynWvOWuMeL7HlJGs/N3c0vA+Jbs
         kUtMmceaE1wGT7xZ+x+BEcAn6prHXtOAXiOVMzTkyjNiQtzXZUrPwNXXoVy3VWLK3bX0
         arFabhW8XWhTKi5Kl7/9ctsop0ihFldwh0HWMf/6NJxDu1PE+MoEmlep1JGHZeVeRQv5
         4Oz7AB1SWU0K/hdb0HuFpS/ocxwxSWDsMHCpLTQovOyAGy1rgYu46EWnwKaFzvQxGjNj
         H5LA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786132192; x=1786736992; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxyKUAmrI0LwYfrXT8fRXwyn/HyoaEU+MOGavpvLNWE=;
        b=e5IqjANl5fE3ud+oNrMavIwtc0j/GvKH2f4/oJnuov12Xs7o5urlNw28Pt5WDKcnlF
         rU5UL+GE80FPxHo9WKwdojM5OM2ECl84KOjLJj8ChU7yUYpPvUB0vohOY22PkyNINsvu
         R3ea7DG1TP06PTUVmZES3ShwbvzE58Gt3orJmZM3viuFFHATxj7/HQ9AZjQV1lZ4HIOQ
         10ns2GUJP0P8MDhrlrlZEwBzGPeRmEw8ZkRGMDpMfyVuv2bQVLL0SGUd0RDW4ECw+w3y
         Z8BTnKAuCaHBReQ22STI9ItsW8hRTPN97smUC0cOkcfrAfv0AmUYz6hfaHOiHmFkCrIk
         njLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132192; x=1786736992;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SxyKUAmrI0LwYfrXT8fRXwyn/HyoaEU+MOGavpvLNWE=;
        b=NXAKJ7UEwSTlpgZnS8Z0ormk9pQqiaaxd6MkqcVnTE+6ie1OC6IhzruqUbuxnvxGN5
         7f1WVFlsbJgQsUhh0gSp0KEF1TBnJSVlTqFy1vfZpL4yk/qqwcWZpaIjBi6PSEoPkm8G
         a8ryr3aVqK4MIm3muI4R1wINXbJP7D/+PqLzbkdPzxPLcsInXDaeYKg7eMrRfoqKFRW0
         6D3sbsSEHYMGcrOubdF2p8cNqMY39ELuLiaSouB2PVu/8UvP7S4xdB2NvA9H3Ca675w9
         MMXUc1uiLP2XdftDXKxoVNKHTn2OAB28Viofv3rQ4RZZ7dezeXLKPRVUv5JiU8jKwNUv
         YjXA==
X-Forwarded-Encrypted: i=1; AHgh+RoSLE4PudnGyOR1fe3iX2VRSi/XQfVszC7QIAAnJpZIWkv4VqGQb5bmru6ry1WAbW2xmF4OSN7/9BK/anKEsoHd@lists.infradead.org
X-Gm-Message-State: AOJu0YxRFLDwU4UoYp8WgsE5bX9AxtmwVhh9XWeCBdz3AUSbLxefNYxU
	DKaOvfhVZb4743J5z64L9Jb1ZIDlxsWNnJON8KI5HbK98O+I6PTQ34ahzo87Imp4v518HFwTI/D
	uTnivMbM9mj3QeVj7xPFf4zH6T4Qwrn4=
X-Gm-Gg: AR+sD12/esMq4aYKzOFoAogxZ6W34yvg2r3F5Zlbt8juMYkMM9W4ECNoxmwmughCkrW
	oV4eHNzVCUN40mIQo3J0+xzpmvISX3MRRb1htRwhvGdfxbUOA2JDm6V2WC78kSBo8eG5SBq9dlI
	3zogwgGX3g0JcrXD74YpxhbVnLwTYpV/+u8oSnlyvIvh+gQdpW1oauF4/aPIiEH/5UOf9Q8MNPi
	7eMn7EqO8DU97ufZBQUOS+cz5tdjyTNz0NwduAGhOsFuUcYgAm6qoRppmjYTrktRb4wHZXkMOpu
	dlINrxth8Boomeem8jHqPzpNJdeumDfUt/xCRMcjh7ZyNkstNuY4xIj/dR/c0ezmYkByrlmz2zf
	8PPfCWLg4sZD8K1VPZTPIKG6+wg==
X-Received: by 2002:a05:6512:3c92:b0:5ae:d80f:c77c with SMTP id
 2adb3069b0e04-5b2f4cc45ffmr3489843e87.30.1786132192296; Fri, 07 Aug 2026
 12:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <anWWr80yAcOQaVVS@nxpwireless-Inspiron-14-Plus-7440>
 <20260807182124.41572-1-gvalkov@gmail.com> <9cf8e6ee9c4c655e685708bc5660429074b18326.camel@sipsolutions.net>
In-Reply-To: <9cf8e6ee9c4c655e685708bc5660429074b18326.camel@sipsolutions.net>
From: George Valkov <gvalkov@gmail.com>
Date: Fri, 7 Aug 2026 22:49:40 +0300
X-Gm-Features: AUfX_mxRBT9-U8Aa_GHxuMmHTk-qUbjASbhV_06GViPmHzIDoVy768Olpa7FjGk
Message-ID: <CADOrJmbhdWhqRj_TSKYEgb_TrbJUpkQeYTGDb_93WSDdeaJPpQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] wifi: mwifiex: ignore ROM regulatory hint on WRT3200ACM/WRT32x
To: Johannes Berg <johannes@sipsolutions.net>, sashiko-bot@kernel.org
Cc: briannorris@chromium.org, andrew@lunn.ch, chunfan.chen@gmail.com, 
	francesco@dolcini.it, kees@kernel.org, miriam.rachel.korenblit@intel.com, 
	wenst@chromium.org, rafael.beims@toradex.com, avraham.stern@intel.com, 
	peddolla.reddy@oss.qualcomm.com, error27@gmail.com, s.kerkmann@pengutronix.de, 
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_124955_163591_2B56C01C 
X-CRM114-Status: GOOD (  20.38  )
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

Hello Johannes, and thank you for your quick reply!

> You're supposed to always update bindings first, no?
To me the logical order is to implement the feature in the driver and
then enable it in each board which needs it. For Linux just WRT3200ACM.
A separate patch for WRT32x should be sent to OpenWrt.

Please let me know if I should reverse the order.


Hello Sashiko AI,
Yes, I intentionally implemented the flag as a root node.
This way the new device-tree property can be reused for the
other radios, which use mwlwifi, and also require this fix.

It would be inefficient and impractical to define a separate
device-tree property for each radio, where it is actually the
board that is affected, so it should be a per-board setting.

Also my attempts to use per device nodes or the parent always
return false so they are not usable.

I do not understand the part about dependence on CONFIG_OF.
of_property_read_bool() returns false when the flag is not
defined. This preserves the original behaviour as if it is
set to false, so the feature is disabled.
External radios which do not implement support for this flag
are not affected.

v2 of this PR used of_machine_is_compatible, but there was an
objection that this adds platform code to the driver.

How can I add binding documentation and where?

On Fri, 7 Aug 2026 at 21:39, Johannes Berg <johannes@sipsolutions.net> wrote:
>
> On Fri, 2026-08-07 at 21:21 +0300, Georgi Valkov wrote:
> >
> > +                             /* Allow platforms to ignore an incorrect
> > +                              * regulatory hint from ROM, so userspace
> > +                              * can set the correct regulatory domain.
> > +                              */
> >                               if (country_code &&
> > +                                 !of_property_read_bool(of_root,
> > +                                                        "marvell,ignore-regulatory-hint") &&
> >                                   regulatory_hint(wiphy, country_code))
>
> You're supposed to always update bindings first, no?
>
> johannes

