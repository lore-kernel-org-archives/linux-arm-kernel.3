Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B38E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 00:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UPtfw8VuK8f7upUsP0qiiGtjlJDQAQYuFm8VMuMXK4=; b=a4jwiVL2b4sQGBE+IwkmC0nwt9
	POXWagVHgLe9ihHPxGE2kXbbbuJA0EqMn/Ino34HX1fqrFILTWYLcCYTujpEThNIlIv59znJEAsR6
	wgJoqZbFK9XFmF/tVkkHAw5aMwEz9K/DzGqVfLGfumna6ejC8kDeBf7MiCi3+REXOIGl6PnLs6aeb
	qc5q9OwxISGOUITaBWGhFTmZnyc+/aNOmo/Usww5GzA4pUwaWdsvIFXDAO7WzNtBhfTZMsep7LduZ
	CHPSGI3ONhw21axkPI1NhA88My37lUyZYRf/EfAcH5af5KYxt2URd3vgBhGgIkB9roPWyPbFN0bcX
	lPFPhC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLApC-0000000DKAr-00er;
	Wed, 11 Dec 2024 00:43:34 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLAmv-0000000DJh6-1Xt7;
	Wed, 11 Dec 2024 00:41:14 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21619108a6bso35438205ad.3;
        Tue, 10 Dec 2024 16:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733877672; x=1734482472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UPtfw8VuK8f7upUsP0qiiGtjlJDQAQYuFm8VMuMXK4=;
        b=FMtun8gFS6rkPswOwLkOHvv1+EOdByDn2GeELN6gc0ODYdO7rfawvTxNIN8YXniH9w
         cF+/O3O4Lw2dT5m808LWLzVECwfIAhNbWMWXjKRd2U6GZepqQ4tGSZKkwPyKtp5NSE7S
         hqJpzDgB89e/Y+5THAYbVJvb87kll7OqRuKkflTajoaTsKFYv69elZOCuJtcSHFvTOcS
         eI4CvimFG1nej0n1kD9PnDl4F/ezQwEumNdoTHQ+/pZ9W45AITIuhfoVhsU70yyygtiY
         4/9o4dxBV9wz+PPSvr+cW2pvvUwebbrwkYH9Af+AbnAnp6yov/rjJ0IvdVE9LpvR2Pjm
         tL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733877672; x=1734482472;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5UPtfw8VuK8f7upUsP0qiiGtjlJDQAQYuFm8VMuMXK4=;
        b=MmOifl0VcrK7MAqmPxcl1aTqjk1J1+XbhL+dI0dXXTs9vj99u4ghK1OW+j2NwG8xps
         ebouNiU0NFprOJxQhwbuKApdqb4U0X+J9DzmuIV5jgf9qqrxQC2xWjEuHZRtcSgCiBro
         8ASLxeRhwFI+vVSg1hgnkZH/ne+cRxA8FsSLr/f/Tcd3gtn1G6KS5vNFXmrJpClDltsY
         QFBTE1yGNiCuVbCVMNL+kcRbThpXXI1DnLNETrQ80jg+xZGrAA9MhFKK7q4F3HAdtY//
         hOdGFA4wRVWzQs6Fls8hFcGUZI144Y8kOyTXiMquNJg4IBABKdM6TByTUiRMoyYIgWhj
         sPpg==
X-Forwarded-Encrypted: i=1; AJvYcCW1ozteyALK88/IFP8y0yCIYqBi9239VF9lBrIdR3QPsTyX1eAyyMM3IcGq2QTEkAUBlYSCq2BirAnkSwsGS10t@lists.infradead.org, AJvYcCWLLqZ7N7IKX50ADGq4kvOS8E+Hnycqvm+ukDEYmnUwYvQc4j0XI6RGHCaMcLhF766DNqsrs8ZWfyhvl9c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzmUh55XIzagcllaWEdus77OtrloOTF2txnXSuOwE9dSgfn6Bo
	5G3i5nyZPeYiXuUynl2io9IEmXCVgdTk3+2oEaMbs32eQOOumMjE
X-Gm-Gg: ASbGncvFSi6oXOGDOBVHLIFuqMHgkOhY2E6tvWya3jrix1Cbj4kPClqKMhQkgLFZHwv
	7psaP8+yK6XsPNCpwJmy+tbju+DiqjyrCY0YpwIejB2OxdvyyZUk8AhwQKAez6zwmiEjRSo5bQV
	7+V212Xq6TXMdkuyiv49p20UsY01QJ0+qwsRi0SnFjJjwQTVKuZ/ApIbsIRgJdPm8s42ISRtj+t
	yJxYwU0V+l8etRkKhA8olW/rwyN4IHeXIKNPYfBifvkqi5NCxJeXLHtAN8HOwBkBXMLhAxaNc0I
	jbiGHYnlmk1UTodVRGJjcxISIl7B0TTNJQ==
X-Google-Smtp-Source: AGHT+IHqHfCvZvGKLuMXz8AiDsWXknJ34bQnBz2kNatpxzICbZyL3M7rCR45PKN88PXAaH1LNr0svg==
X-Received: by 2002:a17:902:8b83:b0:216:7cbf:9500 with SMTP id d9443c01a7336-21778397522mr17055945ad.6.1733877672078;
        Tue, 10 Dec 2024 16:41:12 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216353ab708sm56076995ad.182.2024.12.10.16.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 16:41:11 -0800 (PST)
Date: Wed, 11 Dec 2024 09:40:54 +0900 (JST)
Message-Id: <20241211.094054.1429837669366274024.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tangyouling@loongson.cn,
 hejinyang@loongson.cn, yangtiezhu@loongson.cn, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 5/5] rust: Add warn_on and warn_on_once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
	<20241210001802.228725-6-fujita.tomonori@gmail.com>
	<CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_164113_408492_26306E5F 
X-CRM114-Status: GOOD (  20.51  )
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

T24gVHVlLCAxMCBEZWMgMjAyNCAxMDowNTowNyArMDEwMA0KQWxpY2UgUnlobCA8YWxpY2VyeWhs
QGdvb2dsZS5jb20+IHdyb3RlOg0KDQo+IE9uIFR1ZSwgRGVjIDEwLCAyMDI0IGF0IDE6MTnigK9B
TSBGVUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+IHdyb3RlOg0K
Pj4NCj4+IEFkZCB3YXJuX29uIGFuZCB3YXJuX29uX29uY2UgbWFjcm9zLiBXcmFwcGluZyB0aGUg
QydzIFdBUk5fKiBhbmQgQlVHXyoNCj4+IG1hY3JvcyBkb2Vzbid0IHdvcmsgc28gdGhpcyB1c2Vz
IHRoZSBhc3NlbWJseSBjb2RlIGV4cG9ydGVkIGJ5IHRoZSBDDQo+PiBzaWRlIHZpYSBBUkNIX1dB
Uk5fQVNNIG1hY3JvLiBMaWtlIHRoZSBzdGF0aWMgYnJhbmNoIGNvZGUsIHRoaXMNCj4+IGdlbmVy
YXRlcyB0aGUgYXNzZW1ibHkgY29kZSBmb3IgcnVzdCBkeW5hbWljYWxseSBieSB1c2luZyB0aGUg
Qw0KPj4gcHJlcHJvY2Vzc29yLg0KPj4NCj4+IGZpbGUoKSEgbWFjcm8gZG9lc24ndCB3b3JrIGZv
ciB0aGUgUnVzdCBpbmxpbmUgYXNzZW1ibHkgaW4gdGhlIHNhbWUNCj4+IHdheSBhcyBfX0ZJTEVf
XyBmb3IgdGhlIEMgaW5saW5lIGFzc2VtYmx5LiBTbyB0aGUgY29kZSB0byBoYW5kbGUgYQ0KPj4g
ZmlsZSBuYW1lIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBDIGFzc2VtYmx5IGNvZGUgKHNpbWlsYXIg
dG8gdGhlDQo+PiBhcm02NC9sb29uZ2FyY2ggYXNzZW1ibHkpLg0KPj4NCj4+IEFTTV9SRUFDSEFC
TEUgZGVmaW5pdGlvbiB3b3JrcyBpbiB0aGUgc2FtZSB3YXkgdG8gZ2V0IG9ianRvb2wncw0KPj4g
cmVhY2hhYmxlIGFzbSBjb2RlLiBUaGUgYXJjaGl0ZWN0dXJlcyB3aGljaCB1c2Ugb2JqdG9vbCAo
eDg2IGFuZA0KPj4gbG9vbmdhcmNoKSBuZWVkcyBpdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBG
VUpJVEEgVG9tb25vcmkgPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+DQo+IA0KPj4gKyNbbWFj
cm9fZXhwb3J0XQ0KPj4gKyNbZG9jKGhpZGRlbildDQo+PiArI1tjZmcoYWxsKENPTkZJR19CVUcs
IG5vdChDT05GSUdfVU1MKSkpXQ0KPj4gKyNbY2ZnKGFueSh0YXJnZXRfYXJjaCA9ICJ4ODZfNjQi
LCB0YXJnZXRfYXJjaCA9ICJyaXNjdjY0IikpXQ0KPiANCj4+ICsjW21hY3JvX2V4cG9ydF0NCj4+
ICsjW2RvYyhoaWRkZW4pXQ0KPj4gKyNbY2ZnKGFsbChDT05GSUdfQlVHLCBub3QoQ09ORklHX1VN
TCkpKV0NCj4+ICsjW2NmZyhhbnkodGFyZ2V0X2FyY2ggPSAiYWFyY2g2NCIsIHRhcmdldF9hcmNo
ID0gImxvb25nYXJjaDY0IikpXQ0KPiANCj4gV2hhdCdzIHRoZSByZWFzb24gZm9yIHRoaXMgYXJj
aC1zcGVjaWZpYyBjb2RlPyBUaGUgZmlsZSEoKS9saW5lISgpDQo+IGludm9jYXRpb25zPyBDb3Vs
ZCB0aGV5IGJlIHBhc3NlZCBhcyBhbiBhcmd1bWVudCB0byB0aGUgYXNtIGluc3RlYWQgc28NCj4g
dGhhdCB3ZSBkb24ndCBuZWVkIHRhcmdldF9hcmNoIGNmZ3M/IEkgdW5kZXJzdGFuZCB0aGF0IHRo
ZXkgZG9uJ3Qgd29yaw0KPiBleGFjdGx5IHRoZSBzYW1lIHdheSwgYnV0IG1heWJlIGl0IGNvdWxk
IHN0aWxsIHdvcms/DQoNCkJlY2F1c2Ugb2YgImVycm9yOiBuYW1lZCBhcmd1bWVudCBuZXZlciB1
c2VkIiBpbiBSdXN0IGlubGluZSBhc3NlbWJseToNCg0KQWxsIHRoZSBhcmNocyBkZWZpbmUgQVJD
SF9XQVJOX0FTTSBtYWNybyBpbiB0aGUgc2FtZSB3YXk6DQoNCiNkZWZpbmUgQVJDSF9XQVJOX0FT
TShmaWxlLCBsaW5lLCBmbGFncywgc2l6ZSkNCg0KSG93ZXZlciwgb25seSB4ODYgYW5kIHJpc2Mt
diBhc20gY29kZSB1c2UgdGhlIHNpemUgYXJndW1lbnQuIFdpdGhvdXQNCnRoZSBjZmdzLCBJJ2xs
IGdldCB0aGUgZm9sbG93aW5nIG9uIGFybTY0L2xvb25nYXJjaDoNCg0KZXJyb3I6IG5hbWVkIGFy
Z3VtZW50IG5ldmVyIHVzZWQNCiAgLS0+IC9ob21lL2Z1aml0YS9naXQvbGludXgtcnVzdC9kcml2
ZXJzL2Jsb2NrL3JudWxsLnJzOjU0OjkNCiAgIHwNCjU0IHwgICAgICAgICB3YXJuX29uISh0cnVl
KTsNCiAgIHwgICAgICAgICBeXl5eXl5eXl5eXl5eXiBuYW1lZCBhcmd1bWVudCBuZXZlciB1c2Vk
DQogICB8DQogICA9IGhlbHA6IGlmIHRoaXMgYXJndW1lbnQgaXMgaW50ZW50aW9uYWxseSB1bnVz
ZWQsIGNvbnNpZGVyIHVzaW5nIGl0IGluIGFuIGFzbSBjb21tZW50OiBgIi8qIHtzaXplfSAqLyJg
DQogICA9IG5vdGU6IHRoaXMgZXJyb3Igb3JpZ2luYXRlcyBpbiB0aGUgbWFjcm8gYCRjcmF0ZTo6
d2Fybl9mbGFnc2Agd2hpY2ggY29tZXMgZnJvbSB0aGUgZXhwYW5zaW9uIG9mIHRoZSBtYWNybyBg
d2Fybl9vbmAgKGluIE5pZ2h0bHkgYnVpbGRzLCBydW4gd2l0aCAtWiBtYWNyby1iYWNrdHJhY2Ug
Zm9yIG1vcmUgaW5mbykNCg0KDQpBbnkgd2F5IHRvIG1ha2UgdGhlIGNvbXBpbGVyIHRvIGlnbm9y
ZSB0aGlzPw0KDQoNCj4+ICsjW21hY3JvX2V4cG9ydF0NCj4+ICsjW2RvYyhoaWRkZW4pXQ0KPj4g
KyNbY2ZnKGFsbChDT05GSUdfQlVHLCBDT05GSUdfVU1MKSldDQo+PiArbWFjcm9fcnVsZXMhIHdh
cm5fZmxhZ3Mgew0KPj4gKyAgICAoJGZsYWdzOmV4cHIpID0+IHsNCj4+ICsgICAgICAgIC8vIFNB
RkVUWTogSnVzdCBhbiBGRkkgY2FsbC4NCj4+ICsgICAgICAgIHVuc2FmZSB7DQo+PiArICAgICAg
ICAgICAgJGNyYXRlOjpiaW5kaW5nczo6d2Fybl9zbG93cGF0aF9mbXQoDQo+PiArICAgICAgICAg
ICAgICAgICRjcmF0ZTo6Y19zdHIhKDo6Y29yZTo6ZmlsZSEoKSkuYXNfcHRyKCkgYXMgKmNvbnN0
IDo6Y29yZTo6ZmZpOjpjX2NoYXIsDQo+PiArICAgICAgICAgICAgICAgIGxpbmUhKCkgYXMgaTMy
LA0KPj4gKyAgICAgICAgICAgICAgICAkZmxhZ3MgYXMgdTMyLA0KPj4gKyAgICAgICAgICAgICAg
ICA6OmNvcmU6OnB0cjo6bnVsbCgpIGFzICpjb25zdCA6OmNvcmU6OmZmaTo6Y19jaGFyLA0KPiAN
Cj4gSSB3b25kZXIgaWYgdGhpcyBjb3VsZCBiZSB3cml0dGVuIHRvIHV0aWxpemUgTG9jYXRpb246
OmNhbGxlcigpDQo+IGluc3RlYWQgc28gdGhhdCBgI1t0cmFja19jYWxsZXJdYCB3b3Jrcz8NCg0K
WW91IG1lYW50IHRoYXQgd2UgY291bGQgbWFrZSB3YXJuX2ZsYWdzKCkgZnVuY3Rpb24gaW5zdGVh
ZCBvZiBtYWNybw0Kd2l0aCBMb2NhdGlvbjo6Y2FsbGVyKCk/DQoNCklmIHNvLCB3ZSBuZWVkIHRv
IGFkZCBjZmdzIHRvIHdhcm5fb24gYW5kIHdhcm5fb25fb25jZSBiZWNhdXNlIGJvdGggbWFjcm8N
CmFuZCBmdW5jdGlvbiBvZiB3YXJuX2ZsYWdzIGFyZSBuZWNlc3Nhcnk/DQo=

