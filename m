Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73969C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14iGLLoPFCaZQPh6Psc3FLMwpAjwEZFNk7aZejXSCSk=; b=xhIPupyRwhXAMmoTxgJLcYcEPz
	3rbi/xGUtPlj3VcMrCRUHtRMg63nKCRBXua4w+Psyi4l+YsCPBBXAvYUC/Mjc/1vp6Gf84R4j9Q+6
	dh0Log6MWmMvjMYAUFpvcf1rE1cErfLYAjsb04ng0LZdJdLXqAEEcOuWucYrh2inOW+S3EDvoGdrP
	5WnhaY+CkA0dyjguq0lS6jfPEjMCP6BS3dDEzz/Bh5l2J9meLRgZjV5E/xjRU7EC7Y/KjYKWA/UOK
	xpKQMuEevw5uxIyZ74gi0GFDfRXCBpA9vY8iAMyNZmc7Q4ddcWPUf4a3VBgo3Tv9hBxV8Cj2Kx6A6
	BMHOyzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UMl-00000007NFq-2iUW;
	Mon, 28 Apr 2025 19:42:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UJe-00000007Muo-1HGz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 19:38:59 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-736c3e7b390so5330008b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 12:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869137; x=1746473937; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=14iGLLoPFCaZQPh6Psc3FLMwpAjwEZFNk7aZejXSCSk=;
        b=b0Ypmd2rhQMAfhYp+XzhCBPXCfJF3fOMs3+zJd90c+ipfmD+Etf2j+gJScfr/8+9al
         qgqK5wWDx+nr2pBQkoZRmu50k5QriIB0S5K+ihoJqH/H2BVHnayXDYk7F4sip4sNpntD
         DozxKfBM3J/yqGNNQ5OgQKc7dLgKYHST81gKmoz9Bl9h7UB5VvTWB6aUabWSfwZKVOi/
         BUPYjW/GiF1S9gpopql1xPtXgCzfBYNj5d7/ntwLiJ/A6kzq1QyCi/PyIWjItcHbgZMb
         BUDpVyNqFvf5nMlZcgbXUJzkxC49uNzvWJ/3TlOwJjn1tdPklg/9uG14DPyp/zreDyQh
         AXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869137; x=1746473937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14iGLLoPFCaZQPh6Psc3FLMwpAjwEZFNk7aZejXSCSk=;
        b=GNxTPUtiUZS23K+IXcVWJU0d5C0XWE9Hrol5QTT6YJqsXcCsBLOz2G4dtmlPjtdx7Q
         qToWo3YUTT2gPEwuA/v1auXKMY796b/wWpy+GaB8F27OfQnA6qTcMzBfxOK+AomsuPyE
         oU4vUmpSCbi44QVZG96kd+XdgQ2yWl79Pg4Ns53EPvzp8X4v9mCPiWIO63TEqDXJyt5z
         jof7RWoEfDwOpspKOkV57dpS3kFMFSksIu4k8kYLTgMxz52/m4+wwwjmtblhbsv3LKsC
         2tEXCX/ZC0xDP/weVq+bQieL6E0w8EY6Q/vCJCCF1ZKRJFK+QXKVcOGTKgsSAL+U1Or0
         yiAw==
X-Forwarded-Encrypted: i=1; AJvYcCWx51U73BKcJK3UZZxzy9AdCq3ZCruDxcOPcbIbQxU2asfkFNxCr2hXHNXQb4bOoTE8nFa/s9hTXEQ/tSZbaQI8@lists.infradead.org
X-Gm-Message-State: AOJu0YxVl0Fl+23HRDiGf1S/7m1pYhr33A80X3HbvVCGGehjxsm1fAyg
	6B9tWuzDuyA8wlyh8qLDuw2yX6OYLbP2gDrlnU9dCuU3AsEdJZP36tZV1/lr4g==
X-Gm-Gg: ASbGncu0iACgJSnHUcs2iCEIJb9HsveoqWikp0rgnmz8yoA8RFXhk5XXjj8LVEpyTE5
	/pYhB7GQBn6C0rtd+aVtKVQ/qKpHQFrMqi8feoj4jdMHmMylI7JJBbauB5omEyBuAzQXq+IsXc8
	SyWZQ0seL3wh6etAz7ZkPWOIBzYv5oqh/w/Oys6GUU6tyT46vV4HbFTunVf2JSvpgp5IwXV/APg
	PnDzNpBYIWm6FSHUm+CbOPnTAFzSE1JGHnJlQ3HYNq35tXDzQKTeNVUqrN+wcEUNNjCf1qvT8AJ
	YgE88RQdrfSFpHg8HKDXSH+iZwntTkAMdL4QI6fOU6hS2oCqoopoAFFjGs6SN1zagNnXhp6Pfw=
	=
X-Google-Smtp-Source: AGHT+IHmlLzT3YLWMcB9dRwkEoEHVu8JunNQRTVgpY+NajhMftB1PbhiEiMvQy73a8wiTuoNqCPhhg==
X-Received: by 2002:aa7:88cb:0:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-74027139a2cmr1699641b3a.8.1745869137003;
        Mon, 28 Apr 2025 12:38:57 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941e7bsm8721326b3a.52.2025.04.28.12.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:38:55 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:38:51 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle
 Chromebooks
Message-ID: <aA_ZS8cNneR_fyDK@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XymM9xtRtIWUo1hO"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-4-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_123858_355214_C3B16801 
X-CRM114-Status: GOOD (  16.95  )
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


--XymM9xtRtIWUo1hO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:41PM +0800, Chen-Yu Tsai wrote:
> Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
> Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Changes since v1:
> - Added Rob's ack
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 49ddc504c160..f0b4ccd81c4d 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -291,6 +291,10 @@ properties:
>            - const: google,steelix-sku196608
>            - const: google,steelix
>            - const: mediatek,mt8186
> +      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
> +        items:
> +          - const: google,squirtle
> +          - const: mediatek,mt8186
>        - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM=
3001))
>          items:
>            - const: google,starmie-sku0
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--XymM9xtRtIWUo1hO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/ZSwAKCRBzbaomhzOw
wmjGAP0Rjz88KZq9wxTkLmE2fLTGJpXJLEOGhasJsrHYmQgrDQEA+/raQJKGPQgA
EgvDbveTPRWunILosNFF76r3ozB4zwo=
=vSwx
-----END PGP SIGNATURE-----

--XymM9xtRtIWUo1hO--

