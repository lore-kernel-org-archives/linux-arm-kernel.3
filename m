Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55649C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7shCbBzL3NxDtg4fCdmbNM7nlS/zl4e99x1q/nsZ2so=; b=nc+wIeEuWPbxM3oBf1q8AjDp0C
	rprrPRTWauLlI+Edk2iGOdAhWHqing14I4v03Kt3JWcEkBSxmMzIcnaLfuuyKV45FB2Vll8z0YGPy
	HuhT+O181u7L4q4RzBgiSMUg1R+TTN84BHcdyB2TJ4IbWzArHNonitizE5eEiAEpvE+5dN58NDai8
	C1jLdDL7qs3DonVMliE3yTb9VlKgiXDdaBt4nxUys6sdR6cNzgTHTedHK+lzla3dycf3WswePG/gd
	NGPGvWSENMzuI/eZViuHWxhpBfEQW6X14psjjt4ZEeciBSAva/QWmPrJTgpb520u5I3zQalIF2aTF
	PuR257BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7w0b-0000000GN4C-31dv;
	Sat, 19 Sep 2026 14:25:41 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7w0Y-0000000GN3W-48rb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 14:25:40 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso21546575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827937; x=1790432737; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7shCbBzL3NxDtg4fCdmbNM7nlS/zl4e99x1q/nsZ2so=;
        b=gv8EGzq7Qe/Oal4/nobQ0gOnLupvx+YrwVD/+UHaU14hLH6L0AxYEQFaUHovx6HRrl
         wOZm3gHI5Km7fdwnDdNRfF5JcTJVjOdJTArsISs6jWI37cE5dLbEtylXjUHhAcDbTqRI
         O7yJLG/ca36kzKB0hL3RxMAfwfKbbQEEYsTB/RynYSPT5scSGyQ3NUu8lUw19J49dvt+
         +pCyvHKkd63TyxIVXtcvWRJjADAzmHWE9LFYC9khmbwn/AT5oM8mbWbRXuqeFMipCwqH
         2erywu3tNwY5tUkxIR4ZMQHYJC6BU9pCLlsrKOnuXG5VuVvmwXwaWIX4WPdfKItTKmjZ
         2biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827937; x=1790432737;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7shCbBzL3NxDtg4fCdmbNM7nlS/zl4e99x1q/nsZ2so=;
        b=Yje8x99YAoWw7r/u3EqmwtggkWyqal6c7zGnZJ5rlrQUC8UHNZiGAvp1SI8W3qiPE3
         ruQnPBIv8sxhaJGDZZsK/ZXLVqZdOGVea3X1lsAykgE4UGDEUhGp49Xf8X/yvJpxjdHZ
         ka6eyukZNqbzkhoSdTZUp6qELVOs6cw0vThoEU72mHD6jlMU1DcbAXPIP8O90r7pdec7
         rAhQcmr59COWXIA4Mj9nfCeg6Iyzy58zBzaVrvWgNB9++MDWbcUtvxTCDDy1C5II/IEc
         B635MpMBFBzds+H+QTcyimB5v8miYCqAmo0XdnvvoPSGPKAzfRRZjDzvlazixI3nVqO2
         3Ddw==
X-Forwarded-Encrypted: i=1; AKwUvBzaevsfJwfo9xhkO+M366eIze/CVNVxEO2Sb4HIswCVBMhG+zINVKHTViWPKjAfLQ/e2PdeVVDSHo7IR+hqCT9c@lists.infradead.org
X-Gm-Message-State: AFuF++m/ekkIzD/ReIuFgjTREjMMz7MmcHO2gm3uOhHZWM3Fx6wtHBQN
	zoxuo8WtakbEP1P/huY1wJ6cesLa8G+XZVAS628hoZFsAhgly/Q2P6PtvPQ4LfTSBvo=
X-Gm-Gg: AYBFou1hIF2C5KwgrlSW0//pYVGO/vgVSsp8Y1+1vVlms3DI7k4WKT+FVTW5Me2wr5M
	OeOqgwOuzKLwF64zY4dSx8N57HSJ2QLk3HM8wx5ycviKGOfSgKTdnj5j4Bku6kGGvM7lHDqIjdW
	uqJUA5G8Dsb22W8S6wCGf0ZslYpQYzIDLJV2Vw3XFFZPX+Qu//7j8KklZ9/9+/+hq4nzJWPZZjC
	cS7vC11nsdpEOJpvq8zZ4i/L3sECgpPZ4+4Vyt/FECgUXWb+XCELC/ipDkWP/L9ZfsyxjSOQFub
	iy1AFLjg7TCY9LI+yNnOI9qgfOZXinmIJEiXcj7J0dWZWivpKdShmU3FcWPu9pYbg1ECDB7lA/x
	0BfnzaRC9XDcogzsRxwJMEhrqtX32qdaydPVhK4YoyrgfFnz0Ypfmu+Tjfo1UDScaoq6zCkK7J0
	WtCDCx1QhH0IFGFqypoPW3572qNAWEokNSE/eh/T26DJeqXwi+J2wsXvuy2dyB6vGqA8RGXDev7
	/PrpnBI0JnB9jvdruF5SOZ2R0vI7rBGuscKq1dlyDEmoWmI/oIaI+Cm8VIs9lRHfA==
X-Received: by 2002:a05:600c:8b35:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-49fc572f15dmr69026285e9.19.1789827937433;
        Sat, 19 Sep 2026 07:25:37 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bc15esm53940005e9.1.2026.09.19.07.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:25:36 -0700 (PDT)
Message-ID: <c173168c-f3a1-4712-b093-b49b5f798e13@tuxon.dev>
Date: Sat, 19 Sep 2026 17:25:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
 <20260828-cpitchen-mainline_gfx2d-v8-5-378374559738@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260828-cpitchen-mainline_gfx2d-v8-5-378374559738@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_072539_037496_1926E9FE 
X-CRM114-Status: UNSURE (   9.13  )
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



On 8/28/26 18:52, Cyrille Pitchen wrote:
> The GFX2D GPU is embedded in both SAM9X60 and SAM9X75; enable the
> driver to use it.
> 
> Acked-by: Nicolas Ferre<nicolas.ferre@microchip.com>
> Signed-off-by: Cyrille Pitchen<cyrille.pitchen@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

