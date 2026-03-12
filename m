Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D962A106ACE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 20:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrfqSRvy369yVc6mkzBE9cxk9/iWVTONTSjcJTlQJR0=; b=fJyGWaCX8YF1vj3+H/cGADitgK
	qx3FDGH51+Nl5KYccpvtaS2Tt1AG6QD+OVj+fhRkMAfUIUijsfbntxueogroMsbzzFok2gqbcJG4a
	ajc+ie5q0TC9CKcNtdTeSshXGefDWTKr32yNTXbo6QmPaz5pMbm+SP/0EqsHVfGLVaoXe3en4IBNb
	HKAlaRC72FQIwLHyqMN8ODDHiIQv8+9iV4sGpVaB5ermNDOzZR3A2G8ovJaBIg3Os6iOiWfOaB+aj
	2+usjmt9tLjB/4tJkN2Qd5wXuXQbGGB7ngo6V4oeJOCK1T2s92KgVSKVV00i9ssji5aLAsE7dZl5y
	icHNlabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJV-0000000FDYZ-0YxL;
	Thu, 12 Mar 2026 20:07:21 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJK-0000000FDTH-1S6O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 20:07:13 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-4138136f02eso1086222fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773346029; x=1773950829; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrfqSRvy369yVc6mkzBE9cxk9/iWVTONTSjcJTlQJR0=;
        b=vdtt4xJihXgFFp7ZLHA3ONiS3WfWy9dMv+fC/O4v29o3IxYh9cMzS+rG1oq1PbsPtr
         AcFpUwTCqH9fTrfXEkDUVAx9pQoV1308LHuTaSK6a03h5WzgYVkb19pEt2VBq+MmOJKA
         N6XaLwGkJAw9QppGasl7DGMXCj0X9wtWVtfUEMBQvl9S8RJlVBdesBhc7ej4geoykDzR
         o1saxbXlW5ErgozWha+XgnvgpLOKvzxH6euueISIV6Y8SX67ogRPKnMVrjaH0iPqzF5X
         DN6AKaRxPPLNbEpZCIFzy0kFw06MfuJtI2mo8C3ZKrFE7ERP1qK5NeEWUBLFPKPLgLos
         vA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773346029; x=1773950829;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XrfqSRvy369yVc6mkzBE9cxk9/iWVTONTSjcJTlQJR0=;
        b=V1v4FlqbmQL7ymoraxqfT2zJBvRnZWXtjOaOgvwVWSdUWMwALjOTVqBiTQ2ItysRjS
         9yoHeiJfL7MF3gkO+oSfVt0E0nsR1psK+to0cPxKxPVpl8Rw/6BcXZsajOAhvxoa7Pbk
         M4PgtyqiGquUXx1UdwMr2x2mQukseai9jEaE0zSD29UJLcLFqQgjKd9g29ODKIcFEJvY
         mvUbNGqFySzg2jgUhb5tvUzeTzeuT0hf2Kc09CRYVuljUTBojH9ET2BT1oR+az4Rhw95
         4IXBb5fkNMeN/51RQBay+MzGcNAYJmyOvPZGQPnlJtJ2OUyDXTqClKB4GuLhRivPCOJ2
         1d3w==
X-Forwarded-Encrypted: i=1; AJvYcCWQZxWo0oWplu4VdOmqsTBScuUx1viChh5qImbrCzy+0IQ5G6XK7atbwGF043rfdglpzIEgOehlgfB1/eRl96ge@lists.infradead.org
X-Gm-Message-State: AOJu0YxtrT3hsRX9eBIxuZcp2daZ40bqit2JCZ6ALotq4QP5uxQjBQiU
	bOgfjbbsToFUbgbL0X5GcHhVwBSdMedya4j3id/Yjcd26W7mB9kIkbDnAlEFCbyqzes=
X-Gm-Gg: ATEYQzwshY+2FDKA8+iOKobU7NzGnfwyoRK/QU6MAzIBGjDe+3DRaeLrl7wLO2G4lPe
	pY6Egvz1PAjWXR2oV8ay7DVruqZaO9kXABmWv5McDZj37Aup/2jY9eMqZw3hNEilKpHLEwrMpjl
	uADxYL+r1cvIy+5ON6Mbff30lkei733jgjzsa+iB1tKeKfE0oTa4rMGqqD2wtdbt5yD6ZeEGTYE
	1CEiGoJQMVQ854Fw+KsB2yGKEzuu5jHR98iEsUvn1MVbHKSKaBeQ0PuwOw1dWtMmhZX0t19GNkc
	6Le+zCYrAK2yfzFqNp98KxTui0jmKa8YwEvfBm9/zSfGBGMgPf8w/FMfkXJUPqw2j2aepPRzFYj
	0HCrfwwtn9Wyds0iD9hG8HzdS6ZqSzQ/83gCPgH1nWV865wtSRphutTalDVoE0JgBBjVFpatGbO
	AbdhHdmSqJg6cvrV/MGHpaX3hPARF7CPijyD/WpgY=
X-Received: by 2002:a05:6871:5292:b0:417:482c:5c0e with SMTP id 586e51a60fabf-417b93fd827mr366324fac.43.1773346029164;
        Thu, 12 Mar 2026 13:07:09 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1f95:f82e:8747:8137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6c7885sm5600081fac.17.2026.03.12.13.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 13:07:08 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 01/18] dt-bindings: clock: Add MediaTek MT8189 clock
From: David Lechner <dlechner@baylibre.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
In-Reply-To: <20260309120512.3624804-2-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
 <20260309120512.3624804-2-irving-ch.lin@mediatek.com>
Date: Thu, 12 Mar 2026 15:06:36 -0500
Message-Id: <177334599652.4124794.9130759829438828661@freyr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=520; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=tkQxE/WaHOTyLw9z/sp813AJR6zA4pd2NdpV7fP6+0M=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpsxzWwLcwCiJ8Z4K49ki7iVfChNgBVHE7qCgpm
 Y/2/Iw4lzGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabMc1gAKCRDCzCAB/wGP
 wC7SB/0fcJl+IqsMtJ0KbpayFuuIWaEoKx2Y+kspgWFvDk3ZZN5eiVoAGyzSde4TNg8/MKEDTzR
 zssxuG27VwnhdKRK5hXY3KyVuHfvUo+Q+l1vWWM6d47IkLLuJIESKy+aV6ajhGZD5ExQkBpqLUf
 /vCSyDwGMkE9rkFHUQ9p6WuFUFifDb0HOWvcvuM9MQ36kTfp9Ub0ufAYs4MbrMujowXIBE5YR5K
 5KfOPmbBOw6gtvbrhPFp8Jcwft/caJjstn4wz3XNF9+w6So2N7A2xaO+U+M3NrKjgHLBAscD6wX
 SU78NqGacCN8wXbg9BmNJJebWwHSdHSmXbCCXImCwsfnHKTq
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_130710_392967_6BB497E3 
X-CRM114-Status: UNSURE (   9.89  )
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

On Mon, 09 Mar 2026 20:04:43 +0800, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
> Add dt schema and IDs for the clocks of MediaTek MT8189 SoC.
> The MT8189 clock IP provide clock control for main system
> (apmixedsys, topcksys and vlpcksys) and
> subsys (eg. peri, mfg, venc/vdec ...).
> 

...

> +#define CLK_TOP_DRAMULP_CK_EN				205

This one does not appear to be referenced anywhere.

Should it be added to `static const struct mtk_gate top_clks[]`?

-- 
David Lechner <dlechner@baylibre.com>

