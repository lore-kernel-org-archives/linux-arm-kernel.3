Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20470C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+9gFcmORa6/5IWzW3LxHc40hSptbFjZa934kGkDdXA=; b=mgXNb/jRh7CNL9XTYRoSh7nA8Y
	QxiFgG0k4lyFgCuUJaYayIthQ7NazerSpxVCkSqEw9YSaZUcPHRmHEuN/3Oyj9a9gpRDNgJRrH7Or
	MlTWXW3T9XvAEQrCiXrBf8RK4RDj1f/88gvGgjRVN+uC+UFySsH7Fhd28Th67AX+Q5+2wf84Is2rR
	RlVeL7K0ofpBAbynM64LZOe5seFmwZU8BUky6mHcGh83TUm7dXphc4LQVK5Yfrsfh27TP1xToEr3s
	SFG0f1+YitJw0udTGla7ekfy1x3LKRVC9VdMuhYezap/xf28VubztgiISxsScQPgyTCPJihOXmeem
	pKPK83dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHFp-0000000BsTk-17oU;
	Tue, 06 May 2025 12:18:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFKO-0000000BXOo-1HP4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:15:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50D12113E;
	Tue,  6 May 2025 03:14:58 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 828EC3F5A1;
	Tue,  6 May 2025 03:15:06 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Marc Zyngier <maz@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: quirk: force perf level get fastchannel
Date: Tue,  6 May 2025 11:15:04 +0100
Message-Id: <174652648581.3776799.11461926125587533598.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430135146.5154-1-johan+linaro@kernel.org>
References: <20250430135146.5154-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_031508_387494_6B69970F 
X-CRM114-Status: UNSURE (   8.37  )
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

On Wed, 30 Apr 2025 15:51:46 +0200, Johan Hovold wrote:
> The Qualcomm SCP firmware in X1E machines like the Lenovo ThinkPad T14s
> does not set the FastChannel supported attribute bit for PERF_LEVEL_GET
> but crashes when falling back to regular messaging.
> 
> Use the new SCMI quirk framework to force FastChannel initialisation for
> this implementation.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: quirk: force perf level get fastchannel
      https://git.kernel.org/sudeep.holla/c/397f802d06c4
--
Regards,
Sudeep


