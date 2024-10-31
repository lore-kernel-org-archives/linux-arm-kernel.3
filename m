Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A2FD767E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ive04fAUcHY56no938UnG0QkakG/JmOK4QV50mkizYw=; b=FRO5ncK5fTwjtm5U+GKAbIHr9p
	S5cwCw1/l1HEKgKSo8fgMK+/7NsclVLa77LzjxbXygNHhoxoA6hojly+v5OD7Y5lpWDBjPxFOTjbC
	4K2uPoyogw8/POxwrBMJKxZv8DvGaYKholPp7yHbfCCB7oDZBEmNB/zrjv0dqgkIuZPFYS4AgszCb
	sGZ1YDN4fF+6pfQ4LEs0rXNKkIp4vmzAWP/T+j/iwivjktbCC6b3eZ3LnN3t7blIthL9lLF35nrZb
	PniTzXHG9+kf6zN3Pe+A8F/d4acI9WAmjALtHeyFcSFFW4SryINe1EcDz/br5N3u470XA1X/ar/Sh
	wPqIuWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Yv0-00000004KyN-02jX;
	Thu, 31 Oct 2024 17:25:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YoE-00000004KAy-153x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 17:18:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B3781063;
	Thu, 31 Oct 2024 10:18:39 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D656E3F73B;
	Thu, 31 Oct 2024 10:18:08 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-msm@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: arm_scmi: fix slab-use-after-free in scmi_bus_notifier()
Date: Thu, 31 Oct 2024 17:18:06 +0000
Message-Id: <173039469931.3107954.7989947902656266610.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016-fix-arm-scmi-slab-use-after-free-v2-1-1783685ef90d@quicinc.com>
References: <20241016-fix-arm-scmi-slab-use-after-free-v2-1-1783685ef90d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_101810_358394_C690DACC 
X-CRM114-Status: UNSURE (   6.70  )
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

On Wed, 16 Oct 2024 14:13:38 +0800, Xinqi Zhang wrote:
> The scmi_dev->name is released prematurely in __scmi_device_destroy(),
> which causes slab-use-after-free when accessing scmi_dev->name in
> scmi_bus_notifier(). So move the release of scmi_dev->name to
> scmi_device_release() to avoid slab-use-after-free.
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in strncmp+0xe4/0xec
> Read of size 1 at addr ffffff80a482bcc0 by task swapper/0/1
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: fix slab-use-after-free in scmi_bus_notifier()
      https://git.kernel.org/sudeep.holla/c/295416091e44
--
Regards,
Sudeep


