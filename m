Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E537CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LD4gCfL3GvRux7EAboZSJrOHSTYF3Xl3Rn9jvkjdPC4=; b=E41plbyDfnylurECZINB5yGxzq
	6ZY/CX1P6j+5iM14CZaXXaszMTa3Of8hZombdS0+SCxuqcy/r10uwFhAbYYw8LqgDbU1RjIuRYbpn
	hlkghN4hPzTb1peebQsOYO5/eUITN9pQo61TbMGaJv8ZHZKlLSQNS7xtyLkQUBF+CKL2Y+hpQ0uCV
	k/mZ//Nz/D6uZytMpD3OMzVyWOlCFziSs86Dl7o2MV13+dkD3/N6P2MvR5peno2ICdLpPG6Nb2NPt
	+GgTpLhFbN87eIu56HEUtSv/lw4X3jRHuxM1H7UffoeMuKiU6QdGqG1c9P0X9h0BsazZs2d8m9KQ6
	6w9Rb2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RTa-0000000FSYS-3TMh;
	Sun, 06 Apr 2025 14:59:58 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RRr-0000000FSMD-00pH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 14:58:12 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so539678a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743951490; x=1744556290; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LD4gCfL3GvRux7EAboZSJrOHSTYF3Xl3Rn9jvkjdPC4=;
        b=V/mSzG0S37p2bPf1DWlACpK9MDkQIRlhVykpVEvA4SZzgX7IeRIzfcK/9n93+HpNZR
         1WiOWX1k/EcXppILqtKRwwv16RYEgQ/9mdQ6T3BxW6LKXz/ob0YXatlhFrmZOMQ1Harw
         owS4lP75wAeYa6aoo1fQkr1H9dYd4Bxdvszx/smibRactSFNGzSu495ZkpWw7Dpusa8U
         xaUumYyg2NsHbLWDQ9JtdExtzRahoD6/10ulHGozqXsOx3zH+aTrYexUElqfXYpgpsTy
         MXhoQj30wWWYHWyGfEFVscXMy9DYJrxCmLVpU0LUBGT3A9m+x7djd3fvAwRTIpYFR57k
         C1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743951490; x=1744556290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LD4gCfL3GvRux7EAboZSJrOHSTYF3Xl3Rn9jvkjdPC4=;
        b=v5tZ/9rITKb5f69oSLpGBhueQ21+qYalG33K7qnglT0TT4KDpvyRoQag4XoDBGYi0s
         uz9XrV7rcUTsLlwrbXTXUTUUuupxYXjB6B48dz7NCLMBqHalVLE5VhWXf3PbDbnyViEB
         sXJMcMPOrcTZxNyFJalF4Ag9j+eOWWS+uiKQEnvKK3st6Bce7GiM7kVOp0hWBgVCwcui
         Iwmc7brU3jO/MVQ0JprV9EvsF+m3PwGMGdY0x77UAZRPc5riBd4dXiqlrY67SwbeNz42
         KqwQwo8Pg9X2b+KU3rWFnnP3/hVrmUUwX96jjIaRiensxP6JZBonDPkHykYP0dh4l+6i
         Tmtg==
X-Forwarded-Encrypted: i=1; AJvYcCUi1fujViYK2Vl95ymEucHDE3xjRu8rqaqru8ghqp51EKBGJI/B17JDGg8TYJIp6XTZovbxTe2nIYEPun2FtuRD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3aF8iBgWC1KV11qwuOqRqqHkPp9QQIg4VkfqbPNXb6Y8Uqog/
	iBWCop/ww4ld55Va/hVe/kiuXPlSCsMPSRk7NmxMQ3vVsLJQZ+YyoiT5jmEmvN54Ezx36nVVewc
	Y+oOOTCGwlGl6BVUhgwYFR9FNVGXCZfqqeT2xNw==
X-Gm-Gg: ASbGncsD6VF6HeM0GnRVYTeZzo5bD96Vowvf+El0Jg+eU6Owrq2LtAbehU9DsEbctl5
	A020AbzZnPlHaYdCkCAZb1+dTiYcCR/xH06JxumqN5wgblLz7w2znQgykjHvt4WkqOL4wetIT+S
	uNO1IhVzNcw/ffcAV6WuvpfushZbptipRWDOG4
X-Google-Smtp-Source: AGHT+IEfVSeiBAXjSknzK/xZLBwHijweGRpHQSxt6jHNfi/lxELpk/tC/Lu1J/ozA6LpyPGTHhggmiAaF5yD/zqzACg=
X-Received: by 2002:a17:90b:4b06:b0:2fe:b77a:2eba with SMTP id
 98e67ed59e1d1-306a485b36amr5142609a91.1.1743951490003; Sun, 06 Apr 2025
 07:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <399cceb4-dcf5-4af8-a8b7-6741e9b7e8ae@gmail.com> <0cc991ff-e0e5-453c-91dd-84710bf7e028@gmail.com>
In-Reply-To: <0cc991ff-e0e5-453c-91dd-84710bf7e028@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Apr 2025 16:57:57 +0200
X-Gm-Features: ATxdqUGYlZlRK81NFG6hAu_fDJb-01806jsB08wIejZodjbETVB2OHX8iMEc4V8
Message-ID: <CANiq72=p4zjbvVKAR90wY2saFty6AS+-JCNWRvnFu7VeLzg43g@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Manish Shakya <msh.shakya@gmail.com>
Cc: chrisi.schrefl@gmail.com, Jamie.Cunliffe@arm.com, a.hindborg@kernel.org, 
	alex.gaynor@gmail.com, aliceryhl@google.com, andrew@lunn.ch, ardb@kernel.org, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com, 
	linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_075811_046970_E861F0A7 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

On Sun, Apr 6, 2025 at 4:08=E2=80=AFPM Manish Shakya <msh.shakya@gmail.com>=
 wrote:
>
> CONFIG_RUST_DEBUG_ASSERTIONS=3Dy

This is great for testing...

> CONFIG_RUST_BUILD_ASSERT_ALLOW=3Dy

...but this one should really be disabled (both for testing and for
production use).

`RUST_BUILD_ASSERT_ALLOW` is really only there as a worst case
workaround (escape hatch) that nobody should ever hit, hopefully.

If you ever find you need to set it, then please report it -- thanks!

Cheers,
Miguel

