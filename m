Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAD3E6B272
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kLSni+5d0yHMzZoTo4xFgfT3RF1f8awawxiCPvQQr0=; b=DQPtahI/4CVQfvotZb6rTH5Pd5
	Mrh3PzRY9zbTz46IfGylU+MY2KEXY7GmJzPxAUXRndHPkY4eMkIS8cyQ/DgDVwqcT/UqZ0qMAnY9j
	Dnira9/+0iDDCqMFXv2SZHV3U+kq0Ayfyhtz3sNBKn7h/oRu6BRllsAgbvzpaC+XAhyXL7zUk7Ap0
	6T9qupf+sf8YdT/jA38IIMPkMwH2w7MhBOfvynoBWe8ORLrMQGyvBNSAYZhNxtO98QE2sftTai4zV
	58jhPN8HNAFKUso0tzeu5NxMZTGnk23F+VmtxVyf0Q2RGLPggCczbDKEVu2ezV8LEdgd9seCZcqTJ
	K8tQIbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1Bj-0000000FNcy-2K4D;
	Tue, 23 Dec 2025 12:08:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY127-0000000FBal-1MMm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 23 Dec 2025 11:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6kLSni+5d0yHMzZoTo4xFgfT3RF1f8awawxiCPvQQr0=; b=pYYoaj83BMEGRaBICh0b+we9AO
	VAArofU4Kd+i8QcA/qLbhW9jRRU4oMHModHeB6/rBv9g9tqsrICwViF2773103ojo7WfOY2D+i5eE
	31s7aBCFmZtxRCKlVuvMhoQvwNz0Un0v96M7f82h++pTAHAzXu/eCd0asTZXtk3uQTO+BN2PYtMkh
	zoHLkMRcKUa8WvFMAGLMrut3tsfmVaVrmolbCi6qrb+fLmykXx0dz7aXTcw8sglri3Wb4kUoNRV5E
	phTAOMgC1bYwK63KAjLypWV4osgXQeR2omWy1VcnMBThyoSwHDuoFPw/W7G9qxwMkQuDZAz8mOpM1
	B1f7aLng==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Aa-0000000GfGv-1Zlw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:03:16 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dbD5d2j4KzJ46Zh;
	Tue, 23 Dec 2025 19:57:25 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 709B940539;
	Tue, 23 Dec 2025 19:58:04 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 23 Dec
 2025 11:58:03 +0000
Date: Tue, 23 Dec 2025 11:58:01 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2 01/45] arm_mpam: Stop using uninitialized variables
 in __ris_msmon_read()
Message-ID: <20251223115801.000033cb@huawei.com>
In-Reply-To: <20251219181147.3404071-2-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-2-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_110312_685316_E2F14D2B 
X-CRM114-Status: UNSURE (   7.33  )
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

On Fri, 19 Dec 2025 18:11:03 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> Dan has reported two uses of uninitialized variables in __ris_msmon_read().
> If an unknown monitor type is encountered then the local variable, now, is
> used uninitialized. Fix this by returning early on error. If a non-mbwu
> monitor is being read then the local variable, overflow, is not initialized
> but still read. Initialize it to false as overflow is not relevant for csu
> monitors.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202512091519.RBwiJcSq-lkp@intel.com/
> Closes: https://lore.kernel.org/r/202512100547.N7QPYgfb-lkp@intel.com/
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

