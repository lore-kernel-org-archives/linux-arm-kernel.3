Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB62EF4BB9C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVM1smqGpJYjPWjJ2cunjwqMxgn1/AMFTYGvebK4Q6o=; b=kV4U47SewsdSn6NqEPogx/6yci
	Y64oV4sRAKvT4S6+gzQHIJCYzRORx+318VTRxPITVlyWnsRUt/U70XRNT7abLycO5+psLOjSo0zJB
	s/e1diipZqGbOz6sYjdFuXFhSVRD4H8bbGk/bw9z21Lp3oEwScOMnMouztuY6MuhuEGL7mVRLYW+Z
	9BCpyBdNrbdckux6ySBHu//gY2BQH2VyB4bl42aFlJ8BsMXQPUctPu5OKFqWsuLupykjOLwdqy7s3
	k19QSOB5hn3bQS6R/pAVbS2hRzps/dkcpjOqhHJQfHAzfUWIl7CFJzh39tmKLYcrXVONjZXqVuPLk
	NOYEIxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCU6-00000003qD4-0A1Z;
	Wed, 25 Feb 2026 10:51:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCU4-00000003qCM-0k2w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:51:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C20E165C;
	Wed, 25 Feb 2026 02:51:02 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 917403F59E;
	Wed, 25 Feb 2026 02:51:07 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: cti: Move resource release to cti_remove()
Date: Wed, 25 Feb 2026 10:50:56 +0000
Message-ID: <177201660074.1317269.102022187431546004.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224-arm_coresight_refactor_cti_resource_release-v1-1-ff1b2bca9176@arm.com>
References: <20260224-arm_coresight_refactor_cti_resource_release-v1-1-ff1b2bca9176@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_025112_255925_E0F41943 
X-CRM114-Status: UNSURE (   6.28  )
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


On Tue, 24 Feb 2026 10:56:14 +0000, Leo Yan wrote:
> Currently, CTI driver releases resource by deferring
> cti_device_release() to the device unregistration:
> 
>   cti_remove()
>    `> coresight_unregister()
>        `> cti_remove_assoc_from_csdev()
>        `> device_unregister()
>            `> cti_device_release()
>                `> mutex_lock(&ect_mutex)
>                `> release CTI resource
>                `> mutex_unlock(&ect_mutex)
> 
> [...]

Applied, thanks!

[1/1] coresight: cti: Move resource release to cti_remove()
      https://git.kernel.org/coresight/c/55bf8be6f4a8

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

