Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C149FC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zYnADuB1omVVNFz9gr6KBNHrzpB/zuL9AsY/vK5ho+A=; b=mA+wjgHHVctNLl/+RCtlMCdDoA
	wOBtd3YKoebcET3WmrPoexF/Ab6mO10QGSmYUFydcD7fcWT6GvSyblMeupzR5c1mBA7NNQmjUzqSo
	tftpuO9Ml3jwA/E4lgUYc7JeA50anfVp7DhDDVmn3Q1V9FTrL9DCBK0C/1UX5g5BL7wDNLbSKH5JK
	htXuefCn0RpJOERBiQqA3PnFj8YMVzNOC2BZfITGq5q1JSS9/yOd70+tcb5VCIyYb1Evrb8HP2U0K
	uh/gABqXX7XTq0U3+OK7TQW4SD6naMeN8B4c6swpUG9ei2L3d7U6UTU3+i74qx4tjvWg6SyLKhSRL
	IKFmFbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt4C-0000000DtlA-2mUy;
	Wed, 15 Jul 2026 06:26:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt4B-0000000Dtkf-3hiI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Jul 2026 06:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zYnADuB1omVVNFz9gr6KBNHrzpB/zuL9AsY/vK5ho+A=; b=JfEqvGKuzCqwfp7FUTIp5nEM0w
	hqwPrzebOXmqwybXyUrem5BIO2JSrnO69vnUK3BOxjY5hpme1Fa1pZlKoIrGJyFoOGdbsmZhXRWtq
	KlkBZIIa7943YiI4arT5sZZi6EYVofwKpsUw3Vvwhv6Nd5stKae9Mqw4GC0jSQm954E9+UIX+9ec6
	aJDpm49RiRuvoc76gm5HUGj5SAW/5KF2gk8AaITYLQk0tGXhjINcgtIsEmj5MmxdAzwddLaMYFLX1
	80wzxtAx9/NIjwTleCroV+aMvFikeC6xua2yYTGWvdZKrFLdHhcePs///UJSmb/XctVVYCoqONGqh
	cXk6teZQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjt48-0000000D42a-0puM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:25:58 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66F6PFfpC2663998, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784096715; bh=zYnADuB1omVVNFz9gr6KBNHrzpB/zuL9AsY/vK5ho+A=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	b=Q+GUrK9lbZwHF/YkC9om6KzSTXeuFXCHDjV7/D2unKV0nbIn/jZG46jN7HhvMiBuh
	 5pgXkYJBRXlOYjRY/Q8c+7wAik2eWBAFehJ+6d6ARKGAHbCxyffZWKF7ATZP2cr2Rw
	 TLBPfvjwoiri9dJt6CR8rXqGQmiU7w3V8n4vILU6DHoaImmstPYj/Bnl0SuRWsQsju
	 5LxGcQOtlCRZ9QRwcv3/9lqJVU5ZNr4CXi/bihaDDu6jEUWYgRXc3WIdcZVkA8SgCY
	 F8QMHNlFaDXaf/hDdKsT1rLi4I2oKDOt8cNK0H+XizSOs2X6B38iVcVPVF3r/5Qdly
	 gGDnRkJGfJQcw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66F6PFfpC2663998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Jul 2026 14:25:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 15 Jul 2026 14:25:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Wed, 15 Jul 2026 14:25:14 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: "broonie@kernel.org" <broonie@kernel.org>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "afaerber@suse.com"
	<afaerber@suse.com>, "linux-next@vger.kernel.org"
	<linux-next@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>
Subject: Add the Realtek SoC tree to linux-next
Thread-Topic: Add the Realtek SoC tree to linux-next
Thread-Index: Ad0UIgN2HRUL2/vgRv6ug1MnyYCpjw==
Date: Wed, 15 Jul 2026 06:25:14 +0000
Message-ID: <555485abc39a4ad1b252b4fd7c5bf706@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_072556_689639_702B564A 
X-CRM114-Status: UNSURE (   6.70  )
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

SGkgTWFyaywNCg0KSSBhbSB0YWtpbmcgb3ZlciBhcyB0aGUgbWFpbnRhaW5lciBmb3IgQVJNL1JF
QUxURUsgQVJDSElURUNUVVJFLCB3aGlsZQ0KQW5kcmVhcyBGw6RyYmVyIG1vdmVzIHRvIGEgcmV2
aWV3ZXIgcm9sZS4NCg0KQ291bGQgeW91IHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0byBsaW51
eC1uZXh0Pw0KDQotIEdpdCByZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveXVfY2h1bi9saW51eC5naXQNCi0gQnJhbmNoOiBmb3It
bmV4dCAmIGZpeGVzDQoNCkJlc3QgUmVnYXJkcywNCll1IENodW4gTGluDQo=

