Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18CAC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLsBgp6/np47MXvoT7Gy3Dsz1JT/6o4ck60MxFMEbMs=; b=rx3mB+ykW7Q1FBsxEc1MOYf85k
	7n0efo8t8h8R8vxSbl3rDuRZLVGJ2D1nq9f9uEQpX3u2hSaxOBeGoI8FqfQZdh5kHS3Jg4gMycAHv
	AJ6vj2V2jGXGbJ5O+vEYgmmmtXrhWpAH61kR/yWPR5BRztl0SKdpGKKq63h3lKpQx57rHRHJ72nd+
	Mgy4/C9jtWvyM9EoLvWUXB48sn9zW6UCBLjkApMS5iZ5tbl3JDDuiGxDcEp8nviRSnQUImZFs9AJJ
	3psSnnvtaYT6pLPzkWndtXBtSpTh5sHXkLwIGCaDa0/MrFQJt8K3nm+gh9UCU2UboYwcUZj3ZjCbC
	NtaRclPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lJa-00000008le9-2xV2;
	Wed, 16 Sep 2026 08:48:26 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lJX-00000008ldT-3VLr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:48:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gLsBgp6/np47MXvoT7Gy3Dsz1JT/6o4ck60MxFMEbMs=;
	b=pwFpmz5vgTArTKuy9hoBMaxXTwMiImRuPfz1SMKaEY4dU87GFBeCYZzKgiyt7j3nWyPocpbir
	dGC4zhwfvAOZ8QlKI51gBGvKxSAC5Z4WcbRSxg+ABFESZINwusMyW9RiN1NR7O2pIqCAUmdsEhQ
	CSnC4mKrHAUWQRrBnVCTpNc=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hlC1B1LZ8zcb3J;
	Wed, 16 Sep 2026 16:37:02 +0800 (CST)
Received: from kwepemk300012.china.huawei.com (unknown [7.202.194.175])
	by mail.maildlp.com (Postfix) with ESMTPS id 87A952017D;
	Wed, 16 Sep 2026 16:48:13 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemk300012.china.huawei.com (7.202.194.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 16 Sep 2026 16:48:12 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <sashal@kernel.org>, <gregkh@linuxfoundation.org>,
	<linux@armlinux.org.uk>, <bigeasy@linutronix.de>, <clrkwllms@kernel.org>,
	<rostedt@goodmis.org>, <rmk+kernel@armlinux.org.uk>, <linusw@kernel.org>,
	<kuninori.morimoto.gx@renesas.com>, <arnd@arndb.de>, <xiqi2@huawei.com>,
	<ljs@kernel.org>, <wozizhi@huaweicloud.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-rt-devel@lists.linux.dev>, <stable@vger.kernel.org>,
	<patches@lists.linux.dev>, <lisongze2@huawei.com>, <wangbing6@huawei.com>,
	Xie Yuanbin <xieyuanbin1@huawei.com>
Subject: [PATCH 5.10.y/5.15.y 0/4] ARM: fix might_sleep() WARNING for mmap_write_lock() around show_pte()
Date: Wed, 16 Sep 2026 16:48:07 +0800
Message-ID: <20260916084807.176359-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916080011.170295-1-xieyuanbin1@huawei.com>
References: <20260916080011.170295-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk300012.china.huawei.com (7.202.194.175)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_014824_368503_2F8F702D 
X-CRM114-Status: UNSURE (   8.24  )
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

On linux-5.10.y and linux-5.15.y, commit 07e4d5380f2a844ab7a1 ("ARM:
9485/1: mm: acquire mmap write lock around show_pte() for user faults")
introduces a might_sleep() WARNING when using mmap write lock. This is
due to the lack of upstream commit 59e4f3b45b96a24fc9b7 ("ARM: ensure
interrupts are enabled in __do_user_fault()") and
commit e79ca91165d4fd18549c ("ARM: 9484/1: enable interrupts when
unhandled user faults are triggered") .

This series backports all these upstream patches into the linux-5.10.y:
1. commit 7733bc7d299d682f2723 ("ARM: fix hash_name() fault")
2. commit fd2dee1c6e2256f726ba ("ARM: fix branch predictor hardening")
3. commit 59e4f3b45b96a24fc9b7 ("ARM: ensure interrupts are enabled in
   __do_user_fault()")
4. commit e79ca91165d4fd18549c ("ARM: 9484/1: enable interrupts when
   unhandled user faults are triggered")

In the upstream version, the following patches are a patch set:
a. commit dea20281ac8822661576 ("ARM: group is_permission_fault() with
   is_translation_fault()")
b. commit 40b466db1dffb41f0529 ("ARM: allow __do_kernel_fault() to report
   execution of memory faults")
c. commit 7733bc7d299d682f2723 ("ARM: fix hash_name() fault"):
   which is 1.
d. commit fd2dee1c6e2256f726ba ("ARM: fix branch predictor hardening"):
   which is 2.
The fixed issues by this patch set also exist in linux-5.10 && linux-5.15.
a. and b. do not need to be backported, and after c. and d.
is backported, 3. and 4. can be safely patched.

