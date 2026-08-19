Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE9CC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 11:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rruUpDInQvQQuqMyUIBpR8nVOpeVCVZSdKEK5ZtInD4=; b=LUse8zTUhOcQawPojQXfn9k0vH
	Ix1DEXpnSXLx3XdJp5yavpfFhqxRnGR4VLk8C8QjNgUgPAF/8kbBzpprp8hA+0aPeUuQWYtzRQ4Y/
	hqrP4P3cKJlIoNQ3B5v3e7iVqAFcJ3xU9mT9jvS+xSS7O0rD0Sjid0p+i9xstvu8Arx555OtkSaGB
	wITYuxFvB2Qln+Oq5CM9jRylwZQe6x2jSr/3bPfFgREu3eps2KHje9tBprmJWcwI8cO7Y9jt1NFxg
	f6AEvQaNWvFAOwPZVm4qYOWseNYNP1ft+PxOVHinJEMCG4eQU5qeDoWRglzLawAmtyjPx0TqtYD8t
	oLKKtQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwehK-00000009gqT-3t2m;
	Wed, 19 Aug 2026 11:43:10 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwehI-00000009go3-1bcr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 11:43:09 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3a181e96cbeso8475791fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 04:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787139785; cv=none;
        d=google.com; s=arc-20260327;
        b=rCyaJHvTENYH9bePO2IkYxztFqbTSKCfU8DEqfWjI0Av57G8y7mp/5Uw8UNaSokWV0
         8afuWboD2hCXhX6L8jRvVYIISUPW1d8Eg9ZzJdDIvNCRctK3iBljK3lRYeWbz0YQSyMH
         38T94aWJZMuwDFRHWHCAlyEVIm+Rg43VgNVdOYG36reE2How4OGs8/zCSpC7k9dYtmho
         HjqmK3udy6TcchLcF+tFRzJfIp8NHLTjs9clKUUQx/6nkZt7z70L8/2zCSDAjmXNgG5F
         uLLwd5zk0IEeeLzZecpfqoU9ZFz9m4xcWJxG56ZKs03EskpksdlAsTy3RSr2ux1V1fOQ
         z0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rruUpDInQvQQuqMyUIBpR8nVOpeVCVZSdKEK5ZtInD4=;
        fh=Sv7d0It65AW4KGWhI77xXjXepQ/fdKhwLZAMT6NMt4Y=;
        b=f17RKOsd0/QmPCGJc1kMKdxYPrkmpxTLIsfwEqR7Ckl6iFfoblQYINFTmrgw6IlGS/
         E9bIqfiADqAaZuzdhIFsRontrqjHpPL3D9iN0qBqqW5xVjd9sqxRAOMaoupXRLY1Xmok
         v0NdW1CQ4qqmdIvVUn3fweadNqTcAjO+19Qq0LNtAm9J8z2ioo0i1oQoYJ17CgEo3wSf
         SLHm9BCjDmnok5BEtcTNgUeaUBmAqWhMreAimkjCCH3AQ34rQxe4xc6wIvjhQZ5kyyEm
         1IH6jyYwtqH38Zi32B4ZBnh6pzh8jqQxvnaAmayke8GxAwvQ0JnsjunFmCCzbcV4qoZV
         dYLw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787139785; x=1787744585; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rruUpDInQvQQuqMyUIBpR8nVOpeVCVZSdKEK5ZtInD4=;
        b=FWaPsDfRoXnbbsa0TUgz02SWqj0EPm0YSZDSWpBp7JeGqaKQkEBGtnlgQkqcazp7/C
         k+3Iqe3bQIsFa+hm+lmjBQXdigCjfS04kzfbIXzE0ynZXy/CA1rfcsIfMFMA0/cRFPDG
         0H8Psg0GaBDrh2fe2vythJ5btpLP9TerOy8Ir2h4Vunyc/MsfKoxNEu0Y/HlyVYsEY5L
         k0kO92ib+iLvarLxMnqFCM+f3Wbl271DUwc7JZX93rdLVW4b7ZbeW5RDO+9RbcZm0QSx
         qkuYgPSDtwMy737G7NL4MkNCrlGVMmhJhwDJQrv/wsrMxqR1eymydaY3DU1vBPticveY
         Vf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139785; x=1787744585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rruUpDInQvQQuqMyUIBpR8nVOpeVCVZSdKEK5ZtInD4=;
        b=JeCtQmKYw98mo1gzcILQiU8HD9cyp7r1+dJEXBevPBU3XepVFBbfuQu2+tiHhaisVH
         gTmrr/g8XfrsYjPzoZgD/HFMgVVyZraw8zHpyoA7IJOWiL2cxBOebOhar5mDr0/KsWJK
         LcLM+wAD75cDQ6HIK3MpvowOOC1WQnaGUUzMF3gJ30+/U8cyOYBjW2fuzUqpUeE1nEDK
         VaNiZMDnXKQRA4mYrIfCXJsPus+5wVAmjtZapC08bcCr5ECc+jppdaKJ4H3+0GW2QL27
         k8grtCfO/6Y/Z37wbXrn6YaD7vaUVWKQfdC+ja+dDn+s7nkMQW324l5in2fQUB4/3Qgt
         BRWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqP/Xm4DlGlcsb6/UNm+t0v2ROKDeXwu5Hafi7ySCSeP6T2YVSUPXA11uEZz2AI1C5oPGzJtKxDp3J8j9Ftr4j9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/cHyPVDTAOcFQcoBcFuYD7HQaa4CkehKd9nkc6X5Kn3kKm65e
	QgEDlb8E8cjozSFNCwxGKChgQGH6Q1nlQehN1Ol3crNn0PGezU1bGzK+AB0LmRrjT7y46/gQSn1
	kqFchCbVn45yXDcGw1ROqdlDfWrjBbuM=
X-Gm-Gg: AR+sD11pJhKXNi5mBK/tD8R7x3E0SKuRzJ+y39P3/8SHQbtEe9+BtUa3DvQBURZ18Or
	aL39bKlyru5tUEmMFY1HHUGqsXW5qv2RM8blfwB3ps3u0o283wWqVl+S4gj8fi9IVIqtOd2aH9C
	IpdPzaK+rJtHhwxZ26rXvmmzcf0LIXB8MJSWgxPpoucCSFGs8inutYv7Xduo4XKH2OrvDBInrcZ
	nJdtK3hz6TukcIlGFHBFjWyLdEuJb41o64cJvvTPVF+FC8IUdiuYWTmJW1saGmnJjvGDA2tDX+L
	HzN3L82JNxkTZ+wy7ZGQoUpj60oLQR0epMxQoymsO9R6EJEwjKT0bJxilYK5ywKBAXO5ok81gOB
	2kbgM97o00UHAhrT3fAWGf26DoQ==
X-Received: by 2002:a2e:bea5:0:b0:3a1:85a0:c5c1 with SMTP id
 38308e7fff4ca-3a1899c16f4mr8655901fa.11.1787139784486; Wed, 19 Aug 2026
 04:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com> <20260819-generous-nickel-dalmatian-b6bb08@quoll>
In-Reply-To: <20260819-generous-nickel-dalmatian-b6bb08@quoll>
From: George Valkov <gvalkov@gmail.com>
Date: Wed, 19 Aug 2026 14:42:52 +0300
X-Gm-Features: AcwNN1X_uzL9E44yhbWS_M41oClBHdMfV11eL6pc59WJx0lXGGLZ-ZZh_4cYzLM
Message-ID: <CADOrJmYfBe3ADun_kFjFSH6YOSTX7Vu3UsFsL57yuRdaQ=eJCA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, 
	kees@kernel.org, miriam.rachel.korenblit@intel.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_044308_460017_D10E67BC 
X-CRM114-Status: GOOD (  26.45  )
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

On Wed, 19 Aug 2026 at 12:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Aug 18, 2026 at 12:54:26AM +0300, Georgi Valkov wrote:
> >
> > diff --git a/Documentation/devicetree/bindings/net/wireless/marvell,sd8=
787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.ya=
ml
> > index 930b700b73d0..5f235cb9f3e5 100644
> > --- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yam=
l
> > +++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yam=
l
> > @@ -59,6 +59,12 @@ properties:
> >      description: Calibration data for sub-band 3 in the 5GHz band.
> >      maxItems: 502
> >
> > +  marvell,ignore-regulatory-hint:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Ignore an incorrect regulatory hint from ROM,
> > +      so userspace can set the correct regulatory domain.
> > +
>
> Same comments, so you just ignored entire feedback?

Do you mean this feedback? I already replied to it:
> > Anyway, property looks like SW choice. You must describe hardware
> > instead.
>
> I am sorry, I do not understand what you want me to do?
> Can you please send a diff or a clear description suitable for people
> who have way less experience than you?


> Again: you need to describe the hardware, in commit msg, in property
> name and in description. You cannot tell SW what to do, that's not the
> purpose of bindings.

I still don't understand what I should do?
Can you please show me an example of the changes you want?
Else I'm likely to make a wrong guess and implement it. That obviously
won't help.

The commit message already describes the issue with WRT3200ACM and WRT32x.

About the description, do you want me to do something like this?
    description:
      Ignore an incorrect regulatory hint from ROM,
      so userspace can set the correct regulatory domain.
+    WRT3200ACM and WRT32x are known to need this.

About the property name or flag, do you want me to add a separate flag
for each affected hardware device?
- wrt3200acm,ignore-regulatory-hint
- wrt3200x,ignore-regulatory-hint
- the list may grow if someone decides to add other devices
- and the driver will need to support all of them
- that doesn't make sense, because it isn't scalable

> How did you fix the threading problem I mentioned in v3?

How can I fix a threading problem?
I don't really know what the correct thing to do is, once I forgot to add
a version tag in v4. So I just added v5 in my next submission.
I'm new to sending mails using git. So far I've learned that I can do this:
git send-email --thread --in-reply-to=3D<Message-ID> =E2=80=A6
and I use the last Message-ID.

Krzysztof,
I am thankful when I receive criticism from you or anyone else, because
this helps improve my PR and it helps me learn. A clear communication
along with examples and links to documentation can make this process
easier and more productive. Thank you!

Georgi Valkov

