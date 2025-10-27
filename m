Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A698CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 02:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZ9Rmky0Ju7/r3CCR8vvqxWiziSgV9uMm0GnpAYq7PM=; b=lkeeu57Ol+bmmU8gd1c8xbkomt
	kf5mFicb2HoGsybT9/fDm99TfeopUHCd3bzcuXN6VSz78H3v0wVBOQlYbNaTeojcRxZWMOx1TxJP6
	gH9z+LmiBczOcybyg/Tj+kWafOSQiez9q3EPdXC6ZcahqvJ48f4pulkTHKXygsl+mIcO6sWznX3VL
	qX6e9l6IB/3Lixg2Mxeihq7qVbjwUxzp0uK2iDLhxT/CFFZ+B5ovz1DvNCfpcYqUF13vszMr3DIjL
	+47UlGKBiKbBS4VkjPUxDSeg1sM1DmZSbwMPd3z9DKN9v9Bzq/U05V63tjLX4SY4sVAMl5RmyfG+p
	d+YVY/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCbO-0000000Czt9-0I8z;
	Mon, 27 Oct 2025 02:04:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCbL-0000000Czrt-1nKm;
	Mon, 27 Oct 2025 02:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wZ9Rmky0Ju7/r3CCR8vvqxWiziSgV9uMm0GnpAYq7PM=; b=NIaKL02x4DHJyCw9haw8Kk7d8M
	mSJJYNMr244RzN4ocDdrFn4gkf2u6O5ybjxu1Oc5VmsfYQmHugercM+q10gtWAT4Rl8i6NAqiqXYt
	LmSgG+hr6Nlz6/IsMR8C6qNJ9ubw31X57dK06kBNgrHrmTbmp5siWrk2TTKKMyiBaZTWakfGAUA7F
	iUlopW23j8LoB0BeQhSMrdmWOO+6h+Go4ex/dcYv8Iz4ULWTc1krcER57mcVKiSs+0Rq1lcGKtbI4
	uhgaEibuORMZZETpyyNvS4nyBppvBaCoPComylwpJqeNMlH/FUNq0gtqDedpb66eH0JrICKIWTIEY
	tq/n/Mrw==;
Received: from m16.mail.163.com ([117.135.210.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBjH-00000001EGv-3ig5;
	Mon, 27 Oct 2025 01:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=td4L7MLtFab0E+yv45f4US5pOy9YUbhDBrZdLxXlFro=; b=G
	mXYF015/H0xaxb8xZMf9LEepSD1RkeYpF4xpZjEzndTMnm5r/8xdrqZE8V1Gs71U
	eIKvONZUuK3unNzNoAJn1wFLWppRtTKDvEZVahdu/py6MlvCoyMaXqGLsb7+l7uE
	+iiPhycpaQRBmKPw69MSACw+k+wS7DqpJabRB0YHWc=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Mon, 27 Oct 2025 10:03:57 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 27 Oct 2025 10:03:57 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: "Heiko Stuebner" <heiko@sntech.de>,
	"Quentin Schulz" <quentin.schulz@cherry.de>, mturquette@baylibre.com,
	sboyd@kernel.org, zhangqing@rock-chips.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH] clk: rockchip: rk3588: Don't change PLL rates when
 setting dclk_vop2_src
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <j6ondk5xnwbm36isdoni5vtdq5mf5ak4kp63ratqlnpwsgrqj2@paw5lzwqa2ze>
References: <20251008133135.3745785-1-heiko@sntech.de>
 <2749454.BddDVKsqQX@diego>
 <eumxn7lvp34si2gik33hcavcrsstqqoxixiznjbertxars7zcx@xsycorjhj3id>
 <4856104.usQuhbGJ8B@phil>
 <j6ondk5xnwbm36isdoni5vtdq5mf5ak4kp63ratqlnpwsgrqj2@paw5lzwqa2ze>
X-NTES-SC: AL_Qu2dA/mYv04o4SacYukfmUgWjuw/WsG1v/Ul1YBSP556jC/r9AQFYUF9G1/47+GNFiCiuyqKVwhE0uhmb5F8ZYQUU2a0aDa9tFCtXmfgYh43rA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7fb0eadb.1d09.19a23686d5a.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgA3eIQN0_5oSN8TAA--.1306W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgfzXmj+zQBbegAFsH
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_010909_786871_50517036 
X-CRM114-Status: GOOD (  33.72  )
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

CkhlbGxvLAoKQXQgMjAyNS0xMC0yMSAwMDowMDo1OSwgIlNlYmFzdGlhbiBSZWljaGVsIiA8c2Vi
YXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj5IaSwKPgo+T24gTW9uLCBPY3Qg
MjAsIDIwMjUgYXQgMDI6NDk6MTBQTSArMDIwMCwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6Cj4+IEFt
IERvbm5lcnN0YWcsIDE2LiBPa3RvYmVyIDIwMjUsIDAwOjU3OjE1IE1pdHRlbGV1cm9ww6Rpc2No
ZSBTb21tZXJ6ZWl0IHNjaHJpZWIgU2ViYXN0aWFuIFJlaWNoZWw6Cj4+ID4gT24gV2VkLCBPY3Qg
MTUsIDIwMjUgYXQgMDM6Mjc6MTJQTSArMDIwMCwgSGVpa28gU3TDvGJuZXIgd3JvdGU6Cj4+ID4g
PiBBbSBNaXR0d29jaCwgMTUuIE9rdG9iZXIgMjAyNSwgMTQ6NTg6NDYgTWl0dGVsZXVyb3DDpGlz
Y2hlIFNvbW1lcnplaXQgc2NocmllYiBRdWVudGluIFNjaHVsejoKPj4gPiA+ID4gT24gMTAvOC8y
NSAzOjMxIFBNLCBIZWlrbyBTdHVlYm5lciB3cm90ZToKPj4gPiA+ID4gPiBkY2xrX3ZvcDJfc3Jj
IGN1cnJlbnRseSBoYXMgQ0xLX1NFVF9SQVRFX1BBUkVOVCB8IENMS19TRVRfUkFURV9OT19SRVBB
UkVOVAo+PiA+ID4gPiA+IGZsYWdzIHNldCwgd2hpY2ggaXMgdmFzdGx5IGRpZmZlcmVudCB0aGFu
IGRjbGtfdm9wMF9zcmMgb3IgZGNsa192b3AxX3NyYywKPj4gPiA+ID4gPiB3aGljaCBoYXZlIG5v
bmUgb2YgdGhvc2UuCj4+ID4gPiA+ID4gCj4+ID4gPiA+ID4gV2l0aCB0aGVzZSBmbGFncyBpbiBk
Y2xrX3ZvcDJfc3JjLCBhY3R1YWxseSBzZXR0aW5nIHRoZSBjbG9jayB0aGVuIHJlc3VsdHMKPj4g
PiA+ID4gPiBpbiBhIGxvdCBvZiBvdGhlciBwZXJpcGhlcmFscyBicmVha2luZywgYmVjYXVzZSBz
ZXR0aW5nIHRoZSByYXRlIHJlc3VsdHMKPj4gPiA+ID4gPiBpbiB0aGUgUExMIHNvdXJjZSBnZXR0
aW5nIGNoYW5nZWQ6Cj4+ID4gPiA+ID4gCj4+ID4gPiA+ID4gWyAgIDE0Ljg5ODcxOF0gY2xrX2Nv
cmVfc2V0X3JhdGVfbm9sb2NrOiBzZXR0aW5nIHJhdGUgZm9yIGRjbGtfdm9wMiB0byAxNTI4NDAw
MDAKPj4gPiA+ID4gPiBbICAgMTUuMTU1MDE3XSBjbGtfY2hhbmdlX3JhdGU6IHNldHRpbmcgcmF0
ZSBmb3IgcGxsX2dwbGwgdG8gMTY4MDAwMDAwMAo+PiA+ID4gPiA+IFsgY2xrIGFkanVzdGluZyBl
dmVyeSBncGxsIHVzZXIgXQo+PiA+ID4gPiA+IAo+PiA+ID4gPiA+IFRoaXMgaW5jbHVkZXMgcG9z
c2libHkgdGhlIG90aGVyIHZvcHMsIGkycywgc3BkaWYgYW5kIGV2ZW4gdGhlIHVhcnRzLgo+PiA+
ID4gPiA+IEFtb25nIG90aGVyIHBvc3NpYmxlIHRoaW5ncywgdGhpcyBicmVha3MgdGhlIHVhcnQg
Y29uc29sZSBvbiBhIGJvYXJkCj4+ID4gPiA+ID4gSSB1c2UuIFNvbWV0aW1lcyBpdCByZWNvdmVy
cyBsYXRlciBvbiwgYnV0IHRoZXJlIHdpbGwgYmUgYSBiaWcgYmxvY2sKPj4gPiA+ID4gCj4+ID4g
PiA+IEkgY2FuIHJlcHJvZHVjZSBvbiB0aGUgc2FtZSBib2FyZCBhcyB5b3VycyBhbmQgdGhpcyBm
aXhlcyB0aGUgaXNzdWUgCj4+ID4gPiA+IGluZGVlZCAobm90ZSBJIGNhbiBvbmx5IHJlcHJvZHVj
ZSBmb3Igbm93IHdoZW4gZGlzcGxheSB0aGUgbW9kZXRlc3QgCj4+ID4gPiA+IHBhdHRlcm4sIG90
aGVyd2lzZSBhZnRlciBib290IHRoZSBjb25zb2xlIHNlZW1zIGZpbmUgdG8gbWUpLgo+PiA+ID4g
Cj4+ID4gPiBJIGJvb3QgaW50byBhIERlYmlhbiByb290ZnMgd2l0aCBmYmNvbiBvbiBteSBzeXN0
ZW0sIGFuZCB0aGUgc2VyaWFsCj4+ID4gPiBjb25zb2xlIHByb2R1Y2VzIGdhcmJsZWQgb3V0cHV0
IHdoZW4gdGhlIHZvcCBhZGp1c3RzIHRoZSBjbG9jawo+PiA+ID4gCj4+ID4gPiBTb21ldGltZXMg
aXQgcmVjb3ZlcnMgYWZ0ZXIgYSBiaXQsIGJ1dCBvdGhlciB0aW1lcyBpdCBkb2Vzbid0Cj4+ID4g
PiAKPj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBj
aGVycnkuZGU+Cj4+ID4gPiA+IFRlc3RlZC1ieTogUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2No
dWx6QGNoZXJyeS5kZT4gIyBSSzM1ODggVGlnZXIgdy9EUCBjYXJyaWVyYm9hcmQKPj4gPiAKPj4g
PiBJJ20gcHJldHR5IHN1cmUgSSd2ZSBzZWVuIHRoaXMgd2hpbGUgcGxheWluZyB3aXRoIFVTQi1D
IERQIEFsdE1vZGUKPj4gPiBvbiBSb2NrIDVCLiBTbyBmYXIgSSBoYWQgbm8gdGltZSB0byBpbnZl
c3RpZ2F0ZSBmdXJ0aGVyLgo+PiA+IAo+PiA+IFdoYXQgSSdtIG1pc3NpbmcgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlIGlzIHRoZSBpbXBhY3Qgb24gVk9QLiBBbHNvCj4+ID4gaXQgbWlnaHQgYmUgYSBn
b29kIGlkZWEgdG8gaGF2ZSBBbmR5IGluIENjLCBzbyBJJ3ZlIGFkZGVkIGhpbS4KPj4gCj4+IEht
bSwgaXQgYnJpbmdzIFZQMiBpbiBsaW5lIHdpdGggdGhlIG90aGVyIHR3byBWUHMsIG9ubHkgVlAy
IGhhZCB0aGlzCj4+IHNwZWNpYWwgc2V0dGluZyAtIGV2ZW4gcmlnaHQgZnJvbSB0aGUgc3RhcnQs
IHNvIGl0IGNvdWxkIHZlcnkgd2VsbAo+PiBoYXZlIGJlZW4gbGVmdCB0aGVyZSBhY2NpZGVudGlh
bGx5IGR1cmluZyBzdWJtaXNzaW9uLgo+Cj5JIGRpZCB0aGUgaW5pdGlhbCB1cHN0cmVhbSBzdWJt
aXNzaW9uIGJhc2VkIG9uIGRvd25zdHJlYW0gKHRoZSBUUk0KPmlzIHF1aXRlIGJhZCByZWdhZGlu
ZyBkZXNjcmliaW5nIHRoZSBjbG9jayB0cmVlcywgc28gbm90IG11Y2gKPnZhbGlkYXRpb24gaGFz
IGJlZW4gZG9uZSBieSBtZSkuIFRoZSBvbGQgdmVuZG9yIGtlcm5lbCB0cmVlIGhhZCBpdAo+bGlr
ZSB0aGlzLCBidXQgdGhhdCBhbHNvIGNoYW5nZWQgYSBiaXQgb3ZlciB0aW1lIGFmdGVyd2FyZHMg
YW5kIG5vCj5sb25nZXIgaGFzIGFueSBzcGVjaWFsIGhhbmRsaW5nIGZvciBWUDIuIE9UT0ggaXQg
ZG9lcyBzZXQKPkNMS19TRVRfUkFURV9OT19SRVBBUkVOVCBmb3IgYWxsIGRjbGtfdm9wPG51bWJl
cj5fc3JjLCB3aGljaCB5b3UKPmFyZSBub3cgcmVtb3ZpbmcgZm9yIFZQMi4KPgo+RldJVyB0aGVz
ZSBhcmUgdGhlIHR3byBmbGFnczoKPgo+I2RlZmluZSBDTEtfU0VUX1JBVEVfUEFSRU5UICAgICBC
SVQoMikgLyogcHJvcGFnYXRlIHJhdGUgY2hhbmdlIHVwIG9uZSBsZXZlbCAqLwo+I2RlZmluZSBD
TEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQgQklUKDcpIC8qIGRvbid0IHJlLXBhcmVudCBvbiByYXRl
IGNoYW5nZSAqLwo+Cj5TbyBieSByZW1vdmluZyBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQgeW91
IGFyZSBhbGxvd2luZyBkY2xrX3ZvcDJfc3JjCj50byBiZSBzd2l0Y2hlZCB0byBhIGRpZmZlcmVu
dCBQTEwgd2hlbiBhIGRpZmZlcmVudCByYXRlIGlzIGJlaW5nCj5yZXF1ZXN0ZWQuIFRoYXQgY2hh
bmdlIGlzIGNvbXBsZXRsZXkgdW5yZWxhdGVkIHRvIHRoZSBidWcgeW91IGFyZQo+c2VlaW5nIHJp
Z2h0IG5vdz8KPgo+PiBTbyBpbiB0aGUgZW5kIFZQMiB3aWxsIGhhdmUgdG8gZGVhbCB3aXRoIHRo
aXMsIGJlY2F1c2Ugd2hlbiB0aGUgVlAKPj4gY2F1c2VzIGEgcmF0ZSBjaGFuZ2UgaW4gdGhlIEdQ
TEwsIHRoaXMgY2hhbmdlcyBzbyBtYW55IGNsb2NrcyBvZgo+PiBvdGhlciBwb3NzaWJseSBydW5u
aW5nIGRldmljZXMuIE5vdCBvbmx5IHRoZSB1YXJ0LCBidXQgYWxzbyBlbW1jCj4+IGFuZCBtYW55
IG1vcmUuIEFuZCBhbGwgdGhvc2UgZGV2aWNlcyBkbyBub3QgbGlrZSBpZiB0aGVpciBjbG9jayBn
ZXRzCj4+IGNoYW5nZWQgdW5kZXIgdGhlbSBJIHRoaW5rLgo+Cj5JdCdzIGNlcnRhaW5seSB3ZWly
ZCwgdGhhdCBWUDIgd2FzIChhbmQgc3RpbGwgaXMgaW4gdXBzdHJlYW0pIGhhbmRsZWQKPnNwZWNp
YWwuIE5vdGUgdGhhdCBHUExMIGJlaW5nIGNoYW5nZWQgaXMgbm90IHJlYWxseSBuZWNlc3Nhcnku
Cj5kY2xrX3ZvcDJfc3JjIHBhcmVudCBjYW4gYmUgR1BMTCwgQ1BMTCwgVjBQTEwgb3IgQVVQTEwu
IEVmZmVjdHMgb24KPm90aGVyIGhhcmR3YXJlIElQIHZlcnkgbXVjaCBkZXBlbmRzIG9uIHRoZSBw
YXJlbnQgc2V0dXAuIFdoYXQgSSB0cnkKPnRvIHVuZGVyc3RhbmQgaXMgaWYgdGhlcmUgaXMgYWxz
byBhIGJ1ZyBpbiB0aGUgcm9ja2NoaXBkcm0gZHJpdmVyCj5hbmQvb3IgaWYgcmVtb3ZpbmcgQ0xL
X1NFVF9SQVRFX05PX1JFUEFSRU5UIGlzIGEgZ29vZCBpZGVhLiBUaGF0J3MKPndoeSBJIGhvcGVk
IEFuZHkgY291bGQgY2hpbWUgaW4gYW5kIHByb3ZpZGUgc29tZSBiYWNrZ3JvdW5kIDopCgpUaGUg
bWFpbiBsaW1pdGF0aW9uIGlzIHRoYXQgdGhlcmUgYXJlIG5vdCBlbm91Z2ggUExMcyBvbiB0aGUg
U29DIHRvIGJlIHVzZWQgZm9yIHRoZSBkaXNwbGF5IHNpZGUuIApJbiBvdXIgZG93bnN0cmVhbSBj
b2RlIGltcGxlbWVudGF0aW9uLCB3ZSB1c3VhbGx5IGV4Y2x1c2l2ZWx5IGFzc2lnbiBWMFBMTCB0
byBhIGNlcnRhaW4gVlAuCk90aGVyIFZQcyBnZW5lcmFsbHkgbmVlZCB0byBzaGFyZSB0aGUgUExM
IHdpdGggb3RoZXIgcGVyaXBoZXJhbHMgLCBvciB1c2UgdGhlIEhETUkgUEhZIFBMTC4KCkZvciBH
UExMIGFuZCBDUExMLCAgdGhleSB3aWxsIGJlIHNldCB0byBhIGZpeGVkIGZyZXF1ZW5jeSBkdXJp
bmcgdGhlIHN5c3RlbSBzdGFydHVwIHN0YWdlLCBhbmQKdGhleSBzaG91bGQgbm90IGJlIG1vZGlm
aWVkIGFnYWluIGFzIHRoZXNlIHR3byBQTEwgYWx3YXlzIHNoYXJlZCBieSBvdGhlciBwZXJpcGhl
cmFscy4KCldoZW4gc2hhcmVkIHdpdGggb3RoZXIgcGVyaXBoZXJhbHMsICB3ZSBjYW4gbm90IGRv
IENMS19TRVRfUkFURV9QQVJFTlQsLgpIb3dldmVyLCB3aGVuIHdlIG5lZWQgYSByZWxhdGl2ZWx5
IHByZWNpc2UgZnJlcXVlbmN5IGluIGNlcnRhaW4gc2NlbmFyaW9zLCBzdWNoIGFzIGRyaXZpbmcg
YW4gZURQCm9yIERTSSBwYW5lbO+8iHNlZSB3aGF0IHdlIGRvIGZvciBlRFAgb24gcmszNTg4cy1l
dmIxLXYxMC5kdHMgYW5kIHJrMzU4OC1jb29scGktY201LWdlbmJvb2suZHRzIO+8iSwgCndlIHRl
bmQgdG8gdXNlIFYwUExMLiBCdXQgc2luY2UgVjBQTEwgZG9lcyBub3QgcHJvcGVyIGluaXRpYWxp
emF0ZWQgYXQgc3lzdGVtIHN0YXJ0dXAsIHdlIHRoZW4gbmVlZCBDTEtfU0VUX1JBVEVfUEFSRU5U
LiAKVGhpcyBkb2VzIGluZGVlZCBzZWVtIHRvIGJlIGEgY29udHJhZGljdGlvbi4KCgoKPgo+R3Jl
ZXRpbmdzLAo+Cj4tLSBTZWJhc3RpYW4K

