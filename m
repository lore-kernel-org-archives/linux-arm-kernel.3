Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A534BED7B8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 09:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BzH4l41ivGVwJZyLUtzjEKcBbitAg70COzuLd4I7K4=; b=t9zVgsC+OCEl/QgizfB0etW8fg
	PhaN4u95VnyDn/tzc0y9xB3KaSYRYCNQcrVzvzKs0xNq+/tEb+58v8QHg49Mby3k2wg4JDbF2gIX3
	nN71pW0DWJUdFWeNo994Timya8qVgjoGRr9bo41lxtFdu7j3w80HsZDThqrIVYhgXiwHwJgB2iAyO
	HTdPPXbmfl/b5qyt+YKDVieabIWiM+HQ8oNVsD9851TpRUSFvwn6ROCbvwK68QbnWt07djzFrNiDi
	eedI3jHIaruaT0C2joFQfeWxLk65JzIp7091BxYqWhHxf9Fi+aWDeKe8XSXAIDjOpZU5kQe4pXsRa
	1fPc1XaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZdP-0000000H1cc-1z1Y;
	Tue, 14 Apr 2026 09:00:39 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZdN-0000000H1cD-35sG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 09:00:39 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d556c1a79eso7287492a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 02:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776157235; x=1776762035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7BzH4l41ivGVwJZyLUtzjEKcBbitAg70COzuLd4I7K4=;
        b=JdZ8viVTleu3ei6Gb+MxqSjlT/L9p/3mdKINsIo2n4VYLQGeSeJKWUp4Yu8dmR0Dvp
         Cq6qvRjYiYo18vUBMwNLyBePWKNPU55L89klabzZYJV+8D11p7ApytnLx+Xnu0zOvZeQ
         McTFuvf3vmPFGXzs15l7DHLIZAY4aOhSaYtFfC4tfBx3Iu4XDLzMbNix70cvyrqUscNj
         Tn8/UuBuvNji8FpS3VWEmYBft6HL5jxp9hfeoImDVwPxjjBK7kCJ3oQjn/yeuuQSK4+B
         LL8dPOnGHFfpRbJVcUBETgaPRfKrA27JsgQndCR2jHv3Buef9IE9nb5X6d0xIGUhOZ1S
         bp7A==
X-Forwarded-Encrypted: i=1; AFNElJ9G03O2X5HlLMkCStxRzV8RF27qI+WrTeK2dmYSb7zr07K1MbTMHUDFUW7mgGC3Ru+3sRx9Y/dkzCbgxym1YH3x@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+YeBSCf5u2P2ZE36t0RWZzuvndKLGkIywFLcIrdbXJ1nnUJes
	ktIq/gmStCvYiuhQPm9O/vt3h/OwPPw5g58nOd2cqsS3/kjzJ8icCHaDjci2/P5l
X-Gm-Gg: AeBDies3GbSAIYrz0Qs2c0cf+Qbg6u7qLlKEddMvZQwBQji5jgfbd7f5l69qY3KJ4dF
	BA+4TFZv1fmi04M8QLwNWWILJnF5vQFhlyJP7NbIaTMYTKQNyAsMrmjpROk+X5Fp7S5FmR7ZAEw
	K6wN4NcP6XwSBXu2oUTOthwComeHRPi6UUiQV5WYD59SjmwN/EhqTQBSfxSTb7jYv7tFLcqkB6X
	b4qMC4CmZ4H2nDQXy9opgNTspx1uHYjWOEBasKAziaLx5uFzBZgVOjiwIB5lMa4qiP9AZSj8Rcx
	FTDzZiCcAi8ujGqPqb5FYBPJPmAMahiUAOHK87XIAcc0PkJvdjLLW0LZoe2XLvyk8kKW0TW0RwS
	gurEHkwTfHNXkReeM8+go3e4Xs7DqrchAuJfNdIXHpl5igq+eZqoFvO3pY3vHQflD+W8ibVKuSJ
	ysSd/66exEqKar/MdF4dapePI7ASVriPS6NQ3aHmg1shH5WvNDFI6F3vkgkpTPQVQSV7knGvhk2
	ByKrAtidaDi3y/a0dTM5zqUpr3F07lCdqwsTL2xPG5eI+mYwIQ+RY0EaNtN8OflnSR1tu8bug==
X-Received: by 2002:a05:6820:7801:b0:67e:16b4:aa13 with SMTP id 006d021491bc7-68be8dd2762mr5624170eaf.58.1776157234870;
        Tue, 14 Apr 2026 02:00:34 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-68bc7dfa196sm7338039eaf.2.2026.04.14.02.00.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:00:33 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d556c1a79eso7287430a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 02:00:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Eu5mdc7sHyr9+oSMaScGaOZaEN/fHOZGWgU8GYALFjHDZcRn8CudzDPTLULpa9UgQnPQArRJqYAWe7z/WcMFF@lists.infradead.org
X-Received: by 2002:a05:6830:6d44:b0:7db:df4e:f937 with SMTP id
 46e09a7af769-7dc27ca49a6mr10107828a34.7.1776157232558; Tue, 14 Apr 2026
 02:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com>
In-Reply-To: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 14 Apr 2026 04:59:54 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-dvJA4yLJxwiJVg2S585Dihg4c7FTyf0Gv8iwahU0ifg@mail.gmail.com>
X-Gm-Features: AQROBzBGriz3oUw4obwCyMl6uueqnkEVGw3CzezDOXXcUajBdgbMcTOpUgPlHRE
Message-ID: <CAEg-Je-dvJA4yLJxwiJVg2S585Dihg4c7FTyf0Gv8iwahU0ifg@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Add Broadcom channel priority commands
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_020037_778976_6CABDD80 
X-CRM114-Status: GOOD (  12.88  )
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

On Tue, Apr 7, 2026 at 1:46=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Certain Broadcom bluetooth chips (bcm4377/bcm4378/bcm438) need ACL
> streams carrying audio to be set as "high priority" using a vendor
> specific command to prevent 10-ish second-long dropouts whenever
> something does a device scan. This patch sends the command when the
> socket priority is set to TC_PRIO_INTERACTIVE, as BlueZ does for audio.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v2:
> - new ioctl got nack-ed, so let's use sk_priority as the trigger
> - Link to v1: https://lore.kernel.org/r/20260407-brcm-prio-v1-1-f38b17376=
640@gmail.com
> ---

Thank you so much for this!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

