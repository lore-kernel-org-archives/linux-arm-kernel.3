Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C55C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKz1T7vmhDi74XbPi/EE55Hox/g8J5sLC+33/H3TOKg=; b=NoSMRVrrPdy8CRF862HQWXlxsK
	1GXdlhPr5se68yXhKQhk7iOrrrke1GNw4lm/yqh8TC+MPUUfkvAot6N5nr8FCFzPrf5pSx70RqF8a
	tmIiIkW4bOq70WvziVddnEOvbTMUiO1XwLWZ9OcwzuViQTm52WzyOfToXUbdziyQQ0EyWwDOGQQi9
	yNUsAxLr8znBiWn493Rb2WxTNn6zhA23SaYQfSOba6djGt83OrdxoGRs/GVCX+4BVdT9+Hyi9hOoq
	GY5TFtr0Csf4HuseHXCSCkLBxUZ8MzT+WCO9tFlLQeH+xHxHtrc+R6vXbJY9uMtxpLua/Il7KwoiO
	OS+jw6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFQV-00000002xOF-0bdH;
	Tue, 22 Jul 2025 16:01:11 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEcV-00000002pCt-1d6o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 15:09:32 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so11727135a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753196970; x=1753801770; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YKz1T7vmhDi74XbPi/EE55Hox/g8J5sLC+33/H3TOKg=;
        b=LpgTIDkUBlSqtry2OKfapnuyU8H+pfLPE7V5CGFq2nin4ugWO+8FSWKb4Ac0rkX6M/
         PtNCkQrHpmOWzP5o2vF13AN3A+IwSKy5nMPX7LOdebXqavjtylYHoyCQIM3M+bBzjQPk
         +Si1Qr3OAMJpwVJQmSv20om3YIlNyxyvgDj4eDIH8L1JVXvqgcqf+asbG/kuhqrEo9FW
         Y30vbCsATyVn8fnoQ/K0KfIrgt/pmJplI63L9BBXsw8nCOqHF+WdOn+z5xLrFw1sU9hq
         3pDgbgq/lrbdpDK8Ahgqa2SkRIW631/5ft3iYNkXorhS5vt6d9/mvo4YqObOQZ9Vyotb
         vIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753196970; x=1753801770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKz1T7vmhDi74XbPi/EE55Hox/g8J5sLC+33/H3TOKg=;
        b=gQGzR44x/x/vLsgiqVDPcMa7dR28kHDO3WqcpI37l0JdGev5x1g+zXMpCQVg+KBl8E
         8I0iI45RuzsxG6Plzan+Fi4qGzg/tb9V63dd9WIYlIKuZvmL3Zkeew2CTDderDPwcYYb
         0xkhYzE0lup27tC3V7TGSP0numxt4iNnlDOHJ35mAAwfgeyPWGz7J5inmSbhkJAL3K4D
         1+FrYddkGUV/96xMWesI47w//qc5ciq7Lq2DiId4jYXrYmCDgnEnh9BN3e6PYy+tpPxp
         KTg/Baw4GIoscWzrapO1nO2Vw6lCLGv6ducUoAbOJE3aiCOzoiIMvjSmMzzhhtiMfWVR
         QypA==
X-Forwarded-Encrypted: i=1; AJvYcCWDhhq7CocD1P86QG6Z/xHJ4khKpU6xM3M7uLo2CWEKbk2bWxr8w6OFEOHienoyBWc1c6alNlmSCf4V4oGxXcWM@lists.infradead.org
X-Gm-Message-State: AOJu0YwuAD2wEojN0xonoH6OM85490IIeUID54Kd24XMdvtHTYCwXbrz
	5L4qH/bACVLxUB1ZAURBSur+tziFSX7F+cqoZjKHpvXR0sP2KLf+NSPqRU6T0Ztv8KLIimdEzSe
	VecJkn5+xHnC00dZiPwyLjG2cIyHsirbRG1ydltLbHg==
X-Gm-Gg: ASbGnctV6efLJt5UrQAKK+X5qynldPYd0sf1x3EaMUCaIByh/zp6HpNZBS6EaJboX8R
	fqXeDYiTzJIF7NsAC9rTaQ007SWcCBCGE8WkJxZZE7/lXVtzNrxCsuQNhm8l0e7FFboTLBfe3LF
	D9Vhc8UERSRw+pfG7vniMjR6lU22mhrzP9OC5a3sWn02vspfSI3JzczV9KJEDCKOUfJtPAXvj1i
	w0Czox8
X-Google-Smtp-Source: AGHT+IGpbjpX0grZZPVQmZw54+wx4altW7i3KDxNPLIE1PMRey0GQaLdxv8J+phJGzB0ugLj/bW3oRXI/qzLkenwXwU=
X-Received: by 2002:a17:907:9703:b0:ae2:3544:8121 with SMTP id
 a640c23a62f3a-af1529e3c52mr389560266b.9.1753196969564; Tue, 22 Jul 2025
 08:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 22 Jul 2025 16:09:15 +0100
X-Gm-Features: Ac12FXyw9fjZ_hHkKsJzmg7jt57Reyq6o7fHyn-BAdPCUShE29PhKSCLcUeB0K4
Message-ID: <CAJ9a7ViCf=_wmLX93TzgT82vjZvbKj3XLbr8takyfC1niQESsg@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 00/10] coresight: ctcu: Enable byte-cntr
 function for TMC ETR
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Mao Jinlong <quic_jinlmao@quicinc.com>, Jie Gan <quic_jiegan@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_080931_432675_9818CCA8 
X-CRM114-Status: GOOD (  32.69  )
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

Hi

I have had a look at a few of the patches. The buffer swap mechanism
appears to be good.

However there is a lot of byte-ctr code in the "core" tmc / etr source
files. As much of this code as possible needs to be moved to the
byte-cntr specifc source.

I suggest having a helper function such as qcom_byte_ctr_in_use() to
call from the core code, and if true then call back into the byte-cntr
specific code to do the specialist functionality.

One other possibility is to have a flag / enum in the tmc->drvdata
structure to indicate a variant. - e.g. TMC_STD, TMC_QCOM_BYTE_CTR,
set at initialisation stage to remove the need for checking the device
tree every call.

Regards

Mike

On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
>
> Based on this concept, the irq_cnt can be used to determine whether
> the etr_buf is full. The ETR device will be disabled when the active
> etr_buf is nearly full or a timeout occurs. The nearly full buffer will
> be switched to background after synced. A new buffer will be picked from
> the etr_buf_list, then restart the ETR device.
>
> The byte-cntr reading functions can access data from the synced and
> deactivated buffer, transferring trace data from the etr_buf to userspace
> without stopping the ETR device.
>
> The byte-cntr read operation has integrated with the file node tmc_etr,
> for example:
> /dev/tmc_etr0
> /dev/tmc_etr1
>
> There are two scenarios for the tmc_etr file node with byte-cntr function:
> 1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
> 2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior
>
> Shell commands to enable byte-cntr reading for etr0:
> echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_val
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
>
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_val
>
> Changes in V3 resend:
> 1. rebased on next-20250711.
> Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/
>
> Changes in V3:
> 1. The previous solution has been deprecated.
> 2. Add a etr_buf_list to manage allcated etr buffers.
> 3. Add a logic to switch buffer for ETR.
> 4. Add read functions to read trace data from synced etr buffer.
> Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/
>
> Changes in V2:
> 1. Removed the independent file node /dev/byte_cntr.
> 2. Integrated the byte-cntr's file operations with current ETR file
>    node.
> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
> 5. Optimized the way to read the rwp_offset according to Mike's
>    suggestion.
> 6. Removed the dependency of the dts patch.
> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
>
> Jie Gan (10):
>   coresight: core: Refactoring ctcu_get_active_port and make it generic
>   coresight: core: add a new API to retrieve the helper device
>   dt-bindings: arm: add an interrupt property for Coresight CTCU
>   coresight: ctcu: enable byte-cntr for TMC ETR devices
>   coresight: tmc: add etr_buf_list to store allocated etr_buf
>   coresight: tmc: add create/delete functions for etr_buf_node
>   coresight: tmc: add prepare/unprepare functions for byte-cntr
>   coresight: tmc: add a switch buffer function for byte-cntr
>   coresight: tmc: add read function for byte-cntr
>   arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
>
>  .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
>  .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 ++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>  drivers/hwtracing/coresight/Makefile          |   2 +-
>  drivers/hwtracing/coresight/coresight-core.c  |  54 ++++
>  .../coresight/coresight-ctcu-byte-cntr.c      | 102 +++++++
>  .../hwtracing/coresight/coresight-ctcu-core.c | 113 ++++++--
>  drivers/hwtracing/coresight/coresight-ctcu.h  |  49 +++-
>  drivers/hwtracing/coresight/coresight-priv.h  |   4 +
>  .../hwtracing/coresight/coresight-tmc-core.c  |  70 ++++-
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 270 ++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tmc.h   |  29 ++
>  12 files changed, 688 insertions(+), 32 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>  create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

