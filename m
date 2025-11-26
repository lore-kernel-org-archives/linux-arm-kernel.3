Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B388FD11193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLgia25EvIAIBo0VY2I6S9Dk4/MSQiPdMJldJvpcdsU=; b=bRDmsTnY/AO5egSvDDIAcosCW1
	Rhlp7BZBNi1e2YEj5iDZme8xvfj5C3k5lh1lFJZaMYBeBxHH7BIbbfMZT3EMJd+1Nj1VDhz+57uv9
	jTGxrYkaq/gE3RlC5Nav7fEjzFGEIG2YcD/3MqulA1O2BHBKWoagZC08EZxW9k9i5UKCb/toVOtoX
	zQLNLEHaK7zelGwqcRNES3w5fOlWbyfz1X2Jxi9m+apILt9m+kOFH+eMP6BL9YQ6+7lKU3AMrj9dT
	yGrFdSE/5cQn8x8IgTWnB7bcI3hWGnCgA5ptUi1Hl9c2Z4RRtMPP8DMI4pcL7BxVpaLysH02eEWjH
	ocdc5tow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKg9-0000000FWMW-0MZ5;
	Wed, 26 Nov 2025 18:55:49 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKg6-0000000FWM9-388A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 18:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MLgia25EvIAIBo0VY2I6S9Dk4/MSQiPdMJldJvpcdsU=; b=g3nS6R4bW6uQlx6Je24W9afEMH
	Em5LKt9oz497k9Gfvq/XJ6/fvEKedQW3YCWBUH4PKFDdicr4JXoufcWgeWK7ZSKU746ud4sumvmfV
	YFNnq6xLzJPiACvsBcuyfVcSUnV3OpxMuva5TL3RuNuU+TffZJW9CUynU/dVu/G8lWvJ3b7YIKkhz
	9yZ6mCKUXqeuIpWgtJErxKkaN0GEn3IPqwa/y96rIxsDaXZooIrwB2XiggY7muOwYj/KzbZGUgbxZ
	SF/CXLaEIOq6KfcuVZfyq7VCgkA0OMCSds/ICAlTsKJdpjSM1Wvsnw4PrjBCCA8I8x400e1Wrl1WS
	zsOaQ43Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vOKg5-000000007j8-2ErT;
	Wed, 26 Nov 2025 18:55:45 +0000
Date: Wed, 26 Nov 2025 18:55:45 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Zizhi Wo <wozizhi@huaweicloud.com>
Cc: jack@suse.com, brauner@kernel.org, hch@lst.de,
	akpm@linux-foundation.org, linux@armlinux.org.uk,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	wozizhi@huawei.com, yangerkun@huawei.com,
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com,
	xieyuanbin1@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <20251126185545.GC3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_105546_784781_29B94F32 
X-CRM114-Status: UNSURE (   8.72  )
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

On Wed, Nov 26, 2025 at 05:05:05PM +0800, Zizhi Wo wrote:

> under an RCU read-side critical section. In linux-mainline, arm/arm64
> do_page_fault() still has this problem:
> 
> lock_mm_and_find_vma->get_mmap_lock_carefully->mmap_read_lock_killable.

	arm64 shouldn't hit do_page_fault() in the first place, and
do_translation_fault() there will see that address is beyond TASK_SIZE
and go straight to do_bad_area() -> __do_kernel_fault() -> fixup_exception(),
with no messing with mmap_lock.

	Can anybody confirm that problem exists on arm64 (ideally - with
reproducer)?

