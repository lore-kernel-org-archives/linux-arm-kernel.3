Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AF3D64066
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBes01HIGxCY9uAMUwOSqshjVdaMRIIeY82NB1cajGY=; b=SCW/Zj8gvc10iZcjmvVV3kBe3R
	XWFRIWaBKHmnv2O4fBNV8cgn9oUX27tJGt7UZQD1rTgqJb9BeJXfz6hixwuknos9LRmH9nrDyR6o3
	Lpm/7rKzg6Ukef7ADx5LKF1pe88ulVZjwx1KSojdBZ5Cl3iWH2a64p+xcjFTDgfuqivUl5dP4QTYv
	uaupRBRFnYPKqw345wcKQ7SoN23pXRR1ckAs2Rl8wHqRC1NFhpKPuKJ4mGiEMP5jCaikE/4Rahi+J
	8t60vNJ/lfKqIQbTrzq4bq2SfxmiJicCoD7VEXJCfe5fGT4FArlh5lc1PL94T6bRVFBeJRiTh/mXu
	LV39DzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rtr-0000000BDK6-3x5n;
	Fri, 08 Nov 2024 16:31:55 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qvj-0000000B1jP-1fqH;
	Fri, 08 Nov 2024 15:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=iQMcJa4BmFPVqKmXobn4cIhRx4UhLAzJDxklpcxlLI8=; b=H
	aUjtcWHDFt1bKqSXkqJGs1dRc5kfURcXD/snEVL02VfzHVmJDJvgfdNFSH25sFJS
	e/QmXTeDXcuNeFVAyRIvkZptmIV0qg/a2iU0Q4ogCM+qEHNRN03W89MpCkKtr4sE
	EYlKvW6V2O6HdedRW0CAf+PWbdmw0x1Jl4G7mFEXQs=
Received: from 00107082$163.com ( [111.35.191.191] ) by
 ajax-webmail-wmsvr-40-148 (Coremail) ; Fri, 8 Nov 2024 23:28:00 +0800 (CST)
X-Originating-IP: [111.35.191.191]
Date: Fri, 8 Nov 2024 23:28:00 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Thomas Gleixner" <tglx@linutronix.de>
Cc: richard.henderson@linaro.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, guoren@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, James.Bottomley@HansenPartnership.com, 
	deller@gmx.de, mpe@ellerman.id.au, paul.walmsley@sifive.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, 
	glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org
Subject: Re: [PATCH] kernel/irq/proc: performance: replace seq_printf with
 seq_put_decimal_ull_width
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <87r07lol9y.ffs@tglx>
References: <20241103080552.4787-1-00107082@163.com> <87r07lol9y.ffs@tglx>
X-NTES-SC: AL_Qu2YA/yctk4j5iSfbOkZnEYQheY4XMKyuPkg1YJXOp80uSbP/wc5cnBJEkHY4sOvLTmSvxeqUTR3+8t1RrNYQqbBTxgILkv4stMHL//JBWTB
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <3319cd6e.b980.1930c63b1e5.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: lCgvCgD3fwoBLi5nnLAiAA--.7283W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqQKRqmcuF0eQdwACss
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_072948_362857_147A8DB8 
X-CRM114-Status: UNSURE (   6.63  )
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

SGksICAKCkF0IDIwMjQtMTEtMDggMjI6MjU6MTMsICJUaG9tYXMgR2xlaXhuZXIiIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+RGF2aWQhCj4KPk9uIFN1biwgTm92IDAzIDIwMjQgYXQgMTY6
MDUsIERhdmlkIFdhbmcgd3JvdGU6Cj4KPiRTdWJqZWN0OiBbUEFUQ0hdIGtlcm5lbC9pcnEvcHJv
YzogcGVyZm9ybWFuY2U6IC4uLgo+Cj5UaGF0J3Mgbm90IGEgdmFsaWQgc3Vic3lzdGVtIHByZWZp
eC4KCmNvcHkgdGhhdH4KCj4KPj4gc2VxX3ByaW50ZiBpcyBjb3N0eSwgd2hlbiBzdHJlc3MgcmVh
ZGluZyAvcHJvYy9pbnRlcnJ1cHRzLCBwcm9maWxpbmcgaW5kaWNhdGVzCj4+IHNlcV9wcmludGYg
dGFrZXMgYWJvdXQgfjQ3JSBvZiBzaG93X2ludGVycnVwdHMgc2FtcGxlczoKPgo+QWxzbyBwbGVh
c2UgZm9sbG93IHRoZSBkb2N1bWVudGF0aW9uIGZvciBkZW5vdGluZyBmdW5jdGlvbnMgaW4gY2hh
bmdlCj5sb2dzOgo+Cj5odHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9j
ZXNzL21haW50YWluZXItdGlwLmh0bWwjZnVuY3Rpb24tcmVmZXJlbmNlcy1pbi1jaGFuZ2Vsb2dz
Cj4KCmNvcHkgdGhhdH4KCj4+ICBhcmNoL2FscGhhL2tlcm5lbC9pcnEuYyAgICAgfCAgIDggKy0t
Cj4+ICBhcmNoL2FybS9rZXJuZWwvc21wLmMgICAgICAgfCAgIDQgKy0KPj4gIGFyY2gvYXJtNjQv
a2VybmVsL3NtcC5jICAgICB8ICAgMyArLQo+PiAgYXJjaC9jc2t5L2tlcm5lbC9zbXAuYyAgICAg
IHwgICA0ICstCj4+ICBhcmNoL2xvb25nYXJjaC9rZXJuZWwvc21wLmMgfCAgIDIgKy0KPj4gIGFy
Y2gvcGFyaXNjL2tlcm5lbC9pcnEuYyAgICB8ICAzNCArKysrKystLS0tLS0KPj4gIGFyY2gvcG93
ZXJwYy9rZXJuZWwvaXJxLmMgICB8ICA0NCArKysrKysrKy0tLS0tLS0tCj4+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9zbXAuYyAgICAgfCAgIDMgKy0KPj4gIGFyY2gvc2gva2VybmVsL2lycS5jICAgICAg
ICB8ICAgNCArLQo+PiAgYXJjaC9zcGFyYy9rZXJuZWwvaXJxXzMyLmMgIHwgIDEyICsrLS0tCj4+
ICBhcmNoL3NwYXJjL2tlcm5lbC9pcnFfNjQuYyAgfCAgIDQgKy0KPj4gIGFyY2gveDg2L2tlcm5l
bC9pcnEuYyAgICAgICB8IDEwMCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0K
Pj4gIGFyY2gveHRlbnNhL2tlcm5lbC9pcnEuYyAgICB8ICAgMiArLQo+PiAgYXJjaC94dGVuc2Ev
a2VybmVsL3NtcC5jICAgIHwgICA0ICstCj4+ICBrZXJuZWwvaXJxL3Byb2MuYyAgICAgICAgICAg
fCAgIDYgKystCj4KPlRoZXJlIGlzIG5vIGRlcGVuZGVuY3kgb24gdGhlc2UgY2hhbmdlcy4gU28g
cGxlYXNlIHNwbGl0IHRoZW0gdXAgaW50bwo+c2VwZXJhdGUgcGF0Y2hlcyBmb3IgY29yZSBhbmQg
dGhlIGluZGl2aWR1YWwgYXJjaGl0ZWN0dXJlcy5hbgoKVGhhbmtzIGZvciBhbGwgdGhlIHJldmll
dywgSSB3aWxsIG1ha2UgYSBwYXRjaHNldCBmb3IgdGhpcy4KPgo+VGhhbmtzLAo+Cj4gICAgICAg
IHRnbHgKCgpEYXZpZA==

