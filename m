Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D6EC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/J6pjqX1tkN7ol9r0yPzfB+nnpzebdTRaebsQQSoZo=; b=ZzBK0EKM1YPW8mr6nn+w9Lh12E
	kG3KHrCs9DNODIohaX9TugAvhHS81IFKAeoEzgHZrABPlZq/K7A05HiqAtFWA+Bx6df6vpc97GrFu
	VsEM2zoq9gcDMme+TYjUBvo4ixIWhW8qYJFVgQNbhXk6xBfJFLb0DsPMmyQv3EUO8aCbPkNtiRegD
	MuFaHDEvjNrj8lYaCb9mLBsy/9n28aZ0D/1jR9nDhrpb6IW5PzL5yZbxRBugS4v7vCw6DyyMb5d8m
	gibzXf7tA/Ct/IvQidnKvUfgqgHMpWSbup0b5Q3aVIDV//DvtKgHeZ7snPjbn4kQgeyarkZHl4Mi8
	dihG3QQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRG2-0000000C3uQ-3GsC;
	Mon, 10 Aug 2026 14:45:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRG1-0000000C3t6-3Qqb
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Aug 2026 14:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c/J6pjqX1tkN7ol9r0yPzfB+nnpzebdTRaebsQQSoZo=; b=jqXgyp7mVnAMEtRdRv4BOTeU7R
	Jn7nQzDMD8Ta1SKwDpNylanjCrCqTc3jlc4BY+O6ILjamKc/swqdImw9C/PTFLOr35Uj3RuiNX9Qh
	huhAZxHEqRJHUeA0EyaH4UeX1trAJ6ZvldLL3kzs2zjBhCQ2csaWSE0vGPBTiBQgZmWHX29oQ9aS2
	pm3SNVWtfsYyVDAYdbm94dNiBFwFqGqoJJVzpghhVFKMH6XP0hrSVEY5qprHhOqbWxnPJqP6qbEw+
	/VmVMY76xP9b6m+HJIKS04+y4OPK7JazzEwLD3tr0HS53t4hICsfB2wUs5jtKJfR4kzMHrjZlVjQ1
	8D4tQHFg==;
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtRFy-0000000DtTQ-3MYN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:45:40 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bf959b820cso1289225e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373136; x=1786977936;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c/J6pjqX1tkN7ol9r0yPzfB+nnpzebdTRaebsQQSoZo=;
        b=Qd5KrHEvdSlGW1P2kaxZiHCC1corw46ca54nF/puEkx50qcwiOGcA0n2arL6oOlQPK
         LGH17NpuVijA+AYK6u+0tKUSC9o3q3m8YB0/eMeNdEX6D/f5jor8Bep8f4HgKU8MoQmJ
         k+UacqmoFhPPoJ0xQ3iLVqxRhuq5UKbakcsVUXtJOx3ms/rfnUHHdACOJx6KTmwB9BKY
         3yOwWyKS6umccTz+3lNpK8EMsT1encG4GxmiwLuQYwJ5rrj2QoI1OTPDooCXTU1+VTu0
         ztOfrBKC6zvUSKPUBlTqNPI4Xt5kOEAt1RSG9x02r2iDqlb+4IcP9umCZHxaLt74+E9r
         BQTg==
X-Gm-Message-State: AOJu0YxRs0O8aoS+6mlKFxunKPQW55HFH25oMAt4B9xmbSprqRCkoTjP
	OYpht0VjugaVYVTYSj5A0MdqeWePdpFle8qi/D/fJvygQPdRhJgGlHMnmbbzpBLz
X-Gm-Gg: AR+sD106nh7KVfB/8dwPubbPoGOrhDAWmPeDUV+GDpnw6dpoGvoSF+USKoc9lW/jiWP
	CI3ESuACR/gTXNhVbWsQSZFZTNEGjZCvDDTuw2mJ8zMvtQkFXpLxHUYCQ3xOgPiLfyBaMwMEILL
	EJUoi858IvCPPT4JNOXQWuTLjUG7/tbhZvNDX0W9tKX45JKb8sW4JecmsmW68xLcmKsbiSc4Bub
	RM2HCqWSkIWAGxko10d5pq0LbyBbb+gGiQAmcn5Sx28cGq7RqZSwIqdWYJXU6RIG+16Lf4AU0QU
	P7icu72ONk+nwKSrslAjsUNSVYJG0vwB5HeysTX7lvg9LfZQdFIGa6Nqp6DLNBSnv9i70NbYOMb
	uinKo1pSQWber2l5lz66gPUTP6INSGYTwYU9K1K4a2eQlWEC0glR8kwjXjpzN+UBVdueDIYu2jh
	qs9KWUmB2rANoqaE43/Z+zSMQczygCWyRY9S2PkqS719qkZBSt8QFMO8LIXwFy4/8uHf0Scx1gd
	kj4SmS5e2+ZW1jqSnjwREaS+g==
X-Received: by 2002:a05:6102:2c08:b0:75f:e517:ec95 with SMTP id ada2fe7eead31-764e648bbb6mr5770092137.8.1786373136368;
        Mon, 10 Aug 2026 07:45:36 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76400dfe036sm4700305137.8.2026.08.10.07.45.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:45:36 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-969524c1a63so1314036241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:45:35 -0700 (PDT)
X-Received: by 2002:a05:6102:1490:b0:650:94b2:b209 with SMTP id
 ada2fe7eead31-764e5a4e354mr5957977137.4.1786373135792; Mon, 10 Aug 2026
 07:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org> <20260714130515.11262-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130515.11262-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:45:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZcy_kA-R=bjdDJQmPp--=NMuyaJB7NV-+uZ=zyFZ30Q@mail.gmail.com>
X-Gm-Features: AUfX_mzpflf907Mv9hDTB-ODXObAaiTjsgKM8flRS-o-ZchQdmzFsvncjRXxvD0
Message-ID: <CAMuHMdVZcy_kA-R=bjdDJQmPp--=NMuyaJB7NV-+uZ=zyFZ30Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: hihope-rzg2-ex: Specify ethernet
 PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_154538_866438_69880CA4 
X-CRM114-Status: GOOD (  17.63  )
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

On Tue, 14 Jul 2026 at 15:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The RTL8211E reference manual [1] page 38 chapter 7.16. PHY Reset
> (Hardware Reset) states that the PHYRSTB pin must be asserted low
> for at least 10ms (Tgap in Figure 10) and the system must wait at
> minimum 30ms (for internal circuits settle time) before accessing
> the PHY registers. Use 15ms and 35ms respectively to provide some
> additional margin.
>
> [1] https://files.pine64.org/doc/datasheet/pine64/rtl8211e%28g%29-vb%28vl%29-cg_datasheet_1.6.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

