Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED722CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 06:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQPqoXHZjHIhkyz1L63mvCcyoIpV7xkBagmpswc3TYo=; b=1JWHkbkfeqwRmI6MLHkoWHTgEn
	P/Bp/syx5olQ+v5QK1p2wtJyydOOU5EQYcZCDAKlsF9poXTRs7JVkMiagaEQPA4ckjezn5bQra54M
	cNIMyTHUoDeCTYwrVO24dh3Ul11c6nIJfY9ixClpd1VLOWxNHEb2H9Ml1hryUHIrwxVyix4uP0AEo
	dSxQjKMgg5LmAWCbWev3wnFoffV1unsqXnK3UV9QeZAq9jg4ULVyeiyuEdr53wycocnr08WLKVJj+
	JqnsoC7mC7Jj6qfCkQ7FYRDKMJaqPC43+87D99KBDwcuM8upGO/2dz9AqFRtjpFFTsMNY73ktS7HM
	bEo5i1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCtgP-0000000D6J1-3ftE;
	Sat, 03 Oct 2026 06:57:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCtfs-0000000D6IK-156n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 06:57:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78DDE2F;
	Fri,  2 Oct 2026 23:56:42 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 68FA63F763;
	Fri,  2 Oct 2026 23:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791010605; bh=yGRTJM11lPHqEAQCmI16d80x3sFjPSlkt3Eyi59eG50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ONuKuNcizlGzNYDJFxNVPzOBceTDLx5lM2xdJ7qmFsTpy8Mo1er8c27FcBXGv6+1Y
	 lXgWh5atiJ4MXFXvhiMr0ZZfHV+z/5aAvEX5JR3rJRl4/7HuQoIoYzcUqn5FmTjZnB
	 g2OFkozb5o6buo6bc+QZFm7kD50V1XPK2Gj0hSls=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH RESEND v13 00/14] fix several inconsistencies with sysfs configuration in etmX
Date: Sat,  3 Oct 2026 07:56:34 +0100
Message-ID: <179101052919.1709951.18400347613609410532.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003-separate_etm_cfg_v2-v13-0-5d8a29aead95@arm.com>
References: <20261003-separate_etm_cfg_v2-v13-0-5d8a29aead95@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_235648_821749_4E66B95B 
X-CRM114-Status: UNSURE (   9.39  )
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


On Sat, 03 Oct 2026 03:52:12 +0100, Yeoreum Yun wrote:
> The current ETMx configuration via sysfs can lead to the following
> inconsistencies:
> 
>   - If a configuration is modified via sysfs while a perf session is
>     active, the running configuration may differ between before
>     a sched-out and after a subsequent sched-in.
> 
> [...]

I have fixed up minor checkpatch warnings and subjects.

Applied to coresight next, thanks!

[01/14] coresight: etm4x: read-back TRCSEQSTR at disabling and prohibit modifying seq_state while enabling.
        https://git.kernel.org/coresight/c/a373952d86cf
[02/14] coresight: etm4x: prohibit modifying cntr_val while session is enabled
        https://git.kernel.org/coresight/c/76b21c25a5f7
[03/14] coresight: etm3x: prohibit modifying cntr_val and reset while session is enabled
        https://git.kernel.org/coresight/c/88eaf963853d
[04/14] coresight: etm4x: fix inconsistencies with sysfs configuration
        https://git.kernel.org/coresight/c/b2131cff7224
[05/14] coresight: etm3x: fix inconsistencies with sysfs configuration
        https://git.kernel.org/coresight/c/950cca5352b0
[06/14] coresight: etm3x: remove redundant cpu online check on etm_enable_sysfs()
        https://git.kernel.org/coresight/c/4f7701c1f0d0
[07/14] coresight: etm4x: introduce struct etm4_caps
        https://git.kernel.org/coresight/c/a2cee9814137
[08/14] coresight: etm4x: exclude ss_status from drvdata->config
        https://git.kernel.org/coresight/c/b5022acaee3b
[09/14] coresight: etm4x: remove s_ex_level from config
        https://git.kernel.org/coresight/c/d6fbf353e35d
[10/14] coresight: etm4x: rename local config as curr_config referring drvdata->curr_config
        https://git.kernel.org/coresight/c/f5e6bb291eca
[11/14] coresight: etm4x: rename drvdata->config to sysfs_config
        https://git.kernel.org/coresight/c/30f946375269
[12/14] coresight: etm3x: introduce struct etm_caps
        https://git.kernel.org/coresight/c/7cadafd5a12e
[13/14] coresight: etm3x: rename local config as curr_config referring drvdata->curr_config
        https://git.kernel.org/coresight/c/da1ffcf6bb43
[14/14] coresight: etm3x: rename drvdata->config to sysfs_config
        https://git.kernel.org/coresight/c/3663b4e9875b

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

