Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AE3D6406B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5M0WuT/kOUVZF09UrHqWPzjXb/egQadrgMZAMg6gSD8=; b=0VqYt9r0frN8HQpSGloc0qR58Z
	EtFVsOJHBR705tl0W5hZ5jk54w6izEn1KrvQmpHM09Q3bE5f+ukCf7K51Si1FQ+d4rjU8rHIEqZzI
	2ffv3K3E2dXxXTlry+wDSrPhxPsQ+nXDoYZY7GU5pzJ/X1E6O76qbMSV/upMzDzCDaw3/slvtJOiM
	vmvmhrU4PeuNeHGDnLKWQofOSHY1X4ub6c5Q/YPfu9WKwnHhAZW50llai8lOycdhxcPIxMQrYgctO
	njgCZDpEd5AZ7FJ6cwDA5OTxv+4kXh//O3zFqEUP3NN5sh/9dIiEA7KTXQtx+hwPQoyd+Q05T0PvI
	7KzQYB9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SVJ-0000000BKft-2R48;
	Fri, 08 Nov 2024 17:10:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SB5-0000000BIWG-1PeM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 16:49:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6172A44105;
	Fri,  8 Nov 2024 16:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74B9C4CECF;
	Fri,  8 Nov 2024 16:49:39 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fu Wei <fu.wei@linaro.org>,
	Aleksandr Mishin <amishin@t-argos.ru>
Cc: Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] acpi/arm64: Adjust error handling procedure in gtdt_parse_timer_block()
Date: Fri,  8 Nov 2024 16:49:37 +0000
Message-Id: <173108456808.1559945.7267714266798748439.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240827101239.22020-1-amishin@t-argos.ru>
References: <20240827101239.22020-1-amishin@t-argos.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_084943_460930_44F12F22 
X-CRM114-Status: UNSURE (   8.36  )
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

On Tue, 27 Aug 2024 13:12:39 +0300, Aleksandr Mishin wrote:
> In case of error in gtdt_parse_timer_block() invalid 'gtdt_frame'
> will be used in 'do {} while (i-- >= 0 && gtdt_frame--);' statement block
> because do{} block will be executed even if 'i == 0'.
> 
> Adjust error handling procedure by replacing 'i-- >= 0' with 'i-- > 0'.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] acpi/arm64: Adjust error handling procedure in gtdt_parse_timer_block()
      https://git.kernel.org/arm64/c/1a9de2f6fda6

-- 
Catalin


