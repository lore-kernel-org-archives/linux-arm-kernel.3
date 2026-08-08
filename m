Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B823DC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=; b=vigM/q2vGbdakWvk9lGxydApkN
	joUIoc6TFaJ5/L30HjcER8fjsF+OjGzBSVbEfcuw0QNZX8fL7NHnAB9pwmnkXwyH1vPdJ+8ligI/5
	uYn/BQU3jRM1+BcZSchZLaBJaIcKcbX25MIPdL5D9zYeQ6jKgctXp3TFU/zUxgQKu6tCXPAUmVtZQ
	4YudnRoVHv8NEXUg2WyrBq2Ndq1ybopNV80OTbpgttuh7z6mbP5vt9nb7+4mxBXiYnzmTP1IaGTRu
	SZVcQwiUFs+lwsKMnVOyy79KQhrv9DmALGsUsq84EGx0f9AVfO1cJZ/mo7Zmc8vNZduccdGtCt5c4
	YgXsf72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsmup-00000009f6t-39Fb;
	Sat, 08 Aug 2026 19:41:07 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsmul-00000009f6Y-4Bog
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 19:41:05 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cc8311c6ddso437505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 12:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786218063; cv=none;
        d=google.com; s=arc-20260327;
        b=WhzjxFl3JY9OHJeytNR/Uvt3tB/w4ILH99ZkEdyc4V/CVjoJTT2RBj9JyWD0+52L23
         aDTIp+ojLwBg/CI/bCdrHdDps41C04KkgigleL6h4VJrZMxM0Dj4XTvo1Qjk2QU01Zae
         tzIE8FGN5bqKw2KUOEWto+e85BNCQ3DdTQy+w3/8oPrC9Vs5vU3e669AQT57dC/xmk+V
         vlnNemtrxLkvdGSa4o95niBgdDukUHnw00hrGGcm8GVBPIz45vCnkHgF+g4q0XxfdcZh
         z7DMq+EwzxFS05RFwR4cMIfH07yUkQM1+MnyuONaN1+N55JwObLumgBrqYz0DEdwwtY0
         QUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
        fh=GhZnK0qJfhUAnrvSOu8btSdFkhRkkbw0Zx7a8LTtA7A=;
        b=pz5OSFkUEMvTLGbFdWyb/0oEVJhY7pwj9mlgzgU4tWG7AnjLg1SFi6qwB3WlDYCzYv
         fx8kKbCFFevgRYHv2aXxSDuIdfs6bQ/HcyZN67Pn/Uoju7TC6KGv3FAp+vlzjDEI0Ic5
         1olapXfOHJF5n97l6QNQenEGRJP+ur3ILbv0OAQ5SxFCtS68ZoUxdcKvPo1u3OHsRqlZ
         ilApkVWcqJmCaaVipEKr8GqZ9RmwLmx7BCfG+tNJ97kneLjAQ++Qkv6rw0l9X12GRxEm
         Qqog3LSKfIKtdcPIaYrosxlJvOSyUZi+8KXgAFtKkm3h2cg1a6DZKNVfwh52+VwVXS1M
         N4CQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786218063; x=1786822863; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
        b=e/EalPAUpAhAqIOV7t0Ikq1T37G94LaJgBE0hqMfjvO4LBahKuAqPlkgcqVQiWlN7v
         hZWMcY2fkcbUiek22TMCQfjNuoE+pZ6fnn4EClkTp601NcCvcxXlKHEdKlKKsspcazHF
         40SeRZc1g4GssxLc+ZHe7h/oxBzLB/+20qIHe2LNUHD+9MjA7lQzwGm+RCDGBwCNj2xV
         tL+JlbCJhwpp9xgvPLyPuZn+RNbTK+tCIla4YFqpIoIA2LMUuCU0Vm3Lmk/lNSVAiaLu
         9YRvcty5pI8ShZCZ6LQyXASTWKIoIVcrYiLNwmAxzhFY/s1GdSXU6gNRPjs01y7nFO6e
         jXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786218063; x=1786822863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
        b=m5OyLZGoQtJJ7Pj0nAonRR+V6NAT2nm63ZiLQZKcnQcMUHRfJiXoadg9uDlTTFx5Y6
         o0H09e7uDLSs8L7nulQIh4Csyp3tLsFAEP/a32lvXZTNUbS65qDpZRT5oaumDnq59rt0
         zs3oTF5C9U/2DjFNGluPaTLqt6XNwNlP19lKbfQi/+Y+WUIXnCgdJ3CmvQTnx3y3XJLs
         jDLX5JjHOrV6Wcqyll50fsC1OeelSRTt0cdbkG1HwW+1VOpk7XL4QlBbO6p0gTUz04Hn
         oRw3nqjonEsK28T6HUVIKWFHRhbT4L3Sa6xn0asiUkgFlVbOkYKVbaMrtDTb2NhAKk4U
         mS6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqcuCLjEN//OyIveJaxxI6VbqAT1qVTY3TG6rPhSyAVGJyYnjgGyFPstMEgvBGrUNszenKoZmk/QG45amo4NHb9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0o9PY9CUtHXCeMEm36MyqgL7oFYao7/Y0PUQya5DsrXw5lDbw
	7HnxccOO9D9uRsCMXrsxQxFIhUoYgVdkJ4UN2wMcPcOBcAO3UYTT0tBMrmt86QpXVr3OxMcQhLe
	EOBsqex5NM1rHpJA37bLdNCZU95IocYo=
X-Gm-Gg: AR+sD12m6eR0Iy1n1iztcwWoud8ZfCXS1eKrGAhsB9bhPVILMFI3T0hI3Nei1NLoynb
	LKOLlJSXyfdLmXkuXSGioO9Kr5IbA3qBb6p9qStPnbnEJ/kXiVcGEeBBnJpxcGvdANlIA8QRcLs
	CQfSMfmjL8136dxztsaER5BFf4+RoqlQwqInBD1QbEdrpbkddLThtzXSWuCHaTSrm1yrEQGRAKV
	AV6WtFgPKdArEhiaW8hCwG+nR/hKE8AMwI+Klx5Oug2zw4e5dtASpb3wWDANeEe7Hp2IfwXM6kN
	rhLtPToexkC6+p/geWjPfz720ileAefVZGhvuOGbygcqPDRbWMFxdGRwP41hnnjqc0KfuTs0af8
	829zOKgotYixOCnK0lVcSaZ0+v9ZrSgHoOo3Y4Oj4yuC2ijqGaEPCJ/1ufAnu
X-Received: by 2002:a17:902:ec8a:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d0ca1658f2mr275615635ad.0.1786218062739; Sat, 08 Aug 2026
 12:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260807221429.155946-1-ojeda@kernel.org> <20260808.074341.1056015191905819805.tomo@flapping.org>
 <CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com> <20260808.143013.1251068388254615351.tomo@flapping.org>
In-Reply-To: <20260808.143013.1251068388254615351.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 21:40:49 +0200
X-Gm-Features: AUfX_myY729uYjJW5IhCmENfsQg8ijuPS9VLtcEZjSqkZiEXciXEvujLP3Jq8gQ
Message-ID: <CANiq72m70uWCRFnhs3axdymSTGCirBrYAvKh2BiT0xqW2j_3jg@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, arnd@arndb.de, krzk@kernel.org, 
	alexandre.belloni@bootlin.com, linusw@kernel.org, chenhuacai@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fustini@kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, kernel@xen0n.name, 
	loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_124104_041821_A1DD51AF 
X-CRM114-Status: GOOD (  12.98  )
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

On Sat, Aug 8, 2026 at 7:30=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> Is this the one you saw?

Yeah, exactly.

> I posted a `cfg(testlib)` split for it:
>
> https://lore.kernel.org/all/20260808022608.1125174-1-tomo@flapping.org/

Thanks! It seems good to me.

> While at it, a question: what is `rusttest` meant to cover when
> `ARCH=3D` is not the host's?

`rusttest` is meant to run tests on the host, regardless of the target.

There aren't many tests there nowadays, since most of them moved to
the actual kernel when we got support for that, but we can still do
there things like testing proc macros.

We could also use it for more things in the future, perhaps...

Cheers,
Miguel

