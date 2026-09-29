Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69A4CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=; b=HFBkVsYayxyz7j8rSIsgRPtpHK
	jXLfudXsJbBtt9KZDdIJO6GzvUOfK2865VO50kEqangi5xKYlrN/CdNFoWMp8GV7mK0o9uF6VkHAt
	a5Y0ORb6OUKlSDDABSd3QDgFVZvrFSRsb1nD2AfwgCm2fRU3xFSz+ZfiNVN5Z6jyihNru6MVstgWW
	fQVtBErc5/QUbhxiiKMPsEklRokFuzsXaUE7IU1IhkIXUuietQqephv8hoHnAN8K6t8XUkaOF0z2c
	L17XOD65fjRCHZHo7o9FgOp5q9E8ir/paCBQ3sQEXSbsvPc8VOPOffQDd7ZIZQOtkEYLb/xzLusv3
	Ey/KSotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXmu-00000003f27-1m5a;
	Tue, 29 Sep 2026 13:22:28 +0000
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXmp-00000003f13-48Xw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:22:27 +0000
Received: by mail-dy2-x0d.google.com with SMTP id 5a478bee46e88-34b590a5b5eso707453eec.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688143; cv=none;
        d=google.com; s=arc-20260327;
        b=WT2Pl+jzTrWMpmsb7I0mLdBzorxnG+AB7kdy4n85HHlWVLX3f7KODeFsSQ6MAMyugI
         YFiuld0wG76BuZ/m6tiT/67pqUL+CkUsjQ1lgdh4dljFg8BimpIiJMPT9TkUDQ9rnlFp
         f9OhKbBvAVMCCkU3ReZbLSKRlOqlZBbmG7nKPXaOPqAx5vNNaoER32wM0CwvgD4uHsNG
         cuWyY3ySZxNTd9bgInOJxxYFOQYNnL+qQfnkJmVp5TK5jq7TeZhHfD2rzFLXKo0O1jve
         IwIsGxqEM/BkIZO3YZ0XaPOqfKQFkgKDCKXhRStisTeKAdefG4st5P8MZU40BaELre/9
         wd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=;
        fh=EniS6P4DjQHC1M+5WGC7/rzc/q9Z5DwjdQaPHIeCmFg=;
        b=q5f40fTvsdnM7SZTKwElzqFFhbEBlEirmidh9n2GzvexK5oEJEou4mzsJPfKpJ3fRa
         naz2O3so6nlVhqcnESGl+ofj5QMZI7spw4PYawocElE+vHEtzJRb7J05RDbP9zBQk9iF
         YYcbUV7vL+TmbJ+jKq/2fhvE7euwBTBS0w52D+hQ8ePdzpEOyPqEiBzg3xvlbb4DafgW
         zWRB0w3XMtkRTnrxD36ZmA30QbIzpHyK1pBmAkSOE0PaSpM82sAIJIkxeUgVLIfeo5NE
         B8uZiRlZbDd1dd75doxFLx6Ew49sick9v7LAULRKgbUA2xpRaDWglJvMSPHJ6RJKWXQh
         VAzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790688143; x=1791292943; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=;
        b=DUA+sjIf0zBrtRBB/uR6/66UnQPM38scudhewW2NrMWNfArNvnhrU7fffUsfpW01Vq
         b2X5CaRDdY+WKP7ushYtZ7TRRB4kUrasoWI5aLGOG8eZtzAmJz/089NNRmWgxXhaBkCg
         TpNZKTbcFb4kh9XsupZeZ0T2W3uI054Wm6ExJwYZKLf0zz+zUGpdbATSjXAvwtrX2XRJ
         OJGKkiZKP3+++L0Avcf3dx7iCHY4IA/37vGD47YVMcUlSgjwIcx3Bhi/Y2D7pjyUiVdL
         L8lP5e/aPjTtWihbVKkVTe5dvrZzME29gAlcPywzEHXWm67ugUYUujRETf/qbCOAHEGb
         eYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688143; x=1791292943;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=;
        b=TOAD36uUrZCAbiHdCjwiwCguFlTVzuDM8ZbYvG9h1SPbn1J4K3Y1Yhj6JbldJVq5Jw
         SaZE2587V/xbm2EwLHMPt7kNhLvE9nYUOtPpxUCMHY6tqnb7IVBN3Oy2P2pXJo0ughzq
         dRK1MYLEW0XIFD1XjlQNiLxQ6GFA/HQ3JPwU+1ncfcpSW2rVylvVLqxNPCx4Zuy8CQZc
         iOy27p5/I20osPpygt2RBZUZYeDe4+h4NB5GwbZQkob+mDdPMwinkIPKsLMP5RTKJGYR
         w0Z7Sjmu5EC103Z3z5L7csW+96UbmKwqgA5w0L21nVgD2HCAcwpEPunZQ9S+fYez5q2E
         jd/g==
X-Forwarded-Encrypted: i=1; AKwUvByGvCr3msSkw2ELTFdemIWdNnJmQdQqfOtXD0BohHxhjw5VWSwwY8HYRFuJdsWYmjlkYeKvhpZcER5CSjBxltDT@lists.infradead.org
X-Gm-Message-State: AFq9FYJvwU35671V8zDSDawiW0drimua2fTwbtRymzryL9WjUhLOC08O
	8/zs7ENezaIc8IvMON1nwwRZkefRpYkQBI7Y2av20uZMOkvwrHGV8qy2/i4cxvmBHKZN2cApn/W
	58UP0CkHfSkxEGGjWK9jX16ZJsb4HW6c=
X-Gm-Gg: AYBFou09u1y8a30ImdJjTrtRGrEyErMZqlsfBu4iHVTnCjhN9j1HYXD92Dcu01dEDdE
	3eZMEZDs3gbE02AJts/CgKKsOclrp6tP9vX9O0KbNK6n4Sad8JaYXPOLyyghD0C3998vNxVXDQ4
	ILxfKj9dY/rhWG4aQG79eYyMtc7wskvKSG16V3dhtEA7ojBmOPero3Xdl+BYX6vNko4iIbU5yy7
	iEqXI7FN+bkDZjxuc/T1o2dN09TFmA3DJAJoU+OrFqiNc2bw9nVp16AYxnHev7YJkvf9zqlRPhQ
	Prrss3Fe8GTuMd9HSE7c4AyVr6ouJa6AiNf8m0q7lqBFwJjaqfhNEZtxzAMGFot3HSunsCZlduA
	sHVor/SxOiilldlIbXSfV1zgv+CRmt18GXYmpOlN8UTvs2/6p3mGbkQTAckTWXxHLQMaOMEyNBM
	ukt2ugwF0m2CXdI3397vxMAzpR2+XoEr/4qsytt0PNaskdSkuwEjc=
X-Received: by 2002:a05:7301:1501:b0:343:fdea:9a4 with SMTP id
 5a478bee46e88-343fdea2578mr10273152eec.28.1790688142453; Tue, 29 Sep 2026
 06:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-apple-m3-nvme-v1-0-5e832e2f4aa9@jannau.net>
 <20260925-apple-m3-nvme-v1-2-5e832e2f4aa9@jannau.net> <20260929-debonair-busy-hamster-be2fda@quoll>
In-Reply-To: <20260929-debonair-busy-hamster-be2fda@quoll>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Tue, 29 Sep 2026 15:22:09 +0200
X-Gm-Features: AclHuK_jJoonbrdcWTM4pJ6-SA0D9nOYSb3Qq4ribSs7qfnRaIDq9x1ahszR1jY
Message-ID: <CADo9pHg2JyGyOA=_6orXdhDwj7NaKRBciyQMG2w7fQcPm0MNwg@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: mailbox: Add Apple M3 compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>, Luna Jernberg <droidbittin@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Keith Busch <kbusch@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>, 
	linux-nvme@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_062224_030987_50236345 
X-CRM114-Status: GOOD (  15.76  )
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

https://youtu.be/TPwe53kCJuM

Den tis 29 sep. 2026 kl 10:21 skrev Krzysztof Kozlowski <krzk@kernel.org>:
>
> On Fri, Sep 25, 2026 at 10:22:49AM +0200, Janne Grunau wrote:
> > The ASC mailbox on Apple M3, M3 Pro and M3 Max/Ultra is compatible to
> > the mailbox on M1 ("apple,asc-mailbox-v4"). Add their per-SoC
> > compatibles "apple,t8122-asc-mailbox", "apple,t6030-asc-mailbox" and
> > "apple,t6031-asc-mailbox" to its dt-bindings.
> >
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >  Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
>

