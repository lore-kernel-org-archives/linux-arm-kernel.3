Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F6FC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Mime-Version:References:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=5UnCHTOpTpkqnUGkiS16fV4vAM0+e4jzRNd71F9nVaU=; b=3Y4QL54ZfzwEcIU0stsnrcosd3
	wPgcSOgMyV9wH79VK4yeLsJvuC9XYXUR0Iv2WwDJCkWRNVEf3WY1Prd2l8L1XSQLN3A0L4KwmE3q1
	47WV4XohpZK7fEsGAWvj3U0A5X0Y4fLGpcpPx83gvfMUbVoZ/g/NdkGirIXjKKG3qJZLKQAzYhW49
	nmKYoRTV10Dlpl63jZElwmrqjJ0DtbXLFPWVbaEVdToyEoGyctYyS7Q7mHgZZrpFMikYPMMlAkuHe
	kaQ15WSzHQQtF13LweKJVMntTQbo8gj2oOuuqVlnZr0nkn4t/4tgtWTQNWm9I81gzr9w3gVWocHnY
	2/Iz7ZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wjk-0000000G9Qn-3hs7;
	Fri, 11 Sep 2026 08:35:56 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wja-0000000G9N4-2Vbh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1789115688;
	bh=5UnCHTOpTpkqnUGkiS16fV4vAM0+e4jzRNd71F9nVaU=;
	h=Date:From:To:Subject:Mime-Version:Message-ID;
	b=GC1UWomWkAmi8InVvjObPzmZYS17kT9XRxkqaMb8rzFMWH59EjrnTqod0Y7yky1+h
	 BhYkf67W4dv9KHri0QFW5Vv6QBgDme6vabCWmR+phJQc0Bl4RPHOBo09tH18gqvKJs
	 nPb9cmI7dfSz1OcRiCbtJ0BGlNMHCvw8dFAQ71A0=
X-QQ-mid: zesmtpsz5t1789115685tf2ff96d6
X-QQ-Originating-IP: dkN2Rl4g6wtK3QVk6LilRHEFcAbjj2qtefa/5Tj54S4=
Received: from PEN002676 ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Sep 2026 16:34:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16364602175366116159
Date: Fri, 11 Sep 2026 16:34:43 +0800
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
	jose.abreu <Jose.Abreu@synopsys.com>, 
	netdev <netdev@vger.kernel.org>, 
	linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: stmmac: fix stale descriptors and DMA mapping leak on Tx map failure
References: <20260910-stmmac-fix-vlan-desc-leak-v1-1-6b07dca5e5e8@uniontech.com>, 
	<aqJ2vGaushx4EL5q@lore-desk>
X-Priority: 3
X-GUID: 153DEEB6-D82D-45A0-B664-DEC4AB33931B
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.375[cn]
Mime-Version: 1.0
Message-ID: <30AFF1B9230534C1+202609111634420869983@uniontech.com>
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M6mCw2Ve0qEm4BJbJgyk3CA0A+GyEUUTbEKy/sXRcwHoSEzQGCkj/6o5
	gkZA3GHzdTJrK1CRB6ChmXJeUaT81fDItIg714s4PfCXk6r75Qi9OK8cDzkOBrIDcNuPR7J
	R6bfB+TStpWT787MJNt1pMYDb+4rQ0BEQX6A8id3cc4dwaJediosp3ZllG/72fwqMgjB00x
	eCPJMrFrRsFOUunVTRp2HOf4F8RBvv5AhdetLAg2QFtDdECriZuEDPONc7ERIHnZzaPIclv
	+Z2M39ebavK/OT3YaSx4TmEEzzVMs31+QfeEpSTfQacZNT8DBzzxC77UZnFAq6GNYpXHqc4
	BWAUNa/bzYs/WYqjEJZXZB4w9iERcx0ooIJB78QHjLZNuE9ugFn8OSmb2CWfQkKtEzPuiQn
	DoJZ/JyP1P50n7/09kCQnN/7HNzCQYYnLpFw2qPnnTs444IWphnNBEIuTWn9HGOrWb52UlR
	hpyjXO0jmoZFHEcwZbitdrt6bmiw62ICBWxAUrI5zJEfuZYv0U7DTD7u8NdEsgUfU4HFhK+
	dDzu0xfI/VS9rSZFakDWL0TA4E3+ubgLSg9x7Z8bcJGGREiZZ5n6OjDRxzytpfspvS2IX1/
	5e1VWTlLQ55IZvuZqk4Wdq6XtuxZebISga/a5X67X0ouF7vorXOKeRz0IlrPMEQcb8CSllS
	Rl5tDe16M2Ds926mcrVj4LsDwjC8TlF/EgHHvbNRkvSUHm5ICbPLd7Uk7UHuOZd6WZnvJZp
	69q2145PEeqaY3O9BxW2dWN04uAjH5ijHtE4iq6W/8ChZtj3gggUzhS2+NaC2a4lPth3Lru
	W3LzK36krEg1sPWiRusVRxLUWY1+AIT6mAmJGS5yCvA2Z56a37FXDGXS0Um0csw0mWi4sTL
	nFzvbzS3+csIskFjyAYxX96kardZSAIeAtoSTz/AM0T0O3AnAYILzuJ8EevOaB5DF8FAAjo
	uJ0WjYlnjSoT4tcVk7VvFi7XS4sEbeP9aQqoaAbI+XMN/AtPuig86iRIIw/1GejRq35/z65
	Q+3fbcG9c5t9vDXfwiq+VUm34FjbdVBK5clxULPA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_013547_173499_D5F8B572 
X-CRM114-Status: GOOD (  16.55  )
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

CgoKCj4+IEluIHN0bW1hY194bWl0KCksIHdoZW4gdGhlIERNQSBtYXBwaW5nIG9mIHRoZSBsaW5l
YXIgcGFydCBvciBvZiBhCgoKCj4KCgoKPlsuLi5dCgoKCj4KCgoKPj4/IAlpZiAodW5saWtlbHko
aXNfanVtYm8pKSB7CgoKCj4+IC0JCWVudHJ5ID0gc3RtbWFjX2p1bWJvX2ZybShwcml2LCB0eF9x
LCBza2IsIGNzdW1faW5zZXJ0aW9uKTsKCgoKPj4gLQkJaWYgKHVubGlrZWx5KGVudHJ5IDwgMCkg
JiYgKGVudHJ5ICE9IC1FSU5WQUwpKQoKCgo+PiArCQlyZXQgPSBzdG1tYWNfanVtYm9fZnJtKHBy
aXYsIHR4X3EsIHNrYiwgY3N1bV9pbnNlcnRpb24pOwoKCgo+CgoKCj5pZiBqdW1ib19mcm0oKSBy
ZXR1cm5zIGFuIGVycm9yIG9uIHRoZSBzdWJzZXF1ZW50IGZyYW1lcywgZW50cnkgaXMgbm90IHVw
ZGF0ZWQKCgoKPmhlcmUsIHNvIHdlIHdpbGwgZW5kIHVwIHdpdGggYSBETUEgbGVhay4gQW0gSSBt
aXNzaW5nIHNvbWV0aGluZz8KCgoKPgpZb3UncmUgcmlnaHQsIHRoYXQgd2FzIGEgcmVhbCBsZWFr
IGluIHYxLiBJZiBqdW1ib19mcm0oKSBmYWlsZWQgd2hpbGUgbWFwcGluZyBhIHN1YnNlcXVlbnQg
anVtYm8gYnVmZmVyLCB0aGUgYnVmZmVycyBtYXBwZWQgYmVmb3JlIHRoZSBmYWlsdXJlIHdlcmUg
bmV2ZXIgdW5tYXBwZWQsIGJlY2F1c2UganVtYm9fZnJtKCkgcmV0dXJucyAtMSB3aXRob3V0IHJl
cG9ydGluZyBob3cgbWFueSBidWZmZXJzIGl0IGhhZCBhbHJlYWR5IG1hcHBlZCwgc28gdGhlIGVy
cm9yIHBhdGggaW4gc3RtbWFjX3htaXQoKSBjb3VsZCBub3QgcmVsZWFzZSB0aGVtLgoKdjIgZml4
ZXMgdGhpcyBpbnNpZGUganVtYm9fZnJtKCkgaXRzZWxmOiBpdCBub3cgc2F2ZXMgdGhlIHN0YXJ0
aW5nIGVudHJ5IGFuZCwgd2hlbiBhIHN1YnNlcXVlbnQgZG1hX21hcF9zaW5nbGUoKSBmYWlscywg
dW5tYXBzIHRoZSBidWZmZXJzIGl0IGhhcyBhbHJlYWR5IG1hcHBlZCBiZWZvcmUgcmV0dXJuaW5n
IGFuIGVycm9yLCBpbiBib3RoIHJpbmcgYW5kIGNoYWluIG1vZGVzLiBUaGlzIGtlZXBzIHRoZSBz
dG1tYWNfeG1pdCgpIGVycm9yIHBhdGggdW5jaGFuZ2VkIGFuZCBhdm9pZHMgY2hhbmdpbmcganVt
Ym9fZnJtKCkncyByZXR1cm4gc2VtYW50aWNzLgoKCgo+CgoKCj4+ICsJCWlmICh1bmxpa2VseShy
ZXQgPCAwKSAmJiAocmV0ICE9IC1FSU5WQUwpKQoKCgo+Pj8gCQkJZ290byBkbWFfbWFwX2VycjsK
CgoKPj4gKwkJZW50cnkgPSByZXQ7CgoKCj4+PyAJfSBlbHNlIHsKCgoKPj4/IAkJYm9vbCBsYXN0
X3NlZ21lbnQgPSAobmZyYWdzID09IDApOwoKCgo+Pj8gCgoKCj4+IEBAIC00OTg0LDYgKzQ5ODUs
MjYgQEAgc3RhdGljIG5ldGRldl90eF90IHN0bW1hY194bWl0KHN0cnVjdCBza19idWZmICpza2Is
IHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCgoKCj4+PyAKCgoKPj4/IGRtYV9tYXBfZXJyOgoKCgo+
Pj8gCW5ldGRldl9lcnIocHJpdi0+ZGV2LCAiVHggRE1BIG1hcCBmYWlsZWRcbiIpOwoKCgo+PiAr
CgoKCj4+ICsJLyogZW50cnkgcG9pbnRzIG9uZSBwYXN0IHRoZSBsYXN0IGRlc2NyaXB0b3Igd3Jp
dHRlbiBmb3IgdGhpcyBmcmFtZToKCgoKPj4gKwkgKiBvbiBmYWlsdXJlIGl0IGlzIHRoZSBkZXNj
cmlwdG9yIHdob3NlIERNQSBtYXBwaW5nIGZhaWxlZCwgc28gd2FsawoKCgo+PiArCSAqIGZyb20g
Zmlyc3RfZW50cnkgdXAgdG8sIGJ1dCBub3QgaW5jbHVkaW5nLCBlbnRyeS4/IFJlc2V0IGN1cl90
eAoKCgo+PiArCSAqIHVuY29uZGl0aW9uYWxseSBhcyBib3RoIHN0bW1hY192bGFuX2luc2VydCgp
IGFuZCBzdG1tYWNfanVtYm9fZnJtKCkKCgoKPj4gKwkgKiBtYXkgaGF2ZSBhZHZhbmNlZCBpdCwg
YW5kIHJlbGVhc2UgdGhlIFZMQU4gY29udGV4dCBkZXNjcmlwdG9yLgoKCgo+PiArCSAqLwoKCgo+
PiArCXdoaWxlIChmaXJzdF9lbnRyeSAhPSBlbnRyeSkgewoKCgo+PiArCQlkZXNjID0gc3RtbWFj
X2dldF90eF9kZXNjKHByaXYsIHR4X3EsIGZpcnN0X2VudHJ5KTsKCgoKPj4gKwkJc3RtbWFjX3Jl
bGVhc2VfdHhfZGVzYyhwcml2LCBkZXNjLCBwcml2LT5kZXNjcmlwdG9yX21vZGUpOwoKCgo+PiAr
CQlzdG1tYWNfZnJlZV90eF9idWZmZXIocHJpdiwgJnByaXYtPmRtYV9jb25mLCBxdWV1ZSwgZmly
c3RfZW50cnkpOwoKCgo+PiArCQlmaXJzdF9lbnRyeSA9IFNUTU1BQ19ORVhUX0VOVFJZKGZpcnN0
X2VudHJ5LAoKCgo+PiArCQkJCQkJcHJpdi0+ZG1hX2NvbmYuZG1hX3R4X3NpemUpOwoKCgo+PiAr
CX0KCgoKPj4gKwoKCgo+PiArCXR4X3EtPmN1cl90eCA9IGZpcnN0X3R4OwoKCgo+Cgo+ZG8gd2Ug
cmVhbGx5IG5lZWQgdG8gdXBkYXRlIHR4X3EtPmN1cl90eCBoZXJlPwoKWWVzLCBpdCBpcyBuZWVk
ZWQuIFR3byBoZWxwZXJzIGFkdmFuY2UgdHhfcS0+Y3VyX3R4IGJlZm9yZSB3ZSByZWFjaCB0aGUg
ZXJyb3IgcGF0aDogc3RtbWFjX3ZsYW5faW5zZXJ0KCkgKHdoZW4gYSBWTEFOIHRhZyBpcyBwcmVz
ZW50KSBtb3ZlcyBpdCBwYXN0IHRoZSBjb250ZXh0IGRlc2NyaXB0b3IsIGFuZCBzdG1tYWNfanVt
Ym9fZnJtKCkgbW92ZXMgaXQgcGFzdCB0aGUganVtYm8gaGVhZCBkZXNjcmlwdG9ycyBvbiBzdWNj
ZXNzLgoKSWYgd2UgZG8gbm90IHJvbGwgaXQgYmFjayB0byBmaXJzdF90eCwgdGhlIHJlbGVhc2Vk
IFZMQU4gY29udGV4dCBkZXNjcmlwdG9yIChhbmQgYW55IGp1bWJvIGhlYWQgZGVzY3JpcHRvcnMp
IHdvdWxkIGJlIGxlZnQgaW5zaWRlIHRoZSBbZGlydHlfdHgsIGN1cl90eCkgaW4tZmxpZ2h0IHdp
bmRvdywgc28gc3RtbWFjX3R4X2NsZWFuKCkgd291bGQgdHJlYXQgdGhlbSBhcyBjb21wbGV0ZWQg
ZnJhbWVzLCBhbmQgdGhlIG5leHQgeG1pdCB3b3VsZCBza2lwIHRob3NlIHNsb3RzLgoKVW5saWtl
IHRoZSBUU08gcGF0aCwgd2hlcmUgdGhlIGFsbG9jYXRvciB1c2VzIGEgbG9jYWwgZW50cnkgYW5k
IHR4X3EtPmN1cl90eCBpcyBvbmx5IGFzc2lnbmVkIG9uIHN1Y2Nlc3MsIHRoZXNlIGFyZSBzaGFy
ZWQgaGVscGVycyB0aGF0IGFkdmFuY2UgY3VyX3R4IGFzIGEgc2lkZSBlZmZlY3QsIHNvIHJvbGxp
bmcgaXQgYmFjayBoZXJlIGlzIHRoZSBtaW5pbWFsIGNvcnJlY3QgZml4LgoKCgo+CgoKCj5SZWdh
cmRzLAoKCgo+TG9yZW56bwoKCgo+CgoKCj4+ICsJaWYgKGhhc192bGFuKSB7CgoKCj4+ICsJCWRl
c2MgPSBzdG1tYWNfZ2V0X3R4X2Rlc2MocHJpdiwgdHhfcSwgZmlyc3RfdHgpOwoKCgo+PiArCQlz
dG1tYWNfcmVsZWFzZV90eF9kZXNjKHByaXYsIGRlc2MsIHByaXYtPmRlc2NyaXB0b3JfbW9kZSk7
CgoKCj4+ICsJfQoKCgo+Pj8gbWF4X3NkdV9lcnI6CgoKCj4+PyAJZGV2X2tmcmVlX3NrYihza2Ip
OwoKCgo+Pj8gCXByaXYtPnhzdGF0cy50eF9kcm9wcGVkKys7CgoKCj4+IAoKCgo+PiAtLS0KCgoK
Pj4gYmFzZS1jb21taXQ6IDg5M2UxMTc4N2Y3OGU0M2I1MzRlMjUyMjQ5YWMzZmZmNGQxMzMzZjgK
CgoKPj4gY2hhbmdlLWlkOiAyMDI2MDkwOS1zdG1tYWMtZml4LXZsYW4tZGVzYy1sZWFrLWYwNTdi
YjA2MWRhYQoKCgo+PiAKCgoKPj4gQmVzdCByZWdhcmRzLAoKCgo+PiAtLSAKCgoKPj4gWmhhb0pp
bm1pbmcgPHpoYW9qaW5taW5nQHVuaW9udGVjaC5jb20+CgoKCj4+IAoKCgo+PiAKCgo=


