Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EF6C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8rbBY7tOZS1I6xbunY/ZVWqlDUxt7wQouXNVOazbTE=; b=mkjdROjxPwBZEMYt4fdY4V8Flt
	l+FsqdAGJ97qi9l31NYB3a9bLOWfvs+NcgGxJIV/yen3YAfi+qNcsPkBzsKvje7Qp2jiK3VzyoMBm
	Wvs5snlbyJJ8Hj8IL/JT2WjVOgSsyYsS/DCXuPGQoSM4zLyD5ie8yXCIMe4sM9HS6frKiyAtw03P0
	zXhVDqTrhnhQOHzr+qP39l+OQ2MiaFZ/o6IPvH3D/QhtyuRd959EseD8fQWi9mw8LnpZKI2vCx+Z9
	Zh/BPQ2JQ/LyUo8xCVJO0EOWtAes2vykRmjbpiWtyZAEEjPVLtMkNgdYOSvxiBijKZmJtH6TJlzk4
	ZQftVWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2N5-0000000D0YG-2vMf;
	Fri, 25 Sep 2026 09:37:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2N4-0000000D0Y9-3DxB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:37:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBF0560230;
	Fri, 25 Sep 2026 09:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE971F000FF;
	Fri, 25 Sep 2026 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790329053;
	bh=S8rbBY7tOZS1I6xbunY/ZVWqlDUxt7wQouXNVOazbTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CVRtW7FvQnz7sJUapIeWFHWtBZxeNPl06POWsm3SXZLQ7JECJhstj6KdcqV2+f1QZ
	 /rstgiDLOxl3XA6skseO//CDvsWpCbbftmBGo12Q3AtMvv4enKR7vEHrB+C9904Ryu
	 fe1BKW6hMtPKxkihTRYeiHeULSe6N2JPKOeBx+MESgwnX7NQwE8w426Z4AmdMy6vLQ
	 +Gbxe5UcX/JlWt/5UcldQKFv518kXmXlv1NTV1u5q+Zw2lqbLc2fzTjY13atj32s5N
	 +PclzoZvBEICCrq+GXb5loNgNgLVUAt1TST32633kOb/kmJ1uT5GNySwcDWYYY/OIC
	 vJvFo81AzG21Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] firmware: arm_scmi: fix module auto-loading
Date: Fri, 25 Sep 2026 10:37:26 +0100
Message-ID: <179032900575.1420945.238832920241309403.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 18 Sep 2026 11:29:49 +0200, Hans de Goede wrote:
> Here is v7 of the patch series fixing arm_scmi module autoloading this
> combines:
> 
> 1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
> https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/
> 
> 2. A new patch 2/2 to always create devices for standard protocols,
> replacing Cristian's patch to pre-register the standard protocol device-ids
> from v4.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] module: add SCMI device table alias support
      https://git.kernel.org/sudeep.holla/c/d59717cfbe1e
[2/2] firmware: arm_scmi: Always create devices for standard protocols
      https://git.kernel.org/sudeep.holla/c/aac4e67d6eb9
-- 
Regards,
Sudeep


