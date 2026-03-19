Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88196108E1DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axgpoJnH4P9jW2A5jNPwFRoUlFKKAaMI7EAxoj4Hxfo=; b=2P9lm6/oRpOy+jkBNZtFF8Hd2a
	ErXbzYxn+r75VR3QtYGG9n0FThF3sWYZKfiBI8ogjMdpKEg7l7F4PGo565MaNpa+xCS5Juap2KSKc
	bf1j69wjeu/VxKukpo57oWbMMys5tlQriaXOaD0EfqI+CtTmBrrgWxHrfUXkViXcRDIVB0AWyCx8x
	5P/7pIR+GecONYLCSwQlpQOqTsARaY/ZmR8K7nM1TVR/2sR9N8wnD5JdiX+BrlyPI0HTdQmiQSVR8
	kzzjJ0v4vj+Er+80OXRNH/POCvzUV4f4S4DmMSIE2eifS6O0Xo1SgfD6rTwf2WyGEHbeNsUxLh4UW
	gmAQ2S8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Aic-0000000AQNz-3zTL;
	Thu, 19 Mar 2026 10:35:10 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Aia-0000000AQNd-3r8w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:35:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=axgpoJnH4P9jW2A5jNPwFRoUlFKKAaMI7EAxoj4Hxfo=;
	b=B7I6P9lU+z9Vuau/3wNH1n10uSV13hn3/Su7+IaG2YQ4yEF1OM1RB2qnrefU4r3TY/SaGBI64
	jq4P2yESuTHqXb97F9jBGiaGpLRrqymysITs/qZkOsxoNbitVjosGuDfu+F6foI1wa/4Y4YJifv
	08Jd0wAYiMQNwqyr/0BHCCc=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fc26c3XmDz1P7nb;
	Thu, 19 Mar 2026 18:31:20 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fc29g4fB5zJ46Dk;
	Thu, 19 Mar 2026 18:33:59 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id D803740584;
	Thu, 19 Mar 2026 18:34:58 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 19 Mar
 2026 10:34:58 +0000
Date: Thu, 19 Mar 2026 10:34:57 +0000
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
Subject: Re: [PATCH v6 13/39] KVM: arm64: gic-v5: Add emulation for
 ICC_IAFFIDR_EL1 accesses
Message-ID: <20260319103457.000047ee@huawei.com>
In-Reply-To: <20260317113949.2548118-14-sascha.bischoff@arm.com>
References: <20260317113949.2548118-1-sascha.bischoff@arm.com>
	<20260317113949.2548118-14-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_033509_142198_0D0EFFD3 
X-CRM114-Status: UNSURE (   9.55  )
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

On Tue, 17 Mar 2026 11:43:18 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> GICv5 doesn't provide an ICV_IAFFIDR_EL1 or ICH_IAFFIDR_EL2 for
> providing the IAFFID to the guest. A guest access to the
> ICC_IAFFIDR_EL1 must therefore be trapped and emulated to avoid the
> guest accessing the host's ICC_IAFFIDR_EL1.
> 
> The virtual IAFFID is provided to the guest when it reads
> ICC_IAFFIDR_EL1 (which always traps back to the hypervisor). Writes are
> rightly ignored. KVM treats the GICv5 VPEID, the virtual IAFFID, and
> the vcpu_id as the same, and so the vcpu_id is returned.
> 
> The trapping for the ICC_IAFFIDR_EL1 is always enabled when in a guest
> context.
> 
> Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


