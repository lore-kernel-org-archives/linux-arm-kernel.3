Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D26CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 21:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LFOvHs5vGrtobfr2ePGnKbAMOPISIpzHqSP7jz8iLA=; b=IGNtpJ2lh/BwGNIES+q8t3vwDo
	0pWsOYdimSpqUWZhkySF/PTFEqn7l5tc4pjN1vHG72G9MHyftUCzZnoCp5XdI5N/OsIL2YX6w6kZ3
	AzX/Gte3jNHHI7RkOMUQ12noBlNPdaJbRpE7DIrG7PKsRU2ZW7sEIJ9iw/Et5W4DNYYxCAx+kyo6Z
	VN9ocmURWwc7AwSLg8wzGVom1mqu5vVp1GC59CWTeDuCpAvs07AutGB0UeiPHl9/4kJvi/OwvqdoJ
	Dg+ZHzOB5hF2vUqbiFSDSTsRg1l7+62RTdf6XkZZ/bWl3T3qiXDudlXhp511clR9DOJaLiceyVaa0
	w4WkL6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBf1m-00000004ZJ6-12eP;
	Tue, 29 Sep 2026 21:06:18 +0000
Received: from mail-qk2-f40.google.com ([74.125.230.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBf1h-00000004ZHZ-3uQt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 21:06:15 +0000
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-533289b43ebso41770891cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 14:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790715972; x=1791320772; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8LFOvHs5vGrtobfr2ePGnKbAMOPISIpzHqSP7jz8iLA=;
        b=VBs+TvP6qu9UVitRPTBz1KS3CM0BfQKu/tW8DK7qeDQT3ClLfS+TNE/U7kOwIWxVgQ
         W4TkE45TnmKDZnfyMCxTI0nQDzaGJA5XtaCtiRxixbgsnjWWzrpoUwLwkeB9s1VzwfJi
         Bc42J4UmwQNlMKH4RPzpISPpuE//WiOdL1qk6oRKdCCcD21DdzIp1f4d/rnoqJ8OUNE0
         ZsChEgFER5ZHVwxkUK0ZTB3aP/oN0JPMztWBVs/gLH87KE8Um9fMxZBJROJFj9JlFUmh
         Hz+xg29PUHEFLBDn/hcM6jWA/4qggsDpquv+5FzRYwYmu0/RSVNZxfQPUQ96qlVIyTLv
         8yzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715972; x=1791320772;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8LFOvHs5vGrtobfr2ePGnKbAMOPISIpzHqSP7jz8iLA=;
        b=NMOpiWnwg8SUQKOVUtq9OJ3oMwIsLbNMw0xQCVAIjDsRjgH18JWec1mvexyscNia5K
         Kfyt02h1BqiqGbpAXyLBmIx+DqczVhC6BpNBeu0kj/oolIs7yG7xDiE+EPVbbJUXnHkq
         vLYXPYQoqrAMiMe4t/OCFuTZPURBDLY3Wfpc7kLIHmF+64x+FPffZiODTryL3pqpBMko
         L9juReDxT54bBeHp1TjasfS2mZNRDT5SNH2kiLyzCL6BTpna7yTEIfjf1wnw2sh7OTFs
         /QiGBridLsX3QXL72kIJF1W/M30MjnWwFbrZSwbIO9W54yTrJxgBjmln/Q1GpQ8OV0vP
         zz7A==
X-Forwarded-Encrypted: i=1; AKwUvBxHw7jRppgtiwQAuOjkHXeQohxG9HJ6kMmhlHurJ94/UIkKIvM8QOL7rTlbE671jTjR3vtZhxgEWQyHCx3QXUw1@lists.infradead.org
X-Gm-Message-State: AFuF++l2Li4BGMCJKntPs3MRytRg8z9HKizAoawrb4ASXTe6pl7WQoPc
	dQx8nbvmabbqO6bHNbXc/b26/34e43ylE01diHMPTMtCjirPQx/QQHBhvoNvZsjHfyg=
X-Gm-Gg: AYBFou1xALHNk7stYhWDRMf6N0zwnP+1AoIhzQmpm8dgJcZ9rMIWuxzckwjOqyZi4CX
	DmndtfeDaaHHClD7RQ76YWExuQWPvPKbADhrhjn2NA87uaD3jcnVCCS7MIJt3b8/NigWkPEpGgq
	UjF6VhpXSKaoQW81s8jr8J2Hikmo02EzWHau+Gu55Wual/wlquJ+29/7sXLRLK3z27NSGgI7kol
	MsoWGp2q8Ga+zJpR2vte4cJJTIAkVC9XHxDEnbG7ohNdqn3QnfAuRaflmYJntvCr6c/fzKq+4vI
	MLAJ0ZPRNKz/GRiwdST/WmCY/+189aQoUZBc+0Amu1Ck7cJixu73akOxb3rA4mwgvU1vkkaBCyD
	KMwZj/ooDeayyMI3nc4CtPGRuE2qcywqb92nm4aMp3Lktl/FhaajA+hgGjiAWMKjvz86cLTlc0m
	241D9F1NqEHqQP5YfBZYEHYgkW5B5/0WT+38YdphJzSyYhzEEktNW1ASX8cKnLDGrkHExNctHO3
	WD49qUg3qXkAA==
X-Received: by 2002:a05:6214:c27:b0:917:9504:374d with SMTP id 6a1803df08f44-91799b6daf0mr7450606d6.36.1790715972169;
        Tue, 29 Sep 2026 14:06:12 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917987e2746sm4263186d6.20.2026.09.29.14.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:06:10 -0700 (PDT)
Message-ID: <0741e05902488b491624e5e05098092245242a1a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vpu: release reserved memory on remove
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Guangshuo Li <lgs201920130244@gmail.com>, Minghsiu Tsai	
 <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Yunfei Dong	 <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Hans Verkuil
 <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Date: Tue, 29 Sep 2026 17:06:09 -0400
In-Reply-To: <20260915121025.2412446-1-lgs201920130244@gmail.com>
References: <20260915121025.2412446-1-lgs201920130244@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-JBpDEv9eNq9BIPUlwiLE"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_140613_982973_C0E92ABF 
X-CRM114-Status: GOOD (  17.99  )
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


--=-JBpDEv9eNq9BIPUlwiLE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 15 septembre 2026 =C3=A0 20:10 +0800, Guangshuo Li a =C3=A9crit=C2=
=A0:
> mtk_vpu_probe() may assign a reserved memory region to the VPU device
> with of_reserved_mem_device_init(). The probe failure path releases the
> assignment with of_reserved_mem_device_release(), but the normal remove
> path does not perform the corresponding cleanup.
>=20
> As a result, removing the VPU driver after a successful probe can leave
> the reserved memory assignment associated with the device after its
> lifetime has ended.
>=20
> Release the reserved memory assignment after freeing the VPU external
> firmware memory, matching the cleanup performed by the probe failure
> path.
>=20
> This issue was found by manual code inspection.
>=20
> Fixes: 3003a180ef6b ("[media] VPU: mediatek: support Mediatek VPU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..16b5bdc2f2c0 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -966,6 +966,7 @@ static void mtk_vpu_remove(struct platform_device *pd=
ev)
>  		destroy_workqueue(vpu->wdt.wq);
>  	vpu_free_ext_mem(vpu, P_FW);
>  	vpu_free_ext_mem(vpu, D_FW);
> +	of_reserved_mem_device_release(&pdev->dev);
>  	mutex_destroy(&vpu->vpu_mutex);
>  	clk_unprepare(vpu->clk);
>  }

--=-JBpDEv9eNq9BIPUlwiLE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwoQQAKCRDZQZRRKWBy
9LIrAP9JLK9HAtBMScpQ1KexiHDip4nmcCWrHasuo3ANeEljAgEAs60FyYFYBqgL
Jt8fxtvRcoN2QASZVOg0X0uof6Yp8g4=
=0P79
-----END PGP SIGNATURE-----

--=-JBpDEv9eNq9BIPUlwiLE--

