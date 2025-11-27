Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E4DCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 15:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6siSnDiVGTZsS7iG2F0xSpzoZMH3VN+sYpf9IBWS2/I=; b=rAse74iVhlFFtxnJTJsW0QMWAU
	kRZLE1YibvPmMrImMOvGk8h8YZKluDy49hTkYvDHXIckjs/HD0aasSo543YsEW9yaW9vcF4SdZ4S/
	E9HcSB93fimJtVL5eZ4+27AzwhljZeTbQrRu66E4uRYDzJu/rbHBR1MJ9lC6fA4+3MrHnFrEaoYZd
	RGsr5aAtERrmpZJzFUIM7budAWob41aTGGR6CXZ71/TvzDrv3+bbfK18i4ALWZ/NtuK4KmmnqrJNp
	JNWZw7XhoG97hwLr+9teZ4sNtj/ahA4VOyZ58M1i2it7iEPeIlXBmDmyOjc2H1gEWTbwtPY/C3KVn
	t5VuYl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOe2i-0000000Gqtv-0XiT;
	Thu, 27 Nov 2025 15:36:24 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOe2f-0000000GqtQ-1YAW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 15:36:22 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-343d73d08faso522911a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 07:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764257780; x=1764862580; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6siSnDiVGTZsS7iG2F0xSpzoZMH3VN+sYpf9IBWS2/I=;
        b=jEZpjV/kPCWY3bIeXOq09n+ksHZCQqV+57ruSqEMsy9m31KsO5sA49k+JP9rnHfp3O
         Fgq7nCPmruKgXhEESCrcqJ48/HIgDEF5SBf4n34ut0TGzP1rZlxFE2w7ajVk+SpAG/pj
         ujMyT0yFTy1MTT9zjnomWuo3cnON4zl234Ldj0WlwDL2zkzAnQLPqmqasmgg/Zx+p4GA
         CyyQj9NE42GJjrA8v9bTEk3cRglxodTCMx9+D9RRE9wuJKRw5GKd00ki04Z5bx1A3z2e
         quv39LIfjSJOeCxasumVu5VZ5riuo2wxFrUKOl+eqDJkwIRdP/0qApVrDOX24A+ulwVu
         2piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764257780; x=1764862580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6siSnDiVGTZsS7iG2F0xSpzoZMH3VN+sYpf9IBWS2/I=;
        b=dqcGQiuCHd2IXselLKcdO3cZPwDKFy6OWVgOSFfx/AMBC6cu0Z2yf/JVlGUCgpgbJD
         lbYw1/AsNoxGJrP9wjVwLUm24wa049wXR3wtD8hkQGgHhQzYSG1YUEBB7sNI70OLQCjf
         GLcI6AYnv54o+m+DYvqG/qMLJttE8GleSa6vDf/rewj+u5YEgGMeObY+0VpgPuXri+fY
         3hAIWlMCUD5x/xlTZwo+TU5hpXbnBoGMzO0d3tsPwdfiBIB5et3VC5kjoHWKjt5UIygN
         PHx5t1o5eMS7UIGCDsDoxXMkCNCEGIkzUO7o5xfJ4HyRoUv+f7vDBDtF1VtkvKZMJeys
         A8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLk6542lP/7eq0V0wTxz8+um/j26Sgd5nZxILHwj9lXiZN80EPHn8VtXDkirMvmZJiffqQe8Hk3lCPo+U5XLTo@lists.infradead.org
X-Gm-Message-State: AOJu0YzGcyzPMLQC1oy5H2nJLlCj6cHZy6CE6k0S/mudSiHilha/SGDJ
	3mCaQlNodw0+MVs9FFco4eqkDxr6uotZhvIcsTpm2fVY7q7885hhqU0Zwb6axGhABIghyyMAqu3
	Tr0Pbvn4=
X-Gm-Gg: ASbGncuGpQVlx6NpkbzJ01y303+bYo6Op2AqleQki+DBZXDYav+sLPXZfw+BXpfHIL9
	9UglTho6czkENt4yjK+P5VByUtRElq5ohNide+Zm/wONifa0J1PSaU3Z/yuJhzfr5GEp6pOrfLU
	pacuWsUr+ilkUO25sCG4fdxyIfXDL8tbuQL/ll+BzFto6tqIHrtaUMxStsV2BDU5SKwzq6wZPrz
	5RGEiIgcapM3JndkokjN5kt879UcRP4JqNrZOkb+2KsxmXxM0iguUekVSwteh1RkC/YSA8ne9od
	pZKd4QEnCuFR5a0+J53JXobM9k60gKNFT1SOldv1X0AfoJ+ZJl+EptEWXsFiNNL0LiZB664KQKX
	ozxLHw391XvkYuJ5cAVVyJoog3znhLkoL7kr1zYJFUNfOabNiaLj7wImGDGW1RyMP2DGLe/q0Sv
	k8Pj/ceOY9/URE5g==
X-Google-Smtp-Source: AGHT+IFazut7ZcKlnL0DT/Iw4tQemIOZ/nMnozSi86+NKtlcAazOOXJ8k38JC8Q24R2278AB7f5H0Q==
X-Received: by 2002:a17:90b:38ca:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-347331be358mr22188175a91.5.1764257780482;
        Thu, 27 Nov 2025 07:36:20 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9ef4:efaa:23ae:f181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475e87fc99sm5019619a91.0.2025.11.27.07.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 07:36:19 -0800 (PST)
Date: Thu, 27 Nov 2025 08:36:17 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: st: Fix indexing of memory-regions
Message-ID: <aShv8UtdOKcN0Pof@p14s>
References: <20251126-st-remoteproc-double-index-v1-1-3b0a8b21ac18@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-st-remoteproc-double-index-v1-1-3b0a8b21ac18@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_073621_436203_213DDF08 
X-CRM114-Status: GOOD (  19.63  )
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

On Wed, Nov 26, 2025 at 12:17:59PM -0600, Bjorn Andersson wrote:
> The recent transition to use of_reserved_mem_region_to_resource()
> changes the while loop to a for loop, but the increment of the "index"
> variable was left behind at the end of the loop, as highlighted by the
> following error/warning:
> 
>   error: variable 'index' is incremented both in the loop header and in the loop body [-Werror,-Wfor-loop-analysis]
> 
> Drop the extra increment to avoid skipping over every other
> memory-region in the loop.
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/remoteproc/st_remoteproc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index 747bbe7f6f7c6be160f4f6a0202eb8df20dc5bc9..a07edf7217d21a3f08d26592e8a14814608507f8 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -155,7 +155,6 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  			return -ENOMEM;
>  
>  		rproc_add_carveout(rproc, mem);
> -		index++;

Really good - applied.

Thanks,
Mathieu

>  	}
>  
>  	return rproc_elf_load_rsc_table(rproc, fw);
> 
> ---
> base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
> change-id: 20251126-st-remoteproc-double-index-29a2e40e74bb
> 
> Best regards,
> -- 
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 

