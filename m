Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A59ECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcbdoLxDA3zzu6+tQsJ0HBuEZnJCcoydAWE/zKuA86Y=; b=HtU1TKynnuhiP4kWsMG3Xb+Mwr
	ddnns3c8iQfJSwpJ84ve2EyPDFpY0jHzvjWMH5KbJI9835TtI2Ga/kGtHrlN6wRm7JtRCsWoqU81E
	LNvEpF8TgoYetxuZ1ltwDBj5/jenZ3NkBfvcxCHOS2sZ+Mq5ANSbaYadao6KGvzhwljn0L5BGdONV
	s9knM7NCpK2teDX7kvHYSy2FIKG7YOF2C31UqgoDVvw7Z0Bg2p55jBSiIeYtsSl3iZ2TehrLI74uU
	U6rOeRGQHsE7FubGWh9ZrsTErRDqn8xz0Lop8x9gbZ0vitEdOU8CNZJVKK+Ztx0xevYik9RKX5CA0
	KMFwKP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG1O-0000000E3uo-03Mn;
	Thu, 04 Sep 2025 19:53:26 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuBxk-0000000CZ4c-2Sg1;
	Thu, 04 Sep 2025 15:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756999979; x=1757604779; i=markus.elfring@web.de;
	bh=bcbdoLxDA3zzu6+tQsJ0HBuEZnJCcoydAWE/zKuA86Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Z3imr4R503JOFN4NtRyMT2crDfCkGZhQTKcmCECIUAYqQ/XgDW5j2NIh4HzGQiK4
	 vuosxDsIUqbGBwiEH7XR2RYr2SXKMpASdLaGCVw22Px/KlFor4i5642S40LHgRRri
	 vFvAHdFU07oqXdgVSEDWtzUR/h+gR11V3PnRlhtAI4hLVVyYv0OO298rY3p7KEpA8
	 5Z3hwGnG73Ger2l0cwHXP/3AhE5FY1etwmYFjR18H/a7jCi4lOCscxnVkvoq9bEq7
	 XtT7sLKzmtO8iU5uv5vzBv6CEBJsgpE/ZkO8iTgD8TudyIyX0I4U4rL7q91G+bvFu
	 aOPFW2k2qhQgAV6iPg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.243]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3V26-1uukBd2JBS-008pB6; Thu, 04
 Sep 2025 17:32:59 +0200
Message-ID: <cb543d86-e126-451c-be24-8134a565ca73@web.de>
Date: Thu, 4 Sep 2025 17:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>
References: <20250903121452.387023-1-liaoyuanhong@vivo.com>
Subject: Re: [PATCH] PM / devfreq: mtk-cci: avoid redundant conditions
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250903121452.387023-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pJp4Qkbp1S4xUB8xjVwU0pA4IbbgezF5guW59Fp60uH6NbEJoCj
 edwftDFrKk9TksYMsKSZQQw5uXLOeUwWhHtrGCGYfLQtooP4eJuvjz4XMMT6yF4VVImRCSZ
 NYrEwFy5Ha+hF8AotbFiQGKy+rIdOzNZNBRxmzBlOHcUYBULH5uvh+nhBSY0G+0+QrqupJ1
 4fIgrNnctYRYkK6PPOjBA==
UI-OutboundReport: notjunk:1;M01:P0:w0kjdzeNLC8=;hXIa40rQaEEM+kihm0QUAIRO7Nq 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_083324_988238_38FE72BF 
X-CRM114-Status: UNSURE (   5.23  )
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

=E2=80=A6
> it avoids writing out a condition that is unnecessary. Let's drop such

                                                         Thus?


> unnecessary conditions.

  an unnecessary condition?


Would a summary phrase like =E2=80=9CAvoid redundant condition in mtk_ccif=
req_set_voltage()=E2=80=9D
be nicer?

Regards,
Markus

