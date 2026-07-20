Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FC7C44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkD3jB2s3IIbN08+g0w0TygpA5tj0fOSjjBWkNKDgEk=; b=Ta/io1E3wmF/Caqw5x0lwNbOO/
	g8q/2EvhGpGI7vghbT1qawd9YOBKjsy+oSboZ7d1smxUDcZbocbDVFExol08w1UjaPMR83lOvrsRf
	GrOza6FeW0hyBSi2iIC6tasTNOly6kAyYlG6aYgyn8/suNu2Tun2ipIejMyG+QI/ezrtRH3GFPOt3
	z/uD8kvkC4RMH0ExCkJ5gEpXHXawEIFBuT9eUkN4O5Rtb/9xziSn1Q5eGs+KFXFUho82wNpLkAEy3
	LvGWgHLU01q7Vj9bUj+SpJlCtOouY0r6eRbgBah5oJbzVVuML1kOjipuCvY2000mh4ATvw1vPI9cu
	J2GpQDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltgf-00000007lGQ-2VAY;
	Mon, 20 Jul 2026 19:30:01 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltgd-00000007lFd-2P3o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:30:01 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-51c10e86e52so948741cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 12:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784575797; cv=none;
        d=google.com; s=arc-20260327;
        b=QLvvXho2/QncX0cr9IS9sWXKVaYbmYoRvKw00TNpo0Ysn9uUAY9YG3j+OYII6Jpusu
         +LLeqU33gcgIA3LvBYqhmyNFeZeAcMVPbgsE/CZxpMjzaQHFy0EEMCw3aeIw0wzOjBt1
         vaASC7n1wrWFQAeAMviyCsmGYTL9ZKBj0n06IM7/s2vf0zhdd4AvInIoViYuyjiKNdyo
         HWRYZP9ajvqH+a4t64AXirSGzc7YMav/9X1H5UEnDoO3AAInXN+z1+7DSbvHCH8FRe2Q
         8boUPr/F707oPozykSbWhZbUK7+fv0mueiA+bGVUA8IyLsqDWriU1ti3H8PSO9tCE2my
         6H2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FkD3jB2s3IIbN08+g0w0TygpA5tj0fOSjjBWkNKDgEk=;
        fh=ymPylF+GpHl7qWWtoyAKVKSvfx2FFUx6R+5Ml8ijcKY=;
        b=CVAfxQATKO7OzqiR7v4wDFwMVXKp196x+kEYd1/A0gaJ3ILdhS4y41T1aOB7UgyL+x
         Tp7me69jfTblCW5taSlWUtenTNpjJtTBb4sMbMrnPDPiUKLgB6kRvqvV4ISuKMDJHxQ4
         Zs80JXYHDLJOs9ByTKUumCuCs+O5s2VAz0ZNU5m3LEbjcLv9Jmcg42XWzhGvynEWDjZ1
         RHc0pcA89WK4j8a2HWCLcZylOQ9kKB52lk/40EmEhHnGEHccxjZxxAXtGRW/6zQC5Dho
         lp5mEm4Oh4MKEjkFtzMUX2CEL6UwWbjArXJz4jSIppThL5aCBFO+8wgiF+PRF4nJrBzh
         Ircg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784575797; x=1785180597; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FkD3jB2s3IIbN08+g0w0TygpA5tj0fOSjjBWkNKDgEk=;
        b=M+Ogpy9/33V/R0H12imlT7lMbu5eUjdkcCLshePWXH9yFccNmrcDPCXpZMdg6A/Bek
         pZ6NJXwmutrdRstLjsstbh6j9U8gwc52zbkKdDrov+/wMb2J6JeMzR1NT8zmTA6M9smt
         aaFUo0aljyuGVaL7Y8tHY86uRSmHw3iMTQa/Rgh2MAzJK0cz5YySR4zkiM5XT496Bwov
         Wtu8eW0HUJsheE00b5QQuci7hBcGmzCszAlrIrPrHumtM32yh86nZaNMEjEQVxw97Ebc
         bUDxq15Old2zGu4xiMFAZoync/q015afwE16Z5HFdBvkEql6UyKcwfSttZb9LhTck6NW
         1e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784575797; x=1785180597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkD3jB2s3IIbN08+g0w0TygpA5tj0fOSjjBWkNKDgEk=;
        b=p0Ey72KdeGi+MKZDNc2uOzj/s8uuevGj+CNCT9FInDUlGpZ1EtVraF7NJvrb+a9UXe
         C/KOJzGFchP9ZauN4KgFMSXLeB5rN3gQxAzZ2cSt0N2HVyMIIScCAAvZ61B0XWAVLyR9
         zDk8GuzKdN5tFAfBG2ivoKXrx1pFfRO0GtRLxfWng/MLM5TZKc9UwgFPbQ0oGW2uf3BS
         XD6h0x1/jSgyrdexjGXc56U8oHtaWrQnndj11WOIR7IszTN03CzFuuhtbx5FtXRnxrtU
         hoi6Ud6D1BGf7klm90b7TGHcHXvPeiP+fZrHXw4uM+Yt7x+xFgOuRWRxUpz3RY1BzsG2
         PYgA==
X-Forwarded-Encrypted: i=1; AHgh+RrcKPXPNafVvHZjfJj+PkDVu8FsrdK3psVjEAXu5P0X1Jac1O6MsvOSOqfY3N9QIsss2rGZypDxQnm5pFUh2XJE@lists.infradead.org
X-Gm-Message-State: AOJu0YyCK4ykiObKDNIHN4T7jZ+rCBOvNSLq3hG+dRopfPJG2IQrPpXl
	tDMJT/niXqrkYc8Jqcw4FMbXJ39LZl52xlzYeFx2LsjG58Y4EUZrDi7KozK5e8nyuhJlYtyAEVc
	S3QGIQ/TA4/ONoBIyw854Dzg7SlM9Jb4jNL01jEI/
X-Gm-Gg: AfdE7cnKR+lzXvXnwg275iyCGA7nJeanktTqtHJIeKsuERZ1RwfK6DtP+UztPJjA7qd
	fhqKuTNDt1Gv0yqLQ8O1rrAza7EQNkfFIfcQmOE5QRzzrx937kVinMs/UcFsZUH+IGISJN7KP5O
	ue73mXf0uUpYnJoxUxJBnUrylgVBy058iIiexPRHH9jCSkpGLldUnL66lIqaseldW0dzdrG2FAf
	GlNZNPCNAz4FyO/Q8RDQTq8bUlXpUT6zDtph+AZ0EialM+EgpDrwXTyAT8=
X-Received: by 2002:a05:622a:6d13:20b0:51c:7a90:a79a with SMTP id
 d75a77b69052e-526033764f4mr4774471cf.26.1784575796860; Mon, 20 Jul 2026
 12:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com>
In-Reply-To: <20260718111340.159896-1-linux@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 20 Jul 2026 12:29:20 -0700
X-Gm-Features: AUfX_mz0YGJIXTAqoc42mflq1D8eqRe1dNjHeR1gvxIC8uUY_rJ9mhzujQ94LHE
Message-ID: <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_122959_638783_8302E6AC 
X-CRM114-Status: UNSURE (   9.54  )
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

On Sat, Jul 18, 2026 at 4:14=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> Relocated suspend code in OCRAM lacks compiler-generated CFI type
> signatures. When CONFIG_CFI=3Dy is active, the indirect call to
> imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.

Would it be possible to just copy the 4-byte CFI hash prefix to OCRAM
when relocating the function? If not, the __nocfi approach seems
reasonable to me.

Sami

