Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4551C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IebQMqINzMoLs9TzHSd65Axvb4i3On5X9G/RhDBqZf0=; b=NNftcrjxBRCgVzdffd0h7nlntX
	IVyErnK4w3puQlG2zeajnfsjuO5yHGXyPtiE97RUrVIiraiKblCiq+b+XXrxhwdvXYci0mEuNOrCk
	qBJtoY41flbeSBzpcGUIGtMQN5PGtnTu/lZRptASpSSoI73dOk26UYpBm5RzQVW9b1w7F1OdQ3NMN
	Jg2a2Dpa0B2vXngNHf1Qh0QZxJ7F9E7gB+r2dSQhf890aoEsEkgpc5npObskYcQjSymPRUYP2BBdI
	mtuaZkKSMJ8DsMdyeh1VhOIB4vxb+sySHv8xt62txeHN9A7HumBivWKCQyJ6phtrwQ9gkF0hSda6R
	vdEEa2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRMW-00000005LnU-2z3O;
	Fri, 21 Feb 2025 11:38:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRKw-00000005LZV-22b9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 11:36:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B7B61516;
	Fri, 21 Feb 2025 03:37:11 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E96A3F59E;
	Fri, 21 Feb 2025 03:36:52 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>,
	Guomin Chen <guomin_chen@sina.com>
Subject: Re: [PATCH 1/3] firmware: arm_scmi: Relax duplicate name constraint across protocol ids
Date: Fri, 21 Feb 2025 11:36:41 +0000
Message-Id: <174013775144.527060.3854739090604222031.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131141822.514342-1-sudeep.holla@arm.com>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_033654_567021_C4463C8F 
X-CRM114-Status: UNSURE (   6.59  )
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

On Fri, 31 Jan 2025 14:18:20 +0000, Sudeep Holla wrote:
> Currently in scmi_protocol_device_request(), no duplicate scmi device
> name is allowed across any protocol. However scmi_dev_match_id() first
> matches the protocol id and then the name. So, there is no strict
> requirement to keep this scmi device name unique across all the protocols.
>
> Relax the constraint on the duplicate name across the protocols and
> inhibit only within the same protocol id.
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/3] firmware: arm_scmi: Relax duplicate name constraint across protocol ids
      https://git.kernel.org/sudeep.holla/c/21ee965267bc
[2/3] firmware: arm_scmi: Add name and protocol id attributes
      https://git.kernel.org/sudeep.holla/c/feaea74fd697
[3/3] firmware: arm_scmi: Emit modalias for SCMI devices
      https://git.kernel.org/sudeep.holla/c/d069c33f5ce2
--
Regards,
Sudeep


