Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E1FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxtvOqHC+32lbWhXdQ+bVh6Khx7LdIvjYtV/DX+xWVU=; b=1ii0DoUdQwidzI9g5eiHNavB9u
	7KTphFG+Q43tiMTITxqmSfVuwQEgUocnkpMgK07SCRLQ81ggD9MUwhkAYbl+0NgyZxw4/gC1+W5/6
	IHtaVxlZLhMY4hHirussEQDWUlPvALjsw8KHX+Y8y4vfWQHAhe43aa6ilBwsblz7MVxtd+nrm6gd+
	d8MQw4T952EDgKzw23CgVjR/G7D+Sexw97FpZqXYnm+TxuMy5qNqDh1+U33UbkIxZHxRn9a794iUE
	szh6VmamOxHVuin0uvJt7wlIkwT4Bg8f4+iq73YjiTsHSrpPfUTRBd9juxOOVmpUHrdjww3ASaGRO
	NKhtCPRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZb-00000001fAX-2Rqk;
	Mon, 07 Apr 2025 18:51:55 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qNU-00000001Nva-2IXD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:35:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2240d930f13so6109715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 10:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744047320; x=1744652120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxtvOqHC+32lbWhXdQ+bVh6Khx7LdIvjYtV/DX+xWVU=;
        b=klcrNQNQrfd2MN2/PnAzkFpel9LFZMscuiMWEL5w56aWpJhZ6bxTgiwaPUNaYpyVH2
         HNtZ0RCf7gIVxwWdASOBWzEktz1SHUFxNj32wfFERHVhSvSXe4ZVsJbQpbJnlk36rcTs
         t2wLayyh/mU9dw3tMMWZXcsCuLDnfp7yuQpmJ04JLvBAqYn4jyZRx5bFmjq1Yd6zv75O
         g0Tv7KbGMn5YOTY1ir7oM2+KaPM3Y92KEhSX7MbL+N/cmOHaW7vBNkb4KHf5KK0Vvraq
         8Dj18hSceZRQ4XCp1XTDG12H4X8yh2PObBzdSgClgkZegYfDbpoiqRfN7Ed4zqYn7CuM
         CP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744047320; x=1744652120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxtvOqHC+32lbWhXdQ+bVh6Khx7LdIvjYtV/DX+xWVU=;
        b=hi+4Hnp1DTh5lt163BPJnyUFeFn6jZOSg7iXG/BIu/waDwgtuT/Ou9KY/9FruFMhzK
         xj1YNe4dFc0n65KpMvSlDto5UShmcW3cZ61znHimzH26RaNE4Sx/0HnbIfYC6o7ZZOz1
         SWnk5fcBHF5XfaUQt40zgUYWqKWmeTOvsaSLT4Z2bAa63UpNjsC3FStIocJfRL+HyNvE
         ciONTNdaLpLo/y624mr05E/AzZw4KDWe1tfCGU+wAVf9xyicp0TgfGi95jacqyVBJLjM
         YeMc84Ue7OI51lLBB1FrL5yVMj1pjq1wRxrz8TxjWjksKBqo3KpGofdElZGVoo0/+/HQ
         rPkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSkZgluEgY7uE6kS6NWLvyBTIx8ORf8e9mKBweOAtMaNFvzbc37P4/YFglTbdIxXwfl2ax+o9XpWtamSAJ3Hch@lists.infradead.org
X-Gm-Message-State: AOJu0YydOesl6Rrvoh4phz4o4zuDVn+LQoL9qIe/S5mmFXDHD3ZqZVqv
	YhuE+bB8H1yYM1F4ge/V7sSnUgqX2XQUB8kwC0XxaD9qGBFd5HyhdJMzruikoE8SrpqzDGT6DM0
	+e7wJhYvKqpzk8FAkmy5svKzi2M8=
X-Gm-Gg: ASbGncub+Jquwqh2mvWn+pVsXol8AIdo+xuGHa6XGoT1MKH1Cd8rXkGIdOi+Dm3dE2q
	DYxetchnc35VTrtgUHKROkY1yR85vk2fdki4jJv2NQUFyOPDoRJUSrbOk47kTYFMD1GNkv8wJDR
	foO18lwska3L/rmfFXAQl9XGCbqA==
X-Google-Smtp-Source: AGHT+IGrOYdd22BOkNcMFAJN6gBEaM6XViMqZTPa3LiMF4ZXBrTaB6b4smjpdk/WhbGIXTWECsJFDdeZQZg/KU0ria8=
X-Received: by 2002:a17:902:f609:b0:215:a96d:ec36 with SMTP id
 d9443c01a7336-22a8a0584ebmr72206115ad.5.1744047319861; Mon, 07 Apr 2025
 10:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <D90J8JOGEBWI.4P0BAZG2R4G7@proton.me>
In-Reply-To: <D90J8JOGEBWI.4P0BAZG2R4G7@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Apr 2025 19:35:06 +0200
X-Gm-Features: ATxdqUFraFwWuS1l8wKAeEcupvutnzUZ8-1cg_oEdUgNAzrys-VAJ9qg6SJWJNQ
Message-ID: <CANiq72kokgc+ZxVN=UKUNbov4t3NkccTWSk8mDesbniJVFdr3w@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Benno Lossin <benno.lossin@proton.me>
Cc: Manish Shakya <msh.shakya@gmail.com>, chrisi.schrefl@gmail.com, Jamie.Cunliffe@arm.com, 
	a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	andrew@lunn.ch, ardb@kernel.org, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com, 
	linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_103520_585066_F3CA2DC6 
X-CRM114-Status: UNSURE (   9.74  )
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

On Mon, Apr 7, 2025 at 6:04=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> Maybe we should also hide it behind CONFIG_EXPERT?

Maybe -- it is already inside the "Kernel hacking" menu, but it could help.

> Yeah, the upstream support would be the best. Did we ever need to enable
> this option?

Not that I am aware of / recall. So far all the ones that we got a
report for were actually expected cases.

Cheers,
Miguel

