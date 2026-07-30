Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A8CC55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGTkNpzchZNpj9HV/ywwb5I5HWM8o4egLfUtXR/eyws=; b=XqSJ5IPKBGdhK01W0rsQp9K0/R
	CYyNNAgVdNEO5lOqyhVNqiJ+oidPZ2RViSmpWc0exK4v14K1kl+ZqXGlq6Hoc0dMy+Bl7+pDjNq7b
	8n8JMlGBUerkgpcJ/IqewtTU6TJ6poo9SFsCUhyUsLQQ8Of+Ho8znQr/IvgqzTPzF25Hfg3RIwZI3
	GTSsP5TSjMm/YsBiMThstA8qSGhhRLefVYfS/BwMn6jUZylXViMGYoQVgYPFCJ6qXuy6eO874/qxL
	tatSCXzCCqR1Ouuc4SBEOY0MQmjK6NWoUOBC8jMP+SGUVRyPrJJ2eQL2uZRxfPBRa1GKXZyhfH1Vs
	E0G1zVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRNS-0000000AhQw-3xnW;
	Thu, 30 Jul 2026 14:04:50 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRNQ-0000000AhPj-1O2U;
	Thu, 30 Jul 2026 14:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785420285; bh=tGTkNpzchZNpj9HV/ywwb5I5HWM8o4egLfUtXR/eyws=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=k4Rkd8v5CBpNWsHys2gIx7tEERm/Gg2BZm6q6Q9XXLbVLW/O08S9tD+I2YavdOcUD
	 LYNHIAU6PG0tGn9BBCyr166QNRNvZvqHMeEYxl8gV3FOIsjMQOdH/4ncpbuT/t8/S3
	 Dp1wPH1cGn2x42uHEHHHA3efA0eQoj0jwtE+11aw=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-XMAILINFO: OSDxAxedUaWCj2nTIt4SlIaffdcH5TQCRrGH0D8KpcaLyWVb1AwgKVCVXs2DWK
	 LNtUkzL9ckzg8n/vwGTDh37CuOMJ/jk8m5P2ov6ji0h8i0yEPAD6g8f13u6Wzvf8NQWblMCL6tdi8
	 n84Y8Gd93c6wwHxiY2CzcTWxSFpNxquPtjltH5Gohg78FP8n2Rgses0ZLPqL+q1jBmr4BUGRRWLoJ
	 mzgRxKscnUWbxpcbn90kGBkb8Zk4nJEs9avZKYXhgZ40ZW3D6TNOdTT0iHsTcVifVYbgKcEkwwxsi
	 XVASX+rDPXebyz8IBUKXCDZrgCTDTXsx/RsXySzy16SymfY2jx/UuPWOhpcFLmkjk5rHciEsLMV32
	 GlsyqsInI/qWW+vp5H3gPDkqmQcMOpqwSCY0tO5mpzeDFr74EmfKcCjnBQG8PDP5pwpTdwxRm1gQn
	 IFxpqjvHYIOiImt4hWSx3Cicy4n7csvilLZDluDJIozh1MPeazckTOZvaTWi+1ApHoWAeXUTX1yGy
	 mXtwgxV5S52elwF8LB5VUw9AjdSlcvI7bcDD6QURAcB87LS4+vaoa+eT557/Ytw+7yf5i5m2aGKXd
	 OJcssUEls/O2bkeVxtHV0SIqwQ0KCDKzj1Bxhmz+WbArbmARae7VtMQtTyrkeTZuNNHqng7pioyRY
	 Q26hUwSyXzU6RQyZnYoWfS/Xgu0G5AjrAiBno6ow+d1FRZnmI05yA9uj/yX04MS3HCso5Hr480RX3
	 iFx6FDfaGiUZJ4bCZRgw4wJMK7iYXxOo6LAsYriEOg0nVcdNmqfqMgnDg0FzvXLxb7sOYcuHPTYt+
	 1jz/U2htRblg2PcEVv54uyluXpuCBQfzZp2IRSWKaG6miMeP2sAtZYSu5V/34MSg9AbfxxqGvCBT6
	 V7aoav8ab4frjDX4Zg8Zjs42YbdzPme6ruHELpPa9dlB2XegZjQ9DxJCoKA57zh2gwGn1tHa/8OSv
	 mUcin/yiwLi889aRRZonur5oBq8pv8DnHV8CC8LQUTA7Hb1X2GPnsBQGD1VrIKZzbVIXcDBSQseUc
	 7Tn2yI4ueKfxmtSocjSKhS0ut9haSKXoBYqzznJ/1nIhbHa8z51U+xFdNBfQr6fNBT2q1XzWMHrrl
	 TcdV4PWUzIr3nQ==
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?UXVlbnRpbiBTY2h1bHo=?=" <quentin.schulz@cherry.de>, "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?VmluY2VudCBNYWlsaG9s?=" <mailhol@kernel.org>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>
Cc: "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v5 4/4] arm64: dts: rockchip: Enable CAN controller on RK3588-Tiger-Haikou
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 30 Jul 2026 22:04:43 +0800
X-Priority: 3
Message-ID: <tencent_34D00CC80826788DD404902246F9ED36E10A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20260725-master-v5-0-75da459d2b93@qq.com>
 <tencent_8E35228F9F4F133FCDBCCC4902F6887D0006@qq.com>
	<7628bc49-b4e7-4716-9579-022c20bbf134@cherry.de>
In-Reply-To: <7628bc49-b4e7-4716-9579-022c20bbf134@cherry.de>
X-QQ-mid: xmsezb41-0t1785420283tmh58ymmo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_070448_724117_F7EEE53D 
X-CRM114-Status: GOOD (  15.32  )
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

SGkgUXVlbnRpbiwKCj4gQ2FuIHlvdSBwbGVhc2UgbW92ZSB0aGUgYXNzaWduZWQtY2xvY2tz
KiBwcm9wZXJ0aWVzIHRvIHJrMzU4OC10aWdlci5kdHNpCj4gaW5zdGVhZD8gUkszNTg4IFRp
Z2VyIGlzIGEgU09NIGFuZCBIYWlrb3UgaXMgYSBjYXJyaWVyYm9hcmQuIFRoZQo+IGNhcnJp
ZXJib2FyZCB0YWtlcyB0aGUgc2lnbmFsIGRpcmVjdGx5IGZyb20gdGhlIFNvQyBhbmQgcm91
dGUgdGhvc2UgdG8gYQo+IHRyYW5zY2VpdmVyLiBJJ20gYXNzdW1pbmcgYWxsIGNhcnJpZXJi
b2FyZHMgZm9yIFRpZ2VyIHdpbGwgbmVlZCB0aG9zZQo+IHR3byBwcm9wZXJ0aWVzLCBzbyBi
ZXR0ZXIgaGF2ZSB0aGVtIGluIHRoZSBTb00gRFRTSS4KPgo+IG9uIHRvcCBvZiB0aGlzIHBh
dGNoIGFuZCBzcXVhc2ggYW5kIHdlJ2xsIGhhdmUgd2hhdCBJIHdvdWxkIGxpa2UgdG8gaGF2
ZS4KPgo+IElmIHRoZXJlJ3Mgbm8gbmVlZCBmb3IgYSB2NiwgSSdtIGFzc3VtaW5nIEhlaWtv
IGNhbiBzaW1wbHkgZml4IHRoYXQgd2hlbgo+IGFwcGx5aW5nIGFuZCB0aHVzIHRoZXJlIG1h
eSBiZSBubyBuZWVkIHRvIHNlbmQgYSB2NiBqdXN0IGZvciB0aGF0IChidXQKPiBpZiB5b3Ug
bmVlZCB0byBzZW5kIGEgdjYsIHBsZWFzZSBjb25zaWRlciBkb2luZyB0aGUgc3VnZ2VzdGVk
IGNoYW5nZXMKPiBhYm92ZSkuCgpJIHdpbGwgbW92ZSB0aGUgYXNzaWduZWQtY2xvY2tzIGFu
ZCBhc3NpZ25lZC1jbG9jay1yYXRlcyBwcm9wZXJ0aWVzIHRvCnJrMzU4OC10aWdlci5kdHNp
LiBJIGFtIHByZXBhcmluZyB2NiBub3cgYW5kIHdpbGwgcG9zdCBpdApzaG9ydGx5IHdpdGgg
dGhlc2UgY2hhbmdlcy4KClRoYW5rcywKQ3VuaGFv


