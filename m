Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD2BC83038
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 19:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmZU1CwxbYdxvjVqnDRbR2hmU1JLOG0dDJmR8AN044k=; b=iAW1Q/jXIwqnB3lnZxYxnkVmhV
	CHKlxVC9xz9NW8n/7NRlcs1uMFzhvJh6dbBvWZr3GkGALQkqvFMWvSNfqL7hr6qza/fWcCi+E+zpz
	i841fU2FTdlYwnK1jiOQw9h2bVIFUU1yA4Y5q+0WFd0ypWzRyVDpgNoFAp59RMHDMZ4Ybgpvptmis
	f70a8DWhrLWgv71YYAgZR/M2glIGeOCik0gma7j4g+NCSQfm3vDpcEOqPhDtbpjrvJ4Nipo4Au0XL
	jJngeVjeY7YSy8EI4YQQJYbl1VC5rkiLvoa5NgNaIbOjt6uf8hkV3PF8MFSDgs+meZjPx89AvMtL8
	Y/y1mxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKPf-00000003Jww-1DWS;
	Mon, 30 Jun 2025 19:43:35 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKNK-00000003Joh-2HLi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 19:41:11 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-73a8d0e3822so2488186a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 12:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751312469; x=1751917269; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YmZU1CwxbYdxvjVqnDRbR2hmU1JLOG0dDJmR8AN044k=;
        b=owjahl2CrVgBnl/5hHaYrLaLGSBurbcs4U56CS6umg/CoUndKl6jTqdecaUsKQGmG/
         WdFSth8yMmoeQIQV+c/2ZHlt4B56KtdRoHoTzr1oBGxeMMYuDOylfvFZk0uujOCZM+zm
         cIKwE7gMLLP1HVB5RSQmfpH5vBbM3vnLDD0QEGyAX4gymD2fhOm5Gv3CrlVY1+MF0gyf
         iBZFOe1pCjbP2ZDL3GH/fMUVVeYhCY3Z1VEQ3Ipw4i69S9aBQMf69rmkgcFdq3Iso3yF
         a53OAu5PGJ3y/s4gXQREXOweZUUF3TpklT5yK8L2PkfPKcYiO4WAQtFwbiP9BRBuIwW3
         eIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312469; x=1751917269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmZU1CwxbYdxvjVqnDRbR2hmU1JLOG0dDJmR8AN044k=;
        b=Te0XvHm8SlfRtejyT+Tu/HS2LdR2XaZF14a9f0V84bIB0E20K8iXKQo0qHZSjZyHuF
         RdSCTJV8Z9iSybT8ZDtFJlzxkoECs7Lq3pf6KfWOgDup8WO62lTvhckdY8CfwzkXXpeR
         pKwdDEVW8O8SOiuNFMP9AAYVKp00I8dlje7Qasl99SfWVmL5TEWVBAmx8pyAmH0pmMQd
         uAD5meQmdh9DvskwTOvsiIANBeTfl0FJQLxgL8QCOUxv3S9rjlj63dhsbdmRPAPSfXIR
         +yupBKeoNCwXlYm0S545ABZtqkoPMbzZkaLuNSLKzs3zMC8vQ9t3q8ixzMj6yPbQBK3m
         xDqw==
X-Forwarded-Encrypted: i=1; AJvYcCXiTVjYZhwV01xxj9TPdduvXO0nCsW0a2DiHvKdOBiD91IQPKg42BwlcC2nbR7fbo947gD6vEYF7g1mGSOZA43S@lists.infradead.org
X-Gm-Message-State: AOJu0YzLjzATN+vtFgDD2gEB4L0USz7/m5m48aCWsO7rpBMOX+FSsTOz
	pzhGl80BRBHd2iqQY/5f/6IIXZh2RMM1xdIB0oK+6qQxDt+nnpEE60/rifonVcSXvyE=
X-Gm-Gg: ASbGncvVNYD2AkaeBMT/wDgotQ0A58deIlzfrTlS/9EdTmW4a+1VF8z8iF6YQ+j/nF0
	FpiOIV+sNfndbvHEYv7GOOCJ0qNHTzlzz1tFuGBuD9nNHBR0qVnAf7duJTkDe6rmeC/9yWnmFvM
	Fz+PdnlqzEF0BNnVbYBCjU/JMv65JHfrXNMmaagHbTOLrCWFykgwgcAJKTm8F538nkFPdPAdIsH
	VQowRRMc0QsCi2Sbi+JMOf8cNvN3u43l3omxa1cE7QK36jkj5KwH+HBfbAca3MsY2ZISi1YDuaZ
	8V0s16hMC8b2COPLJhtbWE9sCoQG80oeaJTZ21ddFVZ9Qg5DmwCkAPBOnWqc7rKmGN3l
X-Google-Smtp-Source: AGHT+IFCr/h/Pq7YioC0C96yZfnS46Emb0XznV8LFfoTN6Hof+uG2lgGCVIDP4UToYNd7qu111FhBg==
X-Received: by 2002:a05:6830:2901:b0:72a:ec6:7fc1 with SMTP id 46e09a7af769-73afc6507b1mr8500368a34.14.1751312469502;
        Mon, 30 Jun 2025 12:41:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afaff249bsm1798804a34.6.2025.06.30.12.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:41:08 -0700 (PDT)
Date: Mon, 30 Jun 2025 22:41:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gu Bowen <gubowen5@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
Message-ID: <0bf20f7e-117c-4495-9805-baade7f466ba@suswa.mountain>
References: <20250630133934.766646-1-gubowen5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630133934.766646-1-gubowen5@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_124110_591614_8076DBD7 
X-CRM114-Status: GOOD (  10.60  )
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

On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
> To reintroduce the sm2 algorithm, the patch set did the following:
>  - Reintroduce the mpi library based on libgcrypt.
>  - Reintroduce ec implementation to MPI library.
>  - Rework sm2 algorithm.
>  - Support verification of X.509 certificates.

Remind me, why did we remove these?

regards,
dan carpenter


