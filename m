Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEAF107BCEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 05:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJmMBFmPGqTHkDwG1rY3Bg/JhJ5nB1wazIAAkQAXfx0=; b=IctkU4+hd+WSYzPUKu36ZpM/C6
	aU2swFTnHl/9Q8T2TYPFqDPZEmusRXtd+PKyYx2xt/y3cj/uETeD87CFZQApTOfr31Sil/eSfsn6F
	2eknCo09gFHj4/OVxxC9vOZGBvwEhJsWspCD8wZDweNMcTnKTpFux0Pmsyt4tF1NbHUDBlZCUIZHZ
	LCwfs9lKoTYRXKvxVOwsRgY9V3Wb7axnXmPsbx/WfzCJhl+hJVcYvbZ6XXfPb5DLlToVVb88pqMbs
	Ue2N5GBfL/c/vEoQCO5Uk4QK/ivQh7rkSbVR1D/PK0WDp3tF9BjQkU6ZPZCWAybseJmhMJ1kpZICN
	pjw4YT2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HNF-00000001Wbo-0gj3;
	Sat, 14 Mar 2026 05:17:17 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HN8-00000001WbL-3xug
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 05:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=EJmMBFmPGqTHkDwG1rY3Bg/JhJ5nB1wazIAAkQAXfx0=; 
	b=VL7CNb6lp2XD/NcSdTvMXNT2X57OWml7UIRIHUL8ATFY3RP3+6UAbn7Q5DcE09I/KebSnOwt/T/
	SAKA7Afa8hKcKxvVYGn4ehAAfUt3ZI7YbSKJswq8TfR1CVgA57sLxQvJHnDW4RCT+ovR4qZ7tZo0Y
	wcKlT12vrHjge7iPoHj1UpqOfve35HdQlxqllfUk5aAuD5begJFDslFC0EdbXpeJrolECDWUbSoL4
	WeDJ60F3sTEgBA4ZuuerXkYPLrdOozK/NiYT5ume2XkGcH0QLCDOcW8zqlebww9ZVBPrljWNbzpAn
	wxcWLtENIamp9FIIk4rS8E+HpztP3Libc/hw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1HMt-00ELBR-0i;
	Sat, 14 Mar 2026 13:16:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 14 Mar 2026 14:16:55 +0900
Date: Sat, 14 Mar 2026 14:16:55 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] crypto: testmgr - Add test vectors for
 authenc(hmac(sha1),rfc3686(ctr(aes)))
Message-ID: <abTvRwX7p0msmGI8@gondor.apana.org.au>
References: <20260305201036.63280-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305201036.63280-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_221711_746250_CE7452E6 
X-CRM114-Status: GOOD (  10.14  )
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

On Thu, Mar 05, 2026 at 09:08:20PM +0100, Aleksander Jan Bajkowski wrote:
> Test vectors were generated starting from existing RFC3686(CTR(AES)) test
> vectors and adding HMAC(SHA1) computed with software implementation.
> Then, the results were double-checked on Mediatek MT7986 (safexcel).
> Platform pass self-tests.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v2:
> - rename aes-generic -> aes-lib
> ---
>  crypto/testmgr.c |   6 +-
>  crypto/testmgr.h | 221 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 226 insertions(+), 1 deletion(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

