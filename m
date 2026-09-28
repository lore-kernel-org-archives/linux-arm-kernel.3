Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF5CC9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqZIT4CuwAtsItk7lmKS5Bq3DdAgNyIdg2q2F0jacX0=; b=EVORoFirjR6+r8DiiplqX9A1Pz
	jq3zu/2xQjznYdXYb9R9d4yWcI/4169Dc+MCxqUUWzIql+VUaIdKkM1kaEOTjhjHudE1wXBOokyCI
	u3kY2dyqb6qoBlEBKgorSKEEdfN5Fws4sQhZcvKFl55gxuz25dLy+lpitLa3Ck5/+OQuAPs6LOmU8
	q4ZiT0EyTQn9P8gWPFzLWEHx6YvUAHSnC1OIvy6stmsOImDm25lTzCz6M5C1XyAPY9xTMdYr4mJWM
	yFIUCnlQjdOkz3Y1qwLAOrBgkstbzBxNQKRAy0sESRgggjglGp+JWMeq9+Caf4rc//B2CiIp9JfnF
	Dytp1Xyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9ce-00000000TJa-1Xti;
	Mon, 28 Sep 2026 11:34:16 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9cb-00000000TIW-1nzQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 11:34:14 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so67575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 04:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790595251; x=1791200051; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bqZIT4CuwAtsItk7lmKS5Bq3DdAgNyIdg2q2F0jacX0=;
        b=LwBKkr/GmMAOBqrpEQxg9GHMIBSwR7kOHZC+2h6GYHcucopJdbfaxf5ajaq3ywppc/
         2On6B2BlCyAVbD6dQ+mbs7wDYxL3QSDwMxn62DFTpPmvRaBJzzl83catpkaeBMiIJJ2N
         pyHD8qJp1l289nYqIeeE8pIdefsYbrJmQJzDA3iAnNKXztAOUJLq1cMsdxhuEP/1WTeh
         Ku9B1OtdQ5NmoIcOqtxo8ILF+nyL8mnbXS2ZT8tfo5ShGGp/D1RUjAYR3zEk7aBHNrux
         bL6lon3x/j8H8u+XSaB8VdBTSTfdyoru3KEHpccrFdzmRtCi0xkvvGH+BsAAKtLrONEA
         Tqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595251; x=1791200051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqZIT4CuwAtsItk7lmKS5Bq3DdAgNyIdg2q2F0jacX0=;
        b=uwwQDbbRCgxstvEYeevotioOIVQvM29PJqKgGSKweYiUVc2zOOVauV1RGFbBxkmIZq
         j9817Rk6D/1I2ndGM6wnhp4qVVySGo9IrSEGf/BWUgabiFuN+TqWnsIxt5EuTcOAW+WX
         fCCVChMqgYrI8QPtGRvpQqXRYj7hQyrRFUV+jTr/cEWnWbCn7CVnSd3GAynpJcmR9gw9
         LVlTlrQHh0ulKLDIc9IY9F7BIud2cLdCIgYuSX0EahhOvHYDOw8f80FaIs5cpLHklw0h
         Fi47yQFEGuEvnomg/m9THrH78+KphcJ0xNYPPsOXupzhe/ZNTodQWQJM+/KfRZCMpQy3
         5sQg==
X-Forwarded-Encrypted: i=1; AKwUvBxSCq79X4+XczNu57qn2RMTqKye1LHrTabLLsrUFaNT4vZVtu6iTGt7ER07Hewo4dW/Ppm0Y9WmBgY4V8c2kVPi@lists.infradead.org
X-Gm-Message-State: AFq9FYIBZiff3OQz/+yppyxbJ9LDsldfxFM7pBces+b+/5mJGZhB2EY+
	qEcj80m+vKjQ2Px/T5lZ9paQiHIPUDe1Lk7t72JGFukffxUTp5JdxUow117dFssGEA==
X-Gm-Gg: AYBFou1AT02kdz0G0UnzzMNGAJZ6uVSOweNKulzCpA4ySZDFhp5UA143Fcr88sqFh+4
	0I85bOVx4Krhnlb7/WDCCGIup56G1xxKKPdKhe58hjP+9X4ajFXXPlhjenKDAI7nqTJG0L9hBq1
	HRm8yKRGBfv4GIFmWygltI+NSGNIZoetQ+lqUyUn2xEj+2MBlv6JYCkSFEStasqSL192KbeSCJX
	oh6k9ysPH594m+ZkVSXLiMjzpV5YteuXZdgW0oRGPZdycWxURQMES+G4/aNv7nZv4tmB/pf5jny
	Y2IszpYq4ZJwQsEJ4QuHmbEpUHPnfNmOA7+lkJcBQboENvF7q5d4Y1mta/5NzjdUMfDyy0bPKa7
	hXjIlvsu8rUMN6WuA859IwWa7jbGk3g2y4mb3Pp1YO9D/RnsnYWyWTc8Lammnh2sF9DgJMegSWv
	j4sMbPOT2/LJURSvFT9PUHq51BBpek82sv/ukWEck3BYZqXt5Fc6k0C39tqkbLu2ikVQDCgHJIY
	EkxckSUZQ3nq+ddMTl+Hf9zDMzKvTpP16ox
X-Received: by 2002:a17:902:d54f:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2dfa615a5b9mr4545925ad.2.1790595250807;
        Mon, 28 Sep 2026 04:34:10 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f111csm26688235a91.2.2026.09.28.04.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:34:10 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:34:01 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/9] iommu/arm-smmu-v3: Pass the parameters for the
 invalidation in a struct
Message-ID: <arpQqQXkdkNRBn-l@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <2-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_043413_502334_3407FC91 
X-CRM114-Status: GOOD (  10.86  )
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

On Mon, Sep 21, 2026 at 08:55:10PM -0300, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@ziepe.ca>
> 
> These parameters go to a lot of different functions and the next patches
> will add more. Put them into a struct to keep things tidy.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

