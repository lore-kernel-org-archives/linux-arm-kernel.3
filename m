Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C761CCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxaORI2tt4nM+VV8pHB99Q3gl2ljqCHzG6OK2bMQjwE=; b=PCiOgN3dXqQ96801iUFhOiR8Gn
	Ua+8fbFoMPHsQ2Cy4y2QnfXhxl5OSVGDhAbEIkxYX3GnsWNcR8VDH/tFVN7kv7wALQbMjw4zemePO
	2ExvPnMBrwfjvTv73tZyLU4LsAcJLdV+UmMwlY4d5XiKqtUXwFvVaquvehxv2tNyScsxmh1prKosD
	0a4AGGRVGrbN1WSZTvFJF1TK6Ri1bzO39J0ccpKbQqO9mkYZzAZmr4aL6f/pylj9ZIeC5nK5rltQI
	UeeDD7A1eZlHWsQGnQPBUySVNIR7t7G7JoMoTgikHQeeYsUC4DiwiIOLEwWgQxY0grfhJkbCHgkfu
	x9HXlsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4KO-00000008I5o-0jRN;
	Mon, 18 Aug 2025 18:11:28 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3XA-000000087TI-00z5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:20:38 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c5K1X3wsYz9sSW;
	Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrZScAyopd0z; Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c5K1X2hLYz9sSV;
	Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 44EC58B764;
	Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aw5_3grXJjSH; Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EC3B8B763;
	Mon, 18 Aug 2025 19:08:47 +0200 (CEST)
Message-ID: <732b5fb6-ec38-43d9-b544-b27802a844ab@csgroup.eu>
Date: Mon, 18 Aug 2025 19:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Conor Dooley <conor@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
 <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>
 <20250818-tyke-pungent-20d9ffd47ecc@spud>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250818-tyke-pungent-20d9ffd47ecc@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_102036_202233_67C4B9A1 
X-CRM114-Status: GOOD (  16.04  )
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



Le 18/08/2025 à 19:03, Conor Dooley a écrit :
> On Mon, Aug 18, 2025 at 10:45:57AM +0200, Christophe Leroy wrote:
>> In the QE, a few GPIOs are IRQ capable. Similarly to
>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>> GPIO"), add IRQ support to QE GPIO.
>>
>> Add property 'fsl,qe-gpio-irq-mask' similar to
>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>>
>> Here is an exemple for port B of mpc8323 which has IRQs for
>> GPIOs PB7, PB9, PB25 and PB27.
>>
>> 	qe_pio_b: gpio-controller@1418 {
>> 		#gpio-cells = <2>;
>> 		compatible = "fsl,mpc8323-qe-pario-bank";
>> 		reg = <0x1418 0x18>;
>> 		interrupts = <4 5 6 7>;
>> 		fsl,qe-gpio-irq-mask = <0x01400050>;
>> 		interrupt-parent = <&qepic>;
>> 		gpio-controller;
>> 	};
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v2: Document fsl,qe-gpio-irq-mask
>> ---
>>   .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 ++++++++++++++++++
>>   drivers/soc/fsl/qe/gpio.c                     | 20 +++++++++++++++++++
>>   2 files changed, 39 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
>> index 09b1b05fa677..9cd6e5ac2a7b 100644
>> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
>> @@ -32,6 +32,15 @@ Required properties:
>>     "fsl,mpc8323-qe-pario-bank".
>>   - reg : offset to the register set and its length.
>>   - gpio-controller : node to identify gpio controllers.
>> +Optional properties:
>> +- fsl,qe-gpio-irq-mask : For banks having interrupt capability this item tells
>> +  which ports have an associated interrupt (ports are listed in the same order
>> +  QE ports registers)
>> +- interrupts : This property provides the list of interrupt for each GPIO having
>> +  one as described by the fsl,cpm1-gpio-irq-mask property. There should be as
>> +  many interrupts as number of ones in the mask property. The first interrupt in
>> +  the list corresponds to the most significant bit of the mask.
>> +- interrupt-parent : Parent for the above interrupt property.
>>   
>>   Example:
>>   	qe_pio_a: gpio-controller@1400 {
>> @@ -42,6 +51,16 @@ Example:
>>   		gpio-controller;
>>   	  };
>>   
>> +	qe_pio_b: gpio-controller@1418 {
>> +		#gpio-cells = <2>;
>> +		compatible = "fsl,mpc8323-qe-pario-bank";
>> +		reg = <0x1418 0x18>;
>> +		interrupts = <4 5 6 7>;
>> +		fsl,qe-gpio-irq-mask = <0x01400050>;
>> +		interrupt-parent = <&qepic>;
>> +		gpio-controller;
>> +	  };
>> +
>>   	qe_pio_e: gpio-controller@1460 {
>>   		#gpio-cells = <2>;
>>   		compatible = "fsl,mpc8360-qe-pario-bank",
> 
> Why is there a binding change hiding in here alongside a driver one?

I did the same way as commit 726bd223105c ("powerpc/8xx: Adding support 
of IRQ in MPC8xx GPIO")

Should it be done differently ?

Thanks
Christophe

