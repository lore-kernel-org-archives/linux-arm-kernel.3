Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066EFCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 22:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnKR4/jVCPRHXvU9flP+lAeiZ2nPUtm5A71+jIeJCOc=; b=jYm/oPOk99KeBBybVaTnu3wsQ6
	+7MDZ6T17rFypIKznGF0bG7tU42MTen2XCEg1Qcjkwx+gFels59Uyop72N6g1jprx09EREDIKD32U
	mdgQzdBx6tR09rVgOVx9/z6ksiFTVMoVR2/gIKK+Vl2bjosyafpeZyKNXVAcp+LqKXWmzzSYjrFba
	b6PA0Iuatuvv+DFHMe6zAlXL1lO0yqrnJmwr/Ew6TdV3+9rnJVnE0iXYUj5Xr4QLHCTsJ15N6Y8es
	OFQjd+c95R9re/Wx1aNA22qk6yjqTM/Lty1ctgoafDuVrHk/ShvViq3Hr3/8fAlk6eRHVn73vgzmm
	RcCEdlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPpPu-00000005yqv-0SW7;
	Wed, 20 May 2026 22:29:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPpPq-00000005yq5-0bWC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 22:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779316165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hnKR4/jVCPRHXvU9flP+lAeiZ2nPUtm5A71+jIeJCOc=;
	b=icoIbltzAYYM1KkwEPOoSdc4oTcD8qfd2eOz81h4qtWBI+5naB6OrJQVJ5LNtDc6Dlj7dp
	HPC0/sUPWNcQjPPAjSjSqxctmymAJH+7+92P9Kj2AKRtRMyFJZyIIc9oSUIg/4JA/UDAjJ
	o+wSWbaQif0yMkHWVShfxbx9PuDl1Gs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-zqK0vGbZNqext_MAyp1f8A-1; Wed, 20 May 2026 18:29:23 -0400
X-MC-Unique: zqK0vGbZNqext_MAyp1f8A-1
X-Mimecast-MFC-AGG-ID: zqK0vGbZNqext_MAyp1f8A_1779316163
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5162ee45a77so142291741cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 15:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779316163; x=1779920963;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hnKR4/jVCPRHXvU9flP+lAeiZ2nPUtm5A71+jIeJCOc=;
        b=FTbMcwB1ryvPu0vDy7pgmfTRNDnzp2SvdjvihJoEExFJV3PWC+2Eal0ixs677TOKOq
         xm3vqPKbFsrcayyKgKiLSq6PRsokRXRh9RKi2SshyGhwtMzxhPFUS/ijol6PD79GKrLS
         /OhNIq2pCbC4gMTjvwhe0ua1UAOuQCcCZ0G3MnMmW6c150jPztp5nXwq2PTM5zsE76tW
         a9jWn87l5f2ahEIBCIYxSyRYsm25pw4fL43jzacWdQsuB1L0LM/jB+RJMmqL96Xrut/6
         Hg5MN5pbDWI6I2ifrv3ifDWzuc02uhWU0dkcQFWr12kIMXhf7E6oyJAKXqPSwSLiFXEE
         JUnA==
X-Forwarded-Encrypted: i=1; AFNElJ9EFoTeqq7YIzrcwDFHCb7SPpoGsYXda7ohS4gJfUXbwj3qfXn0fV2Fm+xBKeIm9FURJnf9kBX9wt/6xebEr2IF@lists.infradead.org
X-Gm-Message-State: AOJu0YzJkAZ3nDa9vz782T/F2ZUwgc8jxxileX+ZfOABr/acMP4s21W9
	MnkJhyTWVbb8QfE8TVmz1OkiEasHpHD6QObUmdRBVgbGJBqZnjXlpGN3dinJivXMztPtAYJUIqF
	Lz454c0EOLjsxjfDW5+fPU/2wonveChs6ww7LsWzxt9k2acQ5apAOpnhhsYTpdpd8qXiUnuG2s5
	ns
X-Gm-Gg: Acq92OHJXDzEMTASjI/sc1mtTPKrWcsnRQAGhpkUkZTEDWj3mRfLSkf+dFN/f2ce7fG
	Nu/NqWAiR/zbiZUntsuRcySUenxRtfm6xsaRM1DbjLHv+fjyRnrdBXm81M5Z1KdIpQOkkC7UCml
	aH4yARb9Gww77STtloJOLr3ilvpKWo0vpFxnKgZDakECyJhYsM0pYyEGOSeoeRK0Cs4dwAgrRJD
	BYGv+GJOCgKcfJmEXimh1B4dG2tNdPqvpHRz7Q41WkTH3ZExWFMlNEoYVxDu8dHf+RFHlxTcyqD
	OwArFadSLUpBOY7ZeqNNcS7FTLXVKfE90/w+ZDPF3eggGNSvEEJihKFmpQoB4iPLkElumdz55sG
	9UuCSlFTDQZjXg+C9
X-Received: by 2002:a05:622a:244c:b0:50f:ca25:fb45 with SMTP id d75a77b69052e-516c53e81b2mr6357061cf.8.1779316162814;
        Wed, 20 May 2026 15:29:22 -0700 (PDT)
X-Received: by 2002:a05:622a:244c:b0:50f:ca25:fb45 with SMTP id d75a77b69052e-516c53e81b2mr6356821cf.8.1779316162374;
        Wed, 20 May 2026 15:29:22 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456b6cf7sm204755301cf.8.2026.05.20.15.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 15:29:21 -0700 (PDT)
Date: Wed, 20 May 2026 18:29:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	"moderated list:ARM/MOXA ART SOC" <linux-arm-kernel@lists.infradead.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: moxart: fix refcount leak
Message-ID: <ag41wJBhdK7-Zynb@redhat.com>
References: <20260520175552.537603-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
In-Reply-To: <20260520175552.537603-1-grandmaster@al2klimov.de>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6_qy_wIAUTi0OoXz51a4GUA0f0_87-nALDDNAyCEZmk_1779316163
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_152927_247598_E2312DFA 
X-CRM114-Status: GOOD (  19.91  )
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

Hi Alexander,

On Wed, May 20, 2026 at 07:55:50PM +0200, Alexander A. Klimov wrote:
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.
> The values here are used only for error checking,
> but weren't cleaned up until now.
> 
> Fixes: c7bb4fc16ead ("clk: add MOXA ART SoCs clock driver")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  drivers/clk/clk-moxart.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
> index 3786a0153ad1..7e191b1481bb 100644
> --- a/drivers/clk/clk-moxart.c
> +++ b/drivers/clk/clk-moxart.c
> @@ -39,6 +39,7 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
>  		pr_err("%pOF: of_clk_get failed\n", node);
>  		return;
>  	}
> +	clk_put(ref_clk);
>  
>  	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mul, 1);
>  	if (IS_ERR(hw)) {
> @@ -83,6 +84,7 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
>  		pr_err("%pOF: of_clk_get failed\n", node);
>  		return;
>  	}
> +	clk_put(pll_clk);

So this immediately drops the reference to the clk after of_clk_get() is
called. Can we just remove these two of_clk_get() calls since they don't
appear to be used?

Brian


