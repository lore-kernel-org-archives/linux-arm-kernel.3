Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE38C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KI0HE3TjLwg5vX+3xRIAMwwVeJIWI4hexpP4whJ0JMM=; b=O20jL/yMBhxSsGGsFoC4ECUvoQ
	uhIy0xjHtXwboccyW0PYQB/+m/6H0YIeOvdquKukqMDUugGeNKS6jOoPpjZMy1/GZIIhq+7b24u4k
	rsX+L4+mpqx6JqXsJFSwkkso1YY8V37Lt6Z6+749c/Z0gfRl9P4hPZwGgEUkpDgFhcxFs5VvLyZlS
	5KAZaBAUZWOSKiYc83U1Ksn87vb8mMh3uyjfVPWJyOfXECUKxn7Wsv27YtfF18KAR2Erru1DUduqF
	JGeS40Mi7EPX3AnjiDwy4hZYhO7IP/R5bTLTHsDhIIz0uKvIWxDqppw0gkfR3Xnxm4Zgc0HqcPOY9
	gmS4WH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxk9-00000005qIB-2m8f;
	Thu, 06 Aug 2026 13:02:41 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxk6-00000005qHY-0ffB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:02:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KI0HE3TjLwg5vX+3xRIAMwwVeJIWI4hexpP4whJ0JMM=;
	b=yk/apbZSUOi1fZInYN9LOQZhYyOoCuBIeXwbaM+kdzh+0BMgOMnsTO47jtesBkaxO/AuASNHy
	x5L1lxOqKaka4dkEH3DnilAbaU5h+PsLugKUd++q9+lJQMaVYrfMg/75cFcJC9fw7RnAqqUc/Cz
	QZiI6g3Ar4xDT3w7GqltNIo=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hG6d42jZjz1T4Fq;
	Thu,  6 Aug 2026 20:52:40 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 720A84057D;
	Thu,  6 Aug 2026 21:02:22 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 6 Aug 2026 21:02:21 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <egg12138@foxmail.com>, <pmladek@suse.com>, <linusw@kernel.org>,
	<jpoimboe@kernel.org>, <rostedt@goodmis.org>, <petr.pavlu@suse.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-modules@vger.kernel.org>, <linux@armlinux.org.uk>, Xie Yuanbin
	<xieyuanbin1@huawei.com>
Subject: Re: [PATCH v3] ARM: module.lds: fix unwind metadata for merged .text sections
Date: Thu, 6 Aug 2026 21:02:12 +0800
Message-ID: <20260806130212.48727-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <tencent_08845B64E5F38EB7FA1779982A071AB4A607@qq.com>
References: <tencent_08845B64E5F38EB7FA1779982A071AB4A607@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_060238_720530_24540CD7 
X-CRM114-Status: UNSURE (   7.53  )
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

On Sat, 30 May 2026 23:46:01 +0800, Xiao Junzhe wrote:
> +	.ARM.extab		0 : {
> +		*(.ARM.extab .ARM.extab.text .ARM.extab.text.[0-9a-zA-Z_]*)
> +	}
> +	.ARM.exidx		0 : {
> +		*(.ARM.exidx .ARM.exidx.text .ARM.exidx.text.[0-9a-zA-Z_]*)
> +	}
> +}

I think ".ARM.extab.text" and ".ARM.exidx.text" is redundant, and I
suggest that
"*(.ARM.extab .ARM.extab.text.[0-9a-zA-Z_]*)"
"*(.ARM.exidx .ARM.exidx.text.[0-9a-zA-Z_]*)"
instead.

Mapping between the text sections and exidx sections in .o files
generated by the compilers:
".text" -> ".ARM.exidx"
".text.xx" -> ".ARM.exidx.text.xx"

".ARM.extab.text" and ".ARM.exidx.text" sections will never be
generated by the compilers.

Also Cc to Linus Walleij and UNWIND:
Cc: Linus Walleij <linusw@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>

