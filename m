Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C179FCEE86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 11:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/y8rn2t5WNOAxWt3NxmseNN7N4dwMlU/yXSTLRVcbwY=; b=l9K4lviKeEHP67zJWMvA8fbkMU
	ltlR2tl4YX4B9DELOoo8KVgzo+o6lnm8E2lKqty3e/9EqGBpPPqJXBmOtR+DvO3JkO81H2toLIHrW
	LU5UFA3ROsO4mAWVwB7GKbJyw4JdgUENlCGOdtVfHwYtNLFXHNtCY4wsdCn++ZMtlr10jsGmApFji
	s+sO958zP0Y3TEd0jhofR/WEfMLsrCu3EWlVkRq7fN+7oheyJFLkeQv1iiOrlKqCmhAfKwFwLDaeb
	o6BVwfM633BMVfQ0Rz/489975jfzWn8dJHk5rXc7JGkJTDPbSzBHx9sko70oaZGMOePasQthVWtZX
	Gi2uExxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvD0V-00000003uI2-1lXx;
	Wed, 25 Feb 2026 11:24:43 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvD0S-00000003uG8-1pO5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 11:24:42 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fLXKN0gPSzHnGkN;
	Wed, 25 Feb 2026 19:23:52 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id DE33140086;
	Wed, 25 Feb 2026 19:24:33 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 25 Feb
 2026 11:24:33 +0000
Date: Wed, 25 Feb 2026 11:24:31 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Marc Zyngier <maz@kernel.org>
CC: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Joey
 Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Oliver Upton" <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Deduplicate ASID retrieval code
Message-ID: <20260225112431.000051f1@huawei.com>
In-Reply-To: <20260225104718.14209-1-maz@kernel.org>
References: <20260225104718.14209-1-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_032440_766479_27246361 
X-CRM114-Status: UNSURE (   8.64  )
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

On Wed, 25 Feb 2026 10:47:18 +0000
Marc Zyngier <maz@kernel.org> wrote:

> We currently have three versions of the ASID retrieval code, one
> in the S1 walker, and two in the VNCR handling (although the last
> two are limited to the EL2&0 transltion regime).
> 
> Make this code common, and take this opportunity to also simplify
> the code a bit while switching over to the TTBRx_EL1_ASID macro.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Does what it says on the tin.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

