Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E5CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bKk78/cUBVMRsGmIHB9eHx8NN7HqTjyj+NpF8y77Vk=; b=Beujc0u/YRR3vXA4liWuZCMaS2
	qgcR8iGdpP69n5XkdXAKV4NxmReUvtrGYxQxEFddyJvwmE2+X6kb93QmtLp4ebkAEJ54LqcHAo3kw
	DToRjNxVP48pNDqq4cjRvlX7QOPjFAe2BzQGSzEOmmPeaARjauPFr7SMoci3Mm8jhOvYoKw8z1gXx
	ueA1GHxkwMDYgSsyi7TLTxGifIY+UEHeQinxouLmSXM7pKXFEvxLuuBtjmg7uQhoDZQL2f5l0tUMc
	RPfAPYZhrKNMILRV8F+ZNa93fnmjPqaGn+BtdxqO+BcSdNsQMtb/N/o0JvS7FXNFy1nYFFf9Dx0uK
	/A8LIMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitF9-000000070sL-0Zc6;
	Thu, 22 Jan 2026 11:52:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitF6-000000070rT-2VdZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:52:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C917A4435C;
	Thu, 22 Jan 2026 11:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85833C116C6;
	Thu, 22 Jan 2026 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769082771;
	bh=8bKk78/cUBVMRsGmIHB9eHx8NN7HqTjyj+NpF8y77Vk=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=WKFhd6eJG/25Tu4S4NiFeifgs5vRUp2FvhIhO9DOqZHowGyVhBvqgg+aZaszjdrFy
	 n8ifSpsyn0O3b7M/uwQxbFTWBoIGqFRrA0fOKwQmHJfBSJKzPzpjU35UML3nFzwV3d
	 h1HO3UU/PT6kDfE77KwS+bMvGFQe9bACXaz7I9U4odtNTE0CReW60VkX7xP9WENuQq
	 oZejainJFYp9vFSx8K4TusF1lRA37G6EGikufyzZTh33VEHyqTfkDKkn/yRepN++LK
	 kbVe0vhEaP7/NZeO5EYTlnbJr7dV9TGOu02iQc9ozWBuabmlwKqMhPgDHI0Yb/cZLj
	 gaR7SJwmgt8gg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 12:52:46 +0100
Message-Id: <DFV3I3D5UIZP.38TNCAJWQGI3O@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <broonie@kernel.org>,
 <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
 <robin.clark@oss.qualcomm.com>, <hanguidong02@gmail.com>,
 <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>
References: <20260121141215.29658-1-dakr@kernel.org>
 <6oogrqe3n5sxtpdydjqo4ucwp7n3ipqoupxtekvzbnqd7dae3s@q22wc7fpbtya>
In-Reply-To: <6oogrqe3n5sxtpdydjqo4ucwp7n3ipqoupxtekvzbnqd7dae3s@q22wc7fpbtya>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_035252_657626_44F18390 
X-CRM114-Status: UNSURE (   6.61  )
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

On Thu Jan 22, 2026 at 10:21 AM CET, Ioana Ciornei wrote:
> The boot lockup was visible also on the NXP LX2160ARDB. This patch fixes
> it.

Interesting, this means that qcom_smmu_impl_init() must be called on this
machine, is this expected?

> Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> #LX2160ARDB

Thanks for testing!

