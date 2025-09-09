Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0A1CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imesH7ee1efEYQAis7K/XjX8z18kK0xO5koWlMOvmiI=; b=swkRSTgEnLjvQDAImbaiZQ0aPZ
	vGYKkJBtFjSAjkI46fNxl66OC3L79RDvCaa15ssDVm34swIe+WQz3zOoI///gIXTKndrX44KwQ34u
	kKcTbHS22Exuj1pI+diEqPDshVaELE1z4v5S+icLk0vlOhVwGGg20THby+XrfRGuqSdt1cUmxJUbA
	P9shRHsWSRXKoKDFoVCmJ4gl3hOqc3ZJ59cWOKNwmYS5Xpe7ycBlxboK7IV/xAQowg4QT++aBV3nX
	03mY0H6Ahtv1/jFzelhmL8pW9Y4pUwTCzYVRSjHSQbk1IntLjj14Sn28Bh6E2UXrwHn+hp3K5Ju9b
	8YQULdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsJN-00000004yt2-3uE5;
	Tue, 09 Sep 2025 06:58:42 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvqyE-00000004RTm-2fKz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 05:32:48 +0000
Date: Mon, 8 Sep 2025 22:32:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757395962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=imesH7ee1efEYQAis7K/XjX8z18kK0xO5koWlMOvmiI=;
	b=nysw+ADOUYBJhMYLzPVCtQSvTHBZoDKuq6+zkvVv/H9ua8HqZtlH/oAXQJwrXPNwcPwIWq
	lgPISzjIK+CMqjeUfpElrtoNDNgkDE823Vo0Em8mBp3zeg37tT27DSktVcMb1X0HHmgOzW
	rd97cI6mO25B3ViXjDfLEeqWdEfbOqI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jinqian Yang <yangjinqian1@huawei.com>
Cc: yuzenghui@huawei.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, liuyonglong@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v2 3/3] KVM: arm64: Make ID_AA64MMFR1_EL1.VH writable
 from userspace
Message-ID: <aL-788d0xWThAVSl@linux.dev>
References: <20250909034415.3822478-1-yangjinqian1@huawei.com>
 <20250909034415.3822478-4-yangjinqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909034415.3822478-4-yangjinqian1@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_223247_171884_768C40D1 
X-CRM114-Status: UNSURE (   7.64  )
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

Hi Jinqian,

On Tue, Sep 09, 2025 at 11:44:15AM +0800, Jinqian Yang wrote:
> Allow userspace to downgrade VH in ID_AA64MMFR1_EL1. Userspace can
> only change this value from high to low.

I'm afraid we can't allow this. When we expose FEAT_VHE to the VM,
HCR_EL2.E2H is RES1. Meaning, vEL2 is unconditionally in a VHE
context.

I would be OK with a clarifying comment documenting why the field is
non-writable.

Thanks,
Oliver

