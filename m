Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1670DFA3726
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 11:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEXNvYOLhbEMpD5dMRCyQrR7MZO5fbQkWY4maZAD62E=; b=yV5z9Ra9n2eeIWHH5av0prpbuh
	XQ2a2cSfUcaNuGVRmBESVus6/MoWi7zKnq4FrwVC4usfphyrwGuaF4yF69EDkM/drJMbH+N1DKqmn
	fGlFsEVIN4d9M7nbwJeyggz7wndmGsVx+cgVFVvZcBXSjLeiH6GNnS6w0a3KPmo4HfboY1+AKkTfL
	F0mzGB9oyMRr0a8D3czdjqZzByOqF5wsSKGD3sNZw6otVMBo8OOIj96Lzd/Az/K/Prvz+5VUlDgbn
	+VuydPLZSWRv7PoEvNZBjzAfaL/3M9x71MGKRVSwIvYaQxVbaizva2D1t78B+qtzJmZxc9NK3SDwI
	SjmLnUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdDt-000000087re-0zcb;
	Fri, 02 Jan 2026 11:21:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdDq-000000087rG-2Y2g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 11:21:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E78E7497;
	Fri,  2 Jan 2026 03:21:25 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4EA23F63F;
	Fri,  2 Jan 2026 03:21:31 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	philip.radford@arm.com,
	peng.fan@oss.nxp.com
Subject: Re: [PATCH 0/2] Rework protocol version negotiation core logic
Date: Fri,  2 Jan 2026 11:21:25 +0000
Message-ID: <176735282490.185874.1375589507295412646.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227164132.1311988-1-cristian.marussi@arm.com>
References: <20251227164132.1311988-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_032134_707040_CCF2E549 
X-CRM114-Status: UNSURE (   7.97  )
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

On Sat, 27 Dec 2025 16:41:30 +0000, Cristian Marussi wrote:
> this small series rectifies the protocol negotiation logic employed by the
> core SCMI stack when trying to cope with newer unknown protocol versions
> advertised by the platform under any circumstances.
> 
> The existing protocol negotiation logic per-se was fine, but unfortunately
> the whole negotiation process was started at the end of the per-protocol
> initialization phase since it relies on the version querying performed by
> each protocol initialization logic.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] firmware: arm_scmi: Rework protocol version negotiation logic
      https://git.kernel.org/sudeep.holla/c/0fac05fdd9af
[2/2] firmware: arm_scmi: Remove legacy protocol versioning logic
      https://git.kernel.org/sudeep.holla/c/24a0ffefe3f0
--
Regards,
Sudeep


