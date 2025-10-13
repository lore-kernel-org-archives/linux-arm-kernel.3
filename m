Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841FFCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skX7ujZg2fq05QJjM6TX91rTMWusyCUAEJs0pu4Nibs=; b=FegmvY6ddbbkQXHabVEFoqBhxJ
	HC0g7jiF8Fnv9Z5zLB6y92TMopR6VOO/AWW1mxaxhvPuIUDn9dG/wn0EZGwfaxts3wCkW/I9XcKOv
	7Gkso5xbYDXjeUsBY9PmBcjgafj3EefBJY+w0f4txU91uslg1ajwCioDnq1NIPQk7ntEtiFWgcaGc
	QEV1udksbrSX1G9/utVdvAK8Q9MvANdGf9VHgMhdzMMRr41iqMY9+1l49gtHH7gLoKje/VAymUh4i
	3HODiWi8O62pnROvN4ETGTnz1wR2fhHkowLBsgRtx6U8qi8T3p/L1FSaNd4hYghH6cM44pS0PuF+D
	JV2HyvOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FF2-0000000CoJF-3vZF;
	Mon, 13 Oct 2025 09:53:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FEz-0000000CoHb-2gys
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 09:53:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEB0D12FC;
	Mon, 13 Oct 2025 02:53:08 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA9603F738;
	Mon, 13 Oct 2025 02:53:15 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Lixiang Mao <lixiang.mao@oss.qualcomm.com>,
	Lixiang Mao <liximao@qti.qualcomm.com>,
	Andrei Homescu <ahomescu@google.com>
Subject: Re: [PATCH v3] firmware: arm_ffa: Add support for IMPDEF value in the memory access descriptor
Date: Mon, 13 Oct 2025 10:53:13 +0100
Message-Id: <176034900384.3384685.15028948286054727629.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923150927.1218364-1-sudeep.holla@arm.com>
References: <20250923150927.1218364-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_025317_733761_B783B418 
X-CRM114-Status: UNSURE (   8.49  )
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

On Tue, 23 Sep 2025 16:09:27 +0100, Sudeep Holla wrote:
> FF-A v1.2 introduced 16 byte IMPLEMENTATION DEFINED value in the endpoint
> memory access descriptor to allow any sender could to specify an its any
> custom value for each receiver. Also this value must be specified by the
> receiver when retrieving the memory region. The sender must ensure it
> informs the receiver of this value via an IMPLEMENTATION DEFINED mechanism
> such as a partition message.
> 
> [...]

With s/version/(version)/ change,

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: Add support for IMPDEF value in the memory access descriptor
      https://git.kernel.org/sudeep.holla/c/11fb1a82aefa
--
Regards,
Sudeep


