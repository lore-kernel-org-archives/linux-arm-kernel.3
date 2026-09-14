Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EADAC88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytOyKR80UXT47i94YmFLCw/4YyuPHGsQaC9ebB1O3Lo=; b=y3yGsenSW3l1VMiB7K+YjmZc6B
	3REs2YuCM58wCDpaI3Hd7KEe5miBYcjn70pkwPbC2onHrat+lyQogmML9MwxiLnvMjra2+PYQ3Hm7
	r8TN51xitGwInP318aJBJkYcs4SI6/piRXn8qo/AiINYZRqDATDjOAHI0LAljTvXyAoQ+RTtPiu5n
	DEtPji6u/BdPzvfAvH2y8p1MpJGFrMMU5Wb62SeYmqjKAip1inQSebgwxxaP8ZEZUIdKIzsklZdkm
	CM/NZAHRxLomevSXhb+OJMAuEvgw5epFDudCyiuf2kv5AxBkEVntDC4qHZBqUK8SvD2VSYlwj1W11
	ixuKX0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6B4C-00000004QL1-1Y72;
	Mon, 14 Sep 2026 18:06:08 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6B49-00000004QKZ-3goe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 18:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=ytOyKR80UXT47i94YmFLCw/4YyuPHGsQaC9ebB1O3Lo=; b=sWgdPCka/yZQX+GbleKas2cPh0
	h5Gr4HUDrSy4D0fosUfQM5VOdcmVSNNXrNxA2kfeDsOsig1yq3d+9kbT0jvE98UagWGHHbl8LOT0s
	tAbWQYWCJyaAFVUzpLRqOuWqkJSEpo7AF6gwvOUIF4b9elAQOSHsY6n0v9X+BmVsG5v+SQWb3S4cX
	9rCdSelWdloYHxcmXl+OQloiSVmKlx1DdW5L273Hja9yvhvUwDtOHv0BtKsuts6hlVTn96F5yXLUn
	WFs+Nk5LFG/KpeGyTivmTzCy1+hop60jUul3+yY7NVTbwwde1xMketgsR7cFmq9WMPtpUSYRO62a8
	CYiSk+6Q==;
Received: from [179.105.94.163] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x6B44-0021lf-Je; Mon, 14 Sep 2026 20:06:00 +0200
Message-ID: <a0b4292c-45b3-456a-9bfb-312732fbc4c4@igalia.com>
Date: Mon, 14 Sep 2026 15:05:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rpi: suspicious log messages from vc4_hdmi & raspberrypi-power
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
To: Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <e661adf9-626d-4b76-9f2a-dc363e5bea26@gmx.net>
 <592d0ba1-5b52-4bf0-bc55-c8df6884a1aa@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <592d0ba1-5b52-4bf0-bc55-c8df6884a1aa@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_110605_918608_AEB21B03 
X-CRM114-Status: GOOD (  14.37  )
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

On 14/09/26 15:03, Maíra Canal wrote:
> Hi Stefan,
> 
> On 03/09/26 16:19, Stefan Wahren wrote:
>> Hi,
>> while testing my old Raspberry Pi 3 B Plus with a mostly recent 
>> mainline kernel, I noticed some suspicious messages in the log, which 
>> are new to my eyes:
>>
>> [    0.000000] Booting Linux on physical CPU 0x0
>> [    0.000000] Linux version 7.2.0-14759-gf6ce17b2c3b2 
>> (stern@schenker) (arm-linux-gnueabihf-gcc (Ubuntu 
>> 13.3.0-6ubuntu2~24.04.1) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 
>> 2.42) #60 SMP Thu Sep  3 20:31:50 CEST 2026
>> [    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), 
>> cr=10c5383d
>> [    0.000000] CPU: div instructions available: patching division code
>> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing 
>> instruction cache
>> [    0.000000] OF: fdt: Machine model: Raspberry Pi 3 Model B Plus Rev 
>> 1.3
>> ...
>> [    0.619485] raspberrypi-firmware firmware:rpi-firmware: Attached to 
>> firmware from 2024-05-24T15:31:28
>> ...
>> NEW [   12.637746] raspberrypi-power firmware:rpi-firmware:power: 
>> sync_state() pending due to 3f806000.vec
>> NEW [   12.645164] raspberrypi-power firmware:rpi-firmware:power: 
>> sync_state() pending due to 3f902000.hdmi
>> NEW [   12.652442] raspberrypi-power firmware:rpi-firmware:power: 
>> sync_state() pending due to 3fc00000.v3d
>> ...
>> [   28.835362] vc4-drm gpu: bound 3f400000.hvs (ops 0xbf2c6984)
>> NEW [   28.839062] vc4_hdmi 3f902000.hdmi: DTS/ACPI name 'rx' not 
>> found, legacy failed (-19)
>> ...
>> NEW [   28.879525] vc4_hdmi 3f902000.hdmi: Could not create device 
>> link to hdmi-audio-codec.1.auto
>> ...
>> [   28.889098] input: vc4-hdmi HDMI Jack as /devices/platform/ 
>> soc/3f902000.hdmi/sound/card0/input2
>> ...
>> [   28.901895] vc4-drm gpu: bound 3f902000.hdmi (ops 0xbf2c3fb8)
>> [   28.902040] vc4-drm gpu: bound 3f806000.vec (ops 0xbf2c6498)
>> [   28.902164] vc4-drm gpu: bound 3f004000.txp (ops 0xbf2c7720)
>> [   28.902240] vc4-drm gpu: bound 3f206000.pixelvalve (ops 0xbf2c20ec)
>> [   28.902323] vc4-drm gpu: bound 3f207000.pixelvalve (ops 0xbf2c20ec)
>> [   28.902394] vc4-drm gpu: bound 3f807000.pixelvalve (ops 0xbf2c20ec)
>> [   28.911383] vc4-drm gpu: bound 3fc00000.v3d (ops 0xbf2c7c54)
>>
>> Is it worth to investigate or expected?
> 
> AFAIU these messages are harmless. From the documentation [1], "If

I forgot to mention that I'm only referring to the sync_state()
messages. I believe Maxime or Dave might have better insights on the
HDMI side.

> during the first attempt at calling sync_state() for a device, there are
> still consumers that haven’t probed successfully, the sync_state() call
> is postponed and reattempted in the future only when one or more
> consumers of the device probe successfully."
> 
> Did you also observe issues during probing?
> 
> [1] https://docs.kernel.org/driver-api/driver-model/driver.html
> 
> Best regards,
> - Maíra
> 
>>
>> Best regards
> 


