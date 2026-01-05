Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E533C79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUth7Rv+PEjGuKvoMHkvuUFCQojP1Kmz0Cp68IdoWZI=; b=sVyoe7jzBitVB38Fzc7ukcapDR
	fbmtde//yYztxucI7Tdwq4N/BPOe/D8xr+ZbLG463P3DHNhHWBBGF8STyifaytqsCH60xGPBZozAm
	jXMQNIbNGIpFQdgEvad5/lNjF7fMK/62b1anlsg5A5CFPBOUw4q01tvQTKDq3n0Eeo2nknH8cHwmO
	7LnbBPoPNlxzmMdBXe/+QXTXRnUU54OZlEkgpj6QD3SpZ8TBXaozyH6lGGu6Z/3EMZMPZT8VYp2GW
	KaMb9fDQ+qbHtphsI1Tqlr2qzvuZNg3fSBXhw1afGI2R+cblB44D/IzPb5sXVmgtKClFEMPSnkvIq
	7A2ZH/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjhK-0000000BHQy-3JuW;
	Mon, 05 Jan 2026 12:28:34 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjhH-0000000BHNY-0D0v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:28:33 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-64ba9a00b5aso16641042a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 04:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767616109; x=1768220909; darn=lists.infradead.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PUth7Rv+PEjGuKvoMHkvuUFCQojP1Kmz0Cp68IdoWZI=;
        b=Qze20Zsh87QrBHRg36hTUzk6KybCOnXGy1dgfMOqJKGZ6lvehSEkDJ3USzK583GsFU
         q6MC0Xsv7eZAsp24ooLcrYaBIYkR99P+1Q3Wh2EnHH445pvW5z9LfTSBO7EK81Uw0BS0
         KnDxlb1w25JmbVp1HHJKKTK3YiIW4ayNKtaYbYndhPShkB6xBx89xT5be8jz8Ff3eakl
         HO8UHE6mcpx5DybrhqCKzxsJktQAlPAp2JxSLj2OvcIiYH3tvl3j0fJRYcJvKv+dpDSb
         iJc3qzmpyvJQAp2cp/fJk67iSLK72SKYBCEYhtwljIOrwh4R6DLp1NtdEvyTPWKw1N5r
         PLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616109; x=1768220909;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PUth7Rv+PEjGuKvoMHkvuUFCQojP1Kmz0Cp68IdoWZI=;
        b=hhUs4VEJPaWuRR5GejgSytrvXZB4p7/syKO/cW2LHw2x62P2p3oxhvkpRCv28hUn8/
         pNOj4Urd3vNbtYP9hYh0Zctk6zWyzZv9+VCVyBDYuBre8rkbduK65Vr3ctTPJIlU2rIg
         n3Li0wsfgwbx3d1WPAkEtztz6ecK4vRHya+Ldoyty6XA3thqJp1IIze78nA383yHwbOA
         BGWk5qgcm+DZaMAbuva3htZBYmQBN4X5g4IjXxi36DW4ovEg6QbJYVS+0wLWnf8z+Nia
         w/1Yt6ttIYRf8xABHcSFBFHJCBmlhzaNCxbtDc5U9G3DC1L0i3yITwwNXwRf4SIlc5qf
         JBcw==
X-Forwarded-Encrypted: i=1; AJvYcCXWXktjQx6/v8ZWk6Hp63cnInVHXnCURiyhrhyVNuQnvNCNYtjN4UzeiKV5gszQf42uqdHmiD6oKUCBR4M2YJ5/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcd8T1pg89kns+DiPmTJ+b5Gs99HwY6QU8sGWSIAyyLitDJekM
	gaawcfVBWzp4BrGQXX2M7kStuqAbGZ6XqFIEg+/Mhvb8ghEMs3vGpSBpNC7TIgKF/E4=
X-Gm-Gg: AY/fxX58vmraUgBKExzzY9qtBr5fUkKSb96wkRbU4N6mOIn3jNyGaiieICU461ECX6j
	f9EKJywTaBH0zEmyRk7MNCPlPlzADB2YrWNpuXf9g53gyKXB98F32r6v0SjGnwd7Ch8E87Reuqd
	cHuMRwgUbl6jrds/jH2TPEGpgdLrz9/cwDwAh1cbISxDrO+n7KvP38EJWaJR+YZt11gDS+ihlxh
	mnGR3hnVAuX5zSj0OE1o1+xiRQwifVQnbyKQZEYeztdLr89ehjqhu92Fa3tBR3aOYlT0yUh2JOn
	fnMvlG/0x8W/jebbH62rfqWB2mg9aAOSxOkxph69LtLSGOUphVa2skEaufz2RVrIGloQIjEShIr
	lNHMbuoTmehXEtd2Co0+P4EfPU9WfUlYEq+ZWueH1Ez4C4Pu4RRARC0FgAbZ6DBhNJqjny5r/QJ
	Y2WUkcI7MyWHNIhjxHT6CnW/QKw0K2G8rsoRfwlwUXinZA2krbEFSeo+8PRCCo1GF0k4ZhO4+Hn
	5Nwfx1Td9TGqn5IAJXZ4Si9xC4VPiXlsc/e6C/8W15W3ofuLw==
X-Google-Smtp-Source: AGHT+IHw7RzSwkUW6CQBSGYajsZ1cArTBvARw1HKoDtokXcxTEUwSVAhF63qSESresl9jE+EqPIj4g==
X-Received: by 2002:a05:6402:35c6:b0:64d:2769:8460 with SMTP id 4fb4d7f45d1cf-64d276986c7mr41494908a12.6.1767616108941;
        Mon, 05 Jan 2026 04:28:28 -0800 (PST)
Received: from ?IPV6:2003:e5:8704:4800:66fd:131f:60bd:bc29? (p200300e58704480066fd131f60bdbc29.dip0.t-ipconnect.de. [2003:e5:8704:4800:66fd:131f:60bd:bc29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a4eesm52542264a12.24.2026.01.05.04.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 04:28:28 -0800 (PST)
Message-ID: <8acc1980-add8-4e0d-bba3-f7452fe53bce@suse.com>
Date: Mon, 5 Jan 2026 13:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dma-mapping: Separate DMA sync issuing and
 completion waiting
To: Barry Song <21cnbao@gmail.com>, catalin.marinas@arm.com,
 m.szyprowski@samsung.com, robin.murphy@arm.com, will@kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-5-21cnbao@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20251226225254.46197-5-21cnbao@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GxvkXPYAwDmy46KJEUE01P1J"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_042831_189845_493EE5FD 
X-CRM114-Status: GOOD (  15.77  )
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
Cc: Barry Song <baohua@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GxvkXPYAwDmy46KJEUE01P1J
Content-Type: multipart/mixed; boundary="------------ZpAK7ynzPzqJUaubTQ1077Hn";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Barry Song <21cnbao@gmail.com>, catalin.marinas@arm.com,
 m.szyprowski@samsung.com, robin.murphy@arm.com, will@kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Barry Song <baohua@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 Ada Couprie Diaz <ada.coupriediaz@arm.com>, Ard Biesheuvel
 <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Joerg Roedel <joro@8bytes.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
Message-ID: <8acc1980-add8-4e0d-bba3-f7452fe53bce@suse.com>
Subject: Re: [PATCH v2 4/8] dma-mapping: Separate DMA sync issuing and
 completion waiting
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-5-21cnbao@gmail.com>
In-Reply-To: <20251226225254.46197-5-21cnbao@gmail.com>

--------------ZpAK7ynzPzqJUaubTQ1077Hn
Content-Type: multipart/mixed; boundary="------------EvMF4abzzyTjflF1c0aAYmMW"

--------------EvMF4abzzyTjflF1c0aAYmMW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMTIuMjUgMjM6NTIsIEJhcnJ5IFNvbmcgd3JvdGU6DQo+IEZyb206IEJhcnJ5IFNv
bmcgPGJhb2h1YUBrZXJuZWwub3JnPg0KPiANCj4gQ3VycmVudGx5LCBhcmNoX3N5bmNfZG1h
X2Zvcl9jcHUgYW5kIGFyY2hfc3luY19kbWFfZm9yX2RldmljZQ0KPiBhbHdheXMgd2FpdCBm
b3IgdGhlIGNvbXBsZXRpb24gb2YgZWFjaCBETUEgYnVmZmVyLiBUaGF0IGlzLA0KPiBpc3N1
aW5nIHRoZSBETUEgc3luYyBhbmQgd2FpdGluZyBmb3IgY29tcGxldGlvbiBpcyBkb25lIGlu
IGENCj4gc2luZ2xlIEFQSSBjYWxsLg0KPiANCj4gRm9yIHNjYXR0ZXItZ2F0aGVyIGxpc3Rz
IHdpdGggbXVsdGlwbGUgZW50cmllcywgdGhpcyBtZWFucw0KPiBpc3N1aW5nIGFuZCB3YWl0
aW5nIGlzIHJlcGVhdGVkIGZvciBlYWNoIGVudHJ5LCB3aGljaCBjYW4gaHVydA0KPiBwZXJm
b3JtYW5jZS4gQXJjaGl0ZWN0dXJlcyBsaWtlIEFSTTY0IG1heSBiZSBhYmxlIHRvIGlzc3Vl
IGFsbA0KPiBETUEgc3luYyBvcGVyYXRpb25zIGZvciBhbGwgZW50cmllcyBmaXJzdCBhbmQg
dGhlbiB3YWl0IGZvcg0KPiBjb21wbGV0aW9uIHRvZ2V0aGVyLg0KPiANCj4gVG8gYWRkcmVz
cyB0aGlzLCBhcmNoX3N5bmNfZG1hX2Zvcl8qIG5vdyBpc3N1ZXMgRE1BIG9wZXJhdGlvbnMg
aW4NCj4gYmF0Y2gsIGZvbGxvd2VkIGJ5IGEgZmx1c2guIE9uIEFSTTY0LCB0aGUgZmx1c2gg
aXMgaW1wbGVtZW50ZWQNCj4gdXNpbmcgYSBkc2IgaW5zdHJ1Y3Rpb24gd2l0aGluIGFyY2hf
c3luY19kbWFfZmx1c2goKS4NCj4gDQo+IEZvciBub3csIGFkZCBhcmNoX3N5bmNfZG1hX2Zs
dXNoKCkgYWZ0ZXIgZWFjaA0KPiBhcmNoX3N5bmNfZG1hX2Zvcl8qKCkgY2FsbC4gYXJjaF9z
eW5jX2RtYV9mbHVzaCgpIGlzIGRlZmluZWQgYXMgYQ0KPiBuby1vcCBvbiBhbGwgYXJjaGl0
ZWN0dXJlcyBleGNlcHQgYXJtNjQsIHNvIHRoaXMgcGF0Y2ggZG9lcyBub3QNCj4gY2hhbmdl
IGV4aXN0aW5nIGJlaGF2aW9yLiBTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCBpbnRyb2R1Y2Ug
dHJ1ZQ0KPiBiYXRjaGluZyBmb3IgU0cgRE1BIGJ1ZmZlcnMuDQo+IA0KPiBDYzogTGVvbiBS
b21hbm92c2t5IDxsZW9uQGtlcm5lbC5vcmc+DQo+IENjOiBDYXRhbGluIE1hcmluYXMgPGNh
dGFsaW4ubWFyaW5hc0Bhcm0uY29tPg0KPiBDYzogV2lsbCBEZWFjb24gPHdpbGxAa2VybmVs
Lm9yZz4NCj4gQ2M6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNv
bT4NCj4gQ2M6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+DQo+IENjOiBB
ZGEgQ291cHJpZSBEaWF6IDxhZGEuY291cHJpZWRpYXpAYXJtLmNvbT4NCj4gQ2M6IEFyZCBC
aWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+DQo+IENjOiBNYXJjIFp5bmdpZXIgPG1hekBr
ZXJuZWwub3JnPg0KPiBDYzogQW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFs
QGFybS5jb20+DQo+IENjOiBSeWFuIFJvYmVydHMgPHJ5YW4ucm9iZXJ0c0Bhcm0uY29tPg0K
PiBDYzogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4NCj4gQ2M6IEpv
ZXJnIFJvZWRlbCA8am9yb0A4Ynl0ZXMub3JnPg0KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPg0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPg0KPiBDYzogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNo
Y2hlbmtvQGVwYW0uY29tPg0KPiBDYzogVGFuZ3F1YW4gWmhlbmcgPHpoZW5ndGFuZ3F1YW5A
b3Bwby5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEJhcnJ5IFNvbmcgPGJhb2h1YUBrZXJuZWwu
b3JnPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiAj
IGRyaXZlcnMveGVuL3N3aW90bGIteGVuLmMNCg0KDQpKdWVyZ2VuDQo=
--------------EvMF4abzzyTjflF1c0aAYmMW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------EvMF4abzzyTjflF1c0aAYmMW--

--------------ZpAK7ynzPzqJUaubTQ1077Hn--

--------------GxvkXPYAwDmy46KJEUE01P1J
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlbrmsFAwAAAAAACgkQsN6d1ii/Ey86
BAf/TjdHSGSVxUq/1jBWSwsEL60D1UwbkianqWSyU9Lsgv+ciQZTl9YQCekRNSDjfbC+TkQk95o+
ljksgKaiQl/4XuHFJY9ax5EseY3bgye1Z0Np6xYNuFLLBvqM7uhasqj72tN00Km61L66qlCMx+fW
3d5gg3VRLs3lah8IkXTIhy0uJEhnY0A4uIk7VETLcj7+7a5S4CMHE5VMChqNUWcK9Sh9kTb8P1Nh
Gse1tYNFtQ47AYbZMtrtbRg+0b4vbqUsHVEYT4L3wLnUJWDdHD6vLl8Y/9wqqvrRev2y3bj38wtl
3VS1yVV7aJypH6t/+psUq87o3BRJ3C931NL73VcD0g==
=QB9Y
-----END PGP SIGNATURE-----

--------------GxvkXPYAwDmy46KJEUE01P1J--

