Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A06CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 20:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=770xEhvBw1Dn5803XOi5/66nDa+u1CSmAxJ8KSDFNxU=; b=05UW+cIHPtxn9KAK9g9jQxwfKs
	CiaH6HrSZYG29WM7Yt1/oWTKiNV7YeDDAfq8wusC5XrbN95zWqFjcrxFIQr7fC4zlXDUooR6zAK9M
	fBiRc6VtTWB/QHuapfSVz2N66lWLcJq7YobOibRssS94PHUIiAxRZDcE5Ik/o/fPDsMI6Qu0tASwe
	wzJFdSC2YVpeu8zdmb115Vfjm1WDEcsi7qubFpyAM/6Yf/Z3IInJKNY8lisPZjcCy54pYg4JEi/mW
	ob9jb60LmGCTh3O8NhLE2276Pg5HhhGAbLL+vbZ6FXJP9MwCxFhRVlZaNATzZqFyb8vIxQ1g2Kvzd
	xkc9jZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBe0K-00000004RgU-2rgf;
	Tue, 29 Sep 2026 20:00:44 +0000
Received: from mail-qk2-x08.google.com ([2607:f8b0:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBe0H-00000004Rfj-0eLL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 20:00:42 +0000
Received: by mail-qk2-x08.google.com with SMTP id af79cd13be357-939fea05b69so260766785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 13:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790712040; x=1791316840; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=770xEhvBw1Dn5803XOi5/66nDa+u1CSmAxJ8KSDFNxU=;
        b=xYrDOgsC8KEynXJnltcClHQzvD0Le/v8V5DG8m9CDzM4aP2sOEJteNN3ObTM5AJ/j8
         WlcOQO/XfcAIb6MeiZfO9VY8hm23aucSBCJlH3yGa059N9vzw5oQdq+bboJoyksRTYas
         f1MywY+HScRPT7/agrR90XO2xHAKPatiN/kCw/PuO05QEi3v8sgOs1vETR2nQCG0MN/1
         db9KAe4Ino760mFB3C5a+7bJ7QU8tWpO5I2eTIg0/x4geHJs9iYZV34q/6wJYrG+PS4U
         PxFl7bixc4i2BVubHHOm1qVe8Jodaw9H9Y/uWDN9yALY7Hs0QxfGiH9wjaD++qjz/hx4
         7cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790712040; x=1791316840;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=770xEhvBw1Dn5803XOi5/66nDa+u1CSmAxJ8KSDFNxU=;
        b=unFypYWmmYrSqzQPButqmNQK4QaTGEMGen2IDe4jiqiKNZ4nnJhLsgcDdaXSChINHJ
         2GOa/xtKt0iHecs+lcBjiijI/9NNNzhLZn0xGe1v7lPSAxCrFNC3b4LV0vdZhFsM4KrC
         qw7EyhL6DAwdkEIwaFJHihaSLQTl/zk4Z1WUdRo+lZB1StBLYlnEBwVghZxB1IT3VbvT
         fgF6qPiZ/eL+l+ln2pTu344FSCsr7Skw6IGuN8HQ60qOH7BpAhu8vuF4i6MfXRRYoLm1
         5G4BWeqm1wsKKOMEi/AHBEfmf8zi4JZ8QIfXTmqYuyAmm/DIwaQBECVQEUdLtQkvh6vC
         BmUA==
X-Forwarded-Encrypted: i=1; AKwUvBwWH8YzW1hs6qp/YRRn8yrS+cUXT7Y8Osr8ePWWE0xtOdgC6f35e+5kFaui4BxbaspLFfVS64j0E60VVn9g6WYN@lists.infradead.org
X-Gm-Message-State: AFuF++mhAVS+VFVfy+3CprLETrNruMacyMQMu8x+JUBigPIGgQFlh1n4
	s3W/Nwv/z7YgQ/E1KCpvEp3szm2ps+T44JRTzUCDK53Ty5b6vxCJNnW4HqXWHJNL98k=
X-Gm-Gg: AYBFou2sQk4aTpCpXODXwVBIplPxNauHu6yWCmyOfxNd0fERaTmsP1cM+XNcwLonSbF
	g0ksPvyD9m5TK/+y6USNw54P1HLjizHgQ1P49AzKD+svueVO5Jw8yj2G3nZnddpGh8JsudBDnpq
	iJ6oxhmjxGGH7tg/dsb8/HuJTt7ENav3VxgZsLaIGXaH7dv/tfbZNyKyQQQ3BsWkFzh+BK9BmHD
	yz8of6iZK2p5YNnlCd5OAv+os3kOkdojYX8EYNIHac69MOTGETcbiigtT8/wt9juIXJX2+JyrRa
	cpSayuKLD68u3lDbSnh3ls0xyhHgfIQj0PxTgQkNGeSyKTbVuEo3+6n8fb/rcy1kCPPXXe8x6UW
	vxx/PR0VM2jCZeokJ+o6sJpBpv9JhxhenQ9maf+JVsFqESaRi56VG+nSqgwRI8czDCI7TqSobwQ
	4sOW4I7qPDkGeOEWWJRsXevOkh+vF7WB1AOxiKqPQIPiaNNMsCAki/l1C/m2VAK9bUhs2F9H7Hr
	hU8qKBdLF4ngCw=
X-Received: by 2002:a05:620a:2586:b0:93c:68f0:f0a2 with SMTP id af79cd13be357-93c9fc42202mr119215685a.65.1790712039675;
        Tue, 29 Sep 2026 13:00:39 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917987aa21fsm3242546d6.10.2026.09.29.13.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:00:38 -0700 (PDT)
Message-ID: <232d8d12f9fa302e14d22b0b1f5d659a45d83ed3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vpu: free IRQ before destroying
 watchdog workqueue
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fan Wu <fanwu01@zju.edu.cn>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Minghsiu Tsai	 <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org, Song Li
	 <songl@zju.edu.cn>
Date: Tue, 29 Sep 2026 16:00:36 -0400
In-Reply-To: <20260923085921.496767-1-fanwu01@zju.edu.cn>
References: <20260923085921.496767-1-fanwu01@zju.edu.cn>
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
	protocol="application/pgp-signature"; boundary="=-fhr5ayFbyS+0mRQDrJmg"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_130041_313526_F519950B 
X-CRM114-Status: GOOD (  19.06  )
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


--=-fhr5ayFbyS+0mRQDrJmg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 23 septembre 2026 =C3=A0 08:59 +0000, Fan Wu a =C3=A9crit=C2=A0=
:
> mtk_vpu_remove() destroys the watchdog workqueue while the interrupt
> handler requested with devm_request_irq() is still registered: the
> devres core frees the interrupt only after remove() has returned. If
> the VPU watchdog fires in that window, vpu_irq_handler() queues
> vpu->wdt.ws on the already destroyed vpu->wdt.wq.
>=20
> Fix this by calling devm_free_irq() before destroy_workqueue(), which
> releases the interrupt and waits for a running handler, so no new work
> can be queued while the workqueue is drained and freed.
>=20
> This issue was found by an in-house static analysis tool.
>=20
> Fixes: 3003a180ef6b ("[media] VPU: mediatek: support Mediatek VPU")
> Cc: stable@vger.kernel.org
> Co-developed-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufres@collabora.com>

> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f..b6bd80b 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -962,6 +962,7 @@ static void mtk_vpu_remove(struct platform_device *pd=
ev)
>  #ifdef CONFIG_DEBUG_FS
>  	debugfs_remove(vpu_debugfs);
>  #endif
> +	devm_free_irq(&pdev->dev, vpu->reg.irq, vpu);

On the clean factor, it reduce the use of devm API here, but the error path=
 in
probe relies on it still.

>  	if (vpu->wdt.wq)
>  		destroy_workqueue(vpu->wdt.wq);
>  	vpu_free_ext_mem(vpu, P_FW);
>=20

--=-fhr5ayFbyS+0mRQDrJmg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwY5AAKCRDZQZRRKWBy
9KULAP43NLUTImHqX9ivxd9kELGpFXE9g6z+OyEjshp8cbtTjAEA6v9p0zb/FZ2S
5xMDzjZ73uKB7T217AXpRwnRjKu3JgU=
=Ksa7
-----END PGP SIGNATURE-----

--=-fhr5ayFbyS+0mRQDrJmg--

