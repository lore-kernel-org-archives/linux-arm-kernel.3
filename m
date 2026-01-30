Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ADFE6BF39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 20:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNkWGolxQDh6EVvN+xcGZ4XW+NwLQCLTlADMIxMO8Wg=; b=N154jimomNkg/Cz2v1KfOV9Azo
	qXlYjpJltmvR/P3x1Q2CsaAJ0G/j72tq1pFxUDMnBkGRNzjKWIek3Sev0Nq5KIcTkxvfc8lEVXxeE
	AVxjTve42sH28gK3jzb0AiKcDHiYXoLLQrU3Cs23j9RUbki8uoFg2SEKQ4FDoTGMIUHN673a5ORPU
	SeZYDeXiHAEZJaF/QD7w6qJy3k5al7pSBhEUUBbc9mgC8px2tGPvtl5sSVIbw+1MrPk4QFu2Vg2el
	0jcNdhSY4ESaBXv9EK4Za/5YjoMhXxqBhU3eCpdjNvW5b04bGumehaR6jNcJTDk3uwLd1EQVB070L
	OQxDQ4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vluqs-00000001v3X-0Fhu;
	Fri, 30 Jan 2026 20:12:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vluqq-00000001v3C-1Brr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 20:12:21 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so2299757f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 12:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769803938; cv=none;
        d=google.com; s=arc-20240605;
        b=BYBCiwhH+9Mz1aPiLkp0RxDmSrkoipE84cEUTAzz8D7B4Tb7vMmU3fiqiRt8OqQA6p
         Ol9JSXEKMygp/Vo3A5dN/n+D9qTQ8G/sWRvlEfMXSKMguQqAvL0GU5GtpiR0mGI18onA
         5sGZlEpeqebJwleZIkbciNeGyseoYtW2LGsXYYv9KDeQez2Zur8ZrSWUwGO3yVySs7kF
         ePV8RzKp+hs9NSajis77rPVeNjsP36JbguZEcCe6cwmtjQauKFKu3Q87Sgq/7EDt3QNK
         2hcZrkq4GIeFq8qx5urwqN1IWcZ7Mg1Bh52c6lEpE32WnNlRY3xEWhiAFW1XJHlJxC0X
         AOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNkWGolxQDh6EVvN+xcGZ4XW+NwLQCLTlADMIxMO8Wg=;
        fh=SfQThW3PnW2OLR+JJzg1CVH2rm6gIyJ/nNZahqeLafs=;
        b=bZ/hfU/SwxXhw7lURVApEQhPt2b7WSMkNRL2X5bGvS0t8RSMbmLNYCYYR3n3bYEqHo
         2lVEs1YP170hARWxR6J/Vq7eaY5b+u3OauRrfa+t+sL8wuSzKNoLMrSbVBWi+QPn6Ybq
         XL7qqF4pEjzliYJvnpW7+eSoynfvgpM90LAOO4IzyaJ39acod19vNeLOzWLDol95jTa2
         eaE8UfpiqDORBujd48sA1TVWajel3IYNleC7B1gkxkHfj1VvQfeEip1uWZjFldZwsgLb
         LGgeexSed/V+K5IC3VcvYRyIV2mAqabMbuMZByvZTBQsLL5OFYuNK551K114KWpJ1y9F
         nyKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769803938; x=1770408738; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNkWGolxQDh6EVvN+xcGZ4XW+NwLQCLTlADMIxMO8Wg=;
        b=k5q5246EIXrs7UbxPfh59lO5EbEh20CUaD5l9j4+VU+lJ//6rIZ7uqNzUhmm8O9bgY
         bYPFAhvHOLaTHEGoTilyZgXZpMi8XVVJpyM1UpEwKyRKDsmzGx6Bf1qYl/QbMy9X6Xg8
         zHVwP61nXYFLBG2DuaL23L49UWcbKR3rhwUcpr55TdYhVuZ/Xh5kqiY0AA39EkjyGapK
         9RhLGHTL8VoyZHmk4K1O1QLA4TsFi6eINgayhuQsIWijvwJgcfLmWzWdIt+/VW6rc3wy
         p+ZQPxYzpGrA/HYth7zsoNPaIT4pVa7B+V95KWSshI+kIkFHp2DdRKVXgpRgCvju+ca7
         EKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769803938; x=1770408738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNkWGolxQDh6EVvN+xcGZ4XW+NwLQCLTlADMIxMO8Wg=;
        b=TZbec3U5GE+SiQv13wqonJkJUGeNDfL4h/gpY6noq2qsfQOxeTGkIG44wDvjA1pTOX
         6frsimMFOUdnva6sDvnrxOjvYMAXftsr4nyafbEx1GwX9IEsLkhRKEu6ZfCj1DqU6kq0
         7Wfi9haStl0VkEsOZfIsMPW1DYh3GzriCyFXsEUGFHq0MOeeHW9gjraz/xqQMwZvAx+S
         FYhdPZmYo6yuJ+FcwA97mpvavlvKqGFz6e4bEkbEGTyp9t368Fg8fEppX4FkrCdX8PjE
         Fcx3IMOFf+AdR5xyFn77kzRJkLysutaNgYUQQek7U8ILcaTNWmr/sy2TK6h8LPvdSn2Y
         qTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn6F6ywPA8WxgoBVUiME5VZNcfwsdBPfCSncAtV28bSEPdi4RrEdRca83Hm98A63pQE1JtcLfCwWnoXRvtja2s@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+cPsdOWtEOq4J8BexYxhLzih4Cm//ktHn42guq4GjE2zLXxZd
	D8Fy10IwSRKqXR+rdvDNlEYiTiW0fUmdZW8lbAX1K5Xe99obBrnVrGzcddtZcp8itXCa3ebgr8C
	mxQa5bQhb+wcdCiMmcxACdctKC0BedVY=
X-Gm-Gg: AZuq6aLMOuW+6osk2T5vTEDCjDlupUmo+ynqLKJ1goZ0RPtLCFG5KYh/mRRB46hGWzC
	AyKhBnfTo6M1naZUyevRabfJkmSTrn+glFClrI7xQrTBsh8mn5m6TrPsBBZg2ZOyqPFeE2tijXz
	8WB4qX1M0I6xFITTvRkTLafED/wHlwuQbaNJct183DRDoY4Sk0DFQWiAuQrf1P93B0pIm/P3zXu
	iap6uZ9jyWv8ijdfnNg5f2wvei5FlcpgtPz8MK5SHlizwR8+AvEjLzNnC4jnX7sHZ9UfcJcS4WD
	goLK7hnSUaBl9vjMIgfrNJsPnBdugVU72ZnkVaBsNGeR5jJXjR9utrLlm1E0XphDphqfaGUsL0x
	v6YWZ7SWyPFk3vA==
X-Received: by 2002:a5d:5850:0:b0:435:dbe3:c6b1 with SMTP id
 ffacd0b85a97d-435f3a92b77mr6548800f8f.25.1769803937424; Fri, 30 Jan 2026
 12:12:17 -0800 (PST)
MIME-Version: 1.0
References: <20260128150112.8873-1-leon.hwang@linux.dev> <20260128150112.8873-3-leon.hwang@linux.dev>
In-Reply-To: <20260128150112.8873-3-leon.hwang@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 30 Jan 2026 12:12:05 -0800
X-Gm-Features: AZwV_QjdO1kPJVwhKD_i-fkrT0ene5FMAqGbrhrNJNSUzbF4B1pZUOSE0M6KT9E
Message-ID: <CAADnVQLmPPBazEGn5bvg4MMYbxtj6xZu3zo-V3DoqVYqZWDt3g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/3] bpf, arm64: Add fsession support
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Menglong Dong <menglong8.dong@gmail.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_121220_343677_50E471F4 
X-CRM114-Status: GOOD (  12.26  )
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

On Wed, Jan 28, 2026 at 7:02=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> +       cookie_bargs_off =3D (bargs_off - cookie_off) / 8;
> +       for (i =3D 0; i < fentry->nr_links; i++) {
> +               if (bpf_link_prog_session_cookie(fentry->links[i])) {
> +                       u64 meta =3D func_meta | (cookie_bargs_off << BPF=
_TRAMP_COOKIE_INDEX_SHIFT);
> +
> +                       store_func_meta(ctx, meta, func_meta_off);
> +                       cookie_bargs_off--;
> +               }

I think the name could use an improvement.

> +static inline bool bpf_link_prog_session_cookie(struct bpf_tramp_link *l=
ink)
> +{
> +       return link->link.prog->call_session_cookie;
> +}

reading the first hunk without looking at the body isn't trivial.

How about
bpf_prog_calls_session_cookie() ?
Then it's obvious that return is boolean.

pw-bot: cr

