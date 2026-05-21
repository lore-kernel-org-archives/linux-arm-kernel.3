Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6A7CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35YDvwp6F7I9fGWtxxPA64fKKS1ajDvwVmVIBA8od1I=; b=DBwBLnoNV0SyYw+k74qY+g+sJP
	ay9XAhOEb2hjdghOzQUfIdy9LC4KX+aj1WEH/n1u0KMZfkocmTFKlAiXbFTt5t7ZIf2TsBbZwEHQ7
	B1yC2XejVOHkEXpJsQ+mBhCvo0GJ35vlAtpLjMmdySpgy5Zu1jZ9QvnwcooqXH2xnvfu64biD4Drx
	ig5W6xMVNABjVHHHpLQlpCebpIj6sIrI71tdX603jX+tzVxMjaUb6G3GuNq7hPluh2n76krI9MSUu
	keQ3MRHT98jGkU8WKBGYZpL379lU4R4/bD4sa3t7UqhBOv2kUdyiaCRrTbSCAq4CquC7JoMcCpJ+F
	CGpjAisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ46M-000000080HH-36pl;
	Thu, 21 May 2026 14:10:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ46J-000000080Gd-2ieI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:10:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D42EB407CB;
	Thu, 21 May 2026 14:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4E51F000E9;
	Thu, 21 May 2026 14:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779372614;
	bh=35YDvwp6F7I9fGWtxxPA64fKKS1ajDvwVmVIBA8od1I=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ns1WJZVpavHrIUNHeOW4iduOWaGxq0oKE5bgpyOw+B5feDr7ucpneCQ1hIxzCKh3H
	 tIbW78UIk2L7tuXjlE1eZ1kwGf8+izoxlCGf3JpU3To+xXsATRlA/FklVelpPLo+RP
	 BqRvm1DlmAC8fFjWBeBbjvclibvI3Pd3H2iLLMf4L2VCZRhh1rAjNir6k2o+W/PXP3
	 VKCXvjSjn4CMGqPDJdN1pKtikkoiYiIr9LOMOdKeIehFQyvWUGz5yYrMH45ytXllfq
	 +2nrTB9c75b/hsNRCGpQ0dk6T2oEcoPnL+Akf1ODakD4RipHfN4cOm7QuLZsq82G60
	 SFcFydFv4q0FA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Fix protocol parsing and validation
Date: Thu, 21 May 2026 15:09:05 +0100
Message-ID: <177936870652.1992706.7312445035946256503.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_071015_713212_B1FB3F6D 
X-CRM114-Status: GOOD (  10.22  )
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

On Sun, 17 May 2026 20:02:39 +0100, Sudeep Holla wrote:
> This series fixes a few SCMI protocol parsing and validation issues found
> while checking the driver message layouts against the SCMI specification.
> 
> The first patch fixes a clear response width mismatch in SENSOR_CONFIG_GET,
> where the driver requested a 4-byte response but read it as a 64-bit value.
> 
> The next two patches harden notification parsing for variable-sized payloads.
> BASE_ERROR_EVENT and SENSOR_UPDATE both carry counted trailing arrays, so the
> received payload size must be validated before copying or parsing those
> entries.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!


[1/4] firmware: arm_scmi: Read sensor config as 32-bit value
      https://git.kernel.org/sudeep.holla/c/f6fe7c3c007d
[2/4] firmware: arm_scmi: Validate BASE_ERROR_EVENT payload size
      https://git.kernel.org/sudeep.holla/c/56e7e64cdd0e
[3/4] firmware: arm_scmi: Validate SENSOR_UPDATE payload size
      https://git.kernel.org/sudeep.holla/c/32bc5496b481
[4/4] firmware: arm_scmi: Validate Powercap domains before state access
      https://git.kernel.org/sudeep.holla/c/fcca603c6a09

--
Regards,
Sudeep


