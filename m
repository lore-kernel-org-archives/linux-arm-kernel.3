Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3EDCCF2E8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALn6nqHB63SSWSHKZAXGOlCrqywJbJzV6rer2n5pJl0=; b=2Buxahtbvs1WCYg7W4nsB1t9F4
	dCmgIAC1rYOKURELmDvUf+XqksJAJkNFhQVKyvze1zS0ZNUSAXcliWLI0cipj4EISchNElFGerfHc
	Bjic00Nr8n9bW5XQDiNuy14kp2+om4sM77VMJe4YfkM2IVtnoMzRvqwCaYEwgs9E2r2cXS6V5nHQy
	v/lIMN8EDr/vdTR1pNB431TeUasTIcYq6kBP9Nb1SRyOUqaHOwt2LsCXOQgeCJDyTOPW1qd4WYsWg
	5DNLDnNoXpILhOcJVAk99H+fw0QakHAuJAEemL2miAn4E9MeHs7ftdKKoYEjbOSDWLQKo/WlErPkh
	IkfYXsLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnKc-00000001sap-1BLw;
	Mon, 19 Jan 2026 11:22:02 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnKZ-00000001sa6-1PQL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:22:00 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dvp1g3JhPzHnHKG;
	Mon, 19 Jan 2026 19:21:27 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 2326A40569;
	Mon, 19 Jan 2026 19:21:57 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Jan
 2026 11:21:56 +0000
Date: Mon, 19 Jan 2026 11:21:54 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<sudeep.holla@arm.com>, <james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <etienne.carriere@st.com>,
	<peng.fan@oss.nxp.com>, <michal.simek@amd.com>, <dan.carpenter@linaro.org>,
	<d-gole@ti.com>, <elif.topuz@arm.com>, <lukasz.luba@arm.com>,
	<philip.radford@arm.com>, <souvik.chakravarty@arm.com>
Subject: Re: [PATCH v2 02/17] firmware: arm_scmi: Reduce the scope of
 protocols mutex
Message-ID: <20260119112154.0000029d@huawei.com>
In-Reply-To: <20260114114638.2290765-3-cristian.marussi@arm.com>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
	<20260114114638.2290765-3-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_032159_610350_B0916A8A 
X-CRM114-Status: UNSURE (   9.22  )
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

On Wed, 14 Jan 2026 11:46:06 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Currently the mutex dedicated to the protection of the list of registered
> protocols is held during all the protocol initialization phase.
> 
> Such a wide locking region is not needed and causes problem when trying to
> initialize notifications from within a protocol initialization routine.
> 
> Reduce the scope of the protocol mutex.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
I haven't checked carefully that the new scope is appropriate but
as a change in of itself, the code is correct and clean.
With that in mind.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>




