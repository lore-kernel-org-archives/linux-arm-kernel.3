Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A020CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 11:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZY0TaR0lC4S2TgNgdNdDMXFGf+5ruq2DrjC9kwy0CRU=; b=yS0WmUEfAgu15uyHfxhXr3LxyJ
	W4Yj68qH25eO/Lg+0mr9miF8Y79OAbnXk8HYfKc/LaCq9R2uValsrQdOwmzope8jJCMrW/FkymzbZ
	uCuJlQ/lV2mIb60BqNOJqaB5rL8aKBYS6CAzozp4Zl2ZLKkKDX6fmhwqtq8u09mr3S8KoVYUcK/QX
	llhkjBbwpB554K9tAfevqQrfIl95sYoa0Hlj3HxpLpvYewqfEnwFju0BBz8b06eaEb3E7o75NBmb9
	j4x9leMQ+FU+/c2oEhUgw4VdlpAvzxfZ3hHVNcdsI9LcUhxR9HrxUkrk4lIC+pZYcwhZcjZ8j43tb
	jfCa6cxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfRi-00000002W8W-3D4G;
	Mon, 23 Jun 2025 11:34:42 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeI0-00000002KUd-1zL8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 10:20:38 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bQk294JMVz9skH;
	Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2L25sduycuWc; Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bQk293bFcz9sgs;
	Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 743568B764;
	Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id a4DFXxeF3oKN; Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
Received: from [10.25.207.146] (unknown [10.25.207.146])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1FD2B8B763;
	Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
Message-ID: <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu>
Date: Mon, 23 Jun 2025 11:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Qiang Zhao <qiang.zhao@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
 <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_032036_676099_85EEE9AB 
X-CRM114-Status: UNSURE (   9.89  )
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

Hi,


Le 23/06/2025 à 09:33, Bartosz Golaszewski a écrit :
> On Tue, Jun 10, 2025 at 2:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
>> values") added new line setter callbacks to struct gpio_chip. They allow
>> to indicate failures to callers. We're in the process of converting all
>> GPIO controllers to using them before removing the old ones. This series
>> converts all GPIO chips implemented under drivers/soc/.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>> Bartosz Golaszewski (2):
>>        soc: fsl: qe: use new GPIO line value setter callbacks
>>        soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks
>>
>>   drivers/soc/fsl/qe/gpio.c       | 6 ++++--
>>   drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
>>   2 files changed, 9 insertions(+), 5 deletions(-)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
>>
>> Best regards,
>> --
>> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
> 
> I see Geert queued patch 2/2, who would take patch 1/2?


It is in my pipe for v6.17 but if someone else wants to take it I can 
Ack it instead.

Christophe

