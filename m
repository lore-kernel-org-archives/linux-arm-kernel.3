Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5018BC5AD2C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 03:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=; b=MoQzhwhQ8yxqrZWaTrFQjZet39
	VNm+sW7/0S/NJxuFSQISTQbTNUv7I0oN5nDB6mAJiTCdhOiE4yIe8fnttzu1hIC9OmIBzOLo/fuUg
	fJVRmdgktyHa6/b3Z83A8kNPclGzW0ZMcjgiXAy6hqyd20j4dBLUubDc8LJ/aTe6EaklNKkzUAuFp
	go02WC3UdHNFYFi8pyiIWF7nferGJ67fYkEkp0cAS+15ed7uP0oLOw7sUp9LNt/ytZEm4QmL6rgu1
	oltDaXV72di/ENXH3Odon8hfdANAAnGy3Dvh+PZ6j3jBESM6ynqf7Y5qrf4ScwoYI/HIg3S227s1s
	Ycv8M7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wstn0-00000009w3P-0LJA;
	Sun, 09 Aug 2026 03:01:30 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wstmv-00000009w2u-2xFH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 03:01:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ccdce28edeso879715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 20:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786244483; cv=none;
        d=google.com; s=arc-20260327;
        b=jGl6rBKKb5myf8C61z5n3Tx57yJXYTqxKbN7WcRRxqnzeQPEsnDddtyqGicRtZqhnS
         9CiydplwC4sp/2CtmmnAga8jMmsKBVEZR1hsFh+CGanMMATjP+xGkT0UMWvCFHPbOMTe
         a66kRL/KKRC3o4FHBwjPSYnR1j1TbjfjMXbxusD4yTrAcZZk4/4SFfg5AtZglyFiHp3d
         BGGi+kJ7XxFiWvHisbglJhRWnax5YFI5/k2/EevDBW+zmHHWIz/nLAxJfkAr4T/qziz3
         a0LZgO42fBshhelu8DBIq2TV7/n6AHlSCCs0faqfQF8aGSGtmUAegZJO2xX0AT3onJoK
         TbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
        fh=OFbcgG1Jo9G7cqqcsKZyKied1nZJ4tnSQiImKaeoYe0=;
        b=NWtPZlk8eA14yMlFyPOcje9m/Fr7ibBkn51ZH8IElfJnBpDScyBf1fkpoWOfUvkIb+
         PrtVAjCfjJOX/kzA5AEvnmj7Bl6IUxrqXMGlAFaIHIRfKIt+mqM+DcdJ4PbSwj6k91kx
         0al8cmSZJCiRTdKVCtskhE4PVNWNJodXO3Dpa/GhhIw7E6/8bZd8SFJG+kPpURD/Y1Vp
         0cIV0/ijjkoykzTIKIkbmgZE7YbgJJF+NOCVLIQLA8Yhi4efb0ohBL87e6Qs9d84EXjs
         1TNTrk+MSU7dtQ5kbKAlPOgJt2JnFNKpGu1c/xT5Zhtbrcv3AJ+AQ/10QruEMNVyOYsA
         ZB+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786244483; x=1786849283; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
        b=cDOvGDqSJ2Y9yH6KWyBg25C4ZcpmQcHY+YQTcKCyz9O1gIl7l/AakQm23rZy/G2j1v
         8ZIEf/8VtGqlE9e+F/1LgRqpsNrQdi2PmVbCGV0lhmjDXFmio1XBn4bzMwAta293yxIU
         x/LAWWLzN0yNt957W2ATxf+eGr54qX1lq0XIM8sHhbLpj9FTvqZAf2zv0r1h/Xg6f0R9
         5D0MkbHoj8Tq7yz+n3IebjrfaNfD0sKn2I+Ox8QiODHyLISrp4mlfp0xnOUwx0nbw2HY
         Mh8PginQ84iMRm2XF1qQeDyN8twpHxjcnEB2aUJX1QJnlfDP02QiPDKoOionoW2R5+OL
         0PVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786244483; x=1786849283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
        b=tZbHAOcgCSHh6gRBJgSXNtnNZWJ4qYkqoMcpHq9mXysAhv3dJvccHn6RBBDLY5xgym
         A/WrAYrrQ6CsYnOIRr4ZlI18NeZEMdxMa9PDxp9ySgQ1r8X610Wa50chjJdqd7qseV1Y
         gjvLRav7Y9HWkmFuGBslMmKWVZ+GvwVMV38QaIZ7SpqM/m4s0MJK0lMjM7KWQKMv1MHx
         ziVa8So4wqgdsqZfLI0OGAeQjExrz5B0SKP4+PeHjc6qzAZYZce2GzlnKlIS0Ra9n7kc
         i9P/K5thGvv6dZQvi+VN7k3U3GBZD0haUssofMuq/LXMkXC2Csjkt2wa8oHNgh8+ykxu
         BRbQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRiiVbLssRpCJxsEwS+mrmOqxQ6ppqgIHAsU9ic/+7EBKBBLNmWlxtqWqlbk32ZM5P2eabHXCPwqIFzTr89XlS@lists.infradead.org
X-Gm-Message-State: AOJu0YxP8noJ8yW/vzopprpymd8N6JEC2Ve/po6lDtF1yd/XDeRVaqhW
	pAEO3J4Z51fB9AJ2IxWl6XvYGMnJr7uDm/vnCZ/PBliNDjPkok/MoqbYVr6kP6Ypt/0CLh1mrmr
	uMAJi3kC99NZckcuAQCh/+lNMRVlI+Ng=
X-Gm-Gg: AR+sD10QmGg/5UVOjvoG1lzmNKH+gTlCh7ftZobUYhq+3/Rr0OM2BHfRHAXtyquXcah
	7uTRk40fZ6GbuzKBPeqj+VqDSx3oyQM8x//tHSPMvOWGgdoU84GTPKCEPBOWQ00eQ/5fCEOn531
	jm+sISL3+syJn9mbpxwSooDoEsaTicljsiqo98Uhyqne3fgeTknx6n+Os3q6r+J9qF4NgZ1ro4g
	DB6G3pU3r14jibIwuXOln/aVzmXKNNuKnt4Ue0TLJNUbsgnkzwqT4s4R5UTAhn1lDL/gEDPnrdw
	gQ5D1a/19vGyfD0ngcrT70SswY/abPN+kyT7/KAvj0QbZWBUecGkZ4Z9tor2ldBlELYh9HclTjX
	ZcVUwVVdxJWTBHRPqUmGTYPttQbsWWvhwSH6JYHP7DBgS8xJZ/kxxbRmBId6i
X-Received: by 2002:a17:903:17cd:b0:2cf:ca85:57e2 with SMTP id
 d9443c01a7336-2d0ca7b0285mr257513645ad.1.1786244483476; Sat, 08 Aug 2026
 20:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com>
 <20260808.143013.1251068388254615351.tomo@flapping.org> <CANiq72m70uWCRFnhs3axdymSTGCirBrYAvKh2BiT0xqW2j_3jg@mail.gmail.com>
 <20260809.095041.602618436881623934.tomo@flapping.org>
In-Reply-To: <20260809.095041.602618436881623934.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Aug 2026 05:01:09 +0200
X-Gm-Features: AUfX_mxOkJgVjfpd9Xjn2_lEgaaMyCa2CI5K0zvJDPjtb_T8ut0EX3_Stxulh1A
Message-ID: <CANiq72nxE05HEyNmxGj2gYHaYL95eQQVF9SAuhDdHX0RDW1i2w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260808_200125_778565_D7D7EB8C 
X-CRM114-Status: UNSURE (   9.55  )
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

On Sun, Aug 9, 2026 at 2:50=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> Then `jump_label.rs` needs the same treatment?
>
> `arch_static_branch!` embeds the generated arch asm too. It is not a
> problem today only because, like `warn_on!` until now, it has no user
> inside the `kernel` crate itself.

Yeah, I think we should do it to avoid surprises later.

Good eyes!

Cheers,
Miguel

