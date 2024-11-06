Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B045D29FA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VdrKJWCBDhYV3O3Z2ZSOsNP4iD5AJ/QBftFYouuYms=; b=FCYzs8T/nPFjqMWmJQfVwK0AvD
	LS+isTEydqwi3qbalUwTQK55faYcL0PpQpL1pYKUVIy7iKLjTyH+sdb8aYbAlNPABo/Vq+lXose4S
	5cMInzceHG+FyMaYNJEgSqbz3XMhlnPnoS8szSCP619OZn/pTPDFJHcgfxZSc3+NcjzBZ5C9lVo1m
	EiSpuZKy33yilocxILuolkQYjQXL6bNsui+/nWokBKwFo9ZmMua1N6sclcrbyCYbIQ4iKHGNJyhjN
	llNm5nN4s0gAQbyNdsHPNri5qFkIyCBxvzJTVs1L0za26zi9aUz3GPxU8yF4XFE8V0ncLyNcaxZiI
	BunsfsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aCF-000000024jp-25oT;
	Wed, 06 Nov 2024 07:11:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8a8Y-000000024GC-2zuZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:07:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4EA91063;
	Tue,  5 Nov 2024 23:07:56 -0800 (PST)
Received: from bogus (unknown [10.57.64.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C05C3F66E;
	Tue,  5 Nov 2024 23:07:17 -0800 (PST)
Date: Wed, 6 Nov 2024 07:07:04 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: cristian.marussi@arm.com, johan@kernel.org, ulf.hansson@linaro.org,
	jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH V5 3/6] firmware: arm_scmi: Report duplicate opps as
 firmware bugs
Message-ID: <20241106070704.xqycfwhyrkui426w@bogus>
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <20241030125512.2884761-4-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030125512.2884761-4-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_230730_833907_2B1D7DF9 
X-CRM114-Status: UNSURE (   7.90  )
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

On Wed, Oct 30, 2024 at 06:25:09PM +0530, Sibi Sankar wrote:
> Duplicate opps reported by buggy SCP firmware currently show up
> as warnings even though the only functional impact is that the
> level/index remain inaccessible. Make it less scary for the end
> user by using dev_info instead, along with FW_BUG tag.
> 
> Suggested-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

