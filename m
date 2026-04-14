Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A791F9D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:Subject:MIME-Version:Date:
	Message-ID:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdO6F4/G5lB/fmuoFjUKn+RHITqBLcf58EJEUDdbwxs=; b=Lfcz26lDO6J3P7NQ+WwM4P4/q0
	vIqpwzxSb9JrUMIznU2x4769wRmsqPLwfeRfM6Bp0sfSNwadykxSJuakbtisF49UnU0cqWjWGZ9sE
	iVTnWVw6ESyhJv+Jxv1qlusdlgMkgTBYbJEIsvXADs8Ij2oYGLSnjKgOOgMIXBj+SwGl/fl3vkeqs
	AxNym/bM8n1tdGoj0ljjSyJu85v7/OBzseijlCYYu0c0gy7ZJ3aiVDFDu0BNtVXxDlMVcftgBvuix
	tTh3huEmjwsV9Nz3eD3zl12IEsEKO6cbXfxtdZG5iyGpyrDdhiCQSFwDczzVhtH6EfG6g5752UVKr
	RQ0XwJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdrL-0000000HNoh-1Pvu;
	Tue, 14 Apr 2026 13:31:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdrI-0000000HNo9-1vaV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:31:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ED0E4E8A;
	Tue, 14 Apr 2026 06:31:09 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CAA23F7B4;
	Tue, 14 Apr 2026 06:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776173475; bh=3tK6M2VAY67sZVBwbr7Iq6/6sbKfCk+1QBc/ADPvwg4=;
	h=Date:Subject:Cc:References:From:In-Reply-To:From;
	b=g05Z+H9Y5zCAfxxsCMLAye3oMcFUXL7MA899/SOhlndi/DbGbg1e2kDInXzjWGDQ2
	 vZQdgTd2iz77PALwwMiotIRofahX+pXMm26oUBFzNhx5siVKf/oZaoEm1V7+9vjbuJ
	 v7Z3JR16kMgg5SO3/304eUwitzA/AbqASXX2yaYI=
Message-ID: <f764d070-0f3e-4be3-8850-b43a711f492c@arm.com>
Date: Tue, 14 Apr 2026 14:31:12 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v1 1/2] arm_mpam: resctrl: Fix broken error path in
 mpam_resctrl_alloc_domain()
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Dan Carpenter <error27@gmail.com>, James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20260414132758.196874-1-ben.horgan@arm.com>
 <20260414132758.196874-2-ben.horgan@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260414132758.196874-2-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_063116_563735_1AC2DCED 
X-CRM114-Status: GOOD (  15.88  )
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

Apologies, I just sent the same patch twice with different subjects. This one can be ignored.

Thanks,

Ben

On 4/14/26 14:27, Ben Horgan wrote:
> Dan Carpenter reports that, in mpam_resctrl_alloc_domain(), any_mon_comp is
> used in an 'if' condition when it may be uninitialized. Initialize it to
> NULL so that the check behaves correctly when no monitor components are
> found.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index a9938006d0e6..d80df486a313 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1399,7 +1399,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  	}
>  
>  	if (r->mon_capable) {
> -		struct mpam_component *any_mon_comp;
> +		struct mpam_component *any_mon_comp = NULL;
>  		struct mpam_resctrl_mon *mon;
>  		enum resctrl_event_id eventid;
>  


