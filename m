Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CFCE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRGd4A+xEDovZTywpg2VucUfFlLHVfeOyF8Z09G1ybE=; b=kiEb0PTjTnZD9qIxsgx83i7gYF
	fNdDfSnk+aemJGAke8Q1U4R12J2BA+k50gMYwYGBJ771FVP4AYmnd9sCoOV7duzoRgRkTI2DoxCrb
	VEepy13VRUX8Uvw+Dw1yMlf/kxT0uQdSnEsw6m7wTDJbOLg2KDPfG8NCtGX9qhPPjWrL6y2OZJyH9
	5x7FsddcRecMBsnXYc6obls2y3xCPYcOCUOAMgt+uNlJTTYJYWWlXmptT27dp6nOPfcvwiG75x5Ep
	JrVE26gmnsu2x081Aspq4Pd1mfWv2IdAJ3Ppa6OD8F2NMNXblJD0da4+/Q+9fc86XFHZCEaJjd5xy
	Ga3fp9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJxX-0000000EZx2-25i9;
	Wed, 11 Dec 2024 10:28:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJrk-0000000EZ4w-1vI4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:22:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBA661063;
	Wed, 11 Dec 2024 02:23:15 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B60C3F720;
	Wed, 11 Dec 2024 02:22:46 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	alexander.shishkin@linux.intel.com,
	mike.leach@linaro.org,
	Pei Xiao <xiaopei01@kylinos.cn>,
	james.clark@linaro.org,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] coresight: Fix dsb_mode_store() unsigned val is never less than zero
Date: Wed, 11 Dec 2024 10:22:41 +0000
Message-Id: <173391254211.561817.4532591708453721807.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <122503017ada249fbf12be3fa4ee6ccb8f8c78cc.1732156624.git.xiaopei01@kylinos.cn>
References: <202410150702.UaZ7kvet-lkp@intel.com> <122503017ada249fbf12be3fa4ee6ccb8f8c78cc.1732156624.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_022248_540700_023C531C 
X-CRM114-Status: UNSURE (   4.38  )
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

On Thu, 21 Nov 2024 10:40:03 +0800, Pei Xiao wrote:
> dsb_mode_store() warn: unsigned 'val' is never less than zero.
> 
> 

Applied, thanks!

[1/1] coresight: Fix dsb_mode_store() unsigned val is never less than zero
      https://git.kernel.org/coresight/c/d4276259f3a57131291d879b53fc05863c6b59fa

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

