Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B64D0C611
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=je9XWd37+BabOVnToSxos3cV0C4zstKL2CqXr3UZB2M=; b=AP/xA5Je3FwA8/hsBw78nLzX/2
	ONKM4sLJzUm7yHu2R+N5+o4TMnXJnJhsz/rze/cCVVk0SqtwLOvHMSWvPRiA2xzh3Emo6Alj7jtT5
	7aVrRyjfoWrddO29vCAOzqWgKTMI/4A/cIoatDs0of1+97uo2A5bvk8rog4bN32dMChB6JCK9z76i
	mSWLY/VBmXPY0sL1FKNgDOTrEMZJ/culr4cxSgqpxzKQa5iZFh/VAqgkgSBc0uc/ye0CKom8wvjXd
	8o0BpfEZZccI7qOWS7w6usRm5IY51CIXfcmoKxHDl/CcdhaqxHA0dq+SyRUpvg4MQQoItg8oE2kXo
	w0BE+Xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kp0-00000003uEF-2XnF;
	Fri, 25 Oct 2024 13:57:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KXH-00000003qSl-0HO0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53EF15C5A4E;
	Fri, 25 Oct 2024 13:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237A2C4CEC3;
	Fri, 25 Oct 2024 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729863566;
	bh=iXshz53UY8Tw9bcTb1F+rkddkrEEDdOWrzrTbynhNCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EMCSnz6PQUh62zSItP2OLJ+BdaD+t2T5Q2/vMO2BMIG6pl4JMh8zdB/W5Fwu0UcVa
	 0JTDecr9LOCsDwkgy4/yq+MNyztwKV0OPv3PaoO6lKMtWwNCQ1lWkYbGVwFhBTkdBp
	 nWZnTYOmbhoiv5gGoUk0BNU/LyNASN0jUFc90obelR6OSVPpPE6yxe9I5dHHQaXtt1
	 c/gHx4yz3nTeNIsNgz+VD/daN/oFYe2tKATpPQrv4FfBKKKKVuDxb/kATj5V0rslV0
	 OX+f/knTUX++MnzANgBLQ/0nS0QuQlilysAhZ/EBocV/5qC8teiu2big/tvXjZ34Jg
	 wrmqcaHc1gPug==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t4KXY-000000003M9-2an3;
	Fri, 25 Oct 2024 15:39:44 +0200
Date: Fri, 25 Oct 2024 15:39:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, ulf.hansson@linaro.org,
	jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH V4 1/4] firmware: arm_scmi: Ensure that the message-id
 supports fastchannel
Message-ID: <ZxufoL3NjYs8Lyq0@hovoldconsulting.com>
References: <20241023102148.1698910-1-quic_sibis@quicinc.com>
 <20241023102148.1698910-2-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023102148.1698910-2-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_063927_170524_0D2A7412 
X-CRM114-Status: GOOD (  10.06  )
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

On Wed, Oct 23, 2024 at 03:51:45PM +0530, Sibi Sankar wrote:
> Currently the perf and powercap protocol relies on the protocol domain
> attributes, which just ensures that one fastchannel per domain, before
> instantiating fastchannels for all possible message-ids. Fix this by
> ensuring that each message-id supports fastchannel before initialization.

Again, perhaps you could include the error message I reported here so
that anyone searching for that error will find this fix more easily?
 
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Closes: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> Fixes: 6f9ea4dabd2d ("firmware: arm_scmi: Generalize the fast channel support")

And, also again, should you add a CC-stable tag here to get this
backported?

> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> v3:
> * Pick up R-b, T-b from the list.
> * Move scmi_protocol_msg_check to the top [Sudeep]

Johan

