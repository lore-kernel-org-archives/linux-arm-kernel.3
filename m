Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767CBC9EC7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9VektO+CAqvLnE0XPzoW3dtG8/MTTC0nCaZjXHsMNQ=; b=Eng9WkiWyhGWFQBIVd1ASC03ks
	O0G36tvibHG9+Mct8s5Qci7yhfSxTuCBYrdrBwNn3t9g/dRmxV+PVgH8EeTmiFGMHBNkdW/eAOzjz
	v6RtjDEgyvGVZ6wF7X9hysiaTJA/IB21quMJ5r6k4xuTBj73heJp2a5D/abO/VCLr7AjA3lVZmdfP
	frmlcU9PQCZay1lLXaPElFl2Yr0zOelVc+N4xZyzCW9pUnSaiwx8h7t7aQxsqx6Dm6W0TgGpdyV56
	27Jsewzhhe00+ekGQ4FPye+d+jxQlFHDtQW2IztlAOt65fy9hILCEY+uSjBNfEiKQkGnPTmmDD1/j
	fXr/TIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKmd-00000005j33-1BGs;
	Mon, 12 Jan 2026 16:28:47 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKma-00000005j0b-0E2w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 16:28:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=A9VektO+CAqvLnE0XPzoW3dtG8/MTTC0nCaZjXHsMNQ=;
	b=AeMRjfEsuuc2juhgk3xNdgTRVEM3ZYCBydzsqcnLjRTmLEhgy3FXeVtFQKl44yTTUynr6j74L
	V8HzsNjW77KU1TjGg/cE6SNqdz5B6vG6VqXqwP02Y0VXHwtlNI3hXJ9SokSTFS4+7tyWH8ilFOH
	pJw6RIT/JOkW3O9O1x0WzHo=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dqd6k0GDmzMpPg;
	Tue, 13 Jan 2026 00:26:21 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqd926PttzJ46DD;
	Tue, 13 Jan 2026 00:28:22 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 8501640569;
	Tue, 13 Jan 2026 00:28:34 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 16:28:33 +0000
Date: Mon, 12 Jan 2026 16:28:32 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v3 27/36] KVM: arm64: gic-v5: Mandate architected PPI
 for PMU emulation on GICv5
Message-ID: <20260112162832.00005a62@huawei.com>
In-Reply-To: <20260109170400.1585048-28-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-28-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_082844_368866_47017B54 
X-CRM114-Status: UNSURE (   8.02  )
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

On Fri, 9 Jan 2026 17:04:47 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Make it mandatory to use the architected PPI when running a GICv5
> guest. Attempts to set anything other than the architected PPI (23)
> are rejected.
> 
> Additionally, KVM_ARM_VCPU_PMU_V3_INIT is relaxed to no longer require
> KVM_ARM_VCPU_PMU_V3_IRQ to be called for GICv5-based guests. In this
> case, the architectued PPI is automatically used.
> 
> Documentation is bumped accordingly.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

