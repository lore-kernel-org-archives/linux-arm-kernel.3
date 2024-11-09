Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0F0D5E373
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 16:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yoFQrLRbNDbA+L5VK7Gi35zZ133ZjYtyjYnQzBoB64=; b=EjvfqT+7O1+xSNtHo5o7HEYswf
	2V/zx8n5R+gXBLYuxFjGNoFUr/RP+6NTCKJrpv4m2UqLjjwinFu75lANlTLjnTf/KVNNz0a8d1KNv
	7xS8rWybkM+Y5quLTP9yvj5ugB6nDM1oNcVKvxglXtcAU1TMZZ8UUtggQJ/lps0qqx+6sebAQ4VSQ
	6bSyNCcm4tlUi7kXouL6QYgRabr4qgBen9eeVcwdv/Ghmzwc/dWiOrBGJqixOOna3MVnGeRbyV7xC
	VDkg0vQlLZDUmQZKlNXUWrda2M5xAl6x/ZkyBWEZO8ObloJg8pIcsxATGJ1zMxWDFa3QGVZ7O+918
	Yc+Wes5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9oV4-0000000DfB8-0ITB;
	Sat, 09 Nov 2024 16:39:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9oSb-0000000Dea8-3Sg0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 16:37:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D49C5C1498;
	Sat,  9 Nov 2024 16:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF46C4CECE;
	Sat,  9 Nov 2024 16:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731170236;
	bh=KmrkR7SY2XfMX1n2JutVpNklxzuRHWektyFf7oAOTJk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zlme5mmFAq2nGaQbpRgioe+nI3wFR14MKsDaqgt+SP9s08LNstW9ZJzu0HMDvxvIh
	 u3B54+/MZ2KPJPbMW1BwGPNmaoJZOpK3osh7MnJ13ZDI7GmZZlWV0CqGbbmcQAvioM
	 nMJ5+8AVr7+BnaOft620skl7c/1//7pB9eFyyQHslx+/o9YHYej7zGBdmrEcWT+E7j
	 jMJgH853zFImwHNy/3bVGg88gGBG9EjNQajVd6Q1hAs0GQdktq5EAe+noByQUk6+Si
	 r36kcWF8b+90Z6esjjYKI0Ni9ETKkyo63YYikGpHKsQdTBb+L65x3wx4hq6w9V4J8M
	 6PFUFK96yzdzw==
From: Namhyung Kim <namhyung@kernel.org>
To: leo.yan@arm.com, james.clark@linaro.org, mike.leach@linaro.org, 
 Steve Clevenger <scclevenger@os.amperecomputing.com>
Cc: suzuki.poulose@arm.com, ilkka@os.amperecomputing.com, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <cover.1731027120.git.scclevenger@os.amperecomputing.com>
References: <cover.1731027120.git.scclevenger@os.amperecomputing.com>
 <cover.1731027120.git.scclevenger@os.amperecomputing.com>
Subject: Re: [PATCH V11 0/2] arm-cs-trace-disasm.py/perf must accommodate
 non-zero DSO text offset
Message-Id: <173117023647.3738736.13855747983305853936.b4-ty@kernel.org>
Date: Sat, 09 Nov 2024 08:37:16 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_083717_939093_83A9C96A 
X-CRM114-Status: UNSURE (   6.09  )
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

On Fri, 08 Nov 2024 12:11:19 -0700, Steve Clevenger wrote:

> Changes in V11:
>   - Corrected prefix.
>   - Fixed compile-time error for perf debug build by substituting in
>     the map__pgoff macro (trace_event_python.c).
> 
> Changes in V10:
>   - Removed errant space in patch file 0002. Passed 'git apply --check'
>     at perf-tools-next, 6.11.0-rc6.
>   - Added back missing prefixes.
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


