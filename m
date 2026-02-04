Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B343E83EE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 07:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Mime-Version:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8dR0WpdOFZv6MqPbomihEeXQ3z0vbO0QWiziaV801CA=; b=E3CvgLTNaBOL5zS/CVig67aFVE
	mBxZm+kZA34h3mlgCFQ3Loz/DjGFj6rfU/+mnqImE80FDiIP470Li2uLxyE9JMiI/f2CqsN2g5MCm
	ZW6jFvDPBeecYMUQd81dhJXWvfrF7Sklbm7SShSdiki6Bq4rIDp40xXYdLcHT5jRKFDX25EeAF1SW
	Q2RNu9XSjUc00qhitQ0oj8grlfdhXZKUt6T8TNOawdY7SMgkL81pQnFV5XrUE61EEnMejPmzGAa9f
	mOGjr2oZ6nHvBs+UVpl2/6LEXnbgL12dis/199QoqOrIqqWS28cHwixlDES6RIf8PAG31BcQkx4yZ
	vJ3KVZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnXkn-000000084gJ-3jM2;
	Wed, 04 Feb 2026 07:56:49 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnXkk-000000084fD-1a5L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 07:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770191764;
	bh=8dR0WpdOFZv6MqPbomihEeXQ3z0vbO0QWiziaV801CA=;
	h=Date:From:To:Subject:Mime-Version:Message-ID;
	b=rMRrlZmR6ERPWmgRCUjk84GSyjrEF5Y/h/hQz8BDwrt/18d/v8mHPzetUyiU3jgOA
	 PNk7+CiC/lvLxGB8b9W1e13N8d2U3qIHTg/IzMQ7gu82fXBmqCOR0taAoh3K+zzd4m
	 1TJoV8gYId9iF8pK2PVvnbm5qaX2vg0fgAgBYcy8=
X-QQ-mid: zesmtpgz5t1770191762tfb731d52
X-QQ-Originating-IP: wamgZHZyXtb/Wamzb/vhrOl1LHkiXd86kO3zSwyooNY=
Received: from LT-LiangZhen-R ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Feb 2026 15:56:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12210256409155211437
Date: Wed, 4 Feb 2026 15:56:01 +0800
From: =?GB2312?B?wbrV8g==?= <liangzhen@linux.spacemit.com>
To: suzuki.poulose <suzuki.poulose@arm.com>, 
	coresight <coresight@lists.linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: mike.leach <mike.leach@linaro.org>, 
	james.clark <james.clark@linaro.org>, 
	devicetree <devicetree@vger.kernel.org>
Subject: coresight: Device tree dependency cycle warnings with bidirectional port references
X-Priority: 3
X-GUID: EA8AF5BC-6891-48F5-BFDA-39702A2548A4
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.432[cn]
Mime-Version: 1.0
Message-ID: <B7BF3F62D29F477F+202602041556010998302@linux.spacemit.com>
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NkN7Hk1lyTEB+vLj7dRZmAeY+QzqIWUVSfi5Fe2swxFxIDTRJBVkjoR1
	0x9zKHPpdWJ7v46EKT2Y81bEHU/l9Q72VhS+06oSAo1XxctvSEHREio8fIhVfCQNNGx+OUU
	zmnpvsFW9dKleblmW26HXcrKT7zP5ihgKEmDa4EaNSFG2v7YsEU91X5Wa1lJ+FaxetEcKk8
	OXFMoiGG4wZcdNWzGQ5v64xSq7cAzVNkGsPgPTtSg4RMwN8aRi7xeHd5MU6BSkQbeGJWHwn
	9d8qzltmuAKCwSo5lolVJLWWdeu+clWKTDWnKOrdKX3MIOl8i9Pkc9Xhq1Qo0heFI9JVsy6
	Mx7m2FPBM58lB51Alr0I+Lgd2ASKSJbf0CUo0d6ciNRBu6SBF3ATLNP7cbEk/5QNLvHG56e
	XttdBhOtbLiBIbxOonObIj+TSntjnKSJdn2YXBiKWxC5QgddxEj84QrPCEnfNhpunXQ0v93
	HCHJZgMDXzJgHNBZvtsSVNu0gb/4TtG58oJAtRV8rG4vPgtstNLW2cKf+dp1CW8vZ1pcBsK
	AooYEwnGS7qqLTIXPRwoK3w6xgyMGcUypVF+hQG74XNAoqjKS6HZXg0zpM/whKnxnUumzzF
	tAiSVTQELTwN0SEVnFZogCox6CXhFZimiND20VfEcG4X262PUBhvgBlnKNw42oLcxP6b2zC
	pLhgVgXwTXu8ICP11ciUnAlHEKRIguVo5tkkhdh9fD6PzsTiyLVFahHStcsUx9lZGdW8Dy+
	AO2jDUSjnF2GXP8DEZVeq1tYwl9lwhp4bJv5e6f8I/pMdnWAH5milliGw5uWuaEO9NNptM6
	pRX036qdAER41lCLAV62NChP2Dtr34sClK8x4OFlGjguYqmFADZ6DXHdlzlZonKLejGFj/p
	pbi5jcjqTAdGKz6z0glBw2NfrqxOcKM+6dt8Z1g1U46bB5TItlDYkbjOhrFAQGTtEp67GKi
	2QDi9T/SkoCmBtkn3SrEB/MrhNMnyOw/LaQWR8BE+WmYMUg==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_235647_551267_FDEF5ECB 
X-CRM114-Status: UNSURE (   5.21  )
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

SGkgQ29yZVNpZ2h0IG1haW50YWluZXJzLAoKSSdtIHdvcmtpbmcgb24gYWRkaW5nIENvcmVTaWdo
dCBzdXBwb3J0IGZvciBbeW91ciBTb0MvcGxhdGZvcm0gbmFtZV0gYW5kCmVuY291bnRlcmluZyBk
ZXBlbmRlbmN5IGN5Y2xlIHdhcm5pbmdzIGR1cmluZyBib290IHdoZW4gZGVmaW5pbmcgdGhlCmRl
dmljZSB0cmVlIHRvcG9sb2d5IHdpdGggYmlkaXJlY3Rpb25hbCBwb3J0IHJlZmVyZW5jZXMuCgoj
IyBQcm9ibGVtIERlc2NyaXB0aW9uCgpXaGVuIEkgZGVmaW5lIHRoZSBDb3JlU2lnaHQgdG9wb2xv
Z3kgaW4gZGV2aWNlIHRyZWUgd2l0aCByZW1vdGUtZW5kcG9pbnQKcHJvcGVydGllcyBpbiBib3Ro
IG91dC1wb3J0cyBhbmQgaW4tcG9ydHMgKGFzIHNob3duIGluIHNvbWUgZXhhbXBsZXMpLAp0aGUg
a2VybmVsIHJlcG9ydHMgZGVwZW5kZW5jeSBjeWNsZSB3YXJuaW5nczoKCi4uLgpbICAgIDIuMDky
MjQzXSAvc29jL2Z1bm5lbEBkOTA0MjAwMDogRml4ZWQgZGVwZW5kZW5jeSBjeWNsZShzKSB3aXRo
IC9zb2MvZXRmQGQ5MDQzMDAwClsgICAgMi4wOTk4NDNdIC9zb2MvZnVubmVsQGQ5MDQyMDAwOiBG
aXhlZCBkZXBlbmRlbmN5IGN5Y2xlKHMpIHdpdGggL3NvYy9ldGZAZDkwNDMwMDAKWyAgICAyLjEw
NzM1OV0gL3NvYy9ldGZAZDkwNDMwMDA6IEZpeGVkIGRlcGVuZGVuY3kgY3ljbGUocykgd2l0aCAv
c29jL2Z1bm5lbEBkOTA0MjAwMApbICAgIDIuMTE0ODk5XSAvc29jL2V0ZkBkOTA0MzAwMDogRml4
ZWQgZGVwZW5kZW5jeSBjeWNsZShzKSB3aXRoIC9zb2MvZXRyQGQ5MDQ0MDAwClsgICAgMi4xMjIy
MzRdIC9zb2MvZXRmQGQ5MDQzMDAwOiBGaXhlZCBkZXBlbmRlbmN5IGN5Y2xlKHMpIHdpdGggL3Nv
Yy9ldHJAZDkwNDQwMDAKWyAgICAyLjEyOTQ5Ml0gL3NvYy9ldHJAZDkwNDQwMDA6IEZpeGVkIGRl
cGVuZGVuY3kgY3ljbGUocykgd2l0aCAvc29jL2V0ZkBkOTA0MzAwMAoKIyMgQ3VycmVudCBEZXZp
Y2UgVHJlZSBTdHJ1Y3R1cmUKCiAgICAgICAgICAgICAgICBldGY6IGV0ZkBkOTA0MzAwMCB7CiAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXJtLGNvcmVzaWdodC10bWMiLCAi
YXJtLHByaW1lY2VsbCI7CiAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHhkOTA0
MzAwMCAweDAgMHgxMDAwPjsKICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZkdW1t
eV9jbGs+OwogICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJhcGJfcGNsayI7
CiAgICAgICAgICAgICAgICAgICAgICAgIG91dC1wb3J0cyB7CiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcG9ydCB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBldGZfb3V0X3BvcnQ6IGVuZHBvaW50IHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZldHJfaW5fcG9ydD47CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9OwogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIH07CiAgICAgICAgICAgICAgICAgICAgICAgIH07CiAgICAgICAgICAgICAg
ICAgICAgICAgIGluLXBvcnRzIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0
IHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV0Zl9pbl9wb3J0OiBl
bmRwb2ludCB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJlbW90ZS1lbmRwb2ludCA9IDwmbWFpbl9mdW5uZWxfb3V0X3BvcnQ+OwogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB9OwogICAgICAgICAgICAgICAgICAgICAgICB9OwogICAgICAgICAgICAgICAgfTsKCiAg
ICAgICAgICAgICAgICBldHI6IGV0ckBkOTA0NDAwMCB7CiAgICAgICAgICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiYXJtLGNvcmVzaWdodC10bWMiLCAiYXJtLHByaW1lY2VsbCI7CiAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHhkOTA0NDAwMCAweDAgMHgxMDAwPjsKICAg
ICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZkdW1teV9jbGs+OwogICAgICAgICAgICAg
ICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJhcGJfcGNsayI7CiAgICAgICAgICAgICAgICAgICAg
ICAgIGFybSxzY2F0dGVyLWdhdGhlcjsKICAgICAgICAgICAgICAgICAgICAgICAgaW4tcG9ydHMg
ewogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnQgewogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZXRyX2luX3BvcnQ6IGVuZHBvaW50IHsKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0g
PCZldGZfb3V0X3BvcnQ+OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9OwogICAgICAgICAgICAgICAgICAg
ICAgICB9OwogICAgICAgICAgICAgICAgfTsKCiMjIFF1ZXN0aW9ucwoKVGhlIGtlcm5lbCdzIGZ3
X2RldmxpbmsgbWVjaGFuaXNtIGRldGVjdHMgYW5kICJmaXhlcyIgdGhlc2UgY3ljbGVzLAogICBi
dXQgY2FuIEkgYXZvaWQgdGhlbSBpbiB0aGUgZGV2aWNlIHRyZWUgZGVmaW5pdGlvbj8KClRoZSBz
eXN0ZW0gd29ya3MgY29ycmVjdGx5IGRlc3BpdGUgdGhlIHdhcm5pbmdzLCBidXQgSSdkIGxpa2Ug
dG8KdW5kZXJzdGFuZCB0aGUgcHJvcGVyIHdheSB0byBkZWZpbmUgdGhlIHRvcG9sb2d5IHRvIGF2
b2lkIHRoZXNlIG1lc3NhZ2VzLgoKVGhhbmsgeW91IGZvciB5b3VyIGd1aWRhbmNlIQoKLS0tLS0t
LS0tLS0tLS0KCkJlc3QgcmVnYXJkcywKbGlhbmd6aGVuCgo=


