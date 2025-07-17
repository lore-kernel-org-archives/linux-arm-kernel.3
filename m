Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75822C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 02:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cu/yDUrxST+1uvsl2WRsJcz+fPWrEMdPUqli4QG1bzU=; b=CCUXLWiuRz3s5YqCkfY4lGfEXB
	6H2tDDqEGbeWPr4K/XKSRLz7TrJbaCaiXGZc/68fcTGKfymg2ElsqBgBQIWPJd4r73y2VLsORwnn2
	dYv+pemtyrGB/hgOF2MfHvzukwrT4dfKlfAzr3VqQ80UGjT0WeaUP50y+NA4SeN5/oqk9ymXs8Ick
	eTEf7ZGuD0KstFuOB2oe2J7MpqANvY24fDHRMtSfIxFeV/IURJUTMF56wbz14GbsPeIrTv3XtI4r5
	6edgsOeBpCFv0rlahzMmEV05zOqc6KJlHXUrvv4W3MBpWlDBGbCoOr0efRvIVjo7qgUkb234/mj2J
	6zN1QvVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucE1i-000000092WJ-0Yuv;
	Thu, 17 Jul 2025 02:07:14 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucDzH-000000092N5-0jgw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 02:04:44 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 56H22LlB062816;
	Thu, 17 Jul 2025 10:02:21 +0800 (+08)
	(envelope-from haiyan.liu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4bjGKN62JQz2K925k;
	Thu, 17 Jul 2025 09:58:00 +0800 (CST)
Received: from BJMBX01.spreadtrum.com (10.0.64.7) by BJMBX02.spreadtrum.com
 (10.0.64.8) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 17 Jul
 2025 10:02:18 +0800
Received: from BJMBX01.spreadtrum.com ([fe80::54e:9a:129d:fac7]) by
 BJMBX01.spreadtrum.com ([fe80::54e:9a:129d:fac7%16]) with mapi id
 15.00.1497.048; Thu, 17 Jul 2025 10:02:18 +0800
From: =?utf-8?B?5YiY5rW354eVIChIYWl5YW4gTGl1KQ==?= <haiyan.liu@unisoc.com>
To: Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
        Matthew Maurer <mmaurer@google.com>
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Miguel Ojeda
	<ojeda@kernel.org>,
        =?utf-8?B?5ZGo5bmzIChQaW5nIFpob3UvOTAzMik=?=
	<Ping.Zhou1@unisoc.com>,
        =?utf-8?B?5Luj5a2Q5Li6IChaaXdlaSBEYWkp?=
	<Ziwei.Dai@unisoc.com>,
        =?utf-8?B?5p2o5Li95aicIChMaW5hIFlhbmcp?=
	<lina.yang@unisoc.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>,
        =?utf-8?B?546L5Y+MIChTaHVhbmcgV2FuZyk=?=
	<shuang.wang@unisoc.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        "Alexander Potapenko" <glider@google.com>,
        Andrey Konovalov
	<andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Vincenzo Frascino
	<vincenzo.frascino@arm.com>,
        "kasan-dev@googlegroups.com"
	<kasan-dev@googlegroups.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        =?utf-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?=
	<arve@android.com>,
        Todd Kjos <tkjos@android.com>, Martijn Coenen
	<maco@android.com>,
        Joel Fernandes <joelagnelf@nvidia.com>,
        Christian Brauner
	<christian@brauner.io>,
        Suren Baghdasaryan <surenb@google.com>,
        "Jamie
 Cunliffe" <Jamie.Cunliffe@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: =?utf-8?B?5pKk5ZueOiBNZWV0IGNvbXBpbGVkIGtlcm5lbCBiaW5hcmF5IGFibm9ybWFs?=
 =?utf-8?B?IGlzc3VlIHdoaWxlIGVuYWJsaW5nIGdlbmVyaWMga2FzYW4gaW4ga2VybmVs?=
 =?utf-8?Q?_6.12_with_some_default_KBUILD=5FRUSTFLAGS_on?=
Thread-Topic: Meet compiled kernel binaray abnormal issue while enabling
 generic kasan in kernel 6.12 with some default KBUILD_RUSTFLAGS on
Thread-Index: AQHb9r7T3quLQs5+RfaRTr3Yr7SnUQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Thu, 17 Jul 2025 02:02:18 +0000
Message-ID: <484211314e1f4a7990a43852db79fb20@BJMBX01.spreadtrum.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.93.65]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com 56H22LlB062816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_190443_481346_6D883EF6 
X-CRM114-Status: UNSURE (   2.16  )
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

5YiY5rW354eVIChIYWl5YW4gTGl1KSDlsIbmkqTlm57pgq7ku7bigJxNZWV0IGNvbXBpbGVkIGtl
cm5lbCBiaW5hcmF5IGFibm9ybWFsIGlzc3VlIHdoaWxlIGVuYWJsaW5nIGdlbmVyaWMga2FzYW4g
aW4ga2VybmVsIDYuMTIgd2l0aCBzb21lIGRlZmF1bHQgS0JVSUxEX1JVU1RGTEFHUyBvbuKAneOA
gg==

