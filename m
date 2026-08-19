Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD691C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Co7HS0jVxwA4gYnxXevJyYoop6np3ZD8A3AJ6SheuSI=; b=ts6iNXN9chDDOKvJsE883yJTQV
	XnTteQUz32nvmju9uHP2JRNsf5s6kf8yn34pu3qGZvq1if7ZmiGbnHeCsP2jwc5nyG+LFamt4bFaA
	h6xes5OuhuGci65FlhO3H401oQ+gBJ1gfZj+mwfSzDHDry8MN/DFcAcD6p5RmHmwNhO7KkswWptiY
	pEBMpPSh62OJvJkPsZdQ40xRbBzBJTzA16q+/UZznnCy3FXT1nCadxfFW19j+YhCoJezkB9f2MRzx
	SPACCT9ip9LY6NhpYGLq1CnsoZTO9tYMZ2cOkJS0wDJLjIbmNu0rwkzEKGzaQ2O3SQJ56moNeZzkf
	2IeTXB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgsX-00000009uh1-0Dmv;
	Wed, 19 Aug 2026 14:02:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgsT-00000009ug4-0wr0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:02:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso16102505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 07:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787148165; x=1787752965; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Co7HS0jVxwA4gYnxXevJyYoop6np3ZD8A3AJ6SheuSI=;
        b=N+2OUEKJud3jwuamaRzs85eHihrq77v4Yic/WGPOy/b972Z+ZZEJ8P6QMcPhQlchaE
         OyB0e5gAyR8jyUKwDzo6bcTxGYUUrKb3LpoxmM9DOVJuRVubDVCEAsa8F4Y9EmaXp0xA
         9/gBzE7mFmHLtKIVWzlplcpizKisSP39wGWpTDW6iW40YzLASU+4kF+VFnLYWLrLFVYd
         +XKU0Y0VeCPVVpsZTeEmqd88oM4ftXL6pALkTEmrbkXVWyCswJNbL+HyIA10PBy2XPPB
         q98cliOz/ORsHvjSqaDT9yTM/FSenQ5nVFDQoqV2MW6FZlHUUMRjD0cYpVuqHTFYGkUK
         J0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148165; x=1787752965;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Co7HS0jVxwA4gYnxXevJyYoop6np3ZD8A3AJ6SheuSI=;
        b=WUn5SSiXmPEOEY9DyOm1MaEKpXROSis/nH9mWss6/4lN80OyodVRU5xLMAaq3tulY9
         e9Kn1INOQv1LNvqooqZ+O8xuoD4dpSzUiJwrIduCb7P6BVFsnvDnsND0km9QvEg5h8CK
         HfTyvraiNG4ENg/zaMmEEWyFEF5UPiJa/uYVU4G5dc5TXjN66qRtPjtVzmIayM+/VbTf
         kC6Bf3gmbJbS+6sLFI7t6F+pTW8iqspBbaFjhA/gSISNilcfEZpvdC7Kb4VlyBniFT0a
         B22+cBHP8CPWZa7QP/4saG+EYUUllUL/vJ1MKhVyFtcUTUcx/lrpgGfThJXutud/05Ii
         ICGA==
X-Forwarded-Encrypted: i=1; AHgh+RqtdQ5WAv9Apc6rOUJwq5ZJ2Pnt1g/TtRV0YGajiAmvo1y236eO311/NOA/5msIcgXrNPSpY/4qZh7BlNiJ7qO9@lists.infradead.org
X-Gm-Message-State: AOJu0YwKpdiRxoWhCxBaw//t4dgxrAAONTuHGrq+PzZDyGEd0QirNUM0
	tJrEKg4M4DIFPGpEusFaow/s3oqLUgfBZfA0eqcr8VOh7aiOIontQBaQFV5qIcYeUu0=
X-Gm-Gg: AR+sD1036E1Bcmy/jl6K6f4Ba8BtbsDxmhw+ZN8LPcMc+hD2ymQk3V16oRfroNLulEs
	ZaBwsyR7YtI3st77MFFBneUeg3DtT0hiViAzSsq7O9hHZKN4xJVj7ZrS/iy9U8euID0TjsCDNs8
	KA9uVSdVCdYXZIH6xYj2P4Tud/p1k6ePKP5li45aZDF1XR6AEGaBsCenkyI8/sviHJ/5NP0hc70
	pOTfMQc7T9wqr9evsaElmSstawMfHBIyuu1LnMRvfTQGW3JwN3VR/VdTi3Rja255pAxCG/vhtOw
	KLi5IYYTpmK6jkwo+SXYTgNvpTGQ3kwxMxiscHmz/k3NSbgl8lfnFGzguDLlzSoKzBPTYjAlRzC
	9YglqTEgjuHn+xec8QufXrZRtTLpVY4nNoGCGbE7HO3HGf81lGDtZ+NJ+8xbmUAhtMMz1tLAUZU
	hJfFXFmFJVyNUnqCzCNg2JPscxDCbi81MLfvv2Yl6+Ya7AhfM9472fuHeXz44n1c2kZeFOi9lW1
	64bcB8=
X-Received: by 2002:a05:600c:528b:b0:499:8d9b:832c with SMTP id 5b1f17b1804b1-499aa0e816bmr89871925e9.4.1787148165591;
        Wed, 19 Aug 2026 07:02:45 -0700 (PDT)
Received: from [10.0.5.39] ([2a01:599:445:d261:4474:9672:b73d:5481])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1111a7sm65896975e9.6.2026.08.19.07.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:02:44 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 4/6] mfd: aspeed-pci-core: add AST2600 PCIe BMC
 device driver
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>, 
 yh_chung@aspeedtech.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Lee Jones <lee@kernel.org>, Tan Siewert <tan.siewert@9elements.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, mfd@lists.linux.dev, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-4-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-4-fd7cc0b338ea@9elements.com>
Date: Wed, 19 Aug 2026 16:02:33 +0200
Message-Id: <178714815308.32179.15619694497271022262.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787148161; l=2564;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=0DLSrAiTsD+9mc3Vb7d5/lW0XmN5KPP+fle4/Gx9vJg=;
 b=Yv6DuRVXQ2eVIdd6FJVizmL+OmzjHQrDLg4pQ5mdXCZvnzUvsviM6pk+86GADUkAh8FQzylEb
 nvtlCfTGTCeAPv5Md2UT7KuGRs+InVgjAh4bWM68kaHE79DwTv1qQZ3
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_070249_658281_482355BA 
X-CRM114-Status: GOOD (  28.55  )
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

On 8/18/26 12:29 PM, Grégoire Layet wrote:
> Add support for UART over PCIe between ASPEED AST2600 BMC and
> host. This is the host-side driver.
> 
> Based on ASPEED 6.18 Kernel SDK and trimmed down and changed to
> MFD driver.
> 
> The AST2600 has two 8250-compatible register set usable over PCIe.
> These act as two UARTs. As there is only a FIFO internally between both
> ends, they are called Virtual UARTs. This patch adds both VUARTs as
> plat_serial8250_port. This is the core driver in charge of setting up
> MSI interrupts. It doesn't bind the whole PCIe resource to allow each
> sub-driver to bind the needed addresses.
> 
> This is not added as a PCI 8250 UART device, but as a MFD driver, as this
> host driver can be expanded upon for IPMI over KCS. It can also be used
> in the future for custom BMC<->host communication with shared memory and
> doorbell.
> 
> This host module should be the entry point for setting up all features
> related to an AST2600 present on the PCI bus.
> 
> Notes on the implementation:
> The host can't detect the VUART addresses, so they are forced to
> 0x3f8 and 0x2f8, as in the initial ASPEED driver.
> 
> The MSI vector index of VUART2 has been changed from 15 to 17.
> The index 15 used in the initial driver was not working.
> 
> Tested:
> Data path in both direction is tested on both VUARTs.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>

I didn't notice this earlier unfortunately, but this Sign-off is invalid (I don't
think that "aspeedyh" is a real synonym), see [0] as there was a similar
discussion. The same applies for the patch "serial: 8250_aspeed_vuart: add VUART
over PCI" for this series.

@yh_chung@aspeedtech.com: What is the name that should be in this sign-off?

> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a9..33a0351819e6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4011,6 +4011,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/crypto/aspeed,*
>  F:	drivers/crypto/aspeed/
>  
> +ASPEED PCI BMC DEVICE DRIVER
> +M:	Grégoire Layet <git@gregoirelayet.com>
> +M:	Tan Siewert <tan.siewert@9elements.com>
> +S:	Maintained
> +F:	drivers/mfd/aspeed-pci-core.c

I think it'd make sense to add the linux-aspeed list as `L` here.

Tan

[0] https://lore.kernel.org/all/3f2d964a-4e82-414c-b373-af0d531b0fcd@kernel.org/

-- 
Tan Siewert <tan.siewert@9elements.com>

