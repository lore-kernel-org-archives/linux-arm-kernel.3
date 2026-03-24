Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C6DF532C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 01:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oA/BMSG0lIaU8QmGTi1RddZfsLsTkE9mU/q8AbqzqiU=; b=M8bN3UToHYi5rkYJBsK2Z7JMIL
	JDXg61Z+uzWT/9dVVDUP/60h4iFezgngHxA8a817gDY4bVw/h3KDrZW85nLYjmgltUHkgVpLqW7AZ
	mPRFz7YZ9hwmtG5yCVwimK3o67XRh0krH74lZcIHhAwu9FSODdQTQYthr6ujjvCpV35m+SNfBjkMH
	IjukZooxjJrLiXc/ImoBA2NRU8gfcO9nackDb6/2NTyP4jhVNc/Q226kcnMS615haLn5m9dTB/EDr
	mzF3RlJAsBkQrKFlOAEVeW5tPjoWLDuK0Ki2tv7S74jfuhJpLynIe1aTeZzWvkrLLT326vrpPz+Kc
	1Q3tqBiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qog-00000000KRv-1P9N;
	Tue, 24 Mar 2026 01:44:22 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qod-00000000KRO-3YyF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 01:44:20 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-486fb14227cso6893145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 18:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774316658; cv=none;
        d=google.com; s=arc-20240605;
        b=YIboguZ3R59V19SYQR19v583E/92Tj79TRK4sVUizCF13kapd8RuBPDJdxr3Av/XqT
         hsHENomHNHU9bBzU8upGY4LD4fvLbZm+Az18wOy3/h0XOjwv1Wu9BNGCz0jYsKp/i5g2
         s9y22EkG7kfovFz2jTy5KCdaLxSfs53GtnJLP0pUusmr9tqs3rgeHIAK4+fhEnZIym0Q
         cgQX0Sygm/Vnq98fHBxYOoGawZbe0qYk7Yqrhy6HUNEh0S/o+6JBgr/Rpfts0NSVhGlW
         B26CINJfIsD58gVZBdHn95KyRmYRbcpbRgjPq/mX1Xl0OtTEpfr+erNzV9/Vk+WSQAAz
         1meA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oA/BMSG0lIaU8QmGTi1RddZfsLsTkE9mU/q8AbqzqiU=;
        fh=evRuntVJG6IZ9CmdRTIppSn2iB7KXpEXfOUZQ20XA5c=;
        b=RRazFbuxrn3SoTHM/K+YF7BzeihoPQdyZ5Q3D3rokxXTfiISCY1W0LPwdt+YS1Fvgb
         iuoJKgyBivetK32pAbHN1+/5w72D7VfiC570LYR5A6ApCeQuAxQRLDj8m1uL8r9AFsJC
         cM22nsPx2R2nc3gkxDmgZulOayQPRADotUdGbtW/cPsiqcfWgKOYp8r6CCNKJCYhn2Gy
         33aZfyXMAfitLEp5KYbpC0jbQXKahhMEeMiDKdHa0lenl5E7n0Eldc6xqk3DL32FUtn8
         CwzKt7xjMD2z1o7sEXaFaEOGKW+GUE6oZK10Ez4Twnscwjfh40KnrBrNyPMfxQyLeV1W
         2djg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774316658; x=1774921458; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oA/BMSG0lIaU8QmGTi1RddZfsLsTkE9mU/q8AbqzqiU=;
        b=kc3lAIsM8KT4izpVGE4LKftY/AkfNFwCWWP01pD1kSiQrOGW9urko+U97mxPp600hZ
         8doOp0t8zrNZkmUnOvoWISt1VCP30/9DL1F95yXJ5K8YR+ylxBgJ9iE5jI/tVKIM7EFW
         vxyEJrthRVNwLc3/JSvK4Mf6ukTriSfMdy9/0auU1JklGqhU7J81RsSWbeGuU/kiKmFE
         4asdIJ1bsMx1oQPPWB9uSCYO/pnNUzLuj8EcfsHg4pKBmb5ooZy5skbZg8JAOlhi4PoZ
         ZLPDW4f3Ke38UqsRfEZqs4+QuIgr+hy8GA2nsMhyD9Qi5rZexOlLgm+gXYifp2Vnkacp
         vxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774316658; x=1774921458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oA/BMSG0lIaU8QmGTi1RddZfsLsTkE9mU/q8AbqzqiU=;
        b=nrPY+4r7HPzUydN4kq0/zL82x/9gI/5sUJcoXJUKllYTXYyU455kxcZF8sDp8hIinJ
         9e3jM6F6yxzwVd7F3BBRIbERU+pb8qHygkHgyB5MgkSNtX2SomEKNM2qBRtSBhdCg8S3
         CO5kZpTBB1R/qCNxjKWsn4S5xIo7Kv+SCb7jE9g2ZgF2OI44sjA7WSX+zO85wjV0wwqU
         n8eOvaLlT8NrsO4ks3FuS0S2qaM/dXa/6oHq7aFVrTO/kyxfeZQRypY8tA0NSAEZPW/V
         kIgZoPAGUXDzBfOrTvf/lMuzfGCg4KadZk+rJJFNlMk1YSVGePqMXg/OoLEUECCIDQRi
         8Fzw==
X-Forwarded-Encrypted: i=1; AJvYcCWnwbbypAewQDOMSoRrjczcmWo3VL709nuGE8KsXYytLP8vFcGEhsabrvTjnEskcfzCHGpidE6Xr/BHx6RY1d9S@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/oz+FolrvnvrrZmXVuXqimVqJuujsTM1NQQQG/MXM20rdUymH
	cHIJWlvxSGylx23R3KTLkAoxBHWLIAojAipqweJgiUPOE0l/tQvPpl/qoAMQ2jl4eYFFuSEf3ul
	TObqhoQ/vF2Rv8ZbG7sgqU1wLkWEF2RE=
X-Gm-Gg: ATEYQzw5NaIYsfe3QG6LKwKgzmPw+6mHzAjJhQddmg20cydtKFzSuW3gaOc6tdL/Pd4
	a/kJ4SZbkTrN1XQeR9fauN1aG80rIlTY5Ad/xqCRilgyaikFr+jSVxJo2Lt6XFTBoqfLb76JPyN
	D09jXryHwLyenLeTlyFpX/CsBZ8TidTe/rMKI6fNWZ84EhWKGczfjh10t993nLJEoZ2Vy55uAM5
	OpNFeC3vGG/WrxJCfMyd5gQVHtXhepMKPUtznW4IItmfjGeH6LrjKALhpXv6Vcqe6DHnOIoBO7Z
	y7S1PPT3SD6eYlq71uOIwPSWEk3p3J7Erf9pcFJ2mzEpdCyShsEOIg0pvKg=
X-Received: by 2002:a05:600c:3554:b0:485:3ee1:eba5 with SMTP id
 5b1f17b1804b1-486ff01cc5bmr205204065e9.27.1774316657635; Mon, 23 Mar 2026
 18:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com> <20260316013651.3225328-10-ankur.a.arora@oracle.com>
In-Reply-To: <20260316013651.3225328-10-ankur.a.arora@oracle.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 24 Mar 2026 02:43:41 +0100
X-Gm-Features: AQROBzB_vyabm8gMFgwrt-FFA5yFnsEMVMsPubU3mf_XijBG48EgQr58mCqMhFo
Message-ID: <CAP01T76iJAtfovOAhm+9-QwtbVJRbiQgUPWLBZZXYFozLFK=uw@mail.gmail.com>
Subject: Re: [PATCH v10 09/12] bpf/rqspinlock: switch check_timeout() to a
 clock interface
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org, 
	peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com, 
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org, 
	daniel.lezcano@linaro.org, zhenglifeng1@huawei.com, 
	xueshuai@linux.alibaba.com, rdunlap@infradead.org, 
	david.laight.linux@gmail.com, joao.m.martins@oracle.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_184419_902477_071435A1 
X-CRM114-Status: GOOD (  12.10  )
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

On Mon, 16 Mar 2026 at 02:37, Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
> check_timeout() gets the current time value and depending on how
> much time has passed, checks for deadlock or times out, returning 0
> or -errno on deadlock or timeout.
>
> Switch this out to a clock style interface, where it functions as a
> clock in the "lock-domain", returning the current time until a
> deadlock or timeout occurs. Once a deadlock or timeout has occurred,
> it stops functioning as a clock and returns error.
>
> Also adjust the RES_CHECK_TIMEOUT macro to discard the clock value
> when updating the explicit return status.
>
> Cc: bpf@vger.kernel.org
> Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> --

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

>  [...]
>

