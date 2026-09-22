Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CABCC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTIWqkgW/6XrBcOyuAOlGNAiOa8BHpB9D8z7LSFGgBo=; b=LQ73/dy6YW8PVxtgWoMrf60BFE
	pg/pLja1YkvUCLqRRBq4/iJCGmbrNsEt46vL4shLaQVy4KqKqwtYgwyz95i7N+VhTj2l3YOgtfPTO
	BZJUmzRobgIpAqyJ/tQayS4UtMNBqRd9B/LDRE3yzTF9TCbRh1wdPvLtIaXxlM6R9BGgX/U+hSj2+
	rfAn8InOJT64FR8Vesq2hMUEUJLCnREjq5Dmq7slvPyGJB0Gwe39RC3Qp5ln084ukb2YGMpIYhPRp
	jzBywiif1uyyUEcEAXmlSHQ98NWdyk+6EVzU6ZgOsPGMOvenLETsZO1Ths8bX+eUmLFxx7Fd+M3ZU
	kw+THOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wWf-00000004r9x-26t5;
	Tue, 22 Sep 2026 09:10:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wWe-00000004r9b-3hIU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 09:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lTIWqkgW/6XrBcOyuAOlGNAiOa8BHpB9D8z7LSFGgBo=; b=RH8vGXj7ni4+IZj/r9D1iHDXvQ
	hXPkNR/mx5n1h1sLpH5j/M5a3NEUcNg/dEAhIPTHq4yNGdTFiV5RKClB/N858WjD4kkYKQPU4iLN6
	s86afxZSXFjoBnt7CXxJwJ0x30PqDUiXCxY1sP4xECT1bSikAoEVKZqK2G4A3YhP9i8R+NTEg6YQc
	wtBIISePyaVKK4c3ufJTno0mfpkxtW9Jf6MDWK6kVod7/HtFAUk4U5Ec0G/mHoKNPScCjDgvaKYhf
	6icmE4q4HZIRkbH82ALseG0LC4AmJLxQUN64F6JeUZp76ggwGALFN0ku6APxG1TmEUZHsjtGfw6sx
	YtUQ0Cuw==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8wWY-0000000DL4b-2JAU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 09:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=lTIWqkgW/6XrBcOyuAOlGNAiOa8BHpB9D8z7LSFGgBo=; 
	b=ier3rHDDJlJUQBz3c36Be5kf/981YOqlS3a2HBR4Mp6UH1nMuGB2PFUdV3PGqD6e7HCLBnu2GD/
	F051EddPgPc6AyP4Tp0cEY1Z6zykTt0A0lP5iQgdb2iCgbnGs45VP/JDYxSqjt38cKa3T32wRacZW
	/EschcBGB86E7L18quk5VXK0DNInRu4MmpsDeUAaiWnXmvBECDTKyYjqt5dTgZlQDJ3iNJCsdaWY4
	W3zBNPH1EkjeUdABpC+lSIQ2V9MCFH8pinyd4Kypw6TGx7j/2X2WX0QL41f84XXTb8DwvtbgqlDuw
	Yd26yyqd5pUmgQkn3Jqh1YmpRt4fPsFUHuXw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x8wWA-0000000Ga8S-1wID;
	Tue, 22 Sep 2026 17:10:27 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 22 Sep 2026 19:10:26 +1000
Date: Tue, 22 Sep 2026 19:10:26 +1000
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
Message-ID: <arJGAjRRC-5EPjH6@gondor.apana.org.au>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
 <CAMRc=MdWZhLy7AXd2OiVsaT92xTh1EF+B+LNo2b-1D2TO3rAmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdWZhLy7AXd2OiVsaT92xTh1EF+B+LNo2b-1D2TO3rAmA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_101051_874281_8CA40357 
X-CRM114-Status: UNSURE (   9.70  )
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

On Tue, Sep 22, 2026 at 01:22:31AM -0700, Bartosz Golaszewski wrote:
>
> Herbert: Sashiko still says it fails to apply. I have no idea why, it applies
> fine on top of current linux-next.

The first patch doesn't apply for me either using git apply.  Please
download the latest cryptodev-2.6 (a9a2152d292fd0bc73814eb4a127278ee7dd3f6a)
and rebase.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

