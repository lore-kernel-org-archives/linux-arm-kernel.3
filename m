Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B644AC79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysL1IfLuQqLs930QYIuvsI/XaCNHlG4InlrdhPVFass=; b=fTzGulyA8gVT6H5/4uKrmZv2hZ
	GqIFPPzk3HRK+Z3v/wEjFX1/1R5NP/cp/fPZovNSVCFN9qWlrtaYJoaZYlscdc07WxrsyZ11W7noo
	JvEb81lj+h36kIf2h74LVe9zn0S7t8eup0MTQdd3gdlP3mw2hb/A+lnf1MSE4X/XMHi80o562OkaP
	JKCMfea1D6nqXwDI703O5JG2A8HkQR3hf8kmE2J5nX1myz/rJ0w4tgqicmvo2KGtMoIUcPO+NgAMf
	WobvvYkmjDYA1ATqW8MMhOp2c5JMOlCnc60aQinjLxZ8ZcsD8pTLxxRH3qsCK625j1Q4I867eNW39
	K8NVbUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnhH-0000000Bkg2-3jIQ;
	Mon, 05 Jan 2026 16:44:47 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnhF-0000000Bkf4-2Fd5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:44:46 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6505cbe47d8so166048a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 08:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767631484; x=1768236284; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ysL1IfLuQqLs930QYIuvsI/XaCNHlG4InlrdhPVFass=;
        b=lBLq1TEQ/dP+T79tG3mjk8GKntiRJ9HK+pz2RYHVnOZmK89V8CG1XH4TcsqSjNUcJz
         dpYcCZKoDEy144MORKvkyqquaruNRop/mC8yAC4vUmIGPjO5pvyjyZxjGwDb4ChBOPOf
         lxdNT2xmju+85MtGznYB0F3g29+ahGXlWusoAY//CA07fxiZ+oudQ4b8rtUG2+pqDXMo
         YzygON5oOixjQEoKOhEUpAKS76oc3upj9QRq2qcNTsU9YRdtaOrCudUr8HAyPk+tpDUc
         f5PyhkQKipGciwuRunj8jbT3RCUAzuCCY+ZK7/DepmTecGMX9W6Buug/Ygmx0meXqylA
         WtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767631484; x=1768236284;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysL1IfLuQqLs930QYIuvsI/XaCNHlG4InlrdhPVFass=;
        b=XXnpRA5NhZlXANFQoc2EpIIl0CZVns8U+5vsxiff4R76FZHV8Q7rsql/i6xxpXX6sP
         YcO30T4JdBfOjziORNKykmZKjXid9bHs4V2GXkj56Rjv673uzh8b/DFlNoJKpIAFEAGb
         D9nEQt0kbLVy+MY5bElxJVPLmFzaWkn2M2QgJBSHdoujAuY0joqNlI1sz8MMU31euLgT
         e3jELge64TcmiLK2+lTTP/fRdo/cg39jfQuP/cgNP6Si/zeUaTbOQbW/X2E/U2RWHvdD
         cIT4QGsEr9/Q0T23JxcnDtMoYBPmWt00W0M2r0JQ1Y3lk/Ap1LATOdDr96pG91BM+nlZ
         d9jA==
X-Forwarded-Encrypted: i=1; AJvYcCWvBLPrwsrHOpQOVAtKZf+6+4ChBQP0kPP5bf7Z7TT4EY/UQO3vW+/zff7BTJV6FdhBR+2pDUyl1lyuI4ICOXb2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx83/oXwl718JMH1F6wCDijEi9o3hONaDjdHNakELctVfs+jwAX
	pTSvTo30F+7OKp3seN6MouDll9dawlCZdMrm5rSe6STFvJ1t7KBobRyAtRCLs0Zz9Fk=
X-Gm-Gg: AY/fxX6j0zOPFA7zihb+SiL6tas1tKBl768/j1SNyRdrS12WkQ2EWxHEf5HQpPLiGW8
	ED9Lmd4lZL5a2yONEcF+854wj8KOj5NljPoH2xS80sGeHY9+PL8BZ+Bl1p3+OccJw4BUW6s9u0Y
	a0L2nH2S/e2mqEAs5Uy229ZHYXLitr6F2gbMKatFmhogIOievJkm7ayFET32oR0KGJn8s/Sm0KI
	hYnxt/F4lW9eujEtBigfXi6DVxhrbPDU4SnsjUTqKmA/4ptbzo6yV1ZO+NKqbiwJDYL9a8lRIMb
	1vE0EwYsR3aT9h0Jius6f/0l6kKQFNK2279QUHiUJTMldhXAcEsbffvcJsy2BQ8+Owwyeyq4jn6
	sYL7o7EUxVL2X0Sulu9G6bAN88QOQiBRo7WWI1mnAQCl+G9/NavTvP/Vy431py4zvpj80QfWu7+
	dy//r22oFbAqfWvbZx39zuALJdkfNa
X-Google-Smtp-Source: AGHT+IHMPq7hes2husjubrT6pbdK3YBWuHV6Kv168VWiyeDREVlAzmwHmgmU7dDwuzvHpVfXm/CQRw==
X-Received: by 2002:a05:6402:268a:b0:64b:3093:3560 with SMTP id 4fb4d7f45d1cf-6507921efe9mr59078a12.6.1767631483506;
        Mon, 05 Jan 2026 08:44:43 -0800 (PST)
Received: from draszik.lan ([212.129.74.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-650762a2238sm208296a12.34.2026.01.05.08.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 08:44:43 -0800 (PST)
Message-ID: <d2c50afe586956ef3a60f17eb77b20fc73fe8dc8.camel@linaro.org>
Subject: Re: [PATCH v3 3/5] mfd: max77759: add register bitmasks and modify
 irq configs for charger
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Mon, 05 Jan 2026 16:45:17 +0000
In-Reply-To: <20251227-max77759-charger-v3-3-54e664f5ca92@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
	 <20251227-max77759-charger-v3-3-54e664f5ca92@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_084445_624563_CEC9F482 
X-CRM114-Status: GOOD (  13.63  )
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

T24gU2F0LCAyMDI1LTEyLTI3IGF0IDAwOjA0ICswMDAwLCBBbWl0IFN1bmlsIERoYW1uZSB2aWEg
QjQgUmVsYXkgd3JvdGU6Cj4gRnJvbTogQW1pdCBTdW5pbCBEaGFtbmUgPGFtaXRzZEBnb29nbGUu
Y29tPgo+IAo+IEFkZCByZWdpc3RlciBiaXRtYXNrcyBmb3IgY2hhcmdlciBmdW5jdGlvbi4KPiBJ
biBhZGRpdGlvbiBzcGxpdCB0aGUgY2hhcmdlciBJUlFzIGZ1cnRoZXIgc3VjaCB0aGF0IGVhY2gg
Yml0IHJlcHJlc2VudHMKPiBhbiBJUlEgZG93bnN0cmVhbSBvZiBjaGFyZ2VyIHJlZ21hcCBpcnEg
Y2hpcC4gSW4gYWRkaXRpb24gcG9wdWxhdGUgdGhlCj4gYWNrX2Jhc2UgdG8gb2ZmbG9hZCBpcnEg
YWNrIHRvIHRoZSByZWdtYXAgaXJxIGNoaXAgZnJhbWV3b3JrLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFtaXQgU3VuaWwgRGhhbW5lIDxhbWl0c2RAZ29vZ2xlLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMv
bWZkL21heDc3NzU5LmPCoMKgwqDCoMKgwqAgfMKgIDkxICsrKysrKysrKysrKysrKysrLS0KPiDC
oGluY2x1ZGUvbGludXgvbWZkL21heDc3NzU5LmggfCAyMDIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyNTYgaW5zZXJ0aW9u
cygrKSwgMzcgZGVsZXRpb25zKC0pCj4gCj4gWy4uLl0KPiDCoAo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L21mZC9tYXg3Nzc1OS5oIGIvaW5jbHVkZS9saW51eC9tZmQvbWF4Nzc3NTkuaAo+
IGluZGV4IGM2ZmFjZTM0ZTM4NS4uZTY3NGE1MTllNzgyIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgvbWZkL21heDc3NzU5LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21mZC9tYXg3Nzc1OS5o
Cj4gQEAgLTU5LDM1ICs1OSw2NSBAQAo+IMKgI2RlZmluZSBNQVg3Nzc1OV9NQVhRX1JFR19BUF9E
QVRBSU4wwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweGIxCj4gwqAjZGVmaW5lIE1BWDc3NzU5X01B
WFFfUkVHX1VJQ19TV1JTVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweGUwCj4gwqAKPiAtI2Rl
ZmluZSBNQVg3Nzc1OV9DSEdSX1JFR19DSEdfSU5UwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAweGIwCj4gLSNkZWZpbmUgTUFYNzc3NTlfQ0hHUl9SRUdfQ0hHX0lOVDLCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAweGIxCj4gLSNkZWZpbmUgTUFYNzc3NTlfQ0hHUl9SRUdfQ0hHX0lOVF9N
QVNLwqDCoMKgwqDCoMKgwqDCoMKgIDB4YjIKPiAtI2RlZmluZSBNQVg3Nzc1OV9DSEdSX1JFR19D
SEdfSU5UMl9NQVNLwqDCoMKgwqDCoMKgwqDCoCAweGIzCj4gLSNkZWZpbmUgTUFYNzc3NTlfQ0hH
Ul9SRUdfQ0hHX0lOVF9PS8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhiNAo+IC0jZGVmaW5lIE1B
WDc3NzU5X0NIR1JfUkVHX0NIR19ERVRBSUxTXzAwwqDCoMKgwqDCoMKgwqAgMHhiNQo+IC0jZGVm
aW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19ERVRBSUxTXzAxwqDCoMKgwqDCoMKgwqAgMHhiNgo+
IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19ERVRBSUxTXzAywqDCoMKgwqDCoMKgwqAg
MHhiNwo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19ERVRBSUxTXzAzwqDCoMKgwqDC
oMKgwqAgMHhiOAo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzAwwqDCoMKg
wqDCoMKgwqDCoMKgwqAgMHhiOQo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZH
XzAxwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhiYQo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVH
X0NIR19DTkZHXzAywqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhiYgo+IC0jZGVmaW5lIE1BWDc3NzU5
X0NIR1JfUkVHX0NIR19DTkZHXzAzwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhiYwo+IC0jZGVmaW5l
IE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzA0wqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhiZAo+
IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzA1wqDCoMKgwqDCoMKgwqDCoMKg
wqAgMHhiZQo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzA2wqDCoMKgwqDC
oMKgwqDCoMKgwqAgMHhiZgo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzA3
wqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhjMAo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NI
R19DTkZHXzA4wqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhjMQo+IC0jZGVmaW5lIE1BWDc3NzU5X0NI
R1JfUkVHX0NIR19DTkZHXzA5wqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhjMgo+IC0jZGVmaW5lIE1B
WDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzEwwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhjMwo+IC0j
ZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzExwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MHhjNAo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzEywqDCoMKgwqDCoMKg
wqDCoMKgwqAgMHhjNQo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzEzwqDC
oMKgwqDCoMKgwqDCoMKgwqAgMHhjNgo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19D
TkZHXzE0wqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhjNwo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1Jf
UkVHX0NIR19DTkZHXzE1wqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhjOAo+IC0jZGVmaW5lIE1BWDc3
NzU5X0NIR1JfUkVHX0NIR19DTkZHXzE2wqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhjOQo+IC0jZGVm
aW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzE3wqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhj
YQo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzE4wqDCoMKgwqDCoMKgwqDC
oMKgwqAgMHhjYgo+IC0jZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzE5wqDCoMKg
wqDCoMKgwqDCoMKgwqAgMHhjYwo+ICsjZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19JTlTC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhiMAo+ICsjZGVmaW5l
wqDCoCBNQVg3Nzc1OV9DSEdSX1JFR19DSEdfSU5UX0FJQ0zCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEJJVCg3KQo+ICsjZGVmaW5lwqDCoCBNQVg3Nzc1OV9DSEdSX1JFR19DSEdfSU5UX0NI
R0lOwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQklUKDYpCj4gKyNkZWZpbmXCoMKgIE1BWDc3
NzU5X0NIR1JfUkVHX0NIR19JTlRfV0NJTsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQklU
KDUpCj4gKyNkZWZpbmXCoMKgIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19JTlRfQ0hHwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJJVCg0KQo+ICsjZGVmaW5lwqDCoCBNQVg3Nzc1OV9DSEdS
X1JFR19DSEdfSU5UX0JBVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVQoMykKPiAr
I2RlZmluZcKgwqAgTUFYNzc3NTlfQ0hHUl9SRUdfQ0hHX0lOVF9JTkxJTcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEJJVCgyKQo+ICsjZGVmaW5lwqDCoCBNQVg3Nzc1OV9DSEdSX1JFR19DSEdf
SU5UX1RITTLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJJVCgxKQo+ICsjZGVmaW5lwqDC
oCBNQVg3Nzc1OV9DSEdSX1JFR19DSEdfSU5UX0JZUMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBCSVQoMCkKPiArI2RlZmluZSBNQVg3Nzc1OV9DSEdSX1JFR19DSEdfSU5UMsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhiMQo+ICsjZGVmaW5lwqDCoCBNQVg3
Nzc1OV9DSEdSX1JFR19DSEdfSU5UMl9JTlNFTMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVQo
NykKPiArI2RlZmluZcKgwqAgTUFYNzc3NTlfQ0hHUl9SRUdfQ0hHX0lOVDJfU1lTX1VWTE8xwqDC
oMKgwqDCoMKgwqDCoCBCSVQoNikKPiArI2RlZmluZcKgwqAgTUFYNzc3NTlfQ0hHUl9SRUdfQ0hH
X0lOVDJfU1lTX1VWTE8ywqDCoMKgwqDCoMKgwqDCoCBCSVQoNSkKPiArI2RlZmluZcKgwqAgTUFY
Nzc3NTlfQ0hHUl9SRUdfQ0hHX0lOVDJfQkFUX09JTE/CoMKgwqDCoMKgwqDCoMKgwqAgQklUKDQp
Cj4gKyNkZWZpbmXCoMKgIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19JTlQyX0NIR19TVEFfQ0PCoMKg
wqDCoMKgwqDCoCBCSVQoMykKPiArI2RlZmluZcKgwqAgTUFYNzc3NTlfQ0hHUl9SRUdfQ0hHX0lO
VDJfQ0hHX1NUQV9DVsKgwqDCoMKgwqDCoMKgIEJJVCgyKQo+ICsjZGVmaW5lwqDCoCBNQVg3Nzc1
OV9DSEdSX1JFR19DSEdfSU5UMl9DSEdfU1RBX1RPwqDCoMKgwqDCoMKgwqAgQklUKDEpCj4gKyNk
ZWZpbmXCoMKgIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19JTlQyX0NIR19TVEFfRE9ORcKgwqDCoMKg
wqAgQklUKDApCj4gKyNkZWZpbmUgTUFYNzc3NTlfQ0hHUl9SRUdfQ0hHX0lOVF9NQVNLwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhiMgo+ICsjZGVmaW5lIE1BWDc3NzU5X0NIR1Jf
UkVHX0NIR19JTlQyX01BU0vCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhiMwo+ICsj
ZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19JTlRfT0vCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgMHhiNAo+ICsjZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19ERVRB
SUxTXzAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweGI1Cj4gKyNkZWZpbmXCoMKgIE1B
WDc3NzU5X0NIR1JfUkVHX0NIR19ERVRBSUxTX09PX0NIR0lOX0RUTFPCoCBHRU5NQVNLKDYsIDUp
Cj4gKyNkZWZpbmUgTUFYNzc3NTlfQ0hHUl9SRUdfQ0hHX0RFVEFJTFNfMDHCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDB4YjYKPiArI2RlZmluZcKgwqAgTUFYNzc3NTlfQ0hHUl9SRUdfQ0hH
X0RFVEFJTFNfMDFfQkFUX0RUTFPCoMKgwqAgR0VOTUFTSyg2LCA0KQo+ICsjZGVmaW5lwqDCoCBN
QVg3Nzc1OV9DSEdSX1JFR19DSEdfREVUQUlMU18wMV9DSEdfRFRMU8KgwqDCoCBHRU5NQVNLKDMs
IDApCj4gKyNkZWZpbmUgTUFYNzc3NTlfQ0hHUl9SRUdfQ0hHX0RFVEFJTFNfMDLCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDB4YjcKPiArI2RlZmluZcKgwqAgTUFYNzc3NTlfQ0hHUl9SRUdf
Q0hHX0RFVEFJTFNfMDJfQ0hHSU5fU1RTwqDCoCBCSVQoNSkKPiArI2RlZmluZSBNQVg3Nzc1OV9D
SEdSX1JFR19DSEdfREVUQUlMU18wM8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhiOAo+
ICsjZGVmaW5lIE1BWDc3NzU5X0NIR1JfUkVHX0NIR19DTkZHXzAwwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAweGI5Cj4gKyNkZWZpbmXCoMKgIE1BWDc3NzU5X0NIR1JfUkVHX0NI
R19DTkZHXzAwX01PREXCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRU5NQVNLKDMsIDApCj4gKyNkZWZp
bmUgTUFYNzc3NTlfQ0hHUl9SRUdfQ0hHX0NORkdfMDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDB4YmEKPiArI2RlZmluZSBNQVg3Nzc1OV9DSEdSX1JFR19DSEdfQ05GR18wMsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhiYgo+ICsjZGVmaW5lwqDCoCBNQVg3
Nzc1OV9DSEdSX1JFR19DSEdfQ05GR18wMl9DSEdDQwnCoMKgwqDCoMKgwqAgR0VOTUFTSyg1LCAw
KQoKU21hbGwgbml0IC0gdGhlcmUgc2VlbXMgdG8gYmUgYSBzdHJheSBUQUIgaW4gdGhpcyBsaW5l
LgoKT3RoZXIgdGhhbiB0aGF0OgpSZXZpZXdlZC1ieTogQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRy
YXN6aWtAbGluYXJvLm9yZz4K


