Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE438C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yE52WJ2vimlh/juoZ6MbwG17+CtDV9JuhivlROiXjXo=; b=4TJib8ZXqwtCWQrNRlqu2PrD2I
	HmbWhmEHIqFJ01P7/QQtMFOy4bGigviDHPCx33Wzp0CIvvjK1L7cWdt5CGTw6enFgPxCiYBd6ayP3
	Zc9ltrsxqmwdX6HJfrXjAGYYaF6uJzA77hZC3r1CUlqbxkPrWi5tHb4S9OBW+XGCjgzSujqungFTE
	whQ8VARBF3l/Goc9nVHrjtxQmTC7UD4sqarw1jXqsIMEiUsDgRgBYA5YjtO3pjLOuaUdCwSGe7iKt
	VD6DQtCZ3R0bWbPzpgwXWlFjUbVYHCv+A0rSUbma7aUlsqR+s/WmGv2O/UCyR7WDveP9FgweSg5iV
	ryCN8vaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8CM-0000000Aacn-0Ar1;
	Thu, 06 Mar 2025 10:11:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6zc-0000000AP2a-2x3o;
	Thu, 06 Mar 2025 08:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yE52WJ2vimlh/juoZ6MbwG17+CtDV9JuhivlROiXjXo=; b=HXnk6UkKsHAdvbhDuZPCe/YNo8
	yxGkCVOPL+v72yvcGMV9lv0xkTr3E2HXqNznVS0VyMrm0aCh3T/pMKzjNwYD9Z5YheZVte/ydlJ5O
	vSzdnYGM31udSAth+ST9o2YCT+dU7uW6vp4t6xe2hMtUKuh8P1ct4m7Z4NRllWH+naWQ3GA3281gd
	vKgPrKEuhVzXQFfy3rltqSPlYpguLrjWlUvTr5R2sPn0c6f7kHj+c19cSL44Fcj76VAztuln37DIu
	cSLPmLDtTM4yFz2co/G1CuGA1uXps0+RTSXJuTNVNFOB+xMNbO+Cw55fnoAl33VE2egMNRLUbognO
	NcV1RD/w==;
Received: from m16.mail.163.com ([220.197.31.4])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6zZ-00000000yb0-0S95;
	Thu, 06 Mar 2025 08:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=otJkz+uTPErAYIjjRZpM17wntC5OwTC49cEJBc+LIdk=; b=M
	JmLdj8lP9dWjkBDyETZhE6ieWhs61qK8O3Vf1iAqnvG2H7x1qnM/8L5C7niwY2LJ
	57Hs5dfY7HekbJMbCyLkHm/bbFdM2klID/CVwnxZYJF0d6K3ogTkXU8FrM4phDz0
	ptt5YwYCCoA6Wn4pMzoeOGpWlMfp2VgEVZbvS3KHro=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-118 (Coremail) ; Thu, 6 Mar 2025 16:53:21 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 6 Mar 2025 16:53:21 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Piotr Oniszczuk" <piotr.oniszczuk@gmail.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
	sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
	hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	"Andy Yan" <andy.yan@rock-chips.com>, krzk+dt@kernel.org,
	robh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re:Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
 <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
X-NTES-SC: AL_Qu2fA/6evkor5yKaYOkfmkcVgOw9UcO5v/Qk3oZXOJF8jDDp2ycwUUJSDXLaweO0FQ+OmgmGXTtC9/R7f4VTVaQNArHD3vYUsFK+gDGjSdXBUQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: digvCgD3__eBYslnVcN3AA--.8557W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAsIXmfJWZrlfwABs7
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_085409_608164_D49AB432 
X-CRM114-Status: UNSURE (   4.72  )
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

CkhpLAoK5ZyoIDIwMjUtMDMtMDYgMTY6NDI6MDDvvIwiUGlvdHIgT25pc3pjenVrIiA8cGlvdHIu
b25pc3pjenVrQGdtYWlsLmNvbT4g5YaZ6YGT77yaCj4KPgo+PiBXaWFkb21vxZvEhyBuYXBpc2Fu
YSBwcnpleiBBbmR5IFlhbiA8YW5keXNocmtAMTYzLmNvbT4gdyBkbml1IDYgbWFyIDIwMjUsIG8g
Z29kei4gMDE6NTk6Cj4+IAo+PiAKPj4gCj4+IAo+PiBCb3RoIG9mIHRoZSB0d28gY29uZmlnIG9w
dGlvbnMgc2hvdWxkIGJlIGVuYWJsZWQuCj4+IGFuZHlAUHJvNDgwOn4vV29ya1NwYWNlL2xpbnV4
LW5leHQkIHJnIERXX0RQIC5jb25maWcKPj4gNDA0NDpDT05GSUdfUk9DS0NISVBfRFdfRFA9eQo+
Cj5oZXJlIGnigJltIGEgYml0IGxvc3TigKYuCj5ncmVwaW5nIG9uIGZ1bGwga2VybmVsIHNvdXJj
ZXMgKHdpdGggYXBwbGllZCBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGlu
dXgtcm9ja2NoaXAvbGlzdC8/c2VyaWVzPTkzNjc4NCkgZ2l2ZXMgbWUgbm8gc2luZ2xlIGFwcGVh
cmFuY2Ugb2YgUk9DS0NISVBfRFdfRFDigKYKPkRvIGkgbWlzcyBzb21ldGhpbmc/CgpzZWUgUEFU
Q0ggMy82OiAgIAoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvS2NvbmZp
ZyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9LY29uZmlnCmluZGV4IDI2YzQ0MTBiMjQwNy4u
Yzg2MzhiYWY5NjQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvS2NvbmZp
ZworKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvS2NvbmZpZwpAQCAtOCw2ICs4LDcgQEAg
Y29uZmlnIERSTV9ST0NLQ0hJUAogCXNlbGVjdCBEUk1fUEFORUwKIAlzZWxlY3QgVklERU9NT0RF
X0hFTFBFUlMKIAlzZWxlY3QgRFJNX0FOQUxPR0lYX0RQIGlmIFJPQ0tDSElQX0FOQUxPR0lYX0RQ
CisJc2VsZWN0IERSTV9EV19EUCBpZiBST0NLQ0hJUF9EV19EUAogCXNlbGVjdCBEUk1fRFdfSERN
SSBpZiBST0NLQ0hJUF9EV19IRE1JCiAJc2VsZWN0IERSTV9EV19IRE1JX1FQIGlmIFJPQ0tDSElQ
X0RXX0hETUlfUVAKIAlzZWxlY3QgRFJNX0RXX01JUElfRFNJIGlmIFJPQ0tDSElQX0RXX01JUElf
RFNJCkBAIC01OCw2ICs1OSwxMiBAQCBjb25maWcgUk9DS0NISVBfQ0ROX0RQCiAJICBSSzMzOTkg
YmFzZWQgU29DLCB5b3Ugc2hvdWxkIHNlbGVjdCB0aGlzCiAJICBvcHRpb24uCiAKK2NvbmZpZyBS
T0NLQ0hJUF9EV19EUAorCWJvb2wgIlJvY2tjaGlwIHNwZWNpZmljIGV4dGVuc2lvbnMgZm9yIFN5
bm9wc3lzIERXIERQIgorCWhlbHAKKwkgIENob29zZSB0aGlzIG9wdGlvbiBmb3IgU3lub3BzeXMg
RGVzaWduV2FyZSBDb3JlcyBEaXNwbGF5UG9ydAorCSAgdHJhbnNtaXQgY29udHJvbGxlciBzdXBw
b3J0IG9uIFJvY2tjaGlwIFNvQy4KCiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yb2Nr
Y2hpcC8wNDdFRUNGQy03RTU1LTQ0RUMtODk2Ri0xM0ZFMDQzMzNFNERAZ21haWwuY29tL1QvI20x
NzhhMzI1ZWEwZWJjNjQxODdhYWU0NzRkNzdjM2Y3YTllMGJjOTNkCj4K

