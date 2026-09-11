Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CC9C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Mime-Version:References:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=cUgVQ4+F5cAwRNZPY67atToeNj2pgrvmmSO+g+BtdYg=; b=M9l06eNb92kfzOrDNOdldhYLp+
	wmJhjB3jmVX6G2TI8q3sVXpH1QWi6Nc0vpy+lOEMf1YLTSvBagGhtaoZ2o8R55OtPb0+BUxKLEacc
	nBW5ykPgThbBzrAufwnE2f3ySSzi/QTwOheuqklpXozvtqKZ/f2Jm/Zu5DmDturByqi1VBuD0sM42
	oDIof+k54D7eIySzuZiyAU9Mln8o+UJ60D1u6xC7LKYGv9Ze+3aJ3xmvALTZjnKMTsZK1B5JbZN8f
	LEMPdtdbXs1P6MoC+8vOFf++N4T+YxnW2DqcklXmgVv1PZKxGOwOimn+Xe2UerbKm5YdlX/FSF4BW
	9+1bh/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wpS-0000000GABK-0HHU;
	Fri, 11 Sep 2026 08:41:50 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wpO-0000000GAAF-3tbP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1789116043;
	bh=cUgVQ4+F5cAwRNZPY67atToeNj2pgrvmmSO+g+BtdYg=;
	h=Date:From:To:Subject:Mime-Version:Message-ID;
	b=lTptOqt5ZuQQM/go3kAEA2DrmukWFmHPu4ZKK08hT13Dzoa5Pr34yyDMJ5j5qV9ZF
	 kRm9D2Hx5y37SF6zAna6sPkpTz+Ww4vw1A4LE+AmxIJtDl7bHLbqYO3Zw/ImAJQgt6
	 bnDkIexMFAUu8AQUwRpv3QEyYvCU5ma9HYo7ComA=
X-QQ-mid: zesmtpsz3t1789116035tc893fa95
X-QQ-Originating-IP: Wwf56ac9Ab6dxRwpm+dyowsf4y9gEc8/p6o//X7O6Kw=
Received: from PEN002676 ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Sep 2026 16:40:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14537747011413877646
Date: Fri, 11 Sep 2026 16:40:33 +0800
From: =?GB2312?B?1dS98MP3?= <zhaojinming@uniontech.com>
To: maxime.chevallier <maxime.chevallier@bootlin.com>, 
	andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, 
	edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, 
	pabeni <pabeni@redhat.com>, 
	mcoquelin.stm32 <mcoquelin.stm32@gmail.com>, 
	alexandre.torgue <alexandre.torgue@foss.st.com>, 
	jose.abreu <Jose.Abreu@synopsys.com>
Cc: netdev <netdev@vger.kernel.org>, 
	linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: stmmac: fix stale descriptors and DMA mapping leak on Tx map failure
References: <20260910-stmmac-fix-vlan-desc-leak-v1-1-6b07dca5e5e8@uniontech.com>, 
	<4a07a3d6-b515-43b6-918d-87806c479430@bootlin.com>
X-Priority: 3
X-GUID: E3B0AC8C-D1BC-47B3-B037-15EC2C348CE3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.375[cn]
Mime-Version: 1.0
Message-ID: <E92AD2C7F9C27CD6+202609111640319095245@uniontech.com>
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: Mlf/ulHBoNfw2TfyeCmDDYCNUDO2gX5sgaxxsdka4UJiUQZFHYSr3edG
	7bSUTPNvcGTWHdV0dMSkzA34hUzdFfjCurewSmO04IUKis5EQXHIpE1cgtLNCm+KzL5qVAx
	J0sPn/F98RHaYlR228aotFQFxED0Q7bnnhrrmSvRBCndZzNNxcltgMgIVxE2cNGx/qmoPW8
	+BMzaUh3MYJS/VMXa+SJ907HndP+vjFaObDnXEbs9rHfEx9yh7advORV3tIM6KKBI5eUXvJ
	543LWnwh3DGURDvQQVkgCq+peRzJ/mrU1hzELbcbuEYdQpp8Pj828VlyO52S9YDBfWdte48
	pH6QY/QkEfoPzaJYy22/z68EclpSGMeEZ166jbVLnN6e2Q77I3hPrPXKareCSnJ12pZjEkb
	4Do0li/mNuhRTyyP/rHaFPnj4KwmuanS2vNIsjJjKBQzIcBpHgWg+70FEkwRqK5lYFTLdMG
	Zu0tnBZtBwkNjBLGDTTlRptzoOgw0m8kCKPhuGjW9tef3xEOED3PBml+VE7UifoTSrfsDTR
	5rlss9ISFAxh1timapjYzD8KGz1X9UUczxRKFwHBWfVJiqWc1UTs3eTGqiKhxRJ79wREG8a
	GAsTGc3RCYPC6cmhNZkFUoeba83VC0VaJ9isb8rDzx6QEYl4BAWwT6AqcLgOKJ1kLPZRdzG
	YJorXTeP6MO+nyVWi4V6mgKuNyIie7jNtltcyWAc5XXtCDdTrSmU3ML55LhoSxPQ1iBWvRu
	j6io2BdRvjwX2faEtIzlpmPDvmJmdKDby8BluGY/JSBqijzq144KfpPyhWpVfeCDmqCOCia
	H/LCLxzv07MIez3lN1hWdgphIUTL5p2iXze6UiD5iWZLOH0bnfHdjsbgA57IWSye5M3WiQn
	PWajtA46UACHPizT5YppOdrCKJBcUXnqkBuaDujUTFd7H7A3Nz3mNtYruR3JBSdi4XG3Hop
	wk0hjGjh7NBftISCpE7Cs9KaCPogXO2NObZ/i/cA1ubBTs+yG+QBXQg55maS4oWer6sQ=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_014148_335031_28F28FE6 
X-CRM114-Status: GOOD (  11.51  )
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

Cgo+SGksCgoKCj4KCgoKPk9uIDkvMTAvMjYgMDc6MTksIFpoYW9KaW5taW5nIHdyb3RlOgoKCgo+
PiBJbiBzdG1tYWNfeG1pdCgpLCB3aGVuIHRoZSBETUEgbWFwcGluZyBvZiB0aGUgbGluZWFyIHBh
cnQgb3Igb2YgYQoKCgo+PiBmcmFnbWVudCBmYWlscywgdGhlIGVycm9yIHBhdGggb25seSBmcmVl
cyB0aGUgc2tiLj8gVGhpcyBsZWF2ZXMgYmVoaW5kCgoKCj4+IHRoZSBETUEgbWFwcGluZ3MgYWxy
ZWFkeSBjcmVhdGVkIGZvciB0aGUgbGluZWFyIHBhcnQgYW5kIGZvciB0aGUKCgoKPj4gZnJhZ21l
bnRzIG1hcHBlZCBiZWZvcmUgdGhlIGZhaWx1cmUsIHdoaWNoIGFyZSBuZXZlciB1bm1hcHBlZC4K
CgoKPj4gCgoKCj4+IFRoZSBWTEFOIGNvbnRleHQgZGVzY3JpcHRvciBwcm9ncmFtbWVkIGJ5IHN0
bW1hY192bGFuX2luc2VydCgpIGlzIGFsc28KCgoKPj4gbGVmdCBiZWhpbmQgd2l0aCBpdHMgT1dO
IGJpdCBzZXQgd2hpbGUgdHhfcS0+Y3VyX3R4IGhhcyBiZWVuIGFkdmFuY2VkCgoKCj4+IHBhc3Qg
aXQsIHNvIHRoZSBETUEgZW5naW5lIGxhdGVyIGNvbnN1bWVzIHRoZSBvcnBoYW5lZCBkZXNjcmlw
dG9yIGFuZAoKCgo+PiBhcHBsaWVzIGl0cyBzdGFsZSBWTEFOIHRhZyB0byBhbiB1bnJlbGF0ZWQg
ZnJhbWUuCgoKCj4+IAoKCgo+PiBSZWxlYXNlIHRoZSBkZXNjcmlwdG9ycyBhbmQgdGhlaXIgRE1B
IG1hcHBpbmdzIGluIHRoZSBkbWFfbWFwX2VyciBwYXRoCgoKCj4+IHdpdGggc3RtbWFjX3JlbGVh
c2VfdHhfZGVzYygpIGFuZCBzdG1tYWNfZnJlZV90eF9idWZmZXIoKSwgd2Fsa2luZyBmcm9tCgoK
Cj4+IGZpcnN0X2VudHJ5IHRvIGVudHJ5LCB0aGVuIHJvbGwgYmFjayB0eF9xLT5jdXJfdHggYW5k
IHJlbGVhc2UgdGhlIFZMQU4KCgoKPj4gY29udGV4dCBkZXNjcmlwdG9yLgoKCgo+PiAKCgoKPj4g
Rml4ZXM6IDMwZDkzMjI3OWRjMiAoIm5ldDogc3RtbWFjOiBBZGQgc3VwcG9ydCBmb3IgVkxBTiBJ
bnNlcnRpb24gT2ZmbG9hZCIpCgoKCj4+IFNpZ25lZC1vZmYtYnk6IFpoYW9KaW5taW5nIDx6aGFv
amlubWluZ0B1bmlvbnRlY2guY29tPgoKCgo+PiAtLS0KCgoKPj4/IGRyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCAyOSArKysrKysrKysrKysrKysrKysr
LS0tLQoKCgo+Pj8gMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgoKCj4+IAoKCgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19tYWluLmMKCgoKPj4gaW5kZXggMjQ2NTZiMzUzNTBiMTQ0NTRmYjEwZGVjZWQ2
NTE2ZWI4OWUyYzBjOS4uMmUzNmMyN2UyY2ZiNDM2YWYzNTY2Y2YxYzNlNzBkMzJjZTk4MzBhMCAx
MDA2NDQKCgoKPj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3Rt
bWFjX21haW4uYwoKCgo+PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9zdG1tYWNfbWFpbi5jCgoKCj4+IEBAIC00NzY5LDEyICs0NzY5LDEyIEBAIHN0YXRpYyBuZXRk
ZXZfdHhfdCBzdG1tYWNfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2Rldmlj
ZSAqZGV2KQoKCgo+Pj8gCXVuc2lnbmVkIGludCBub3BhZ2VkX2xlbiA9IHNrYl9oZWFkbGVuKHNr
Yik7CgoKCj4+PyAJdTMyIHF1ZXVlID0gc2tiX2dldF9xdWV1ZV9tYXBwaW5nKHNrYik7CgoKCj4+
PyAJaW50IG5mcmFncyA9IHNrYl9zaGluZm8oc2tiKS0+bnJfZnJhZ3M7CgoKCj4+IC0JdW5zaWdu
ZWQgaW50IGZpcnN0X2VudHJ5LCB0eF9wYWNrZXRzOwoKCgo+PiArCXVuc2lnbmVkIGludCBmaXJz
dF9lbnRyeSwgZW50cnksIHR4X3BhY2tldHM7CgoKCj4+PyAJc3RydWN0IHN0bW1hY190eHFfc3Rh
dHMgKnR4cV9zdGF0czsKCgoKPj4/IAlzdHJ1Y3QgZG1hX2Rlc2MgKmRlc2MsICpmaXJzdF9kZXNj
OwoKCgo+Pj8gCXN0cnVjdCBzdG1tYWNfdHhfcXVldWUgKnR4X3E7CgoKCj4+PyAJaW50IGksIGNz
dW1faW5zZXJ0aW9uID0gMDsKCgoKPj4gLQlpbnQgZW50cnksIGZpcnN0X3R4OwoKCgo+PiArCWlu
dCBmaXJzdF90eCwgcmV0OwoKCgo+Pj8gCWRtYV9hZGRyX3QgZG1hX2FkZHI7CgoKCj4+PyAJdTMy
IHNkdV9sZW47CgoKCj4KCgoKPlBsZWFzZSBmb2xsb3cgdGhlIHJldmVyc2UgeG1hcyB0cmVlIG9y
ZGVyaW5nLCBmcm9tIGxvbmdlc3QgbGluZSB0byBzaG9ydGVzdAoKRG9uZSBpbiB2MjogdGhlIHZh
cmlhYmxlIGRlY2xhcmF0aW9ucyBpbiBzdG1tYWNfeG1pdCgpIGFyZSBub3cgb3JkZXJlZApmcm9t
IGxvbmdlc3QgdG8gc2hvcnRlc3QgbGluZS4KCgoKPgoKCgo+VGhlIHJlc3Qgc2VlbXMgT0suIEJ5
IGFueSBjaGFuY2UsIGRvIHlvdSBoYXZlIGEgcmVwcm9kdWNlciA/CgoKCj4KCgoKPk1heGltZQoK
Cgo+CgoKCj4KCk5vIHJ1bnRpbWUgcmVwcm9kdWNlciwgc29ycnkuIFRoaXMgd2FzIGZvdW5kIGJ5
IGNvZGUgcmV2aWV3IC8gc3RhdGljCmFuYWx5c2lzLiBUaGUgdHJpZ2dlciByZXF1aXJlcyBhIERN
QSBtYXBwaW5nIGZhaWx1cmUgKGRtYV9tYXBfc2luZ2xlIC8Kc2tiX2ZyYWdfZG1hX21hcCkgY29t
YmluZWQgd2l0aCBWTEFOIGluc2VydGlvbiBvZmZsb2FkIG9yIGZyYWdtZW50ZWQKU0tCcywgd2hp
Y2ggbmVlZHMgSU9NTVUgcHJlc3N1cmUgb3IgZmF1bHQgaW5qZWN0aW9uIHRvIHJlcHJvZHVjZQpy
ZWxpYWJseS4KClRoYW5rcyBmb3IgdGhlIHJldmlldy4KClJlZ2FyZHMsClpoYW9KaW5taW5nCgoK


