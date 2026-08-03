Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7912C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JF2BUvrAG6Jmb0Euic7TFPNOBj/sX0XMEvJiL2BgMm8=; b=zw1zUxxzNocgDdqsTiMbiD0ePF
	ilRmHCDdTbmvNirEHFTYr4IBB+eOjuxzbK+D2GCt9Uh7CWDif8f9YYpUdO0euRQoGAfc4cKxeVgTr
	qklyxfghJIlbNnk7L21C2Ch9Udo9rcFEPDDwKK6EwchNFj2IbRzkqxMjwPFPU1i6LeW6D9Pjo1gvZ
	noJ6l4Esq0GOrxW66kqThFV36CSYHhmlYhJQzuVRVTRSxgWfZLewRF0CIls7AIPG+AFJ+1bQm+55p
	F9QkoajdFuySyuwM6+msbqDSl5RDyZyQyf1/p3w/m4YMNCZMB4AZdyxKqGsHA2rvjjXH3c/yO8VHb
	syhm9ZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwNi-00000000Dda-0md3;
	Mon, 03 Aug 2026 17:23:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwNg-00000000Dcw-2ugm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:23:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF5E9143D;
	Mon,  3 Aug 2026 10:23:11 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2607F3F632;
	Mon,  3 Aug 2026 10:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785777796; bh=QXdbYhODgNCoMjuMI7rdU8rtGREIL8W7KMH0uM/frs8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hwcoKEA4gDomXvwry76t8b6kHyEWSf5XGAB5rkLQ291RoxdvJLA531KCJmhVX2tRo
	 Aee9Y40uk9JHS4GZSIBK3iPD2xqCdgvatEJaB4QKUxdh8iJS45lyOpBgY0NRZKA6mC
	 Ea58Z1YwQMyKl7yLj5gce4PcJ6xinidZP/WlOMPI=
Message-ID: <b3fb8ba7-f85f-4312-8c40-99320b55e866@arm.com>
Date: Mon, 3 Aug 2026 18:23:11 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v7 05/11] arm_mpam: propagate MSC access errors for
 __ris_msmon_read()
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-6-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260731170324.2927758-6-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_102316_794254_448BCDAD 
X-CRM114-Status: UNSURE (   8.92  )
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

Hi Andre,

On 7/31/26 18:03, Andre Przywara wrote:
> Allow the function for RIS accesses to return an error, and propagate
> read and write errors from the lower level up.
> This function is a bit special, since it can be called via an SMP
> helper, so the prototype must stay as void. So propagate any errors
> using the "err" field in the struct passed in as the sole argument to
> that function.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

