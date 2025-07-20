Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A90AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 15:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iciTdbozgbEwpx/j+Tpe9MpyqER+JXwr8LFwyB0pkS8=; b=zXuCi4HjqK5b6kPTbA1V6gaVIJ
	DLtw/puYYgz6aXbRUsbVJNrp1FdacVaDwZ/WZMP8gVNRE9EYTt+z5CDy1Yip7i3QAYvqsdLMthPiI
	AwXglrceMbRvlShdoESA704Fa91SrykOAWlpIkTPWNpYTIfDfVHTD2W6D5A2DhSVQEWeMHk/Wv883
	2mo/NyOogYq/QOn/JFw02Ph6lsBjcd5ukJawxC98d1YrCGgguxzPWruFaPIHxJXeEAiisTsJuQSm/
	TjI8KJAkCZwqutvG7v4uQU+AD7/hZNF3UgL8NdOLlm9xUAiSd5mPRK/L8bsLvdgYkdUQ6EUAKcfI7
	8Xb8w8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVpF-0000000FRcu-3FOI;
	Sun, 20 Jul 2025 15:19:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVmo-0000000FRWt-1nPV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 15:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iciTdbozgbEwpx/j+Tpe9MpyqER+JXwr8LFwyB0pkS8=; b=6WsW40lEAD7TZLkmADom+46xBC
	aO9R8B1l4cvgNm3Av+QCn80uQhZNJVzKsKo0mUQBQ21RG/DsZgaZLswUGUGF/SSV5uDg65iOU1ry4
	eebh0ZPMHSD1J1jSJCcuzQPEZ0WwxogXTY886yw2EHCQ7IULH0GeGm59T4b5C/R6sogI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1udVmX-002CZR-Qo; Sun, 20 Jul 2025 17:16:53 +0200
Date: Sun, 20 Jul 2025 17:16:53 +0200
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
Message-ID: <6227828c-5db0-41c8-956f-eea6f790ccac@lunn.ch>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
 <20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com>
 <6vlm3ybjpy2jq3cr2pzj4vcmqwoissdml2xmhfzlulfbrpzakt@xrepu6c5zykb>
 <713b2cc8-1bc7-a8b7-678b-5fc7fe25615a@oss.qualcomm.com>
 <8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch>
 <1653597d-4d6b-a771-fbd8-c129c630ac0a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653597d-4d6b-a771-fbd8-c129c630ac0a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_081710_473904_5F07CA9D 
X-CRM114-Status: GOOD (  12.64  )
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

On Sat, Jul 19, 2025 at 11:07:47PM +0530, Shivendra Pratap wrote:
> 
> 
> On 7/19/2025 10:27 PM, Andrew Lunn wrote:
> >>>> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> >>>>  {
> >>>>  	struct qcom_pon *pon = container_of
> >>>>  			(reboot, struct qcom_pon, reboot_mode);
> >>>> @@ -37,7 +36,7 @@ static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
> >>>>  	ret = regmap_update_bits(pon->regmap,
> >>>>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
> >>>>  				 GENMASK(7, pon->reason_shift),
> >>>> -				 magic << pon->reason_shift);
> >>>> +				 ((u32)magic) << pon->reason_shift);
> > 
> > As a general rule of thumb, code with casts is poor quality code. Try
> > to write the code without casts.
> > 
> > Maybe something like
> > 
> >       If (magic > MAX_U32)
> >       	   return -EINVAL;
> > 
> >       magic_32 = magic;
> sure will update it. And in above, should it be recommended to add a explicit
> cast(for any avoiding any compiler complains)?
>  like: magic_32 = (u32)magic;

I would hope the compiler/optimiser can figure out from the test the
line before that this is a safe conversion. So i don't think you need
a cast.

	Andrew

