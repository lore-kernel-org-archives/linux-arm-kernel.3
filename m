Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EDBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWraH2wNxIauMuBTpKL9UZi590zJdjFgPgWQCnH8nYo=; b=drOw1mmW/26EBNRn2NrE3THMMu
	yv+1XRVW5i6YC/TQ/lMrM2oqFthPLUxqxSdYSQh0IT5D915mX1jiYmk3xdu6m4SGHuigzeXEbNvNd
	e0IE92OCbhUM6Gtx2yaIJMzTFp+pS6BXTT//z4bOgx5q1Z0GON0NHsiwO4g4skQMennPnIUFqsbto
	fJxUMSVzca9N+174hd03xXapwh58UEbyE0Er0cJh/h0uMWjozxvshle8NGx54LYCHykyqkdXZyLwz
	BKQJnkvMZpLWEH1LuizBFvyxoVXh+q+opDwL4K8mSZHcQw6qRlQujAhdyPToSHtZ8k01Bc/z7lwIp
	wcjTdxqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7v7t-0000000DvBV-1cfc;
	Thu, 24 Apr 2025 11:52:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tC8-0000000DZIZ-1Lfh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:48:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F182368458;
	Thu, 24 Apr 2025 09:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7D7C4CEE3;
	Thu, 24 Apr 2025 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745488115;
	bh=n/inaBTjufm8fqFMcv+jCVKf3BgJPnY/qqhNvk76Af4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=im3GCitUwHN4zIlUyrDEdtPOa55IhqKlViektf9CVVeGrfS0gIZ1YWTbFqIJZESk5
	 aTJIJ8V8E4qWBI6XCtKZU40ket+NFzXwm55UXwJzzkFfL0RBlwTN00+ZKY30rBOvFi
	 ZqvJA/q3zLdtqAmvyHPu/wYHQwVKvBs2rLFzNNXGmtUkqPtF3mSRke07BSmeH3QgmR
	 7EqRprp2dIfLIMGvpe8pjdK3e+6fgWUQsKYQagQpZouSt4yxJydzh4wH1L3wngT3nE
	 1Mu6Dc0IBFlwRpG1AAO2Ebg7G8+ramLXzW90/s26lRpzH3fLO1Ud9WyNuyjwW5HUZ1
	 pc/xt07Otu98Q==
Date: Thu, 24 Apr 2025 11:48:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
cc: bentiss@kernel.org, mcoquelin.stm32@gmail.com, 
    alexandre.torgue@foss.st.com, linux-input@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: thrustmaster: fix memory leak in
 thrustmaster_interrupts()
In-Reply-To: <20250327231146.6388-1-qasdev00@gmail.com>
Message-ID: <371o6n9s-sq4q-s071-24r5-8p22o933197r@xreary.bet>
References: <20250327231146.6388-1-qasdev00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 27 Mar 2025, Qasim Ijaz wrote:

> In thrustmaster_interrupts(), the allocated send_buf is not 
> freed if the usb_check_int_endpoints() check fails, leading 
> to a memory leak. 
> 
> Fix this by ensuring send_buf is freed before returning in 
> the error path.
> 
> Fixes: 50420d7c79c3 ("HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


