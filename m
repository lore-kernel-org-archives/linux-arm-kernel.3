Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1B3EED626
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qz7KHCawfInjRNv/BN09cC1jmDk/9ydVq108jE1YgZw=; b=NPbc5O+5GAYeLOFffUIMrE4crt
	uvsK/gOEZifXOMkzg6dKb5auxe3jESLqLhHEZ2KN4rp7EtF28nhgnFyX20F1gySOYkDjjMWMrwCFh
	rOCPJXO64oM/DNNJflf041SMPUmWw0ex4x7M4ZvlbwHv5l/drgrFFuzsLSi75BKgdOYsQCwJLwzLO
	cecRnAjmSiMqiYagOovxuYP27ieQF7gN6pNOoV86JYzlDVQRPD/+yjW8OL3hE56IVf+CBN0DbkkYR
	3o3hH8s8AUWxa+3nu7JQdYYKx3Gh2Vd45j9/93zCy7qm7Tc1x79WZkijlnIlORausWyO8+vJwam8d
	8Bct58RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMsJ-00000007Phi-28ax;
	Thu, 01 Jan 2026 17:54:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMsG-00000007PhH-2ZJr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:54:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5AAD497;
	Thu,  1 Jan 2026 09:54:04 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B6A473F63F;
	Thu,  1 Jan 2026 09:54:10 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: move boiler plate code into the get info functions
Date: Thu,  1 Jan 2026 17:54:07 +0000
Message-ID: <176729001152.117348.7354510710977239788.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <287b5302f583e3535d50617ec3b0856e38253171.1761576798.git.dan.carpenter@linaro.org>
References: <cover.1761576798.git.dan.carpenter@linaro.org> <287b5302f583e3535d50617ec3b0856e38253171.1761576798.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_095412_715372_8D4E99E1 
X-CRM114-Status: GOOD (  11.46  )
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

On Mon, 27 Oct 2025 18:16:06 +0300, Dan Carpenter wrote:
> This code to check whether the selector is valid and if the item has
> already been recorded in the array can be moved to the
> scmi_pinctrl_get_function_info() type functions.  That way it's in
> one place instead of duplicated in each of the callers.
> 
> Remove the check for if "pi->nr_groups == 0" because if that were the
> case then "selector >= pi->nr_groups" would already be true.  It already
> was not checked for the pin case so this makes things a bit more uniform.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: move boiler plate code into the get info functions
      https://git.kernel.org/sudeep.holla/c/a3c46c82d8a2
--
Regards,
Sudeep


