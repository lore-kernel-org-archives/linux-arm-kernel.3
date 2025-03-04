Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85240C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBg9YsMlMkeh1diH59xObbd1jaMUeo9WZAcJg9IGtIw=; b=fwJhB2L3hvGO+GaJpeRR3mPuMO
	Mm+rWzrZ+kpNVTn4YqNLZDJMfgQZn1zLer22E+Gvqpuzwo2ECz0jKBF8f6GMS5N2Cfw9HOZGqXZ2+
	A+97rnYmdQj/Zliva0GKMM6Naabk3Yk7pOGxVbLrpLEetY56duz4qKFiQV6/+QQmlrTLcacScfsBP
	5e93U+DwUWiwFE4u466RSOwMUHTOsd93b6vwvGN5B/jIXdDyGWK/FMchphCPXohaG540MzPBvsBfq
	uSWDRyClPVjJIn+MqJ/rePfE1cHMTbgjDspzmS5VBzoIFT38kSrks1OSbY4/CHl8ERUrt11HTG2gh
	9Kv/mfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4v-00000004WlK-3XGE;
	Tue, 04 Mar 2025 12:08:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPym-00000004IrB-3su1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:58:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04CF1FEC;
	Tue,  4 Mar 2025 02:58:42 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 186723F5A1;
	Tue,  4 Mar 2025 02:58:26 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	Paul Benoit <paul@os.amperecomputing.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] firmware: smccc: Support optional Arm SMC SOC_ID name
Date: Tue,  4 Mar 2025 10:58:24 +0000
Message-Id: <174108587625.432485.15057756163207597336.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219005932.3466-1-paul@os.amperecomputing.com>
References: <20241114030452.10149-1-paul@os.amperecomputing.com> <20250219005932.3466-1-paul@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_025829_005288_2194534D 
X-CRM114-Status: UNSURE (   7.66  )
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

On Tue, 18 Feb 2025 16:59:32 -0800, Paul Benoit wrote:
> Issue Number 1.6 of the Arm SMC Calling Convention introduces an optional
> SOC_ID name string.  If implemented, point the 'machine' field of the SoC
> Device Attributes at this string so that it will appear under
> /sys/bus/soc/devices/soc0/machine.
>
> On Arm SMC compliant SoCs, this will allow things like 'lscpu' to
> eventually get a SoC provider model name from there rather than each
> tool/utility needing to get a possibly inconsistent, obsolete, or incorrect
> model/machine name from its own hardcoded model/machine name table.
>
> [...]

Applied to sudeep.holla/linux (for-linux-next), thanks!

[1/1] firmware: smccc: Support optional Arm SMC SOC_ID name
      https://git.kernel.org/sudeep.holla/c/5f9c23abc477
--
Regards,
Sudeep


