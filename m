Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291F1CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VADwhSMccUimO/ZiUkIG922aevQQ5rz0rj8ZvS19iM=; b=Ipn1kZ/raN/aviUOy4s6dQV1VN
	I+RpQHy6EK9ZBFn8rAdrLBgUdLmmtGNBwcVh3JcdxNMWk6iytYtoFLvOwHJ1yEUgfdxrE/refFC3Z
	vSPlOXswl+rN9uw7ysdME3ozFI1GlPfeHdeMt9cyc1N25Z4x/f6SjV4wfd0ZQIy0PIGD4bDzXmQGI
	674IZa+WyECMbmDjaxxF4kTYQqxlXwq7u/A3jQ7nOhZmcVBJ1jefQrfI5O+IEvIjAK3jptB1juYZV
	W6ta3TRwH6vWfYtTavq9Sv/A+oSe3GPxYvrD2AeZ0D31pQDLKtP7Ha7TfM+DVmkzJmP2DH45oxAPU
	551cR5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdNu-00000004MQX-2WtR;
	Tue, 29 Sep 2026 19:21:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdNt-00000004MQL-1Yki
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 19:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9VADwhSMccUimO/ZiUkIG922aevQQ5rz0rj8ZvS19iM=; b=of18yQh4MeUyN0ZFpTd1Q88927
	a72qC80/nOJL1FOuWLjrh5awNWCayYRqWs3XgkOeyxn+pHUPEcJDHgzZPFicWsVpphtNpY2LjAESw
	B365e4B1VfQ4pi/dPYCKrWE+rTgLXNV5KoLTenhaRhAyWdjiYtnhAUav9Yd/ppHH97m2zeWbvstfH
	Tjf5jlWMCdErlIj1PqDyi77MUPwIINu0qU7KiGdoBhv+hnxSr9FxcaQ2pTq25LQJbETDu6OGYXNsM
	XFaiMT+M2acIgx81H5aJcTyt+ixbg9dxzOT0f/hmkWdRnQHQF5YMpDSPCpwvVoPLYtEl5o4BHMabU
	fzbzsucA==;
Received: from mail-qk2-x0c.google.com ([2607:f8b0:4864:34::c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBdNn-000000030HM-3vXn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:21:00 +0000
Received: by mail-qk2-x0c.google.com with SMTP id d75a77b69052e-5332b967eb4so31308551cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 12:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790709653; x=1791314453; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9VADwhSMccUimO/ZiUkIG922aevQQ5rz0rj8ZvS19iM=;
        b=SoswJY1kfwfzIl3uIn7mcC+mBKMTbVjLXo7g9eBxQlr0vNXrIMavd2OLZ6DYwvZQfe
         FKNPDfxe1VspOkZOnnp0VURpIexALdxQlQL8B3OFrgoXSYaiMl45Rm/ncrbL6Hui2SMs
         z3gcaz6Ju1mU5lzUv5o19EI0rN9EGPKGzNGHvnB0eQXffg2RIifWLEloNAi67P4DOCvi
         CN1xXX/piAjC9n4XSqRSjlxLp4oZuO3G7yZ+1zeXDkEbTkkNccdkbAtfAiOnMpCfiLPy
         eW1zCA8Se10zEisEydMkBJsy1oFh7YelqQTM3AGbUp9YClyr5xLnIHmGE2d6c6YwtWtK
         /a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790709653; x=1791314453;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VADwhSMccUimO/ZiUkIG922aevQQ5rz0rj8ZvS19iM=;
        b=m/uHC5/SG/5V+YWHwD08bhJOuIZGXct9yRFO+2VDAluoyxKmq8qdW+fWk0h0fGvi4e
         5FxdmCvjrFe2GPUnZ1pwVSKVKq2PpKQCsC4kVOZ9s9L2U8KnCuq/1v++f12WqhlQR9Qd
         A/cVgyFlul3+CJBrnvOUBS4mrVs+k8R2FlkBw17ICq2P0obPJsRVDOoNKL9HesUpC8E6
         iOlu9BN0mRe9UwigC1kh0DojXf2PX9ALSzZXV5OL2h+p9ir7dMdLV6jyX2rvPEASwKhH
         rbE99w9hnuuwhX3MuBMwZJ7Zjwqh0q855/241IBknhEkoUS4am7JwLa73N+dqvl9FQmw
         AM5w==
X-Gm-Message-State: AFuF++kuK44eMGsalQ43bp/kKyVnwXE3jjk6pP9nfvExudW2avTXteFg
	B7nBFd8DTtE7Dy8oG/JUyzY/5qTovIbBt4Mdc0oG6gVF4D6wsROVaOmBnk5oP/p0dqI=
X-Gm-Gg: AYBFou2x+UwKT+UDSeC6phb8gW0oXkwx8lUhoKZbuJVgrTasB29Tj5Rw6AtvQUweK45
	zZSNwq7gYSGm8ecxR4PmTGHANgs60bc5s7OGuLDmeZ2DLc2xrQwrAj4L+55q4Wfq9gn3D3vFKs0
	ys4OZg0aak+48mjOmorag04nH/PmUzHibde3ThnvJr79Ix02+Nr2HePjBocusG6ODW5bplyWiYq
	zrL+TidHso2w4H4umjlP6OSdmZS+k3p8fFRXsSKEhSXhjOCHPeMLMbWoAiP7ogRU/PFK6QvgbSd
	1+ycSVCExRdMd8aETESdnCLLsBuoMw6cCCcoW1wJe+asbtcjHsCFy8BxQj+YkgQwKGWQBvPFdmv
	LtpQ3FJsZIrKgkACynUcEclNtSI/qrnsPIjJZ4Stn5U5ROVuUp79tmjQ5eJHbYBa96ObJ/9yrTB
	PyO/mLH4L9Yibxwh2vAi211BxVw+XdMOuwzbeUdvDxg47t
X-Received: by 2002:a05:622a:903:b0:533:3f92:50f0 with SMTP id d75a77b69052e-5336a3a0ab1mr5522681cf.27.1790709653176;
        Tue, 29 Sep 2026 12:20:53 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533699882absm2723431cf.4.2026.09.29.12.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:20:52 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBdNj-00000009r7r-3fqI;
	Tue, 29 Sep 2026 16:20:51 -0300
Date: Tue, 29 Sep 2026 16:20:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH v2 0/3] arm64/virt: Add Arm CCA measurement register
 support
Message-ID: <20260929192051.GN163130@ziepe.ca>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_202057_001641_CA53DE80 
X-CRM114-Status: GOOD (  12.70  )
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

On Tue, Sep 29, 2026 at 05:57:46PM +0100, Yeoreum Yun wrote:
> This series adds support for Arm Confidential Compute Architecture (CCA)
> measurement registers in the Linux kernel, enabling guest Realms to
> access, extend, and expose measurement values for attestation and runtime
> integrity tracking.

I'd prefer not to add any more tsm_measurements users until we bottom
out on the attestation subsystem.. Mainly because it establishes uAPI
that doesn't really do everything people need from this stuff..

The actual code seemed reasonble from a quick glance.

Jason

