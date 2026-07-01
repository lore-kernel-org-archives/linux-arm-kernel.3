Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D027DC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZMCWACMwzKqJvaEkw4AdQSHyt0FLtQuCecBrJDnzH4=; b=n9EDJLmh3uCs3ktQXz9zzxD6Xu
	uJHVGqkM62JdxTHzZ1qAi3R0P1XCsz1QHAB1qqwMYGdk5VsRV3Q1G68MOmoy110kPgdrNJOEGgVuZ
	IVma7tImgJLQmmba3vkiWCDwQAJqAFDq+IndXiORHZPLaKCf+IdzrdL+mzUFk/EAZ0iXzUeFsiy6C
	dnrTax7J8IlR4/L78z4+10H/Q+zwHRVQymqKEiibK2nBW9RyVKSVw/Hx3YQjoWDW7j0XLTN4c3/ey
	jxXfgeKZ75D6mNKogcpQs7hPZlQtKakMcIkruwEhY8rJpfxBfMUOErRdCdQ4FJ/trGfxx1b+b5Ox8
	BY6ro7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesCc-00000001JPk-3wej;
	Wed, 01 Jul 2026 10:29:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesCc-00000001JP4-12Ls
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 10:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZZMCWACMwzKqJvaEkw4AdQSHyt0FLtQuCecBrJDnzH4=; b=hy7NWC2ezsf8MMLGlueGtkcHiz
	e0ylEldcpt2jSM+7XjlD+0OLM5UOd7y1V3ytWyTuFD8j0TGVEeYJGtp/ONqSqemizVFtsbSbdrovV
	BoWyIuU8+FFU39vVbi8DDf1Y7DAb28E/cvNKAFlLadosQRQQBgmFImGHstWaH58VhNLGbhjrtZXvE
	mqnPEuZRzR/f0kTKPmF6n6KG+8EO93HMn2N474yifZKu1xB4UD29vQ8DLKNzLLDnwbVvvtZlXMMcU
	9DWnn8LYYzLw0pj/ZATXwaL+XnsNRAJAKSaD32+i3Q1C1u2h2ujl9BVTcX6nes6kfe+dh4cKxYefP
	HFJC9WUw==;
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wesCY-00000002ciO-3R49
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:29:57 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so1092247eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 03:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782901792; x=1783506592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZMCWACMwzKqJvaEkw4AdQSHyt0FLtQuCecBrJDnzH4=;
        b=AH+lshj1/C7mE05DilRX0dmN0UxhsHlE99D/bhaOB/CAH9f3h/D+NqvWSDCPq6JN8Q
         1saBvn7iJqtQpjy+QtPXcy5h8Py71xBcOkzVrB/Qi6fNF+sePOWlZg4iIUpA5MMNopVp
         Qdj/Mh6DezHCBSYoOM26II+ok9hU6jkFe4xpaxmYTGT4sawF4762DqgmkiMsg2MhHOhg
         QVUqxQc6g3oW/6ZnEFSftJbdhUBT+1I0np+yQnm5kOXDABua5jsgtSACRKEbQw3asCP8
         Q3DTHx2iyG6u2sRtT2YKjIkoguWlP5n85OrNYsYaXqAQc3a0POaoKsyYt1i+f2+JmqHo
         +5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901792; x=1783506592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZZMCWACMwzKqJvaEkw4AdQSHyt0FLtQuCecBrJDnzH4=;
        b=REwHkKR4pi8CpKVX3KISfpTya8AwoJONdtGA1AWxTmR9gyv41LeeTqdgrMGxluNwBf
         XKe4LMYOpyq4Z3FxDz8g3LSkTLbjJyXfd8E3NVm/lUaZV50B7wWyux5NoyT46N4bBg5F
         5Usr/xKquSTFJhgjRNHcwklLjOj0pxrJoVVAcp57JDtVMtd+z5U5RfgTmvxhwn9HKeVP
         rkid3kSHXFLSVsJZYUEOw9GU5m8afvPm4qSgrE/GFk9C7MnN0tMLSOK2uGPaCmalzOwq
         dlsJoLbQ/4Pu5AvI6EbA9mJFL7gqmIXe57Scp0zPfVRyKtCOucF5BNzZQ68kyxYnkwLA
         dN5A==
X-Forwarded-Encrypted: i=1; AHgh+Rr+df7ynjNbq4kET40+occj7FbemGzPfhV+5T4qPDE080ZXiMCSK8GKDT6X57PB6yPFMiA/irYG8VzQfnnCKKCg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Mf7T4WJYAxcik6atrpEadbfevZmfDb5wCMICBpS4nUdPECMv
	jOwUKzKwWYEaiDXPQBtxWEBRWvDasq1Ocy1gPIEIWi/WSowoeZY3QE8Z
X-Gm-Gg: AfdE7clPOFuhuxmL8OprCpvjXXxzchQAbDlkCxOFXFF3uOygoawxbymRIy3StgqtCfZ
	VhSAlJ9/R/oDWXIS3u8GXEJD/Gz2ZqoqC/CN8PVNM5KnXKCc84AxUyG+3ukMCiMuOAFXYuqKO+F
	bPY6a3Uo6v63sWm+w1K8wsEz++7aBRJlbqdzosU7SDfjPB8RQOuKGiBqXAlNqcZCH+GpfcjEX+a
	mDLRgSgx8Kzsx9p0c01ECTlL9J9ExLgqVu3VD9W7jxVpCfOtZZvE41jEdau21lD22saq9XL16ab
	3N9/5Na0Pv2+2hxMRiagQkDqhB59QzQz+CeY5C3L9huChLny5FhR01p+NmtZr84SNKaxqBqNqSd
	xYoWcZlefX3Us9tpaG2VM4FTKkH/zMx6deFJdsadXkekbJf0xHtoB3FLC5lNtGa2MFhE5FTXLYZ
	qeEDRVYAJJY9/pMuEzoO4/72o=
X-Received: by 2002:a05:7300:fb8c:b0:30c:9f31:b604 with SMTP id 5a478bee46e88-30eff294ff9mr1275666eec.25.1782901791971;
        Wed, 01 Jul 2026 03:29:51 -0700 (PDT)
Received: from nbai25050028.. ([2403:8600:2090:6f:c5d7:7505:b0e9:be5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm27602019eec.15.2026.07.01.03.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:29:51 -0700 (PDT)
From: Aniket Negi <aniket.negi03@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aniket.negi@airoha.com
Subject: Re: [PATCH] net: airoha: fix MIB stats collection to be lossless
Date: Wed,  1 Jul 2026 15:59:44 +0530
Message-ID: <20260701102944.246106-1-aniket.negi03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <akS48y8gCJf-EmTP@lore-desk>
References: <akS48y8gCJf-EmTP@lore-desk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_112955_640614_0C7D4800 
X-CRM114-Status: GOOD (  10.41  )
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

> Maybe better mib_prev?

Ok sure will update. mib_prev is cleaner and more concise. 
 
> Since now we do not reset the MIB counters in airoha_update_hw_stats(), we can
> get rid of the for loop there and just call airoha_dev_get_hw_stats() with the
> provided dev pointer. Even better, just rename airoha_dev_get_hw_stats() in
> airoha_update_hw_stats() and move the spinlock there. What do you think?

I am aligned with your suggestion, Since after removing MIB reset logic, there isn't need to iterate over all devs on airoha_gdm_port. This will simplify the code significantly.

I'll refactor as follows:

1. Remove the for loop in airoha_update_hw_stats()
2. Rename airoha_dev_get_hw_stats() to airoha_update_hw_stats()
3) move the spinlock into the renamed function.


Best Regards,
Aniket Negi

