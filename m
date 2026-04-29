Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F0AFF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keKJyATHH/9XZlJC+tuXNxKnBFaRlDa69beG7NG/Ie0=; b=k+j29KhgaEXWLvl2nj500/ZrTF
	h6ZI+zpqqIimm5LRztRvwWKsZiBT0Wi1yLIDNywtBAFQdPeqEe7X6yGqK5KVBaKU9PsIhUXC6J2dB
	Nn/O6v0uIoUc8KoIkBeUAqn/Gp98bZPJBiSt7t1B+vcPhEYx8+xY8w27KxHsYYOSqcqDNPxnP4mgA
	nOD0Q7B4b7nFJcY1M2r03LsCAZdgA0ywMLtTqAZsQYxeVQ5oqsjAq8MU974vML/KsS/4ihYbo4QF+
	dfUGnHa/CBYOxG9aVdBntmquZUNWv8iw5YHIF9C77VF6xcHBWey4jor3Gxic/lYHojdhAqJWpOHhL
	qJVmvg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8TH-00000003xHb-07R9;
	Wed, 29 Apr 2026 17:13:11 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8TE-00000003xGh-1ULi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:13:09 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82f8cebc935so35953b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 10:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777482787; cv=none;
        d=google.com; s=arc-20240605;
        b=LZkDhnSdmY9MVemN0QoVGaG7438hBZfjXnQg8nU+cwhdBCJzmVy0nYeD6nxN0fDlEr
         WkWoUYs0OgOEKyDc8XKdai4zqVECqd4FGQR8QEY/z90hiZkMFHNL8y4GHO8husQFrvfw
         5h/X0dAQ//YXeoWIsa21EBNMicvYxC93D/c7yJMVj3DPyPy6heLjMd1hR1quOSTcyEpG
         ZsybTT56BD62Cr8ZmKjORUSAlhsLecViZNHhYBIj8lflgDnYakFlwhxZUW/vF7KwX9Ix
         uUlSUwZQKhfLGKxzIUYP5gkdg5GDSJsOc/8BofMT41LQjDgwzib2G7iyWBr7ZNhq8+MG
         iyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=keKJyATHH/9XZlJC+tuXNxKnBFaRlDa69beG7NG/Ie0=;
        fh=oKG77NU0IUME0YfoN9V70FQzJNP0cLuCs6UvQIm0uAw=;
        b=C8q42WC9+qUi7lb2XPNYRq0iNVdfCA2FiQ4y/FIIF+9L51Ot583Wz9nu8EzHBucpGJ
         qi5Ogo1knB5qNMd5oJjnYNx8hhwuG4IILud5+O0DmJTHmqeGQ7Y9xe3uzST1cUFcLHMR
         glrn87KGvJqwzuTnpMiO8ujq2d8Sl48Zvs0uAjVg092ZlNKU0nuskjk9Qc7J5hGINH2F
         d+OjUdk56s7hfOW9FOzlbNu5nVi2hmvip1uuyZYtmkVuyaxezdwSvahMHpD7NW+Cb5rC
         XQO6TYfjTxlnpnr3CSx8VDgohswpW0Opafkw2waJeaTjF84r5ZY5mqUSEJOeXTbJoKP+
         VoMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777482787; x=1778087587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keKJyATHH/9XZlJC+tuXNxKnBFaRlDa69beG7NG/Ie0=;
        b=bKdl5iUNA3O9BKMdyxJu/8DkkMr1yxNEVjlAFOy5eKyWxdZllSJmH9kxMc3rwXI3/i
         gWmuZtKIIugz5qJ/7NgJwRZhLUQRtaQ3TXnLVRzYduvSnqfjrdipcsk5JjMQNMbJ9cLZ
         rdmVtopHmZm4yOdQh4ER9fRwMjwmtb6ErXkaKG49wbYmNApuNNg3YHUZZDlugUu/C2FY
         ufSy6p7QQ76S6Z9xnk2yf6AvbcCPBe++Ras58RXdv3p8JDrpyMNxfl+vkEK5olsPnE+a
         yNMt05K0OsioaCqT++AULcui/CFts0WHHKK1R32bTpWgZHgo7yeCPGLuWv6fNLUZCGGL
         jQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482787; x=1778087587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keKJyATHH/9XZlJC+tuXNxKnBFaRlDa69beG7NG/Ie0=;
        b=KDhFlDbDkXndkhK68qvbvjzIDlQsXqKUjxc86XkqMwYSsvMgNzYnyXauVrAAzmaZxd
         0k4/6KOF09QqmxTQhhxwuaDC+mCGSWzOaSwD+k5/lBWf7Xt6rNCcAlNkeXPUnJ+uvFts
         oopm0bnRBHJ5VMCiMaP6S385MdadDqDurlUdcHx4FXF7NKLP0bEp006o8PDF4yERgXv6
         e6q3FXitHtkG8k1FwvebraiqUgBxBXyrRkkiStbuvQkfYPfBThcV9Wsw4iZX6FbPC1fN
         HIZjgYed0TecKlNj6ejMT/9gWIXw29O2Mksm6MIuybTlz1xi8wZ+y1eKDEkhZCu3H033
         +kkg==
X-Forwarded-Encrypted: i=1; AFNElJ/j6SS/pCYQPsEGm3VwCoLbECo9iUmEjBgi5VbIrS+8Ti754ZB3iBm+oSZKMecoYIR6eovEZWXNiygM++wYJfiv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7kmPAejK3hpM/x3e7bOWzlZE3PK7jiXo9aX25IcDkmgISnHkQ
	0EqPwveZXe3xMIJR7YBpmJn02CgKQq04THp3GKiCIl4JC+kQsCaNyRLdlTh2fybo0zu2NnNJH/D
	gVmYM91MCu/ibYyF5amc5tBkYzj/R1Mo=
X-Gm-Gg: AeBDiesJLQXy0ITOrLZuKcNMESFTDwTCwFabtiqiYrCtZ+hESV1thEEfqSzWaKRGFR/
	517ZfJCL/43ur9zzWDCwgmlo6OSCqL1TQ5F8fLpjkxwUZlYAqTDELRL/Z8AYJAsG83twpLcP5j3
	Q0toAIItUhW4vkRHE4wIfln8UTgvCAvuu2h34Lwdnxqd0l2ZDUlTwsaGDWFcxG/TznFJe8zXonM
	/Q0obQL78bKjTkXWOnNGjUIeCvMVGOxQuNhKz5mOn1Ho9/nSxb/x2zO3L2pK6kLI5AhQug5vgk/
	5xwNxvduhEhS/LGoUPEIbsN1P9uBMLl0jqPtivs589jNQONAenjlX5jtPMuBBUX2O/wvUc7k7x+
	SaQWR/7Q=
X-Received: by 2002:a05:6a00:338e:b0:82a:5d55:5807 with SMTP id
 d2e1a72fcca58-834ea5688a1mr4806793b3a.6.1777482787258; Wed, 29 Apr 2026
 10:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260423042831.21114-1-phucduc.bui@gmail.com> <20260423042831.21114-2-phucduc.bui@gmail.com>
 <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll> <CAABR9nGH4yZcgyzm=wNYVHB2vLhojZJSHKOC6dSeQPm0rbh4KQ@mail.gmail.com>
 <ce219aa2-0bb1-4a74-b40d-bd753f1a22dd@kernel.org>
In-Reply-To: <ce219aa2-0bb1-4a74-b40d-bd753f1a22dd@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 30 Apr 2026 00:12:55 +0700
X-Gm-Features: AVHnY4I11t3zhGT597ar3Rdt0vn7aUxGwU6Xnaq00d5qQJd5Fda2EZBP9xaayKI
Message-ID: <CAABR9nHaGBU9KAWJZrnBy8HO0Waccp8CCGmBdKJ3QOEb8WZsXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Joseph Chen <chenjh@rock-chips.com>, 
	Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
	David Rau <David.Rau.opensource@dm.renesas.com>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_101308_406798_0450C5E5 
X-CRM114-Status: GOOD (  28.51  )
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

> Yes. And the ABI. You cannot have ABI which has an incompatible
> implementation. IOW, when implementation contradicts the ABI, something
> is wrong.
>
> The question of course if read_bool() is here incompatible. From the
> actual code point of view, it is compatible, but how it is documented
> and how it is intended to use: it is not compatible.
>
> Also if future schema-kernel-ABI checker gets implemented, the tool
> might report here a mistake for that reason. read_bool() means property
> is bool.
>
>
> > If the hardware supports wakeup functionality,
> > referencing the core schema is sufficient. Hardware description should
> > not be constrained by the current driver implementation
> > ( e.g. the use of device_property_read_bool() ).
> > Bindings should remain stable and generic, while drivers can evolve ove=
r time.
> So you claim that bindings can define property as integer, but drivers
> can evolve and for example read it as string?

I see your point regarding the ABI semantics and the intended use of
read_bool().
My understanding is that the I2C core currently uses of_property_read_bool(=
)
for wakeup-source as a presence check, even though it has no way to
determine in advance whether a specific device will define the property as
a boolean or a phandle-array in its DTS.

From a behavioral point of view, switching to of_property_present() would
not change anything, but it would better reflect that the driver only check=
s
for the existence of the property without assuming its type.

If the expectation is to strictly follow the binding types, then
of_property_present()
seems more appropriate here.
I can prepare a patch accordingly and send it to the I2C maintainers for
review and feedback.

> >
> > Re-defining the type locally duplicates the core definition. If the
> > core schema evolves,
>
> There is no re-definition here. This is choice of subset of types.

The flow is: core schema =E2=86=92 YAML binding (ABI) =E2=86=92 DTS (actual=
 usage).
From a high-level perspective, the binding may appear to redefine the
property type by narrowing its scope, while the DTS selects one valid
representation from the permitted set.

> Where is Rob's suggestion to do such cleanups for EXISTING code? I only
> see that new code should come like that.
>
> Anyway, your commit msg is for me incorrect because it misses all this
> points I made. Whether the schema code is correct, I'll defer to Rob,
> although I still claim the same I claimed before at v2 or v3 of your
> previous work - this should have defined type.

You are right that Rob did not explicitly request cleanups to existing code=
.
I included them to improve consistency while working on the new parts,
but for now, I will stop modifying the existing code and wait for
Rob's feedback.
Since there are differing perspectives, I would appreciate a consensus
on the preferred
approach before I send out the next version to avoid redundant rework.

Best regards,
Phuc

