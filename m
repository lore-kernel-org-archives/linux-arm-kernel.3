Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6B4CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rs8P6VRuGXDMZFTEBvX21k7RMFIHTk5kK9l4Gd0bKEA=; b=isSDkhcptnicvA77Ls25GLKAmg
	4pfA7pqg2jVQJIMzUrG+2BQx0tt7VypN8tkgj7C/M1F0yFr6vveh5Y+ar4hBBYrfxqI0nxjUrfapg
	oWw42jkUIsVgVuBagd7ODkvJAY4/Qk8AWTZ4fL5S/OHfQZMITbw7wNPBZxKZtMyVNehr7gONshi87
	6VczH/RMfD9CzXEQK7dv4AzgZtTGXQ2SScvuE+7kzapZzqhnD8+hu0nUiGmLdg+ZHZ6xMiLTfony2
	XIVMocofxb1xkMGGqSkY57W5y+TuhUSplaRbHeKBGNfvaInCJjev+VbamDQesw9AvUQKlnk4TRlyZ
	7QvGQUhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KJY-00000004C2N-0Uu2;
	Thu, 16 Oct 2025 09:30:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KJV-00000004C1t-2GV9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:30:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A65F1688;
	Thu, 16 Oct 2025 02:30:17 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0683A3F6A8;
	Thu, 16 Oct 2025 02:30:23 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: cristian.marussi@arm.com,
	Artem Shimko <a.shimko.dev@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] firmware: arm_scmi: Fix premature SCMI_XFER_FLAG_IS_RAW clearing in raw mode
Date: Thu, 16 Oct 2025 10:30:21 +0100
Message-Id: <176060697680.944189.4592525887904393167.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008091057.1969260-1-a.shimko.dev@gmail.com>
References: <aOVGGaY9NmKqUwPG@pluto> <20251008091057.1969260-1-a.shimko.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_023025_761487_DDDBDAF4 
X-CRM114-Status: UNSURE (   6.22  )
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

On Wed, 08 Oct 2025 12:10:57 +0300, Artem Shimko wrote:
> The SCMI_XFER_FLAG_IS_RAW flag was being cleared prematurely in
> scmi_xfer_raw_put() before transfer completion was properly acknowledged
> by the raw message handlers.
> 
> Move the SCMI_XFER_FLAG_IS_RAW and SCMI_XFER_FLAG_CHAN_SET flag clearing
> from scmi_xfer_raw_put() to __scmi_xfer_put() to ensure flags remain set
> throughout the entire raw message processing pipeline until the transfer
> returns to the free pool.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Fix premature SCMI_XFER_FLAG_IS_RAW clearing in raw mode
      https://git.kernel.org/sudeep.holla/c/20b93a0088a5
-- 
Regards,
Sudeep


