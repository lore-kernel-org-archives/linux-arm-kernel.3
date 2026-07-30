Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE48C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gev/8jZOWIvgmQcs9+A5RIKm9K9A9CjY0HnbCe+Lzc=; b=J3Jtjtm+YHEdZqAQoXxGSEkCXq
	r6ou0YfDc8YCMptu+oKV79qR+fUu7KlObLhdJU37E+emvws58OoLUCl54QI6ycHXpimSnlTXtdR84
	7rvCkfQ/6ehjWetzwT850qA57BcCCYqLZiuI8YxsXcBn9YmjwFttJkNZUy0BrigcPgRrwELJDDUYC
	baHWzsTrUIFeXwDZF7nEQ1KcfeNPzDgLREg4K/4kmxhsx93ML9LHjChmp7ZDIgP9pwwLnzAtbVUdO
	PtTBZxlU2S3Yer/6baSZbIQ+Cu88fQiCHzTKavggdMbHO2YjZOCdEn0RtD08R9T6ZAX0KXmryURz7
	KrBS36mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOwR-0000000ALed-1Kv5;
	Thu, 30 Jul 2026 11:28:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOwP-0000000ALdx-0eTX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 11:28:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B4E81684;
	Thu, 30 Jul 2026 04:28:40 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A3893F763;
	Thu, 30 Jul 2026 04:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785410924; bh=tSCp+PgtLkdlHR4/BfgCtxQ77P6JA0OVd1sIwSXnFRU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ROnyVbZdNiR1uu2vwlO/1Zh+MSOjfrP8BtZ/JjNQMDrkLqKAPiwtdfAp5rQk3Ni4t
	 e3Cq3Lgg/PvTOEhFQc1dRP8mvOQYzZ2+vvcPe6R/aI4qibKWh6lMYdNkJJfnBLqF2c
	 NqVywHCz9w5wUacKN40JjXiqQkW9uu98N5+zNy8Q=
Message-ID: <bdeb9012-d333-439b-a4e5-b652e8380f78@arm.com>
Date: Thu, 30 Jul 2026 12:28:40 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 06/10] arm_mpam: propagate MSC access errors for state
 saving function
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
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260729134124.2506269-1-andre.przywara@arm.com>
 <20260729134124.2506269-7-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260729134124.2506269-7-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_042845_235047_D11D0393 
X-CRM114-Status: UNSURE (   6.50  )
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

On 7/29/26 14:41, Andre Przywara wrote:
> Allow the mpam_save_mbwu_state() function to return an error, and
> propagate read and write errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben


