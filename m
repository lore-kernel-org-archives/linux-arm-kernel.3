Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51C7F8A160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 11:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AptjVPQ97g683jPGYCmYUacoTRTAG/3/TQY5t1TSdkk=; b=pI0osBfRvi3PtIl9bRNpdUOEpd
	0uLgrmdjgPv2F5BQVomNAFCrgATm2TzmOYwLVENtIlcqXYDMJX3s89O+VjqO3BKEK6OrTC6/AVo8h
	N/M3t8ywDDUTFTGaDoUhw8pabVJ8Cbu0XjrVYrivc10iQpdy4mI0Tym1c/MbMSf90ZOnB+biw3fbn
	wTPrayKXUWflUOj2KYFXWeP9XWwBc+f3wPODcrrGVZfsKZZ5g+1zf91h1OU8N77In4nl7XXuw8azt
	IYKQlEoPQSMs6kG8mCCN1g73dN7TgM5ASF/GtgmbB/MJZCesm6ew3K0jMddl9oTa+0h7a4ANDzfxO
	4gqxID5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKtG-00000002Nzh-1Vq6;
	Thu, 16 Apr 2026 11:28:10 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKtE-00000002NzL-07w3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 11:28:09 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d4c12ff3d5so6983917a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 04:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338887; x=1776943687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AptjVPQ97g683jPGYCmYUacoTRTAG/3/TQY5t1TSdkk=;
        b=R8xtpf+drLmb3JCYyLJ1ojuHrzglE+Oq4BCykn6JdxJhp7W4V7B/dV2KzwT7wS7ZrW
         YT2Arzt4iJlUdT4nL5gNytKtpSfiWbtg/maq7YRyGZpnjvtzb3tIXMorTuiyQDOluf8d
         an6LyTu3p347PaVsZ2nUPOg1K9WHzil75GpgHUUAkvPTSDXXBY9pso2erCyQlLEe0EUc
         CznQQeD2+bE5VCcPEHYb09q+2pxquaNFKC7ewIbHDkWQGi2WAzgu94Phx5rZmOLqpOZu
         qnEgGWbknF4B2RlYUGfFD/Nl2IKGrCgf/JTTLqXOWva4P9E6ifyOWa7EqDtQI8ir2Gej
         XdtA==
X-Forwarded-Encrypted: i=1; AFNElJ/X+ed6URD4K4WE6VFScUtsC1Z5Qy38RqKjEGSzksfNGxr7sPQRP8hDyH/zYMBY033M4JuQzQtHCVKuPvRWRmWn@lists.infradead.org
X-Gm-Message-State: AOJu0YxkOHNmlBQpQ9O9Cjc/1ApKFIrJOzil2twqv0lbLDWR8TXjr6qQ
	GU8UYeRf1UEGXz0wfj75SMuZCdFpKOkcKch9h4Ij4GejagpnwUxLTKokOuAFSR01
X-Gm-Gg: AeBDieukeKk6qxrnmqUKE4EjAxLaOPmzlzdo+ThZEN462zh9aWKPOwFzq7qKBZKHiTq
	QCLXWKKkqosYiZzwzI2FiDf8XdC+bgtXRGfyhCS+NWggVq6KNjHDnoTK3udJOIInu+6OlCRTm1H
	d4mNsijoPQB5qHb7MlQaH6a+qFGD4dnSmKVucH/uD0q8m/R8o71iQE3vlOtJsK2EyAaN5/UDCC/
	DU2KZAK7wjSk2qb81L8K3ba71PtBuyysB8cc743jsiknxlogq0Aff3+AFeFX07E1BEtMtQoRYzp
	asxxKFfToV3m8Qm/0G/rSsZnhAAOmQY3GOw+fB7Vuq8gtNfSzw8wSFGh0TnTxu7hEt5qfxNcPQz
	l80osr2DjatYDqRZKHoUb4qiVz7mMVZ7SYwO58LtgJ99Smtv3cxozZdbD2r1I4YGf4zkcpodUrE
	K9LRJkjtCWO7lRK8hiNhnTDMoAJkVEy0VftGsM6CXNfqFmpWNKyHXdTiy9t69prj/XZw+JdTa5Y
	jwD2qMgwfSPLw==
X-Received: by 2002:a05:6830:7110:b0:7d7:4002:1f21 with SMTP id 46e09a7af769-7dc27f60e4emr15819133a34.20.1776338886574;
        Thu, 16 Apr 2026 04:28:06 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc76b60551sm3196827a34.19.2026.04.16.04.28.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:28:06 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-471618e20a5so4054289b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 04:28:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+iNMkiLmp0QuGvXwNKpCj6LCvrerQYR8iuMsJZNcSAjhs5gnx3OaMCYQmQYKExA9LWHlHRz2iLToAbBaPB1UHN@lists.infradead.org
X-Received: by 2002:a05:6122:788:b0:56f:1ed6:1d29 with SMTP id
 71dfb90a1353d-56f3bca6059mr11244615e0c.9.1776338533353; Thu, 16 Apr 2026
 04:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120317.910770161@kernel.org>
In-Reply-To: <20260410120317.910770161@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
X-Gm-Features: AQROBzBwwjc8yd10cT00Tu5Dl2qrCYQStWr3Lcobhh8coMrpPeCH9vhBSNokYJk
Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
Subject: Re: [patch 05/38] treewide: Remove CLOCK_TICK_RATE
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_042808_090934_37EC9E4F 
X-CRM114-Status: GOOD (  20.20  )
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

On Fri, 10 Apr 2026 at 14:18, Thomas Gleixner <tglx@kernel.org> wrote:
> This has been scheduled for removal more than a decade ago and the comments
> related to it have been dutifully ignored. The last dependencies are gone.
>
> Remove it along with various now empty asm/timex.h files.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h       |   15 ---------------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

