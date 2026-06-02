Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ED1CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqqoX5qQzGE5eNHSgLyrNrWlqXnwPa/uOKYx/N6zAZQ=; b=TQp5KYYETZT8J+5IZZlfYeiDJd
	tNUpNfxAnvsbIiMjDRr3q33r2wxIuxq9hLTxMPj/dSyjjIjzm6F3V+J2luHygiAIVif6wxF0OAhxp
	9F/Vb3Vl2rvA602QFbFA5YgzdPjqcuF3tKG1luLuhLt4RbobgHMP/s0k094bXjc0WTsFMmsBjoPPw
	oeODa0x+IOEFKKjGU5UAuKP6GdROWj6PXv/OUQxuVLH0QkR4qcZkaoJxsWMsfY7fbniKc9tn8ASwz
	qJUbOzNbHwgGwkgj6GLFoOh21yiKfY3Jz8r4Ow2i1mk67mdhB8u+6vFnN6Gu7qyWJKo3WfhrZO5u1
	gOLApujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUS8Y-0000000DTT8-1VOF;
	Tue, 02 Jun 2026 16:38:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUS8V-0000000DTRw-47vf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:38:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490b12270b3so7674145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 09:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780418318; x=1781023118; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SqqoX5qQzGE5eNHSgLyrNrWlqXnwPa/uOKYx/N6zAZQ=;
        b=VJmAO0IOPwh1JIJ5xqIGsc+SYTvdg+3hJUh5zB7vFX5J7Ytuk1YvGIqZ34vf6fS7h/
         alUzX0BAqr9P1uB04+2G9Zov5HJzpXTD/JE4WxkEK8L/ULX+H9aK6Rw6EDMTQF/7dovK
         XiQMuDgFMp6tq0RUcN8onwPwOcTH9PFG6jyGR77DyNmPAcqEGxqEqIkqhwJGQzy9PvKQ
         gtJybqk0/W6usxw5+U8QSuOPidHy1N1/Tloo8d3fj0crM1DPBV7UF5GK3Rw9xUyks9NB
         rdnaq4HRlwVfiGwmA/D7g2Lqt1aqditaMn5Eguk0BF4WkGxRshgIIOQ1CZft0dMoutzv
         TfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418318; x=1781023118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqqoX5qQzGE5eNHSgLyrNrWlqXnwPa/uOKYx/N6zAZQ=;
        b=bmxsBXRLylUBzlZrKfHUE85jTHooh1udNTPIEVbhc9NIAUx9v1IBMNejDmH61NKlcD
         tt3FFHkx5x3t8yRqFDYECCfPX3rTG+ok2NqbAo15t8KmwkwQGTwo3yQoLmEXc8PSf5YK
         mGbIw0/syKSayC9DG3UjxTw5eJx3MUZZK4P+eyNAE//EWcwyCvaVO4e8FJue1+jTkXbN
         YCqKnzLuE1X4yNjJhsGItGbocgkKLAdHsYZYtLg8nKTeubzyWSvSkiTEDcQjum0rdKBW
         nKksgQvarJMaTGwdpY1Q8z3LSZL7gGQkg2TupmI2zrGE31+N8FvozPBDmDYrXUZSkarZ
         BSdg==
X-Forwarded-Encrypted: i=1; AFNElJ/8PLPLnwIEhsqIbvqLvvqKVLdgQgDOEItWCa3WbI4zOmIGuuxIXlIO8QlBhbTMwbaQfVyaGRGuEmA0vjQvA20/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywed9jxHasUANR3sVPRXdaaWvQ8wj/TEYFA9l9DhNQ98Z7kCBWD
	3mc1FC5UZOxihHE9o4/bblYkTgHI9O8mm9aHS2khC2RgW2rUMiiaIMP+YHdajzQWk4I=
X-Gm-Gg: Acq92OFodwgu03A36JSmhMGgt1RFmD+8Qh96R78Odjjoou1imkO3AZS6jRQ7uJzGIOV
	CUY040hGJ53E2b46/y8U6SRQKsio7FZe0QfbWqHmwh9atzgeP0/MCa4JvE1q4hK3Je4CRTlFioi
	3AkkbwguUlTpFAJlEYo2Vj3ej9UXeabTN2LlsH7pcRL8t4eLb9Yx2RtbtTfzfGi5pgNPvao8IsJ
	J7tpYth6XWEZuqpKv8CsyF0LHw7zYeBmsCT8iLyeV9/d90qOQ/Fzs+7HJ4RPdzGI1bmXEDJGCus
	ZsK0k/opM3zGMiYGGs2mJ4/AINaV9kzKZcQf8IGjV1y8S4fJlSewppakDF0/dZGhRBffXELGWa/
	MCMhY2T1Wqv7L2CyTrl0+qu+WWYQ2bMfl6Ou4SmwdKdFL66DXTUPCmorE7jw/IiPtBdPQyyKumx
	hY1FxjVwu2m7YBaF4KeSBYKFVT+8gGlpEX5BXEjO/WvHG8Uw==
X-Received: by 2002:a05:600c:608e:b0:48f:d1c0:5cd3 with SMTP id 5b1f17b1804b1-490b5065ee5mr8757815e9.13.1780418317804;
        Tue, 02 Jun 2026 09:38:37 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:9db1:6daa:c0a7:d3cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm407269f8f.10.2026.06.02.09.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:38:37 -0700 (PDT)
Date: Tue, 2 Jun 2026 18:38:21 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v19 00/14] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Message-ID: <ah8G_ajPS1KhgPP_@linaro.org>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_093840_047822_53EC2609 
X-CRM114-Status: GOOD (  14.82  )
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

On Tue, May 26, 2026 at 03:10:48PM +0200, Bartosz Golaszewski wrote:
> I feel like I fell into the trap of trying to address pre-existing
> issues reported by sashiko and in the process provoking more reports so
> let this be the last iteration where I do this. Vinod can we get this
> queued for v7.2 now and iron out any previously existing problems in
> tree?

Thanks a lot for working on fixing all these issues!

I agree there is no point addressing all the "pre-existing issues"
pointed out by Sashiko, but have you looked through the other comments
for new issues pointed out for your patches?

Out of curiosity, I was looking a bit at the comments for [PATCH v19
06/14] dmaengine: qcom: bam_dma: add support for BAM locking [1]. There
are 8 open comments there (Critical: 1, High: 6 and Medium: 1). From a
quick look I would say most of these could be valid. The critical one
about the usage of dma_cookie_assign() sounds a bit concerning to me, if
it is true we would be basically breaking parts of the dmaengine API for
consumers by inserting the lock descriptor in front of everything else.

[1]: https://sashiko.dev/#/patchset/20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a%40oss.qualcomm.com?part=6

Thanks,
Stephan

