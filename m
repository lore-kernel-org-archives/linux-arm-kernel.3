Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A63F8D753
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NmFeIiWorrQVh4C2t3kxD/1KkNnrhvPXyiKsCO6r8U=; b=ZK9AyG/7yqmEhq5kHSoCLB+FI3
	Ydmr+aeHTMeMUasMvgvQAjoCeD931nbt5qZoDNSOAPYtjnbck/jehZ77gIurTJeYVCi8McoIRQGKg
	/PaqSM7mNbZaldw2DjCnOQybm9HfOAScv7uXTMJPtM2Xsn2g2rNeb71V6FcymRmKK20qYb/Enm7CM
	bVqmQc8Nh9Av+lNG6/EKJEHo+78Shm0IwaFhcRrmT0YGqpDl0JC5d/KNWGVS8UvPTz/ZMqHsg7tH1
	Guv9D1dSk2LuHDaRXQTwPRhgJvOlz80AmF5lHShURaW+BRzJh8AJYxHvKBgFX0G/HFrA7zIXkbq4Q
	Ssh4awvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOF6-00000002aoP-0QTW;
	Thu, 16 Apr 2026 15:02:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOF3-00000002ao3-0qga
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 15:02:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D7E72574;
	Thu, 16 Apr 2026 08:02:44 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43FE23F7D8;
	Thu, 16 Apr 2026 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776351769; bh=K4zCV4fsKTvohS3Ddt0QX5xidGQGe6CWXVrEjoP/Xqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbIDTcZFjAGoKuYH6bJ7yoys6cwr9l4qvLKwwjGw3oy95snCfMMzIrf0ooX+WM8Qp
	 N+Pe4MieOMCymUeXRRl6ynX+SqsHHdMSMtZLKwED4masEKKaIzXxJeoTN7LUgnGM2c
	 Zf9OIRIrSVLTmGEo0rbv8v58QkDmRH06B2NVwljs=
Date: Thu, 16 Apr 2026 16:02:47 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 01/12] coresight: etm4x: fix wrong check of
 etm4x_sspcicrn_present()
Message-ID: <20260416150247.GK356832@e132581.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415165528.3369607-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_080253_391282_C8BA7FDD 
X-CRM114-Status: GOOD (  10.17  )
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

On Wed, Apr 15, 2026 at 05:55:17PM +0100, Yeoreum Yun wrote:
> According to Embedded Trace Macrocell Architecture Specification
> ETMv4.0 to ETM4.6 [0], TRCSSPCICR<n> is present only if all of
> the following are true:
> 
>   - TRCIDR4.NUMSSCC > n.
>   - TRCIDR4.NUMPC > 0b0000.
>   - TRCSSCSR<n>.PC == 0b1.
> 
> Comment for etm4x_sspcicrn_present() is align with the specification.
> However, the check should use drvdata->nr_pe_cmp to check TRCIDR4.NUMPC
> not nr_pe.
> 
> Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

