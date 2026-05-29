Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C28CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3Fu747UKulWG+hr3N3DVUPzRU2LHQ+kT0nk39GNd/8=; b=wp+FdRpgpzsICH78+md/5SySRG
	4EvisKyiyP4USNXviJbDCj5D93NAiRHElnxGmCLRlRpcc1h3ag0a9bsh0WyuV8PdTCDpsuHqXJSLO
	HXoFNlcDNfkq/uUZIcrwJEbY1pHz3mSvyCLAjf/Nminn+w+7n9XNYmcWnouWqTUn+PyPEiR1iVsig
	o7DAIOwVvxV50T+MLs6rlnz6AZwjWjKtTrtsO7wMqrcKdqRlK2S6y4PGzbWzASspxVZ/mW1AHWljB
	wd/j/9yIPGodcuxT0Jjn8lVUt0CAyuSfnOZ5s/HuUWIYOMBK5PIyEjErZUFGOmHMnLzeUUgLnh5Ab
	3jyiLWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzBv-00000007hyu-1H5a;
	Fri, 29 May 2026 15:32:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzBt-00000007hxx-27Pz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:32:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7DA233EA;
	Fri, 29 May 2026 08:31:57 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 438BA3F632;
	Fri, 29 May 2026 08:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780068722; bh=aaqSGHmOFP9GDydN0V8EWfYzZpiFRb3G1MWrfDttjnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PnU6SFhFsjLY+yQklLoE94ixjHzfniX4RqzaSHh+5npaDzp24Ijjo7Fb8U+ixEm2V
	 qSOw8lTBRVqQJfnDp22g0DqrLk1vP0xLac+LzXj+c6e7BEuP9/fC/JwGqyFWLS7WKo
	 e0xnjijWYfwE/20g0NEqNRUSs81iWIjKciaO3fps=
Date: Fri, 29 May 2026 16:32:00 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
	tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
Message-ID: <20260529153200.GL101133@e132581.arm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-4-d21f4f92c51e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-extended_cti-v9-4-d21f4f92c51e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_083205_579593_FA3B3289 
X-CRM114-Status: UNSURE (   8.22  )
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

On Thu, May 21, 2026 at 08:16:30PM +0800, Yingchao Deng wrote:

[...]

> @@ -515,18 +543,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
>  	&dev_attr_appclear.attr,
>  	&dev_attr_apppulse.attr,
>  	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
> +	coresight_cti_reg_index(triginstatus1, CTITRIGINSTATUS, 1),
> +	coresight_cti_reg_index(triginstatus2, CTITRIGINSTATUS, 2),
> +	coresight_cti_reg_index(triginstatus3, CTITRIGINSTATUS, 3),

For this patch:

Reviewed-by: Leo Yan <leo.yan@arm.com>

AI tool reminds to update
Documentation/ABI/testing/sysfs-bus-coresight-devices-cti, you might
need to add description with a new patch:

  What:           /sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus[1-3]
  Date:           May 2026
  KernelVersion:  7.2
  Contact:        coresight@lists.linaro.org
  Description:    (Read) read current status of QCOM extended output trigger signals.

And please add document for other new sysfs knobs.

Thanks,
Leo

