Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA3BC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVBzTOpJvQdc3kvEZNdrQSwpBB+rsEs/rfNxos6CNk4=; b=Di5c7ghXJiurOIpiG4wPIC2VXl
	azRPrveHaqBkrpmuaJSbBgAoAYjxMo57uvGYim0IetsSdKeoub84+imw8M9e6hFgl7Ya9E3q+2FfP
	kPpdLimAny5y+E6Rk1eW9sk+i55N/NCV9BTXM5fI3Gi/IQy5s8nw335/zPooNoy7asswgSSiaHw/D
	hFYvO1BZmgBpJggNFYyf5kDFjYc5K1ClH9E/A8om3c/p6/YHTH2JjON1HmvBF7yx665mBInSBCnTz
	4nojx9p4mGytqoMqFSUbWYWklVCuVwbPMRl+9fJ52cL+lOJp0e+kAqvB15LcRnjJfGYBoBG5MlbpS
	9P7sgi4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrusn-00000005U8l-10qS;
	Thu, 06 Aug 2026 09:59:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrusm-00000005U8Z-1T31
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Aug 2026 09:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZVBzTOpJvQdc3kvEZNdrQSwpBB+rsEs/rfNxos6CNk4=; b=qAFGnGN6Sea8pqmOxQWSOaaKW+
	1EgKTz52aHVOk4nPG0JxbrLAOKchyIqiOTbcsQaVXLvemDK3HElT6mZ8oPcoiuw6yaIAjoKUDXzec
	MvNDBepGTiaCyBJ4pZiqCiMA5XOpOlsKBIq9bSYjKcfvppEHDH/StqLYbsWy+8WzlrhIAJsG0fIAT
	w4oqsf4Xj+L9HYBRNil2VxNM5QOICOO848135b8Y5Ek1e063UqWWX1gAragmqiCUZWDKT2Uo+irzo
	ZJP2gNZVGeO2rLk8LLyVUoOwXm3nPCcoVp+96d5nbtTI3x1GPKxp4cDF6QeNOf5btPWh4Mkck2W7F
	v7eT7gKg==;
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrusj-0000000BOhW-0VPQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:59:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZVBzTOpJvQdc3kvEZNdrQSwpBB+rsEs/rfNxos6CNk4=;
	b=Hb2USHrYKLxu9v7vqQ111lRpMDKhmY0OX4xfFppo+knkferqSllL2Bz6jRO6u2PN1ypgVauy7
	pwegRKCzQ6IemGTWa0Ul0Ahvu9KpKOhMK6zQc+wnjnF6tvVmxA3SJm+H20h8HU7CaSBTonKXTlI
	UgFU4xjlXfk1dUJMlvB6uyA=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hG2YW4h2vz1prNF;
	Thu,  6 Aug 2026 17:49:19 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 7EAF44056E;
	Thu,  6 Aug 2026 17:58:53 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 6 Aug 2026 17:58:52 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <petr.pavlu@suse.com>
CC: <atomlin@atomlin.com>, <da.gomez@kernel.org>, <egg12138@foxmail.com>,
	<jpoimboe@kernel.org>, <liaohua4@huawei.com>, <lilinjie8@huawei.com>,
	<linusw@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-modules@vger.kernel.org>,
	<linux@armlinux.org.uk>, <mcgrof@kernel.org>, <rostedt@goodmis.org>,
	<samitolvanen@google.com>, <xiaojunzhe1@h-partners.com>,
	<xieyuanbin1@huawei.com>
Subject: Re: [PATCH] ARM: unwind: modules: Fix the mismatch between .ARM.exidx* and .text
Date: Thu, 6 Aug 2026 17:58:07 +0800
Message-ID: <20260806095807.24475-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <449549e3-8670-4c9e-a348-0ad3c6a521b2@suse.com>
References: <449549e3-8670-4c9e-a348-0ad3c6a521b2@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_105921_520133_C9EECC13 
X-CRM114-Status: UNSURE (   6.45  )
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

On Thu, 6 Aug 2026 11:40:23 +0200, Petr Pavlu wrote:
> A fix for this issue was posted previously:
> 
> https://lore.kernel.org/linux-modules/tencent_08845B64E5F38EB7FA1779982A071AB4A607@qq.com/

Oh, sorry, I didn't know about this. Let's discuss it on
previously posted patch. :)

