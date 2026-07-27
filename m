Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9530FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 22:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Beq88uOHJ24V0VZGHYge0LPzaDqSYHq/p4rqe8cWWo=; b=b/vz7ss7nkCU/VMgUrXUGrTqDt
	21vkJ9UeGEfr1Vqm29IVz2v5n4SeKC6jrZVMf/9AtT696pfWHWqwwACbXoO52d5sVzZZsDfKQVV/c
	qmn2aBwbMiLD65GGJXxusweE9e9b3bKYekzBJoLCKHaaLi0Q4KsGo3oIkmVRMmvUr/ME/tW7mq3lF
	IC/kc2iCuLeJHXZFJpVvai3xtnfg0ROwnyA4NHguRCdfD6744vBZ4B+15BatN+opTbAXofhkl8ERP
	mPt2M08q3VczpTMbIIWsLLcFQodvMKoMPNU6OixIgXDGrX6fngPk+TTDDgS8xGSiOwFRhAmgJkwm5
	gkbNNp/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woU6F-000000042b5-31rQ;
	Mon, 27 Jul 2026 22:47:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woU6E-000000042az-0tBq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 22:47:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 82E0641E68;
	Mon, 27 Jul 2026 22:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6474D1F000E9;
	Mon, 27 Jul 2026 22:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192425;
	bh=/Beq88uOHJ24V0VZGHYge0LPzaDqSYHq/p4rqe8cWWo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=G7Zy0aNh/P3V/o/7NKw0az9jiNUeMcABPPk3xNTcd+3hEPAiJ15lYuicdJQLqiIHZ
	 y983eL0hIHIfdT38aIUZCGJ56PAZaMdPx8mP1jcRtj89tiE1QBavx/OME7Z7/cozVk
	 cImCUffiwykKIdJlouZM3U2UtZ5o40DrpEUmtxCraYElyYlc//IuXfu1diZIN1G0av
	 Ak2Plx1N9Eq3+kWRVSeg3QKvA3nL4DoNtc180P0mItgNPRgpBn/4ZkTYVja/ITvhsI
	 AKq+1aYZwBv3tIlMvq0B6EFIkv0p8Re7xHTRTf6nGseUXADX1QUhz3rEB9v9nrUfNs
	 V3NO9t1bAAHqg==
Date: Mon, 27 Jul 2026 23:46:58 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>, Srivathsa L
 Rao <srivathsa.rao@oss.qualcomm.com>, Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>, Trilok Soni <tsoni@quicinc.com>,
 Srinivas Ramana <sramana@qti.qualcomm.com>, Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/10] arm_mpam: propagate MSC access errors for
 state saving function
Message-ID: <20260727234658.3568bb4a@jic23-huawei>
In-Reply-To: <20260723155454.1760823-7-andre.przywara@arm.com>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
	<20260723155454.1760823-7-andre.przywara@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 23 Jul 2026 17:54:50 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the mpam_save_mbwu_state() function to return an error, and
> propagate read and write errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

