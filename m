Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0341FC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNYYHyDoTjq9ruH2pMc+PQRugyOSPe4AkRs5fFJPTQE=; b=EdlV6X/emL4zkSYAxxcLHrLNag
	qDBCOcZvWSKZnueSZAo4UH2z+q1uVIkLQQ+LsnpdsB+HJB0cPWY5ekOEHR3dTb5x1BVCAX5DWTZNl
	wvHmthMwjypW78IUMtpY0cEiPPj/4eoGksYeQM540gQUxLMBRhiJqqXo1bVLVsf1Lmymat4dMPWd4
	u3+ppeD7gJRqXfGJ8HTJ+AwtPpywO8w2jSFyfA2Z3X4KS+qanAaM2sorzsn1Uq5DGxj8AKimei8PC
	tXNDnVTbsGEajFCX32utpwaio6L8fJc9KOcBfBGYA61fUIsZy3WZjj2mrTuZ5yJxTXeIFX0I4hL+J
	N1XOZGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w8v-00000004km0-0Sk3;
	Tue, 22 Sep 2026 08:46:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w8t-00000004klT-2K8S
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZNYYHyDoTjq9ruH2pMc+PQRugyOSPe4AkRs5fFJPTQE=; b=AGwBMY+VhGH3BnPBT308te4FiS
	awo/m7Wb7u51mJfa+Ro9RgZkzwaJ8FXPvztkmLl/InPRuGWpbuqi5uhqG17MAR0b+uq6yuxhRih9U
	jvYYicICZX+LawDjb2Jpvfvs20e1I+P2uOTYbpFazRsBIIkYCiTWHnmy0tbzqgb0t55IT6FuIwXbO
	DdJUHO40BoUiXJDGCrMHN1i1/EOgHH1+1z+jWC16U7URm/5rJeTWb7dWILGEWBuC4aZFNOOcKMzdm
	jVG5qyDWGFuZ46GSKYvcVe7lOPHSrAjW35awPxa0ex6+kqc4IYfh7bObSDyEDmVaBKBZFE8bUJT/Q
	F4nP8sVw==;
Received: from m16.mail.163.com ([117.135.210.3])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8w8q-0000000DI86-02oz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ZNYYHyDoTjq9ruH2pMc+PQRugyOSPe4AkRs5fFJPTQE=; b=J
	F/Z2oj9v7aECMMjsG1GDp5uhtng06Nzv351AWkLzFpfDA22B1llx2mniq2uvHIcD
	BFZLaHQAVK6iwfN/dc3/5BTd2XD4pVeIdvmKHiAWJz6Wau/KENWWfaY1NXYEP8wA
	MWLyuHMIGznNWUcGTXc+Hb8eKLjlUUJhUd2kPiAcLw=
Date: Tue, 22 Sep 2026 16:45:28 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Linus Walleij" <linusw@kernel.org>
Cc: longzhao@ambarella.com, "Arnd Bergmann" <arnd@arndb.de>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Jerome Brunet" <jbrunet@baylibre.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Jiri Slaby" <jirislaby@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, "Lee Jones" <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v8 08/18] gpiolib: regmap: add write_data_after_dir
 quirk
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAD++jLkSfPvuO=ZgqwYnbBBjxuu4ns1EDpHXQxKgWGqK9E130A@mail.gmail.com>
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-8-282ff5d98dda@ambarella.com>
 <CAD++jLkSfPvuO=ZgqwYnbBBjxuu4ns1EDpHXQxKgWGqK9E130A@mail.gmail.com>
X-NTES-SC: AL_Qu2SAvyduU8p7iKZZekcn0wRhug/UMa4u/sm3YNXc84FpwPw5QMjZmNDNHL32tKTBxilqxOseRpTx8lTXqZ3sj05Ju8ZRNM+t6w3+JxA7Q==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5360c3b9.7b09.1a0c84a9d1d.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gygvCgDnN1YoQLJq3sAVAA--.40231W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxQhh0mqyQCix7gAA3R
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094620_630498_725BA931 
X-CRM114-Status: GOOD (  16.59  )
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

SGkgTGludXMsCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCkkgd2lsbCBkbyBpbiB0aGUgbmV4dCBy
ZXZpc2lvbi4KCkJlc3QgcmVnYXJkcywKTG9uZyBaaGFvCgpBdCAyMDI2LTA5LTIyIDE1OjE3OjQ4
LCAiTGludXMgV2FsbGVpaiIgPGxpbnVzd0BrZXJuZWwub3JnPiB3cm90ZToKPkhpIExvbmcsCj4K
PnRoaXMgaXMgc3RhcnRpbmcgdG8gbG9vayBnb29kIQo+Cj5PbiBNb24sIFNlcCAyMSwgMjAyNiBh
dCA2OjIz4oCvQU0gTG9uZyBaaGFvIHZpYSBCNCBSZWxheQo+PGRldm51bGwrbG9uZ3poYW8uYW1i
YXJlbGxhLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPgo+PiBGcm9tOiBMb25nIFpoYW8gPGxvbmd6
aGFvQGFtYmFyZWxsYS5jb20+Cj4+Cj4+IFNvbWUgY29udHJvbGxlcnMgaWdub3JlIGRhdGEtcmVn
aXN0ZXIgd3JpdGVzIHdoaWxlIGEgbGluZSBpcyBzdGlsbCBhbgo+PiBpbnB1dC4gT3B0aW9uYWxs
eSB3cml0ZSB0aGUgb3V0cHV0IHZhbHVlIGFnYWluIGFmdGVyIHN3aXRjaGluZyB0aGUKPj4gZGly
ZWN0aW9uLCBtYXRjaGluZyB0aGUgZXhpc3RpbmcgUEwwNjEgYmVoYXZpb3VyLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBMb25nIFpoYW8gPGxvbmd6aGFvQGFtYmFyZWxsYS5jb20+Cj4oLi4uKQo+Cj4+
ICsrKyBiL2luY2x1ZGUvbGludXgvZ3Bpby9yZWdtYXAuaAo+PiBAQCAtNDgsNiArNDgsMTMgQEAg
c3RydWN0IHJlZ21hcDsKPj4gICAqICAgICAgICAgICAgICAgICAgICAgKE9wdGlvbmFsKSBCaXRt
YXAgcmVwcmVzZW50aW5nIHRoZSBmaXhlZCBkaXJlY3Rpb24gb2YKPj4gICAqICAgICAgICAgICAg
ICAgICAgICAgdGhlIEdQSU8gbGluZXMuIFVzZWZ1bCB3aGVuIHRoZXJlIGFyZSBHUElPIGxpbmVz
IHdpdGggYQo+PiAgICogICAgICAgICAgICAgICAgICAgICBmaXhlZCBkaXJlY3Rpb24gbWl4ZWQg
dG9nZXRoZXIgaW4gdGhlIHNhbWUgcmVnaXN0ZXIuCj4+ICsgKiBAd3JpdGVfZGF0YV9hZnRlcl9k
aXI6Cj4+ICsgKiAgICAgICAgICAgICAgICAgICAgIChPcHRpb25hbCkgV3JpdGUgdGhlIG91dHB1
dCB2YWx1ZSBhZ2FpbiBhZnRlcgo+PiArICogICAgICAgICAgICAgICAgICAgICBzd2l0Y2hpbmcg
YSBsaW5lIHRvIG91dHB1dCBpbiAtPmRpcmVjdGlvbl9vdXRwdXQoKS4KPj4gKyAqICAgICAgICAg
ICAgICAgICAgICAgTmVlZGVkIGZvciBoYXJkd2FyZSB3aGljaCBpZ25vcmVzIGRhdGEgcmVnaXN0
ZXIKPj4gKyAqICAgICAgICAgICAgICAgICAgICAgd3JpdGVzIHdoaWxlIHRoZSBsaW5lIGlzIGNv
bmZpZ3VyZWQgYXMgYW4gaW5wdXQuCj4+ICsgKiAgICAgICAgICAgICAgICAgICAgIFRoaXMgaXMg
YSBsZWdhY3kgcXVpcmsgKGUuZy4gQVJNIFBMMDYxKTsgbmV3IGhhcmR3YXJlCj4+ICsgKiAgICAg
ICAgICAgICAgICAgICAgIG11c3Qgbm90IHVzZSBpdC4gRGlyZWN0aW9uIGNoYW5nZXMgd2lsbCBn
bGl0Y2guCj4+ICAgKiBAZHJ2ZGF0YTogICAgICAgICAgIChPcHRpb25hbCkgUG9pbnRlciB0byBk
cml2ZXIgc3BlY2lmaWMgZGF0YSB3aGljaCBpcwo+PiAgICogICAgICAgICAgICAgICAgICAgICBu
b3QgdXNlZCBieSBncGlvLXJlbWFwIGJ1dCBpcyBwcm92aWRlZCAiYXMgaXMiIHRvIHRoZQo+PiAg
ICogICAgICAgICAgICAgICAgICAgICBkcml2ZXIgY2FsbGJhY2socykuCj4+IEBAIC05NCw2ICsx
MDEsNyBAQCBzdHJ1Y3QgZ3Bpb19yZWdtYXBfY29uZmlnIHsKPj4gICAgICAgICB1bnNpZ25lZCBp
bnQgcmVnX2Rpcl9vdXRfYmFzZTsKPj4gICAgICAgICBpbnQgcmVnX3N0cmlkZTsKPj4gICAgICAg
ICBpbnQgbmdwaW9fcGVyX3JlZzsKPj4gKyAgICAgICBib29sIHdyaXRlX2RhdGFfYWZ0ZXJfZGly
Owo+PiAgICAgICAgIHN0cnVjdCBpcnFfZG9tYWluICppcnFfZG9tYWluOwo+PiAgICAgICAgIHVu
c2lnbmVkIGxvbmcgKmZpeGVkX2RpcmVjdGlvbl9tYXNrOwo+PiAgICAgICAgIHVuc2lnbmVkIGxv
bmcgKmZpeGVkX2RpcmVjdGlvbl9vdXRwdXQ7Cj4KPjEuIFlvdSBoYXZlIHB1dCB0aGUga2VybmVs
ZG9jIGluIGEgY29tcGxldGVseSBkaWZmZXJlbnQgcGxhY2UgaW4gdGhlIG9yZGVyCj5vZiB0aGlu
ZyB0aGFuIHdoZXJlIHlvdSBwdXQgdGhlIGZsYWcgaW4gdGhlIHN0cnVjdC4KPgo+Mi4gUHV0IGEg
Y29tbWVudCBhYm92ZSB0aGUgYmVoYXZpb3VyIGZsYWdzIGJlY2F1c2UgdGhlcmUgd2lsbAo+aW52
YXJpYWJseSBiZSBtb3JlIG9mIHRoZW0hIFNvbWV0aGluZyBsaWtlOgo+LyogUmVnbWFwIEdQSU8g
YmVoYXZpb3VyIGZsYWdzICovCj4KPjMuIFB1dCBhIG5ld2xpbmUgYmVmb3JlICYgYWZ0ZXIgdGhl
IGZsYWdzIHNvIHRoZXkgZW5kIHVwIGluIGEgc2VwYXJhdGUKPnNlY3Rpb24gb2YgdGhlIHN0cnVj
dCwgc28gcGVvcGxlIGtub3cgd2hlcmUgdG8gYWRkIHRoZW0uCj4KPkkgd291bGQgcHV0IHRoZW06
Cj4KPiAgICAgICAgc3RydWN0IGRldmljZSAqcGFyZW50Owo+ICAgICAgICBzdHJ1Y3QgcmVnbWFw
ICpyZWdtYXA7Cj4gICAgICAgIHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGU7Cj4KPiAgICAg
ICAgY29uc3QgY2hhciAqbGFiZWw7Cj4gICAgICAgIGludCBuZ3BpbzsKPiAgICAgICAgY29uc3Qg
Y2hhciAqY29uc3QgKm5hbWVzOwo+Cj5IRVJFCj4KPiAgICAgICAgdW5zaWduZWQgaW50IHJlZ19k
YXRfYmFzZTsKPiAgICAgICAgdW5zaWduZWQgaW50IHJlZ19zZXRfYmFzZTsKPgo+WW91cnMsCj5M
aW51cyBXYWxsZWlqCg==

