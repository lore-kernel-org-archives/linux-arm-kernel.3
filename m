Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCDAC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Mime-Version:References:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=43l6s6Pgrn8yOxJeuT4TcGACuUoK6HUv620UrE/SUwQ=; b=fykdKFo6R/Ftk4CVl8Ev4w8Bcc
	Hko5TV6GGF58uYKy8JqN6AXIXkI3eGW/0QZ7xONsE6gP88XGDqFyOx0o7gyGjCoL88QpfkElBrddM
	kzSud/Sta3K7yaz9lkQl3d7GCYi/syjeQosge624DGanqk0Imte59zDpVfln1zvsWI5HMZ6cd/CP9
	zUMBX13YmO5hdRNG0slKY/jq8MPugVC6kKvRzhYBUC7aq8wlfGc1tK6YC/ApBfYuln5Y7noykOcM0
	A59PXR+gfHMt2GVQAmeP1/inO1a8Ucwp9SWt5RoIjYxN7XN6Gw+HH0SHJi51xqhCJhETXIH/vAeza
	HqAM+DQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TS0-000000067dm-0SPH;
	Mon, 07 Sep 2026 07:07:32 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TRt-000000067cW-2zpm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788764768;
	bh=43l6s6Pgrn8yOxJeuT4TcGACuUoK6HUv620UrE/SUwQ=;
	h=Date:From:To:Subject:Mime-Version:Message-ID;
	b=BYqZ0VDFl6rdjevN0GIeL1Oungpi1Ffez65Nq3Cd1Ku4TPiqpmbyL80HSoecTXq1Q
	 7KzIY+UApegXUQaQ+luhCgnO+j7DJVSOH3spxirDZRaZsl6tQuu21bLMpjuRFntBNu
	 3iRdUO3fel6Y4xjMhu8LYB/9tdfTbLKmEaKjuIto=
X-QQ-mid: zesmtpgz4t1788764764tf478b456
X-QQ-Originating-IP: /0CXJVCxXTrVWLkOYaAwZSxz5I8ztM5QAKcBZrDAjDE=
Received: from PEN002676 ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 15:06:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16136033036701943877
Date: Mon, 7 Sep 2026 15:06:02 +0800
From: =?GB2312?B?1dS98MP3?= <zhaojinming@uniontech.com>
To: "Lorenzo Bianconi" <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier <maxime.chevallier@bootlin.com>, 
	andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, 
	edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, 
	pabeni <pabeni@redhat.com>, 
	mcoquelin.stm32 <mcoquelin.stm32@gmail.com>, 
	alexandre.torgue <alexandre.torgue@foss.st.com>, 
	horms <horms@kernel.org>, 
	ansuelsmth <ansuelsmth@gmail.com>, 
	jose.abreu <Jose.Abreu@synopsys.com>, 
	netdev <netdev@vger.kernel.org>, 
	linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] net: stmmac: clear dma_conf in __stmmac_open error path
References: <20260904-fix-stmmac-mtu-change-use-after-free-v2-1-91e680476921@uniontech.com>, 
	<apqkBQJMqHKTUxEp@lore-desk>
X-Priority: 3
X-GUID: 3B32DCFF-6EB4-4369-948A-FAAB222D1623
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.375[cn]
Mime-Version: 1.0
Message-ID: <B2251BD5D0B36E28+202609071506015851872@uniontech.com>
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: OX/+6nY/vs4TxPtOb2to4XL3exppPYO8LhorISTV/8sLp/E3J/Cmlg8n
	ZnFiMmVF9eMKhN9iKXPS5jQck+vMZYa9kf5Myad0ecfmdVYjSXqPLsJk8ofVG51o1sa+n7l
	jbt7ROFOskNmwghXXDHWzlIei4O2KEdlq4DhyFxdCEJrn7ZkCmw9H1+lISD14KNy3CPtYOo
	tJLrkJGCHtmQFg3m/NYZSzHg6jSILOT0Hap+1nmnvN2oqOZ3cjqAofebf6TtYs3UvwXotbB
	1z36h8zN9WQMXL7M+ULRHwQEtctBUV0Y3Ab+BLxp7fWXks9/dlD0b8g3pOdHVG0QmvAqRWQ
	xYXLVRp4qtmC6UK/XzQDFfyxHbCIRBCNo5hq9F0IT/mJe4C8d4oPiccZHO7t6cgW8eb6Wfu
	l9tvVVyQvJEYp7U8LHDxewMWuoyG7dnDVEEV/XRD5XESk3Byb8H6tfCftLPqSaRcfajHph2
	EaS5TQZJBD/3bbGU8z4h68R9ZM9Uv5IiGdWHlzABNj495PA0+XAP9OVE/EX1AeHwl72TdYN
	wLhglrb5sU0YM951FouYyLjA29LJQGWhpSCpjueRXi0pZp0GA3unm6unosDd2pmyk9kzKlK
	tTUIoLhIFif75+RXQBNWlzUPEEd799iSzfitk/tuGaqDD8RemKReQ/CSI2k/zbqBLFhRXrE
	cy7IQWCtB+xCJrDGVGxsYm7qfNsMoAcviNvMx+hHFsWLnBUGnbhxpchlhb3KEk9E1UNoIgf
	16lC3wIBhJRHkdSyJTcLCkcOde5WJSlR9Nhrnhk7z4eND2sfyq3AyGlpUFPaK0UHMRHa4ks
	0lTlxCe8ZXbJWkltVR24QBO6f69RwTuCjY+bgp2UR9qH2mHhs41Kfgxoc3C7EjLpKezBlzB
	zhWLL4LqElirKc5Ekv/g3g+7rbEykdxZtjraylNAnvoTWMX2ajE7SaeiELVfCNd+CsyX9dm
	05jWm2Ss7T8p6s8wlS0KDOuXgSVOaFzFPoW4I0Fmz3KM7Xy/2De+55Wt0alDPunNdGAg=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_000726_568103_E392AD92 
X-CRM114-Status: GOOD (  20.02  )
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKSSBhZ3JlZSB0aGF0IHVzaW5nIE5VTEwgYXMgYW4gZXhw
bGljaXQgIm5vIGNvbmZpZ3VyYXRpb24iIHNlbnRpbmVsIGlzIGNsZWFuZXIgdGhhbiByZWx5aW5n
IG9uIGFuIGFsbC16ZXJvIHN0cnVjdC4gSG93ZXZlciwgdGhlIHplcm9lZCBzdHJ1Y3QgaXMgY3Vy
cmVudGx5IHNhZmUgdG8gdGVhciBkb3duLCBhbmQgdGhhdCBzYWZldHkgY29tZXMgZnJvbSBlc3Rh
Ymxpc2hlZCBrZXJuZWwgY29udmVudGlvbnMgcmF0aGVyIHRoYW4gZnJvbSBhbnl0aGluZyBzdG1t
YWMtc3BlY2lmaWM6CiAtIGtmcmVlKE5VTEwpIGlzIGEgbm8tb3AgYnkgZGVmaW5pdGlvbi4KIC0g
ZG1hX2ZyZWVfY29oZXJlbnQoKSBiYWlscyBvdXQgZWFybHkgb24gYSBOVUxMIGNwdV9hZGRyIChz
ZWUga2VybmVsL2RtYS9tYXBwaW5nLmMsIGRtYV9mcmVlX2F0dHJzKCkgLT4gImlmICghY3B1X2Fk
ZHIpIHJldHVybjsiKS4KIC0gcGFnZV9wb29sX2Rlc3Ryb3koKSBpcyBndWFyZGVkIGJ5ICJpZiAo
cnhfcS0+cGFnZV9wb29sKSIuCiAtIHhkcF9yeHFfaW5mb191bnJlZygpIGlzIGd1YXJkZWQgYnkg
eGRwX3J4cV9pbmZvX2lzX3JlZygpLgogLSBUaGUgc2tiL2Rlc2NyaXB0b3IgbG9vcHMgYXJlIGJv
dW5kZWQgYnkgZG1hX3R4X3NpemUvZG1hX3J4X3NpemUsIHdoaWNoIGFyZSB6ZXJvIGFmdGVyIHRo
ZSBtZW1zZXQsIHNvIHRoZXkgbmV2ZXIgZGVyZWZlcmVuY2UgdGhlIChub3cgTlVMTCkgYnVmZmVy
L2Rlc2NyaXB0b3IgcG9pbnRlcnMuClNvIHdoaWxlIG1lbXNldCgpIGRvZXMgbGVhbiBvbiB0aG9z
ZSBndWFyZHMsIHRoZXkgYXJlIG5vdCBhY2NpZGVudGFsIGFuZCBob2xkIGZvciB0aGUgY3VycmVu
dCBjb2RlLgoKQ29udmVydGluZyBwcml2LT5kbWFfY29uZiB0byBhIHBvaW50ZXIgaXMgYSBtdWNo
IGxhcmdlciBjaGFuZ2UgdGhhbiBpdCBmaXJzdCBhcHBlYXJzOiBpdCBpcyByZWZlcmVuY2VkIH4x
MjAgdGltZXMgYWNyb3NzIHNpeCBmaWxlcyAoc3RtbWFjX21haW4uYywgc3RtbWFjX3NlbGZ0ZXN0
cy5jLCBzdG1tYWNfdGMuYywgc3RtbWFjX2V0aHRvb2wuYywgY2hhaW5fbW9kZS5jLCByaW5nX21v
ZGUuYyksIGFuZCB3b3VsZCByZXF1aXJlIGNoYW5naW5nIHRoZSBhbGxvY2F0aW9uIGxpZmV0aW1l
IGluIHByb2JlL3JlbW92ZSBwbHVzIE5VTEwgZ3VhcmRzIGF0IGV2ZXJ5IHRlYXJkb3duIHNpdGUu
IFRoYXQgZmVlbHMgbGlrZSBuZXQtbmV4dCBjbGVhbnVwIG1hdGVyaWFsIHJhdGhlciB0aGFuIHNv
bWV0aGluZyB0byBmb2xkIGludG8gYSB1c2UtYWZ0ZXItZnJlZSBmaXggdGhhdCBzaG91bGQgYmUg
YmFja3BvcnRlZCB0byBzdGFibGUuCgpXb3VsZCB5b3UgYmUgT0sgd2l0aCBrZWVwaW5nIHRoZSBt
ZW1zZXQoKSBoZXJlIGFzIHRoZSBtaW5pbWFsIGZpeCwgYW5kIEkgZm9sbG93IHVwIHdpdGggYSBz
ZXBhcmF0ZSBuZXQtbmV4dCBzZXJpZXMgdG8gY29udmVydCBwcml2LT5kbWFfY29uZiB0byBhIHBv
aW50ZXI/IElmIHlvdSdkIHN0aWxsIHByZWZlciB0aGUgcG9pbnRlciBhcHByb2FjaCBpbiB0aGlz
IHBhdGNoLCBJIGNhbiBkbyBpdCwgYnV0IEkgd2FudGVkIHRvIGZsYWcgdGhlIHNjb3BlIGZpcnN0
LgoKUmVnYXJkcywgClpoYW9KaW5taW5nCgoKCj4+IF9fc3RtbWFjX29wZW4oKSBjb3BpZXMgdGhl
IGZyZXNobHkgYWxsb2NhdGVkIGRtYV9jb25mIGludG8gcHJpdi0+ZG1hX2NvbmYKCgoKPj4gdmlh
IG1lbWNweSgpIGJlZm9yZSBpdCBjYW4gZmFpbCwgZS5nLiBpbiBzdG1tYWNfcmVxdWVzdF9pcnEo
KS4/IFdoZW4gaXQKCgoKPj4gZG9lcyBmYWlsLCB0aGUgY2FsbGVycyBmcmVlIHRoZSBkbWFfY29u
ZiBkZXNjcmlwdG9yIHJlc291cmNlcyBhbmQgdGhlCgoKCj4+IHN0cnVjdCBpdHNlbGYsIGJ1dCBw
cml2LT5kbWFfY29uZiBzdGlsbCBob2xkcyBwb2ludGVycyB0byB0aG9zZSBmcmVlZAoKCgo+PiBy
ZXNvdXJjZXMsIGEgdXNlLWFmdGVyLWZyZWUgdGhhdCB0cmlnZ2VycyB3aGVuIGEgc3Vic2VxdWVu
dAoKCgo+PiBzdG1tYWNfcmVsZWFzZSgpIG9yIGFub3RoZXIgTVRVIGNoYW5nZSByZWxlYXNlcyB0
aGUgcmVzb3VyY2VzIGFnYWluLgoKCgo+PiAKCgoKPj4gVW5kbyB0aGUgbWVtY3B5IGluIHRoZSBl
cnJvciBwYXRoIGJ5IHplcm9pbmcgcHJpdi0+ZG1hX2NvbmYsIGxlYXZpbmcgdGhlCgoKCj4+IHN0
YXRlIGNvbnNpc3RlbnQgcmVnYXJkbGVzcyBvZiB0aGUgY2FsbGVyLgoKCgo+PiAKCgoKPj4gRml4
ZXM6IDMwMTM0YjdjNDdiZDIgKCJuZXQ6IGV0aGVybmV0OiBzdG1pY3JvOiBzdG1tYWM6IGZpeCBw
b3NzaWJsZSBtZW1vcnkgbGVhayBpbiBfX3N0bW1hY19vcGVuIikKCgoKPj4gU2lnbmVkLW9mZi1i
eTogWmhhb0ppbm1pbmcgPHpoYW9qaW5taW5nQHVuaW9udGVjaC5jb20+CgoKCj4KCgoKPkhpIFpo
YW9KaW5taW5nLAoKCgo+CgoKCj5JIGFncmVlIHRoZSBpc3N1ZSBpcyByZWFsLCBidXQgYXNzdW1p
bmcgZnJlZV9kbWFfZGVzY19yZXNvdXJjZXMoKSBhbHdheXMKCgoKPnRvbGVyYXRlcyBhIGZ1bGx5
IHplcm9lZCBkbWFfY29uZiBzdHJ1Y3Qgc2VlbXMgYSBiaXQgZnJhZ2lsZSB0byBtZS4KCgoKPklz
IGl0IGJldHRlciB0byB1c2UgYSBwb2ludGVyIGZvciBwcml2LT5kbWFfY29uZiB0aGF0IHdlIGNh
biBzZXQgdG8gTlVMTCBpbgoKCgo+Y2FzZSBvZiBlcnJvcj8gV2hhdCBkbyB5b3UgdGhpbms/CgoK
Cj4KCgoKPlJlZ2FyZHMsCgoKCj5Mb3JlbnpvCgoKCj4KCgoKPj4gLS0tCgoKCj4+IENoYW5nZXMg
aW4gdjI6CgoKCj4+IC0gTW92ZSB0aGUgY2xlYXJpbmcgb2YgcHJpdi0+ZG1hX2NvbmYgZnJvbSBz
dG1tYWNfY2hhbmdlX210dSgpIGludG8KCgoKPj4/PyBfX3N0bW1hY19vcGVuKCkgZXJyb3IgcGF0
aCwgdW5kb2luZyB0aGUgbWVtY3B5KCkgYXQgdGhlIHBvaW50IHdoZXJlIGl0CgoKCj4+Pz8gd2Fz
IG1hZGUgYW5kIGNvdmVyaW5nIGJvdGggY2FsbGVycy4KCgoKPj4gLSBMaW5rIHRvIHYxOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwOTAzLWZpeC1zdG1tYWMtbXR1LWNoYW5nZS11c2Ut
YWZ0ZXItZnJlZS12MS0xLWM4MWRjN2Q2ZDE4YUB1bmlvbnRlY2guY29tCgoKCj4+IC0tLQoKCgo+
Pj8gZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDEg
KwoKCgo+Pj8gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgoKCj4+IAoKCgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4u
YyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKCgoK
Pj4gaW5kZXggMjQ2NTZiMzUzNTBiMTQ0NTRmYjEwZGVjZWQ2NTE2ZWI4OWUyYzBjOS4uNDM2OWU2
NGZhZjlmODc4YWEyMGFjNTA3NTcwNTA0NGY1NWM1ZjhiZiAxMDA2NDQKCgoKPj4gLS0tIGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwoKCgo+PiArKysg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCgoKCj4+
IEBAIC00MTkwLDYgKzQxOTAsNyBAQCBzdGF0aWMgaW50IF9fc3RtbWFjX29wZW4oc3RydWN0IG5l
dF9kZXZpY2UgKmRldiwKCgoKPj4/IAoKCgo+Pj8gCXN0bW1hY19yZWxlYXNlX3B0cChwcml2KTsK
CgoKPj4/IGluaXRfZXJyb3I6CgoKCj4+ICsJbWVtc2V0KCZwcml2LT5kbWFfY29uZiwgMCwgc2l6
ZW9mKHByaXYtPmRtYV9jb25mKSk7CgoKCj4+PyAJcmV0dXJuIHJldDsKCgoKPj4/IH0KCgoKPj4/
IAoKCgo+PiAKCgoKPj4gLS0tCgoKCj4+IGJhc2UtY29tbWl0OiBhNTAwZGI3ODE5YzUwZGI1OWU1
NWYxYjRmYTFjM2JhYTVhMjYxNmYzCgoKCj4+IGNoYW5nZS1pZDogMjAyNjA5MDMtZml4LXN0bW1h
Yy1tdHUtY2hhbmdlLXVzZS1hZnRlci1mcmVlLTY5M2RhNmViNGEzMAoKCgo+PiAKCgoKPj4gQmVz
dCByZWdhcmRzLAoKCgo+PiAtLSAKCgoKPj4gWmhhb0ppbm1pbmcgPHpoYW9qaW5taW5nQHVuaW9u
dGVjaC5jb20+CgoKCj4+IAoKCgo+PiAKCgo=


