Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DCDCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pXTM/+Sn5ck0pJjBV1Lup/KQT4FwvuZ93IhS694xuE=; b=O9UpYU4QlEGHaBo3mBizXapDvM
	adLAFWn4njz0g0Ih4lwzSInCIqPn4DKTjxxkRLd/i5vlkccUAyifz2i/H6Z+E2yY45jiSEOs1Mg+G
	oX7N3WMJW4l3od1JV76HkyjDYIdGQkyGdKm17quUWcj/5SlF+8C4bwg06M6VueOEGTl8lDwvctWFG
	r9RlbvXgoABILoavU6DKnHJSOYgxeiArOKmVQYLLUCJ48nb9raYW1mIDqWpxoLk59MN4moSOnuQu2
	5Ddz/BhPgqVyGc08OxenRZSFmbfsTBHNSw1aRCS3Py92J1FLdu1yCnyfgrqtY8sqTGDgG2O/kYw3W
	YBfNsamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcGy-0000000Awts-0QJ2;
	Thu, 13 Nov 2025 18:42:20 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcGv-0000000AwtW-2Alb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:42:18 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b7359b03878so119208266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763059333; x=1763664133; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pXTM/+Sn5ck0pJjBV1Lup/KQT4FwvuZ93IhS694xuE=;
        b=I3Nl8+AO8ELr5AvkaR2H7DkS3w1Emv6vWK8sNzeMiSo8l/kGbuKoLSh8HyyokM9jOF
         dznuxMUbYjqzogzKNiflMgfq9k378FCYdr85n63Y+y3EoVZbesAQXCFrAusP1rOXYYX6
         73482F6qeF5z3OzqYrR9hoSgQDc6JEEe3xxsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763059333; x=1763664133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/pXTM/+Sn5ck0pJjBV1Lup/KQT4FwvuZ93IhS694xuE=;
        b=NQvVUT/x0GJEKW1MMy3XqGlOq2/yqxyuxcsrWl/vxTrIygfn1uSa9GvlOPlq6RCaec
         YFO0HDcgTh94OG51DwDrvjfJFRxA2H1oEmUgKi4L0V7+oc2aT+VERj+uHkAGfBtwZWHh
         tHI7vdjLbgm3xtSNDcOxakZ5NlRab2469uJW7Nb0atK4kJNcwy2j3n6XJGBkH4rkeheX
         J+UyMQN0pkzEcwJJREX0uyZQ8GKv8DVALrSDOhRknops8IZ7Q5NH64KWfUWyhFJ0NceO
         K50djpMHzvgNa9OpzjsnJasw5WMW4vrKcoZfH7OME0ObESiYOQoDsrRU4UHGnHR38c+q
         dHmA==
X-Forwarded-Encrypted: i=1; AJvYcCV2xUX3a74SC9pmVJMOBzRZGxKHwcf/QQkk2bTEi3S/HBCRb0EeGTnS6z/PPJinuPc/06ulxFCbUMvmE8omD30E@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7ZSxCL0v3AB2Pyc1VS31f1hM+eF7r939RK7+0TASXAxRyCcK7
	U5CVUW1/y3CXKXKkO1+oBJ6wG6VfQ1oi2Mxyow1RVXzBH7I8ncqhe5d/NZ11wH+/jsqIvWnJOdc
	/sYyqYobc
X-Gm-Gg: ASbGncvYUW7xzY4EvRbwXTF4MqNedrseXpXRpasMTEboevHQOykI4r2aXA8ZU0JGOsU
	bXE1m/ufTQo9sclTtM942HOhpUiG5X+dZthWfZkYs7xq/neNitzEPWbrs9eLCRewJzEiqmEjqNv
	jbDROhS/yhfU35nkcDjv5UdxsFceMAnulqe2/oxGZxUvjmVJ9oqrBganOI+tZ5eT6t9qmkKo335
	CqP6o6DVsmkEtYJrhLbjAIupxUBXVy90iZheboy9hLmd7lw+4MsPvpoB5H8Kmxa6T0lt48ELELw
	Tk+j7N6rZlA2ZkrVHJRsLVIOo4iBS/R81/B/Uq3gwPRlAg12/W4ZVCvB3eYAtzlU1c4BuXO5aHu
	R8+f35o0klOnjYcdwVGTxObANqx75b7C3jho+CwjMCZ093J/9w1hQ+I/fXBw+/YQFydbEL9dfhG
	wHW4fPbJ9F7FjBrCjtk4FABax6+OCaTG1XXO2E+XZjNMrgvQ2VAQSea6RxUxg1
X-Google-Smtp-Source: AGHT+IFQ+A2C0GabO/u+JE/DJsIobEUw24w+nOzKoIXtG1Bczwh/1sWW8Np9BZ+V7c6g6E5lPaUjDg==
X-Received: by 2002:a17:907:7f18:b0:b3e:c99b:c77f with SMTP id a640c23a62f3a-b7348605dd0mr365131766b.24.1763059332905;
        Thu, 13 Nov 2025 10:42:12 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda8d69sm213689966b.50.2025.11.13.10.42.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 10:42:11 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4774f41628bso12341705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 10:42:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0v+OSPX0p/yzckswGN9E42qH6Ez8mTVALbPblfGNa6JfWqA+Cc6xpRIVpv52azCQSr2TTadNAywSApntIodoI@lists.infradead.org
X-Received: by 2002:a05:600c:c87:b0:475:d91d:28fb with SMTP id
 5b1f17b1804b1-4778bcb36d1mr39940165e9.4.1763059330721; Thu, 13 Nov 2025
 10:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org> <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
 <00ea821c-5252-42cb-8f6f-da01453947bd@kernel.org> <CAD=FV=VSxeKgGcsRb9qiXq7nsbOWZjPvzmGEOhFA+pmABWdknQ@mail.gmail.com>
 <6490f20a-2492-4ee0-8f34-d529e0df0bad@kernel.org> <CAD=FV=Us7SU_OifVkS4mdfVhc=xGYSBiBpBk9aA1Ki0y+iYBpQ@mail.gmail.com>
 <abb77afe-c285-46ba-88ac-08574bd67712@kernel.org> <CAD=FV=VcAbgv41tjgWQN4i8Wqk6T6uvdpQ261Q_hcKM4AMpGEw@mail.gmail.com>
In-Reply-To: <CAD=FV=VcAbgv41tjgWQN4i8Wqk6T6uvdpQ261Q_hcKM4AMpGEw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Nov 2025 10:41:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X4bV_YdeqymOMb5dphZwW4T4tASJo6hbuCjDMykVtYVg@mail.gmail.com>
X-Gm-Features: AWmQ_bmy1aehQ6uhI85I3Z-_qkNj2-reqpyxguooVv-yaJfHf2TNxdZyFa3FBPw
Message-ID: <CAD=FV=X4bV_YdeqymOMb5dphZwW4T4tASJo6hbuCjDMykVtYVg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_104217_632764_EA2485C4 
X-CRM114-Status: GOOD (  38.58  )
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

Hi,

On Thu, Nov 13, 2025 at 10:04=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
>
> On Thu, Nov 13, 2025 at 9:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > >>> Yes, the complexity of just "hooking up" the components on an SoC i=
s
> > >>> an order of magnitude harder than a Raspberry Pi, but it's still ju=
st
> > >>> hooking it up to external components. In both cases, we are modelin=
g
> > >>> the core "brains" (the part that contains the processor) as the DTB
> > >>> and everything else just "hooks up" to interfaces.
> > >>
> > >> You mix the topics, so I don't follow. I speak here about bindings -=
 you
> > >> cannot have the that compatible alone, because it is incomplete, jus=
t
> > >> like compatible for "transistor" is not correct in that context. You
> > >> speak what could or could be DTB, different topic.
> > >
> > > A "SoC" is "complete". It has a processor that can run instructions.
> >
> > Then show me executing any piece of software, which is the consumer of
> > the bindings, and runs on the SoC without the rest of the hardware syst=
em.
>
> Show me something that runs on a Raspberry Pi (the models that don't
> have eMMC) that runs without hooking up power and plugging in an SD
> card. :-P
>
>
> > > In any case, maybe we can approach this a different way that I allude=
d
> > > to in one of my other posts. Can we just call the SoC thing something
> > > different and make everyone happy?
> > >
> > > 1. Rename the SoC file to lga-b0.dtf (device tree fragment) and
> > > _REMOVE_ the top-level compatible. Problem solved--we're not adding a
> > > top-level compatible.
> > >
> > > 2. Add a special node at the top level of the "dtf" file describing i=
t
> > > (so someone could figure it's useful for). Like:
> > >
> > > fragment-info {
> > >   compatible =3D "google,soc-id";
> > >   google,product-id =3D <0x5>;
> > >   google,major-rev =3D <0x1>;
> > >   google,minor-rev =3D <0x0>;
> > >   google,package-mode =3D <0x0>;
> > > };
> > >
> > > 3. We can compile the "dtf" file using existing tools into a "dtfb".
> > > This looks just like a "dtb" but has no top-level compatible but
> > > instead has "fragment-info".
> > >
> > > Now we're not violating any spec because we're not adding any
> > > top-level compatible.
> >
> > Didn't you just describe an overlay or DTSI file?
>
> Sure, you can look at it that way. ...and since you're happy with
> "dtsi" files I assume you're happy with my "device tree fragment"
> files, right?
>
> The difference here is:
>
> * A "dtf" file must be able to compile (with dtc) on its own. Contrast
> with a "dtsi" file could rely on labels that are provided by the file
> including it.
>
> * A "dtf" file needs to have "/dts-v1/;" at the top, unlike a "dtsi" file=
.
>
> * Kernel (or other OS) build rules will be happy compiling a "dtf"
> file. This is in contrast with a "dtsi" file.
>
> * A "dtf" file is _intended_ to be compiled and hooked up to an
> overlay. This means it will always be compiled with "-@".
>
> * We can document the requirement that a "dtf" file needs to live
> together with the overlays that it will be combined with to make
> complete device trees. This means that there is no need to set a new
> ABI boundary here and we can be flexible with what labels are exported
> by the "dtf" file.
>
>
> If that all sounds reasonable, I'll get working on it right away.

FWIW, I wasn't terribly happy with the name "fragment" or the "dtf"
suffix but couldn't come up with anything better. ...but then I just
had a realization. Perhaps it would be better to think of this as a
"SoC Tree". Thus:

* .sts: SoC tree source
* .stb: SoC tree binary

...and a "SoC" tree it always intended to be the base for a device tree ove=
rlay.

This also matches with my assertion that really anything with a CPU on
it should be able to act as the base here.

-Doug

