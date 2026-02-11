Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC96E9E301
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvbrZw2AZpK5leQ4f+TgiwyXrZvpb6CMDr/DqgF7/5o=; b=LtncWOQjdpcCQcr0vZ8vqLpQA7
	IGjjlz44w0BuM0G9lVkCNbjGboiugltlSEhvbVCLiEHlulvquBjzoyF+IiCdRM2upDBtP3Aa3Ifp3
	/7fbSx9gHe6C2sydB6UF2/WyjEfYkrID4Qi8Kio67KT6gvg9PsJZvjnIe0E3cj4ash8DFo+zAj0pM
	Ww7b8/tqKKIAxCft03VXyfVFu4FO2XQolHTlerTIIW1HPZM/P4hiEyATqcytW4zfFFKZrV48wJXMD
	wlDXmaVrdWhbAMm5G4ruU/TSwoS+eCihCb3ZuAITo52PlguVbF2hG2ndCO7ZQJGIo90C9xiRYUJLg
	ktv53sdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9ml-00000000em4-35QG;
	Wed, 11 Feb 2026 12:57:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9mj-00000000elW-2eLp;
	Wed, 11 Feb 2026 12:57:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D34E8423CF;
	Wed, 11 Feb 2026 12:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C7FC4CEF7;
	Wed, 11 Feb 2026 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770814656;
	bh=XvbrZw2AZpK5leQ4f+TgiwyXrZvpb6CMDr/DqgF7/5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNU+ESGtDO2Ti+ttGuhiJqYiykPzuh7lsqvLwKI5znwLB5CtWsquTcLu/PDtBJ8Ju
	 rudCjda9tqldUokjmyiDQwVPkAQlU6SYuzh0gqsNqmmrKYS2KzitjTxQtSOeGrjzsm
	 ZcQ3lzOzAt8o7TQIVEkVQPCB8DpWLTpc7bwI8l+idQf0YC0PHGOljkLwPfHUTamK8A
	 GQYhycjNxmjX5/WXGTmG3PmwGy7G5g98y+FHRAAwFgqIiXTMEe0b/HFLtJbd99X6pj
	 PYghBI5O4aXsi1PAWtU+niby5D/HcyV7kWZZZB8WRI2W6eHvQ2vd2CfH32awyYvLC6
	 gEx8tRVTeX9pg==
Date: Wed, 11 Feb 2026 05:57:34 -0700
From: Keith Busch <kbusch@kernel.org>
To: Yu Kuai <yukuai@fnnas.com>
Cc: Daniel Wagner <dwagner@suse.de>, Christoph Hellwig <hch@lst.de>,
	axboe@kernel.dk, sagi@grimberg.me, sven@kernel.org, j@jannau.net,
	linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
	tj@kernel.org, nilay@linux.ibm.com, ming.lei@redhat.com,
	neal@gompa.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] nvme-apple: move blk_mq_update_nr_hw_queues after
 nvme_unfreeze
Message-ID: <aYx8vo5kY-nEir3b@kbusch-mbp>
References: <20260209082953.3053721-1-yukuai@fnnas.com>
 <20260209082953.3053721-4-yukuai@fnnas.com>
 <20260209145832.GC18315@lst.de>
 <aYn-xwFHCpd7sITJ@kbusch-mbp>
 <e3e7d95b-2712-4365-922d-731449e7193a@fnnas.com>
 <aYtKFNm-wRKn6l66@kbusch-mbp>
 <20260210154108.GB2484@lst.de>
 <aYtWSscg6L9xxlzc@kbusch-mbp>
 <f3451ddd-96b6-4bc1-9d4c-964e361d56fc@flourine.local>
 <baa254f9-c41c-44f7-959a-8ce69e1768fa@fnnas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baa254f9-c41c-44f7-959a-8ce69e1768fa@fnnas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_045737_694692_5DB28F75 
X-CRM114-Status: GOOD (  10.81  )
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

On Wed, Feb 11, 2026 at 09:57:26AM +0800, Yu Kuai wrote:
> If I understand this correctly, it seems fine to make progress with this set,
> currently IO can return error during the race window, and this can be finally
> fixed with this reinsert.

Yeah, if you can just make sure to add an equivalent patch for nvme-pci,
otherwise the last patch in this series will deadlock it.

Some experiments I've run over the last day have me convinced no one is
actually hitting queue count changes in nvme-pci, so I'm not concerned
with opening that race to this scenario. You'd get IO errors either way;
your proposal just potentially gives you more of them, but I don't think
encountering that is practical reality right now anyway.

