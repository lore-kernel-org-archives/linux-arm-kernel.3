Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B28BC55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 06:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMpyXTMpggc/5xnyF0UeFI5mvjnUcKUal/+v8k6Ljy8=; b=hGCYE3rM9gAYUmdh8ErjvXLgM2
	kJDgfhfvzfqC9ik+r3WXVmGk8eaYPD4gHReBSTz/1Jz/tKr/YxnVUDA0cwXDJA+OQ46GugBfPPOGU
	I6uiLztSEUwwJeESZhbFPbAU6vz3mMxZMULsRD0IpWlcr8+/+4AgL8F+owtptr3w0Ec3DHDQJIcsN
	Hb810iwDDlkbcl+V3cCzZgOR1775tohOQ9yCRv0kx4hCeZ6HpoD74odFukDe5sMWdULsOenCLH5ZD
	R5dtrTAk0x8f7W9cmQR8CdW24c0yfuDXFIqA9sWfWV7A+IUWYtRnlVCLqXoZnDS51lOTVGld8oyd6
	JLornW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqlrP-0000000GQ1l-3pmG;
	Mon, 03 Aug 2026 06:09:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqlrN-0000000GQ1J-0XIQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 06:09:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 600C9143D;
	Sun,  2 Aug 2026 23:09:05 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 658FB3F66F;
	Sun,  2 Aug 2026 23:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785737349; bh=J7z7JoGoPCG/YjbaHA84IGLx9f3C+5MbX0r74j9b9l8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sl+fV5NiagYIYA3Q3MMbV50Ng3fzo/fxEyJInTdFLqNtIW1Of9EAsrjd3JCDPj1Jr
	 iMvnKoCDzhAnU8sYVYTmXHxCQTrNn/+FcawPFwoFXUPeJPUsN7nqnpo8TjBFKHbGv5
	 1rfm+d/Q5edMvpcqWGw840RLPmIWtse4x+pjKj4M=
Date: Mon, 3 Aug 2026 07:08:48 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
	elif.topuz@arm.com, lukasz.luba@arm.com, philip.radford@arm.com,
	brauner@kernel.org, souvik.chakravarty@arm.com, david@kernel.org,
	subrahmanya.lingappa@oss.qualcomm.com, leitao@kernel.org,
	kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH v6 06/22] firmware: arm_scmi: Add basic Telemetry support
Message-ID: <anAwYUGTxKSyPvtN@pluto>
References: <20260724144430.1440170-1-cristian.marussi@arm.com>
 <20260724144430.1440170-7-cristian.marussi@arm.com>
 <20260728022759.5c485c1c@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728022759.5c485c1c@jic23-huawei>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_230913_206591_EFC4EC79 
X-CRM114-Status: UNSURE (   7.80  )
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

On Tue, Jul 28, 2026 at 02:27:59AM +0100, Jonathan Cameron wrote:
> On Fri, 24 Jul 2026 15:44:14 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 

Hi Jonathan,

thanks for you reviews !

I have ONLY addressed some of these in my last V7 yesterday, where I
aimed at completing the ABI feature wise, BUT I will take care of the
remaining outstanding issues next...just to say I am not blindly
ignoring... :D

Thanks,
Cristian

