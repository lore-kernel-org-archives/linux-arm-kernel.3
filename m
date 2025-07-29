Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733CBC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmeKc3jet6u3gOUQd2X+WQs6A8Udrvi7OwSfi5a8wj0=; b=3rgBs4VKDo9yBY9pRQoqwBG3+8
	PbZHCAkz7yb7SaaMQ8/XDw1JwrsNiXfBohRVVRAgDVikYULrXGH8Sezx+e/Y+cr1IBTmlyYlXBwI3
	2M7sFsGyAxMitLrH1YjFuBwnq7nBKuW5a7RxuL3AuZbI+eyBCWm5GHdUGfLAGhRs0FjEfzVt2Mjwi
	Drm4Jfha2DppqLTmdaYYB8ZqD7HSrQUuNTLJcxCwGSxukqKOslMNS4sMvkZUTZoPDqP1J5kMyWACg
	Fi9AYBh0IqzE1hFCrsiHZ0V6c3h8uw1v5C12mkAffwlqd2eAO3ywjmoQCnWl8OFH0dEZ/H05QAmoS
	k6r1NejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglID-0000000GtyN-26Y8;
	Tue, 29 Jul 2025 14:27:01 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglFj-0000000Gtm5-2wfj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 14:24:29 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4abc006bcadso63705091cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1753799066; x=1754403866; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rmeKc3jet6u3gOUQd2X+WQs6A8Udrvi7OwSfi5a8wj0=;
        b=3AL/BCjt1uhFuKknJF67s093Gt6AV8FoDhj098OZ8z9SgJeMe01PC+u1dtrqAE6i5w
         pB8qDaOeiBIN9lNpKvAlBcP7ne4ln5YlmJgsEUnexb5r3zRFlfbI5NmEjoCFxP2ElrA/
         j/hxIJ/JLY0THewjGG0dgN/ST8pLxdX7vt+r7Zt6BA0sYtFbzIG9w2XGYAxRY3cqBr0k
         UiNGz/8bfe981ZrpF7zRr9FT0RKyu1A/uKc8X6LpBUrg1GgWuQKn+oqgUjYhximegw5H
         wVnjaExtwYDndbnCTbSzjKgFYa3ynwAjHf7BIEufh8Zv5fEImBqyLD/xNeYjAh7qqJOL
         d6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753799066; x=1754403866;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmeKc3jet6u3gOUQd2X+WQs6A8Udrvi7OwSfi5a8wj0=;
        b=MxG3TTFhvp0Cpn7jtG8vLdkM9DSXCyVsfn5lDsy0SFaAiXb80xS+KhpRXyldmraDDr
         JeHQJ/5ZWCA2nrwtHye/AKVw6EhF1sd3lbPf7H37HHncAdvmfSczYDPcSVQcCC1xl2J7
         skJiqASNnHk9lWfBXW/ixusbZ3MOgZq1LMrWJ13v+IZR8JgFwKTkk9tRW/uWvl1o6IKs
         MiFeB+gkW3JF2Z8digNFVvArGMIWQgfzBBw9OXgsip4xE9edwx/6Yw1HmpMjlCLJAg/1
         h/TzHu5YfvlZn5NSLZm9xSDAnq9vqOGt8XoDT3dtxha/mIGL+y7usfOjaPi4pAloUV9N
         TF9w==
X-Gm-Message-State: AOJu0YwnYK4D/RBAkNsO95E9Axdo3DE4DNWtGodK9VJO+q5hy6jOaMEu
	AZ7BvnWe9eJO/ct+ITD6aTZmZRF5GtNmOAjW6bqZp2OlqGXu8Nmp8Un7OHqlfKuWra4=
X-Gm-Gg: ASbGncu46EmlEhCiweBR6QcQDeUQjdOnsNEzhqzChlT6rK2dp18bTr5cNHFG+K4QfzF
	upc8FzDtWhzSO21YkwElno7pmozHVq91woTcxWEuB3Er03vL1E7xuilYS5awI6cduhr2xeMIsWe
	AH6br1OUrt0d/D+AopbCf2nFCh0Dm2ouoqkU7YvuFG2spthBrAuARhqwwpwkp6jMql7rrLJz8gd
	A409rPYBcoHEw7vr+gITXJhtaxYEe3oxnYe2eAqXKnuU3/gZ7blMuLfvL+aN435CVRAwHWqF54B
	bHVpV6RcTQ/ATRteXAeYo7kvhBwkrNA3mXJvkiaihzKi7wxQzjtdel7cBsZSgf7l8P+/OeNfvK5
	hdVsUscABR9vMsRbUMujnV7lhEe8bbTRRT+k4pw==
X-Google-Smtp-Source: AGHT+IEls/QVu7ZlIlUQJ28Xm3RrlwZ4/ODLxhT+f7gRkpVOEKn45LTTgozTNCaJLKONRyTYZ09YoQ==
X-Received: by 2002:ac8:7c47:0:b0:4ab:6531:1288 with SMTP id d75a77b69052e-4ae8f08eb9dmr256458761cf.35.1753799065474;
        Tue, 29 Jul 2025 07:24:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae9963b732sm48999481cf.39.2025.07.29.07.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:24:24 -0700 (PDT)
Message-ID: <9650d2e240a9170175069e3a4f6d6d9512d62aa3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: s5p-mfc: Always pass NULL to
 s5p_mfc_cmd_host2risc_v6()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Chancellor <nathan@kernel.org>, Marek Szyprowski
	 <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Date: Tue, 29 Jul 2025 10:24:22 -0400
In-Reply-To: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
References: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-eEnUSaAdqhTct/4k3GEr"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_072427_861253_2EB5A785 
X-CRM114-Status: GOOD (  23.18  )
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


--=-eEnUSaAdqhTct/4k3GEr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

Le mardi 15 juillet 2025 =C3=A0 15:13 -0700, Nathan Chancellor a =C3=A9crit=
=C2=A0:
> A new warning in clang [1] points out a few places in s5p_mfc_cmd_v6.c
> where an uninitialized variable is passed as a const pointer:
>=20
> =C2=A0 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:45:7: erro=
r: variable 'h2r_args' is uninitialized when passed as a const pointer argu=
ment here [-Werror,-Wuninitialized-const-pointer]
> =C2=A0=C2=A0=C2=A0=C2=A0 45 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &h2r_args);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~=
~~~
> =C2=A0 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:133:7: err=
or: variable 'h2r_args' is uninitialized when passed as a const pointer arg=
ument here [-Werror,-Wuninitialized-const-pointer]
> =C2=A0=C2=A0=C2=A0 133 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &h2r_args);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~=
~~~
> =C2=A0 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:148:7: err=
or: variable 'h2r_args' is uninitialized when passed as a const pointer arg=
ument here [-Werror,-Wuninitialized-const-pointer]
> =C2=A0=C2=A0=C2=A0 148 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &h2r_args);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~=
~~~
>=20
> The args parameter in s5p_mfc_cmd_host2risc_v6() is never actually used,
> so just pass NULL to it in the places where h2r_args is currently
> passed, clearing up the warning and not changing the functionality of
> the code.
>=20
> Cc: stable@vger.kernel.org
> Fixes: f96f3cfa0bb8 ("[media] s5p-mfc: Update MFC v4l2 driver to support =
MFC6.x")
> Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14=
cd091d441f19b319e=C2=A0[1]
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2103
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> From what I can tell, it seems like ->cmd_host2risc() is only ever
> called from v6 code, which always passes NULL? It seems like it should
> be possible to just drop .cmd_host2risc on the v5 side, then update
> .cmd_host2risc to only take two parameters? If so, I can send a follow
> up as a clean up, so that this can go back relatively conflict free.

It seems so yes. For this specific patch, I would probably rename "args" to
"__unused" to make the reading faster. But does not matter so much if you l=
ater
remove it.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 22 +++++-----------------
> =C2=A01 file changed, 5 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c b/dr=
ivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
> index 47bc3014b5d8..735471c50dbb 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
> @@ -31,7 +31,6 @@ static int s5p_mfc_cmd_host2risc_v6(struct s5p_mfc_dev =
*dev, int cmd,
> =C2=A0
> =C2=A0static int s5p_mfc_sys_init_cmd_v6(struct s5p_mfc_dev *dev)
> =C2=A0{
> -	struct s5p_mfc_cmd_args h2r_args;
> =C2=A0	const struct s5p_mfc_buf_size_v6 *buf_size =3D dev->variant->buf_s=
ize->priv;
> =C2=A0	int ret;
> =C2=A0
> @@ -41,33 +40,23 @@ static int s5p_mfc_sys_init_cmd_v6(struct s5p_mfc_dev=
 *dev)
> =C2=A0
> =C2=A0	mfc_write(dev, dev->ctx_buf.dma, S5P_FIMV_CONTEXT_MEM_ADDR_V6);
> =C2=A0	mfc_write(dev, buf_size->dev_ctx, S5P_FIMV_CONTEXT_MEM_SIZE_V6);
> -	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SYS_INIT_V6,
> -					&h2r_args);
> +	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SYS_INIT_V6, NULL=
);
> =C2=A0}
> =C2=A0
> =C2=A0static int s5p_mfc_sleep_cmd_v6(struct s5p_mfc_dev *dev)
> =C2=A0{
> -	struct s5p_mfc_cmd_args h2r_args;
> -
> -	memset(&h2r_args, 0, sizeof(struct s5p_mfc_cmd_args));
> -	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SLEEP_V6,
> -			&h2r_args);
> +	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SLEEP_V6, NULL);
> =C2=A0}
> =C2=A0
> =C2=A0static int s5p_mfc_wakeup_cmd_v6(struct s5p_mfc_dev *dev)
> =C2=A0{
> -	struct s5p_mfc_cmd_args h2r_args;
> -
> -	memset(&h2r_args, 0, sizeof(struct s5p_mfc_cmd_args));
> -	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_WAKEUP_V6,
> -					&h2r_args);
> +	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_WAKEUP_V6, NULL);
> =C2=A0}
> =C2=A0
> =C2=A0/* Open a new instance and get its number */
> =C2=A0static int s5p_mfc_open_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
> =C2=A0{
> =C2=A0	struct s5p_mfc_dev *dev =3D ctx->dev;
> -	struct s5p_mfc_cmd_args h2r_args;
> =C2=A0	int codec_type;
> =C2=A0
> =C2=A0	mfc_debug(2, "Requested codec mode: %d\n", ctx->codec_mode);
> @@ -130,14 +119,13 @@ static int s5p_mfc_open_inst_cmd_v6(struct s5p_mfc_=
ctx *ctx)
> =C2=A0	mfc_write(dev, 0, S5P_FIMV_D_CRC_CTRL_V6); /* no crc */
> =C2=A0
> =C2=A0	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_OPEN_INSTANC=
E_V6,
> -					&h2r_args);
> +					NULL);
> =C2=A0}
> =C2=A0
> =C2=A0/* Close instance */
> =C2=A0static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
> =C2=A0{
> =C2=A0	struct s5p_mfc_dev *dev =3D ctx->dev;
> -	struct s5p_mfc_cmd_args h2r_args;
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	dev->curr_ctx =3D ctx->num;
> @@ -145,7 +133,7 @@ static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_c=
tx *ctx)
> =C2=A0		mfc_write(dev, ctx->inst_no, S5P_FIMV_INSTANCE_ID_V6);
> =C2=A0		ret =3D s5p_mfc_cmd_host2risc_v6(dev,
> =C2=A0					S5P_FIMV_H2R_CMD_CLOSE_INSTANCE_V6,
> -					&h2r_args);
> +					NULL);
> =C2=A0	} else {
> =C2=A0		ret =3D -EINVAL;
> =C2=A0	}
>=20
> ---
> base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
> change-id: 20250715-media-s5p-mfc-fix-uninit-const-pointer-cbf944ae4b4b
>=20
> Best regards,
> --=C2=A0=20
> Nathan Chancellor <nathan@kernel.org>
>=20

--=-eEnUSaAdqhTct/4k3GEr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaIjZlwAKCRDZQZRRKWBy
9MSgAPoDXRwf5Lxtcq7Hp7OG4Atltr1GrYd2XN3KIA0gsC/AKwD9FHG0AEjkTtQA
V4fMhdBvUCT66a8f4JosODa/RnqNtwE=
=4vZk
-----END PGP SIGNATURE-----

--=-eEnUSaAdqhTct/4k3GEr--

