Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B75DCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQvv7exwOArMoYZGDke0hdGiWbyAHG9S2KTmO/d6Kf0=; b=W9wr/hn1ew7SJPk3+zHU0fyV+4
	e6G7e5M1HVzY82q/CiPWjkfTqcbrc0/clC02lcW79f1TjZWF0I/Aofk7/aHsJhFI5wqJ1+swjiQSz
	Y+lqwVEr78lLHFDW9rP1vieZtPRgDtH5hBAMblhaVi/fDBhnA5U5m01fjLGbWHDhk2wWGNSwS6n3M
	d5B/66Gj7rIkmbWxyK9G6iNv8AJY7iv8xrysBe4kgodH1FMtQ6R14V2dor1LMUhyjKGoCQSaf4/tN
	tMlzHaWoJyl9FPCjXtzcGaruLty9CdL2snQrQBeQWo8Ti7pWl6o0Mw/KS9AfzTziv+BlXP76HXSD+
	wO73jnSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Xk-00000001fUq-42r9;
	Wed, 29 Oct 2025 14:52:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Xj-00000001fUN-1yRz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 14:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iQvv7exwOArMoYZGDke0hdGiWbyAHG9S2KTmO/d6Kf0=; b=hD0Z9tMTI1sVcxllfqPhaG9aiW
	aOIHdhu2zi9ON704So3/OKqaJWDaWkwlClBvVly1U3ykDWIdmitakjZwFHkUJ3hX7TZ42aiayMMp3
	dX4DIdxfHZIb0IJurQHB3N2H5CfhhcX0bPQ+6OTdRA8rqLihnko+TCIRjcRccZ8EnxbQHIVhV2wR7
	Sm+92HuZjDOuNbrObg5PN/kj5wWNCC2whdvkly/mM8MdzC1N4u0nVvaJhLOfD9azgdWFVqGGWzN/0
	whovqPEaZXIeVSnH7T4gwwzDmgj5NkkARzYOR0QH5t6noOiIFWQjE+AdGnk10HAfFUK0Ir4jP+9ud
	E7lC958Q==;
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6fx-0000000739W-24SK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:57:23 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-932c247fb9aso3153471241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749570; x=1762354370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQvv7exwOArMoYZGDke0hdGiWbyAHG9S2KTmO/d6Kf0=;
        b=B1YRIBscVOzyYX7hSKlmPoLR6CDTU7pvljDW3Vg3hAgllrF5uPZYC76ZWciAuRD69s
         Ae9LJTtLbtfZZNMsb/yTVrW70HhggT7ta9/Xq7qPNulU6zTfv1bEYVxUztqJRcftEjrc
         KFCV6U6p2U0aRZHbFMfZHQwzeUhwE9ggW0FtzoQ3Kf6qVYZ9EHkyp5pBSvqtxnW/X+sb
         IGE+wj9BzoIDl6FGvAaom0j2h/TXL/qhtpympxkhkbw01lxA1I0wZxzV5yZrJ6K6huoX
         yWTdLgenyMXDKYBKpSwDsrRPZjvjgb4n2z6YI8g8U3vciyPu9SW7dm5kY+dpu27b3Buh
         5rEQ==
X-Gm-Message-State: AOJu0Yzb2AtncH80vJ/cGlMK1CAzkAGRETqqx1Rb59LILTxfrLb0ZkQv
	6omSFRargc9BMSWEPksLUxsz02wf7rbvtnUveD7SzPOTI0D5aB+EsnJalFtrkixm
X-Gm-Gg: ASbGnctvBKz9XXXjZYZM0QtRvTXrPfF6azIsFw5aqxf6JoOWTbAxq9Lr/TKYruoFhOH
	PhPggIDq980/zDjTZgpVT0o0SSEatrK1TWsYJSiqlmi7ct8iXGQ61g2AYFkpD1Jwvt2mZthxV/2
	6JTDwiprPRgNHkWqK49YWjwVIh5bCXF89LexXF0oU3loQVykayGRuJ92KngFF3G/Grbg9Ix12qH
	cIHWFHkKcJh7/pH469epaoXUkocKTbvNjbkfRuInwqE9bLHJWu3uhLDpC/v9turpiS5CsKTtNUw
	eygiL5AanGSTqlRd66YwV+ggPuu9PWN805KkKHjCagrqZweW1Ba178m/oU95feOoa4ogOF1zWVf
	JDH95v6bw/o4D5UGzinvkW9IDqP3olAPVSMv9Cm8R/rpUtx4YGDU/TwrUEtI6IfRacEf3jQSitq
	hc90tGQrumWwTGQRFZj1i0kBDs0nxaegn7Xv3kJZwoZ+3+edqH5Og1
X-Google-Smtp-Source: AGHT+IG36ITP4lXVX/HwPKVXZ0La/5eiaGXx9cDMe/LEBSgmUjBPWhwiC3LXmsq7o+J3jBINL89ouw==
X-Received: by 2002:a05:6122:d99:b0:539:1dbf:3148 with SMTP id 71dfb90a1353d-558140a6747mr1062816e0c.2.1761749570328;
        Wed, 29 Oct 2025 07:52:50 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddac1ac9sm5554995e0c.4.2025.10.29.07.52.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:52:50 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5db39d2ce9fso3475923137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:52:49 -0700 (PDT)
X-Received: by 2002:a05:6102:1624:b0:5d5:d1ba:439b with SMTP id
 ada2fe7eead31-5db905d8f89mr990736137.11.1761749569699; Wed, 29 Oct 2025
 07:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org> <20251027211249.95826-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:52:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_9nSn1M8MA3K_trWW2niB21Tj3+VSQgg0zrNOd166iA@mail.gmail.com>
X-Gm-Features: AWmQ_bmu-VsyNsgrWByxIwZ6BxxZOq0ku33A5vZwj4heK_7OuwvDxVVNAt1ifsw
Message-ID: <CAMuHMdV_9nSn1M8MA3K_trWW2niB21Tj3+VSQgg0zrNOd166iA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a77960-salvator-xs: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_135721_566285_5FCF8EFE 
X-CRM114-Status: GOOD (  16.91  )
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

On Mon, 27 Oct 2025 at 22:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on Salvator-X 2nd version with R-Car M3-W.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

