Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F24FC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNP0bVRN3BIEQFCgVCRS46/SHi+YQBr42iLusOUd4wg=; b=TNjQpDL2h22SxVtP4MLrDKCMIZ
	uh6I9gj9PHM8Voual+FMKHKYF6CxqfNonhsHx6vR6Vn/nPxvlCqq6DIIpyHq2+MnFYQn/0LsDM/bA
	M/+Y10tvyDG7YrIOFHI/m+7pr9i8pNnotx+7z+I+GPmzfmjMJ4EKYruoPCBhSPTdZA9ceMyNwTHWT
	GSwNGSipEnGWpdnkIyuz5cLye7V8+MtscZrjkI9+F1ZC/rkE0lSrzQRyF2Tpvptl9wVwiSRleq14Y
	WYdq2+nXQeLvzWCMGZMAhYVrD+PNQWTTURDHfs0Jp0TjWWrPQ+qTUG4KGuFpKCg8Wmn/L6glh3hiM
	nkACTl0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wto9P-0000000EIKc-0TrX;
	Tue, 11 Aug 2026 15:12:23 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wto9M-0000000EIIZ-0xfo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:12:22 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6A5B9140014C;
	Tue, 11 Aug 2026 11:12:15 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 11 Aug 2026 11:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786461134;
	 x=1786547534; bh=HNP0bVRN3BIEQFCgVCRS46/SHi+YQBr42iLusOUd4wg=; b=
	MYTFBvkL34sEhjqvkT+M9tVanfBZ+IXoOtflcQO45tIsRn8MZ59Y7RJPOnetRZTZ
	iJJAVgpK/d3XiGE5ykevx/PUwIjEoZnFGixh082PqcDeKfDPR7urqmhmAd5cr94n
	jxjyva0hXLl7xsMYDB5Lm4blmPxMX4+CUyZH0lBgo697MQ6cFpEZtOy73uxIQqXf
	T7WdrGB0IhiP0IszOVBUcSkeR0Zho2GILcx61HFLZ8P+ymygNcYOqlQxvZ3pMGxw
	Lf17zswpPY4G1ZLS2rA0DMnJOAge7yA8alUaWwY88xn+nIxleg7v4/uXP/tpBwK3
	54kTpFU6SgSydt1Gia28yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786461134; x=
	1786547534; bh=HNP0bVRN3BIEQFCgVCRS46/SHi+YQBr42iLusOUd4wg=; b=c
	rAjKdScjIYRQW9zjdI+xjbWcr3hilXdwZVMpqedHYIiLMZy6ixa1uxET6MQZNHYJ
	RBgMJSoz/TXJcm4X5W5GmFgSLEjF3PuWLiQSrFmxTuXMgitguk+73VTZUKvTVUjB
	rHmb5NKtQf0Wgk0wvjGu2CMWSlR+XHmeG67kR808dqjawlozQ1oDVVYEHaUW8uAF
	Jcwj1n//IzSsuXr7IfCi36pNjzbr16okEM97DnfsbJCW0E+AKP8PO3UXFxf/BCyt
	YYy8iYDKFNJdcWM5+z4zY/MrojRSuTw/dgL2Lp+eCZNaUW3LhkE5Ph21gEgrYzYx
	FcdNJU4PNvXwmZsMDNZVw==
X-ME-Sender: <xms:yDt7amsi8NsWVPxjs15GY0jHt4JVsUZFcKxoTrnXbv9tZU9CYZQ5LQ>
    <xme:yDt7amSdXcRTnNEZ3rVcgF9i0XJVuE6zayofn6cjIJWGw3OOTFjYicVYu1w3-O7Qz
    Bdn93lnXQYDVqYVy8acAH_i3IPOg9umLu0tLLs4qUftobwXpxNZX8U>
X-ME-Proxy-Cause: dmFkZTEIs3WxYSrZd5T5d1uzHrL7lqC6JQse04tRsA+075Eo8cjVSAwPTmul2O0vuNAxFe
    28hZE8zH8kWsxj5ifkI5QA8wVVMeC6mwV348yjqhRXtgxGeWBPA8GhDTs8KiH61sEaT/A+
    WD4WQYlqJ1AUhVz0VlIra/UZt605uq3jr5vSiGT9qR1LNAgmXpQ9yRxzkdPkaBAHqZcCIg
    8+GehEWj8ChbU0lmwF6Xs2oh0fDwED+d6TcPwbdnKyUDVGK4J/n71ERROyeqnFgs8FoPU4
    IPTJzjwzR0kvX2ad2Fv7pKRSMBFODb6rXhx1vDU9ZpWIhw92XJNaBrXXnhuF0HjJCQoMPg
    ejVI2jUxO3dWwl9Y3xd3toIBE64TccTYx1KEkinLQp/AXb/e1D4rewoevRRs7EJT7IWBh/
    H8sQQF+rs4/4Cl8oUndCBsGzsvearq22HDs9GmKEf5UuCWZh+R6Uo3+BYhk6/xLhwND4Wm
    9f4IOsJO5MK4Nu+s8/fgJHhRVmfK9bj4aTLnZ44GQdP8W3IUIVKlhK0IanAfacvlz8DDwU
    04bhH0pgZpPK63z7OAR4XvYI+nHTHgqKrJZGpqPgkq3Wpf/MAuwIYB7cdUbwYZXB7awteI
    u/O+sAQLzU6pZS6g3oChRQD4zTQAKhEtUQt76Ilf6cB7RNJALefv78VjGO/g
X-ME-Proxy: <xmx:yjt7anfmNTMtuOHNKtnkt0wEe54gypHldAKL03CJnh_DCXzOFop5Vw>
    <xmx:yjt7ajuqI0g-eqY9OjgY7WgP5SSPu8G1mbsqorrIX2ErwyHHfbTc6w>
    <xmx:yjt7auiHbnM_hDMAuoB3SCHQop7rDF_2J146PeKYoOkPuOaZGIQ00A>
    <xmx:yjt7aruZtPsro7Qqt8HoJ_4v5k_fl5QXSlvciwFKQHiyXNKQlCYwdA>
    <xmx:zjt7atzRPutVtdGuSZnggZ7G9H0xyjCKg1DEHmfdAZHD8iP4H28TOKmS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3244632A006A; Tue, 11 Aug 2026 11:12:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AwnWr737caCF
Date: Tue, 11 Aug 2026 17:11:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Ard Biesheuvel" <ardb@kernel.org>,
 "Eric Biggers" <ebiggers@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Oliver Upton" <oupton@kernel.org>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Marc Zyngier" <maz@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>
Message-Id: <6632712f-7782-4580-84c0-62124a016f46@app.fastmail.com>
In-Reply-To: <20260811140132.22778-1-will@kernel.org>
References: <20260811140132.22778-1-will@kernel.org>
Subject: Re: [PATCH 00/12] arm64: Remove unused big-endian support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_081220_341617_EF782097 
X-CRM114-Status: GOOD (  21.73  )
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

On Tue, Aug 11, 2026, at 16:01, Will Deacon wrote:
> Hi folks,
>
> Big-endian support on arm64 (CONFIG_CPU_BIG_ENDIAN) has depended on
> BROKEN since 1cf89b6bf660 ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend
> on BROKEN") and has already seen some clean-up patches removing some of
> the unused support code (e.g. 5276ea17a23c ("lib/crc: arm64: Assume a
> little-endian kernel")).
>
> Finish the job, and remove the remaining big-endian support code from
> arm64. Note that the SETEND emulation for 32-bit tasks remains and so
> some of the mixed-endian EL0 helpers are retained.

I had not expected the removal to come this soon, but I'm not
complaining about that. I assume you are planning this for 7.4,
leaving 7.3-LTS to still have the code in case someone wants to
still use it, right?

Not sure if you saw

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm/mm/Kconfig?id=fe91e4e9da70765420538d9cbcf6d9a970237a8d

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm/mach-ixp4xx/Kconfig?id=2262f02ac2aa545560a7f182c8e6b5c98e72763c

so for 7.3, we have marked big-endian mode in arm32 as deprecated
as well, and also managed to get ixp4xx working again in little-endian
mode, which was slightly broken for a few years. It may be good to
add a reference to your series for context.

My suggestions there was to possibly remove arm32 big-endian mode at
the same time as on arm64, but that does feel a little rushed if
ixp4xx only has one release of supporting both, and removing be8
but leaving be32 for a little while longer is probably not worth it.

> I've broken this down into fairly coarse chunks, as it seemed a lot
> easier to manage than one giant patch (even with the Kconfig being
> effectively disabled already) and not all of it is just mindless
> deletion. Despite that, I'm anticipating the whole thing going via the
> arm64 tree.

I would have done even larger patches, this does already feel fairly
fine-grained to me ;-). I had a look at the individual patches to make
sure this all makes sense, and I found nothing wrong here.

For a 7.4 (or later) merge:

Acked-by: Arnd Bergmann <arnd@arndb.de>

There are also a few arm64 specific drivers that I think no
longer need a dependency, but none of that is important:

diff --git a/drivers/crypto/hisilicon/Kconfig b/drivers/crypto/hisilicon/Kconfig
index aeff08ccbadd..1ae7b146b241 100644
--- a/drivers/crypto/hisilicon/Kconfig
+++ b/drivers/crypto/hisilicon/Kconfig
@@ -53,7 +53,6 @@ config CRYPTO_DEV_HISI_ZIP
 	tristate "Support for HiSilicon ZIP accelerator"
 	depends on PCI_MSI
 	depends on ARM64 || (COMPILE_TEST && 64BIT)
-	depends on !CPU_BIG_ENDIAN || COMPILE_TEST
 	depends on UACCE || UACCE=n
 	depends on ACPI
 	select CRYPTO_DEV_HISI_QM
diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index c7f8413ab996..f0c1061b0005 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -18,7 +18,6 @@ config QCOM_PAS_TEE
 	tristate "Qualcomm PAS TEE interface driver"
 	select QCOM_PAS
 	depends on TEE
-	depends on !CPU_BIG_ENDIAN
 	default m if ARCH_QCOM
 	help
 	  Enable the generic Peripheral Authentication Service (PAS) provided
diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index 3a9162706439..e9271d706726 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -14,7 +14,6 @@ config TEGRA_IVC
 config TEGRA_BPMP
 	bool "Tegra BPMP driver"
 	depends on ARCH_TEGRA && TEGRA_HSP_MBOX
-	depends on !CPU_BIG_ENDIAN
 	select TEGRA_IVC
 	help
 	  BPMP (Boot and Power Management Processor) is designed to off-loading
diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 8b6fdb9ad1ea..318e7b604342 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -102,7 +102,6 @@ config ARCH_TEGRA_210_SOC
 config ARCH_TEGRA_186_SOC
 	bool "NVIDIA Tegra186 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select PINCTRL_TEGRA186
 	select MAILBOX
 	select SOC_TEGRA_PMC
@@ -117,7 +116,6 @@ config ARCH_TEGRA_186_SOC
 config ARCH_TEGRA_194_SOC
 	bool "NVIDIA Tegra194 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA194
 	select SOC_TEGRA_PMC
@@ -127,7 +125,6 @@ config ARCH_TEGRA_194_SOC
 config ARCH_TEGRA_234_SOC
 	bool "NVIDIA Tegra234 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA234
 	select SOC_TEGRA_PMC
@@ -137,7 +134,6 @@ config ARCH_TEGRA_234_SOC
 config ARCH_TEGRA_238_SOC
 	bool "NVIDIA Tegra238 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select SOC_TEGRA_PMC
 	help
@@ -152,7 +148,6 @@ config ARCH_TEGRA_241_SOC
 config ARCH_TEGRA_264_SOC
 	bool "NVIDIA Tegra264 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select SOC_TEGRA_PMC
 	help
diff --git a/drivers/tee/qcomtee/Kconfig b/drivers/tee/qcomtee/Kconfig
index 9f19dee08db4..bd9be3e9a9ac 100644
--- a/drivers/tee/qcomtee/Kconfig
+++ b/drivers/tee/qcomtee/Kconfig
@@ -3,7 +3,6 @@
 config QCOMTEE
 	tristate "Qualcomm TEE Support"
 	depends on ARCH_QCOM || COMPILE_TEST
-	depends on !CPU_BIG_ENDIAN
 	select QCOM_SCM
 	select QCOM_TZMEM_MODE_SHMBRIDGE
 	help

