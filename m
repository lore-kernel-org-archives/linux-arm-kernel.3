Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A83AE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdl0A8UixsIff/MQ5v+B5jVRqHb5yulzDbRj1E6u3Cs=; b=DVXE9IJqmU43nUlqXDXaypyDEZ
	pIB9BK8rOC5ab5tinOCNQRKluKrsFYUCr8D/JFqueRQ8Qm/lmJ80yZepIGTnwQ7KyKfTAd1vxGiGc
	da7RF3amnQVaKRPOBd2oOpMngl7A11L6cPupqzCPM6m6gZ7zhxXDn/Y4ajJ59RgWPr86iYFHVGzRk
	Gks3swu02udafLmKKrV+rP0Z1t0tCUn3QesKO9a5x2VF+6UGOscyOVlML5gVneBTSPXfDoSpwh0Ke
	96dQXPVzaJsOevJw3r7RMa7j7noKNhK6bJ5nadyFkHf4aq+hDrpCdnaN1MQq0GhJjJlvkSKBaFeqw
	wPbZS/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspJd-0000000AU0i-15X2;
	Wed, 18 Feb 2026 21:42:37 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspJb-0000000AU0L-08VO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 21:42:36 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-895341058b1so3193096d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 13:42:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771450953; cv=none;
        d=google.com; s=arc-20240605;
        b=eLrqIQDPYdIj+/FsVBWJxkTbt8UXLVYqUFAMZSh2UgvkiEg9dz2w390qcRvR184cvn
         nhABufwA+aCt6X7QEi5jabWCPrqyxvLDsp756XjvrhWljVawxQIygTUy7GB4FyRsSNm6
         6SjpRsILV84RVHHWRIYhnVkVtsQONbavnxJ/6WsvkO5CqNYchSrOI/CoI+GabDtk/Y0t
         Hja+qoMv9BMmPW7EhDlmqjYvM09YgaUbNnDEWSnPYMAolEBwmD4053THQDawQGz9jITj
         u6MGQXKQuTTEogE+qpHHFRkiq5ep0Q5csG3/mTdfgQs0DTiAEXcBQrYf/CwWy2xB/aMa
         mxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fdl0A8UixsIff/MQ5v+B5jVRqHb5yulzDbRj1E6u3Cs=;
        fh=Ndaz2ea2gGLPe4poBbMy2Xh/ea4q5PJpOrLLFbPax/Y=;
        b=K2vDdIsvUbDGW8QF1uWR5B/Co6hKRqOSmLMfgDkt9hnO3hX3tVVttmfOipgTMrikNv
         tkkHOzwmFJwHNcuJQ/fLWzYk/gw+KtE67MFIsnOwkUNoxryCIugAUg9vRG0Qvuq6l5cD
         x3neqtzImt7ms0v3M9TxHykkZZqV2sPOohNBW2x1CYNrrK77VeFXZXgBr1urM4btRuUT
         +huxxxWWvwirs+niOxIptkRPDJ2ax0vI9VoklLqMcwWUO2/EktwWMu4i3oZjASks58Q9
         Y0D8EgpDerVUyKioK1x048/nH9ZYeMU5h5KPB0OAX8yygGzFtPDksjAk9iSjdqy4lgis
         G/RA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771450953; x=1772055753; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdl0A8UixsIff/MQ5v+B5jVRqHb5yulzDbRj1E6u3Cs=;
        b=ne8A3uYoInblL40eghGdD2fkqeCsH0nScfIBDinXiDgST/N2e+qKXGRxD6bb3mv3w5
         EQZKoYQUMLEuYXy+l+u0MmL4Xp9CqjeZvbjwYpAAonSWlW7IfVAqSDtpedGZJfXmXKDO
         F/1se7g21V+nqsqkWqzA+7skRYCP7NU0H8br/d7k7/FTlWT8MdqBrjXrxY24KQhjPuX6
         y9HhCekj51r3PDqtcmTC7a1qK1jORH7TcvrknieF8UFrqjbKlBtswsPmfRFXhqV6rDOc
         4Vz/oX4vK5nkRxPVCq9ZcmEDuryOvGjH3iLjVVrwcPMwEqLVi2wS0aQOPnsJl6fPEwUv
         xJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771450953; x=1772055753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fdl0A8UixsIff/MQ5v+B5jVRqHb5yulzDbRj1E6u3Cs=;
        b=ZAq+vW8ulNa+Zkl3vpkGL7TbKkoJ0Glmio8wIYysT8serDIUVRjuTps4xXplG8Zf8X
         crELKkE+UG12vaq1gtuhtypR0Vvn4HqLgqrSrGwjS3EiBfwt+3BStPAPB3o635ivN8yz
         f8e3HdcYRKZdLLidtAwZ3ztQyEP33+f3LZHs3IpqsaX2AulJWlxRIT/0tnUZ/2maNIYl
         JC13+p/z9Ju93Pytj80YVcNHGY3am7hnhpPBb+DW3YyS8kgXXpU3HseV6n2FVGzbsM2+
         zkKxDiEQQoMOpc5F2Yitu6zXF8kSc0uBVq49+rqQnl9661x/vLGaBtfWO98kVeGOkat4
         eE+A==
X-Forwarded-Encrypted: i=1; AJvYcCUb7zJDcIIltglXjeHa+Xll/xxnbtg/UhbBcc1ZpnN7GgFBN77YqJxJD1EEl3w3XXB1HO5XL0AieiscQxnirP9x@lists.infradead.org
X-Gm-Message-State: AOJu0YyFvXyi61UDHiTBhCcA7dSNSoMjvfhTjFasppL6WnQem20Nzvz4
	ZT2aGatnH9aIO6ydP7nCehS0pSCyb3peFfKmLy4mgF8rM2ucURJeJT4OYOJpi6BzITJz5zNpxlj
	Zii2nDrOK6Oo5HFJGPTfGahbd/6rCmzY=
X-Gm-Gg: AZuq6aLDUPJC6UPn71Ov0sVt84JvsgRzWs2uh3NMj0+hT/Maw3VBqc2vXseEkae+QkX
	3bib/n2Z1pwqcJfMCqjzyRt3nO+zXTwYYYg4uJr7HHqIsISsq3jApRnLX97YypPKBLYjth4EPNp
	ectus+ZdgYbg9SMnlZ6cQVYgaEcGpR5LUtX2JRkNjNdNdIHp5/8FPAog0LwhEnHchQiG+JPZ7mY
	jknVaIv6b8WgYrN9qIUgd9Gan/Q41DLAYPfrLIsPh39IL29w2BhhoFNa14CL/OlFfMlY6OWBKML
	pMd+maOdQuT6IL5BplrmaTUUv9AbFr3Gm+vcGGqy62ijCYNXOZ00ydzaEn8ns5i6/Do0K9vz00s
	XKgzm9+EVucxhquaYTfZqjBcTOvVoDYyiAjBY/gzKjTzTUU7vBcdSuU3DE2bkSkKlkbXhCDyUQx
	oxJ7uw4tZsspuTjPKnP9651A==
X-Received: by 2002:a05:6214:202b:b0:897:306d:98b9 with SMTP id
 6a1803df08f44-897402d74ddmr259168586d6.11.1771450953049; Wed, 18 Feb 2026
 13:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20260218213501.136844-1-ebiggers@kernel.org> <20260218213501.136844-12-ebiggers@kernel.org>
In-Reply-To: <20260218213501.136844-12-ebiggers@kernel.org>
From: Steve French <smfrench@gmail.com>
Date: Wed, 18 Feb 2026 15:42:22 -0600
X-Gm-Features: AaiRm51OR0UA1EoYTzTIBq9EZMqc4hCYgiV_-Pm5bfpkALLXMax-4eNCD0kf6YQ
Message-ID: <CAH2r5msdQw2KLyMJMoSrzFoGoJfmuCsBj_qeT34sH5b+6DLWFQ@mail.gmail.com>
Subject: Re: [PATCH 11/15] smb: client: Drop 'allocate_crypto' arg from smb*_calc_signature()
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org, 
	linux-cifs@vger.kernel.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_134235_109830_D4A4F955 
X-CRM114-Status: GOOD (  17.74  )
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

Acked-by: Steve French <stfrench@microsoft.com>

On Wed, Feb 18, 2026 at 3:38=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> Since the crypto library API is now being used instead of crypto_shash,
> all structs for MAC computation are now just fixed-size structs
> allocated on the stack; no dynamic allocations are ever required.
> Besides being much more efficient, this also means that the
> 'allocate_crypto' argument to smb2_calc_signature() and
> smb3_calc_signature() is no longer used.  Remove this unused argument.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  fs/smb/client/smb2transport.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/fs/smb/client/smb2transport.c b/fs/smb/client/smb2transport.=
c
> index 0176185a1efc..41009039b4cb 100644
> --- a/fs/smb/client/smb2transport.c
> +++ b/fs/smb/client/smb2transport.c
> @@ -202,12 +202,11 @@ smb2_find_smb_tcon(struct TCP_Server_Info *server, =
__u64 ses_id, __u32  tid)
>
>         return tcon;
>  }
>
>  static int
> -smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *serve=
r,
> -                   bool allocate_crypto)
> +smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *serve=
r)
>  {
>         int rc;
>         unsigned char smb2_signature[SMB2_HMACSHA256_SIZE];
>         struct kvec *iov =3D rqst->rq_iov;
>         struct smb2_hdr *shdr =3D (struct smb2_hdr *)iov[0].iov_base;
> @@ -438,12 +437,11 @@ generate_smb311signingkey(struct cifs_ses *ses,
>
>         return generate_smb3signingkey(ses, server, &triplet);
>  }
>
>  static int
> -smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *serve=
r,
> -                   bool allocate_crypto)
> +smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *serve=
r)
>  {
>         int rc;
>         unsigned char smb3_signature[SMB2_CMACAES_SIZE];
>         struct kvec *iov =3D rqst->rq_iov;
>         struct smb2_hdr *shdr =3D (struct smb2_hdr *)iov[0].iov_base;
> @@ -451,11 +449,11 @@ smb3_calc_signature(struct smb_rqst *rqst, struct T=
CP_Server_Info *server,
>         struct aes_cmac_ctx cmac_ctx;
>         struct smb_rqst drqst;
>         u8 key[SMB3_SIGN_KEY_SIZE];
>
>         if (server->vals->protocol_id <=3D SMB21_PROT_ID)
> -               return smb2_calc_signature(rqst, server, allocate_crypto)=
;
> +               return smb2_calc_signature(rqst, server);
>
>         rc =3D smb3_get_sign_key(le64_to_cpu(shdr->SessionId), server, ke=
y);
>         if (unlikely(rc)) {
>                 cifs_server_dbg(FYI, "%s: Could not get signing key\n", _=
_func__);
>                 return rc;
> @@ -522,11 +520,11 @@ smb2_sign_rqst(struct smb_rqst *rqst, struct TCP_Se=
rver_Info *server)
>         if (!is_binding && !server->session_estab) {
>                 strscpy(shdr->Signature, "BSRSPYL");
>                 return 0;
>         }
>
> -       return smb3_calc_signature(rqst, server, false);
> +       return smb3_calc_signature(rqst, server);
>  }
>
>  int
>  smb2_verify_signature(struct smb_rqst *rqst, struct TCP_Server_Info *ser=
ver)
>  {
> @@ -558,11 +556,11 @@ smb2_verify_signature(struct smb_rqst *rqst, struct=
 TCP_Server_Info *server)
>          */
>         memcpy(server_response_sig, shdr->Signature, SMB2_SIGNATURE_SIZE)=
;
>
>         memset(shdr->Signature, 0, SMB2_SIGNATURE_SIZE);
>
> -       rc =3D smb3_calc_signature(rqst, server, true);
> +       rc =3D smb3_calc_signature(rqst, server);
>
>         if (rc)
>                 return rc;
>
>         if (crypto_memneq(server_response_sig, shdr->Signature,
> --
> 2.53.0
>
>


--=20
Thanks,

Steve

