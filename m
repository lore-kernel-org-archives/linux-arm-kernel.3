Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BB8F30946
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCREg50bz8e+v9Ahd+19Jw+eYOKRxSn1rxNuRLV4cFo=; b=zircfqjxP31dIJ8OO83nO1uX3S
	Fa/pFGoyNtojVhGGejzK/Tn2+qSAPZnGxf8/JSfXivErz2pR69RUHr+OPF/UD9WrnmRR6QsRQaW3/
	DioiYTZMB76x6I+1PxTg8CkeRy/t+kP+akTiZrM0LFWmv+QW5+YY/m6SCIM8illp9AUOe9GnCeZJr
	LylE0CWUYIf81lFYQEGr5mz9OPocoRlwb0RNU6jt8tnKHn/uqiaJZuZX+0j2jBzKpPNHczukA1rFS
	yGvQ91DKVAy+mmOdPBKmVwCo5lCX/mUHTOkbixXLUM+Go4/o5SxZnYC0E4kfjRB/gKjOCMVY8cWd/
	LLuX1L4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7N4-00000001io5-10Zu;
	Thu, 05 Mar 2026 12:00:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7N2-00000001imU-1ByX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:00:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so90548435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 03:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772711998; x=1773316798; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gCREg50bz8e+v9Ahd+19Jw+eYOKRxSn1rxNuRLV4cFo=;
        b=osAcdQF0+46eYUWJZFbaxT/4nkMBifnsjMKtww7yGYt/sSYNezh6rD8rNxMaJyKgzC
         1M7mS5B9mbtNlBjUHSAoFLk5BRjEzrZ/6tqdR4RFHw4XmZanY3epMCGbHpm5pCd+FyRr
         pKGO9YLHIxim8jtck9EI4a17YGlDSub2Gr+OPAHm2bXc1c6HrA6PIIUhCa/quPZ3xCd1
         PtNCzIS9bKBtKLFZdVbHibSYgXe9v5r3yGN85s9T355Gp6g0iMgsVtBu0eRxzBOzz7rs
         eZs8igR/YKEYLI3qeFrv3bP1rS+q4CmEe1b5v9I4qTO3+RMaKKrepYRUbTdaeB/h/mW9
         NGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772711998; x=1773316798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCREg50bz8e+v9Ahd+19Jw+eYOKRxSn1rxNuRLV4cFo=;
        b=X3JwWWveuU5rhCmMNO6GocjSYclX4ccUxnhuDyxhlJHK1Kdu7QDePGzpNYhnTixj3f
         NLS+h7UKclW1buXaDNtvgvxHc0IW9zuOcGegVjrCMzKUTbLLNM2LzUu/YP7Wmh6WGuQ8
         jzGBcbfAfXLRonyEL34IGTpxFviaUAqtaWYUvtLLETwka/bAKMVJaFt/e5qBKKG6IehO
         3RS99HHdCdzXWd9K/cUxR3Cmsd9Pyo43ErCPqJT736XIuPQhZk8mLpsdRE6nXHjuVG3B
         jLs23LrrWLGjApuqDMHf/kGGTzkGOj9WWt/auFwYJnXz3iiV76FzRjM+TvxsqUEdKp3p
         b++g==
X-Forwarded-Encrypted: i=1; AJvYcCVzAarIvzzqMp1dyq3dICRXB5RNvjDjVnG0nNIFZXwp9El+mCPeE5ACYaaU/UiSA9VrkkyM/bE1yrIT2ZmTlMmc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5OW4ZzF5xm4MbduICvTzh59WXNGvd/hWRAFfcH0nJLVbgb84a
	p3je92YDQt0TKvoJ4/kZM4y/EXd6xxSJ4CE+DokbB7Ul2q3RCkUbk2AVhdHE9g64xYg=
X-Gm-Gg: ATEYQzwV8PLitwY5kMw1CJ6xwuxvNFvzFzE5wXqD9UhxHz66So4c00K47GREeN5N1IN
	jUkk8L0QgFb8ccQ9BnnUq5TLG2j07QhyrC2BYnL/WWPqhUPwts7HG+BAl6rsB3sUA93djUxMBOw
	7uX1I3h9uWEHGqYamxivcXYCMcZrivBxTXaiRHBTSht3RpUHAXhlNxRXP4F/0iDt9fnt8PCtkKH
	FBtVuTfgaPskM4pNJFUU2uA4cUpOlIUOPUyHQB8hW1IYRxu7sgGm67/8qQ/q5h8WgngNRf95Xfi
	V8CV6MTH1YjqPt9pypslDw2Cts/4H7/PUcFWlIUzjnvs0xlIYCuITNYsntMAUpyDXFeyOQbWfxi
	90AVqSoOMpxJgnii/g9y1iP5TWrloJlTH9F+WAyaUaKTKPAjPdcSQvLPmH2WERVECMXrkMFdMQl
	5oing87EdU9kYy9zOpXQN0LHVknLHi
X-Received: by 2002:a05:600c:1d05:b0:485:17a7:b9cc with SMTP id 5b1f17b1804b1-48519888633mr100850055e9.18.1772711997970;
        Thu, 05 Mar 2026 03:59:57 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b8807a4esm29845684f8f.4.2026.03.05.03.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:59:57 -0800 (PST)
Date: Thu, 5 Mar 2026 12:59:47 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH RFC v11 00/12] crypto/dmaengine: qce: introduce BAM
 locking and use DMA for register I/O
Message-ID: <aalwMwN3qMlzrql5@linaro.org>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <scr5qvxa7f7k22pms4c6k5gwiky7lhssrw6qryfngexlek44g2@rayinnnwqgbt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <scr5qvxa7f7k22pms4c6k5gwiky7lhssrw6qryfngexlek44g2@rayinnnwqgbt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_040000_352177_910BC716 
X-CRM114-Status: GOOD (  32.35  )
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

On Tue, Mar 03, 2026 at 06:13:56PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Mar 02, 2026 at 04:57:13PM +0100, Bartosz Golaszewski wrote:
> > NOTE: Please note that even though this is version 11, I changed the
> > prefix to RFC as this is an entirely new approach resulting from
> > discussions under v9. I AM AWARE of the existing memory leaks in the
> > last patch of this series - I'm sending it because I want to first
> > discuss the approach and get a green light from Vinod as well as Mani
> > and Bjorn. Especially when it comes to communicating the address for the
> > dummy rights from the client to the BAM driver.
> > /NOTE
> > 
> > Currently the QCE crypto driver accesses the crypto engine registers
> > directly via CPU. Trust Zone may perform crypto operations simultaneously
> > resulting in a race condition. To remedy that, let's introduce support
> > for BAM locking/unlocking to the driver. The BAM driver will now wrap
> > any existing issued descriptor chains with additional descriptors
> > performing the locking when the client starts the transaction
> > (dmaengine_issue_pending()). The client wanting to profit from locking
> > needs to switch to performing register I/O over DMA and communicate the
> > address to which to perform the dummy writes via a call to
> > dmaengine_slave_config().
> > 
> 
> Thanks for moving the LOCK/UNLOCK bits out of client to the BAM driver. It looks
> neat now. I understand the limitation that for LOCK/UNLOCK, BAM needs to perform
> a dummy write to an address in the client register space. So in this case, you
> can also use the previous metadata approach to pass the scratchpad register to
> the BAM driver from clients. The BAM driver can use this register to perform
> LOCK/UNLOCK.
> 
> It may sound like I'm suggesting a part of your previous design, but it fits the
> design more cleanly IMO. The BAM performs LOCK/UNLOCK on its own, but it gets
> the scratchpad register address from the clients through the metadata once.
> 
> It is very unfortunate that the IP doesn't accept '0' address for LOCK/UNLOCK or
> some of them cannot append LOCK/UNLOCK to the actual CMD descriptors passed from
> the clients. These would've made the code/design even more cleaner.
> 

I was staring at the downstream drivers for QCE (qce50.c?) [1] for a bit
and my impression is that they manage to get along without dummy writes.
It's a big mess, but it looks like they always have some commands
(depending on the crypto operation) that they are sending anyway and
they just assign the LOCK/UNLOCK flag to the command descriptor of that.

It is similar for the second relevant user of the LOCK/UNLOCK flags, the
QPIC NAND driver (msm_qpic_nand.c in downstream [2], qcom_nandc.c in
mainline), it is assigned as part of the register programming sequence
instead of using a dummy write. In addition, the UNLOCK flag is
sometimes assigned to a READ command descriptor rather than a WRITE.

@Bartosz: Can we get by without doing any dummy writes?
If not, would a dummy read perhaps be less intrusive than a dummy write?

Thanks,
Stephan

[1]: https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/securemsm-kernel/-/blob/sec-kernel.lnx.14.16.r4-rel/crypto-qti/qce50.c
[2]: https://git.codelinaro.org/clo/la/kernel/msm-5.15/-/blob/kernel.lnx.5.15.r46-rel/drivers/mtd/devices/msm_qpic_nand.c#L542-562

