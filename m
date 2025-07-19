Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D259CC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 17:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mfA517rjzPZoRXNHzM0lVU9Rb/n66iO6+Wm0YH3JEY=; b=pCLxW3FXzB78ieTyWSn3PAr6+U
	3+WXqc2UDdHdSQI6XQKDUUgwLWFEMwnAq5MWyTzT7RCDkbmt+7gbnsb6PGdT/oNxQEAncaJ26gWXQ
	doAnR9c4jidPcO6wVpgy8vCasGYNlW2iwHA0xZNiSWACfsFTlDcwaGeTZFsFGg8L1HbI+UBLtY3eH
	EiCMGaktJuMH6ArcB/ScQR1zYHiaaTFhYc8+j4wzQ71r/GE488qQlC0/sHqF6agouAVvwVERcZU03
	Y7Pk8J/4khQkAPoGMzYzq/WxA1fuj0BwOR/tOnRadC81mBooISVa6uEKfQtAf44JB8o+10JuB4M6J
	C3H0QeJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udAvE-0000000ESFX-43ld;
	Sat, 19 Jul 2025 17:00:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udAsk-0000000ERyD-0WwB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 16:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1mfA517rjzPZoRXNHzM0lVU9Rb/n66iO6+Wm0YH3JEY=; b=pDnwgip7JjpRRWIQ+7eRa13nTL
	sQhiLhgkqwUNQzTMjMiV6IwiXk3MJxORqA/jcroj65TMl3vSBO6v6/9F/sFhmRJLyGC2ssIVr/z6t
	xIGP+9TukEbjzMlariteXOPgxw88EJGzpxqNhZ+1M9Fk8GCP87KYK0v7j40u+srk3kNg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1udAsS-0025PX-Nw; Sat, 19 Jul 2025 18:57:36 +0200
Date: Sat, 19 Jul 2025 18:57:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Elliot Berman <quic_eberman@quicinc.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v11 2/8] power: reset: reboot-mode: Add support for 64
 bit magic
Message-ID: <8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
 <20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com>
 <6vlm3ybjpy2jq3cr2pzj4vcmqwoissdml2xmhfzlulfbrpzakt@xrepu6c5zykb>
 <713b2cc8-1bc7-a8b7-678b-5fc7fe25615a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <713b2cc8-1bc7-a8b7-678b-5fc7fe25615a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_095754_166172_CE066D50 
X-CRM114-Status: UNSURE (   9.67  )
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

> >> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> >>  {
> >>  	struct qcom_pon *pon = container_of
> >>  			(reboot, struct qcom_pon, reboot_mode);
> >> @@ -37,7 +36,7 @@ static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
> >>  	ret = regmap_update_bits(pon->regmap,
> >>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
> >>  				 GENMASK(7, pon->reason_shift),
> >> -				 magic << pon->reason_shift);
> >> +				 ((u32)magic) << pon->reason_shift);

As a general rule of thumb, code with casts is poor quality code. Try
to write the code without casts.

Maybe something like

      If (magic > MAX_U32)
      	   return -EINVAL;

      magic_32 = magic;

You might be able to go further, and validate that magic actually fits
into the field when you consider the << pon->reason_shift.

	Andrew

