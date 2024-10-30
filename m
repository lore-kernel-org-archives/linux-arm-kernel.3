Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDEFD5CC90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5zeClzjkLB2fwj5NuKVJcICjOwHMYB7WeUASTb/YtI=; b=coJnFWxQHFjm/hmtl0S49S8/DL
	vqNaQQ5BkQD5n/tJWGrr9NOJ4MIR6yEpP0OCsrY+YAiLkFdfNXXoo8IzG7N9egSZD0QWeBskDJAKW
	i/PNpwTEBGC4eAfqhVkci7Bkvwu1EXA/atUUZbVWi4VlzMp7KDp0VJzZSjUZYazaWB5fLe8mRs1tB
	xtQhB9fNqkuTPceTLIXICzoTp9tAUk38obCIUaemJiVhmaJT9ya+VYQrbuaNASUnEYK6gam+G5msd
	CLYccqvQqMc6ZcKtg0yq8yuDkrG7slLNtYvzQ1Fek4UcjP5fSeJe2iz2En2INwags3VVRS6RPqzA9
	QzHwwX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66Nm-000000002Hz-10oY;
	Wed, 30 Oct 2024 10:56:58 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t667Q-0000000HaNU-0QmU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:40:05 +0000
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso99526331fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284802; x=1730889602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5zeClzjkLB2fwj5NuKVJcICjOwHMYB7WeUASTb/YtI=;
        b=jqFjAJuMFHYmGtsq+T0zanpGe6B05CzKhA5jeH+3BSUEVRMD7GEv2NEv174xLhasE6
         YY67Vm2hAaEp6lphCISXcJqJFBZS1nqZ9RgfcP/apt37ZxrJhXU+wIiV2aNxeG2tP4ml
         D8aWXiQmZXChmvKvjAPHLbZBln92eGHFcW6ow546KsxxaY5EmAqI8vM49LL5cgk11z1+
         CkHSsrOu92yK96CIvgZcolgGqtKC4I9kW/QMpYPQOnGlXUye1rxajNOUEgTlcAEo1JUT
         z5/pdJQPnxotIVi4MvI/We0cjrlE+qvrMICBh2M5S+MLPWjrd0PdW2FXTkFRFPer+p6P
         yfVw==
X-Forwarded-Encrypted: i=1; AJvYcCU4KcMWi3LDMgYyITxQfM9y+Rj8SxAupunzHMgMCaDFKZAQbu11/HtQcccky5AIy49A8ibu6V4iDePWpwYABIUj@lists.infradead.org
X-Gm-Message-State: AOJu0YyR+9W+gNNopkh0ux879qJwgOzXREBmXSoRZJlmucJ6/fd97maL
	IQV5xohEJvj4hwfCswWchtblTbBYEn6LTURt9+NSO+WtnUs8Du2z
X-Google-Smtp-Source: AGHT+IF1BeMOioe7t/P4H3j1JzkGprhgTWXKnwqJJVpJqtv4+UpyysQM6plM71Gz04mozafT9jF6YA==
X-Received: by 2002:a05:651c:211c:b0:2fb:63b5:c0bc with SMTP id 38308e7fff4ca-2fcbdf60dfdmr108666691fa.3.1730284801674;
        Wed, 30 Oct 2024 03:40:01 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-115.fbsv.net. [2a03:2880:30ff:73::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a0887besm558559566b.207.2024.10.30.03.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 03:40:01 -0700 (PDT)
Date: Wed, 30 Oct 2024 03:39:58 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Radu Bulie <radu-andrei.bulie@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 1/3] soc: fsl_qbman: use be16_to_cpu() in
 qm_sg_entry_get_off()
Message-ID: <20241030-enigmatic-mayfly-of-triumph-d571bb@leitao>
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
 <20241029164317.50182-2-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029164317.50182-2-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_034004_166899_8680CD78 
X-CRM114-Status: GOOD (  16.92  )
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

On Tue, Oct 29, 2024 at 06:43:15PM +0200, Vladimir Oltean wrote:
> struct qm_sg_entry :: offset is a 13-bit field, declared as __be16.
> 
> When using be32_to_cpu(), a wrong value will be calculated on little
> endian systems (Arm), because type promotion from 16-bit to 32-bit,
> which is done before the byte swap and always in the CPU native
> endianness, changes the value of the scatter/gather list entry offset in
> big-endian interpretation (adds two zero bytes in the LSB interpretation).
> The result of the byte swap is ANDed with GENMASK(12, 0), so the result
> is always zero, because only those bytes added by type promotion remain
> after the application of the bit mask.
> 
> The impact of the bug is that scatter/gather frames with a non-zero
> offset into the buffer are treated by the driver as if they had a zero
> offset. This is all in theory, because in practice, qm_sg_entry_get_off()
> has a single caller, where the bug is inconsequential, because at that
> call site the buffer offset will always be zero, as will be explained in
> the subsequent change.
> 
> Flagged by sparse:
> 
> warning: cast to restricted __be32
> warning: cast from restricted __be16
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Breno Leitao <leitao@debian.org>

