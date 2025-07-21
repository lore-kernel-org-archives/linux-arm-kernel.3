Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD52C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 00:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGRFhVX3LSb3OWohhgF+rBwGkBLIPiGi8BCPYP66HJo=; b=HBhFlIAsFR3rJhG8J3xKjHXiOc
	lkBXIDlFy1YF6HnVX0CH6gQxT0WTqX8mO89ItqlVt2AJnM51TKnV2mvTn8+OZZFkcJVoJJrygAi85
	aohDD63pwNgQvKl8RWw0xrPIAavAu55re/ceJelaKOLmTrN5Dzlk97vQhL+zNU9DMZC1hgUI6b0pG
	X9+RBmdE9TKaXwUv3tagBDOteieg5NzV1edxf8vqg467HWgj4w+iTTDnUZdOCWGrEutimI9mLAbOS
	g7fF3Ul5zsxewJ1p+b3qTdYRhWNJrt+lCVzzbzAW5mXbzV+ItLI3J4P75rDVh+/30oCZDhiqvl9Xh
	modxIoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udeSO-0000000FsbL-2WcC;
	Mon, 21 Jul 2025 00:32:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udePy-0000000FsUC-139U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 00:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F0395C516B;
	Mon, 21 Jul 2025 00:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5AEC4CEE7;
	Mon, 21 Jul 2025 00:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753057809;
	bh=Z3IQ//BUVuDYShz8oy9xXfu+5hwrpJS0iBCHzigaVV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYQZrXPJte+ORULINt/7fnPZMWv95A8AnQxTsfKiw5NxE3XNuoyZ09l2sj8Hjrb7L
	 6Kfpp1493vPQjkjAp0n4oO06ESvRUse8EYwsD3a20IiRTx8fW0jIGtMtnb5p0BPaU6
	 EaRy9+MqJHi6gyoqvwnctSHZpwSudWFxjra0m6YswF1CV02Toe3j9dHqG6ttdZiq5q
	 xE2dkERHMAovAuxSel8/SFRi/VDV04Z96phqZwrXBqyTbovLYwXMyOFFAD2zc47dat
	 ncwOzZixvLR2PQpG55yARAS/8SWlit3uZGLkyKgOZzAM1yblxg8gQ1avy+5hcSdPrV
	 zDJjAsBMm7icA==
Date: Sun, 20 Jul 2025 19:30:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: mark.rutland@arm.com, shameerali.kolothum.thodi@huawei.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	jonathan.cameron@huawei.com, linux-arm-kernel@lists.infradead.org,
	james.clark@linaro.org, mike.leach@linaro.org,
	coresight@lists.linaro.org, krzk@kernel.org, linuxarm@huawei.com,
	suzuki.poulose@arm.com, dianders@chromium.org,
	ruanjinjie@huawei.com, linux-perf-users@vger.kernel.org,
	saravanak@google.com
Subject: Re: [PATCH v3 1/6] of: add infra for finding CPU id from phandle
Message-ID: <175305780744.3139904.12956973374132329407.robh@kernel.org>
References: <20250718094848.587-1-alireza.sanaee@huawei.com>
 <20250718094848.587-2-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718094848.587-2-alireza.sanaee@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_173010_333767_65339DB2 
X-CRM114-Status: GOOD (  13.65  )
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


On Fri, 18 Jul 2025 10:48:43 +0100, Alireza Sanaee wrote:
> Get CPU ID from phandle. Some drivers such as coresight, cti-coresight,
> or arm-dsu use this API for finding CPU node in DT. In particular,
> drivers do this by getting the CPU device_node through a phandle and
> then find the CPU ID using of_cpu_node_to_id(). This commit encapsulates
> CPU node finding and improves readability.
> 
> The API interface takes three parameters, 1) node, 2) pointer to
> pointer of CPU node, 3) CPU node index. API sets the pointer to the CPU
> node and allows the driver to work with the CPU node, for logging
> purposes for instance.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  drivers/of/cpu.c   | 49 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h |  9 +++++++++
>  2 files changed, 58 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


