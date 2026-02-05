Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09308EA7950
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 02:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iu/nBZW03fVjULq+MrxpfMr1b9V943jAhl3OQAJBrLw=; b=MTWefUgeOvMignalB6jBaGN8W9
	1OxgiySL74xoUp7SNUpWQrRRGNU9wDtP90AMrrzAt9LUKbSm8LkMm4ip61jRz2C2jglwkX1F4pJXS
	kHrcuYfYwWxkh1LK9jjFZa7b0li7/OYsAmazijeXBbk3NbBh7uiPBkTot+8ARBDzY4d6r88cSR23A
	UrwPgPemC43w9EOa1U++c2c6oPh4q3CDrxyux83uEksaFGsi1I6szY7edcMYzDXwStdJqN73Jc9PU
	jmXDGoyDn0IYAC+dkcsvMP5aFIDn588BsBN0CkXVGJqu3meHTNNqRntsnzgRJqdoHIN5XwPjd4+N1
	PDNdFhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnov5-00000009J8g-1E5i;
	Thu, 05 Feb 2026 02:16:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnov4-00000009J8Z-2ht3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 02:16:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A94B960010;
	Thu,  5 Feb 2026 02:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415B5C4CEF7;
	Thu,  5 Feb 2026 02:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770257793;
	bh=iu/nBZW03fVjULq+MrxpfMr1b9V943jAhl3OQAJBrLw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NUEBZuFlXBec0mbp0VKtfBm8KPqkesLGd6gBeEqxq+w4e6HD5Gw7VY1khBdw7fQ9h
	 vdnEGy8WOYp2mgPmhug6s0IhkuQ58+qzpNaOv4CjTJZeFeQlHIrjzwIq/r18gFAsYE
	 61F+GxxZMo63VBjpHMsR6bMKc1Ud//vOucuyNbNoWTa1vsgvNkyad4FyMjfGehzpyN
	 yhqUU7q+KrTirs5B46O1KZycQysvpohEEg9OYVAWn1jPr6cMz/ZcPA4wwLjomagjaq
	 20YXN9zXJdbistPoFblcKz6ByfaO1RJdI6Qgm1LpEgbaEvDAWLds+Z4RZYvBl9ZYtF
	 T3c8Xd1fHxoCg==
Date: Wed, 4 Feb 2026 18:16:31 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 danishanwar@ti.com, rogerq@kernel.org, pmohan@couthit.com,
 basharath@couthit.com, afd@ti.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alok.a.tiwari@oracle.com, pratheesh@ti.com, j-rameshbabu@ti.com,
 vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
 krishna@couthit.com, mohan@couthit.com
Subject: Re: [PATCH net-next v13 0/3] STP/RSTP SWITCH support for PRU-ICSSM
 Ethernet driver
Message-ID: <20260204181631.3a6f7392@kernel.org>
In-Reply-To: <aYN0xmOIaHeAvWNI@horms.kernel.org>
References: <20260130124559.1182780-1-parvathi@couthit.com>
	<aYN0xmOIaHeAvWNI@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 4 Feb 2026 16:33:10 +0000 Simon Horman wrote:
> I notice that this series has been marked as Changes Requested in
> Patchwork. But overall it looks good to me.

Unclear who did this. So I've applied the series..

