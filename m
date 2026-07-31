Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB3DC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yxmh3kK47cKyrwCahJrDCTnVsy69YxcsCTQmeW1UTM=; b=s8rvBJiZXl3PPo+cCp4Vl0AXBm
	RcddPxxS4EoB/vx53Wetstn8N6zfdctv+qG7rrGjAjl7oU1a6lZdShxKTertRzpZ3SvFxk0GWN50X
	i1fIBgGt0zjX68wDGbYGti89Ry2v5CoKtpHEvbL8jyeR0mztGldbCEJdM1e86j0TQ+cX9bHqd6BD3
	iQtWP94viHpqe+KKonhbzy6De2H8jbJcZ4F4Mlukg6esTcXMpMsGwZYUK2qjTusEQSWHyEzqyb/A4
	BF3sEiox7UVBk8szKsMLg52HEdeSoe99u6AjcpMMpvKRk2FFLfd/8VTt1KYPO2/t6Uba0iH5LY+ck
	YK3XjWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppNq-0000000CvIm-0FRi;
	Fri, 31 Jul 2026 15:42:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppNo-0000000CvIg-3z0i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 15:42:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E02026004E;
	Fri, 31 Jul 2026 15:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2571F00A3A;
	Fri, 31 Jul 2026 15:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785512567;
	bh=6yxmh3kK47cKyrwCahJrDCTnVsy69YxcsCTQmeW1UTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T7R+oj68nQ2c+GQA8Gu3e3yJkZzjmRYtHRpHRY8/mCykf7fJ59WezSSrkgnrqe3cC
	 YMiu6j9lLx/HZ7rVbN3vNipry01Km4BsoaHMl5OYow0ajGndleSWW+l1lo/7QeUzuJ
	 iDTnmI69niQmAVtPvW+6RAxUQoKeIRtFGzuQUUi04jis+c94taMvhFna2Dv1X1dLXU
	 MS3jr/X5qg5swxxUarsr8aLSUoovVbOVos3BunozvDHrbygHVezCoPKZQbfGqlej85
	 H95127MATL6fbcKcZpQhntdlTqtFeEG3fR4feiuWvzRHqKtJZ33QMGZRBQM5Jhy7hF
	 a9uaIWgRj8xBw==
Date: Fri, 31 Jul 2026 16:42:42 +0100
From: Will Deacon <will@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ACPI: IORT: validate RMR node array bounds
Message-ID: <amzCci9-3kMZbSI4@google.com>
References: <20260706094300.82618-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706094300.82618-1-pengpeng@iscas.ac.cn>
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

On Mon, Jul 06, 2026 at 05:43:00PM +0800, Pengpeng Hou wrote:
> IORT RMR nodes describe reserved-memory ranges through firmware
> offset and count fields inside the current IORT node.
> 
> Validate the generic IORT node length before dispatching it, and
> check both the RMR descriptor array and the ID mapping array before
> walking them.  This binds each array walk to the current node length
> instead of only trusting the firmware-provided count.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/acpi/arm64/iort.c | 83 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 79 insertions(+), 4 deletions(-)

Hanjun, Lorenzo, any thoughts on this one?

Will

