Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5678DC9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfnIzNSfkHDE44pyh3cGL1QPG+efZ7Gv5MuAyZB8E5M=; b=gKn+wGKPVvhB9Mm/nq4ih2wt0A
	kWgaqzp6DtBNebgmjXowMz4E1JA7c1nD2TjRoCISIDqtc0vX0ry+DhyxHyTl29ysh1jLNGlTDzCf7
	0weuex+1YkCrUXh4aYV0B4tGKleKMUpllsOzx/WBJCJwEsgzg1xG2YcqiugTcUEOC0vgiGxX/2O0w
	UT6AHqcej0UyZycVgTqIgaa8xIkDal90w7y2Fy4ic5UVZoEGunvKnv6hdv4vUqCOW70tvAgbBbSlQ
	JwySD7j7h0bOKPtmpGCjM+t9kJu9fpaGFqoEwO3lDmBLSebwdH25EznWtQb9Cr8M3QLgSnB38Cbqw
	jw9OxUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJKZ-00000005a4n-0mNN;
	Mon, 12 Jan 2026 14:55:43 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJKV-00000005a36-42SE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:55:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wfnIzNSfkHDE44pyh3cGL1QPG+efZ7Gv5MuAyZB8E5M=;
	b=ImExJt/s6LNoNcA/vrSpxVVyUzmxGT3dJH5TmRqHgbYOrTZB7cPTesjGCDlW0IBmvoESs1EN7
	X21VS1YdH3O/wahIa0SPY3Q9sExaE/tBZ+PiHUjw7ayc+nMMnwDq0l2fzFfD90KuuWad6fUAkcR
	idV2Q8kAkJwL9gv3B7kuQrw=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dqb322LRnz1P7Js;
	Mon, 12 Jan 2026 22:53:02 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqb5V2HJgzHnGh7;
	Mon, 12 Jan 2026 22:55:10 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B67640585;
	Mon, 12 Jan 2026 22:55:26 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 14:55:25 +0000
Date: Mon, 12 Jan 2026 14:55:24 +0000
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
Subject: Re: [PATCH v3 12/36] KVM: arm64: gic-v5: Support GICv5 FGTs & FGUs
Message-ID: <20260112145524.0000164c@huawei.com>
In-Reply-To: <20260109170400.1585048-13-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-13-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_065540_277133_938C7F9A 
X-CRM114-Status: UNSURE (   8.69  )
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

On Fri, 9 Jan 2026 17:04:42 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Extend the existing FGT/FGU infrastructure to include the GICv5 trap
> registers (ICH_HFGRTR_EL2, ICH_HFGWTR_EL2, ICH_HFGITR_EL2). This
> involves mapping the trap registers and their bits to the
> corresponding feature that introduces them (FEAT_GCIE for all, in this
> case), and mapping each trap bit to the system register/instruction
> controlled by it.
> 
> As of this change, none of the GICv5 instructions or register accesses
> are being trapped.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>



