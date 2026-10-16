Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F692CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 02:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkp4jay+o+y4zeLWoukqHKozl3d4n6FA7irDLE50Ec8=; b=wPVfC8I+A5RRGHra1dI02Eh1ui
	0U2MrWicTbNzCJbUNHU9uMDcN+JJ0uKyHJ8P9Mt8gjDBk50wQtRq6q+nLCpVMXAbO0aVJ27Lb4FF5
	GKX0Yc06z8Vd8th7mH8uWpPSdSZ76uz59K0p4ToCkMNARC2BHwx3uCKzI8HgTh29lxip/tK4cyd3e
	ICGdwlhJMxBC3mH0Swrdi6YUW7vCZFRVgEmkrNHdXZt+FWqs+uwucquo14nyTg27IjC2QUqguA0fW
	GmIFql1Nn1bnR82sxncMUvr1QVKdf2+fJ15huPzuyh9jCjeKHb93Rr0l50JMG38+YHzjn8hG27Hns
	WdnpEeXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHXS4-00000001jhJ-1V4U;
	Fri, 16 Oct 2026 02:13:44 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHXS1-00000001jg4-0cvm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 02:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=qkp4jay+o+y4zeLWoukqHKozl3d4n6FA7irDLE50Ec8=; 
	b=hqbMw4YirU+MRKpetYrDAM4kI2ncizNSLaFlxYgwmdQFHQP0YPKpd6kfgFpSXv6Z9HFA+TXy3Pa
	Jc+pkwXcC/fTJlCHXpjVn7aBL3OpMJmhOXjGTC2/hRADCj0hbcrBYJpqPgrH73OMb9dP1cLvAPfKl
	5ORpKkvGQnOI21toZuXWdjv02DXO9vtvStLxJxXD1687m7oqizRR4NbTt+6SL3JoY0OVSVRxbpVe6
	cO2H6pG2oe0Yyp235D2r1BZc6T46AEtJc6Zay6MWQeOWXkFwRgZE/L8fPWcC/9+g/Bgcv2Q9RLrwt
	QvXEuOL/WByZbMa53T6aEVcafB4YO2KV5VMA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xHXRl-00000004O8F-3lKX;
	Fri, 16 Oct 2026 10:13:27 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 16 Oct 2026 13:13:25 +1100
Date: Fri, 16 Oct 2026 13:13:25 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Thara Gopinath <thara.gopinath@gmail.com>,
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
Subject: Re: [PATCH v10 00/14] crypto: qce - Fix crypto self-test failures
Message-ID: <atGIRTRuhFILV9pz@gondor.apana.org.au>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
 <CAMRc=MejhYpC6QNXwK_cG_NuJs5XpOviK2NPsEwtnK0RxDi61Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MejhYpC6QNXwK_cG_NuJs5XpOviK2NPsEwtnK0RxDi61Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_191341_190630_313F4AB2 
X-CRM114-Status: UNSURE (   7.53  )
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

On Thu, Oct 15, 2026 at 10:49:37AM -0400, Bartosz Golaszewski wrote:
>
> It came back with some more issues. And seems I have a build failure midway
> in the series so that needs fixing too.

How about breaking the large series into smaller chunks?

Just make sure that each fix is independent and makes an
improvement without regressing.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

