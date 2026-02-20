Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E974AC55AB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MjKH69EZTy6SNbmhiR8H7qrxFI437dSH1xWPtNSfHA=; b=WlkZZyd5nbz4XC67iC3bdnka20
	9+B3bfBf7EhX0RlzJyMzWJuonUhctbCe2FeKMa1m4RswK5HdMLLkYkMTa7BbYA43ZlYilQSrhLtwz
	D2e+c9uqPfGZh98uVSgfpQY8j4z0gzYAWgBisMFWp2lxE6MCFQ7OB6mHgYAGamjonahr//q0tlmp8
	eTk/hV8pNU1bQ36H8qbdd+F3YRsEz3nDvxJKQ7jifCPV32VGhYzf/zvrXg/TQJTNDJp3rseh4QkYI
	sOfyp2Rst80q/rk50EpvVm2Z8DCcyE3QV5LHTfiP3y+cupFcWG+osLbb8fpioAzTnC9zSTzo0yq0P
	HsqNBLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQLH-0000000EWmO-4BAL;
	Fri, 20 Feb 2026 13:14:47 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQLD-0000000EWlW-2q7G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:14:47 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=2MjKH69EZTy6SNbmhiR8H7qrxFI437dSH1xWPtNSfHA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771593272;
 b=V25G9TQYHNvygEukEmzD0EIBl3A+t/rX3aYFRorVnJJyfATmfuFO5rSBnHZxoQTackd/yDeM
 lMJKBHXs9mEhMyaWbfNb2mS5mvMkIyaaMJGT49DDeON6DV4jAkKWPzTxHBBjz8jn5CDofldasQ+
 mGmn7M+3CMxISL9zIKXdW7dugRwpskedTrImCBWSjNj4nzXg6Tezp0BW73zppcvElbBXyDaAMEI
 qrvfMf8VmPhAzIPXixYgS7428ugc6b6f5cwSskICPEdxjEbsqTwzrtE7SAmiy+t3U+dV0FQYjQx
 NraiMFknH2MCVxU0dSjJlkQD1u16NJRJ4KRww/fVLKjRA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771593272;
 b=rji2J1fkvkPI94fprmtDMaOxMVYLU9whg8cXSnbuS/lrqUZ40AmGuwtFspgEtFh5nwd+Rnzn
 RN2RqirT5bQHd9+dcmF+4CYZ4EmBaLwRQgtLF4u12BU2rloVIPJgXbGIdEpbVWRUK5h2j4QV1qp
 KRZ3skjtGsbUTcrVNQCHbRsVXdQwSF/dGj98vVqHfkwrVFX+abWuF0Phd/rA92GuNnZcA6M1ZZc
 Fl+u/dHBbPKobmyWjRdpxWj+JtfFFx49QzP6IEwtMT7bcGZTp2vkah2/FqcWDqu6jEXJY1Puocc
 6BJM6RBcYoOcjPmGPUeIv83WggZ8m3ghoUBSGWfrI246g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Fri, 20 Feb 2026 14:14:32 +0100
Received: from [10.123.75.134] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 0DBFDCC0E8B;
	Fri, 20 Feb 2026 14:14:15 +0100 (CET)
Message-ID: <d1a87e01-f887-44ad-9b95-08c0e29be6ee@ew.tq-group.com>
Date: Fri, 20 Feb 2026 14:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: imx6ul/imx6ull: add boot phase properties
From: Max Merchel <max.merchel@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
 <20260218132339.32157-2-Max.Merchel@ew.tq-group.com>
 <CAOMZO5B5k_i_q4cd7SMNAkicF4WfEYNVUSrg8AamQHNpGys5mA@mail.gmail.com>
 <be39b302-a29b-4dcd-a3f1-1f3781476951@ew.tq-group.com>
Content-Language: en-US
In-Reply-To: <be39b302-a29b-4dcd-a3f1-1f3781476951@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4fHW1358Myz1kNt4C
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 7ee22832e241a6dc12898e584eefa700
X-cloud-security: scantime:2.706
DKIM-Signature: a=rsa-sha256;
 bh=2MjKH69EZTy6SNbmhiR8H7qrxFI437dSH1xWPtNSfHA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771593271; v=1;
 b=SvC9PBVF+N/3fL3NGq2e3TDmlUsOJynZc7xMi6UFJoJKnc5O2zlOIKnk86jB16eYcoZ80x1h
 RLbsh8f7fd85Imy7yDBBq6eNuCUvqghU4ILmIcp5rCcKa1wlwbdIflVvpNLC15uMS+RZAacsPC/
 VES838x5IFs6JO2/XfzTK4Xtl2QQDxEmn7SXWiqRMHsRr7EPlXQnS6OnwlbHzc12oqxG2Q20Erp
 ZRe7ncWadPLQgICIpkem3N4lLc5fOKi7DA/JXrq+Tt6rFb8zhSyOxYPYNHLaN4t6OBhlpKnYlrf
 06RsYptaH373hq+yY/N+P2SeY3T6zOPs4feJMpZORFtdQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_051443_985422_6B72FF86 
X-CRM114-Status: GOOD (  15.32  )
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

Hi Frank,

I forgot the boot property for the spba-bus in imx6ul.dtsi.

If Fabio gives me feedback on my suggestion to improved the comment 
messages, I will send a V2 at the beginning of next week.

Am 20.02.26 um 13:10 schrieb Max Merchel:
> 
> 
> Am 18.02.26 um 19:14 schrieb Fabio Estevam:
>> Hi Max,
>>
>> On Wed, Feb 18, 2026 at 10:24 AM Max Merchel
>> <Max.Merchel@ew.tq-group.com> wrote:
>>>
>>> Add boot phase properties from U-Boot device tree.
>>
>> The commit logs of this series could be improved. Please take a look
>> at these examples:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>> commit/?h=v6.19&id=256feb5be482315a91c1bd1a1808276f57ef76dd
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>> commit/?h=v6.19&id=2285ea3f8065f47a6a1b62e6fcfa85105c8c261b
> 
> Hi Fabio,
> 
> I can add sentences to the commits, including the properties, for example:
> 
> dtschema/schemas/bootph.yaml describe various node usage during
> boot phases with DT.
> 
> All SoCs require buses (aips and spba), clock, iomuxc and SOC access 
> during boot process.
> 
> 

-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


