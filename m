Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527FFCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2l/w1/cJtGJsDYl8CqQ6vSAImyUr3hMkhvRN65B828=; b=ezaF5WjQQrAQ0YdPN8jDTh/XVq
	yid1Ou8HMl4jYi0IEyzYNJIcRbIuTm2Gtd4S8xmCc6K8K2CZEA7WqJJ5/A7bRqJ/hwgQGwikwCFY+
	URnxCLembBiNuRMV/dDZKaRDxugXQwn+BDxeuHrWMYIk/vXzMhiQcQiBplqumTpv4EJqdgoq64kfR
	0WRaxJDm3XhNfSsKnGdLOPwT8LYiehH2GdNkW2PyFQOiJJPohd44yfFjdrMLm8MM9S7w1OQCspxJF
	AhCjBiWntkv8PhHocRLso44oxvYvgXtFPGtS1dcuGwtm//Uiu0n1SCtDabeDQlNyokZx1lcfUVHbD
	e8Zrto/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYWr-0000000AyKR-2irw;
	Fri, 02 Oct 2026 08:22:05 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYWo-0000000AyK0-0xyo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=C2l/w1/cJtGJsDYl8CqQ6vSAImyUr3hMkhvRN65B828=; 
	b=Qfp54zQhoixoCFlxVrDLFxGBc0HoMqLKbl0AZMv1HsPy3CO8DbKVrOQgCqa4Y0H0o/6LXhZgcsO
	EZV6ytea8VJiSMA7a4QHpGzY4/x5yvr0kQL6bCNyqMHBMxRAY7CwTNKYzbV+cP5V1YTenPwlsHoQp
	pAdExIxs5jototGTZkCCA8NdJkuvscPfYx4+u4WU3M+jWjt9XnqjrqeAgD6PQKjdTQH8vtKUNZM8p
	ykw36km27G705FoYbB0uXEBQmtk3DX/ZbCGY6zbFiFUbFuglhiS7thVOYC0f4FNSLeQQTSVPTQGlf
	SjJR1lxcCgdjK2F2jwiZJJrkLIlS8dYO5e+Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xCYWV-00000002maY-2W3N;
	Fri, 02 Oct 2026 16:21:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 02 Oct 2026 18:21:43 +1000
Date: Fri, 2 Oct 2026 18:21:43 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Stanimir Varbanov <svarbanov@mm-sol.com>,
	Eneas U de Queiroz <cotequeiroz@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v8 00/14] crypto: qce - Fix crypto self-test failures
Message-ID: <ar9plydRjLKihyij@gondor.apana.org.au>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
 <CAMRc=MdWZhLy7AXd2OiVsaT92xTh1EF+B+LNo2b-1D2TO3rAmA@mail.gmail.com>
 <arJGAjRRC-5EPjH6@gondor.apana.org.au>
 <CAMRc=MdMbAw5pfOOnV0ppdZyKqFe8c+ypt0e92vZqxhO4dSmGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdMbAw5pfOOnV0ppdZyKqFe8c+ypt0e92vZqxhO4dSmGg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_012202_274327_67DD216E 
X-CRM114-Status: UNSURE (   9.20  )
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

On Tue, Sep 22, 2026 at 04:52:36AM -0700, Bartosz Golaszewski wrote:
>
> Yes, this does help but does it mean changes from cryptodev/master are not fed
> into linux-next?

I don't think so.  I just checked the latest linux-next and it
contains the top commit from cryptodev/master:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d4930f6e1546a78d77ed881fb022965441eae937

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

