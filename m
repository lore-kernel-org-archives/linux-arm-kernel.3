Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71843C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eK6qW4IuTp42I5EfnopOPfnIZPyJnuKMGuWcYBhYr1c=; b=PnC7kCpElp5FFh+U75u4BPF7A7
	UENr1hvmv6yKh3q6vIc0D2NWBx5ewyL5k73+3SmWgm1qBIFM9zGi9zH7/cK6xBifc1+5YO0BLdVLE
	naRMgfWV67sok2Orr4LHCIu5B0TF6hHRYB6Xz3yiJv4K+huaHF4sxDIwh1smtdMO2J58F3jOTDhGE
	XIA8dwJ18hLcrkokUqXCbPqtsPO+cm7rITiD291lYgxYq1LEakQy50r5j7DcpAJdVziq51Bsbv4ey
	2SmkaWlpp26JRRYgCtjKxpFuvCMtmws+irAabDZSRN8Hy0p66kPrlHPQ85Sh++0lZuqvFpZFJ4Nw/
	AFrLcOog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJi4-00000002baX-2U1m;
	Mon, 27 Jul 2026 11:41:28 +0000
Received: from [113.46.200.224] (helo=canpmsgout09.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJi0-00000002bZO-1LmO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:41:27 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=eK6qW4IuTp42I5EfnopOPfnIZPyJnuKMGuWcYBhYr1c=;
	b=oggHfJhBggYmxttn+4DlCcaw/yAGnZZ1vFTFmmzkZH1CEsCLw/7wn3UBuoS7+THiWt4kwLgum
	OF5Wh/lJgyi6MUfg/QFEqkh/SIQCFioxc7m8QisBXeFqL9owaSBmPDsyU9aKajUeyj31pTmFemi
	vpo66e9HaVGTHE0dXKPDLqw=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4h7xJ92W3qz1cyPB;
	Mon, 27 Jul 2026 19:31:37 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id B2D4E402AB;
	Mon, 27 Jul 2026 19:41:01 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 27 Jul 2026 19:41:00 +0800
Subject: Re: [PATCH] perf: arm_pmu_acpi: Get rid of the edge-triggered
 interrupt oddity
To: Marc Zyngier <maz@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>
References: <20260725162627.145301-1-maz@kernel.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <69221ad8-9283-2bcf-e92c-a7b4fd2107cc@huawei.com>
Date: Mon, 27 Jul 2026 19:40:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20260725162627.145301-1-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200006.china.huawei.com (7.152.185.252)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_044125_661666_65D84ED1 
X-CRM114-Status: GOOD (  11.61  )
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

On 2026/7/26 0:26, Marc Zyngier wrote:
> The ACPI spec bizarrely indicates that the PMU interrupt can be
> edge-triggered, which contradicts the very basics of the PMU
> architecture (SW is required to clear the interrupt condition for
> the level to drop).
> 
> Remove the code parsing this flag and always flag the interrupt
> as level triggered, no matter what firmware says.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/perf/arm_pmu_acpi.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

Thanks,
Zenghui

