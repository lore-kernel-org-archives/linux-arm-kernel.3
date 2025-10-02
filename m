Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380EFCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 07:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5NgAjs0FgUvOjNKCgOViw/s6WyhuboPXgN8L2oduk0=; b=g0+MeyC4z9ScttV1l0CVittrEB
	tRP3FpQEkkshWRU8O9PTS+e9Q8GuKUamyIXg/LueI79EWys0ApPAmRS0f6SF+xG2760CYMg54pDXS
	g+xabYmz4xs6MuvXNNW4Z7Px3Jqrv9c//xGt1ews7yefrcbExYInkt3wGWsbGOhm3jGC/CZbQ2qdQ
	VXasMWs8SyNwa5rAJXbqlmeVGMsru8ogsXNbU6Tk0vZUgwws3RlGbh3slvuujGB0itlfHlEM0Fpy+
	d373Rrhlo8DMlyzEjUFtpLI0XDbDVXoDmAuLNLTPwbZG1VxeFn/pr49p3HKgyT8YyU3a9apc38/8p
	630Zs94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4E9I-00000009pc0-0f2C;
	Thu, 02 Oct 2025 07:54:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4E9F-00000009pbc-0U3X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 07:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759391683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f5NgAjs0FgUvOjNKCgOViw/s6WyhuboPXgN8L2oduk0=;
	b=SmUTP5N6n2tC2XO2a5xgoxLAO/X78ISI4HrcL0iGg3wVcJ3KGtpk3A3cjR/IJfgSZgj+m5
	u0ROPESKRQ/Mfee6vYODGlojPB+PVJy7bhmQE/HVwxf+xM3uGpZK0FaWC5LJ3z71NyQxAk
	vYlGWk3e7cNRH2RAOMUbQW1kLJzCuGw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-iSAwFtrtNDeUG4sJVH1PTw-1; Thu, 02 Oct 2025 03:54:42 -0400
X-MC-Unique: iSAwFtrtNDeUG4sJVH1PTw-1
X-Mimecast-MFC-AGG-ID: iSAwFtrtNDeUG4sJVH1PTw_1759391681
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ee12ab7f33so569416f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 00:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759391681; x=1759996481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5NgAjs0FgUvOjNKCgOViw/s6WyhuboPXgN8L2oduk0=;
        b=oBFcedYrWSwDXyqv4dv4EzAgmYi+//wT+wUXde719Grx+i/T67qOIZpj+YskcbMpa9
         h/ItGkeeu3AiJUj7vY7swtObHiy2rPebAgdCiUsJfE4b08D4OxfA9P+lpjSB/4WGwszK
         wI+eN1SZEpPaz8yjmh37YRq4A76II3MI3OIS/TEZAAsKOSuR/Y6Yko+YdLSgQSD8vDVo
         gulxI73rVtAw4qA9xrmKLb10zlazyiWOUrxYwU0SWwabQyvLXdAoM95gVV59CIVp3UMV
         eBmrHLCdnTWlkhjcJGdb8V9ZrxfDx2+wUf7SpAUa+k5D5iZ4rjR3djteGUCMwybSgghQ
         srfA==
X-Forwarded-Encrypted: i=1; AJvYcCW3NeJtXdTWkAXNPCzNugHIl7AA2rBdO/5w2w8HQO4vsT+2OU/XNM/IpxtWLQmDv/dnEOU3HqCTiutTNi8AAyM7@lists.infradead.org
X-Gm-Message-State: AOJu0YwesfP1AOegk1nvO8ARguNG6bF3cJl0K5Ohv+MPq3vSj8kTRarW
	XxgPzesVpqJnVW291nqeSfne0peJbU4N1naLIhwhYqhNsJ3Db+zzE2PQ9cU5basEK+21X+AIRhl
	4TdjiULf0YdSgPNb8AyCNB0WYblmccDn8gyK5EkeAqgdIpZICJSBgC8YX/ZW0SqJMKTFr3sfrWD
	Lb
X-Gm-Gg: ASbGncvngC1qgycgr8oXfrkzckU6cHwpZ1fdmc167rmAcvPVGJE8cZt86ZLZnyKelZv
	diHPOQvtQ7/MAUrK16j/Hm9Pg/eSi6CDao0Q9S1ggKtkCvuDFmWBRBjz4o27Pp98aGDuxo6NJi8
	0zi/5TskAmmjAzYLSwmki6M5HGaGuxK+5/ueuwDrQF6ELXEzjw5jujjM1SulJbQ61JYYfVnLlcE
	8+yS+GQil8zfDXJmg0cqlFJpRo8FiUwjIgsblCksaoWW3O278ABtSaDoeJkpZZj1wjl8vPz38eQ
	QTxvYqUaaX0M8yu1itzjdA==
X-Received: by 2002:a05:6000:4282:b0:40e:31a2:7efe with SMTP id ffacd0b85a97d-425577f4cb8mr4951725f8f.14.1759391680675;
        Thu, 02 Oct 2025 00:54:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKgb2wuYS24zodpwDlxRHEFq5J/MXUUrEeNEVo0zphJwnjV4MGibFNyYvpxnYvHco/UT9a7w==
X-Received: by 2002:a05:6000:4282:b0:40e:31a2:7efe with SMTP id ffacd0b85a97d-425577f4cb8mr4951692f8f.14.1759391680190;
        Thu, 02 Oct 2025 00:54:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8b0068sm2484557f8f.26.2025.10.02.00.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 00:54:39 -0700 (PDT)
Date: Thu, 2 Oct 2025 09:54:39 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v12 3/9] tee: implement protected DMA-heap
Message-ID: <20251002-sceptical-goose-of-fame-7b33d6@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-4-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ucqtnbt2ioahlqrj"
Content-Disposition: inline
In-Reply-To: <20250911135007.1275833-4-jens.wiklander@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_005445_226894_7CFDF7B9 
X-CRM114-Status: GOOD (  11.59  )
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


--ucqtnbt2ioahlqrj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v12 3/9] tee: implement protected DMA-heap
MIME-Version: 1.0

On Thu, Sep 11, 2025 at 03:49:44PM +0200, Jens Wiklander wrote:
> +static const char *heap_id_2_name(enum tee_dma_heap_id id)
> +{
> +	switch (id) {
> +	case TEE_DMA_HEAP_SECURE_VIDEO_PLAY:
> +		return "protected,secure-video";
> +	case TEE_DMA_HEAP_TRUSTED_UI:
> +		return "protected,trusted-ui";
> +	case TEE_DMA_HEAP_SECURE_VIDEO_RECORD:
> +		return "protected,secure-video-record";
> +	default:
> +		return NULL;
> +	}
> +}

We've recently agreed on a naming guideline (even though it's not merged yet)

https://lore.kernel.org/r/20250728-dma-buf-heap-names-doc-v4-1-f73f71cf0dfd@kernel.org

Secure and trusted should be defined I guess, because secure and
protected at least seem redundant to me.

Maxime

--ucqtnbt2ioahlqrj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN4vvgAKCRAnX84Zoj2+
dh5DAYCtjelmpXHr50Khpzx9gOlMaEclQyCYsx0ccN3NkEfrV19Dn1EcsuWOsMM8
FnSLI0wBf20rXmWeBPjWcAcR1B39X7YSjO3A7FgWI4aIrvvEGff3VbIQIgq5c/ST
75QC6+0wWg==
=iJBu
-----END PGP SIGNATURE-----

--ucqtnbt2ioahlqrj--


