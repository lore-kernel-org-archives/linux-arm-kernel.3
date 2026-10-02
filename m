Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34802CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDYAyKpyE1u9tXd1NgeesAd5uKLQ18jJ7ka9XYxEvJc=; b=4E/kGzTm16KMAsl45eAz0MZaQM
	0go3fsaoabh/UdBYBvVY2x/CvQIHS4u7Zi6oOW9wBfcwKmhhDQEEmvX3uqG038FZUbuTuXh/Q20Fu
	9beqg2kO7eTOXK4AZ6AAQ0ru4Fp1L1HSsyT27fysFLAvX0zO7Pns0RCwgaiZ8TP5p1wWwbciwWw1v
	F0Cukz0uG6cTgd6pM2XJuOJrai7NJhOXzmO+drX47wwYMrQk5ulGKMDnGwzzY4ULJf+BluAYNle+u
	1SdoQPDw3nUtpLuP2lib3r4Xfgeeal1kPsBvwqQlKGG+fF7h2auKanGbCL9lScphi+TLoT6HvcR0f
	WWItDlxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYZF-0000000AygW-10Cv;
	Fri, 02 Oct 2026 08:24:33 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYZD-0000000Ayfi-17cd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=dDYAyKpyE1u9tXd1NgeesAd5uKLQ18jJ7ka9XYxEvJc=; 
	b=LZbdrwOJL5TkDIVbq8kSrEAMiYfT4Ww/G4pCXD7WiOcwz6PkAbu8xisaqqDMPEiUc0ILq1qEwJV
	ZI0WlYh1gdZbS9whxb3plCdPkbYSWYtZA3c+9IG4EUGdKxmDGQMy18d1lC5Vl7NX54tHaf/RprsWU
	qNQxbB9XSb9Yi7Q/ZnQEtKhdIUisSmrKQhf7i/Cb0bcvYHHCTOV2j5f+ocR9m9YmcP0pu44HhtZvn
	gUAzy3opB+aeVDulac+CjWBt9znvJvASDDli+7SUw9EVdSF0OKiHB/65cEujhIwxeD9v3oQvwXq4Q
	0BD8sMXNGwZKPTrjqr3bBgGF7dDMpOFoU6wQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xCYZ4-00000002mhJ-0iWJ;
	Fri, 02 Oct 2026 16:24:23 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 02 Oct 2026 18:24:22 +1000
Date: Fri, 2 Oct 2026 18:24:22 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Stanimir Varbanov <svarbanov@mm-sol.com>,
	Eneas U de Queiroz <cotequeiroz@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v9 00/14] crypto: qce - Fix crypto self-test failures
Message-ID: <ar9qNirrzOTDLipN@gondor.apana.org.au>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_012431_303969_A35CBF26 
X-CRM114-Status: GOOD (  11.30  )
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

On Tue, Sep 22, 2026 at 02:57:15PM +0200, Bartosz Golaszewski wrote:
> This iteration - in addition to the previous fixes - proposes to split
> the QCE driver into a core part necessary to bind to the QCE DT node and
> enable runtime power management in order to allow to drop the
> interconnect votes, and the crypto part registering the crypto
> algorithms. The core module is then enabled in arm64 defconfig while the
> crypto part stays disabled by default. In addition: the actual
> registration of crypto algos is gated with a module parameter that
> default to false.

Please check the Sashiko comments:

https://sashiko.dev/#/patchset/20260922-qce-fix-self-tests-v9-0-b1aa742e79af%40oss.qualcomm.com

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

