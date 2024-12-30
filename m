Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D19E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 07:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLxL5SjnatJ2CxT1Dyhq1eTZZV9BxGEXkjm5mWdsrJA=; b=JCS0tL0cx1LI0ygYPpQh0S9yro
	6O82DQe1A4Ad5aUG4PSQA2sFElwnYy+DngP4ZdEVx6xRrqZaLxwbRpeGGcS5wjB87f9CYg2IP7APk
	ux9F7CrwVJzV/evX5+eh9gxKW549V8cywDvN/jClUF9kJhG8qaoSQrzpe9gi5TOu79UHeX4IB3Of+
	kycu/ZlnOdZgi9X7H7K94PXvJ10VSlHD3q38B9gDTTLnIR4T3cU7dCSfW2GVb+MIkhmtgQiJSd5dg
	IYzDfvX2fqhPJu8QkH/RYT6vBgtbD1mYuPMts9/W+YTN0uEo97V5/LB4Go9x7REz3lZ1Xwd7T7AlE
	QzLBkKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSABh-00000004jB8-1j52;
	Mon, 30 Dec 2024 07:27:41 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAAT-00000004j2Q-2DN1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 07:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1735543557; x=1736148357; i=markus.elfring@web.de;
	bh=RLxL5SjnatJ2CxT1Dyhq1eTZZV9BxGEXkjm5mWdsrJA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=haWzLIcnFACCyzx+YFoV6uP9nDKZFXbJyFz7jHeLYjh6iGiQRC2IAK9mRC8fSEzw
	 FtQS/p5eamr8N9QsfM3D3HGXm3GMD8NPue4aQD2ztAzQJpe8TNSzQXNRk8VabRhjt
	 WSeghY+mk1l1ig2Z5+u+gVQyifdl/V4N6U5Gl2UXEyOhtnQ2iuRN4tPMwvaHljPOz
	 8pKXnrr38F2GM6aqBEWbs4GWNmHVMBFBLOJv2sRNweTwjsk/jWmPZJLUeA8vPmkrK
	 lLkz4RSCV7ihQ0V1RmwYEFQoOBg7xgS2OG+JjMeTqlBFkThC0uIb3V8GOqc8aMqm6
	 es3dA0sLkGwbwcBTkg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.93.2]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MA4fW-1tL2Mh24Ta-00EiaN; Mon, 30
 Dec 2024 08:25:57 +0100
Message-ID: <5a984b5c-7994-4671-8397-df7780e40c0c@web.de>
Date: Mon, 30 Dec 2024 08:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charles Han <hanchunchao@inspur.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>,
 Marc Zyngier <maz@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Sven Peter <sven@svenpeter.dev>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, asahi@lists.linux.dev
References: <20241230035714.72780-1-hanchunchao@inspur.com>
Subject: Re: [PATCH] cpufreq: apple-soc: Fix possible null-ptr-deref for
 cpufreq_cpu_get_raw()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241230035714.72780-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ipNNiP3gGa6cA3yNI4L6LC3uAhq5wmQy+agdhYD/7/4Sh2Ki1zH
 dA6fS5vKwr3nBWFCkcBNr/FAJ50POG1UOP94+HJoq9P1utw13jxVKs1s3LwG5beIoZFpOkT
 KFMpF3xprqBiQVh1tig2kPV6UBaUSZLe8vK6YoL7zNtjk70oJHRyhkI23ECsWpI906MBTRy
 Mhd3CCLHtvVNr8Ef1/zbQ==
UI-OutboundReport: notjunk:1;M01:P0:xVd1DOexdgY=;4ngZNABOAt+6sHne9eTLjk0tPoG
 LCvwpOw5qdPQ4CA6Xq870NpAzs85VoiFlw9IO5/0TbHscIaqYAG/Qjz8bDjj5Bbe3Q9ySblti
 ZPwVu5OerWcJmHCkcnH+Xpux/BXbXETo3uIOKAV+amwVK1AGr3B6imIhNc4pqkkwImcutAeWm
 RMDNJ9TndQVqH+ri6HDJ++TKY2IabekCk6VFvUpP7ibTl5D0gt3AXBGcCeZ3uJRTSk+lGhGjf
 RjyMNhF/fXWHlq1BAXBvtCM0XekRxYFO5CpsVhGpWhjDe5VqUHQ7152WZYIF0RIU8JXwbcqIo
 bToja1/VcsxR5M0jSwXkjRpKtMeFYul/85RrgDYDjUuKZcv0hPZ1kq1KyETYl4tguneIISHhL
 wNAdsFDdRdK0UalZ3jVWMEK/SYt/j/B/x/eX9n4bBJFh7XYbsrYEU49YSYxE8Q64HXQR+ePbm
 1gIoL4nzTpeoYj8eOEws10gVs5mtOHP4e5NOyoMRyoi34jelLLgdJvh9TF8TWWLw3GvdgtPr7
 5CWO8J6T70n9RjXTD4qMg5YtzQSt2lA3YsfoZ6v5K0C7DCcwUMt3vPlRHFf2Tl0g68hIXP0js
 nhR0x35aFokPzcVE/vyFvlmNcwUYeLqPdIZjPyjYZVDwpR6HWVUGvWtegltfRjN0uQUo/oo1i
 2g4HAcxmma1aW9Ct1jN0xjAByk2M7vGNKeAUuPjJTelrjeFUCLubAPfo08c57fWnojqUiOOY5
 XqcgyIspnffBcNaISTvg8bWWQLJcjEIZPaIWU18B2c2yfGxvMXr2xP1Z/KBD5zv+9rof6xTo8
 4iULaTfTnDlu48yQsTTuL/UhKU1/E8kZ+QZO9O0wuY2NlF0W+d28pE/XqK+hgKiNi+UbhrWYN
 vJuLJIdTbhgWjGsvMcy684dsy3mPuoMWyR//UTFJosCulUktdm5k3ZQXLCu41AM9trCJOv4xp
 kbp7m2RsMqMW6kY6eGpbmJ7zUp5YqGs3ML0pxxernJAeCxwXLGVWkoS0PQ0b/mEUfdK3x12e7
 IqUmVwdVwnD4Cxva8i9M3nUsnrJ9WLUTYU6iww+T3B/9edrYhYeLiWINfj/CsiS2u0g2BUpzw
 oCHcj5J3Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_232625_955457_24A0F3E9 
X-CRM114-Status: UNSURE (   4.78  )
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

> cpufreq_cpu_get_raw() may return NULL if the cpu is not in

                                               CPU?


> policy->cpus cpu mask and it will cause null pointer dereference.
=E2=80=A6

Would the summary phrase =E2=80=9CPrevent null pointer dereference in appl=
e_soc_cpufreq_get_rate()=E2=80=9D
be a bit nicer here?

Regards,
Markus

