Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD54FCAC58B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGYYbfS1kDdHSJsmOnUcTuiW+kXMTBn+m1V94e6yRDw=; b=tRK9sXexHnA2m9pX7WNN/bZYmM
	8qb5cFgMkBTBsL5KfXYZWuJe+NH3MMtRtajDYG0yZNULQuy9Pg0mqlqbnR71zJOszByeQt440Cq5Q
	O+8DIpl2C6stdicMV1iyq4vIQ85LnNDECYeZsoqi78ADdkLK/pukICYbw3ODeUJxbJ3EPoVsJP38x
	XdL06KT54js6cHTwJDiAkPdXjv9veSSowe/LA9AyX7Sj3ccJvUEdl7TG//ozzSdTKGcKpmUKdTlRE
	tSa/hcqdtB6VJzaAz1zSDo/x0RtJH+EojshFZuqB7Wdbsb5En6NQDGF+unIjnT64ewlNgtL3B30pK
	FiBCB92w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvacK-0000000GrLb-3oOr;
	Mon, 08 Sep 2025 12:05:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYvy-0000000GJsx-3hNW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:17:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBBA61692;
	Mon,  8 Sep 2025 03:17:05 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7DB973F66E;
	Mon,  8 Sep 2025 03:17:12 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: quirk: fix write to string constant
Date: Mon,  8 Sep 2025 11:17:06 +0100
Message-Id: <175732658793.3917221.3759858357141010136.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829132152.28218-1-johan@kernel.org>
References: <20250829132152.28218-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_031714_962688_924FE5CF 
X-CRM114-Status: UNSURE (   9.37  )
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

On Fri, 29 Aug 2025 15:21:52 +0200, Johan Hovold wrote:
> The quirk version range is typically a string constant and must not be
> modified (e.g. as it may be stored in read-only memory):
> 
> 	Unable to handle kernel write to read-only memory at virtual
> 	address ffffc036d998a947
> 
> Fix the range parsing so that it operates on a copy of the version range
> string, and mark all the quirk strings as const to reduce the risk of
> introducing similar future issues.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: quirk: fix write to string constant
      https://git.kernel.org/sudeep.holla/c/572ce546390d
--
Regards,
Sudeep


