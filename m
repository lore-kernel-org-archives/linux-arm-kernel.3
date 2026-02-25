Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA0DFD3760
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=od3up8LA4QWuWHDBqv+P6oVpa8CKp0bnaTd8fhvCKZs=; b=RQ8r6R5SZUG/VSPnp7NM3zyWaj
	qQZ/6JnZVSp/XKO7q3Y2wtyg5BPrzEKlKMtnWq5+eti6mpR8c0gTq8yoagRp1rMr9t4mOXjQofNO9
	aPElP3/0hgF7DetktyYrx7Ztvvi5H/gvBebHQ56TLcbdiH2KnrDGoGmKH9YDID9fevZYUQQj6JMR/
	CKLEvomC0TB1OO9piAii9N2IxQpMbukqd8a7mX6tpBR5xuWi1uHehktsU+MTkfe32XPBXM3oH4Py+
	JlFDJzsZJHwTeGg6hTnq6f1QpZYqdKDi+l6cFi4avD3ZqRzQiyxgWc8ycnfUIYDwIj4umcvzmA22N
	lydNjFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFc9-00000004Aej-0osI;
	Wed, 25 Feb 2026 14:11:45 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFc3-00000004Abg-1KEN;
	Wed, 25 Feb 2026 14:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=od3up8LA4QWuWHDBqv+P6oVpa8CKp0bnaTd8fhvCKZs=; b=p6UN2QO95OKKBQnoln6IyVQC41
	KeUkZGynHy6LSadI71VbPa0STO2LDPAvFMZdF1MWyq39wq8EpSpuaaO0dE/SvnDekleU/iRvJAGmK
	hD8rj7c5F1Jxwuw+y8fyal1zvmws7WuPz+Xo5KPLIkXoE7OSI5FhCMAx3Ubsz60eaBprODLuAQTId
	Gwb47gZgaKdeGuOUAXYuosXZIteseb8IM4DcmvMGPFZ1IK2ecnO+GNUB6809FORqV8o8A5jY3WQAS
	zDAopCscV+NeybnqOnBFN/AivHw8yQDwZ4dMvknoxVQ87S10n4Qzu/K9vCZqv/Ciq6gwpXGaVXPtW
	uyp+PTzg==;
Received: from [189.7.87.203] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vvFby-005G79-Qu; Wed, 25 Feb 2026 15:11:35 +0100
Message-ID: <8cbde2e6-e5e3-4bfa-a7da-7ffe47b77658@igalia.com>
Date: Wed, 25 Feb 2026 11:11:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: bcm: bcm2835-power: Fix broken reset status
 read
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20260212150039.67117-2-mcanal@igalia.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
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
In-Reply-To: <20260212150039.67117-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_061139_362181_5A64210B 
X-CRM114-Status: GOOD (  24.12  )
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

Hi Ulf,

Friendly ping on this patch. Could you take a look at it when you get a
chance? Florian and Stefan already reviewed it a couple of weeks ago and
it would be great to have it picked.

Best regards,
- Maíra

On 12/02/26 11:49, Maíra Canal wrote:
> bcm2835_reset_status() has a misplaced parenthesis on every PM_READ()
> call. Since PM_READ(reg) expands to readl(power->base + (reg)), the
> expression:
> 
>      PM_READ(PM_GRAFX & PM_V3DRSTN)
> 
> computes the bitwise AND of the register offset PM_GRAFX with the
> bitmask PM_V3DRSTN before using the result as a register offset, reading
> from the wrong MMIO address instead of the intended PM_GRAFX register.
> The same issue affects the PM_IMAGE cases.
> 
> Fix by moving the closing parenthesis so PM_READ() receives only the
> register offset, and the bitmask is applied to the value returned by
> the read.
> 
> Fixes: 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains under a new binding.")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
> 
> Hi,
> 
> Most likely this bug went unnoticed as there is no in-tree driver
> currently calling reset_control_status() on the BCM2835 reset
> controller. Although I'm sending a fix to the .status callback, another
> possibility would be removing the implementation of this callback
> considering that (1) it's broken and (2) it's not used.
> 
> I'd appreciate your feedback about the most suitable option.
> 
> Best regards,
> - Maíra
> 
> ---
> 
>   drivers/pmdomain/bcm/bcm2835-power.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/bcm2835-power.c
> index 1d29addfe036..0450202bbee2 100644
> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> @@ -580,11 +580,11 @@ static int bcm2835_reset_status(struct reset_controller_dev *rcdev,
>   
>   	switch (id) {
>   	case BCM2835_RESET_V3D:
> -		return !PM_READ(PM_GRAFX & PM_V3DRSTN);
> +		return !(PM_READ(PM_GRAFX) & PM_V3DRSTN);
>   	case BCM2835_RESET_H264:
> -		return !PM_READ(PM_IMAGE & PM_H264RSTN);
> +		return !(PM_READ(PM_IMAGE) & PM_H264RSTN);
>   	case BCM2835_RESET_ISP:
> -		return !PM_READ(PM_IMAGE & PM_ISPRSTN);
> +		return !(PM_READ(PM_IMAGE) & PM_ISPRSTN);
>   	default:
>   		return -EINVAL;
>   	}


