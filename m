Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E09C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 07:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7Pe4DM9eAzA6gWze+y1vzNSKpfWbxNREYiER4q37Ko=; b=yYFIXTxTj/yVAJmuiH3XYkYzYr
	SI/Nl6aPiFoSWVy+YXv8WH7XBHkMw1KHGU35j5DexYG2Qs75m87t/KHgUKQbG0Arot0rVdYMoamjo
	7FHVCbypaB1H3UKppqB+TNqKSAQEvmGJ03IKjFHVbjobtypEEdItr2kxh6upWZPXlIsfN27cTSAXQ
	OioNaQj+9jhvVUWnbXat8fJwCQQUR/Vwar74xPl3TKX7IGnBCp+y167WzlF8MZOMJ8ufGqHvm+Mgk
	4vIQ4RpgM1PUdXNTHovmd8fTQ5uGUTGU2opZ7E6mKeSqZy53mmIU0priX7FLXg1+o/f7QfvTHnnDn
	LjGrSsWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPc6k-0000000CP5a-0yTJ;
	Thu, 12 Jun 2025 07:12:18 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPc3A-0000000COrm-1QVP;
	Thu, 12 Jun 2025 07:08:37 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a54700a46eso498067f8f.1;
        Thu, 12 Jun 2025 00:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749712114; x=1750316914; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b7Pe4DM9eAzA6gWze+y1vzNSKpfWbxNREYiER4q37Ko=;
        b=jAHTnYuyBYkNGU3pzvKki6cXB43LpielXJOn1qoeL1Ema3OS4IiGj9M/zcfabitlbb
         95Wa6BS7IVOVBls7vnf359j3b+PWWAmfkvxF9Hc5jyz8H5SoUdnpTEzckh4DjyfpuM8U
         TzqvatDEjj1/XfGzPw74mTk2Hf98JSEGeN6s+fE6Hw8f9z4nGDqLTeMGpJofHiUXTA3G
         nIcpHUALWi3l2KHvAFkKXixRqpP85ziqrkvpwmZqYKZD3tTg7PbC/nVonSHwFh9w1UGv
         bMtmSToqldXGBzj69gca/J7stRzMVcMZxT2UUdbA7KUUtuLhLxFY2RokhQoZnLS4jytK
         aY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749712114; x=1750316914;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7Pe4DM9eAzA6gWze+y1vzNSKpfWbxNREYiER4q37Ko=;
        b=AkgMBrcStMs23u/Sa0Hem6I7AgPaxSWfLArLhVeIdg6Fb+Kst2JGq4/c9XRP10UWQK
         5zwWMHAqdGD4pArI5bSXK3MOD8Pu54NPgr7uNcT61zCT4iYEvTNYAIuwtz9DEXIJ4J6z
         98GjpyRCu2QQONTSIUZ+8e/qxGlsR5Xq72/bseUxMeGSgbcckkqZx1LfHkn9a2QhSqs9
         9AhycfNG/6/aGDzgw2j3+Nl4139dYX6alMSe5jDkUZcY0/Nh4UuBxutga+GKsPISee0c
         t1cvd6faC+wUEor+JXN87cY1etK8UW+OhA652QOlo5FUtRqaPPUysCwjpZTNBXl3D9ep
         Lgew==
X-Forwarded-Encrypted: i=1; AJvYcCUD+NtGe/EwPOAwGH4rf/vV2uaYyWbx7wmojF5DtWvKkd8aEyWbS1RdGF7TZzAa1ntv1HTFfStBU4y8dWRQDNo=@lists.infradead.org, AJvYcCVue88it5DJQtM2vMCB3XshX9MQ3SXCTb+xlATOVUdx/jQCzlqlsvYeI/KkOr0fFRDgAkretEDtK9J8Lvey9owE@lists.infradead.org, AJvYcCW0rnCsXx13ES5R5ic1+dKBBZw5fDBN+fbmP5s5nI11/UE7SCxCsh+xrPectsDVdvoF7BCbR5Q9mMaP9LPY6CE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwX6OghDwjdH8cu3O0mqynK16rOb1x1mtB7pD4dl0Y84AJDO97r
	eDEbzp5DCIHLC76OmCqVnyrc7rzgiERkQfeDXBo1COVIZ70OhaZ1PDBu
X-Gm-Gg: ASbGncvUuZ0sGguW8ltzVcWQ5x7Plh8PcORHFQXEzOzuEOE5C0ue0+/SOBZgIarTEwh
	HL1cKf5bQxqWyJOD0nr6ZL4EYPxwgEU/umHCVt8+6H7C23ZJDbfUanQGgj+aaoAT5kIHqTKrII9
	bjYI7oov22RPgtm1rFfhQa/K9ZlBj0VH/n5YT1TSlT1q+/XbQ65R8xZZ/cKgP7ZZ/TifJ/izLdc
	3jZ6iA7Fwu6cgbAsCQNNjQJEBm32MDbTKcK5rnVEXMeOlpd1lEfQOxKhS1/WswG5crLewPxaPO4
	yz3u71uGh0Z+taR+E9/xVE0ag1HqOCyh0EYi9qMzgMw4tBb236MbKm+t6ccavs1c9p26i82PgBW
	AFTwVs1VtIcDDnfErNvT8k+S4/ZwI980UFgh8
X-Google-Smtp-Source: AGHT+IH9n/flMKLj/FWiSLfeeJnfPQDem5Xx/NLRMy+P0OfNN55bI6kHEInXGrhWHgDzIYMLSN833A==
X-Received: by 2002:a05:6000:2087:b0:3a5:52cc:346e with SMTP id ffacd0b85a97d-3a55868917fmr4618896f8f.6.1749712114059;
        Thu, 12 Jun 2025 00:08:34 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a56199b337sm1101091f8f.37.2025.06.12.00.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:08:33 -0700 (PDT)
Message-ID: <82d707b22803e2b363a2e0aa0bcf30bc1522f269.camel@gmail.com>
Subject: Re: [PATCH 00/28] iio: zero init stack with { } instead of memset()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Michael Hennerich
 <michael.hennerich@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Cameron <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Francesco Dolcini
 <francesco@dolcini.it>, =?ISO-8859-1?Q?Jo=E3o?= Paulo
 =?ISO-8859-1?Q?Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>, Leonard
 =?ISO-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,  kernel@pengutronix.de,
 Oleksij Rempel <o.rempel@pengutronix.de>, Roan van Dijk <roan@protonic.nl>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Mudit Sharma
 <muditsharma.info@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>,  =?UTF-8?Q?Ond=C5=99ej?= Jirman
 <megi@xff.cz>, Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 12 Jun 2025 07:09:04 +0100
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_000836_378679_95A75108 
X-CRM114-Status: GOOD (  12.56  )
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

T24gV2VkLCAyMDI1LTA2LTExIGF0IDE3OjM4IC0wNTAwLCBEYXZpZCBMZWNobmVyIHdyb3RlOgo+
IEpvbmF0aGFuIG1lbnRpb25lZCByZWNlbnRseSB0aGF0IGhlIHdvdWxkIGxpa2UgdG8gZ2V0IGF3
YXkgZnJvbSB1c2luZwo+IG1lbXNldCgpIHRvIHplcm8taW5pdGlhbGl6ZSBzdGFjayBtZW1vcnkg
aW4gdGhlIElJTyBzdWJzeXN0ZW0uIEFuZCB3ZQo+IGhhdmUgaXQgb24gZ29vZCBhdXRob3JpdHkg
dGhhdCBpbml0aWFsaXppbmcgYSBzdHJ1Y3Qgb3IgYXJyYXkgd2l0aCA9IHsgfQo+IGlzIHRoZSBw
cmVmZXJyZWQgd2F5IHRvIGRvIHRoaXMgaW4gdGhlIGtlcm5lbCBbMV0uIFNvIGhlcmUgaXMgYSBz
ZXJpZXMKPiB0byB0YWtlIGNhcmUgb2YgdGhhdC4KPiAKPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LWlpby8yMDI1MDUwOTA5NDIuNDhFQkYwMUJAa2Vlc2Nvb2svCj4gCj4gLS0t
CgpSZXZpZXdlZC1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KCj4gRGF2aWQgTGVj
aG5lciAoMjgpOgo+IMKgwqDCoMKgwqAgaWlvOiBhY2NlbDogYWR4bDM3MjogdXNlID0geyB9IGlu
c3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogYWNjZWw6IG1zYTMxMTogdXNlID0g
eyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogYWRjOiBkbG4yLWFkYzog
dXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogYWRjOiBtdDYz
NjAtYWRjOiB1c2UgPSB7IH0gaW5zdGVhZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKgwqAgaWlvOiBh
ZGM6IHJvY2tjaGlwX3NhcmFkYzogdXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKg
wqDCoMKgIGlpbzogYWRjOiBydHE2MDU2OiB1c2UgPSB7IH0gaW5zdGVhZCBvZiBtZW1zZXQoKQo+
IMKgwqDCoMKgwqAgaWlvOiBhZGM6IHN0bTMyLWFkYzogdXNlID0geyB9IGluc3RlYWQgb2YgbWVt
c2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogYWRjOiB0aS1hZHMxMDE1OiB1c2UgPSB7IH0gaW5zdGVh
ZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKgwqAgaWlvOiBhZGM6IHRpLWFkczExMTk6IHVzZSA9IHsg
fSBpbnN0ZWFkIG9mIG1lbXNldCgpCj4gwqDCoMKgwqDCoCBpaW86IGFkYzogdGktbG1wOTIwNjQ6
IHVzZSA9IHsgfSBpbnN0ZWFkIG9mIG1lbXNldCgpCj4gwqDCoMKgwqDCoCBpaW86IGFkYzogdGkt
dHNjMjA0NjogdXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzog
Y2hlbWljYWw6IHNjZDR4OiB1c2UgPSB7IH0gaW5zdGVhZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKg
wqAgaWlvOiBjaGVtaWNhbDogc2NkMzA6IHVzZSA9IHsgfSBpbnN0ZWFkIG9mIG1lbXNldCgpCj4g
wqDCoMKgwqDCoCBpaW86IGNoZW1pY2FsOiBzdW5yaXNlX2NvMjogdXNlID0geyB9IGluc3RlYWQg
b2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogZGFjOiBhZDM1NTJyOiB1c2UgPSB7IH0gaW5z
dGVhZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKgwqAgaWlvOiBpbXU6IGludl9pY200MjYwMDogdXNl
ID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogaW11OiBpbnZfbXB1
NjA1MDogdXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogbGln
aHQ6IGJoMTc0NTogdXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlp
bzogbGlnaHQ6IGx0cjUwMTogdXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDC
oMKgIGlpbzogbGlnaHQ6IG9wdDQwNjA6IHVzZSA9IHsgfSBpbnN0ZWFkIG9mIG1lbXNldCgpCj4g
wqDCoMKgwqDCoCBpaW86IGxpZ2h0OiB2ZW1sNjAzMDogdXNlID0geyB9IGluc3RlYWQgb2YgbWVt
c2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogbWFnbmV0b21ldGVyOiBhZjgxMzNqOiB1c2UgPSB7IH0g
aW5zdGVhZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKgwqAgaWlvOiBwcmVzc3VyZTogYm1wMjgwOiB1
c2UgPSB7IH0gaW5zdGVhZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKgwqAgaWlvOiBwcmVzc3VyZTog
bXBsMzExNTogdXNlID0geyB9IGluc3RlYWQgb2YgbWVtc2V0KCkKPiDCoMKgwqDCoMKgIGlpbzog
cHJlc3N1cmU6IG1wcmxzMDAyNXBhOiB1c2UgPSB7IH0gaW5zdGVhZCBvZiBtZW1zZXQoKQo+IMKg
wqDCoMKgwqAgaWlvOiBwcmVzc3VyZTogenBhMjMyNjogdXNlID0geyB9IGluc3RlYWQgb2YgbWVt
c2V0KCkKPiDCoMKgwqDCoMKgIGlpbzogcHJveGltaXR5OiBpcnNkMjAwOiB1c2UgPSB7IH0gaW5z
dGVhZCBvZiBtZW1zZXQoKQo+IMKgwqDCoMKgwqAgaWlvOiB0ZW1wZXJhdHVyZTogdG1wMDA2OiB1
c2UgPSB7IH0gaW5zdGVhZCBvZiBtZW1zZXQoKQo+IAo+IMKgZHJpdmVycy9paW8vYWNjZWwvYWR4
bDM3Mi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICst
LQo+IMKgZHJpdmVycy9paW8vYWNjZWwvbXNhMzExLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArLS0tCj4gwqBkcml2ZXJzL2lpby9hZGMvZGxuMi1h
ZGMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0ICst
LS0KPiDCoGRyaXZlcnMvaWlvL2FkYy9tdDYzNjAtYWRjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICstLQo+IMKgZHJpdmVycy9paW8vYWRjL3JvY2tjaGlw
X3NhcmFkYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0ICstLS0KPiDCoGRy
aXZlcnMvaWlvL2FkYy9ydHE2MDU2LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCA0ICstLS0KPiDCoGRyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMyArLS0KPiDCoGRy
aXZlcnMvaWlvL2FkYy90aS1hZHMxMDE1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCA0ICstLS0KPiDCoGRyaXZlcnMvaWlvL2FkYy90aS1hZHMxMTE5LmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0ICstLS0KPiDCoGRyaXZl
cnMvaWlvL2FkYy90aS1sbXA5MjA2NC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDQgKy0tLQo+IMKgZHJpdmVycy9paW8vYWRjL3RpLXRzYzIwNDYuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgKy0tCj4gwqBkcml2ZXJzL2lp
by9jaGVtaWNhbC9zY2QzMF9jb3JlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDMgKy0tCj4gwqBkcml2ZXJzL2lpby9jaGVtaWNhbC9zY2Q0eC5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMyArLS0KPiDCoGRyaXZlcnMvaWlvL2NoZW1pY2Fs
L3N1bnJpc2VfY28yLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2ICsrLS0tLQo+
IMKgZHJpdmVycy9paW8vZGFjL2FkMzU1MnIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgKy0tCj4gwqBkcml2ZXJzL2lpby9pbXUvaW52X2ljbTQy
NjAwL2ludl9pY200MjYwMF9hY2NlbC5jIHwgNSArKy0tLQo+IMKgZHJpdmVycy9paW8vaW11L2lu
dl9pY200MjYwMC9pbnZfaWNtNDI2MDBfZ3lyby5jwqAgfCA1ICsrLS0tCj4gwqBkcml2ZXJzL2lp
by9pbXUvaW52X21wdTYwNTAvaW52X21wdV9hY3BpLmPCoMKgwqDCoMKgwqDCoCB8IDQgKy0tLQo+
IMKgZHJpdmVycy9paW8vaW11L2ludl9tcHU2MDUwL2ludl9tcHVfcmluZy5jwqDCoMKgwqDCoMKg
wqAgfCA2ICsrLS0tLQo+IMKgZHJpdmVycy9paW8vbGlnaHQvYmgxNzQ1LmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArLS0tCj4gwqBkcml2ZXJzL2lp
by9saWdodC9sdHI1MDEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCA0ICstLS0KPiDCoGRyaXZlcnMvaWlvL2xpZ2h0L29wdDQwNjAuY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArLS0tCj4gwqBkcml2ZXJzL2lp
by9saWdodC92ZW1sNjAzMC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgNCArLS0tCj4gwqBkcml2ZXJzL2lpby9tYWduZXRvbWV0ZXIvYWY4MTMzai5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArLS0tCj4gwqBkcml2ZXJzL2lpby9wcmVzc3Vy
ZS9ibXAyODAtY29yZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNSArLS0tLQo+
IMKgZHJpdmVycy9paW8vcHJlc3N1cmUvbXBsMzExNS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCAzICstLQo+IMKgZHJpdmVycy9paW8vcHJlc3N1cmUvbXBybHMwMDI1
cGFfaTJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNSArLS0tLQo+IMKgZHJpdmVycy9paW8v
cHJlc3N1cmUvenBhMjMyNi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCA0ICstLS0KPiDCoGRyaXZlcnMvaWlvL3Byb3hpbWl0eS9pcnNkMjAwLmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICstLQo+IMKgZHJpdmVycy9paW8vdGVtcGVyYXR1
cmUvdG1wMDA2LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArLS0tCj4g
wqAzMCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCA4NSBkZWxldGlvbnMoLSkKPiAt
LS0KPiBiYXNlLWNvbW1pdDogNGM2MDczZmVjMmZlZTQ4MjdmYTBkZDhhNGFiNGU2ZjdiYmMwNWVl
Ngo+IGNoYW5nZS1pZDogMjAyNTA2MTEtaWlvLXplcm8taW5pdC1zdGFjay13aXRoLWluc3RlYWQt
b2YtbWVtc2V0LTBkMTJkNDFhN2VjYgo+IAo+IEJlc3QgcmVnYXJkcywKCg==


