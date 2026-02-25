Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D3DFD3764
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkHJ4PF4MMhKO1es7jC6yT37940v+gbS5FEcqvTZjTM=; b=TKC5a89Yl19xcLGPBZPDKA9Gwn
	IAoSnK85iid5k0JSN81QRSOkhybee0UCQ75jUPdAP03N+yye76k2uZ82eRzlNNUroa/2aTBHgfjbt
	aYPBxot6fGzCTOKkMNeM6gW4OZLCizr2J4SkDcpwzw6t4xggzXA7lpx4xYodFVzu2fJ0rj7fXwTC9
	sbdsMm27Cgfwirs9ykDrOwdFX/cWaua3aqsOt3M3UXMJ4/kIBvaTHwIEf3d4arYhcg5BGy+K1DLpW
	AaJN6obWENmebR6jnrk3P69Tq0DHylYUxKGwhwuU3n1gCqW4vvFDLJNSo3ERx93B8fXttS8ToKuZf
	t7qxOY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFtW-00000004DLh-0g8F;
	Wed, 25 Feb 2026 14:29:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFtT-00000004DL9-1Tyu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 14:29:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E19AB165C;
	Wed, 25 Feb 2026 06:29:29 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D77D63F59E;
	Wed, 25 Feb 2026 06:29:34 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/8] coresight: Fix device registration and unregistration
Date: Wed, 25 Feb 2026 14:29:20 +0000
Message-ID: <177202974589.1344628.9285576252750761720.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
References: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_062939_427497_051CACE9 
X-CRM114-Status: UNSURE (   8.67  )
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


On Mon, 09 Feb 2026 12:44:32 +0000, Leo Yan wrote:
> This series is to fix and refactor CoreSight device registration and
> unregistration, it can be divided into three small parts:
> 
>   Patches 01-03: Three fixes for memory leak, device reference and mutex
>                  protection.
>   Patches 04-05: Move connection cleanup operations into
>                  coresight_remove_conns().
>   Patches 06-08: Refactor error handling in coresight_register().
> 
> [...]

Applied, thanks!

[1/8] coresight: Fix memory leak in coresight_alloc_device_name()
      https://git.kernel.org/coresight/c/0289ada4a316
[2/8] coresight: Get parent device reference after sink ID map allocation
      https://git.kernel.org/coresight/c/2f322f039281
[3/8] coresight: Protect unregistration with mutex
      https://git.kernel.org/coresight/c/a6c4da4b95a3
[4/8] coresight: Refactor output connection sysfs link cleanup
      https://git.kernel.org/coresight/c/32c225491ed8
[5/8] coresight: Refactor sysfs connection group cleanup
      https://git.kernel.org/coresight/c/babb987968d3
[6/8] coresight: Move sink validation into etm_perf_add_symlink_sink()
      https://git.kernel.org/coresight/c/6b1ffc542850
[7/8] coresight: Do not mix success path with failure handling
      https://git.kernel.org/coresight/c/8573756b235d
[8/8] coresight: Unify bus unregistration via coresight_unregister()
      https://git.kernel.org/coresight/c/eef33a7cce23

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

