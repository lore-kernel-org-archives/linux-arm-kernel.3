Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D541E63C9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 00:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPQoK1ge3az5sWfMSPCewv5xcDr179Pzfg1pOZpPjrk=; b=EFQGqXaipayKKdM3INjmmxewm8
	60YJtH5BjDTJAMclDixKm6/uL2imu6dRv97rWrpIAiaG5t8ptcv/2wBlo/ConEABDmgw9l0NwBmD0
	1U7T/RS3tJT2o1lok06WfnAt0OpUTfU0ej0kTmOUOZdZ7b1LXbzVPt2vAo6T9W56kYohXPK9tn6m6
	V4frHN4R5xwnCzMdg5+EutYFpmZG0u+bVVYSlZoRH9YJg02+3oPFeUmqVQmZksGYZjZtDI6iw/NSD
	HyZIpMD+fAhuAzzN/plHAMDWTDdM+qa4hx8h0ZgsvXkagYYPLcOhAzNqWuV07v8krkKvJMDEj6P3K
	Ly8lOcBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkAZY-0000000Bilr-0Qkl;
	Mon, 26 Jan 2026 00:35:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkAZW-0000000BilV-04ql;
	Mon, 26 Jan 2026 00:35:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 276C043E27;
	Mon, 26 Jan 2026 00:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8106CC4CEF1;
	Mon, 26 Jan 2026 00:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769387712;
	bh=UPQoK1ge3az5sWfMSPCewv5xcDr179Pzfg1pOZpPjrk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=StN5kJ9Zffbb7bohQyX5TgM0rQPH5yf0P0HPrka2oW8956lqitlziLCBsLVljcF/1
	 HIH2xlx94WbJRnekZaJiLbC+MbkCS7JSFKg2NXKiyIjZDRqJHNEmnXCIFX91gTqSgj
	 //j7N5aMGBYqgr9aXx9U9b2rKA/85bN6swIZNv4VXIBgDxL9LLI8d3f3OHK+cip7QK
	 YW0z6/9Y+yPRAoOCQ2R0d7OP3LQUP79ZtZPAWAivg5Nc71q5IGJYn91BEoaUmopJGv
	 MCppXfRv4RBZTJBp4wBtsxTsWhYZ+eHfj41f+QsTzbmhvG5wnxxC7YK18GjXT4suvy
	 t+yQFG6W2Lh/g==
Date: Sun, 25 Jan 2026 16:35:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: airoha: Use u64_stats_t with
 u64_stats_sync properly
Message-ID: <20260125163510.4c5ea4df@kernel.org>
In-Reply-To: <20260125220753.3984326-3-mmyangfl@gmail.com>
References: <20260125220753.3984326-1-mmyangfl@gmail.com>
	<20260125220753.3984326-3-mmyangfl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_163514_096711_0BD2F18C 
X-CRM114-Status: UNSURE (   7.58  )
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

On Mon, 26 Jan 2026 06:07:50 +0800 David Yang wrote:
> On 64bit arches, struct u64_stats_sync is empty and provides no help
> against load/store tearing. Convert to u64_stats_t to ensure atomic
> operations.

The driver takes a spin lock over the very expensive series
of register reads and then drops out to copy the just read
values? Just move the readers under the spinlock?

