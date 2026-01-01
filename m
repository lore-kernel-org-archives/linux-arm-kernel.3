Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4EDEED630
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BP/luiEyksOlTO0/I+0YqJ6D7AljHvwA8M3hrhke0+E=; b=wa7shFBIBYXwstsGhJ78z0XzgE
	rIYiXHoUlz8j0lHF5mVWXGhAjKk8Ts3Lr06JrjKJDPhXol/7eW+goC+owg4mIi+VU82dpKnr4HKmJ
	VrsTBqIvYPRZZcoFlnGXGrADroRwt0R/pt8YhHA9WKclYz9Ou5Chu499CjwQltgmhKxUVNzRHkPTK
	dnQ+R8+2feRG/aS4fqQ5ok2v0uRdE5XKOguLoYPbGKYibj2WV6SrfwjWuoS9hMAAk6BqmxMBO7ZzK
	knWIoqUgEGMO4tyYwvK1iScobSXnwmizIrbEe3kEO3U3vJHpO5+aG23ItWn524jvyAwDW/L1o/Uvw
	SCMIM5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMuE-00000007PtR-1EFT;
	Thu, 01 Jan 2026 17:56:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMuC-00000007Pt5-0oYK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:56:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA376497;
	Thu,  1 Jan 2026 09:56:04 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB3B53F63F;
	Thu,  1 Jan 2026 09:56:10 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: cristian.marussi@arm.com,
	Artem Shimko <a.shimko.dev@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] firmware: arm_scmi: refactor reset domain handling
Date: Thu,  1 Jan 2026 17:56:07 +0000
Message-ID: <176729013834.117553.5174830744043719294.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251123163557.230530-1-a.shimko.dev@gmail.com>
References: <aRW4PpPjVw1-melm@pluto> <20251123163557.230530-1-a.shimko.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_095612_268586_6319B845 
X-CRM114-Status: UNSURE (   6.14  )
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

On Sun, 23 Nov 2025 19:35:57 +0300, Artem Shimko wrote:
> Improve the SCMI reset protocol implementation by centralizing domain
> validation and enhancing error handling.
> 
> Add scmi_reset_domain_lookup() helper function to validate
> domain ids and return appropriate error codes. Refactor all
> domain-specific functions to use this helper, ensuring consistent
> error handling throughout the reset protocol.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: refactor reset domain handling
      https://git.kernel.org/sudeep.holla/c/f6753869a25e
--
Regards,
Sudeep


