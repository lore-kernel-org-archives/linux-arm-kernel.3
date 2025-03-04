Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B195C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpitQsG9Lw5tQvA/VWCaKP4hbdUpVirbdTRn6Xat1Lw=; b=Env1nxBYrfcy11yIiVLKKKXdQd
	IjUHsGibB60BbbAI2hlXKo9CDJYV2TLaHyOv4naOviMX7dKBKq9RN16oOWl8LKn+mGCAfYbz1Gw2D
	xl0W5aGoUFIEUTs1mwf7+Lda1BOcgoCwceT+t2HzrDMQxBtzzIB2zfxUJ6vCa22FFhgI+cS/FSJ45
	EMdPyMe7+i10XlI/7fu7pBHWH8II1YtUxX5el5FzZOcs5mFrlHSitotgehUKH5MsqyjwT6UIl5LrX
	8DMC6VpJnw23I6if1gGYldIZa3KnWYkicU6nLNvOqebQAXRzrHgCjXJObwbdI4vARh+zpyTwcq8YX
	MMUnqoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYLe-000000067Nq-0mqM;
	Tue, 04 Mar 2025 19:54:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXja-00000005yrE-2Xx9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 19:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1820EA4491D;
	Tue,  4 Mar 2025 19:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA93C4CEE5;
	Tue,  4 Mar 2025 19:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741115717;
	bh=m8gpsFcvErC+OBg1crSKmlYcazdRoOwZ0xMnwbncoLg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Wd+VYz5Z5pmq6PMWBMCh4meGD69gSJjcGdaQqppo0JES4AT8CP7BglSfJgGMVA3y7
	 UTxQvO0wRGmTbAZ1rh01lKFGskbhM75iCjZ6guHgUT/y704xVrwXatSv5etp8opAL/
	 hMX2QJSLGU+L4BspbNuRwWw7D+P0z4vZhF8JcjMhBRoudk+xaT0kjlBU8ik1AI4bbJ
	 /804WbtwyRXPPLHq2RrTziJNifSXLCDEj8XSDDzcF/V/DkuC7iaKTrjOhKSmKp2bfF
	 1M63SfvUoiIkLLZzovZrXd1NTBWJJQ7O8Xg5BWl8JiUITB6tWMIjQ2m2VpPjnnVLjG
	 opGhzPH4Pok/A==
Date: Tue, 04 Mar 2025 13:15:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tglx@linutronix.de, jic23@kernel.org, linux-iio@vger.kernel.org, 
 olivier.moysan@foss.st.com, wbg@kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, alexandre.torgue@foss.st.com, 
 conor+dt@kernel.org, krzk+dt@kernel.org, daniel.lezcano@linaro.org, 
 devicetree@vger.kernel.org, will@kernel.org, lee@kernel.org, 
 catalin.marinas@arm.com, ukleinek@kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250304173229.3215445-2-fabrice.gasnier@foss.st.com>
References: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
 <20250304173229.3215445-2-fabrice.gasnier@foss.st.com>
Message-Id: <174111571576.3307031.12348647271786435979.robh@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: mfd: stm32-lptimer: add support
 for stm32mp25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_111518_771858_2D589487 
X-CRM114-Status: GOOD (  14.99  )
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


On Tue, 04 Mar 2025 18:32:22 +0100, Fabrice Gasnier wrote:
> Add a new stm32mp25 compatible to stm32-lptimer dt-bindings, to support
> STM32MP25 SoC. Some features has been updated or added to the low-power
> timer:
> - new capture compare channels
> - up to two PWM channels
> - PWM input capture
> - peripheral interconnect in stm32mp25 has been updated (new triggers).
> - registers/bits has been added or revisited (IER access).
> So introduce a new compatible to handle this diversity.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in V2:
> - Use fallback compatibles, along with stm32mp25 specific compatible
> - trigger identifier can be up to 4 (e.g. from LPTIM1..5)
> ---
>  .../bindings/mfd/st,stm32-lptimer.yaml        | 40 ++++++++++++++++---
>  1 file changed, 34 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:26:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:29:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:67:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:70:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:87:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:90:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:103:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:106:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:120:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml:123:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250304173229.3215445-2-fabrice.gasnier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


