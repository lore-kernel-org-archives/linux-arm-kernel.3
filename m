Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39133C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 13:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3Fuerkv9gO0H7GSMbl5vL4PK+LUH+2hMI+xyID/KA4=; b=TT88blkn754gx/mLTSUx+k8GEQ
	S3+yA13Re8TD46tFBavx76G1ou+eIiPQHjOyI1GUj1FaloDjS+2Vxn9lBgxMoOJF1xC0F0RtdBnSe
	GOWQEItLuFi3tUvf7XEG8lOt4guh/aiWalR5uzeha60uUZatINcyvfzpM5CppDEjgJwo1Iv69lYua
	cwrzC47ciDFQGMGaejHJE+xiSdi59rtS6TxMBFDiDCPakybwEaJhN44+i+feM67nm18Ma6g8yicRP
	o1+df01uTPaqD8JiJceBNnlL+B7xneFDHsDL2EmL+O/FsTBEXdiApK1BFC4QDcvDhkafxpdqc2lXt
	stAhXUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYleh-00000002W6d-42lM;
	Mon, 07 Jul 2025 13:13:11 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlcN-00000002Vh1-1BHp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 13:10:48 +0000
Date: Mon, 7 Jul 2025 15:10:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751893845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R3Fuerkv9gO0H7GSMbl5vL4PK+LUH+2hMI+xyID/KA4=;
	b=O34b06xrC9TsCQqtntWOquwXsDhTVh1hfULVM0RJXbyd/cvOnjYZ6DC7vGjwReSWsdthTz
	bVMfiRA4nC4/PKOTrAwH84W7tkoLAlxecdRF85jF1qdyG/87P3UM3/gu2/AyBe8lG6bN9V
	2vxmt16Xsqk8l6iAffxtPOhOqG5lhoFbUoSIZcPhrPwdFOm4FHxafAqpwOWPGytp+CeToy
	nTG4DolJHk91arpvSjaH1AJ0N3K7smlo16fuys8ZmwVyqYQGIC4HJ4DOLMQbjjZAG2POkn
	QriYakEuk4tlKMdBpA6rC3ZEVVgKC9nimuhQB6dP1YNY8x0Y9ettUkG2o0MhVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751893845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R3Fuerkv9gO0H7GSMbl5vL4PK+LUH+2hMI+xyID/KA4=;
	b=Nn1Otug6wPRLaZZESngm43QDgHy/lEqsVLVkCDtfaHuzz+38Z6PFp2nT/N9NzaenWWz0xz
	utWJM3wK+pVymMAA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Mark Brown <broonie@kernel.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/arm64: Prevent build warnings from
 -Wmaybe-uninitialized
Message-ID: <20250707150830-51f97f11-6ee8-4d91-840d-a7d3a9bc636b@linutronix.de>
References: <20250625020138.3777454-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250625020138.3777454-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_061047_457998_94B37A87 
X-CRM114-Status: GOOD (  10.03  )
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

Hi Anshuman,

On Wed, Jun 25, 2025 at 03:01:38AM +0100, Anshuman Khandual wrote:
> Arguments passed into WEXITSTATUS() should have been initialized earlier.
> Otherwise following warning show up while building platform selftests on
> arm64. Hence just zero out all the relevant local variables to avoid the
> build warning.
> 
> Warning: ‘status’ may be used uninitialized in this function [-Wmaybe-uninitialized]

Can you give the following patch a try instead?

https://lore.kernel.org/lkml/20250707-nolibc-waitpid-uninitialized-v1-1-dcd4e70bcd8f@linutronix.de/


Thomas

