Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134A0F9B602
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCL1gEFUP1wdiZ4mPtneZFBWlCiHxBCt8+1MrSojH7w=; b=nOQMF7uok2nQz/6pz+sUf2DgMU
	FhY5VuNXwjhcwr2hA3zQG0EiKyN/LFisH5s7vDYWfP766uRFDb4s6PoSXjcyJZSjRLdIqzrtkzb6+
	frs/3t1m2aD/XRmcq4EX2rysPrtJ4VYdJ9lqtYHvVIb7qQAdkBS6RuHtOU729J1arzLPMtAqfA7yF
	bbsHIJiHpJoj8etJpSEsVyPHfURYrD70XyU8geCNL5vnjuZkOzcWhKXptsJpQBtKD7vkyVTrFvHPI
	7XdXsty5ztrLQmFQKtuxYElmqGnc9i6Jh2Y6KN09dT3MTWhyLclYvXSylvKqpuiQPSpp3g8+bihX/
	aIxDPIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUD9-00000009t5S-283W;
	Wed, 22 Apr 2026 09:49:35 +0000
Received: from jpms-ob02-os7.noc.sony.co.jp ([2001:cf8:acf:41::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUCz-00000009t0P-2iFI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 09:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776851365; x=1808387365;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=oCL1gEFUP1wdiZ4mPtneZFBWlCiHxBCt8+1MrSojH7w=;
  b=XyUsYtP4XvckS4YFkB18qgWHrcnNN+8drO8RTKVIgiTqXrdX4M9DJiC2
   6Tzmt7jL16mmnjAU6o064CIi9erKMWX0ywns15hAN9hVWBGbT+/2MbI37
   gMz5kR5/ClVfje3zdQi0JA9GKWHdfT96j2/wqiZEELP/zdni5dSc3Loyc
   Sn9pDZQzJsv68Z857+MhXAL7P44gXSH14UlcKPFHMv9TqUCgHgOqVpPlB
   69tW2zFedm8cfa995f5VcrjIvn/2rrO04E35eH930Udg0e9LmridKieoX
   wi5LR8XK30fRc+htDe7UX1wY9yVafpj5hH+j3lM49OlX9AVYXstq5IzAV
   Q==;
X-CSE-ConnectionGUID: 9c4r+D4HS5+mGhrsrD2I/w==
X-CSE-MsgGUID: b55DraFWTMqa7dw2iA3n0w==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 18:49:19 +0900
X-CSE-ConnectionGUID: SgthmcMQRTCdknWd7vVZsw==
X-CSE-MsgGUID: Ta60PQwYQQmW9I62Z0fNyw==
X-IronPort-AV: E=Sophos;i="6.23,192,1770562800"; 
   d="scan'208";a="51446140"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 22 Apr 2026 18:49:18 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Wed, 22 Apr 2026 18:49:06 +0900
Subject: [PATCH v3 4/4] docs: driver-api: add mod_name argument to
 __platform_register_drivers()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-acpi_mod_name-v3-4-a184eff9ff6f@sony.com>
References: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
In-Reply-To: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=15chuYpccSlT6UpH8TNwNGnGHfksA7xi4fPhMzJSTtA=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhswXM2cEchoeX80oYratR2Gj5Zx04SJxhcVGOZ+TJkb7O
 L9antrWUcrCIMbFICumyFKqVP1r74qgJT1nXivCzGFlAhnCwMUpABMJY2Nk+HNF00Fs57JPb8Uy
 XdVs19vsf8i6w+K/728jkSYh54ItnowMx7R93hRNCX8S8Stqo8+qT9IKK45LeT3mv7H9mHSG+KL
 NLAA=
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_024925_910656_17676748 
X-CRM114-Status: UNSURE (   9.30  )
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

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
 Documentation/driver-api/driver-model/platform.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/driver-model/platform.rst b/Documentation/driver-api/driver-model/platform.rst
index cf5ff48d3115..9673470bded2 100644
--- a/Documentation/driver-api/driver-model/platform.rst
+++ b/Documentation/driver-api/driver-model/platform.rst
@@ -70,7 +70,8 @@ Kernel modules can be composed of several platform drivers. The platform core
 provides helpers to register and unregister an array of drivers::
 
 	int __platform_register_drivers(struct platform_driver * const *drivers,
-				      unsigned int count, struct module *owner);
+				      unsigned int count, struct module *owner,
+				      const char *mod_name);
 	void platform_unregister_drivers(struct platform_driver * const *drivers,
 					 unsigned int count);
 

-- 
2.43.0


