Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9DAC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EBwRXRgxnDgc1hzoXKaNCqP19NjmMioRMdJEYoHAwY=; b=KcRf3/QmoR+O0zcgXgbopuOcjI
	PEeywlfO1dQnOgTP2eqjuOEwnQhgIrnDYsMwowh6G5W0wvaUligaaOgeBc3gmpk+hS2QgB0yaqfTG
	pNGL/vixMqXX3jGBJ3+3zaRykkS8ptf85iTC9/qQOZbkNOwbYz9v3SMtMH7/FMlbyGBL36d6cdDoM
	6PwWqDxg3nIpvm1NLD2vB5aFYcEGalKFB6ugzHHUtUVIdDQK9NoYnPJ3fHtWQ5t8PAxysPewPmuQf
	uEEkS70Ss5bumh1Sp70J1vFKnISrZTJnIylIzEnUPuB/OKX2I2STR2ko97BPf7gL5ybbt0kh7LkDk
	YuiZkhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nWp-0000000FAVA-3Rc6;
	Wed, 02 Sep 2026 16:09:35 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nWl-0000000FATG-0z0V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:09:33 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4D69A40E039E;
	Wed,  2 Sep 2026 16:09:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EMw9dlDvPqEm; Wed,  2 Sep 2026 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788365343; bh=8EBwRXRgxnDgc1hzoXKaNCqP19NjmMioRMdJEYoHAwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adij380JJaT1VPcepZIup1x17uVcz+DEuwbfV4MGy5ccR5YSHhn8LKMEo2oVcw50b
	 K6avUY+ttC70+rhwRgYFOSBiaW0DZhCoQKvHzHp+0zQ87+gzMuXyA71yuDS9XZvswn
	 WjRkl33Q6GS7NG/EOeIGWR/rFL1gcsHoHxNhOkdT8oMLighw9/QIkG8eqKkZTerSVv
	 trSfgLi0cld1yJYAUOCFzmLwboFG2Ktcrbg7W0aTZCtRsHMHbpAwHpYnG6DO2PQKt8
	 9O1Xc9ZZLUxrGGVOGKR6MbsAhWs4zollXkOFrSOAlqiPrLfqFRo2UqfZtM1AVO067Q
	 58rObV9SQ1TQ+nQtGP1Otz/m7MJep4FAN30TyIZZ4FdQlOVpc4jCdi7kq8RIOCiV+G
	 FTx1NKT720mBUIDSoEJQvquGLNfNM7skAnJisqS9LD1sUQO09dkml87ZCi+qf3fJGH
	 2O4n070uB6E4/1Kp2yIeMcU/QMIjh/M3ORK3PQJ8iz/E5CrR8FNq9wkwrfEfQKH3NB
	 gSd2TB63/zLm3HycNcbo+uf2sBPxY/e+hnTMmdRfc1kvPZCR4Qnwu4lLBTRML4KyX/
	 155CLDCOAaxzAPIVpiXl3EABqJRUSOTUcrHN7yF/XxDX6nVfdMkUEfiDgThs9z9rd5
	 a0NoRBfgayOU7NkWATWC595Y=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4E36C40E024B;
	Wed,  2 Sep 2026 16:08:47 +0000 (UTC)
Date: Wed, 2 Sep 2026 09:08:43 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/8] Add Aspeed AST2700 SDRAM EDAC support
Message-ID: <20260902160843.GCaphKC-y8HpkiAIWh@fat_crate.local>
References: <20260824-edac-v2-0-c8d8bb693586@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260824-edac-v2-0-c8d8bb693586@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_090931_430903_6DF9F06D 
X-CRM114-Status: GOOD (  15.56  )
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

On Mon, Aug 24, 2026 at 10:42:27AM +0800, Ryan Chen wrote:
> Add ECC error reporting for the Aspeed AST2700 SoC to the existing
> aspeed_edac driver.
> 
> The AST2700 memory controller keeps the same overall EDAC programming
> model as the earlier Aspeed BMC SoCs, but uses a different register
> layout, a split interrupt status/clear/mask scheme and DDR4/DDR5 memory.
> Rather than fork the driver, the existing code is first tidied and
> generalised, then the AST2700 is added as one more per-SoC variant.
> 
> Patches 2-5 are bug fixes and cleanups to the existing driver. Patches 6
> and 7 rework the implementation to accommodate the AST2700. Patch 8 adds
> the AST2700 support itself.

Sashiko has comments:

https://sashiko.dev/#/patchset/20260824-edac-v2-0-c8d8bb693586%40aspeedtech.com

Please address them: if valid, fix them, if not, explain why they don't need
to be fixed.

Btw, I don't see Stefan reviewing this driver and his last mail on LKML is
from 2025 so it looks like we'll orphan this driver too.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

