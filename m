Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC730C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 02:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdSEhSWgKAuiPO1HyQjMS5msQKsGOwK8wbTor0f0Eqc=; b=mofAGThq4G5YPDbg/73Iq3PaI6
	ZrldvPxWphpiqMj/JXdWhoVRllU1xKIJGTbazGSXPBeZ3sM3YHq9iKJzbXxEcl/451Do2lVqfkeIR
	BTQjE9voZdW0zaIf9REyCTfqjEcwqfiqgxRpv6zhneTJaQ0hMGoNjIIG+g7PNiXPEeLWyVQdvNRCe
	/Sw0BvdlDxqn5BTm7g5NTwD7k4EyxuMOLpVVrawZTSkyCrr83/iTMDLVoWurN5sNROZwdhUsz0AHD
	MPHJX71bb7XxikU2pHDrfIwmK8Qji7NhhhcEQehXFgaSB+/kQ+NKeSPNFeFgqpmJMEnZJtISp56ci
	4AcuyfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsA6T-00000006xmV-2hfO;
	Fri, 07 Aug 2026 02:14:33 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsA6P-00000006xkQ-43pb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 02:14:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zdSEhSWgKAuiPO1HyQjMS5msQKsGOwK8wbTor0f0Eqc=;
	b=Cds762bFaP1jrL2D+AT8Hf5c+SAHwDOsnPQRTLq87x7755dQ/l9oTbNZXBUIMU8YsnHC2xGWf
	0apeXmOMABONjdgO3LHqpcYtVuJBbpxKzr/QpYNJRXeBMu4+o28858SxqD7uSg/yRTBRGpfSI6J
	JnlrLyRiwlW7Oh3m5GVM/d0=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hGS9v2ddxz12LGW;
	Fri,  7 Aug 2026 10:03:47 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 803144057A;
	Fri,  7 Aug 2026 10:14:15 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 7 Aug 2026 10:14:14 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <egg12138@foxmail.com>
CC: <xieyuanbin1@huawei.com>, <jpoimboe@kernel.org>, <linusw@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-modules@vger.kernel.org>, <linux@armlinux.org.uk>,
	<petr.pavlu@suse.com>, <pmladek@suse.com>, <rostedt@goodmis.org>
Subject: Re: [PATCH v3] ARM: module.lds: fix unwind metadata for merged .text sections
Date: Fri, 7 Aug 2026 10:13:28 +0800
Message-ID: <20260807021328.36897-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <tencent_EB65B78E967A5FF9DD2A591A86A6BD5B1107@qq.com>
References: <tencent_EB65B78E967A5FF9DD2A591A86A6BD5B1107@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_191430_160010_97511050 
X-CRM114-Status: GOOD (  10.62  )
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

On Thu, 6 Aug 2026 22:29:03 +0800, Xiao Junzhe wrote:
> My reason for including the exact matches is slightly different.
> AAELF32 defines these section namespaces as .ARM.exidx* and
> .ARM.extab*; it does not require all ABI-conforming object producers to
> use the same naming convention as GNU as and LLVM.
>
> For example, another producer or future version of GNU/LLVM impl for `as`
> could validly use:
>
>     .text -> .ARM.exidx.text

I have thought about it again. For other sections, the mapping is
as follows:
	.xxx -> .ARM.exidx.xxx

So, if there is an ".ARM.exidx.text", it must be from ".text", and adding
".ARM.exidx.text" will not cause any other harm. We only need
to ensure that the merging of the ".text*" sections is consistent
with the merging of the ".ARM.exidx*" sections, and the current patch
already satisfies this requirement.

I have no other questions about this, so:
Reviewed-by: Xie Yuanbin <xieyuanbin1@huawei.com>
Tested-by: Xie Yuanbin <xieyuanbin1@huawei.com>

Also, don't forget to submit your patch to Russell's
patch tracker:
Link: https://www.armlinux.org.uk/developer/patches/

Thanks.

