Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF2FC44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3Uvvc89ZyhC/2l0kWHUOv8Kh0Rk4Djzn4cHdBmAl+0=; b=OcygqipKVw9ZFt1qs1jK/OZ74d
	7IpeosN/a1Ycttq5d4i61Yd+ij0M8jyfF7jLFmdrZCAjtB+sNESTVABF5XEhtvBUT3gH+rwQN459s
	/cgLdNbLSQxahqXUNCeONtmPxEFNK4Jsnv/LFp2AQP23j1r8J/mWmgWpWi08RTQqaZFFPFIo/qAMS
	NFnoSpTnNJrS1htnYDNpChm6RhXgByOZ3kQKULcXetIqJtz9/yHvrFeDseu0exgDkU5E+cRCevQTJ
	6YzSrO/Q3wuunG2v/ikIPzir+KEC2b8Ddii933LjD+at5Kl54h0vLbugEszVoZ7kTc4QSV9KkUk9a
	/kknRC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVqC-00000005J9L-34Qw;
	Wed, 21 Jan 2026 10:53:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVqA-00000005J92-3YAF;
	Wed, 21 Jan 2026 10:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u3Uvvc89ZyhC/2l0kWHUOv8Kh0Rk4Djzn4cHdBmAl+0=; b=C0js738PaCs/NcWSvdz2064iYC
	8IiFc9QXRGqj/C8SqQfidxIrxenza28DnTaY5zOPZvOLnhiMrV1TRZZQouhyQFOCHAjfB9xCsKwaO
	sAWZBVn/N0mQAiRjY9aofYbDgkZOzry/xQvd/Y/uiE/1Q5VH+jAf4mdgchqcgLNadF8d6UNi6bw35
	pX65FNGNXmSWb+YIAj7n38Oks/RU1Apq7WQYarNPlrbEzd4ZyflGLXRqtrHs12ASf1klbPlP6/wa8
	C/OQ0kVbsIIhg9ahZ+s46gh/TSVhMIqBGz9gT9ooRgXDXRGKACkR8OhXtaVvtZnoxBJDiCm2x19Fo
	VuGDA1RQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVq7-0000000FqiW-1ET2;
	Wed, 21 Jan 2026 10:53:33 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60LAopAkB2904314, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1768992651; bh=u3Uvvc89ZyhC/2l0kWHUOv8Kh0Rk4Djzn4cHdBmAl+0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=CtlDS4Z6gHC5VrGSu890zUQSnhQsMQ/FwWOyur8QIMr1/715Q7rKN9So1Rd7yydCO
	 bSHyCBeSNdNBgMsQ4+3rVk9syV/3uWcxp9G3TG0dkUmV7GU2l6wMvnkh6K+P85lilF
	 sjz+YMk0Ck9ex6uFyWgmnvlvKrmTVstsGkoFFHTVRixpvoarpntZuBUIKfo5ZMJAGw
	 QvplglYk5J4Nqq1oaIYmDCuEqJCR70VkLOZNqTTB3HUEWo5GfywaGrUYNMhBSpopm7
	 xweEcgIc6tRUxNtIB0xnuhR5a77w1hKy6YtkkazdNWpaoFLXUZq2uzzSM7rH8aYY4x
	 Sc/s41YhlBFPA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60LAopAkB2904314
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jan 2026 18:50:51 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 21 Jan 2026 18:50:51 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 21 Jan 2026 18:50:51 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Wed, 21 Jan 2026 18:50:51 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
        "afaerber@suse.de" <afaerber@suse.de>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
	<cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
	<stanley_chang@realtek.com>
Subject: RE: [PATCH v3 0/2 RESEND] arm64: dts: Add support for Kent SoC family
Thread-Topic: [PATCH v3 0/2 RESEND] arm64: dts: Add support for Kent SoC
 family
Thread-Index: AQHcba4KFMPhbTEwDkm0WvNwlSh3kbVcrAYw
Date: Wed, 21 Jan 2026 10:50:51 +0000
Message-ID: <d8af877bd3fb4291b0d09a80a981e6e1@realtek.com>
References: <20251215103157.27039-1-eleanor.lin@realtek.com>
In-Reply-To: <20251215103157.27039-1-eleanor.lin@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_105331_978494_57A7C208 
X-CRM114-Status: UNSURE (   9.22  )
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

SGkgS3J6eXN6dG9mLA0KDQpJIHdvdWxkIGxpa2UgdG8gYXNrIGZvciBndWlkYW5jZSBvbiBob3cg
dG8gcHJvY2VlZCB3aXRoIHRoaXMgcGF0Y2guDQoNClRoZSBsaXN0ZWQgbWFpbnRhaW5lciBmb3Ig
UmVhbHRlayBTb0NzLCBBbmRyZWFzIEbDpHJiZXIsIHNlZW1zIHRvIGJlIGluYWN0aXZlDQoobm8g
YWN0aXZpdHkgc2luY2UgTWF5IDIwMjMpLCBhbmQgbXkgcmVjZW50IGVtYWlscyB0byBoaW0gYm91
bmNlZCB3aXRoDQoiVW5kZWxpdmVyZWQgTWFpbCBSZXR1cm5lZCB0byBTZW5kZXIiLg0KDQpTaG91
bGQgSSByZXNlbmQgdGhpcyBwYXRjaCBhbmQgZXhwbGljaXRseSBDYyBzb2NAa2VybmVsLm9yZyBh
bmQgdGhlIEFSTSBTb0MNCm1haW50YWluZXJzIChlLmcuLCBBcm5kIEJlcmdtYW5uKSBzbyBpdCBj
YW4gYmUgcGlja2VkIHVwIGRpcmVjdGx5IGJ5IHRoZSBTb0MgdGVhbT8NCg0KQmVzdCByZWdhcmRz
LA0KWXUtQ2h1bg0K

