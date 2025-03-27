Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8362C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2QaKUVgXkIdAEjugTud0F4/C6uqfNCTUMyQiGHLmiY=; b=gn1bg3QnkdZc2wGPJYS2agUxR/
	vFUYunn9D4DU7Jbh1mosyp+70BBwdPwejmc/wFN8/jmtbE2G0/ktmmL2e3lXGsxOvF/FC9FksB49I
	QANF5EmN/4qGs//JYP8EV9FCN5YyDwGS/qgu9h8NJ1+xNVkQk/mLM5rEB/vkptR45bK12SzjR9PcA
	IRIyhtOWods6QVL+/QezTnK5DoyjitgRkxSKICBLnTcLeDvsHH34OIFDcHa+gbX0eKhblYgsOXtFj
	LuAPxU1oMypRoZyVF1HmqowNN+QAg+xFqWbwM1e0Cvg5Uzq63Y2cYc0y7TuPBv8P72FneC9kQrGkq
	XLJkLVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqOy-0000000BZJ0-18s9;
	Thu, 27 Mar 2025 16:48:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqI0-0000000BXvZ-194O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:41:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E5844371C;
	Thu, 27 Mar 2025 16:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1214C4CEDD;
	Thu, 27 Mar 2025 16:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093667;
	bh=f+qtwl3UQE1TexghPgxTSWj87ZJ3sAnv422eko/TQcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKtv7GniKPdzWtcfkk/ebCw4lt/02NVKmw79SymGNcHew9ZzwcizWlMOKmirOargR
	 e8Bq3dDcJpkK1LLQkHGW8T9b5Wgnkb74xSCmi7s17Ua7O4QPgIx5g6BY+dQyO2ecuB
	 vykCFqPM6f+OELCrasNbJXmrsPgzBiMXAx7tmPbIcxbBFBFeJUh6LkahXB6FscXFmA
	 43IsZn8mxQRfo1vTDSJkeqc9sFbnQLgYc31KBr5gGBTh9LhuVeJe8wTRG6/5lkRnxy
	 lv+oDoHFiIqiZ1QPdryBPOOLF5axtw4VCZA2bWyKea11aRXNQOCxbFWs2RxXsqUYCa
	 bKWZWJvoxyTFw==
Date: Thu, 27 Mar 2025 09:41:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: David Binderman <dcb314@hotmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] arm64/crc-t10dif: fix use of out-of-scope array in
 crc_t10dif_arch()
Message-ID: <20250327164106.GB1425@sol.localdomain>
References: <20250326200918.125743-1-ebiggers@kernel.org>
 <AS8PR02MB10217FDBBC9DBA3A5B3C5F27B9CA12@AS8PR02MB10217.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB10217FDBBC9DBA3A5B3C5F27B9CA12@AS8PR02MB10217.eurprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_094108_330162_06280309 
X-CRM114-Status: GOOD (  10.70  )
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

On Thu, Mar 27, 2025 at 07:58:51AM +0000, David Binderman wrote:
> Hello there Eric,
> 
> >Fix a silly bug where an array was used outside of its scope.
> 
> I am surprised your C compiler doesn't find this bug.
> gcc 14.2 onwards should be able to, but clang not.
> 
> I will make an enhancement request in clang.
> 
> Regards
> 
> David Binderman
> 

Neither gcc 14.2.0 nor clang 19.1.7 found it, unfortunately.  And the code still
passed crc_kunit (even when run with have_pmull disabled so that the code is
reached).

- Eric

