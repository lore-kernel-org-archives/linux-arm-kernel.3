Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331DFD3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 22:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLcMXvfSkco81v3B6u4CJoZB2QJvMl5QgO9UpeNZkaY=; b=UhPfzAOJYBjNfKm74IkXakhMi8
	q41nziLq3y5bBq9ZfSh9H8Tqx85XCSONG4thPCItDPCwwEcTNvQktnDI5pHRX75W/n+Az9zGq8am1
	GR19TgX8+wa1wVMmh5JB2R65Zd7eYN8zR88mR/Nwd80N8q2eSsvoCFdQX9nosqtk+2JI+qsEI/T14
	lE2VYTBYV1QoIcqzAM9M8kfsdS/lmzUFVHqLFL8oRUuX68txOFLcfGqv7SNcXQUhgfjm8lQJou+GJ
	r70hbWC9LkTQu+Pxl3mboIG3IkbGY7UwA4pLsVjU7Nnk75HOpSg5IRajJ9FJF7O7gGPpBk4VELu7w
	WmrS9Mew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAciu-00000001U5g-3GhG;
	Mon, 11 Nov 2024 22:17:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcfE-00000001T2U-0bJB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 22:13:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99C545C5D27;
	Mon, 11 Nov 2024 22:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AC0C4CED8;
	Mon, 11 Nov 2024 22:13:38 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 5E20810604CF; Mon, 11 Nov 2024 23:13:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>
Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Shivendra Pratap <quic_spratap@quicinc.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com>
References: <20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com>
Subject: Re: (subset) [PATCH v8 0/6] Implement vendor resets for PSCI
 SYSTEM_RESET2
Message-Id: <173136321437.772650.9632330958815794111.b4-ty@collabora.com>
Date: Mon, 11 Nov 2024 23:13:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_141340_274743_F1EF2F91 
X-CRM114-Status: GOOD (  10.24  )
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


On Thu, 07 Nov 2024 15:38:24 -0800, Elliot Berman wrote:
> The PSCI SYSTEM_RESET2 call allows vendor firmware to define additional
> reset types which could be mapped to the reboot argument.
> 
> Setting up reboot on Qualcomm devices can be inconsistent from chipset
> to chipset. Generally, there is a PMIC register that gets written to
> decide the reboot type. There is also sometimes a cookie that can be
> written to indicate that the bootloader should behave differently than a
> regular boot. These knobs evolve over product generations and require
> more drivers. Qualcomm firmwares are beginning to expose vendor
> SYSTEM_RESET2 types to simplify driver requirements from Linux.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: power: reset: Convert mode-.* properties to array
      commit: 05d9044177c3e910921522e0209640d3b825a6ae

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


