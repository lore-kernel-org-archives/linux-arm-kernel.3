Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BE8108E1E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/yWvs+u+2ox5r2RC2KJBHK3Mv2sQaP76wNy2i2+g+k=; b=io1XNXMRaulDUP7Y6QJ5sSOvrV
	d9QrJrdij8kS5jePNntAhmek0TSj5iWiFB0LvGd/Xz3FbNK2eaFNPXQoHDTnu7VI3Lae4bN2Me3Fz
	EfDtT7+sam5giny27xqp1ZMLb4D8eA+Ckl9dfIs5MOQONaAJsrOOAyamfy+awMf7ZBtww49Qy0uah
	9eo3qwnuL9qdF/MFRsR6LkO7D5/weA+ygFGVRWTMXBAXtLZ8bGLUOG5GiFgYZsTyyUl3/bhtp3sGa
	GLPuVoUQq+aCIwEntryshZB1FZT8noY+ynbsD2yXkzaEWVAGR9tX9rvqqj+Ogs513vQoThVuDkNyf
	2qFwwpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Alz-0000000AQgE-3K2F;
	Thu, 19 Mar 2026 10:38:39 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Alx-0000000AQfi-08E0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:38:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=G/yWvs+u+2ox5r2RC2KJBHK3Mv2sQaP76wNy2i2+g+k=;
	b=uY8Tu/+QmqJx89Fu6/4iVzerjZ3SA/lL2P6iA/PuYikQcxBBeLzHAIqhAMhEjNnlm1Pb8XU6F
	/cPLkPqSi8oMF3fwYxG/tvlc/e8EhrbsTGH6L87Wk9k8LlYEHhZsrtSJYOcefmMYK1o4GmKCt+J
	xc1w3GFBFN+p1lXGaE6uncE=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fc2Bd5VDGz1P7Fp;
	Thu, 19 Mar 2026 18:34:49 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fc2GN5cxDzHnH8Z;
	Thu, 19 Mar 2026 18:38:04 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 1CD524056A;
	Thu, 19 Mar 2026 18:38:28 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 19 Mar
 2026 10:38:27 +0000
Date: Thu, 19 Mar 2026 10:38:26 +0000
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
Subject: Re: [PATCH v6 14/39] KVM: arm64: gic-v5: Trap and emulate
 ICC_IDR0_EL1 accesses
Message-ID: <20260319103826.00004be1@huawei.com>
In-Reply-To: <20260317113949.2548118-15-sascha.bischoff@arm.com>
References: <20260317113949.2548118-1-sascha.bischoff@arm.com>
	<20260317113949.2548118-15-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_033837_252937_8F97AD3B 
X-CRM114-Status: UNSURE (   9.76  )
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

On Tue, 17 Mar 2026 11:43:34 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Unless accesses to the ICC_IDR0_EL1 are trapped by KVM, the guest
> reads the same state as the host. This isn't desirable as it limits
> the migratability of VMs and means that KVM can't hide hardware
> features such as FEAT_GCIE_LEGACY.
> 
> Trap and emulate accesses to the register, and present KVM's chosen ID
> bits and Priority bits (which is 5, as GICv5 only supports 5 bits of
> priority in the CPU interface). FEAT_GCIE_LEGACY is never presented to
> the guest as it is only relevant for nested guests doing mixed GICv5
> and GICv3 support.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Does what I'd expect.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>



