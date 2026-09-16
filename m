Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2BEC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGVVuiB8rjxpAsP/Ov4M0vjfGZ5ULnUY8vyr6MLLVOI=; b=sPTiwASV7kFVfbjNZageMDfzRM
	Kt2FIm2z39aYHV56A8jDnUU8VSahm326LZ+dtir7txNqq60uQVH82vZPAeUMollhXj/1o/DDtSRKP
	ZpME/Uo8fxRFVD9XwRTNB+9J2uXUocOKhVaEzuxSJX6aNtzV2A/nIC7mmAGDJQyYiMYa3VP1BRxyG
	vah85hiX7umscf5gSM2B3Wl5tvbgIf48swkbVTDS/5FFCdWX6othl60qBe8HaKhpfvfzGB38H2lRv
	MEBG+EJJhqaHRjd80QtD7NeknqELhqeZFR6iWgTPlbWt5o53vTSaagYdZRWlcFg2oEIGoG2sFO2Gi
	XvtNGUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ox0-00000009Bnl-1HrJ;
	Wed, 16 Sep 2026 12:41:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6owx-00000009Bmr-1kPX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 12:41:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1598A152B;
	Wed, 16 Sep 2026 05:41:13 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 485FE3F7B4;
	Wed, 16 Sep 2026 05:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789562476; bh=v4OJfGQjqupmOUYCTEvQPXvqsjM3S1VpbBPgTe+MS2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juSpMVmGrCyFLSdSExxYQzmfcyT72dlluiB43U6iMgge4d/aNTmEnNYnetZ33U8I1
	 THD36wvoiMYT8nAipLzpef9IOYYHEMHmd46CQEOELR0IzVbXNkBMQYw6ENt+TW1Cq4
	 MAeQKTgKmhnkifiFQEa2K6kH3RqTLhrlJmJc78pE=
Date: Wed, 16 Sep 2026 13:41:12 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: anshuman.khandual@arm.com, gshan@redhat.com, will@kernel.org,
	suzuki.poulose@arm.com, zengheng4@huawei.com,
	linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: io: Reject non-user protection in
 ioremap_prot()
Message-ID: <aqqOaMcEtuON9Vw8@arm.com>
References: <20260911015859.71164-1-zengheng@huaweicloud.com>
 <aqqM_NoRRePxXzOO@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqqM_NoRRePxXzOO@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_054119_494665_8FF1900B 
X-CRM114-Status: UNSURE (   8.18  )
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

On Wed, Sep 16, 2026 at 01:35:12PM +0100, Catalin Marinas wrote:
> It would be good to get Sashiko's finding sorted out as well
> (pre-existing issue). I reckon that should go in the core code.

Ah, that's getting fixed already:

https://lore.kernel.org/all/e06e28a46c2a176238f03b5740df0913e57c2861.1788842306.git.rakukuip@gmail.com/

-- 
Catalin

