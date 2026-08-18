Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEFBC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wB5u1mD3caKiv5VwodTINCWhAlYduQugf9/JTmV6yLg=; b=q1NEPikmM2AFgx5asf1++oqkEA
	DwSTrND2tMXN7FBpAbMA6mOy4e64X/Sa37v4GHzgNIdo3CDfRFpg58AoRjg/o8GyNnnsHNce9/s48
	26BvYW7i/c+MxoE8R8JFpBAGBzFAWv/lkuqFC+VLxmxgGLmcuButVHF0801vBg+AkXJ1yDz3kV9vi
	W8b8vWAwtrNYG196gv1ygaX5z1H+0A5iHoq7dd8ulSNWG60g3cRSItp6Vt2T9Fq7iBjd8ZYalIcrR
	+xYR8Dee/lWXopfWKRuUMSa0ALJVrgxL6PT7XxRAMLZShU+HKq3r/JAgKs6sHdqCISnyQr8zG5BeR
	taAIJQjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGaJ-00000007gV5-1ewr;
	Tue, 18 Aug 2026 09:58:19 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGaH-00000007gUg-17RQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 09:58:18 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so3754969e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 02:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787047095; cv=none;
        d=google.com; s=arc-20260327;
        b=kU+qBT5Wwkvq+VntMei+pnNZkRWn4WB7oOhD0lqyEDu5DHKANZK1xOHkYwB1C7nDDB
         xUBy/Tc7l1aOjVaSh4q7S5sF66ce1rEQG4ooydeoNJGuMWFaZWYStUv9GrTuoXSJ2w9f
         Fm9nNFhryysFPY1EER8VLdki2UHIxvHDc65tHyRndJAH2vLsvq0orDiFxzM+1+6di1j8
         l7nEJCdIKopIzNlflJwEzpMcp9rG6/1NQWirv0kNeYHgrD7QWDF/wkVH7n4ZQX6CR3rX
         P7NKIfylvjh/Lzpebu24fV0le9OQK/xFV/HkiDG7hPhwC5164mT3YRTz16Wqnc6iQKe3
         QxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wB5u1mD3caKiv5VwodTINCWhAlYduQugf9/JTmV6yLg=;
        fh=s7vDT8HbCqx1xFOH6CkIKpLLOasP/2broO/4FLQkt0w=;
        b=WsG6p3Ro2P9dLqiiymBFwHdigCImSf9wG4NjskUDGx//ACDLQ3gyM3GyC+VFvzykIf
         +Fjg2A3WAgSSdPTjN/mv9/AocC+HzVQ2HkQtLf5myOC28ZAE0v66Xk9eBC7euKBbFmXQ
         VK/RoLOx9VJ8kd1uMf+nAAeEcFgcDz+2WISULGe0G25dNyrVWvTk3/YAyjO6rmjOEVFX
         warfGhP6zz8Gu22tskVVHGHpkBZ4mlvsZhfUzy35eBbSh1T2yvEDQ8KGtwxYCZdC+7b4
         wahA535MhQH6FXGPRj7SW5oI6R1YOX+2kCffZt2dsEOr07Tn3f2doMqC7N8dsJ6A5YFG
         +jvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787047095; x=1787651895; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wB5u1mD3caKiv5VwodTINCWhAlYduQugf9/JTmV6yLg=;
        b=R09E4CZ7KgaUnDeu3iqII6VkPOFRypfaYp3V93aNrFVZ0+Nzu86E1aHJ/kiKq6uwFQ
         SkIEf5BExelgZJo0JlErr4b3n1tZbRkV+ePi/WHOzz13D6CUNHMjYQwWaMfsY+r3q1A4
         35vb8P3TPEuNyvz7SkdofdifNBZ6ykB/76eRtSEmso/yW2UaFxvpLbV+fMNPhtR/v4Nz
         vug69uf2A6UWFU/PyTMDm6bAGp0iDNCBPw7FhZlpQJmn/3ZybYuZZn1g9Fi7oJy7NIEo
         1Q57POisV45YPT/oqfGOMxsGyErfazuMN236pfGsP+VLKsJuwMWAlY0Rz3DcVoXqkgCM
         vjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047095; x=1787651895;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wB5u1mD3caKiv5VwodTINCWhAlYduQugf9/JTmV6yLg=;
        b=XXhpoAloHurGGy0yXfxEWjkfmb/+NCvbBuvo3w3AA8aLaxADHzpfc3ZXuSaaRNBK/b
         z8JFRdEum798EFChIEdn28Ztx4w23WqPDV75j3XZMTNTAqmuLpVQ0BC7THXMNNoqy7aZ
         AehUwGyjRgZuR9ryWmDOZPE+g0cHLnfLU1Ad1PsBOPg6eaieMgZLA1aWRwitUbWAM3RS
         F4wopdu0KEXAhDPg7B/cxDc2TlK2BrSLI4gdaqFFSjT/NTXjmf2NBTmswO9bFed8Wwb/
         3G/d8OkgBFJzwsxG8zt7uDKORQE/gsVoZ+am7LajP4K8AZfW0VYDl6zN5qI352wxkUYX
         xWyg==
X-Forwarded-Encrypted: i=1; AHgh+RrLi/hp3fwR2jpd/zPlSPaxRBFth/f4NK8zjNs3o1H5avz8Qifwry3KllSrg8B4Bbf62vLeJayubMUjIUIdn6gj@lists.infradead.org
X-Gm-Message-State: AOJu0YxSvQMd/KAiO5VkTfN7I2VUsp/sg4kIM5QBx9hJ8+6+UAiZRYAC
	rXRqqn6JM/JBAjhE7+woZFqE27fE/I7TB1c2+OUe3ysydoBrAJjbDMJnv5teEzgBPjNQ2kGdnBO
	sU7C54cyou/u96Fvc/IO+1bNo4UIQ9ac=
X-Gm-Gg: AR+sD11dS/RQ9iP7iUDkcz3p2O/R7jIfUY6kv1d+iUOe+cmyNWdqa0ReaOC8wMDbojj
	uqNKTiA22DhpnF+zQJP9HuhezGaHCagQqKY2+NeszGR4YS+0Sk+AE7OXpNSKuVbX5KtUM+FdMDy
	tjj17owOdn/H9znRjTRVXgN17TRJ5JmlG8Ssqd4M6HGCEKXQVEzWZMtzH94mEHNPI8aSsl/VjdG
	sF1oOLwrJpoGQ/hKwl/6PxLJ/VT409Nx8BmmwMmaj0vp+e+P3Mu2yFBJL/NjScSAE3IO1cMOYKW
	N5UjNlkHqskkyMtl7FGdkljK9a2YhxCjhEBBKKDmEEQH4Y9+9+xfJFo5TtPrjKg448hxD6ejIkV
	pqjx0asP+RMpBOcQGrMKaMsB0Dw==
X-Received: by 2002:a05:6512:3d12:b0:5b3:c15:c688 with SMTP id
 2adb3069b0e04-5b470661ef1mr1563289e87.7.1787047094580; Tue, 18 Aug 2026
 02:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com> <c10c5132-1bac-4bf7-acd5-1319ce072eaa@lunn.ch>
In-Reply-To: <c10c5132-1bac-4bf7-acd5-1319ce072eaa@lunn.ch>
From: George Valkov <gvalkov@gmail.com>
Date: Tue, 18 Aug 2026 12:58:03 +0300
X-Gm-Features: AcwNN1XJfTB43bmjv2TjXUd_fF7J3LtyinrySWzpxtBcHtKj_KY-OKWZu5UgGM4
Message-ID: <CADOrJmZpJo+MDZpaAC=cGv-i_ZZ0wNjWsMP-dttnE3aQPpHLMA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Andrew Lunn <andrew@lunn.ch>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, krzk+dt@kernel.org, 
	francesco@dolcini.it, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_025817_344981_9A68DD34 
X-CRM114-Status: GOOD (  20.97  )
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

On Tue, 18 Aug 2026 at 03:53, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +  marvell,ignore-regulatory-hint:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Ignore an incorrect regulatory hint from ROM,
> > +      so userspace can set the correct regulatory domain.
> > +
>
> Maybe this has been discussed in a previous version of this patch...
>
> What is Marvell specific here? I assume any vendor can mess up, and
> make a US only device, but ship it elsewhere.

I don't recall any previous discussion on that topic, other than the
use of a root flag in v3, which was objected to, because
marvell,ignore-regulatory-hint does not belong there. I assume this is
due to the marvell prefix. I guess we can have a generic flag?
Implementation instructions, along with good design patterns are
warmly welcomed.

I like the idea of implementing a standardised approach, which is
scalable to any platform or driver that needs this quirk. I would also
like to add this feature to mwlwifi (not part of Linux), because the
main radios (88W8964) on WRT3200ACM have a hard-coded region of 98
(non-standard EU, translated to FR because it's the most restrictive).
This way I can set my correct region: BG.

In theory it is possible for other vendors to make the same mess. I
think the chances are very low, because they would violate
regulations. The story with this Linksys router is special:
It was designed and marketed to be OpenWrt compatible. Likely because
open-source gives a lot of power they made sure the hands of all users
are well tied-up: all radios use proprietary firmware and are
locked-down to their certified region in ROM. They do not allow
anything related to regions to be set. A third radio 88W8887 using the
mwifiex driver was added with the sole purpose to monitor for radars:
this idea was later abandoned. I do not have any information about
this choice, but my educated guess is that using a US radio created a
conflict and they disabled support for this radio to avoid it.

openwrt-ai:
https://github.com/openwrt/openwrt/pull/24458#pullrequestreview-4956971863
TLDR: It suggests that the compatible string should be marvell,sd8887
instead of marvell,sd8897. The string it suggested is not documented
and would need more changes, which I hope to avoid. I prefer keeping
things simple. The string I used works and is documented.

Sashiko-bot complained that patch 2 adds a flag to the device-tree,
with no support in the driver. Patch 3 adds support in the driver. Let
me know if I should reorder them?

Greetings!

Georgi Valkov

