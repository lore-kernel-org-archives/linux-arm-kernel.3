Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C53AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 01:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/oN1wSwP4UvaqVHTQHo6/s99KohGdqm9m0b1NPOizY=; b=Bei8xNjVaWK1siKoz8ZpgWODOJ
	iLBkTfcf6T8AdbbvEx0bYm0Mu01h/qtlUdfoHsn5ZA6ix3spSsiTsnsLuP33D+w2K/BHlo3h2gszK
	Q/cnNjvrqh57kF/XgUYkWRsR4p9GWnfEiaHhhRCRadUsHOzvdCAp37s8YWMaSoPaPD6ZmRD3Dt7OP
	0K80XPNQOZTAcsKD5Y3vGUPCzw+HuCRLBIoxT8twkiaQ0Ho6wQxvtVhElVgdt/ihpqSRljSAtTGAd
	WR0iiRTVYFKEPlvWVI42qSi+3dhH5iFn8iHIkb03F3YXR9uN/u2h0cxSfikwPqtc4IghnTtyJ4oxy
	m2cfiklw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAiz-0000000GBFu-34QI;
	Thu, 16 Jul 2026 01:17:17 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAiw-0000000GBF5-3fx0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 01:17:16 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8ee6912d86dso21169956d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 18:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784164633; x=1784769433; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U/oN1wSwP4UvaqVHTQHo6/s99KohGdqm9m0b1NPOizY=;
        b=YEQgPsbm9Bo3YrgmvbTWfe8fcFvhLLa6EEqhGivTfOYY2TESjWsNWMPvHKNC5GiDS5
         FFY9s6UZAR6xmOI5MPCCaxvxAVDdqDdwfquC2WNPKNwECpMgljCahNlM/w+MdZzdmyl2
         IXBYLzf81IDf1R2C2e9VampPZNGjdxnMH7LNlzTHC6tIK84mSzFejJsjq1XDdmHWN3E3
         DdIPQ5JJQIVZAC+t7Orsoevs/a3MZ7W56WhaCMPD5c1DMxmwyeE2rSsZRbzGHP9HIQuw
         +zAAVX83ukMyMEn5QGn1ghwMjVPgb6u3Zv/Os3Bs7UttMDHtaISxv6lUjDeiTMdVanHd
         umuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784164633; x=1784769433;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/oN1wSwP4UvaqVHTQHo6/s99KohGdqm9m0b1NPOizY=;
        b=pjnBIkff18CpBYCF8pj1ez22HLF7/r0+hHHFCY8giXoharBw38v+BS8kIdTfqknPbn
         WlCUuvAskCVdvqJbo041/RM0Ko2DvdfyTedv9om555G21NhUlZ4JRsJwI8leV3MOIysa
         klTNdB4GpxHcbrwYc9XBiawBs9s7guHMc/pKFFddFT5Hoi+bDvqTqk3s+pLQohhrcpcp
         4gs+itxHaVyyfcfEr6mMspYv5DPzGFSZCZ6KIINxsAetNQa6KbNmHXcJDtc7P6xJ3R2q
         MTfXQbjzMSbrwNQ+0Ew6QQs0HooiZoe2Fji8MqN3feGz+mCF+FAuPXVfJUfO6oPWJa5C
         O+XA==
X-Forwarded-Encrypted: i=1; AHgh+RqysEL1YQT0rkET4mcn5D8BpcLlL2V4qJEuAjljp9VnK4HlckvoRg2rFGANO2C99jDDyF9sLTYv4Y8dYuqQKB+J@lists.infradead.org
X-Gm-Message-State: AOJu0YxV7Iyf7tTMMqqBafXftiBhNVzMZuHNYlRAPfz+1B31yI8qq88T
	HKHa2frXE99zrQIs1uuGvEUsB5qvSG/rJZSOk/TdvpIPNyhDUJYYqdGS9y4DqfxQuxg=
X-Gm-Gg: AfdE7clVzUt+PKmLckE8HnVifIzql066Ne6Q9Q65DBoS7bxxmgxf9tNrtm6Cvj/f6Qa
	UYG3f3cEe4ND6E7QQlQD2SIFjf/0kT1LOGbbgtPIF66hE+mpPsK2KDNv9fHhg2yFN7pE8lZ6IZz
	2ktZF+eDfiBOrfIRiwBM4j0LyVmvpvW0vMj+/P9CAV0BEn3KAxjN0z8Iot2beqypnCVo8tXKfkG
	nvpsOkGA8O3UruO+l+krFbeHc05Zbco6YFUeo7z+W6GamNqg/J9jNbYUPbaXXQyGQpBEBabAu0k
	cfoRlRnByV/XEX9zQqz3SdXHpxxhbNktz7AYpR+pFvfyCgUyHgWFN/j+7tc5H7ry1+qXoucSNBm
	RnR7lVYiPNkM2bZ+oCOq8MuSK0nw9XJY4FBhGYBIswwet13jN0jPxIGIoCzeZSZwEAOutCDrWMo
	fZPzkA9pc=
X-Received: by 2002:a05:6214:568e:b0:8ef:a4d5:1523 with SMTP id 6a1803df08f44-904011898f8mr225409936d6.42.1784164633345;
        Wed, 15 Jul 2026 18:17:13 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4cd1sm206194006d6.16.2026.07.15.18.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 18:17:12 -0700 (PDT)
Message-ID: <d4676bc9095c2c1efcd2c0f5ff4559bac7d1e47b.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: fix use-after-free in decoder
 release path
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Doruk Tan Ozturk <doruk@0sec.ai>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 15 Jul 2026 21:17:10 -0400
In-Reply-To: <20260615140526.52617-1-doruk@0sec.ai>
References: <20260615140526.52617-1-doruk@0sec.ai>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Mck6WrMHKU/Fcl8cNGIP"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_181714_934216_2BA77C0E 
X-CRM114-Status: GOOD (  20.25  )
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


--=-Mck6WrMHKU/Fcl8cNGIP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 15 juin 2026 =C3=A0 16:05 +0200, Doruk Tan Ozturk a =C3=A9crit=C2=
=A0:
> fops_vcodec_release() frees the decoder context with kfree(ctx) but
> never cancels the per-context decode_work worker first. Although
> v4l2_m2m_ctx_release() waits for any in-flight m2m job to finish, the
> workqueue handler (mtk_vdec_worker) may still be running and accessing
> the context after v4l2_m2m_job_finish() returns. Once kfree(ctx) runs,
> that worker dereferences freed memory, resulting in a use-after-free.
>=20
> Cancel the pending decode work with cancel_work_sync(&ctx->decode_work)
> after the controls and m2m context are torn down and before kfree(ctx),
> mirroring the fix already applied to the encoder release path in
> commit 76e35091ffc7 ("media: mediatek: vcodec: fix use-after-free in enco=
der release path").
>=20
> decode_work is always initialised before release can run:
> fops_vcodec_open() calls mtk_vcodec_dec_set_default_params() (its only
> caller) unconditionally after a successful v4l2_m2m_ctx_init(), and that
> function runs INIT_WORK(&ctx->decode_work, ...). A context can only reach
> fops_vcodec_release() via an open() that returned 0, i.e. one that passed
> that INIT_WORK. cancel_work_sync() on a properly initialised work_struct
> is therefore always safe, even if the work was never queued. This is
> unlike the 2023 msg_queue->core_work regression, where the work item
> could be uninitialised at cancel time.
>=20
> Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video D=
ecoder Driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
> ---
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index e936ed8dffbaf..30906b24c608a 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -313,6 +313,15 @@ static int fops_vcodec_release(struct file *file)
> =C2=A0	v4l2_fh_exit(&ctx->fh);
> =C2=A0	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> =C2=A0
> +	/*
> +	 * Cancel any pending decode work before freeing the context.
> +	 * Although v4l2_m2m_ctx_release() waits for m2m job completion,
> +	 * the workqueue handler (mtk_vdec_worker) may still be accessing
> +	 * the context after v4l2_m2m_job_finish() returns. Without this,
> +	 * a use-after-free occurs when the worker accesses ctx after kfree.
> +	 */
> +	cancel_work_sync(&ctx->decode_work);

The worker is active if there is a job active, but v4l2_m2m_ctx_release() w=
ill
exit this condition by synchronously waiting for jobs to finish. This is co=
mmon
mistake in AI code reviews.

Since this is redundant, NAK

Nicolas

> +
> =C2=A0	mtk_vcodec_dbgfs_remove(dev, ctx->id);
> =C2=A0	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
> =C2=A0	list_del_init(&ctx->list);

--=-Mck6WrMHKU/Fcl8cNGIP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgxFgAKCRDZQZRRKWBy
9Dh4AQCTKUlNcYoVspmnfPi3kRDiedLAR04fgYSBHBeC17x6BQEA2KPgwYaGAl39
qG4Hzu4Df7JcnRfEiS0whfRNWQzYewQ=
=gnTg
-----END PGP SIGNATURE-----

--=-Mck6WrMHKU/Fcl8cNGIP--

