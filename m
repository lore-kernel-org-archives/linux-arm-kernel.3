Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76F0F8D758
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 15:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJogIQfNen53UecFcH2yMQFrXxkjQxMA/QO/syWM1Vw=; b=MQSjcH6iB7N3AZinB6d/bw9jZ8
	4sqSQJjennp1PpwQ0AP6xsZVPkufHmDAZbW8THIeKYCYAW+4LBKkuXSJK8IJtYaHl94iLlZfcsE7J
	AZUAMJgTzvdW2Fuh3dNG5cQT2/0vInZoJvVfEzQwXqUAB7kt5Ip/a3xWIEglYuOKd8eB725+0FQRP
	ksIZS6vjzKXM6vNDtNUAKnRYxvTIK+EakWgFVY45DNIgCx6/vD12LltZrrYvfIJiy2JlS+9IDkLSo
	enMlNsAXCiU92see9XuM/y16YZfzjiUcnFezhPVu03pUotSmt6zx5qqpZCz9asScV0jOijkfpSNoE
	kfan+/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDON1-00000002bNu-2h6q;
	Thu, 16 Apr 2026 15:11:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOMz-00000002bNP-3vVH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 15:11:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C109A2574;
	Thu, 16 Apr 2026 08:10:58 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0669A3F7B4;
	Thu, 16 Apr 2026 08:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776352264; bh=krNOmdR6RwpLOzyXWjHfsuZMKqOBvSItCgTMpAtAuKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKWtHQS077IJqK8KCGZjVVyNStj7binMrHh0DKQUcdPkrTVe8hhLTgCyaOnd3cM93
	 yYALX0y9jb2j5WXIdRrKHpkitdDvGpnEsbWGG5PrNj08ZlVeoWxXocwPX/uWzz4SgL
	 hrl4TA/+QArHuk1TQSlPbqdc5i6ePFd3YHshyrqE=
Date: Thu, 16 Apr 2026 16:11:02 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 02/12] coresight: etm4x: fix underflow for nrseqstate
Message-ID: <20260416151102.GL356832@e132581.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415165528.3369607-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_081106_014837_EAC931E0 
X-CRM114-Status: GOOD (  10.91  )
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

On Wed, Apr 15, 2026 at 05:55:18PM +0100, Yeoreum Yun wrote:
> TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
> in which case n ranges from 0 to 2; otherwise, TCRIDR5.NUMSEQSTATE is 0b000.

My suggestion in previous version is not quite right, thanks for
making this correct.

[...]

> @@ -1395,6 +1395,8 @@ static ssize_t seq_idx_store(struct device *dev,
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>  	struct etmv4_config *config = &drvdata->config;
>  
> +	if (!drvdata->nrseqstate)
> +		return -EINVAL;

For "nrseqstate = 0" case, would it return -EOPNOTSUPP instead?

Otherwise, LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

