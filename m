Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E11CCD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QrPgixzOyYGgtnLe1EBiZ38JsCWMihHn7W6U5Xl034=; b=RFsUUsxYk105r3A1RBC4hETCTt
	sLJlD+POCOrcaGLU/T9KkmW0LSVzdYndYpN5kQPaVdytkzIZYgANTDXXCkH7AbELQ3OXGASD4t6Ol
	6mN8K5oef55UKZA76cdNEv5sW8NNFI+rkce+B3/eaOue2A+8MsHcevhG2o7YDkLwjcdO7/2p5rYqZ
	S9f3CpK/C6FrZ7KkTwFrSNToJTLG6i1N/NooujNBpRaL1bwCK3Ua3VwELfnXVCBUczfvFsv29figc
	FeKKesSOg9ZHs3GcgiNtfJw7J/ptxW4dba1Bdus8231qNq2wIc4DTe59eAgAtt1vW/y6KvlxhpO8a
	L8KN/haQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCGD-0000000Fgp7-0CVN;
	Tue, 05 May 2026 09:40:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCGA-0000000FgoN-3tFi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:40:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4304B441B1
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267F9C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974010;
	bh=1QrPgixzOyYGgtnLe1EBiZ38JsCWMihHn7W6U5Xl034=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WxDotEi1ytWQaHeLaBcLOSFwmM8Dc65+ZBHFpHFh7+TkKeDFwbUi9/2ElYF1r15Jl
	 CWN+M8SkFE5ZQI1jvPoGANYkm87zfhD4POwT9Erw/JrF0Ai0Z05XGJu8+G88bmSu39
	 bUH/tosye6EkA/i6OMJmeQkIwtfDXt7wwhR75vzCYBHCGGdk93kHCLNML2FTug5jR1
	 ac6F5QH4ljIew6mb8PeCba9bUrsMVf4wL7SGY5YrvlZiUcQi+20t0ngFv21Qif3zMF
	 wqxka9BpvG2wlCxyCWP7sWoJl3QDs4GtKiT8BTLhOtV/9Bv7jETTMFWBXvwr6jC2r/
	 YtuqhzbLOzJ8g==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso5321405e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 02:40:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ84e6Eo1wONoZCbS+yyy9JcojZw9itRSkSXbfvsJbQjqFK67AVbxbeaN20SblmYBIIofp5cX4ExmMOeW2Wmu4U/@lists.infradead.org
X-Gm-Message-State: AOJu0YzG7MxryMXG2wxaRvuZFGWRyhLj/kccGARS5qrlQGlQIJwvCw4n
	QkJCJZIJ76k+FMb4qxI+a74vI5wert0GKSJmmTGORtszrnQM90xFaMHb2cjXe632Ru8Yj7w6rCf
	VMBVVlf0uhISjJjGAIPYJF33JIYXRLW8=
X-Received: by 2002:a05:6512:3f15:b0:5a1:d352:a49 with SMTP id
 2adb3069b0e04-5a8631c8161mr3913568e87.41.1777974008860; Tue, 05 May 2026
 02:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
 <lccuj5tcir57c3pzlcvyjmle36alr64zv257si4taqis3novrs@exgphqb3k6tx> <372e9718-bea1-4f20-ab86-af6f56299e75@oss.qualcomm.com>
In-Reply-To: <372e9718-bea1-4f20-ab86-af6f56299e75@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:39:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLnaghWu-TKLtWqN7zukr8teiK=ZnuvkrGzzAJrLkFu1wQ@mail.gmail.com>
X-Gm-Features: AVHnY4Kjr3DNdqnSfP3Zee9xjSplW5fYuLg2_-6hVxVBn-gXNo5J75XudvGMcew
Message-ID: <CAD++jLnaghWu-TKLtWqN7zukr8teiK=ZnuvkrGzzAJrLkFu1wQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Russell King <linux@armlinux.org.uk>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_024010_981848_F4100B11 
X-CRM114-Status: GOOD (  14.32  )
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

On Wed, Apr 29, 2026 at 8:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 28/04/2026 23:13, Dmitry Baryshkov wrote:

> > I think it would have been better split into 3 patches, but this way is
> > also fine.
>
> You mean defconfigs as separate patches? I could do that and I was
> thinking about it, but many people do testing with defconfig and such
> defconfig would be nonbisectable here.

I read once that each patch should be "a single technical step"
and in this case I would say it is one technical step and should
be one patch.

That's why I just applied it.

Yours,
Linus Walleij

